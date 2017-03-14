-- NOTICE THE USE OF msdb DATABASE

DECLARE @p_server nvarchar(128) = N'§sed-me-tabserver§'
DECLARE @p_jobName nvarchar(128) = N'Tabular process'

DECLARE @jobId BINARY(16)
select @jobId=job_id from msdb.dbo.sysjobs_view where name=@p_jobName

IF EXISTS (select * from msdb.dbo.sysjobs_view where name=@p_jobName) BEGIN
EXEC msdb.dbo.sp_delete_jobstep @job_id=@jobId, @step_id=0 --remove all

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'§to-be-set-by-procedure§', 
  @step_id=1,
  @cmdexec_success_code=0,
  @on_success_action=3,
  @on_fail_action=4,
  @on_fail_step_id=3,
  @retry_attempts=0,
  @retry_interval=0,
  @os_run_priority=0,
  @subsystem=N'ANALYSISCOMMAND',
  @command=N'{"refresh": {"type": "full", "objects": [{"database": "§to-be-set-by-procedure§"}]}}',
  @server=@p_server,
  @flags=0,
  @proxy_name=N'ProcessTabularProxy'

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Mark ready', 
  @step_id=2,
  @cmdexec_success_code=0,
  @on_success_action=1,
  @on_fail_action=2,
  @retry_attempts=0,
  @retry_interval=0,
  @os_run_priority=0,
  @subsystem=N'TSQL',
  @command=N'update tabularprocess set ready=1 where tabular=''§to-be-set-by-procedure§''',
  @database_name=N'ANTERO',
  @flags=0

EXEC msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Mark failed', 
  @step_id=3,
  @cmdexec_success_code=0,
  @on_success_action=2,
  @on_fail_action=2,
  @retry_attempts=0,
  @retry_interval=0,
  @os_run_priority=0,
  @subsystem=N'TSQL',
  @command=N'update tabularprocess set ready=-1 where tabular=''§to-be-set-by-procedure§''',
  @database_name=N'ANTERO',
  @flags=0

END
