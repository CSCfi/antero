USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_move]    Script Date: 21.10.2024 15:11:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_arvo_move] AS


SELECT 
	f.tilastovuosi as Tilastovuosi,
	concat(f.vastaajaid, 'arvo') as vastaajaid,
	d1.organisaatio_fi as Koulu,
	d2.kunta_fi as 'Kunta',
	d2.maakunta_fi as 'Maakunta',
	d2.hyvinvointialue_fi as 'Hyvinvointialue',
	d3.vastaus_fi as Sukupuoli,
	d4.vastaus_fi as Luokka,
	d5.kytkin_koodi as 'suorittanut_sovelletusti',

	f.etunojapunnerrus,
	f.heitto_kiinniotto,
	f.vauhditon_5_loikka,
	f.viivajuoksu,
	f.ylavartalon_kohotus,
	f.kyykistys,
	f.olkapaiden_liikkuvuus_oikea,
	f.olkapaiden_liikkuvuus_vasen,
	f.alaselan_ojennus,

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
	END as lasketaan_summapisteet,

	((f.kyykistys_pisteet + f.alaselan_ojennus_pisteet + (f.olkapaiden_liikkuvuus_oikea_pisteet + f.olkapaiden_liikkuvuus_vasen_pisteet) / 2.0 ) * 2.0) +
	(f.etunojapunnerrus_pisteet + f.ylavartalon_kohotus_pisteet) +
	(f.heitto_kiinniotto_pisteet + f.vauhditon_5_loikka_pisteet) +
	(f.viivajuoksu_pisteet * 2.0) as summapisteet,

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
	f.tilastovuosi as Tilastovuosi,
	concat(f.vastaajaid, 'aida') as vastaajaid,
	d1.organisaatio_fi as Koulu,
	d2.kunta_fi as 'Kunta',
	d2.maakunta_fi as 'Maakunta',
	d2.hyvinvointialue_fi as 'Hyvinvointialue',
	f.sukupuoli as Sukupuoli,
	f.luokka as Luokka,
	d5.kytkin_koodi as 'suorittanut_sovelletusti',

	f.etunojapunnerrus,
	f.heitto_kiinniotto,
	f.vauhditon_5_loikka,
	f.viivajuoksu,
	f.ylavartalon_kohotus,
	f.kyykistys,
	f.olkapaiden_liikkuvuus_oikea,
	f.olkapaiden_liikkuvuus_vasen,
	f.alaselan_ojennus,

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
	END as lasketaan_summapisteet,

	((f.kyykistys_pisteet + f.alaselan_ojennus_pisteet + (f.olkapaiden_liikkuvuus_oikea_pisteet + f.olkapaiden_liikkuvuus_vasen_pisteet) / 2.0 ) * 2.0) +
	(f.etunojapunnerrus_pisteet + f.ylavartalon_kohotus_pisteet) +
	(f.heitto_kiinniotto_pisteet + f.vauhditon_5_loikka_pisteet) +
	(f.viivajuoksu_pisteet * 2.0) as summapisteet,

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

USE [ANTERO]
