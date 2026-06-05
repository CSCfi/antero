USE [Varda_SA]
GO


/****** Object:  StoredProcedure [sa].[p_lataa_sa_varda_tuen_tiedot]    Script Date: 5.6.2026 17.45.11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER    PROCEDURE  [sa].[p_lataa_sa_varda_tuen_tiedot] AS

TRUNCATE TABLE [sa].[sa_varda_tuen_tiedot]

DECLARE @table AS NVARCHAR(max), @query AS nvarchar(max)


DECLARE table_cursor CURSOR FOR
SELECT t.TABLE_NAME 
FROM [INFORMATION_SCHEMA].[TABLES] t
WHERE TABLE_NAME like 'sa_varda_tuen_tiedot_20__'

OPEN table_cursor  
FETCH NEXT FROM table_cursor INTO @table  

WHILE @@FETCH_STATUS = 0  
BEGIN

SET @query='INSERT INTO [sa].[sa_varda_tuen_tiedot]
           ([organisaatio_oid]
           ,[tilastointi_pvm]
           ,[yksityinen_jarjestaja]
           ,[tuentaso_koodi]
           ,[ikaryhma_koodi]
           ,[tukipaatosmaara]
           ,[source]
           ,[loadtime]
           ,[username]) 
		   SELECT [organisaatio_oid]
			,[tilastointi_pvm]
			,[yksityinen_jarjestaja]
			,[tuentaso_koodi]
			,[ikaryhma_koodi]
			,[tukipaatosmaara]
			,[source]
			,[loadtime]
			,[username]
			FROM [sa].' +QUOTENAME(@table)  

EXEC sp_executesql @query

	FETCH NEXT FROM table_cursor INTO @table
END
CLOSE table_cursor
DEALLOCATE table_cursor
