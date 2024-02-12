USE [ANTERO]
GO

/****** Object:  StoredProcedure [dbo].[run_tabular_process_uusi]    Script Date: 12.2.2024 12:19:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--TODO:
-- single- and multi-partition refresh option for a given subset
-- mdx-loop refresh option with maxparallelism option (only for json tabulars, c.f. dbo.run_tabular_process_partition)
-- perhaps separate 0&1 partition refresh option (might still wanna update legends for older years too, so dunno)

ALTER PROCEDURE [dbo].[run_tabular_process_uusi]
  @buildID int NULL,
  @tabularName nvarchar(128) = NULL,
  @env nvarchar(4) = NULL,
  @processType varchar(20) = NULL, --deprecated
  @XMLvsJSON varchar(10) = NULL --deprecated

AS

DECLARE @sqlServer varchar(50) = @@servername
DECLARE @jobName nvarchar(50) = N'Tabular process_uusi'
DECLARE @commandStr nvarchar(max) = 
/*
- sql-yliheiton jälkeen tuotannossa vapautetaan alun import
- tab-yliheiton jälkeen esim. [string]$server = "' + replace(@sqlServer, 'sql', 'tab') + '"
*/
N'' + case when left(@env,1)='t' then 'Import-Module SqlServer' else '' end + '
[string]$server = "dwi' + left(@env,1) + 'viputab16"
[string]$sqlserver = "' + @sqlServer + '"
$tabular = ''' + @tabularName + '''
$build = ' + cast(@buildID as nvarchar) + '

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.AnalysisServices")
$serverAS = New-Object Microsoft.AnalysisServices.Server
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
			
$writeCommand.commandtext = "UPDATE dbo.tabularprocess SET ready=@ready, Aloitusaika=@alku, Lopetusaika=@loppu, Kesto=@kesto, Virhe=nullif(@virhe,''lackOfImagination'') WHERE build=@build and tabular=@tabular and ready=0"
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
