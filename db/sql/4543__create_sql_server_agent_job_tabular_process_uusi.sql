USE [msdb]
GO

/****** Object:  Job [Tabular process_uusi]    Script Date: 20.4.2021 20:38:32 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 20.4.2021 20:38:32 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Tabular process_uusi', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'DWI\jsyrjala2', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Do process and write result]    Script Date: 20.4.2021 20:38:32 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Do process and write result', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'PowerShell', 
		@command=N'
$tabular = "Eläkkeelle siirtyneet ja kuolleet"

[string]$server = "dwitviputab16"
[string]$sqlserver = "dwitvipusql16"

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

$writeCommand.commandtext = "UPDATE dbo.tabularprocess SET ready=@ready, Aloitusaika=@alku, Lopetusaika=@loppu, Kesto=@kesto, Virhe=nullif(@virhe,''lackOfImagination'') WHERE tabular=@tabular and ready=0"
$writeCommand.Parameters.Add("@tabular", $tabular)
$writeCommand.Parameters.Add("@ready", $ready)
$writeCommand.Parameters.Add("@alku", $alku)
$writeCommand.Parameters.Add("@loppu", $loppu)
$writeCommand.Parameters.Add("@kesto", $kesto)
$writeCommand.Parameters.Add("@virhe", $virhe)

$connection.Open()
$writeCommand.executenonquery()   
$connection.Close()
', 
		@database_name=N'ANTERO', 
		@flags=0, 
		@proxy_name=N'RunPowerShellProxy'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


