USE msdb

-- DELETE ALL PREVIOUSLY MADE AGENT JOBS. PLANS CHANGE...
EXEC msdb.dbo.sp_delete_job @job_name=N'Tabular process AMK Talous', @delete_unused_schedule=1
EXEC msdb.dbo.sp_delete_job @job_name=N'Tabular process ARVO', @delete_unused_schedule=1
EXEC msdb.dbo.sp_delete_job @job_name=N'Tabular process Opintotietopalvelu KV-liikkuvuus', @delete_unused_schedule=1
