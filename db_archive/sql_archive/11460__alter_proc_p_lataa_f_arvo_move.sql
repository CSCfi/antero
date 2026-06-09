USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_move]    Script Date: 10.12.2025 14.25.33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER  PROCEDURE [dw].[p_lataa_f_arvo_move] as

DROP TABLE IF EXISTS ANTERO.dbo.temp_move
DROP TABLE IF EXISTS ANTERO.dbo.temp_move_kysymys

CREATE NONCLUSTERED INDEX [NC_move]
ON Arvo_SA.[sa].[sa_arvo_vastaukset_muut]  ([kyselykertaid])
INCLUDE ([vastaajaid],[kysymysid],[numerovalinta],[kysymysversio])

SELECT DISTINCT
	kk.kyselykerta_vuosi as tilastovuosi,
	v.vastaajaid,
	k.oppilaitoskoodi
INTO ANTERO.dbo.temp_move
FROM Arvo_SA.sa.sa_arvo_vastaukset_muut v
LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselyid = v.kyselyid
LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet k on v.vastaajatunnusid = k.vastaajatunnusid
WHERE kk.tyyppi = 'move' and kk.kyselykerta not like '%test%' and YEAR(v.vastausaika) >= 2024

SELECT DISTINCT
	kk.kyselykerta_vuosi as tilastovuosi,
	vastaajaid,
	kysymys_fi,
	CASE
		WHEN monivalintavaihtoehto_fi = 'Onnistui' THEN 1
		WHEN monivalintavaihtoehto_fi = 'Ei onnistunut' THEN 0
		WHEN monivalintavaihtoehto_fi = 'Ei suorittanut' THEN NULL
		ELSE coalesce(numerovalinta, cast(replace(replace(vaihtoehto, 'kylla', '1'), 'ei', '0') as int), cast(replace(replace(vaihtoehto, 'kylla', '1'), 'ei', '0') as int)) 
	END as numerovalinta,
	v.kysymysid,
	k.kysymysversio
INTO ANTERO.dbo.temp_move_kysymys
FROM Arvo_SA.sa.sa_arvo_vastaukset_muut v
LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselyid = v.kyselyid
LEFT JOIN ARVO_SA.sa.sa_arvo_kysymykset k on k.kysymysid = v.kysymysid and k.kysymysversio = 1 --v.kysymysversio
WHERE kk.tyyppi = 'move' and kk.kyselykerta not like '%test%' and YEAR(v.vastausaika) >= 2024

TRUNCATE TABLE ANTERO.dw.f_arvo_move

INSERT INTO ANTERO.dw.f_arvo_move 
SELECT
	f.tilastovuosi,
	f.vastaajaid,
	f.d_organisaatioluokitus_id,
	f.d_arvovastaus_monivalinta_luokka_id,
	f.d_arvovastaus_monivalinta_sukupuoli_id,
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
	'ETL: p_lataa_f_arvo_move' as source
FROM (
	SELECT
		t.tilastovuosi,
		t.vastaajaid,
		d.id as d_organisaatioluokitus_id,
		k.id as d_arvovastaus_monivalinta_sukupuoli_id,
		l.id as d_arvovastaus_monivalinta_luokka_id,
		s.numerovalinta as suoritettu_soveltavasti,
		m1.numerovalinta as etunojapunnerrus,
		vj.kesto as viivajuoksu, 
		m3.numerovalinta as heitto_kiinniotto,
		m4.numerovalinta as ylavartalon_kohotus,
		m5.numerovalinta as olkapaiden_liikkuvuus_oikea,
		m6.numerovalinta as olkapaiden_liikkuvuus_vasen,
		m7.numerovalinta as vauhditon_5_loikka,
		m8.numerovalinta as alaselan_ojennus,
		m9.numerovalinta as kyykistys,
		CASE 
			WHEN m1.numerovalinta >= 90 THEN NULL
			WHEN m1.numerovalinta >= p1.alaraja3 THEN 3 
			WHEN m1.numerovalinta BETWEEN p1.alaraja2 and p1.ylaraja2 THEN 2
			WHEN m1.numerovalinta <= p1.ylaraja1 THEN 1
			ELSE NULL
		END as etunojapunnerrus_pisteet,
		CASE 
			WHEN vj.kesto >= 800 AND m2.numerovalinta >= 150 THEN NULL
			WHEN m2.numerovalinta >= p2.alaraja3 THEN 3 
			WHEN m2.numerovalinta BETWEEN p2.alaraja2 and p2.ylaraja2 THEN 2
			WHEN m2.numerovalinta <= p2.ylaraja1 THEN 1
			ELSE NULL
		END as viivajuoksu_pisteet,
		CASE 
			WHEN m3.numerovalinta >= p3.alaraja3 THEN 3 
			WHEN m3.numerovalinta BETWEEN p3.alaraja2 and p3.ylaraja2 THEN 2
			WHEN m3.numerovalinta <= p3.ylaraja1 THEN 1
			ELSE NULL
		END as heitto_kiinniotto_pisteet,
		CASE 
			WHEN m4.numerovalinta >= p4.alaraja3 THEN 3 
			WHEN m4.numerovalinta BETWEEN p4.alaraja2 and p4.ylaraja2 THEN 2
			WHEN m4.numerovalinta <= p4.ylaraja1 THEN 1
			ELSE NULL
		END as ylavartalon_kohotus_pisteet,
		-- Pyöristetään 1 desimaalin tarkkuudella, koska pisterajat ovat sillä tarkkuudella
		CASE 
			WHEN m7.numerovalinta >= 16 OR  m7.numerovalinta < 2.5 THEN NULL
			WHEN ROUND(m7.numerovalinta,1) >= p7.alaraja3 THEN 3 
			WHEN ROUND(m7.numerovalinta,1) BETWEEN p7.alaraja2 and p7.ylaraja2 THEN 2
			WHEN ROUND(m7.numerovalinta,1) <= p7.ylaraja1 THEN 1
			ELSE NULL
		END as vauhditon_5_loikka_pisteet,
		CASE WHEN m5.numerovalinta IS NULL THEN 1 ELSE 0 END + 
		CASE WHEN m6.numerovalinta IS NULL THEN 1 ELSE 0 END + 
		CASE WHEN m8.numerovalinta IS NULL THEN 1 ELSE 0 END +
		CASE WHEN m9.numerovalinta IS NULL THEN 1 ELSE 0 END as puuttuva_liikkuvuus
	FROM ANTERO.dbo.temp_move t
	LEFT JOIN ANTERO.dbo.temp_move_kysymys sp on t.vastaajaid = sp.vastaajaid and sp.kysymys_fi = 'Sukupuoli'
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.organisaatio_koodi = t.oppilaitoskoodi
	LEFT JOIN ANTERO.dw.d_arvovastaus_monivalinta k on k.kysymysid = sp.kysymysid and k.kysymysversio = sp.kysymysversio and k.koodi = sp.numerovalinta
	LEFT JOIN ANTERO.dbo.temp_move_kysymys lk on t.vastaajaid = lk.vastaajaid and lk.kysymys_fi = 'Luokka'
	LEFT JOIN ANTERO.dw.d_arvovastaus_monivalinta l on l.kysymysid = lk.kysymysid and l.kysymysversio = lk.kysymysversio and l.koodi = lk.numerovalinta
	LEFT JOIN ANTERO.dbo.temp_move_kysymys s on t.vastaajaid = s.vastaajaid and s.kysymys_fi = 'Suorittiko oppilas jonkun mittausosioista sovelletusti?'
	LEFT JOIN ANTERO.dbo.temp_move_kysymys m1 on t.vastaajaid = m1.vastaajaid and m1.kysymys_fi = 'Etunojapunnerrus (lukumäärä)'
	LEFT JOIN ANTERO.dbo.temp_move_kysymys m2 on t.vastaajaid = m2.vastaajaid and m2.kysymys_fi = '20 metrin viivajuoksu (viivojen lukumäärä)'
	LEFT JOIN ANTERO.dbo.temp_move_kysymys m3 on t.vastaajaid = m3.vastaajaid and m3.kysymys_fi = 'Heitto-kiinniotto (lukumäärä)'
	LEFT JOIN ANTERO.dbo.temp_move_kysymys m4 on t.vastaajaid = m4.vastaajaid and m4.kysymys_fi = 'Ylävartalon kohotus (lukumäärä)'
	LEFT JOIN ANTERO.dbo.temp_move_kysymys m5 on t.vastaajaid = m5.vastaajaid and m5.kysymys_fi = 'Olkapäiden liikkuvuus (oikea käsi ylhäällä)'
	LEFT JOIN ANTERO.dbo.temp_move_kysymys m6 on t.vastaajaid = m6.vastaajaid and m6.kysymys_fi = 'Olkapäiden liikkuvuus (vasen käsi ylhäällä)'
	LEFT JOIN ANTERO.dbo.temp_move_kysymys m7 on t.vastaajaid = m7.vastaajaid and m7.kysymys_fi = 'Vauhditon 5-loikka (metrejä, 2 desimaalia)'
	LEFT JOIN ANTERO.dbo.temp_move_kysymys m8 on t.vastaajaid = m8.vastaajaid and m8.kysymys_fi = 'Alaselän ojennus täysistunnassa'
	LEFT JOIN ANTERO.dbo.temp_move_kysymys m9 on t.vastaajaid = m9.vastaajaid and m9.kysymys_fi = 'Kyykistys'
	LEFT JOIN ANTERO.dw.d_move_viivajuoksu vj on vj.lukumaara = m2.numerovalinta
	LEFT JOIN ANTERO.dw.d_move_pisterajat p1 on p1.sukupuoli = k.vastaus_fi and p1.luokka = l.vastaus_fi and p1.mittari = 'etunojapunnerrus'
	LEFT JOIN ANTERO.dw.d_move_pisterajat p2 on p2.sukupuoli = k.vastaus_fi and p2.luokka = l.vastaus_fi and p2.mittari = 'viivajuoksu'
	LEFT JOIN ANTERO.dw.d_move_pisterajat p3 on p3.sukupuoli = k.vastaus_fi and p3.luokka = l.vastaus_fi and p3.mittari = 'heitto-kiinniotto'
	LEFT JOIN ANTERO.dw.d_move_pisterajat p4 on p4.sukupuoli = k.vastaus_fi and p4.luokka = l.vastaus_fi and p4.mittari = 'ylävartalon kohotus'
	LEFT JOIN ANTERO.dw.d_move_pisterajat p7 on p7.sukupuoli = k.vastaus_fi and p7.luokka = l.vastaus_fi and p7.mittari = 'vauhditon 5-loikka'
) f

DROP TABLE IF EXISTS ANTERO.dbo.temp_move
DROP TABLE IF EXISTS ANTERO.dbo.temp_move_kysymys
DROP INDEX IF EXISTS [NC_move] ON Arvo_SA.[sa].[sa_arvo_vastaukset_muut] 

EXEC dw.p_lataa_f_arvo_move_aida

GO

