USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_tuva_opiskelijat_visualisointi]    Script Date: 13.10.2025 13.03.38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  OR ALTER VIEW [dw].[v_koski_tuva_opiskelijat_visualisointi] AS

SELECT
	f.[tilastovuosi] as Tilastovuosi,
	d11.kuukausi as kuukausi,
	d2.ikaryhma6_fi as 'Ikä',
	d4.kieliryhma2_fi as 'Äidinkieli',
	CASE	
		WHEN d5.erityisopetus_ryhma_fi = 'Vaativan erityisen tuen opiskelija' THEN 'Kyllä'
		ELSE 'Ei'
	END as 'Vaativa erityinen tuki',
	d3.maanosa1_fi as Kansalaisuus,
	d8.organisaatio_fi as Toimipiste,
	d7.organisaatio_fi as Oppilaitos,
	d18.kunta_fi as 'Oppilaitoksen kunta',
	d18.maakunta_fi as 'Oppilaitoksen maakunta',
	d7.oppilaitoksenopetuskieli_fi as 'Oppilaitoksen opetuskieli',
	d6.organisaatio_fi as 'Koulutuksen järjestäjä',
	d17.kunta_fi as 'Koulutuksen järjestäjän kunta',
	d17.maakunta_fi as 'Koulutuksen järjestäjän maakunta',
	d19.kunta_fi as 'Toimipisteen kunta',
	d19.maakunta_fi as 'Toimipisteen maakunta',
	CASE 
		WHEN RIGHT(COALESCE(d7.postinumero,d6.postinumero),1) <> '0' THEN CONCAT(LEFT(COALESCE(d7.postinumero,d6.postinumero),4),'0')
		ELSE COALESCE(d7.postinumero,d6.postinumero)
	END as 'Oppilaitoksen postinumero',
	CASE 
		WHEN RIGHT(COALESCE(d8.postinumero,d7.postinumero,d8.postinumero),1) <> '0' THEN CONCAT(LEFT(COALESCE(d8.postinumero,d7.postinumero,d8.postinumero),4),'0')
		ELSE COALESCE(d8.postinumero,d7.postinumero,d8.postinumero)
	END as 'Toimipisteen postinumero',
	CASE 
		WHEN RIGHT(d6.postinumero,1) <> '0' THEN CONCAT(LEFT(d6.postinumero,4),'0')
		ELSE d6.postinumero
	END as 'Koulutuksen järjestäjän postinumero',
	CASE
		WHEN f.[tuva_jarjestamislupa] = 'ammatillinen' THEN 'Ammatillisen koulutuksen rahoitusjärjestelmä (TUVA)'
		WHEN f.[tuva_jarjestamislupa] = 'lukio' THEN 'Lukiokoulutuksen rahoitusjärjestelmä (TUVA)'
		WHEN f.[tuva_jarjestamislupa] = 'perusopetus' THEN 'Perusopetuksen rahoitusjärjestelmä (TUVA)'
	END as 'Rahoitusjärjestelmä',		
	f.[master_oid],
	f.opiskeluoikeus_oid,
	f.tila_20_9,
	f.pv_kk,
	pv.paivat_vuodessa,
	d2.jarjestys_ikaryhma6 as jarjestys_ika,
	CASE
		WHEN d3.maanosa1_koodi = '-1' THEN '99'
		ELSE d3.maanosa1_koodi
	END as jarjestys_kansalaisuus,
	CASE
		WHEN d4.kieliryhma2_koodi = '-1' then '99'
		ELSE d4.kieliryhma2_koodi
	END as jarjestys_aidinkieli,
	d7.jarjestys_oppilaitoksenopetuskieli_koodi as jarjestys_oppilaitoksen_opetuskieli,
	d18.jarjestys_maakunta_koodi as jarjestys_oppilaitoksen_maakunta,
	d17.jarjestys_maakunta_koodi as jarjestys_koulutuksen_jarjestajan_maakunta
FROM [ANTERO].[dw].[f_koski_tuva_opiskelijat_kuukausittainen] f
LEFT JOIN [ANTERO].[dw].[d_sukupuoli] d1 on d1.id = f.d_sukupuoli_id 
LEFT JOIN [ANTERO].[dw].[d_ika] d2 on d2.id = f.d_ika_id
LEFT JOIN [ANTERO].[dw].[d_maatjavaltiot2] d3 on d3.id = f.d_kansalaisuus_id
LEFT JOIN [ANTERO].[dw].[d_kieli] d4 on d4.id = f.d_aidinkieli_id
LEFT JOIN [ANTERO].[dw].[d_erityisopetus] d5 on d5.erityisopetus_koodi = f.erityisopetus
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d6 on d6.id = f.d_koulutuksen_jarjestaja_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d7 on d7.id = f.d_oppilaitos_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d8 on d8.id = f.d_toimipiste_id
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d11 on d11.id = d_kalenteri_id
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d17 on d17.kunta_koodi = d6.kunta_koodi
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d18 on d18.kunta_koodi = d7.kunta_koodi
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d19 on d19.kunta_koodi = d8.kunta_koodi
OUTER APPLY (
	SELECT 
		COUNT(*) as paivat_vuodessa 
	FROM [ANTERO].[dw].[d_kalenteri] d
	WHERE d.vuosi = f.tilastovuosi and ((d.vuosi = 2022 AND d.kuukausi > 7) or d.vuosi BETWEEN 2023 and YEAR(GETDATE())-1 or (d.vuosi = YEAR(GETDATE()) and d.kuukausi < MONTH(GETDATE())-1))
) pv

UNION ALL

SELECT DISTINCT
	f.[Tarkasteluvuosi] as Tilastovuosi,
	NULL as kuukausi,
	NULL as 'Ikä',
	NULL as 'Äidinkieli',
	NULL as 'Vaativa erityinen tuki',
	NULL as Kansalaisuus,
	d1.organisaatio_fi as Toimipiste,
	d1.organisaatio_fi as Oppilaitos,
	d1a.kunta_fi as 'Oppilaitoksen kunta',
	d1a.maakunta_fi as 'Oppilaitoksen maakunta',
	'Tieto puuttuu' as 'Oppilaitoksen opetuskieli',
	d1.organisaatio_fi as 'Koulutuksen järjestäjä',
	d1a.kunta_fi as 'Koulutuksen järjestäjän kunta',
	d1a.maakunta_fi as 'Koulutuksen järjestäjän maakunta',
	d1a.kunta_fi as 'Toimipisteen kunta',
	d1a.maakunta_fi as 'Toimipisteen maakunta',
	CASE 
		WHEN RIGHT(d1.postinumero,1) <> '0' THEN CONCAT(LEFT(d1.postinumero,4),'0')
		ELSE d1.postinumero
	END as 'Oppilaitoksen postinumero',
	CASE 
		WHEN RIGHT(d1.postinumero,1) <> '0' THEN CONCAT(LEFT(d1.postinumero,4),'0')
		ELSE d1.postinumero
	END as 'Toimipisteen postinumero',
	CASE 
		WHEN RIGHT(d1.postinumero,1) <> '0' THEN CONCAT(LEFT(d1.postinumero,4),'0')
		ELSE d1.postinumero
	END as 'Koulutuksen järjestäjän postinumero',
	CASE
		WHEN f.[alkup_jarjestamislupa] = 'Ammatillinen koulutus' THEN 'Ammatillisen koulutuksen rahoitusjärjestelmä (TUVA)'
		WHEN f.[alkup_jarjestamislupa] = 'Lukiokoulutus' THEN 'Lukiokoulutuksen rahoitusjärjestelmä (TUVA)'
		WHEN f.[alkup_jarjestamislupa] = 'Esi- ja perusopetus' THEN 'Perusopetuksen rahoitusjärjestelmä (TUVA)'
	END as 'Rahoitusjärjestelmä',
	NULL master_oid,
	NULL as opiskeluoikeus_oid,
	NULL as tila_20_9,
	0 as pv_kk,
	pv.paivat_vuodessa as paivat_vuodessa,
	NULL as jarjestys_ika,
	NULL as jarjestys_kansalaisuus,
	NULL as jarjestys_aidinkieli,
	NULL as jarjestys_oppilaitoksen_opetuskieli,
	d1a.jarjestys_maakunta_koodi as jarjestys_oppilaitoksen_maakunta,
	d1a.jarjestys_maakunta_koodi as jarjestys_koulutuksen_jarjestajan_maakunta
FROM dw.f_oiva_luvat_tuva f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_jarjestaja_id
LEFT JOIN ANTERO.dw.d_alueluokitus d1a on d1a.kunta_koodi=d1.kunta_koodi
INNER JOIN ANTERO.sa.sa_tuva_koulutuksen_jarjestajat_ilman_opiskelijoita s on s.tilastovuosi = f.tarkasteluvuosi and s.organisaatio_koodi = d1.organisaatio_koodi
LEFT JOIN ANTERO.dw.d_kalenteri d4 on d4.id=f.d_kalenteri_luvan_alku_id
OUTER APPLY (
	SELECT 
		COUNT(*) as paivat_vuodessa 
	FROM ANTERO.dw.d_kalenteri d
	WHERE d.vuosi = f.tarkasteluvuosi and ((d.vuosi = 2022 AND d.kuukausi > 7) or d.vuosi BETWEEN 2023 and YEAR(GETDATE())-1 or (d.vuosi = YEAR(GETDATE()) and d.kuukausi < MONTH(GETDATE())-1))
) pv
WHERE (d4.vuosi > 2022 OR (d4.vuosi = 2022 AND d4.kuukausi > 7)) and (tarkasteluvuosi <> 2025 or (tarkasteluvuosi = 2025 and tarkastelukuukausi > 7))

GO


