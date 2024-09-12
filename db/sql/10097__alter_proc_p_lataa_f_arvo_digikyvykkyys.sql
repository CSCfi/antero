USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_digikyvykkyys]    Script Date: 12.9.2024 9:38:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_arvo_digikyvykkyys] AS

TRUNCATE TABLE dw.f_arvo_digikyvykkyys

INSERT INTO dw.f_arvo_digikyvykkyys (
	 tilastovuosi
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_koulutustoimija_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvokysymys_2_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,numerovalinta
	,vastaajaid
	,sektori
	,source
)
SELECT 
	YEAR(f.vastausaika) as tilastovuosi
	,coalesce(d1b.id,-1) AS d_organisaatio_koulutustoimija_id
	,coalesce(d2b.id,-1) AS d_alueluokitus_koulutustoimija_id
	,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d8.id,-1) AS d_arvokysymys_2_id
	,coalesce(d7.id,-1) AS d_arvokyselykerta_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,f.numerovalinta
	,f.vastaajaid
	,CASE WHEN YEAR(f.vastausaika) < 2024 THEN 'ammatillinen' ELSE f6.koulutussektori END as sektori
	,'ETL: p_lataa_f_arvo_digikyvykkyys' as source
FROM Arvo_SA.sa.sa_arvo_vastaukset_muut as f
OUTER APPLY (
	SELECT MAX(kysymysversio) as kysymysversio FROM Arvo_SA.sa.sa_arvo_kysymykset k
	WHERE k.kysymysid = f.kysymysid
) kv
OUTER APPLY (
	SELECT MAX(k2.kysymysryhmaid) as kysymysryhmaid FROM ANTERO.dw.d_arvokysymys k2
	WHERE k2.kysymysid = f.kysymysid and k2.kysymysversio = kv.kysymysversio
) kr
OUTER APPLY (
	SELECT MAX(kysymysversio) as kysymysversio FROM Arvo_SA.sa.sa_arvo_kysymykset k
	WHERE k.kysymysid = f.kysymysid - 1
) kv2
OUTER APPLY (
	SELECT MAX(k3.kysymysryhmaid) as kysymysryhmaid FROM ANTERO.dw.d_arvokysymys k3
	WHERE k3.kysymysid = f.kysymysid - 1 and k3.kysymysversio = kv2.kysymysversio
) kr2
INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid and f3.kysymysversio = kv.kysymysversio and f3.kysymysryhmaid = kr.kysymysryhmaid
INNER JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselyid = f.kyselyid
INNER JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot f6 on f6.vastaajatunnusid = f.vastaajatunnusid
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_koodi = f6.koulutustoimija
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = CAST(f.vastausaika AS date)
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysid = f.kysymysid AND d6.kysymysversio = kv.kysymysversio AND d6.kysymysryhmaid = kr.kysymysryhmaid
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = f5.kyselykertaid
LEFT JOIN dw.d_arvokysymys d8 ON d8.kysymysid = f.kysymysid - 1 AND d8.kysymysversio = kv2.kysymysversio AND d8.kysymysryhmaid = kr2.kysymysryhmaid
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = f.numerovalinta and d15.kysymysid = f.kysymysid AND d15.kysymysversio = f.kysymysversio
WHERE f5.tyyppi = 'digikyvykkyys' 
AND f3.valtakunnallinen = 1 
AND f3.taustakysymyksen_tyyppi is null

GO

USE [ANTERO]