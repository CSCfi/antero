USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_yhdistelma]    Script Date: 26.2.2025 10.55.53 ******/
DROP PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_yhdistelma]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_yhdistelma]    Script Date: 26.2.2025 10.55.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_yhdistelma] AS

/*
Tämä proseduuri lataa faktataulun f_amos_kustannuskysely_yhdistelma kuutiota "Amos kustannuskysely yhdistelmä" ja raporttia "Ammatillisen koulutuksen kustannuskysely - kustannukset ja rahoitus" varten.
Tässä proseduurissa hyödynnetään dynaamista sql kyselyä, koska kustannuskysely lomakkeille saattaa tulla muutoksia, jotka vaikuttavat kustannuskysely taulujen sarakkeisiin. 
Tietoja haetaan kolmesta taulusta:
 -  Lukumäärä tieto haetaan jokaisesta taulusta sarakkeeseen [maara_euroa] siten, että unpivotin avulla käännetään jokaisesta taulusta haluttujen sarakkeiden (@cols#) arvot riveille. 
	Sarakkeiden nimet tallennetaan riveille sarakkeeseen [tilitunnus] ja vastaavat dimension d_amos_kustannuskysely_yhdistelma koodeja.
 -  Tauluista haettavat lomakkeiden tiedot eli sarakkeiden nimet @cols# muuttujiin haetaan dimensiosta d_amos_kustannuskysely_yhdistelma lomakkeen nimen avulla.
 -  Järjestäjäkohtaiseen lomakkeeseen liittyvät tiedot saadaan taulusta [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] kahdella eri tavalla toinen suoraan ja toinen aputaulun kautta. 
	Lomakkeen K92 koodeille E7%, jotka liittyvät Muuhun julkisrahoitteiseen toimintaan ja ely-keskusten hankkimaan työvoimakoulutukseen, on laskettava erotus yhteissummasta ja ely-keskusten osuudesta,
	koska tietoa ei tule suoraan lomakkeelta. Tähän tehdään väliaikainen taulu sa.temp_amos_kustannusk_jarj_e7, johon erotus lasketaan yhteissummien koodeille ja sarakkeisiin. 
 -  Seurantaryhmäkohtaiseen lomakkeeseen liittyvät tiedot saadaan taulusta [sa].[sa_amos_kustannuskysely_seurantaryhmat]
 -  Suoritepäätöslaskennan myönnetyn rahoituksen tiedot saadaan taulusta [sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus]
 -  Painottamattomat opiskelijavuodet tieto on järjestäjäkohtainen ja saadaan [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] taulusta sarakkeesta ovyht ja tallennetaan järjestäjille jokaiselle riville sarakkeeseen ovyth.
*/


EXEC sa.p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet

EXEC dw.p_lataa_d_amos_kustannuskysely_yhdistelma

DECLARE @cols921 AS NVARCHAR(MAX), @cols922 AS NVARCHAR(MAX), @cols12 AS NVARCHAR(MAX), @colsSP AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX), @max_vuosi as int

SET @max_vuosi = (SELECT max(vuosi) FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet])

-- Muuttuja sarakkeiden nimille järkestäjäkohtaiselle lomakkeelle ja muille kuin e7% koodeille
SELECT @cols921 = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_kustannuskysely_yhdistelma
			WHERE summatieto = 0 and koodi != '-1' and lomake='K92' and koodi not like 'e7%'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')

-- Muuttuja sarakkeiden nimille järkestäjäkohtaiselle lomakkeelle ja e7% koodeille 
SELECT @cols922 = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_kustannuskysely_yhdistelma
			WHERE summatieto = 0 and koodi != '-1' and lomake='K92' and koodi like 'e7%'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')

-- Muuttuja sarakkeiden nimille seurantaryhmäkohtaiselle lomakkeelle 
SELECT @cols12 = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_kustannuskysely_yhdistelma
			WHERE summatieto = 0 and koodi != '-1' and lomake='K12'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')

-- Muuttuja sarakkeiden nimille suoritepäätöslaskennasta haettaville tiedoille
SELECT @colsSP = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_kustannuskysely_yhdistelma
			WHERE summatieto = 0 and koodi != '-1' and lomake='SuorP'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')

SET @query = '
	
	DROP TABLE IF EXISTS sa.temp_amos_kustannusk_jarj_e7

	SELECT   
       vuosi
      ,ytunnus
      ,ytunnus_nimi
	  ,omistaja
      ,e70m0-e71m0 as e70m0
      ,e70m1-e71m1 as e70m1
      ,e70m2-e71m2 as e70m2
      ,e70r0-e71r0 as e70r0
      ,e70x2-e71x2 as e70x2
      ,e71m0
      ,e71m1
      ,e71m2
      ,e71r0
      ,e71x2
	  INTO sa.temp_amos_kustannusk_jarj_e7
	  FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet]

	TRUNCATE TABLE dw.f_amos_kustannuskysely_yhdistelma

	INSERT INTO dw.f_amos_kustannuskysely_yhdistelma

	SELECT DISTINCT
		 Q.vuosi
		,d_organisaatioluokitus_id = coalesce(d2.id,-1)
		,d_amos_tili_id = coalesce(d1.id,-1)
		,omistajatyyppi_nimi
		,maara_euroa = d1.kerroin * Q.maara_euroa
		,s1.ovyht 


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
			IN (' + @cols921 + ')
		) tp1

		WHERE maara_euroa != 0

       UNION
		SELECT
	
			 [vuosi]
			,[ytunnus]
			,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
			,[tilitunnus]
			,[maara_euroa]
   
		FROM sa.temp_amos_kustannusk_jarj_e7 sa12
		UNPIVOT (
			[maara_euroa] FOR [tilitunnus]
			IN (' + @cols922 + ')
		) tp12

		WHERE maara_euroa != 0

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
		HAVING SUM([summattava_euroa]) != 0

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
		HAVING SUM([summattava_euroa]) != 0 and vuosi < = ' +cast( @max_vuosi as varchar(10)) + '

	) Q

	LEFT JOIN dw.d_amos_kustannuskysely_yhdistelma d1 ON d1.koodi = Q.tilitunnus
	LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_koodi = Q.ytunnus
	LEFT JOIN sa.sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet s1 on s1.ytunnus=Q.ytunnus and s1.vuosi=Q.vuosi

'

EXEC (@query)