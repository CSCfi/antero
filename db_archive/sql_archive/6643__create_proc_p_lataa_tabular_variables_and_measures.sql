USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_tabular_variables_and_measures]    Script Date: 14.11.2022 16:18:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_tabular_variables_and_measures] AS

DROP TABLE IF EXISTS #temp

SELECT DISTINCT * INTO #temp FROM (
	SELECT 
		CASE
			WHEN perspective like '%sv%' THEN coalesce(concat('Codes ', d.selite_sv), [name])
			WHEN perspective like '%en%' THEN coalesce(concat('Kod ', d.selite_en), [name])
			ELSE coalesce(concat('Koodit ', d.selite_fi), [name])
		END as [name],
		tabular,
		perspective,
		t.tyyppi,
		suojattu
	FROM [ANTERO].[dbo].[tabular_variables_and_measures] t
	LEFT JOIN ANTERO.dbo.translations d on d.koodi = SUBSTRING(t.[name], 8, len(t.[name]))
	WHERE [name] like 'koodit%' and charindex('_',[name]) = 7

	UNION ALL

	SELECT
		CASE
			WHEN perspective like '%sv%' THEN coalesce(d.selite_sv, [name])
			WHEN perspective like '%en%' THEN coalesce(d.selite_en, [name])
			ELSE coalesce(d.selite_fi, [name])
		END as [name],
		[tabular],
		[perspective],
		t.[tyyppi],
		[suojattu]
	FROM [ANTERO].[dbo].[tabular_variables_and_measures] t
	LEFT JOIN ANTERO.dbo.translations d on d.koodi = SUBSTRING(t.[name], 1, len(t.[name])-3)
	WHERE convert(varbinary, lower([name])) = convert(varbinary, [name]) and ([name] not like 'koodit%' and charindex('_',[name]) != 7) and t.tyyppi <> 'Mittari' and ([name] like '%fi' or [name] like '%sv' or [name] like '%en')

	UNION ALL 

	SELECT
		CASE
			WHEN perspective like '%sv%' THEN coalesce(d.selite_sv, [name])
			WHEN perspective like '%en%' THEN coalesce(d.selite_en, [name])
			ELSE coalesce(d.selite_fi, [name])
		END as [name],
		[tabular],
		[perspective],
		t.[tyyppi],
		[suojattu]
	FROM [ANTERO].[dbo].[tabular_variables_and_measures] t
	LEFT JOIN ANTERO.dbo.translations d on d.koodi = t.[name]
	WHERE convert(varbinary, lower([name])) = convert(varbinary, [name]) and ([name] not like 'koodit%' and charindex('_',[name]) != 7) and t.tyyppi = 'Mittari'

	UNION ALL

	SELECT 
		[name]
		  ,[tabular]
		  ,[perspective]
		  ,[tyyppi]
		  ,[suojattu]
	FROM [ANTERO].[dbo].[tabular_variables_and_measures]
	WHERE convert(varbinary, lower([name])) != convert(varbinary, [name]) and ([name] not like 'koodit%' and charindex('_',[name]) != 7)
) f

TRUNCATE TABLE [ANTERO].[dbo].[tabular_variables_and_measures]

INSERT INTO [ANTERO].[dbo].[tabular_variables_and_measures]

SELECT * FROM #temp

DROP TABLE IF EXISTS #temp


GO

USE [ANTERO]