USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_indikaattori]    Script Date: 7.10.2026 13.32.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER   VIEW [dw].[v_haku_ja_valinta_indikaattori] AS

SELECT
	[Koulutuksen alkamisvuosi],
	Haku,
	Koulutusaste,
	[Koulutusaste, taso 2],
	Hakukohde,
	[Oppilaitoksen maakunta],
	Maakunta_jarj,
	[Amk päivätoteutus],
	Henkilö_oid,
	Hakutoive,
	Vastaanottotieto,
	Vastaanottanut,
	Koulutusaste_jarj = case f.Koulutusaste2 when '2' then 1 when '3' then 2 when '4' then 3 when '5' then 4 else 9 end,
	År,
	Utbildningsnivå,
	[Utbildningsnivå, nivå 2],
	Landskap,
	[Year],
	[Level of education],
	[Level of education, tier 2],
	Region
FROM (
	SELECT 
		[Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi,
		Haku = d1.haun_nimi_fi,
		koulutusaste2 = d3.koulutussektori_koodi,
		Koulutusaste = d3.koulutussektori_fi,
		[Koulutusaste, taso 2] = d3.koulutusastetaso2_fi, 
		Hakukohde = d2.selite_fi,
		[Oppilaitoksen maakunta] = d5.maakunta_fi,
		Maakunta_jarj = d5.jarjestys_maakunta_koodi,
		[Amk päivätoteutus] = case when d3.koulutussektori_koodi='4' and (d2.selite_fi like '%päivätoteutus%' or d2.selite_fi like '%päivätotetutus%' or d2.selite_fi like '%dagstudier%') then 1 else 0 end,
		Henkilö_oid = HASHBYTES('SHA2_256', vs.salt + f.master_oid),
		Hakutoive = f.hakutoive,
		Vastaanottotieto = f.vastaanottanut_paikan,
		Vastaanottanut = f.vastaanottanut_paikan,

		--Ruotsi
		[År] = f.koulutuksen_alkamisvuosi,
		Utbildningsnivå = d3.koulutussektori_sv,
		[Utbildningsnivå, nivå 2] = d3.koulutusastetaso2_sv,
		Landskap = d5.maakunta_sv,

		--Englanti
		[Year] = f.koulutuksen_alkamisvuosi,
		[Level of education] = d3.koulutussektori_en,
		[Level of education, tier 2]=d3.koulutusastetaso2_en,
		Region = d5.maakunta_en
	FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_toinen_aste f
	LEFT JOIN dw.d_haku d1 on d1.id=f.d_haku_id
	LEFT JOIN dw.d_hakukohde d2 on d2.id=f.d_hakukohde_id
	LEFT JOIN dw.d_koulutusluokitus d3 on d3.id=f.d_koulutusluokitus_hakukohde_id
	LEFT JOIN dw.d_organisaatioluokitus d4 on d4.id=f.d_organisaatioluokitus_oppilaitos_id
	LEFT JOIN dw.d_alueluokitus d5 on d5.kunta_koodi=d4.kunta_koodi
	LEFT JOIN dbo.view_salt vs on vs.[view] = 'v_haku_ja_valinta_indikaattori'
	WHERE f.koulutuksen_alkamisvuosi between 2015 and year(GETDATE())-1 AND f.master_oid is not null
	AND d1.hakuryhma_koodi in ('1', '6') --"Ammatillisen koulutuksen ja lukiokoulutuksen yhteishaku" sekä "Perusopetuksen jälkeisen koulutuksen yhteishaku)"

	UNION ALL

	SELECT 
		[Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi,
		Haku = d1.haun_nimi_fi,
		koulutusaste2 = d3.koulutussektori_koodi,
		Koulutusaste = d3.koulutussektori_fi,
		[Koulutusaste, taso 2] = d3.koulutusastetaso2_fi,
		Hakukohde = d2.selite_fi,
		[Oppilaitoksen maakunta] = d5.maakunta_fi,
		Maakunta_jarj = d5.jarjestys_maakunta_koodi,
		[Amk päivätoteutus] = case when d3.koulutussektori_koodi='4' and (d2.selite_fi like '%päivätoteutus%' or d2.selite_fi like '%päivätotetutus%' or d2.selite_fi like '%dagstudier%') then 1 else 0 end,
		Henkilö_oid = HASHBYTES('SHA2_256', vs.salt + f.master_oid),
		Hakutoive = f.hakutoive,
		Vastaanottotieto = f.vastaanottanut_paikan,
		Vastaanottanut = f.vastaanottanut_paikan,

		--Ruotsi
		[År] = f.koulutuksen_alkamisvuosi,
		Utbildningsnivå = d3.koulutussektori_sv,
		[Utbildningsnivå, nivå 2] = d3.koulutusastetaso2_sv,
		Landskap = d5.maakunta_sv,

		--Englanti
		[Year] = f.koulutuksen_alkamisvuosi,
		[Level of education] = d3.koulutussektori_en,
		[Level of education, tier 2]=d3.koulutusastetaso2_en,
		Region = d5.maakunta_en
	FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f
	LEFT JOIN dw.d_haku d1 on d1.id=f.d_haku_id
	LEFT JOIN dw.d_hakukohde d2 on d2.id=f.d_hakukohde_id
	LEFT JOIN dw.d_koulutusluokitus d3 on d3.id=f.d_koulutusluokitus_id
	LEFT JOIN dw.d_organisaatioluokitus d4 on d4.id=f.d_organisaatioluokitus_oppilaitos_id
	LEFT JOIN dw.d_alueluokitus d5 on d5.kunta_koodi=d4.kunta_koodi
	LEFT JOIN dbo.view_salt vs on vs.[view] = 'v_haku_ja_valinta_indikaattori'
	WHERE f.koulutuksen_alkamisvuosi between 2015 and year(GETDATE())-1 and f.master_oid is not null
	AND d1.hakuryhma_koodi = '4' --Korkeakoulujen yhteishaku
) f