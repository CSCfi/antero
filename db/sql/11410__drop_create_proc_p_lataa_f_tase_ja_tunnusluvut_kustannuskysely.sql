USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kustannuskysely]    Script Date: 29.10.2025 15.10.08 ******/
DROP PROCEDURE [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kustannuskysely]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kustannuskysely]    Script Date: 29.10.2025 15.10.08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
























CREATE PROCEDURE [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kustannuskysely] AS

/*
*/

EXEC sa.p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet

EXEC dw.p_lataa_d_amos_tase_ja_tunnusluvut

DECLARE @cols92 AS NVARCHAR(MAX),  @cols12 AS NVARCHAR(MAX), @colsSP AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX), @max_vuosi as int

SET @max_vuosi = (SELECT max(vuosi) FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet])

-- Muuttuja sarakkeiden nimille järkestäjäkohtaiselle lomakkeelle
SELECT @cols92 = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_tase_ja_tunnusluvut
			WHERE lomake='K92'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')


-- Muuttuja sarakkeiden nimille seurantaryhmäkohtaiselle lomakkeelle 
SELECT @cols12 = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_tase_ja_tunnusluvut
			WHERE lomake='K12'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')

-- Muuttuja sarakkeiden nimille suoritepäätöslaskennasta haettaville tiedoille
SELECT @colsSP = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_tase_ja_tunnusluvut
			WHERE lomake='SuorP'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')

SET @query = '
	

	TRUNCATE TABLE dw.f_amos_tase_ja_tunnusluvut_kustannuskysely

	INSERT INTO dw.f_amos_tase_ja_tunnusluvut_kustannuskysely

	SELECT DISTINCT
		 Q.vuosi
		,Q.ytunnus 
		,tili = tilitunnus
		,sarake = d1.sarake
		,omistajatyyppi_nimi
		,maara_euroa = Q.maara_euroa



	FROM (

		SELECT
	
			 [vuosi]
			,[ytunnus]
			,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
			,[tilitunnus]
			,[maara_euroa]
   
		FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] sa1
		UNPIVOT (
			[maara_euroa] FOR [tilitunnus]
			IN (' + @cols92 + ')
		) tp1

		UNION
		SELECT
			[vuosi]
			,[ytunnus]
			,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
			,[tilitunnus]
			,SUM([summattava_euroa]) maara_euroa
			FROM [ANTERO].[sa].[sa_amos_kustannuskysely_seurantaryhmat] sa2
		UNPIVOT (
			[summattava_euroa] FOR [tilitunnus]
			IN (' + @cols12 + ')
		) tp2

		GROUP BY vuosi, ytunnus, SUBSTRING(omistaja,3,LEN(omistaja)), tilitunnus

		UNION
		SELECT
			[vuosi]
			,[Y-tunnus]
			,[omistajatyyppi] 
			,[tilitunnus]
			,SUM([summattava_euroa]) maara_euroa
		FROM [ANTERO].[sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus] sa3
		UNPIVOT (
			[summattava_euroa] FOR [tilitunnus]
			IN (' + @colsSP + ')
		) tp3

		GROUP BY vuosi, "Y-tunnus", omistajatyyppi, tilitunnus
		HAVING vuosi < = ' +cast( @max_vuosi as varchar(10)) + '

	) Q

	LEFT JOIN dw.d_amos_tase_ja_tunnusluvut d1 ON d1.koodi = Q.tilitunnus
	WHERE Q.vuosi > 2020

'

EXEC (@query)
