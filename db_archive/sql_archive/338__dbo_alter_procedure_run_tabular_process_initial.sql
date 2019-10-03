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
DECLARE @stepName nvarchar(max) = @tabularName+'; '+@processType

DECLARE @jobId BINARY(16)
select @jobId=job_id from msdb.dbo.sysjobs_view where name=@jobName

-- only if agent job exists (precaution)
IF @jobId IS NOT NULL BEGIN

  EXEC msdb.dbo.sp_update_jobstep @job_id=@jobId, @step_id=1, @command=@commandStr, @step_name=@stepName

  EXEC msdb.dbo.sp_start_job @job_name=@jobName

  -- wait for finish (loop in 5 second intervals; should it vary?)
  DECLARE @sessionID int
  SET @sessionID = (SELECT session_id FROM msdb.dbo.sysjobactivity where job_id=@jobId)
  WHILE 1=1 BEGIN
    IF (SELECT stop_execution_date FROM msdb.dbo.sysjobactivity
        WHERE job_id=@jobId AND session_id=@sessionID) IS NULL
    BEGIN
      WAITFOR DELAY '00:00:05';
      CONTINUE
    END ELSE BEGIN
      BREAK
    END
  END

END ELSE BEGIN
  RAISERROR (N'Agent ''%s'' missing.', 11, 1, @jobName)
END -- agent job exists
