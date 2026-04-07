USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_digikyvykkyys_uusi_api_testi]    Script Date: 16.3.2026 11.54.47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dw].[v_arvo_digikyvykkyys] AS

SELECT

														--AIKAMUUTTUJAT
  d5.vuosi									AS 'Kyselyvuosi'
, d3b.kuukausi_fi							AS 'Vastauskuukausi'

														--KYSELYMUUTTUJAT
, d4.kysymys_fi								AS 'Kysymys'
, CASE
		WHEN d4.kysymys_fi = 'Tavoite tulevalle 1-3 vuodelle' THEN CONCAT(LEFT(d4b.kysymys_fi, charindex(' ', d4b.kysymys_fi)-1), ' ', d4.kysymys_fi)
		ELSE d4.kysymys_fi
  END as 'Kysymys (numeroitu)'
, d4.kysymysryhma_fi						AS 'Kysymysryhmä'
, COALESCE(NULLIF(d6.vastaus_fi,'Tieto puuttuu'),numerovalinta) AS 'Monivalintavaihtoehto' --ei-monivalintakysymyksissä näytetään numerovalinta
, d5.kysely_fi								AS 'Kysely'

														--MUUT
, d5.kyselyid
, d4.kysymysid
, f.vastaajaid
, d6.koodi									AS 'vastauskoodi'
, d4.vastaustyyppi							AS 'vastaustyyppi'
, d1.organisaatio_fi						AS 'Organisaatio'
, d2.maakunta_fi							AS 'Maakunta'
, d1.koulutuksen_jarjestajan_yritysmuoto    AS 'Yritysmuoto'
, d1.organisaatio_koodi						AS 'Y-tunnus'
, CASE
		WHEN f.sektori = 'ammatillinen' THEN 'Ammatillisen koulutuksen järjestäjä'
		WHEN f.sektori = 'lukio' THEN 'Lukiokoulutuksen järjestäjä'
		ELSE 'Tieto puuttuu'
	END AS 'Koulutuksen järjestäjän tyyppi'
									
, f.numerovalinta	

														--KOODIMUUTTUJAT

, d3b.kuukausi								AS 'Koodit Vastauskuukausi'     



														--JÄRJESTYSMUUTTUJAT


, COALESCE(NULLIF(d6.koodi,-1),numerovalinta) AS 'Järjestys monivalintavaihtoehto'
, d4.kysymysjarjestys  AS 'Järjestys kysymys' -- Varsinainen järjestys lasketulla sarakkeella
, d4.kysymysryhmajarjestys	AS 'Järjestys kysymysryhma'
, d3b.kuukausi								AS 'Järjestys vastauskuukausi'

FROM dw.f_arvo_digikyvykkyys AS f

LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_koulutustoimija_id									
LEFT JOIN dw.d_alueluokitus d2 on d2.id=f.d_alueluokitus_koulutustoimija_id																 
LEFT JOIN dw.d_kalenteri d3b ON f.d_kalenteri_vastaus_id = d3b.id
LEFT JOIN dw.d_arvokysymys d4 ON f.d_arvokysymys_id = d4.id
LEFT JOIN dw.d_arvokysymys d4b ON f.d_arvokysymys_2_id = d4b.id
LEFT JOIN dw.d_arvotiedonkeruu d5 ON f.kyselyid = d5.kyselyid
LEFT JOIN dw.d_arvovastaus_monivalinta_v2 d6 ON f.d_arvovastaus_monivalinta_id = d6.id