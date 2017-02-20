USE msdb

-- VARIABLES
-- could be parameterized
DECLARE @p_databaseName nvarchar(128) = N'Opintotietopalvelu KV-liikkuvuus'
DECLARE @p_ownerLoginName nvarchar(128) = N't_sql16_etl'
DECLARE @p_server nvarchar(128) = N'dwitviputab16'

-- no need to parameterize since they are resolved from above (and fixed otherwise)
DECLARE @p_jobName nvarchar(128) = N'Tabular process '+@p_databaseName
DECLARE @p_command nvarchar(128) = N'{
  "refresh": {
    "type": "full",
    "objects": [
      {
        "database": "'+@p_databaseName+'"
      }
    ]
  }
}'

IF NOT EXISTS (select * from msdb.dbo.sysjobs_view where name=@p_jobName) BEGIN

BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0

-- NB! Used Category must exist!
DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=@p_jobName,
  @enabled=1,
  @notify_level_eventlog=0,
  @notify_level_email=0,
  @notify_level_netsend=0,
  @notify_level_page=0,
  @delete_level=0,
  @description=N'No description available.',
  @category_name=N'Data Collector',
  @owner_login_name=@p_ownerLoginName,
  @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId,
  @step_name=N'Tab Process', 
  @step_id=1, 
  @cmdexec_success_code=0, 
  @on_success_action=1, 
  @on_success_step_id=0, 
  @on_fail_action=2, 
  @on_fail_step_id=0, 
  @retry_attempts=0, 
  @retry_interval=0, 
  @os_run_priority=0,
  @subsystem=N'ANALYSISCOMMAND', 
  @command=@p_command, 
  @server=@p_server, 
  @database_name=N'master',
  @flags=0,
  @proxy_name=N'ProcessTabularProxy'
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

END --job not exists
