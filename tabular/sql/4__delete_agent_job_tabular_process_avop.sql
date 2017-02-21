USE msdb

EXEC msdb.dbo.sp_delete_job @job_name=N'Tabular process AVOP', @delete_unused_schedule=1
