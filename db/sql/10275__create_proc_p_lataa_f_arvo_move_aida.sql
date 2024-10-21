USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_move_aida]    Script Date: 21.10.2024 15:01:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_arvo_move_aida] as

TRUNCATE TABLE ANTERO.dw.f_arvo_move_aida

INSERT INTO ANTERO.dw.f_arvo_move_aida 
SELECT
	f.tilastovuosi,
	f.vastaajaid,
	f.d_organisaatioluokitus_id,
	f.d_alueluokitus_id,
	f.luokka,
	f.sukupuoli,
	f.suoritettu_soveltavasti,
	f.etunojapunnerrus,
	f.heitto_kiinniotto,
	f.vauhditon_5_loikka,
	f.viivajuoksu,
	f.ylavartalon_kohotus,
	f.kyykistys,
	f.olkapaiden_liikkuvuus_oikea,
	f.olkapaiden_liikkuvuus_vasen,
	f.alaselan_ojennus,
	f.viivajuoksu_pisteet,
	CASE 
		WHEN f.etunojapunnerrus_pisteet IS NULL AND f.ylavartalon_kohotus_pisteet IS NOT NULL THEN 1 
		ELSE f.etunojapunnerrus_pisteet
	END as etunojapunnerrus_pisteet,
	CASE 
		WHEN f.ylavartalon_kohotus_pisteet IS NULL AND f.etunojapunnerrus_pisteet IS NOT NULL THEN 1 
		ELSE f.ylavartalon_kohotus_pisteet
	END as ylavartalon_kohotus_pisteet,
	CASE 
		WHEN f.heitto_kiinniotto_pisteet IS NULL AND f.vauhditon_5_loikka_pisteet IS NOT NULL THEN 1 
		ELSE f.heitto_kiinniotto_pisteet
	END as heitto_kiinniotto_pisteet,
	CASE 
		WHEN f.vauhditon_5_loikka_pisteet IS NULL AND f.heitto_kiinniotto_pisteet IS NOT NULL THEN 1 
		ELSE f.vauhditon_5_loikka_pisteet
	END as vauhditon_5_loikka_pisteet,
	CASE 
		WHEN f.kyykistys IS NULL AND f.puuttuva_liikkuvuus < 3 THEN 0
		ELSE f.kyykistys
	END as kyykistys_pisteet,
	CASE 
		WHEN f.olkapaiden_liikkuvuus_oikea IS NULL AND f.puuttuva_liikkuvuus < 3 THEN 0
		ELSE f.olkapaiden_liikkuvuus_oikea
	END as olkapaiden_liikkuvuus_oikea_pisteet,
	CASE 
		WHEN f.olkapaiden_liikkuvuus_vasen IS NULL AND f.puuttuva_liikkuvuus < 3 THEN 0
		ELSE f.olkapaiden_liikkuvuus_vasen
	END as olkapaiden_liikkuvuus_vasen_pisteet,
	CASE 
		WHEN f.alaselan_ojennus IS NULL AND f.puuttuva_liikkuvuus < 3 THEN 0
		ELSE f.alaselan_ojennus
	END as alaselan_ojennus_pisteet,
	GETDATE() as loadtime,
	SUSER_NAME() as username,
	'ETL: p_lataa_f_arvo_move_aida' as source
FROM (
	SELECT 
		vuosi as tilastovuosi,
		s.id as vastaajaid,
		COALESCE(d1.id, -1) as d_organisaatioluokitus_id,
		COALESCE(d2.id, -1) as d_alueluokitus_id,
		s.luokka,
		s.sukupuoli,
		CASE suoritti_sovelletusti WHEN 'Kyllä' THEN 1 ELSE 0 END as suoritettu_soveltavasti,
		CAST(etunojapunnerrus as int) as etunojapunnerrus,
		CAST(COALESCE(viivajuoksu_s, vj.kesto) as int) as viivajuoksu,
		CAST(heitto_kiinniotto_yhdistelma as int) as heitto_kiinniotto,
		CAST(ylavartalon_kohotus as int) as ylavartalon_kohotus,
		CASE olkapaanliikkuvuus_oikea_ylhaalla WHEN 'Kyllä' THEN 1 WHEN 'Ei' THEN 0 ELSE NULL END as olkapaiden_liikkuvuus_oikea,
		CASE olkapaanliikkuvuus_vasen_ylhaalla WHEN 'Kyllä' THEN 1 WHEN 'Ei' THEN 0 ELSE NULL END as olkapaiden_liikkuvuus_vasen,
		CAST(REPLACE(vauhditon_5_loikka, ',', '.') as float) as vauhditon_5_loikka,
		CASE alaselan_ojennus_taysistunnassa WHEN 'Kyllä' THEN 1 WHEN 'Ei' THEN 0 ELSE NULL END as alaselan_ojennus,
		CASE kyykistys WHEN 'Kyllä' THEN 1 WHEN 'Ei' THEN 0 ELSE NULL END as kyykistys,
		CASE 
			WHEN CAST(etunojapunnerrus as int) >= 90 THEN NULL
			WHEN CAST(etunojapunnerrus as int) >= p1.alaraja3 THEN 3 
			WHEN CAST(etunojapunnerrus as int) BETWEEN p1.alaraja2 and p1.ylaraja2 THEN 2
			WHEN CAST(etunojapunnerrus as int) <= p1.ylaraja1 THEN 1
			ELSE NULL
		END as etunojapunnerrus_pisteet,
		CASE 
			WHEN (CAST(viivajuoksu_s as int) >= 800 or viivajuoksu_s is null) AND (CAST(s.viivajuoksu_lkm as int) >= 150 or s.viivajuoksu_lkm is null) THEN NULL
			WHEN CAST(viivajuoksu_lkm as int) >= p2.alaraja3 THEN 3 
			WHEN CAST(viivajuoksu_lkm as int) BETWEEN p2.alaraja2 and p2.ylaraja2 THEN 2
			WHEN CAST(viivajuoksu_lkm as int) <= p2.ylaraja1 THEN 1
			ELSE NULL
		END as viivajuoksu_pisteet,
		CASE 
			WHEN CAST(heitto_kiinniotto_yhdistelma as int) >= p3.alaraja3 THEN 3 
			WHEN CAST(heitto_kiinniotto_yhdistelma as int) BETWEEN p3.alaraja2 and p3.ylaraja2 THEN 2
			WHEN CAST(heitto_kiinniotto_yhdistelma as int) <= p3.ylaraja1 THEN 1
			ELSE NULL
		END as heitto_kiinniotto_pisteet,
		CASE 
			WHEN CAST(ylavartalon_kohotus as int) >= p4.alaraja3 THEN 3 
			WHEN CAST(ylavartalon_kohotus as int) BETWEEN p4.alaraja2 and p4.ylaraja2 THEN 2
			WHEN CAST(ylavartalon_kohotus as int) <= p4.ylaraja1 THEN 1
			ELSE NULL
		END as ylavartalon_kohotus_pisteet,
		CASE 
			WHEN CAST(REPLACE(vauhditon_5_loikka, ',', '.') as float) >= 16 OR  CAST(REPLACE(vauhditon_5_loikka, ',', '.') as float) < 2.5 THEN NULL
			WHEN CAST(REPLACE(vauhditon_5_loikka, ',', '.') as float) >= p7.alaraja3 THEN 3 
			WHEN CAST(REPLACE(vauhditon_5_loikka, ',', '.') as float) BETWEEN p7.alaraja2 and p7.ylaraja2 THEN 2
			WHEN CAST(REPLACE(vauhditon_5_loikka, ',', '.') as float) <= p7.ylaraja1 THEN 1
			ELSE NULL
		END as vauhditon_5_loikka_pisteet,
		CASE WHEN kyykistys IS NULL THEN 1 ELSE 0 END + 
		CASE WHEN olkapaanliikkuvuus_oikea_ylhaalla IS NULL THEN 1 ELSE 0 END + 
		CASE WHEN olkapaanliikkuvuus_vasen_ylhaalla IS NULL THEN 1 ELSE 0 END +
		CASE WHEN alaselan_ojennus_taysistunnassa IS NULL THEN 1 ELSE 0 END as puuttuva_liikkuvuus

	FROM [Arvo_SA].[sa].[sa_move_historia] s
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = RIGHT(CONCAT('0000', s.koulunumero),5)
	LEFT JOIN ANTERO.dw.d_alueluokitus d2 on d2.kunta_koodi = s.kuntanumero
	LEFT JOIN ANTERO.dw.d_move_pisterajat p1 on p1.sukupuoli = s.sukupuoli and p1.luokka = s.luokka and p1.mittari = 'etunojapunnerrus'
	LEFT JOIN ANTERO.dw.d_move_pisterajat p2 on p2.sukupuoli = s.sukupuoli and p2.luokka = s.luokka and p2.mittari = 'viivajuoksu'
	LEFT JOIN ANTERO.dw.d_move_pisterajat p3 on p3.sukupuoli = s.sukupuoli and p3.luokka = s.luokka and p3.mittari = 'heitto-kiinniotto'
	LEFT JOIN ANTERO.dw.d_move_pisterajat p4 on p4.sukupuoli = s.sukupuoli and p4.luokka = s.luokka and p4.mittari = 'ylävartalon kohotus'
	LEFT JOIN ANTERO.dw.d_move_pisterajat p7 on p7.sukupuoli = s.sukupuoli and p7.luokka = s.luokka and p7.mittari = 'vauhditon 5-loikka'
	LEFT JOIN ANTERO.dw.d_move_viivajuoksu vj on vj.lukumaara = cast(s.viivajuoksu_lkm as int)
) f



GO

USE [ANTERO]
