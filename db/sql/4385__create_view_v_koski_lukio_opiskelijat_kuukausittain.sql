USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_lukio_opiskelijat_kuukausittain]    Script Date: 1.2.2021 14:01:39 ******/
DROP VIEW [dw].[v_koski_lukio_opiskelijat_kuukausittain]
GO

/****** Object:  View [dw].[v_koski_lukio_opiskelijat_kuukausittain]    Script Date: 1.2.2021 14:01:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dw].[v_koski_lukio_opiskelijat_kuukausittain] AS

SELECT
-- LASKENTAMUUTTUJAT 
	f.oppija_oid AS oppija_oid
	,f.uusi_opiskelija

-- AIKAMUUTTUJAT
	,f.vuosi AS Vuosi
	,d13.kuukausi_fi AS Kuukausi
	,COALESCE(f.aloitusvuosi, 'Tieto puuttuu') as [Koul. aloitusvuosi]
	,COALESCE(d14.kuukausi_fi, 'Tieto puuttuu') AS [Koul. aloituskuukausi]
	,case when f.lukuvuosi = '2017/2018' then '2017/2018 kevätlukukausi'
	 else f.lukuvuosi END 
	 AS [Lukuvuosi]
	,f.lukukausi AS [Lukukausi]

-- KOULUTUSMUUTTUJAT
	--,CASE
	--	WHEN f.[oppimaara] = 'nuortenops' THEN 'Nuorten oppimäärä'
	--	WHEN f.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppimäärä'
	--	WHEN f.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Aineopiskelija (ei tutkintotavoitetta)'
	--	WHEN f.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
	--	ELSE 'Ei tietoa' END
	--	AS Oppimäärä
	,oppimaara AS Oppimäärä
	,tavoitetutkinto AS Tavoitetutkinto
	,yhdistelmatutkinto AS [Yhdistelmätutkinto]
	,koulutus AS Koulutus
	,CASE 
		WHEN f.majoitus = 1 THEN 'Kyllä'
		ELSE 'Ei' END
		AS Majoitus
	,CASE
		WHEN f.[sisaoppilaitosmainen_majoitus] = 1 THEN 'Kyllä'
		ELSE 'Ei' END
		AS [Sisäoppilaitosmuotoinen majoitus]
	,d15.kieliryhma1_fi AS [Suorituskieliryhmä]
	,d15.kieli_fi AS Suorituskieli
-- HENKILÖMUUTTUJAT
	,case
		when f.ika = -1 then 'Tieto puuttuu' 
		when f.[ika] < 15 then 'alle 15 vuotta' 
		when f.ika > 70 then 'yli 70 vuotta'
		else CAST(f.ika AS nvarchar(30)) end
		AS [Ikä]
	,d6.kieliryhma1_fi AS [Äidinkieli]
	,CASE 
		WHEN f.kansalaisuus = '246' THEN 'Suomi'
		ELSE 'Muu' END
		AS Kansalaisuus
	,COALESCE(d1.maanosa_fi, 'Tieto puuttuu') AS [Kansalaisuuden maanosa]
	,COALESCE(d3.[sukupuoli_fi], 'Tieto puuttuu') AS [Sukupuoli]
	,CASE 
		WHEN d4.[ikaryhma3_fi] IS NULL THEN 'Tuntematon'
		ELSE d4.ikaryhma3_fi END 
		AS [Ikäryhmä]

-- ORGANISAATIOMUUTTUJAT
	-- Koulutuksen järjestäjä
	,d7.organisaatio_fi AS [Koulutuksen järjestäjä]
	,d7.koulutuksen_jarjestajan_yritysmuoto AS [Koul. järj. yritysmuoto]
	,d10.kunta_fi AS [Koul. järj. kunta]
	,d10.maakunta_fi AS [Koul. järj. maakunta]
	,d10.avi_fi AS [Koul. järj. AVI]
	,d10.ely_fi AS [Koul. järj. ELY]
	,d7.oppilaitostyyppi_fi AS [Koul. järj. oppilaitostyyppi]
	,d10.seutukunta_fi AS [Koul. järj. seutukunta]
	,COALESCE(d10.kuntaryhma_fi, 'Tieto puuttuu') AS [Koul. järj. kuntaryhmä]
	,d10.kielisuhde_fi AS [Koul. jarj. kunnan kielisuhde]
	-- Oppilaitos
	,d8.organisaatio_fi AS Oppilaitos
	,d8.oppilaitoksenopetuskieli_fi AS Opetuskieli
	,d11.kunta_fi AS [Oppilaitoksen kunta]
	,d11.maakunta_fi AS [Oppilaitoksen maakunta]
	,d11.avi_fi AS [Oppilaitoksen AVI]
	,d11.ely_fi AS [Oppilaitoksen ELY]
	,d8.oppilaitostyyppi_fi AS [Oppilaitostyyppi]
	,COALESCE(d11.seutukunta_fi, 'Tieto puuttuu') AS [Oppilaitoksen seutukunta]
	,COALESCE(d11.kuntaryhma_fi, 'Tieto puuttuu') AS [Oppilaitoksen kuntaryhmä]
	,COALESCE(d11.kielisuhde_fi, 'Tieto puuttuu') AS [Oppilaitoksen kunnan kielisuhde]
	-- Toimipiste
	,d9.organisaatio_fi AS Toimipiste

-- JÄRJESTYSMUUTTUJAT
	,COALESCE(d10.kuntaryhma_koodi, 99) AS jarj_kuntaryhma
	,COALESCE(d11.kuntaryhma_koodi, 99) AS jarj_opp_kuntaryhma
	,case
		when f.ika = -1 then 99 
		when f.[ika] < 15 then 0 
		when f.ika > 70 then 71
		else f.ika end 
		AS [jarj_ika]
	,d8.jarjestys_oppilaitoksenopetuskieli_koodi AS [jarj_opetuskieli]
	,d6.jarjestys_kieliryhma1 AS jarj_kieliryhma
	,d15.jarjestys_kieliryhma1 AS jarj_suorituskieliryhma
	,COALESCE(d3.jarjestys_sukupuoli_koodi, 999) AS jarj_sukupuoli
	,d4.jarjestys_ikaryhma3
	,CASE
		WHEN f.oppimaara = 'Aikuisten oppimäärä' THEN 2
		WHEN f.oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' THEN 4
		WHEN f.oppimaara = 'Nuorten oppimäärä' THEN 1
		WHEN f.oppimaara = 'Ulkomainen tutkinto' THEN 3
		ELSE 999 END
		AS jarj_oppimaara
	,jarj_tavoitetutkinto
	,jarj_koulutus
	,CASE 
		WHEN f.kansalaisuus = '246' THEN 1
		ELSE 2 END
		AS jarj_kansalaisuus
	,d13.kuukausi AS jarj_kuukausi
	,COALESCE(d14.kuukausi, 99) AS jarj_aloituskuukausi
	,jarj_yhdistelmatutkinto
	,jarj_lukukausi = CASE WHEN f.lukukausi = 'Syyslukukausi' THEN 1 WHEN f.lukukausi = 'Kevätlukukausi' THEN 2 END
	,jarj_lukuvuosi =
		case
			when f.lukuvuosi = '2017/2018' then 0
			when f.lukuvuosi = '2018/2019' then 1
			when f.lukuvuosi = '2019/2020' then 2
			when f.lukuvuosi = '2020/2021' then 3
			when f.lukuvuosi = '2021/2022' then 4
			when f.lukuvuosi = '2022/2023' then 5
			when f.lukuvuosi = '2023/2024' then 6
			when f.lukuvuosi = '2024/2025' then 7
			when f.lukuvuosi = '2025/2026' then 8
			when f.lukuvuosi = '2026/2027' then 9
			when f.lukuvuosi = '2027/2028' then 10
			else 98
			end

-- KOODIMUUTTUJAT
	,d7.organisaatio_koodi AS [Koodi Koul. järj]
	,d7.kunta_koodi AS [Koodi Koul. järj. kunta]
	,d10.seutukunta_koodi AS [Koodi Koul. järj. seutukunta]
	,d8.organisaatio_koodi AS [Koodi Oppilaitos]
	,d8.kunta_koodi AS [Koodi Oppilaitoksen kunta]
	,d11.seutukunta_koodi AS [Koodi Oppilaitoksen seutukunta]

   FROM [ANTERO].[dw].[f_koski_lukio_opiskelijat_kuukausittain] AS f 
  LEFT JOIN ANTERO.dw.d_maatjavaltiot2 AS d1 ON CAST(f.kansalaisuus AS varchar) = CAST(d1.maatjavaltiot2_koodi AS varchar)
  LEFT JOIN ANTERO.dw.d_sukupuoli AS d3 ON f.Sukupuoli = d3.sukupuoli_koodi
  LEFT JOIN ANTERO.dw.d_ika AS d4 ON f.Ika = d4.ika_avain
--  LEFT JOIN ANTERO.dw.d_koulutusluokitus AS d5 ON f.koulutusmoduuli_koodiarvo = d5.koulutusluokitus_koodi
  LEFT JOIN ANTERO.dw.d_kieli AS d6 ON f.aidinkieli = d6.kieli_koodi
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d7 ON f.koulutustoimija_oid = d7.organisaatio_oid
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d8 ON f.oppilaitos_oid = d8.organisaatio_oid
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus AS d9 ON f.toimipiste_oid = d9.organisaatio_oid
  LEFT JOIN ANTERO.dw.d_alueluokitus AS d10 ON d7.kunta_koodi = d10.kunta_koodi
  LEFT JOIN ANTERO.dw.d_alueluokitus AS d11 ON d8.kunta_koodi = d11.kunta_koodi
  LEFT JOIN ANTERO.dw.d_alueluokitus AS d12 ON d9.kunta_koodi = d12.kunta_koodi
  LEFT JOIN 
	(SELECT DISTINCT 
	vuosi, kuukausi, kuukausi_fi
	FROM ANTERO.dw.d_kalenteri) AS d13 ON f.vuosi = d13.vuosi AND f.kuukausi = d13.kuukausi
  LEFT JOIN 	
	(SELECT DISTINCT 
	vuosi, kuukausi, kuukausi_fi
	FROM ANTERO.dw.d_kalenteri) AS d14 ON f.aloitusvuosi = d14.vuosi AND f.aloituskuukausi = d14.kuukausi
  LEFT JOIN ANTERO.dw.d_kieli AS d15 ON f.suorituskieli_koodiarvo = d15.kieli_koodi
 -- WHERE aloitusvuosi >= YEAR(GETDATE())







GO
USE ANTERO

