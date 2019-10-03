-- DO NOTICE WE USE dbo SCHEMA HERE IN PURPOSE BECAUSE THIS
-- PROCEDURE IS NOT DIRECTLY PART OF sa OR dw SCHEMAS

ALTER PROCEDURE dbo.run_tabular_process
  @tabularName nvarchar(128) = NULL,
  @processType nvarchar(10) = 'calculate'
AS
IF @tabularName IS NULL BEGIN
  print '@tabularName parameter is mandatory. Exiting'
  RETURN
END
-- 
-- constant-like
DECLARE @jobName nvarchar(128) = N'Tabular process'
-- make catenation ready variables for procedure call
DECLARE @commandStr nvarchar(max) = N'{"refresh": {"type": "'+@processType+'", "objects": [{"database": "'+@tabularName+'"}]}}'
DECLARE @updateStr nvarchar(max) = N'update tabularprocess set ready=1 where tabular='''+@tabularName+''' '
DECLARE @stepName nvarchar(max) = @tabularName+'; '+@processType

DECLARE @jobId BINARY(16)
select @jobId=job_id from msdb.dbo.sysjobs_view where name=@jobName

-- only if agent job exists (precaution)
IF @jobId IS NOT NULL BEGIN

  -- update step 1 (tab process)
  BEGIN TRAN
    EXEC msdb.dbo.sp_update_jobstep @job_id=@jobId, @step_id=1, @command=@commandStr, @step_name=@stepName
  COMMIT
  -- update step 2 (mark ready)
  BEGIN TRAN
    EXEC msdb.dbo.sp_update_jobstep @job_id=@jobId, @step_id=2, @command=@updateStr
  COMMIT

  EXEC msdb.dbo.sp_start_job @job_name=@jobName

END ELSE BEGIN
  RAISERROR (N'Agent ''%s'' missing.', 11, 1, @jobName)
END -- agent job exists
