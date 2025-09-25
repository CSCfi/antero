USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_uusi] AS

/*
Latauksessa 
1) monistetaan data rahoituskausittaiseksi laskentaa varten sekä 
2) generoidaan estimaattikausi.
*/

TRUNCATE TABLE [dw].[f_amos_opiskelijavuodet_uusi]

--rahoituskausi, jolloin suorituskausi ensi kertaa mukana
INSERT INTO dw.f_amos_opiskelijavuodet_uusi
SELECT 
	generoitu = 0
	,d.paivays
	,varainhoitovuosi = right(d.rahoituskausi_amm_1, 4) + 1
	,rahoituskausi = d.rahoituskausi_amm_1 
	,f.*
FROM dw.f_amos_opiskelijavuodet f
LEFT JOIN dw.d_kalenteri d on d.id = f.d_kalenteri_id
WHERE d.paivays > '2024-06-30'

--rahoituskausi, jolloin suorituskausi toista kertaa mukana
INSERT INTO dw.f_amos_opiskelijavuodet_uusi
SELECT 
	generoitu = 0
	,d.paivays
	,varainhoitovuosi = right(d.rahoituskausi_amm_2, 4) + 1
	,rahoituskausi = d.rahoituskausi_amm_2 
	,f.*
FROM dw.f_amos_opiskelijavuodet f
LEFT JOIN dw.d_kalenteri d on d.id = f.d_kalenteri_id AND d.vuosi > 2020 --liitoksesta pois muut kuin aikafunktioille kelpaavat
WHERE d.paivays > '2023-06-30' 
AND datefromparts(right(d.rahoituskausi_amm_2, 4), 6, 30) < dateadd(month, 12, getdate()) --uusi kausi näkyviin vasta, kun edellinen päättynyt


--estimaattikauden generointi
DECLARE @maxRahoituskausi varchar(24) = (select max(rahoituskausi) from dw.f_amos_opiskelijavuodet_uusi)
DECLARE @maxRahoituskausiEdellinen varchar(24) = (select max(rahoituskausi) from dw.f_amos_opiskelijavuodet_uusi where rahoituskausi != @maxRahoituskausi)
DECLARE @maxPvm date = datefromparts(right(@maxRahoituskausi, 4), 6, 1)
DECLARE @maxToteumaPvm date = (select max(paivays) from dw.f_amos_opiskelijavuodet_uusi)

--A) luodaan estimaatti tuoreimmalle rahoituskaudelle, jos korkeintaan kevätkausi puuttuu/kesken (tällöin edellistä kautta koskien on kaikki aineistot ja varsinainen suoritepäätös)
IF month(getdate()) between 1 and 7
BEGIN
	
	DROP TABLE IF EXISTS #generoidutKuukaudet
	DROP TABLE IF EXISTS #generoidutUudetKuukaudet

	--toteuma pohjaksi
	SELECT * 
	INTO #generoidutKuukaudet
	FROM dw.f_amos_opiskelijavuodet_uusi
	WHERE rahoituskausi = @maxRahoituskausi

	--luodaan puuttuvat
	SELECT *
	INTO #generoidutUudetKuukaudet
	FROM #generoidutKuukaudet
	WHERE dateadd(year, 1, paivays) between dateadd(month, 1, @maxToteumaPvm) and @maxPvm

	UPDATE t
	SET paivays = dateadd(year, 1, t.paivays)
		,d_kalenteri_id = d.id
		,vuosi = d.vuosi
		,suorituskausi = d.rahoituskausi_amm
	FROM #generoidutUudetKuukaudet t
	LEFT JOIN dw.d_kalenteri d on d.kalenteri_avain = dateadd(year, 1, t.paivays)
	WHERE dateadd(year, 1, t.paivays) between dateadd(month, 1, @maxToteumaPvm) and @maxPvm
	
	INSERT #generoidutKuukaudet
	SELECT *
	FROM #generoidutUudetKuukaudet

	--liputetaan koko kausi generoiduksi ja viedään alkuperäiseen tauluun
	UPDATE #generoidutKuukaudet
	SET generoitu = 1

	INSERT dw.f_amos_opiskelijavuodet_uusi
	SELECT *
	FROM #generoidutKuukaudet

	DROP TABLE #generoidutKuukaudet
	DROP TABLE #generoidutUudetKuukaudet
	
END

--B) luodaan estimaatti edelliselle rahoituskaudelle, jos meneillään olevan syyskausi vielä kesken
IF month(getdate()) between 8 and 12
BEGIN
	
	DROP TABLE IF EXISTS #generoidutKuukaudetB

	--toteuma pohjaksi
	SELECT * 
	INTO #generoidutKuukaudetB
	FROM dw.f_amos_opiskelijavuodet_uusi
	WHERE rahoituskausi = @maxRahoituskausiEdellinen

	--liputetaan koko kausi generoiduksi ja viedään alkuperäiseen tauluun
	UPDATE #generoidutKuukaudetB
	SET generoitu = 1

	INSERT dw.f_amos_opiskelijavuodet_uusi
	SELECT *
	FROM #generoidutKuukaudetB

	DROP TABLE #generoidutKuukaudetB
	
END

GO
