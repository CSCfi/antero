-- DO NOTICE WE USE dbo SCHEMA HERE IN PURPOSE BECAUSE THIS
-- PROCEDURE IS NOT DIRECTLY PART OF sa OR dw SCHEMAS
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.run_tabular_process') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dbo.run_tabular_process AS' 
END
