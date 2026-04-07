USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_yo_uraseuranta]    Script Date: 16.3.2026 11.49.02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dw].[p_lataa_f_arvo_yo_uraseuranta] AS

TRUNCATE TABLE dw.f_arvo_yo_uraseuranta

INSERT INTO dw.f_arvo_yo_uraseuranta (
	tilastovuosi,
	vastaajaid,
	numerovalinta,
	rahoituskysymys_paino,
	d_arvotiedonkeruu_id,
	d_arvokysymys_id,
	d_organisaatioluokitus_id,
	d_koulutusluokitus_id,
	d_sukupuoli_id,
	d_ika_id,
	d_kieli_aidinkieli_id,
	d_maatjavaltiot2_kansalaisuus_id,
	d_arvovastaus_monivalinta_id,
	d_kytkin_vaihtoehto_id,
	d_virta_rahoituslahde_id,
	source
)
SELECT * FROM (
	SELECT 
		d1.vuosi as tilastovuosi,
		s.vastaajaid,
		-- Korjaus rahoitusmallikysymysten vastausasteikkoon ja vapaatekstivastausten siistimistä
		CASE
			WHEN s.kysymysid in (2922,2924,2953,2954) THEN s.numerovalinta + 1
			WHEN s.kysymysid = 2930 THEN 
				CASE 
					WHEN CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) > 3 
						 THEN 3 
					ELSE CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) 
				END
			WHEN s.kysymysid in (2928,2931) THEN 
				CASE 
					WHEN CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) > 5 
						 THEN 5 
					ELSE CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) 
				END
			WHEN s.kysymysid = 2948 THEN 
				CASE 
					WHEN CAST(s.vapaateksti AS INT)	< 1 OR	CAST(s.vapaateksti AS INT) > 14 THEN NULL
					ELSE CAST(s.vapaateksti AS INT)
				END
			WHEN s.kysymysid = 3108 THEN 
				CASE 
					WHEN CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)	< 1 OR	CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) > 11 THEN NULL
					ELSE CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)
				END
			WHEN s.kysymysid = 3143 THEN 
				CASE 
					WHEN CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)	< 1 OR	CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) > 15 THEN NULL
					ELSE CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)
				END
			WHEN s.kysymysid in (3208,3209) THEN 
				CASE 
					WHEN CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)	< 1 OR	CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) > 13 THEN NULL
					ELSE CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)
				END
			ELSE s.numerovalinta
		END as numerovalinta,
		CASE
			WHEN d2.rahoitusmallikysymys = 1 and d2.kysymysryhma_fi like '%TYÖ JA OSAAMINEN%' THEN 1.000000 / 6.000000
			WHEN d2.rahoitusmallikysymys = 1 THEN 1
			ELSE 0
		END as rahoituskysymys_paino,
		d1.id as d_arvotiedonkeruu_id,
		d2.id as d_arvokysymys_id,
		coalesce(d3.id,-1) as d_organisaatioluokitus_id,
		coalesce(d9.id,-1) as d_koulutusluokitus_id,
		coalesce(d4.id,-1) as d_sukupuoli_id,
		coalesce(d5.id,-1) as d_ika_id,
		coalesce(d6.id,-1) as d_kieli_aidinkieli_id,
		coalesce(d7.id,-1) as d_maatjavaltiot2_kansalaisuus_id,
		coalesce(d10.id,-1) as d_arvovastaus_monivalinta_id,
		coalesce(d8.id,-1) as d_kytkin_vaihtoehto_id,
		-1 as d_virta_rahoituslahde_id,
		'ETL: p_lataa_f_arvo_uraseuranta' as source
	FROM ANTERO.sa.sa_arvo_uraseuranta as s
	LEFT JOIN ANTERO.dw.d_arvotiedonkeruu d1 on d1.kyselyid = s.kyselyid
	LEFT JOIN ANTERO.dw.d_arvokysymys d2 on d2.kysymysid = s.kysymysid and d2.kyselyid = s.kyselyid and d2.kysymysversio = 1 and rnk = 1
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 on d3.organisaatio_koodi = s.valmistavan_koulutuksen_oppilaitos
	LEFT JOIN ANTERO.dw.d_sukupuoli d4 on d4.sukupuoli_koodi = s.[taustatiedot.sukupuoli]
	LEFT JOIN ANTERO.dw.d_ika d5 on d5.ika_avain = s.[taustatiedot.ika_valmistuessa]
	LEFT JOIN ANTERO.dw.d_kieli d6 on d6.kieli_koodi = s.[taustatiedot.aidinkieli]
	LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d7 on d7.maatjavaltiot2_koodi = s.[taustatiedot.kansalaisuus]
	LEFT JOIN ANTERO.dw.d_kytkin d8 on d8.kytkin_koodi = cast(s.vaihtoehto as int)
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d9 on d9.koulutusluokitus_koodi = s.tutkintotunnus
	LEFT JOIN ANTERO.dw.d_arvovastaus_monivalinta d10 on d10.kysymysid = s.kysymysid and d10.koodi = CASE 
																											WHEN s.kysymysid = 2930 THEN 
																												CASE 
																													WHEN CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) > 3 
																															THEN 3 
																													ELSE CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) 
																												END
																											WHEN s.kysymysid in (2928,2931) THEN 
																												CASE 
																													WHEN CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) > 5 
																															THEN 5 
																													ELSE CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) 
																												END
																											WHEN s.kysymysid = 2948 THEN 
																												CASE 
																													WHEN CAST(s.vapaateksti AS INT)	< 1 OR	CAST(s.vapaateksti AS INT) > 14 THEN NULL
																													ELSE CAST(s.vapaateksti AS INT)
																												END
																											WHEN s.kysymysid = 3108 THEN 
																												CASE 
																													WHEN CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)	< 1 OR	CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) > 11 THEN NULL
																													ELSE CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)
																												END
																											WHEN s.kysymysid = 3143 THEN 
																												CASE 
																													WHEN CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)	< 1 OR	CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) > 15 THEN NULL
																													ELSE CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)
																												END
																											WHEN s.kysymysid in (3208,3209) THEN 
																												CASE 
																													WHEN CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)	< 1 OR	CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT) > 13 THEN NULL
																													ELSE CAST(LEFT(s.vapaateksti, CHARINDEX('.', s.vapaateksti + '.') - 1) AS INT)
																												END
																											ELSE s.numerovalinta
																										END and d10.kysymysversio = d2.kysymysversio
	WHERE d1.vuosi = 2017 and d1.kyselytyyppi = 'yo-uraseuranta' and [taustatiedot.valmistumisvuosi] is not null and
	d2.id is not null and (d2.vastaustyyppi not in ('luku', 'vapaateksti') or (s.kysymysid in (2928,2930,2931,3208,3209,2948,3143,3108) and vapaateksti is not null)) and s.kysymysid not in (3212, 3027)
) f WHERE f.numerovalinta is not null

-- Data vuodesta 2018 alkaen temp-tauluun
DROP TABLE IF EXISTS ANTERO.sa.temp_yo_uraseuranta
SELECT 
	s.Kyselyvuosi as tilastovuosi,
	s.Index_vastaajaid as vastaajaid,
	CASE
		WHEN s.Kysymysnumero = 6794 THEN
			CASE LEFT(s.Vastaus_arvo,1)
				WHEN 'a' THEN 0
				WHEN 'b' THEN 1
				WHEN 'c' THEN 2
				WHEN 'd' THEN 3
				WHEN 'e' THEN 4
				WHEN 'f' THEN 5
			END
		WHEN s.Kysymysnumero in (6828,6933) THEN CAST(LEFT(s.Vastaus_arvo, CHARINDEX(' ', s.Vastaus_arvo + ' ') - 1) AS INT) - 1
		WHEN vastaus_asteikko.minimi > vastaus_asteikko2.minimi and vastaus_asteikko.maksimi > vastaus_asteikko2.maksimi THEN s.Vastaus_alkuperäinen - 1
		WHEN vastaus_asteikko.minimi < vastaus_asteikko2.minimi and vastaus_asteikko.maksimi < vastaus_asteikko2.maksimi THEN s.Vastaus_alkuperäinen + 1
		ELSE s.Vastaus_alkuperäinen
	END as [numerovalinta],
	round(cast(f2.ika_valmistuessa as float),0) as ika,
	round(cast(f2.sukupuoli as float),0) as sukupuoli,
	round(cast(f2.kansalaisuus as float),0) as kansalaisuus,
	round(cast(f2.koulutusalakoodi as float),0) as koulutusalakoodi,
	RIGHT(CONCAT('00000',s.organisaatio_koodi),5) as organisaatio_koodi,
	f2.rahoituslahde,
	f2.aidinkieli,
	k.kysymysversio,
	CASE
		WHEN k.rahoitusmallikysymys = 1 and k.kysymysryhma_fi like '%TYÖ JA OSAAMINEN%' then 1.000000 / 6.000000
		WHEN k.rahoitusmallikysymys = 1 THEN 1
		ELSE 0
	END	as rahoituskysymys_paino,
	tk.id as d_arvotiedonkeruu_id,
	k.id as d_arvokysymys_id,
	k.kysymysid,
	CASE 
		WHEN k.vastaustyyppi <> 'kylla_ei_valinta' THEN -1 
		WHEN Vastaus_arvo like '%Kyllä%' THEN 1 
		WHEN Vastaus_arvo like '%Ei%' THEN 0 
	END as vaihtoehto
INTO ANTERO.sa.temp_yo_uraseuranta
FROM [ANTERO].SA.sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit s
LEFT JOIN [ANTERO].sa.sa_arvo_yo_uraseuranta_taustatiedot f2 on f2.tunnus=s.Vastaajatunnus
OUTER APPLY (
	SELECT 
		MAX(id) as id,
		MAX(kyselyid) as kyselyid
	FROM ANTERO.dw.d_arvotiedonkeruu t
	WHERE t.kyselytyyppi = 'yo-uraseuranta' and t.kyselypohja_tarkenne_fi = s.Kyselypohja and t.vuosi = s.Kyselyvuosi
) tk
LEFT JOIN ANTERO.dw.d_arvokysymys k on k.kysymysid = s.Kysymysnumero and k.kyselyid = tk.kyselyid and k.rnk = 1
OUTER APPLY (
	SELECT 
		MIN(Vastaus_alkuperäinen) as minimi,
		MAX(Vastaus_alkuperäinen) as maksimi
	FROM [ANTERO].SA.sa_arvo_yo_uraseuranta_tohtorit_ja_maisterit s2
	WHERE s2.Kyselyvuosi = s.Kyselyvuosi and s2.Kysymysnumero = s.Kysymysnumero
) vastaus_asteikko
OUTER APPLY (
	SELECT 
		MIN(av.koodi) as minimi,
		MAX(av.koodi) as maksimi
	FROM [ANTERO].dw.d_arvovastaus_monivalinta av
	WHERE av.kysymysversio = k.kysymysversio and av.kysymysid = s.Kysymysnumero
) vastaus_asteikko2
WHERE
(
	k.kysymysryhma_fi not like '%Kiitos%' AND
	k.vastaustyyppi not in ('vapaateksti', 'luku')
)
OR
(
	k.kysymysid in (8240, 8242, 8254, 6923, 6921, 6935, 10255, 10257, 10269,  10253, 6830, 8391, 10144) AND 
	s.vastaus_arvo not like '%vaihtoehto ei koske minua%'
)

INSERT INTO dw.f_arvo_yo_uraseuranta (
	tilastovuosi,
	vastaajaid,
	numerovalinta,
	rahoituskysymys_paino,
	d_arvotiedonkeruu_id,
	d_arvokysymys_id,
	d_organisaatioluokitus_id,
	d_koulutusluokitus_id,
	d_sukupuoli_id,
	d_ika_id,
	d_kieli_aidinkieli_id,
	d_maatjavaltiot2_kansalaisuus_id,
	d_arvovastaus_monivalinta_id,
	d_kytkin_vaihtoehto_id,
	d_virta_rahoituslahde_id,
	source
)
SELECT 
	s.tilastovuosi,
	s.vastaajaid,
	s.numerovalinta,
	s.rahoituskysymys_paino,
	s.d_arvotiedonkeruu_id,
	s.d_arvokysymys_id,
	coalesce(d6.id,-1) as d_organisaatioluokitus_id,
	coalesce(d5.id,-1) as d_koulutusluokitus_id,
	coalesce(d2.id,-1) as d_sukupuoli_id,
	coalesce(d1.id,-1) as d_ika_id,
	coalesce(d3.id,-1) as d_kieli_aidinkieli_id,
	coalesce(d4.id,-1) as d_maatjavaltiot2_kansalaisuus_id,
	coalesce(d8.id,-1) as d_arvovastaus_monivalinta_id,
	coalesce(d9.id,-1) as d_kytkin_vaihtoehto_id,
	coalesce(d7.id,-1) as d_virta_rahoituslahde_id,
	'ETL: p_lataa_f_arvo_yo_uraseuranta' as source
FROM ANTERO.sa.temp_yo_uraseuranta s
LEFT JOIN dw.d_ika d1 on d1.ika_avain=s.ika	
LEFT JOIN dw.d_sukupuoli d2 on d2.sukupuoli_koodi = s.sukupuoli
LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = s.aidinkieli
LEFT JOIN dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi = s.kansalaisuus
LEFT JOIN dw.d_koulutusluokitus d5 on d5.koulutusluokitus_koodi = s.koulutusalakoodi
LEFT JOIN dw.d_organisaatioluokitus d6 on d6.organisaatio_koodi = s.organisaatio_koodi
LEFT JOIN dw.d_virta_rahoituslahde d7 on d7.rahoituslahde_koodi = s.rahoituslahde
LEFT JOIN ANTERO.dw.d_arvovastaus_monivalinta d8 on d8.koodi = s.numerovalinta and d8.kysymysversio = s.kysymysversio and d8.kysymysid = s.kysymysid
LEFT JOIN ANTERO.dw.d_kytkin d9 on d9.kytkin_koodi = s.vaihtoehto

DROP TABLE IF EXISTS ANTERO.sa.temp_yo_uraseuranta