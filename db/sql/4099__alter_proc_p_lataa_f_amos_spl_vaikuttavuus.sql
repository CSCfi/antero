USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_spl_vaikuttavuus]    Script Date: 5.11.2020 15:06:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER PROCEDURE [dw].[p_lataa_f_amos_spl_vaikuttavuus] AS

/*

Ladataan kolme väliaikaista taulua 
ANTERO.sa.z_tmp_TK_K1_13_sopv
ANTERO.sa.z_tmp_TK_K1_K13_sopv_jarjkerroin
ANTERO.sa.z_tmp_TK_K1_K13_sopv_jarjkerroin_fuusiot

Faktalatauksessa hyödynnetään vielä maakuntakertoimien taulua

*/

-- VÄLIAIKAINEN TAULU
-- Ladataan TK K1.13 aineisto ja tehdään muutostöitä seuraavaa vaihetta varten

DROP TABLE IF EXISTS ANTERO.sa.z_tmp_TK_K1_13_sopv

SELECT [tilv]
      ,[aineisto]
      ,[prioriteetti]
      ,[toteuma_tutk]
      ,[tyov]
      ,jarj_opisk = 
		CASE 
			WHEN jarj_opisk = '2082223-9' THEN '0872020-5' -- TEAKin fuusio
			ELSE jarj_opisk
		END
      ,[jarjnimi_opisk]
      ,[jarj_tutk]
      ,[jarjnimi_tutk]
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


/* Kertoimet
 Karin speksi 2019-04-05
Työllistyminen ja jatko-opiskelu raporttimalli 2019 04 05.xlsx
 .. välilehti: Painotettujen laskentasäännöt
Työlliset ja opiskelijat
*/
CASE
WHEN tutk_suor_1=1 THEN lkm
WHEN tutk_suor_2=1 THEN lkm
WHEN tutk_osia_suor_1=1 THEN lkm
WHEN tutk_osia_suor_2=1 THEN lkm
WHEN tutk_suor_5=1 THEN lkm
WHEN tutk_suor_6=1 THEN lkm
WHEN tutk_osia_suor_5=1 THEN lkm
WHEN tutk_osia_suor_6=1 THEN lkm else 0 END
 as tyolliset_ja_opiskelijat													

 --Työlliset
,CASE
WHEN tutk_suor_1=1 THEN lkm
WHEN tutk_osia_suor_1=1 THEN lkm
WHEN tutk_suor_5=1 THEN lkm
WHEN tutk_osia_suor_5=1 THEN lkm else 0 END
 as tyolliset			
 
--Opiskelijat
,CASE
WHEN tutk_suor_2=1 THEN lkm
WHEN tutk_osia_suor_2=1 THEN lkm
WHEN tutk_suor_6=1 THEN lkm
WHEN tutk_osia_suor_6=1 THEN lkm else 0 END
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
WHEN tutk_osia_suor_7=1 THEN lkm else 0 END
 as tyolliset_opiskelijat_ja_tyottomat													

--Statuskerroin
,CASE
WHEN tutk_suor_1=1 THEN 4 
WHEN tutk_suor_2=1 THEN 4
WHEN tutk_osia_suor_1=1 THEN 0
WHEN tutk_osia_suor_2=1 THEN 0
WHEN tutk_suor_5=1 THEN 2
WHEN tutk_suor_6=1 THEN 2
WHEN tutk_osia_suor_5=1 THEN 0
WHEN tutk_osia_suor_6=1 THEN 0 ELSE 0 END
as statuskerroin

-- # Välilehti: Suoriteraportti 2
-- Työllistyneet, ei työllisenä ennen koulutusta
,CASE
WHEN tutk_suor_1=1 THEN lkm
WHEN tutk_osia_suor_1=1 THEN lkm
else 0 END
 as tyollistyneet_ei_tyollisena_ennen_koulutusta

 -- Työllistyneet, työllisenä ennen koulutusta
,CASE
WHEN tutk_suor_5=1 THEN lkm
WHEN tutk_osia_suor_5=1 THEN lkm
else 0 END
 as tyollistyneet_tyollisena_ennen_koulutusta

 --Jatko-opiskelijat, ei työllisenä ennen koulutusta
,CASE
WHEN tutk_suor_2=1 THEN lkm
WHEN tutk_osia_suor_2=1 THEN lkm
else 0 END
 as jatko_opiskelijat_ei_tyollisena_ennen_koulutusta

 --Jatko-opiskelijat, työllisenä ennen koulutusta
,CASE
WHEN tutk_suor_6=1 THEN lkm
WHEN tutk_osia_suor_6=1 THEN lkm
else 0 END
 as jatko_opiskelijat_tyollisena_ennen_koulutusta


--Työttömät ja muussa toiminnassa
-- Karin speksi 2019-07-02, lisatty 2019-08-08 jhe
-- Työll+jatko-opisk.lisäraportti2

,CASE 
WHEN tutk_suor_3 = 1 THEN lkm
WHEN tutk_osia_suor_3 = 1 THEN lkm
WHEN tutk_suor_7 = 1 THEN lkm
WHEN tutk_osia_suor_7 = 1 THEN lkm ELSE 0 END 
 as tyoton

 --,CASE WHEN ptoim1r2e_kytkin='ptoim_99' THEN lkm ELSE 0 END 
-- jhe 2.9.2019
/*Kari 13.8.2019: ”Muussa toiminnassa” sisältää kaikki loput tutkinnon suorittaneet, jotka eivät ole työllistyneet tai jatko-opiskelijat sarakkeissa. Ei siis pelkästään 99:t.*/
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
ELSE 0 END
as muu_tai_tuntematon
      ,[lkm]
INTO ANTERO.sa.z_tmp_TK_K1_13_sopv
  FROM (SELECT * FROM [TK_H9098_CSC].[dbo].[TK_K1_13_sopv_19]
			UNION
		SELECT * FROM [TK_H9098_CSC].dbo.TK_K1_13_sopv_20) q

-- VÄLIAIKAINEN TAULU
-- Lasketaan järjestäjäkohtainen kerroin

DROP TABLE IF EXISTS ANTERO.sa.z_tmp_TK_K1_K13_sopv_jarjkerroin

SELECT 
	tilv,
  [jarj_opisk] = COALESCE(d.ytunnus_amos_spl, t.jarj_opisk), 
  suor_koko_tutk_yhteensa, 
  tyolliset_opiskelijat_ja_tyottomat_yhteensa, 
  suor_koko_tutk_yhteensa * 1.0 / tyolliset_opiskelijat_ja_tyottomat_yhteensa * 1.0 AS jarjestajakerroin
INTO ANTERO.sa.z_tmp_TK_K1_K13_sopv_jarjkerroin
FROM 
  (
    SELECT 
      DISTINCT  
	  -- Järjestäjäkertoimen tekijät 
	  tilv,
      jarj_opisk, 
      Sum([suor_koko_tutk]) AS suor_koko_tutk_yhteensa, 
      Sum([tyolliset_opiskelijat_ja_tyottomat]) AS tyolliset_opiskelijat_ja_tyottomat_yhteensa
    FROM 
      ANTERO.sa.z_tmp_TK_K1_13_sopv
	  WHERE toteuma_tutk = 1
	GROUP BY tilv, jarj_opisk
  ) t
  LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki d ON t.jarj_opisk = d.ytunnus_avain 
	AND (t.tilv + 4 >= YEAR(d.voimaan_alkaen) OR d.voimaan_alkaen IS NULL)
 

-- VÄLIAIKAINEN TAULU
-- Lasketaan järjestäjäkohtainen kerroin ja huomioidaan fuusiot

DROP TABLE IF EXISTS ANTERO.sa.z_tmp_TK_K1_K13_sopv_jarjkerroin_fuusiot

SELECT [tilv]
      ,jarj_opisk
	  --,d.oid_amos_spl
	  --,nimi_amos_spl
	  --,d.kunta_koodi
      ,SUM([suor_koko_tutk_yhteensa]) AS suor_koko_tutk_yhteensa
      ,SUM([tyolliset_opiskelijat_ja_tyottomat_yhteensa]) AS tyolliset_opiskelijat_ja_tyottomat_yhteensa
      ,SUM([suor_koko_tutk_yhteensa] * 1.0) /SUM([tyolliset_opiskelijat_ja_tyottomat_yhteensa] * 1.0)  as jarjestajakerroin

INTO ANTERO.sa.z_tmp_TK_K1_K13_sopv_jarjkerroin_fuusiot
  FROM [ANTERO].[sa].[z_tmp_TK_K1_K13_sopv_jarjkerroin] jk
 -- LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki d ON jk.jarj_opisk = d.ytunnus_avain 
	--AND (jk.tilv + 4 >= YEAR(d.voimaan_alkaen) OR d.voimaan_alkaen IS NULL)
GROUP BY [tilv]
      ,jarj_opisk
	  --,d.oid_amos_spl
	  --,nimi_amos_spl
	  --,d.kunta_koodi

-- VARSINAINEN FAKTALATAUS

DROP TABLE IF EXISTS ANTERO.dw.f_amos_spl_vaikuttavuus

SELECT k13.[tilv] AS [Tutkinnon suoritusvuosi]
,k13.tilv + 1 AS Tilastovuosi
,nimi_amos_spl =
	CASE
		WHEN k13.tilv + 4 < YEAR(spl.voimaan_alkaen) THEN COALESCE(spl.nimi_ennen_fuusiota, k13.jarjnimi_opisk)
		ELSE COALESCE(spl.nimi_amos_spl, k13.jarjnimi_opisk)
		END
,CASE
	WHEN k13.tilv = 2016 AND k13.jarj_opisk = '0178980-8' THEN 'Kyllä' -- Kaustinen vuonna 2020
	WHEN spl.sisaltyy_amos_spl = 1 THEN 'Kyllä'
	WHEN spl.sisaltyy_amos_spl = 0 THEN 'Ei' 
	WHEN spl.nimi_amos_spl IS NOT NULL THEN 'Kyllä' 
	ELSE 'Ei' END AS Suoritepäätös
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
      ,CASE
		WHEN spl.nimi_amos_spl IS NULL THEN k13.jarjnimi_opisk
		ELSE spl.nimi_amos_spl 
		END
		AS [Koulutuksen järjestäjä (opiskelun aikainen)]
	  ,spl.kunta_koodi AS [Kuntakoodi_opiskelunaikainen]
      ,[jarj_tutk]
      ,COALESCE(spl2.nimi_amos_spl, k13.jarjnimi_tutk) AS [Koulutuksen järjestäjä (tutkinnon)]
	  ,spl2.kunta_koodi AS [Kuntakoodi_tutkinnon]
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
INTO ANTERO.dw.f_amos_spl_vaikuttavuus
  FROM [ANTERO].[sa].[z_tmp_TK_K1_13_sopv] k13
  LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki spl ON k13.jarj_opisk =  spl.ytunnus_avain
--	AND k13.tilv + 4 >= YEAR(spl.voimaan_alkaen)
  LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki spl2 ON k13.jarj_tutk = spl2.ytunnus_avain
--	AND k13.tilv + 4 >= YEAR(spl.voimaan_alkaen)
  LEFT JOIN ANTERO.sa.z_tmp_TK_K1_K13_sopv_jarjkerroin_fuusiot jk
	ON jk.jarj_opisk = (CASE WHEN k13.tilv + 4 < YEAR(spl.voimaan_alkaen) THEN k13.jarj_opisk ELSE spl.ytunnus_amos_spl END) 
	AND jk.tilv = k13.tilv
  LEFT JOIN ANTERO.sa.sa_amos_siirtotiedosto_okm8 okm8 ON okm8.koul_jarj = spl.ytunnus_amos_spl
	AND YEAR(okm8.voimaan_alkaen) = 2020
  LEFT JOIN ANTERO.dw.f_amos_spl_vaikuttavuus_maakunnat maak 
	ON okm8.paa_asiallinen_toiminta_maakunta_koodi = maak.tilvasmaak
	AND maak.tilv = k13.tilv

-- POISTETAAN VÄLIAIKAISET TAULUT

DROP TABLE IF EXISTS ANTERO.sa.z_tmp_TK_K1_13_sopv
DROP TABLE IF EXISTS ANTERO.sa.z_tmp_TK_K1_K13_sopv_jarjkerroin
DROP TABLE IF EXISTS ANTERO.sa.z_tmp_TK_K1_K13_sopv_jarjkerroin_fuusiot


GO


