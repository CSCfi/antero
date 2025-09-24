USE [ANTERO]
GO

/****** Object:  StoredProcedure [dbo].[run_tabular_process_uusi]    Script Date: 24.9.2025 10.04.21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[run_tabular_process_uusi]
  @buildID int NULL,
  @tabularName nvarchar(128) = NULL,
  @env nvarchar(4) = NULL,
  @processType varchar(20) = NULL, --deprecated
  @XMLvsJSON varchar(10) = NULL --deprecated
AS

/*
TODO:
- mdx-loop refresh option with maxparallelism option (c.f. dbo.run_tabular_process_partition)
- perhaps separate 0&1 partition refresh option
- single- and multi-partition refresh option for a given subset
*/

DECLARE @sqlServer varchar(50) = @@servername
DECLARE @jobName nvarchar(50) = N'Tabular process_uusi'
DECLARE @commandStr nvarchar(max) = 

N'
Import-Module SqlServer

[string]$server = "' + replace(@sqlServer, 'sql', 'tab') + '"
[string]$sqlserver = "' + @sqlServer + '"
$tabular = ''' + @tabularName + '''
$build = ' + cast(@buildID as nvarchar) + '

$serverAS = New-Object Microsoft.AnalysisServices.Tabular.Server
$serverAS.connect($server)

$database = "ANTERO"
$connectionString = "Server=$sqlserver;Database=$database;Integrated Security=True;"
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString

$alku = Get-Date 
$error.clear()
       
try 
{
	$b = $serverAS.Databases | ? {$_.Name -eq $tabular} | Select CompatibilityLevel

	if ($b.CompatibilityLevel -ge 1200)
	{
		$tables = $serverAS.Databases.GetByName($tabular).Model.Tables
		ForEach ($t in $tables)
		{
			$partitions = $t.Partitions
			ForEach ($p in $partitions) 
			{
				Invoke-ProcessPartition -PartitionName $p.Name -TableName $t.Name -Database $tabular -RefreshType "Full" -Server $serverAS
			}
		}
	}
	else
	{
		$model = $serverAS.Databases.Item($tabular).Cubes[0]
		$mgroups = $model.MeasureGroups
		ForEach ($mg in $mgroups)
		{
			$partitions = $mg.Partitions
			ForEach ($p in $partitions)
			{
				Invoke-ProcessPartition -Name $p -MeasureGroupName $mg -CubeName $model -Database $tabular -ProcessType "ProcessFull" -Server $serverAS
			}
		}
	}
}
catch
{     
	$error[0]
}

$loppu = Get-Date 
$kesto = New-Timespan -Start $alku -End $loppu

if (!$error)
{
	$ready = 1
	$virhe = "lackOfImagination"
}
else
{
	$ready = -1
	$virhe = $error[0]
}
		
$writeCommand = New-Object System.Data.SqlClient.SqlCommand
$writeCommand.Connection = $connection
			
$writeCommand.commandtext = "
	UPDATE dbo.tabularprocess 
	SET ready=@ready, Aloitusaika=@alku, Lopetusaika=@loppu, Kesto=@kesto, Virhe=nullif(@virhe,''lackOfImagination'') 
	WHERE build=@build AND tabular=@tabular AND ready=0 
	;
	UPDATE t 
	SET pending_refresh = case when @virhe =''lackOfImagination'' then 1 else 0 end
		,number_of_consecutive_failures = 0
		,loadtime = getdate()
	FROM dbo.sharepoint_reports_tabular t 
	LEFT JOIN VipunenTK_lisatiedot.dbo.Vipunen_kuutio k ON k.kuutio_avain = t.tabular 
	WHERE coalesce(k.kuutio_nimi,t.tabular)=@tabular and t.refresh = 1
"
$writeCommand.Parameters.Add("@build", $build)
$writeCommand.Parameters.Add("@tabular", $tabular)
$writeCommand.Parameters.Add("@ready", $ready)
$writeCommand.Parameters.Add("@alku", $alku)
$writeCommand.Parameters.Add("@loppu", $loppu)
$writeCommand.Parameters.Add("@kesto", $kesto)
$writeCommand.Parameters.Add("@virhe", [string]$virhe)

$connection.Open()
$writeCommand.executenonquery()   
$connection.Close()

if ($ready -eq -1)
{
	throw
}
'

DECLARE @onSuccessStr nvarchar(max) = N'
IF (1 > (SELECT top 1 ready FROM dbo.tabularprocess WHERE build = ' + cast(@buildID as nvarchar) + ' and tabular = ''' + @tabularName + '''))
BEGIN 
	RAISERROR(''Check error messages.'',11,1);
END
' 

DECLARE @onFailStr nvarchar(max) = N'
UPDATE dbo.tabularprocess set ready = -1 WHERE build = ' + cast(@buildID as nvarchar) + ' and tabular = ''' + @tabularName + '''
'

DECLARE @jobId BINARY(16)
select @jobId=job_id from msdb.dbo.sysjobs_view where name=@jobName

-- only if agent job exists (precaution)
IF @jobId IS NOT NULL 
BEGIN
  BEGIN TRAN
    EXEC msdb.dbo.sp_update_jobstep @job_id=@jobId, @step_id=1, @step_name=@tabularName, @command=@commandStr
  COMMIT
  BEGIN TRAN
    EXEC msdb.dbo.sp_update_jobstep @job_id=@jobId, @step_id=2, @command=@onSuccessStr
  COMMIT
  BEGIN TRAN
    EXEC msdb.dbo.sp_update_jobstep @job_id=@jobId, @step_id=3, @command=@onFailStr
  COMMIT
  
  EXEC msdb.dbo.sp_start_job @job_name=@jobName
END
ELSE
BEGIN
  RAISERROR (N'Agent ''%s'' missing.', 11, 1, @jobName)
END

GO


