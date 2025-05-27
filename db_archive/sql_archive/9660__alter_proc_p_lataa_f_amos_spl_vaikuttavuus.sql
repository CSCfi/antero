USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_spl_vaikuttavuus]    Script Date: 20.12.2023 11:39:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_spl_vaikuttavuus] AS

/*
Tässä latauksessa hyödynnetään TK:n 1.13-aineistoa sekä maakuntakertoimien latauksessa 4.2-aineistoja. 
Aineisto sisältää tietoja opiskelijoiden asemasta ennen koulutusta ja sen jälkeen. 
Näiden perusteella lasketaan suoritepäätöksen mukaiset pisteet.

0. Vaihe: Ladataan maakuntakertoimet
1. Vaihe: siivotaan aineisto
2. Vaihe: lasketaan järjestäjäkertoimet
3. Vaihe: lasketaan fuusioiden vaikutukset järjestäjäkertoimiin
4. Vaihe: tehdään faktalataus
	- Tässä liitytään maakuntakertoimien tauluun
	- Lisätty liitosehtoon +1, jotta aluekerroin on raportoinnissa käytettävältä tilastovuodelta tutkinnon suoritusvuoden sijaan. JS 21.10.2022

Ladataan kolme väliaikaista taulua 
sa.z_tmp_TK_K1_13_sopv
sa.z_tmp_TK_K1_K13_sopv_jarjkerroin
sa.z_tmp_TK_K1_K13_sopv_jarjkerroin_fuusiot

Faktalatauksessa hyödynnetään vielä maakuntakertoimien taulua
*/


-- MAAKUNTAKERTOIMET
EXEC dw.p_lataa_f_amos_spl_vaikuttavuus_maakunnat


-- VÄLIAIKAINEN TAULU
-- Ladataan TK K1.13 aineisto ja tehdään muutostöitä seuraavaa vaihetta varten

DECLARE @maxVuosi as int = (SELECT max(year(voimaan_alkaen)) FROM sa.sa_amos_siirtotiedosto_okm8)

DROP TABLE IF EXISTS sa.z_tmp_TK_K1_13_sopv

SELECT --distinct poistettu, koska liveraporttien vanhojen vuosien järjestäjätietojen korjaaminen poisti tapauksia. JS 21.12.2022
	[tilv]
	,[ika21]
    ,[aineisto]
    ,[prioriteetti]
    ,[toteuma_tutk]
    ,[tyov]
	,jarj_tutk = --1.13-poimintaa muokattu sopv22, mutta ohjataan myöhempien päättelyiden takia toistaiseksi rahoituksen saaja lähdenäkymässä yhä tähän. JS 21.10.2022
		case 
			when tilv > 2017 then
				COALESCE(
					CASE WHEN jarj_tutk = 'NULL' THEN NULL ELSE jarj_tutk END, -- Aineistossa NULLit ovat stringejä
					CASE WHEN jarj_opisk = 'NULL' THEN NULL ELSE jarj_opisk END
				)
			else CASE WHEN jarj_opisk = '2082223-9' THEN '0872020-5' ELSE nullif(jarj_opisk, 'NULL') END --teakin fuusio
		end
    ,[jarjnimi_opisk] = CASE WHEN jarjnimi_opisk = 'NULL' THEN NULL ELSE jarjnimi_opisk END
    ,[jarj_opisk] = CASE WHEN jarj_opisk = 'NULL' THEN NULL ELSE jarj_opisk END
	,[jarjnimi_tutk] = 
		case 
			when tilv > 2017 then
				COALESCE(
					CASE WHEN jarjnimi_tutk = 'NULL' THEN NULL ELSE jarjnimi_tutk END, 
					CASE WHEN jarjnimi_opisk = 'NULL' THEN NULL ELSE jarjnimi_opisk END
				)
			else nullif(jarjnimi_opisk, 'NULL')
		end
    ,[jarjmaak]
    ,[jarjmaaknimi]
    ,[tutkmaak]
    ,[tutkmaaknimi]
    ,[kaste_t2]
    ,[kaste_t2ni]
    ,[iscfibroad2013]
    ,[kala_t1ni]
    ,[oppis]
    ,[tutklaja]
    ,[alvv]
    ,[allk]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2h]
    ,[kaste_t2_avh]
    ,[kaste_t2ni_avh]
    ,[amash]
    ,[ptoim1r2_tilvseur]
    ,[maassaolo_tilvseur]
    ,[amas_tilvseur]
    ,[kaste_t2_tilvseur]
    ,[kaste_t2ni_tilvseur]
    ,[iscfibroad2013_tilvseur]
    ,[kala_t1ni_tilvseur],
	case when toteuma_tutk='1' then lkm else 0 end as suor_koko_tutk, 
	case when toteuma_tutk='2' then lkm else 0 end  as suor_tutk_osia, 
	tutk_suor_1*lkm as tutk_suor_1, 
	tutk_suor_2*lkm as tutk_suor_2, 
	tutk_suor_3*lkm as tutk_suor_3, 
	tutk_suor_4*lkm as tutk_suor_4, 
	tutk_osia_suor_1*lkm as tutk_osia_suor_1, 
	tutk_osia_suor_2*lkm as tutk_osia_suor_2, 
	tutk_osia_suor_3*lkm as tutk_osia_suor_3, 
	tutk_osia_suor_4*lkm as tutk_osia_suor_4, 
	tutk_suor_5*lkm as tutk_suor_5, 
	tutk_suor_6*lkm as tutk_suor_6, 
	tutk_suor_7*lkm as tutk_suor_7, 
	tutk_suor_8*lkm as tutk_suor_8, 
	tutk_osia_suor_5*lkm as tutk_osia_suor_5, 
	tutk_osia_suor_6*lkm as tutk_osia_suor_6, 
	tutk_osia_suor_7*lkm as tutk_osia_suor_7, 
	tutk_osia_suor_8*lkm as tutk_osia_suor_8,

	--Kertoimet
	-- Karin speksi 2019-04-05
	--Työllistyminen ja jatko-opiskelu raporttimalli 2019 04 05.xlsx
	-- .. välilehti: Painotettujen laskentasäännöt
	--Työlliset ja opiskelijat

	CASE
		WHEN tutk_suor_1=1 THEN lkm
		WHEN tutk_suor_2=1 THEN lkm
		WHEN tutk_osia_suor_1=1 THEN lkm
		WHEN tutk_osia_suor_2=1 THEN lkm
		WHEN tutk_suor_5=1 THEN lkm
		WHEN tutk_suor_6=1 THEN lkm
		WHEN tutk_osia_suor_5=1 THEN lkm
		WHEN tutk_osia_suor_6=1 THEN lkm 
		ELSE 0 
	END
	 as tyolliset_ja_opiskelijat													

	 --Työlliset
	,CASE
		WHEN tutk_suor_1=1 THEN lkm
		WHEN tutk_osia_suor_1=1 THEN lkm
		WHEN tutk_suor_5=1 THEN lkm
		WHEN tutk_osia_suor_5=1 THEN lkm 
		ELSE 0 
	END
	 as tyolliset			
 
	--Opiskelijat
	,CASE
		WHEN tutk_suor_2=1 THEN lkm
		WHEN tutk_osia_suor_2=1 THEN lkm
		WHEN tutk_suor_6=1 THEN lkm
		WHEN tutk_osia_suor_6=1 THEN lkm 
		ELSE 0 
	END
	 as opiskelijat

 
	--Työlliset, opiskelijat ja työttömät
	,CASE
		WHEN tutk_suor_1=1 THEN lkm
		WHEN tutk_suor_2=1 THEN lkm
		WHEN tutk_suor_3=1 THEN lkm
		WHEN tutk_osia_suor_1=1 THEN lkm
		WHEN tutk_osia_suor_2=1 THEN lkm
		WHEN tutk_osia_suor_3=1 THEN lkm
		WHEN tutk_suor_5=1 THEN lkm
		WHEN tutk_suor_6=1 THEN lkm
		WHEN tutk_suor_7=1 THEN lkm
		WHEN tutk_osia_suor_5=1 THEN lkm
		WHEN tutk_osia_suor_6=1 THEN lkm
		WHEN tutk_osia_suor_7=1 THEN lkm 
		ELSE 0 
	END
	 as tyolliset_opiskelijat_ja_tyottomat													

	--Statuskerroin
	-- Tutkinnon osat otetaan huomioon vasta vuodesta 2018 lähtien
	-- Kertoimet peräisin asetuksesta
	,CASE
		WHEN tutk_suor_1=1 THEN 4 
		WHEN tutk_suor_2=1 THEN 4
		WHEN tutk_osia_suor_1=1 AND tilv >= 2018 THEN 2
		WHEN tutk_osia_suor_2=1 AND tilv >= 2018 THEN 2
		WHEN tutk_osia_suor_1=1 THEN 0
		WHEN tutk_osia_suor_2=1 THEN 0
		WHEN tutk_suor_5=1 THEN 2
		WHEN tutk_suor_6=1 THEN 2
		WHEN tutk_osia_suor_5=1 AND tilv >= 2018 THEN 1
		WHEN tutk_osia_suor_6=1 AND tilv >= 2018 THEN 1
		WHEN tutk_osia_suor_5=1 THEN 0
		WHEN tutk_osia_suor_6=1 THEN 0 
		ELSE 0 
	END
	as statuskerroin

	--  Välilehti: Suoriteraportti 2
	-- Työllistyneet, ei työllisenä ennen koulutusta
	,CASE
		WHEN tutk_suor_1=1 THEN lkm
		WHEN tutk_osia_suor_1=1 THEN lkm
		ELSE 0 
	END
	 as tyollistyneet_ei_tyollisena_ennen_koulutusta

	 -- Työllistyneet, työllisenä ennen koulutusta
	,CASE
		WHEN tutk_suor_5=1 THEN lkm
		WHEN tutk_osia_suor_5=1 THEN lkm
		ELSE 0 
	END
	 as tyollistyneet_tyollisena_ennen_koulutusta

	--Jatko-opiskelijat, ei työllisenä ennen koulutusta
	,CASE
		WHEN tutk_suor_2=1 THEN lkm
		WHEN tutk_osia_suor_2=1 THEN lkm
		ELSE 0 
	END
	 as jatko_opiskelijat_ei_tyollisena_ennen_koulutusta

	 --Jatko-opiskelijat, työllisenä ennen koulutusta
	,CASE
		WHEN tutk_suor_6=1 THEN lkm
		WHEN tutk_osia_suor_6=1 THEN lkm
		ELSE 0 
	END
	 as jatko_opiskelijat_tyollisena_ennen_koulutusta


	--Työttömät ja muussa toiminnassa
	-- Karin speksi 2019-07-02, lisatty 2019-08-08 jhe
	-- Työll+jatko-opisk.lisäraportti2

	,CASE 
		WHEN tutk_suor_3 = 1 THEN lkm
		WHEN tutk_osia_suor_3 = 1 THEN lkm
		WHEN tutk_suor_7 = 1 THEN lkm
		WHEN tutk_osia_suor_7 = 1 THEN lkm 
		ELSE 0 
	END 
	 as tyoton

	 --,CASE WHEN ptoim1r2e_kytkin='ptoim_99' THEN lkm ELSE 0 END 
	-- jhe 2.9.2019
	--Kari 13.8.2019: ”Muussa toiminnassa” sisältää kaikki loput tutkinnon suorittaneet, jotka eivät ole työllistyneet tai jatko-opiskelijat sarakkeissa. Ei siis pelkästään 99:t.
	,CASE 
		WHEN tutk_suor_4 = 1 THEN lkm
		WHEN tutk_osia_suor_4 = 1 THEN lkm
		WHEN tutk_suor_8 = 1 THEN lkm
		WHEN tutk_osia_suor_8 = 1 THEN lkm 
		WHEN (tutk_suor_1 = '0'
		AND	tutk_suor_2 = '0'
		AND	tutk_suor_3 = '0'
		AND	tutk_suor_4 = '0'
		AND	tutk_suor_5 = '0'
		AND	tutk_suor_6 = '0'
		AND	tutk_suor_7 = '0'
		AND	tutk_suor_8 = '0'
		AND	tutk_osia_suor_1 = '0'
		AND	tutk_osia_suor_2 = '0'
		AND	tutk_osia_suor_3 = '0'
		AND	tutk_osia_suor_4 = '0'
		AND	tutk_osia_suor_5 = '0'
		AND	tutk_osia_suor_6 = '0'
		AND	tutk_osia_suor_7 = '0'
		AND	tutk_osia_suor_8 = '0') THEN lkm 
		ELSE 0 
	END
	as muu_tai_tuntematon
	,[lkm]

INTO sa.z_tmp_TK_K1_13_sopv
FROM [dw].[v_TK_K1_13] q
--WHERE jarj_tutk != 'NULL'


-- VÄLIAIKAINEN TAULU
-- Lasketaan järjestäjäkohtainen kerroin

DROP TABLE IF EXISTS sa.z_tmp_TK_K1_K13_sopv_jarjkerroin

SELECT 
	tilv,
	[jarj_tutk] = COALESCE(d.ytunnus_amos_spl, t.jarj_tutk), 
	suor_koko_tai_osia_yhteensa, 
	tyolliset_opiskelijat_ja_tyottomat_yhteensa, 
	CASE WHEN	tyolliset_opiskelijat_ja_tyottomat_yhteensa = 0 then 0 else
	suor_koko_tai_osia_yhteensa * 1.0 / tyolliset_opiskelijat_ja_tyottomat_yhteensa * 1.0 end AS jarjestajakerroin
INTO sa.z_tmp_TK_K1_K13_sopv_jarjkerroin
FROM (
	SELECT DISTINCT  
		-- Järjestäjäkertoimen tekijät 
		tilv,
		jarj_tutk,
		--jarj_opisk, 
		SUM(suor_koko_tutk) + SUM(suor_tutk_osia) AS suor_koko_tai_osia_yhteensa, 
		Sum([tyolliset_opiskelijat_ja_tyottomat]) AS tyolliset_opiskelijat_ja_tyottomat_yhteensa
	FROM sa.z_tmp_TK_K1_13_sopv
	WHERE toteuma_tutk = 1 OR (toteuma_tutk IN (1,2) AND tilv >= 2018)
	GROUP BY tilv, jarj_tutk
) t
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d ON t.jarj_tutk = d.ytunnus_avain --AND (t.tilv + 4 >= YEAR(d.voimaan_alkaen) OR d.voimaan_alkaen IS NULL)


-- VÄLIAIKAINEN TAULU
-- Lasketaan järjestäjäkohtainen kerroin ja huomioidaan fuusiot
-- Edellisessä vaiheessa ei huomioitu fuusiota, mutta nyt ne huomioidaan
-- huomattavaa on, että muussa toiminnassa olevat vaikuttavat järjestäjäkertoimeen

DROP TABLE IF EXISTS sa.z_tmp_TK_K1_K13_sopv_jarjkerroin_fuusiot

SELECT [tilv]
      ,jarj_tutk
	  --,d.oid_amos_spl
	  --,nimi_amos_spl
	  --,d.kunta_koodi
      ,SUM([suor_koko_tai_osia_yhteensa]) AS suor_koko_tai_osia_yhteensa
      ,SUM([tyolliset_opiskelijat_ja_tyottomat_yhteensa]) AS tyolliset_opiskelijat_ja_tyottomat_yhteensa
      ,CASE 
			WHEN SUM(tyolliset_opiskelijat_ja_tyottomat_yhteensa) = 0 THEN 0 
			ELSE SUM([suor_koko_tai_osia_yhteensa] * 1.0) / SUM([tyolliset_opiskelijat_ja_tyottomat_yhteensa] * 1.0) 
		END as jarjestajakerroin

INTO sa.z_tmp_TK_K1_K13_sopv_jarjkerroin_fuusiot
FROM [sa].[z_tmp_TK_K1_K13_sopv_jarjkerroin] jk
 -- LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d ON jk.jarj_opisk = d.ytunnus_avain 
	--AND (jk.tilv + 4 >= YEAR(d.voimaan_alkaen) OR d.voimaan_alkaen IS NULL)
GROUP BY [tilv]
      ,jarj_tutk
	  --,d.oid_amos_spl
	  --,nimi_amos_spl
	  --,d.kunta_koodi


-- VARSINAINEN FAKTALATAUS

DROP TABLE IF EXISTS dw.f_amos_spl_vaikuttavuus

SELECT 
	k13.[tilv] AS [Tutkinnon suoritusvuosi]
	,k13.tilv + 1 AS Tilastovuosi
	,CASE [ika21] 
		WHEN '1' THEN '19 tai alle'
		WHEN '2' THEN '20'
		WHEN '3' THEN '21 tai yli'
		ELSE 'Tieto puuttuu'
	END AS [Ikä tutkinnon suoritusvuonna]
	,CASE [ika21] 
		WHEN '1' THEN '20 tai alle'
		WHEN '2' THEN '21'
		WHEN '3' THEN '22 tai yli'
		ELSE 'Tieto puuttuu'
	END AS [Ikä tilastovuonna]
	,ytunnus_amos_spl = COALESCE(spl.ytunnus_amos_spl, k13.jarj_tutk)
	,nimi_amos_spl = COALESCE(spl.nimi_amos_spl, k13.jarjnimi_tutk)
	/*CASE
		WHEN k13.tilv + 4 < YEAR(spl.voimaan_alkaen) THEN COALESCE(spl.nimi_ennen_fuusiota, k13.jarjnimi_tutk)
		ELSE COALESCE(spl.nimi_amos_spl/*, spl2.nimi_amos_spl*/, k13.jarjnimi_tutk/*, k13.jarjnimi_opisk*/)
	END*/
	,CASE
		WHEN k13.tilv = 2016 AND k13.jarj_tutk = '0178980-8' THEN 'Kyllä' -- Kaustinen vuonna 2020
		WHEN spl.sisaltyy_amos_spl = 1 THEN 'Kyllä'
		--WHEN spl.sisaltyy_amos_spl = 0 THEN 'Ei'
		--WHEN spl2.sisaltyy_amos_spl = 1 THEN 'Kyllä'
		--WHEN spl2.sisaltyy_amos_spl = 0 THEN 'Ei'
		--WHEN spl.nimi_amos_spl IS NOT NULL THEN 'Kyllä'
		--WHEN spl2.nimi_amos_spl IS NOT NULL THEN 'Kyllä'
		ELSE 'Ei' 
	END AS Suoritepäätös
	,okm8.paa_asiallinen_toiminta_maakunta_koodi
	,CASE
		WHEN toteuma_tutk = '1' THEN 'Koko tutkinto'
		WHEN toteuma_tutk = '2' THEN 'Tutkinnon osa tai osia'
		ELSE 'Tieto puuttuu'
	END
	AS [Koulutuksen tavoite]
	,[tyov]
	,CASE
		WHEN tyov = '1' THEN 'Kyllä'
		WHEN tyov = '2' THEN 'Ei'
		ELSE 'Tieto puuttuu'
	END
	AS [Työvoimapoliittinen koulutus]
	,k13.[jarj_opisk]
	,k13.jarj_tutk
	,/*CASE
		WHEN spl.nimi_amos_spl IS NULL THEN k13.jarjnimi_opisk
		ELSE spl.nimi_amos_spl 
	END*/
	null AS [Koulutuksen järjestäjä (opiskelun aikainen)]
	,--spl.kunta_koodi 
	null AS [Kuntakoodi_opiskelunaikainen]
	,--COALESCE(spl.nimi_amos_spl, spl2.nimi_amos_spl, k13.jarjnimi_tutk, k13.jarjnimi_opisk) 
	null AS [Koulutuksen järjestäjä (tutkinnon)]
	,--spl2.kunta_koodi
	null AS [Kuntakoodi_tutkinnon]
	,[kaste_t2]
	,[kaste_t2ni] AS [Koulutusaste, taso 2]
	,[iscfibroad2013]
	,[kala_t1ni] AS [Koulutusala, taso 1]
	,[oppis]
	,CASE
		WHEN oppis = '1' THEN 'Kyllä'
		WHEN oppis = '2' THEN 'Ei'
		ELSE 'Tieto puuttuu'
	END
	AS [Oppisopimuskoulutus]
	,[tutklaja]
	,CASE 
		WHEN [tutklaja] = '1' THEN 'Ammatillinen peruskoulutus'
		WHEN [tutklaja] = '2' THEN 'Ammatillinen lisäkoulutus, ammattitutkinto'
		WHEN [tutklaja] = '3' THEN 'Ammatillinen lisäkoulutus, erikoisammattitutkinto'
		WHEN [tutklaja] = '9' THEN 'Muu kuin ammatillinen koulutus'
		ELSE 'Tieto puuttuu'
	END
	[Tutkintoala]
	,CASE
		WHEN [alvv] = 'P' THEN 'Tieto puuttuu'
		WHEN [alvv] = '9999' THEN 'Tieto puuttuu'
		ELSE alvv 
	END
	AS [Tutkinnon aloitusvuosi]
	,CASE 
		WHEN [allk] = '1' THEN 'Kevät (1.1. - 31.7.)'
		WHEN [allk] = '2' THEN 'Syksy (1.8. - 31.12.)'
		ELSE 'Tieto puuttuu'
	END
	AS [Tutkinnon aloituslukukausi]
	,[kaste_t2_e]
	,CASE 
		WHEN [kaste_t2ni_e] IS NULL THEN 'Tieto puuttuu'
		WHEN [kaste_t2ni_e] = 'P' THEN 'Muu tai tuntematon'
		ELSE [kaste_t2ni_e]
	END
	AS [Koulutusaste, taso 2, pohjakoulutus]
	,[ptoim1r2e]
	,CASE	
		WHEN ptoim1r2e IS NULL THEN 'Tieto puuttuu'
		WHEN ptoim1r2e = '10' THEN 'Päätoiminen työllinen'
		WHEN ptoim1r2e = '12' THEN 'Työtön'
		WHEN ptoim1r2e = '13' THEN 'Työllinen opiskelija'
		WHEN ptoim1r2e = '22' THEN 'Päätoiminen opiskelija tai koululainen'
		WHEN ptoim1r2e = '25' THEN 'Varus- tai siviilipalvelusmies'
		WHEN ptoim1r2e = '26' THEN 'Eläkeläinen, sis työkyvyttömyyseläkeläset'
		WHEN ptoim1r2e = '99' THEN 'Muu tai tuntematon'
	END 
	AS [Pääasiallinen toiminta, ennen koulutusta, vuoden lopussa]
	,[kaste_t2_evj]
	,CASE
		WHEN [kaste_t2ni_evj] IS NULL THEN 'Tieto puuttuu'
		WHEN [kaste_t2ni_evj] = 'P' THEN 'Tieto puuttuu'
		ELSE [kaste_t2ni_evj]
	END
	AS [Koulutusaste, taso 2, ennen koulutusta, vuoden lopussa]
	,[amase]
	,CASE
		WHEN amase IS NULL THEN 'Tieto puuttuu'
		WHEN amase = '1' THEN 'Palkansaaja'
		WHEN amase = '2' THEN 'Yrittäjä'
		ELSE 'Tieto puuttuu'
	END
	AS [Ammattiasema, ennen koulutusta, vuoden lopussa]
	,[ptoim1r2h]
	,CASE	
		WHEN ptoim1r2h IS NULL THEN 'Tieto puuttuu'
		WHEN ptoim1r2h = '10' THEN 'Päätoiminen työllinen'
		WHEN ptoim1r2h = '12' THEN 'Työtön'
		WHEN ptoim1r2h = '13' THEN 'Työllinen opiskelija'
		WHEN ptoim1r2h = '22' THEN 'Päätoiminen opiskelija tai koululainen'
		WHEN ptoim1r2h = '25' THEN 'Varus- tai siviilipalvelusmies'
		WHEN ptoim1r2h = '26' THEN 'Eläkeläinen, sis työkyvyttömyyseläkeläset'
		WHEN ptoim1r2h = '99' THEN 'Muu tai tuntematon'
	END AS [Pääasiallinen toiminta, ennen koulutusta, heinäkuun lopussa]
	,[kaste_t2_avh]
	,[kaste_t2ni_avh]
	,CASE
		WHEN [kaste_t2ni_avh] IS NULL THEN 'Tieto puuttuu'
		WHEN [kaste_t2ni_avh] = 'P' THEN 'Tieto puuttuu'
		ELSE [kaste_t2ni_avh]
	END
	AS [Koulutusaste, taso 2, ennen koulutusta, heinäkuun lopussa]
	,[amash]
	,CASE
		WHEN amash IS NULL THEN 'Tieto puuttuu'
		WHEN amash = '1' THEN 'Palkansaaja'
		WHEN amash = '2' THEN 'Yrittäjä'
		ELSE 'Tieto puuttuu'
	END
	AS [Ammattiasema, ennen koulutusta, heinäkuun lopussa]
	,[ptoim1r2_tilvseur]
	,CASE	
		WHEN ptoim1r2_tilvseur IS NULL THEN 'Tieto puuttuu'
		WHEN ptoim1r2_tilvseur = '10' THEN 'Päätoiminen työllinen'
		WHEN ptoim1r2_tilvseur = '12' THEN 'Työtön'
		WHEN ptoim1r2_tilvseur = '13' THEN 'Työllinen opiskelija'
		WHEN ptoim1r2_tilvseur = '22' THEN 'Päätoiminen opiskelija tai koululainen'
		WHEN ptoim1r2_tilvseur = '25' THEN 'Varus- tai siviilipalvelusmies'
		WHEN ptoim1r2_tilvseur = '26' THEN 'Eläkeläinen, sis työkyvyttömyyseläkeläset'
		WHEN ptoim1r2_tilvseur = '99' THEN 'Muu tai tuntematon'
	END
	AS [Sijoittuminen]
	,[maassaolo_tilvseur]
	,CASE
		WHEN [maassaolo_tilvseur] IS NULL THEN 'Tieto puuttuu'
		WHEN [maassaolo_tilvseur] = 'P' THEN 'Tieto puuttuu'
		WHEN [maassaolo_tilvseur] = '1' THEN 'Maassa asuva'
		WHEN [maassaolo_tilvseur] = '2' THEN 'Muuttanut maasta'
	END
	AS [Maassaolo, koulutuksen jälkeen]
	,[amas_tilvseur]
	,CASE
		WHEN amas_tilvseur = '1' THEN 'Palkansaaja'
		WHEN amas_tilvseur = '2' THEN 'Yrittäjä'
		ELSE 'Tieto puuttuu'
	END
	AS [Ammattiasema, koulutuksen jälkeen]
	,[kaste_t2_tilvseur]
	,[kaste_t2ni_tilvseur]
	,CASE
		WHEN kaste_t2ni_tilvseur IS NULL THEN 'Tieto puuttuu'
		WHEN kaste_t2ni_tilvseur = 'P' THEN 'Tieto puuttuu'
		ELSE kaste_t2ni_tilvseur
	END
	AS [Koulutusaste, taso 2, koulutuksen jälkeen]
	,[iscfibroad2013_tilvseur]
	,[kala_t1ni_tilvseur]
	,CASE
		WHEN [kala_t1ni_tilvseur] IS NULL THEN 'Tieto puuttuu'
		WHEN [kala_t1ni_tilvseur] = 'P' THEN 'Tieto puuttuu'
		ELSE [kala_t1ni_tilvseur]
	END
	AS [Koulutusala, taso 1, koulutuksen jälkeen]
	,[suor_koko_tutk] AS [v Suoritetut tutkinnot]
	,[suor_tutk_osia] AS [v Suoritetut tutkinnon osat]
	,[tutk_suor_1]  AS [v Työllinen, koko tutkinnon suorittanut, ennen koulutusta ei-työllinen]
	,[tutk_suor_2]  AS [v Jatko-opiskelija, koko tutkinnon suorittanut, ennen koulutusta ei-työllinen]
	,[tutk_suor_3]  AS [v Työtön, koko tutkinnon suorittanut, ennen koulutusta ei-työllinen]
	,[tutk_suor_4]  AS [v Muu (kuin jatko-opiskelija, työllinen tai työtön), koko tutkinnon suorittanut, ennen koulutusta ei-työllinen]
	,[tutk_osia_suor_1]  AS [v Työllinen, tutkinnon osia suorittanut, ennen koulutusta ei-työllinen]
	,[tutk_osia_suor_2]  AS [v Jatko-opiskelija, tutkinnon osia suorittanut, ennen koulutusta ei-työllinen]
	,[tutk_osia_suor_3]  AS [v Työtön, tutkinnon osia suorittanut, ennen koulutusta ei-työllinen]
	,[tutk_osia_suor_4]  AS [v Muu (kuin jatko-opiskelija, työllinen tai työtön), tutkinnon osia suorittanut, ennen koulutusta ei-työllinen]
	,[tutk_suor_5]  AS [v Työllinen, koko tutkinnon suorittanut, ennen koulutusta työllinen]
	,[tutk_suor_6]  AS [v Jatko-opiskelija, koko tutkinnon suorittanut, ennen koulutusta työllinen]
	,[tutk_suor_7]  AS [v Työtön, koko tutkinnon suorittanut, ennen koulutusta työllinen]
	,[tutk_suor_8]  AS [v Muu (kuin jatko-opiskelija, työllinen tai työtön), koko tutkinnon suorittanut, ennen koulutusta työllinen]
	,[tutk_osia_suor_5]  AS [v Työllinen, tutkinnon osia suorittanut, ennen koulutusta työllinen]
	,[tutk_osia_suor_6]  AS [v Jatko-opiskelija, tutkinnon osia suorittanut, ennen koulutusta työllinen]
	,[tutk_osia_suor_7]  AS [v Työtön, tutkinnon osia suorittanut, ennen koulutusta työllinen]
	,[tutk_osia_suor_8]  AS [v Muu (kuin jatko-opiskelija, työllinen tai työtön), tutkinnon osia suorittanut, ennen koulutusta työllinen]
	,k13.[tyolliset_ja_opiskelijat] AS [v Työlliset ja opiskelijat]
	,k13.[tyolliset] AS [v Työlliset]
	,k13.[opiskelijat] AS [v Opiskelijat]
	,[tyolliset_opiskelijat_ja_tyottomat] AS [v Työlliset, opiskelijat ja työttömät]
	,[statuskerroin] AS [v statuskerroin]
	,[tyollistyneet_ei_tyollisena_ennen_koulutusta] AS [v Työllistyneet, ei työllisenä ennen koul.]
	,[tyollistyneet_tyollisena_ennen_koulutusta] AS [v Työllistyneet, työllisenä ennen koul.]
	,[jatko_opiskelijat_ei_tyollisena_ennen_koulutusta] AS [v Jatko-opiskelijat, ei työllisenä ennen koul.]
	,[jatko_opiskelijat_tyollisena_ennen_koulutusta] AS [v Jatko-opiskelijat, työllisenä ennen koul.]
	,k13.[tyoton] AS [v Työtön]
	,k13.[muu_tai_tuntematon] AS [v Muu tai tuntematon]
	,COALESCE(maak.aluekerroin, 1.0) AS [v Aluekerroin]
	,jk.jarjestajakerroin AS [v Järjestäjäkerroin]
	,statuskerroin * (CASE WHEN okm8.paa_asiallinen_toiminta_maakunta_koodi = 99 THEN 1.0 ELSE maak.aluekerroin END) * jk.jarjestajakerroin * k13.tyolliset AS [v Työllisten painotetut pisteet]
	,statuskerroin * jk.jarjestajakerroin * k13.opiskelijat AS [v Opiskelijoiden painotetut pisteet] 
	,[lkm] AS [v lkm]

INTO dw.f_amos_spl_vaikuttavuus

FROM [sa].[z_tmp_TK_K1_13_sopv] k13
--LEFT JOIN dw.d_amos_spl_jarjestaja_linkki spl2 ON spl2.ytunnus_avain = k13.jarj_opisk
--	AND k13.tilv + 4 >= YEAR(spl.voimaan_alkaen)
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki spl ON spl.ytunnus_avain = k13.jarj_tutk --AND (k13.tilv + 4 >= YEAR(spl.voimaan_alkaen) OR spl.voimaan_alkaen IS NULL)
--	AND k13.tilv + 4 >= YEAR(spl.voimaan_alkaen)
LEFT JOIN sa.z_tmp_TK_K1_K13_sopv_jarjkerroin_fuusiot jk ON jk.jarj_tutk = COALESCE(spl.ytunnus_amos_spl, k13.jarj_tutk) AND jk.tilv = k13.tilv
--  (CASE WHEN k13.tilv + 4 < YEAR(spl.voimaan_alkaen) THEN k13.jarj_tutk ELSE spl.ytunnus_amos_spl END) AND jk.tilv = k13.tilv
LEFT JOIN sa.sa_amos_siirtotiedosto_okm8 okm8 
	ON okm8.koul_jarj = COALESCE(spl.ytunnus_amos_spl, k13.jarj_tutk) 
		AND year(okm8.voimaan_alkaen) = (case when k13.tilv+4 > @maxVuosi then k13.tilv+3 else k13.tilv+4 end) --ennen siirtotiedoston saapumista maakunta edellisestä
LEFT JOIN dw.f_amos_spl_vaikuttavuus_maakunnat maak ON okm8.paa_asiallinen_toiminta_maakunta_koodi = maak.tilvasmaak AND maak.tilv = k13.tilv+1


-- POISTETAAN VÄLIAIKAISET TAULUT
DROP TABLE sa.z_tmp_TK_K1_13_sopv
DROP TABLE sa.z_tmp_TK_K1_K13_sopv_jarjkerroin
DROP TABLE sa.z_tmp_TK_K1_K13_sopv_jarjkerroin_fuusiot

GO
