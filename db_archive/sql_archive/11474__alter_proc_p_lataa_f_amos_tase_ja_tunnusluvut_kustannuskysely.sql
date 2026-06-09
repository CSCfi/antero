USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kustannuskysely]    Script Date: 22.12.2025 8.15.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO































ALTER PROCEDURE [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kustannuskysely] AS

/*
*/

EXEC sa.p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet

EXEC dw.p_lataa_d_amos_tase_ja_tunnusluvut

DECLARE @cols92_kaikki AS NVARCHAR(MAX), @cols92_eitase AS NVARCHAR(MAX), @cols12 AS NVARCHAR(MAX), @colsSP AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX), @max_vuosi as int

SET @max_vuosi = (SELECT max(vuosi) FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet])


-- Muuttuja sarakkeiden nimille järkestäjäkohtaiselle lomakkeelle
SELECT @cols92_kaikki = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_tase_ja_tunnusluvut
			WHERE lomake='K92'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')

SELECT @cols92_eitase = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_tase_ja_tunnusluvut
			WHERE lomake='K92' and taso0 != 'Tase-erät'
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
		,Q.lomake
		,omistajatyyppi_nimi
		,maara_euroa = Q.maara_euroa



	FROM (

		SELECT
	
			 [vuosi]
			,[ytunnus]
			,[lomake] = ''K92''
			,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
			,[tilitunnus]
			,[maara_euroa]
   
		FROM (
			SELECT * FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] WHERE omistaja != ''4 Kuntayhtymä'') sa1
		UNPIVOT (
			[maara_euroa] FOR [tilitunnus]
			IN (' + @cols92_kaikki + ')
		) tp1
		

		UNION ALL

		SELECT
	
			 [vuosi]
			,[ytunnus]
			,[lomake] = ''K92''
			,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
			,[tilitunnus]
			,[maara_euroa]
   
		FROM (
			SELECT * FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] WHERE omistaja = ''4 Kuntayhtymä'') sa2
		UNPIVOT (
			[maara_euroa] FOR [tilitunnus]
			IN (' + @cols92_eitase + ')
		) tp2
		

		UNION ALL

		SELECT
			[vuosi]
			,[ytunnus]
			,[lomake] = ''K12''
			,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
			,[tilitunnus]
			,SUM([summattava_euroa]) maara_euroa
			FROM [ANTERO].[sa].[sa_amos_kustannuskysely_seurantaryhmat] sa3
		UNPIVOT (
			[summattava_euroa] FOR [tilitunnus]
			IN (' + @cols12 + ')
		) tp3

		GROUP BY vuosi, ytunnus, SUBSTRING(omistaja,3,LEN(omistaja)), tilitunnus

		UNION ALL
		SELECT
			[vuosi]
			,[Y-tunnus]
			,[lomake] = ''SuorP''
			,[omistajatyyppi]
			,[tilitunnus]
			,SUM([summattava_euroa]) maara_euroa
		FROM [ANTERO].[sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus] sa4
		UNPIVOT (
			[summattava_euroa] FOR [tilitunnus]
			IN (' + @colsSP + ')
		) tp4

		GROUP BY vuosi, "Y-tunnus", omistajatyyppi, tilitunnus
		HAVING vuosi < = ' +cast( @max_vuosi as varchar(10)) + '

	) Q

	LEFT JOIN dw.d_amos_tase_ja_tunnusluvut d1 ON d1.koodi = Q.tilitunnus 
	WHERE Q.vuosi > 2020

'

EXEC (@query)