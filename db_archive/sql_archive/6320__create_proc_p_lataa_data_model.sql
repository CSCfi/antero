USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_data_model]    Script Date: 27.7.2022 14:40:00 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_data_model]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_data_model]    Script Date: 27.7.2022 14:40:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dw].[p_lataa_data_model] AS

SELECT DISTINCT
	   v.[database]
      ,v.[schema]
      ,v.[view]
	  ,v.referenced_database_name as [view_table_database]
	  ,v.referenced_schema_name as [view_table_schema]
	  ,v.referenced_entity_name as [view_table]
INTO #tempView
FROM [ANTERO].[dbo].[views] v

SELECT DISTINCT
	   p.[database] as database_proc
	  ,p.[schema] as schema_proc
	  ,p.[procedure]
	  ,p.[referenced_database_name]
	  ,p.[referenced_schema_name]
	  ,p.[referenced_entity_name]
INTO #tempProc
FROM [ANTERO].[dbo].[procedures] p

TRUNCATE TABLE ANTERO.dbo.data_model

INSERT INTO ANTERO.dbo.data_model

SELECT DISTINCT
	   v.[database]
      ,v.[schema]
      ,v.[view]
	  ,v.[view_table_database]
	  ,v.[view_table_schema]
	  ,v.[view_table]
	  ,p.database_proc
	  ,p.schema_proc
	  ,p.[procedure]
	  ,p2.referenced_database_name as [procedure_table_database]
	  ,p2.referenced_schema_name as [procedure_table_schema]
	  ,p2.referenced_entity_name as [procedure_table]
	  ,loadtime = getdate()
	  ,[source] = 'ETL: p_lataa_data_model'
	  ,username = USER_NAME()
FROM #tempView v
INNER JOIN #tempProc p on v.view_table_database = p.[referenced_database_name] and v.view_table_schema = p.[referenced_schema_name] and concat('p_lataa_', v.view_table) = p.[procedure]
INNER JOIN #tempProc p2 on p2.[procedure] = p.[procedure] and p2.database_proc = p.database_proc and p2.schema_proc = p.schema_proc and p2.[referenced_entity_name] <> p.[referenced_entity_name] and p2.[referenced_entity_name] <> v.view_table

DROP TABLE #tempView
DROP TABLE #tempProc

GO


USE [ANTERO]