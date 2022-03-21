USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_luo_taulu_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet]    Script Date: 23.3.2021 15:31:20 ******/
DROP PROCEDURE IF EXISTS [sa].[p_luo_taulu_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet]    Script Date: 23.3.2021 15:31:20 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]    Script Date: 23.3.2021 15:31:20 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]    Script Date: 23.3.2021 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen] AS

DECLARE @cols AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX)


EXEC sa.p_luo_taulu_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet
EXEC sa.p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet


TRUNCATE TABLE dw.f_amos_kustannuskysely_jarjestajakohtainen


SELECT @cols = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_kustannuskysely_tili
			WHERE summatieto = 0 and koodi != '-1'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')


SET @query = '
INSERT INTO dw.f_amos_kustannuskysely_jarjestajakohtainen

SELECT
	 vuosi
	,d_organisaatioluokitus_id = coalesce(d2.id,-1)
	,d_amos_tili_id = coalesce(d1.id,-1)
	,omistajatyyppi_nimi
	,maara_euroa


FROM (

	SELECT DISTINCT
	
		 [vuosi]
		,[ytunnus]
		,[omistajatyyppi_koodi] = LEFT(omistaja,1)
		,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
		,[tilitunnus]
		,[maara_euroa]
   
	FROM [ANTERO].[sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] sa
	UNPIVOT (
		[maara_euroa] FOR [tilitunnus]
		IN (' + @cols + ')
	) tilinpaatos

	WHERE maara_euroa != 0

) Q

LEFT JOIN dw.d_amos_kustannuskysely_tili d1 ON d1.koodi = Q.tilitunnus
LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_koodi = Q.ytunnus

WHERE d1.Summatieto = 0
'

EXEC sp_executesql @query
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet]    Script Date: 23.3.2021 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] AS


DECLARE @cols AS nvarchar(max), @table AS nvarchar(max), @query AS nvarchar(max), @year AS char(4)

DECLARE db_cursor CURSOR FOR 
SELECT 
	t.TABLE_NAME
FROM [INFORMATION_SCHEMA].[TABLES] t
WHERE table_name like 'sa_amos_kustannuskysely_jarjestajakohtainen_%' AND table_name like '%_raaka'

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @table  

WHILE @@FETCH_STATUS = 0  
BEGIN

	SELECT @cols = 
		STUFF(
			(
				SELECT distinct
					',' + QUOTENAME(c2.COLUMN_NAME)
				FROM [INFORMATION_SCHEMA].[COLUMNS] c2
				WHERE table_name = @table
				FOR XML PATH(''), TYPE
			).value('.', 'NVARCHAR(MAX)') 
		,1,1,'')

	SET @query = 'SELECT distinct @year=cast(vuosi as int) FROM sa.' + @table

	EXEC sp_executesql @query, N'@year int out', @year out


	SET @query = 
		CONCAT('DELETE FROM sa.sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet WHERE vuosi =', @year) + 
		'
		INSERT INTO sa.sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet(' + @cols + ') 
		SELECT ' + @cols + ' FROM sa.' + @table + '
		'

	EXEC sp_executesql @query

	FETCH NEXT FROM db_cursor INTO @table

END

CLOSE db_cursor  
DEALLOCATE db_cursor 
GO
/****** Object:  StoredProcedure [sa].[p_luo_taulu_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet]    Script Date: 23.3.2021 15:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_luo_taulu_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_luo_taulu_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] AS' 
END
GO

ALTER PROCEDURE [sa].[p_luo_taulu_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] AS 

DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX)

SELECT @cols = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(c.COLUMN_NAME) + QUOTENAME(c.DATA_TYPE) + (CASE c.DATA_TYPE WHEN 'varchar' THEN '(MAX)' ELSE '' END) +  ' NULL'
			FROM [INFORMATION_SCHEMA].[COLUMNS] c
			WHERE table_name like 'sa_amos_kustannuskysely_jarjestajakohtainen_%'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')


SET @query = '
	DROP TABLE IF EXISTS [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet]
	CREATE TABLE [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] ('
	+ @cols +
	')
'

EXEC sp_executesql @query
