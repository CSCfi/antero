USE [ANTERO]
GO

/****** Object:  StoredProcedure [dbo].[run_write_tabular_roles]    Script Date: 15.1.2025 13.15.31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[run_write_tabular_roles] AS

DECLARE @jobName nvarchar(50) = N'write_tabular_roles'

DECLARE @jobId BINARY(16)
select @jobId=job_id from msdb.dbo.sysjobs_view where name=@jobName

IF @jobId IS NOT NULL 
BEGIN
  EXEC msdb.dbo.sp_start_job @job_name=@jobName
END
ELSE
BEGIN
  RAISERROR (N'Agent ''%s'' missing.', 11, 1, @jobName)
END

GO


