USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_move_cultures]    Script Date: 22.11.2024 14:56:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP VIEW IF EXISTS [dw].[v_arvo_move]

GO

CREATE OR ALTER VIEW [dw].[v_arvo_move_cultures] AS

SELECT 
	f.tilastovuosi as tilastovuosi,
	
	concat(f.vastaajaid, 'arvo') as apusarake_vastaajaid,
	f.etunojapunnerrus as apusarake_etunojapunnerrus,
	f.heitto_kiinniotto as apusarake_heitto_kiinniotto,
	f.vauhditon_5_loikka as apusarake_vauhditon_5_loikka,
	f.viivajuoksu as apusarake_viivajuoksu,
	f.ylavartalon_kohotus as apusarake_ylavartalon_kohotus,
	f.kyykistys as apusarake_kyykistys,
	f.olkapaiden_liikkuvuus_oikea as apusarake_olkapaiden_liikkuvuus_oikea,
	f.olkapaiden_liikkuvuus_vasen as apusarake_olkapaiden_liikkuvuus_vasen,
	f.alaselan_ojennus as apusarake_alaselan_ojennus,
	d5.kytkin_koodi as apusarake_suorittanut_sovelletusti,
	CASE
		WHEN suoritettu_soveltavasti = 1 THEN 0
		WHEN	f.etunojapunnerrus_pisteet IS NULL OR 
				f.heitto_kiinniotto_pisteet IS NULL OR 
				f.vauhditon_5_loikka_pisteet IS NULL OR 
				f.viivajuoksu_pisteet IS NULL OR 
				f.ylavartalon_kohotus_pisteet IS NULL OR
				f.kyykistys_pisteet IS NULL OR
				f.olkapaiden_liikkuvuus_oikea_pisteet IS NULL OR 
				f.olkapaiden_liikkuvuus_vasen_pisteet IS NULL OR 
				f.alaselan_ojennus_pisteet IS NULL THEN 0
		ELSE 1
	END as apusarake_lasketaan_summapisteet,
	((f.kyykistys_pisteet + f.alaselan_ojennus_pisteet + (f.olkapaiden_liikkuvuus_oikea_pisteet + f.olkapaiden_liikkuvuus_vasen_pisteet) / 2.0 ) * 2.0) +
	(f.etunojapunnerrus_pisteet + f.ylavartalon_kohotus_pisteet) +
	(f.heitto_kiinniotto_pisteet + f.vauhditon_5_loikka_pisteet) +
	(f.viivajuoksu_pisteet * 2.0) as apusarake_summapisteet,
	
	d1.organisaatio_fi as koulu_fi,
	d2.kunta_fi as kunta_fi,
	d2.maakunta_fi as maakunta_fi,
	d2.hyvinvointialue_fi as hyvinvointialue_fi,
	d3.vastaus_fi as sukupuoli_fi,
	d4.vastaus_fi as vuosiluokka_fi,
	d1.organisaatio_sv as koulu_sv,
	d2.kunta_sv as kunta_sv,
	d2.maakunta_sv as maakunta_sv,
	d2.hyvinvointialue_sv as hyvinvointialue_sv,
	d3.vastaus_sv as sukupuoli_sv,
	d4.vastaus_sv as vuosiluokka_sv,

	d2.jarjestys_maakunta_koodi as jarjestys_maakunta,
	d2.jarjestys_hyvinvointialue_koodi as jarjestys_hyvinvointialue

FROM dw.f_arvo_move  f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_alueluokitus d2 on d2.kunta_koodi = d1.kunta_koodi
LEFT JOIN ANTERO.dw.d_arvovastaus_monivalinta d3 on d3.id = coalesce(f.d_arvovastaus_monivalinta_sukupuoli_id, -1)
LEFT JOIN ANTERO.dw.d_arvovastaus_monivalinta d4 on d4.id = coalesce(f.d_arvovastaus_monivalinta_luokka_id, -1)
LEFT JOIN ANTERO.dw.d_kytkin d5 on d5.kytkin_koodi = f.suoritettu_soveltavasti
LEFT JOIN ANTERO.sa.sa_move_vuosikello s1 on s1.tilastovuosi = f.tilastovuosi
WHERE COALESCE(s1.julkaisupvm, '9999-01-01') <= GETDATE() OR RIGHT(LEFT(@@SERVERNAME,4),1) = 't' 

UNION ALL 

SELECT 
	f.tilastovuosi as tilastovuosi,

	concat(f.vastaajaid, 'aida') as apusarake_vastaajaid,
	f.etunojapunnerrus as apusarake_etunojapunnerrus,
	f.heitto_kiinniotto as apusarake_heitto_kiinniotto,
	f.vauhditon_5_loikka as apusarake_vauhditon_5_loikka,
	f.viivajuoksu as apusarake_viivajuoksu,
	f.ylavartalon_kohotus as apusarake_ylavartalon_kohotus,
	f.kyykistys as apusarake_kyykistys,
	f.olkapaiden_liikkuvuus_oikea as apusarake_olkapaiden_liikkuvuus_oikea,
	f.olkapaiden_liikkuvuus_vasen as apusarake_olkapaiden_liikkuvuus_vasen,
	f.alaselan_ojennus as apusarake_alaselan_ojennus,
	d5.kytkin_koodi as apusarake_suorittanut_sovelletusti,
	CASE
		WHEN suoritettu_soveltavasti = 1 THEN 0
		WHEN	f.etunojapunnerrus_pisteet IS NULL OR 
				f.heitto_kiinniotto_pisteet IS NULL OR 
				f.vauhditon_5_loikka_pisteet IS NULL OR 
				f.viivajuoksu_pisteet IS NULL OR 
				f.ylavartalon_kohotus_pisteet IS NULL OR
				f.kyykistys_pisteet IS NULL OR
				f.olkapaiden_liikkuvuus_oikea_pisteet IS NULL OR 
				f.olkapaiden_liikkuvuus_vasen_pisteet IS NULL OR 
				f.alaselan_ojennus_pisteet IS NULL THEN 0
		ELSE 1
	END as apusarake_lasketaan_summapisteet,
	((f.kyykistys_pisteet + f.alaselan_ojennus_pisteet + (f.olkapaiden_liikkuvuus_oikea_pisteet + f.olkapaiden_liikkuvuus_vasen_pisteet) / 2.0 ) * 2.0) +
	(f.etunojapunnerrus_pisteet + f.ylavartalon_kohotus_pisteet) +
	(f.heitto_kiinniotto_pisteet + f.vauhditon_5_loikka_pisteet) +
	(f.viivajuoksu_pisteet * 2.0) as apusarake_summapisteet,

	d1.organisaatio_fi as koulu_fi,
	d2.kunta_fi as kunta_fi,
	d2.maakunta_fi as maakunta_fi,
	d2.hyvinvointialue_fi as hyvinvointialue_fi,
	f.sukupuoli as sukupuoli_fi,
	f.luokka as vuosiluokka_fi,
	d1.organisaatio_sv as koulu_sv,
	d2.kunta_sv as kunta_sv,
	d2.maakunta_sv as maakunta_sv,
	d2.hyvinvointialue_sv as hyvinvointialue_sv,
	CASE f.sukupuoli WHEN 'Poika' THEN 'Pojke' WHEN 'Tyttö' THEN 'Flicka' ELSE 'Information saknas' END as sukupuoli_sv,
	CASE f.luokka WHEN '5. luokka' THEN 'Årskurs 5' WHEN '8. luokka' THEN 'Årskurs 8' ELSE 'Information saknas' END as vuosiluokka_sv,
	
	d2.jarjestys_maakunta_koodi as jarjestys_maakunta,
	d2.jarjestys_hyvinvointialue_koodi as jarjestys_hyvinvointialue

FROM dw.f_arvo_move_aida  f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_alueluokitus d2 on d2.id = f.d_alueluokitus_id
LEFT JOIN ANTERO.dw.d_kytkin d5 on d5.kytkin_koodi = f.suoritettu_soveltavasti
LEFT JOIN ANTERO.sa.sa_move_vuosikello s1 on s1.tilastovuosi = f.tilastovuosi
WHERE f.tilastovuosi < 2024 AND luokka is not null AND
(COALESCE(s1.julkaisupvm, '9999-01-01') <= GETDATE() OR RIGHT(LEFT(@@SERVERNAME,4),1) = 't')

GO


