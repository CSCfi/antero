USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_data_model]    Script Date: 28.7.2022 14:58:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE  [dw].[p_lataa_data_model] AS

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

UNION ALL

SELECT DISTINCT
	   v.[database]
      ,v.[schema]
      ,v.[view]
	  ,v.[view_table_database]
	  ,v.[view_table_schema]
	  ,v.[view_table]
	  ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
	  ,loadtime = getdate()
	  ,[source] = 'ETL: p_lataa_data_model'
	  ,username = USER_NAME()
FROM #tempView v
WHERE v.[database] = 'Bibliometriikka' or (v.[view] = 'v_ytl_arvosanat' and v.[schema] = 'dw')

SELECT * INTO #tempTable
FROM (
	SELECT 
	   v.[database]
      ,v.[schema]
      ,v.[view]
	  ,v.[view_table_database]
	  ,v.[view_table_schema]
	  ,v.[view_table]
	FROM #tempView v

	EXCEPT

	SELECT 
	   dm.[database]
      ,dm.[schema]
      ,dm.[view]
	  ,dm.[view_table_database]
	  ,dm.[view_table_schema]
	  ,dm.[view_table]
	FROM ANTERO.dbo.data_model dm
) t

INSERT INTO ANTERO.dbo.data_model
SELECT DISTINCT
	t.[database],
	t.[schema],
	t.[view],
	t.view_table_database,
	t.view_table_schema,
	t.view_table,
	CASE WHEN UPPER(t.view_table_database) = 'VIPUNENTK' and upper(left(t.view_table,1)) = 'D' THEN 'VipunenTK' WHEN  UPPER(t.view_table_database) = 'VIPUNENTK_DW' and upper(left(t.view_table,1)) = 'D' THEN 'VipunenTK_DW' ELSE p.database_proc END as database_proc,
	CASE WHEN UPPER(t.view_table_database) in('VIPUNENTK','VIPUNENTK_DW') and upper(left(t.view_table,1)) = 'D' THEN 'dbo' ELSE p.schema_proc END as schema_proc,
	CASE WHEN UPPER(t.view_table_database) = 'VIPUNENTK' and upper(left(t.view_table,1)) = 'D' THEN 'ETL_tyhjenna_ja_lataa_VipunenTK_dimensiot' WHEN  UPPER(t.view_table_database) = 'VIPUNENTK_DW' and upper(left(t.view_table,1)) = 'D' THEN 'ETL_tyhjenna_ja_lataa_VipunenTK_DW_dimensiot' ELSE p.[procedure] END as [procedure],
	CASE WHEN UPPER(t.view_table_database) in('VIPUNENTK','VIPUNENTK_DW') and upper(left(t.view_table,1)) = 'D' THEN NULL ELSE p2.referenced_database_name END as procedure_table_database,
	CASE WHEN UPPER(t.view_table_database) in('VIPUNENTK','VIPUNENTK_DW') and upper(left(t.view_table,1)) = 'D' THEN NULL ELSE p2.referenced_schema_name END as procedure_table_schema,
	CASE WHEN UPPER(t.view_table_database) in('VIPUNENTK','VIPUNENTK_DW') and upper(left(t.view_table,1)) = 'D' THEN NULL ELSE p2.referenced_entity_name END as procedure_table,
	loadtime = getdate(),
	[source] = 'ETL: p_lataa_data_model',
	username = USER_NAME()
FROM #tempTable t
INNER JOIN #tempProc p on p.referenced_database_name = t.view_table_database and p.schema_proc = t.view_table_schema and p.referenced_entity_name = t.view_table and (upper(left(t.view_table,1)) = 'F' or (upper(left(t.view_table,1)) = 'D' and UPPER(t.view_table_database) in ('VIPUNENTK', 'VIPUNENTK_DW')) )
INNER JOIN #tempProc p2 on p2.[procedure] = p.[procedure] and p2.database_proc = p.database_proc and p2.schema_proc = p.schema_proc and p2.[referenced_entity_name] <> p.[referenced_entity_name] and p2.[referenced_entity_name] <> t.view_table
WHERE (p.[procedure] not like 'ETL%' or p.[procedure] like '%dimensiot') and p.[procedure] <> 'p_lataa_OPE' and (t.view_table <> 'f_haku_ja_valinta_yoarvosanat' or p.[procedure] = 'p_lataa_f_haku_ja_valinta_yo_arvosanat')

DROP TABLE #tempView
DROP TABLE #tempProc
DROP TABLE #tempTable


GO


USE [ANTERO]