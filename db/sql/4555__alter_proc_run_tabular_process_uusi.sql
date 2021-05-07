USE [ANTERO]
GO
/****** Object:  StoredProcedure [dbo].[run_tabular_process_uusi]    Script Date: 22.4.2021 17:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--THIS IS TEMP, waiting for rights to update agent job owned by another login
--then add dynamic server and tabular names with @env, @tabularName, and update by (to-be) @build_id?

--TODO:
--make Jenkins read alku, loppu, kesto, virhe from db
--add 0&1 partition refresh option
--add single partition refresh option
--add mdx-looping refresh option with parallelism for json tabulars

ALTER PROCEDURE [dbo].[run_tabular_process_uusi]
  @tabularName nvarchar(128) = 'See dbo.tabularprocess for now',
  @env nvarchar(4) = NULL,
  @processType varchar(20) = 'alwaysFull',
  @XMLvsJSON varchar(10) = 'wontMatter'

AS

DECLARE @jobName nvarchar(128) = N'Tabular process_uusi'
DECLARE @commandStr nvarchar(max) = N'
[string]$server = "dwitviputab16"
[string]$sqlserver = "dwitvipusql16"

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.AnalysisServices")
$serverAS = New-Object Microsoft.AnalysisServices.Server
$serverAS.connect($server)

$database = "ANTERO"
$connectionString = "Server=$sqlserver;Database=$database;Integrated Security=True;"
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString
$connection.Open()

$command = $connection.CreateCommand()
$command.CommandText = "SELECT top 1 tabular FROM dbo.tabularprocess WHERE ready = 0 order by loadtime desc"
$reader = $command.ExecuteReader()
while ($reader.Read())
{
   $tabular = $reader.GetValue(0)
}
$reader.Close()

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
			
$writeCommand.commandtext = "UPDATE dbo.tabularprocess SET ready=@ready, Aloitusaika=@alku, Lopetusaika=@loppu, Kesto=@kesto, Virhe=nullif(@virhe,''lackOfImagination'') WHERE tabular=@tabular and ready=0"
$writeCommand.Parameters.Add("@tabular", $tabular)
$writeCommand.Parameters.Add("@ready", $ready)
$writeCommand.Parameters.Add("@alku", $alku)
$writeCommand.Parameters.Add("@loppu", $loppu)
$writeCommand.Parameters.Add("@kesto", $kesto)
$writeCommand.Parameters.Add("@virhe", [string]$virhe)

$writeCommand.executenonquery()   
$connection.Close()

if ($ready -eq -1)
{
	throw
}
'

DECLARE @jobId BINARY(16)
select @jobId=job_id from msdb.dbo.sysjobs_view where name=@jobName

-- only if agent job exists (precaution)
IF @jobId IS NULL 
BEGIN
  RAISERROR (N'Agent ''%s'' missing.', 11, 1, @jobName)
END
ELSE
BEGIN
  BEGIN TRAN
    EXEC msdb.dbo.sp_update_jobstep @job_id=@jobId, @step_id=1, @step_name=@tabularName, @command=@commandStr
  COMMIT
  EXEC msdb.dbo.sp_start_job @job_name=@jobName
END 
 

