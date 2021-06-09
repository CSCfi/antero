

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_arvo_digikyvykkyys]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_arvo_digikyvykkyys] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_arvo_digikyvykkyys] AS


TRUNCATE TABLE dw.f_arvo_digikyvykkyys

INSERT INTO dw.f_arvo_digikyvykkyys (
	 d_organisaatio_koulutustoimija_id
	,d_alueluokitus_koulutustoimija_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,numerovalinta
	,vastaajaid
	,source
)

SELECT 
	 coalesce(d1b.id,-1) AS d_organisaatio_koulutustoimija_id
	,coalesce(d2b.id,-1) AS d_alueluokitus_koulutustoimija_id
	,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d7.id,-1) AS d_arvokyselykerta_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,MAIN_QUERY.numerovalinta
	,MAIN_QUERY.vastaajaid
	,MAIN_QUERY.source
FROM (

	SELECT 
		 f6.koulutustoimija
		,f.vastausaika
		,CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE -1 END as vastausid_monivalinta
		,f.numerovalinta
		,f.vastaajaid
		,f.kyselyid
		,f5.kyselykertaid
		,f3.kysymysid
		,f3.kysymysryhmaid
		,f4.jarjestys as kysymysryhmajarjestys
		,'ETL: p_lataa_f_arvo_digikyvykkyys' AS source
	FROM Arvo_SA.sa.sa_arvo_vastaukset as f
	INNER JOIN Arvo_SA.sa.sa_arvo_vastaajat f2 on f2.vastaajaid = f.vastaajaid
	INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid
	INNER JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
	INNER JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselyid = f4.kyselyid and f5.kyselykertaid = f.kyselykertaid
	LEFT JOIN Arvo_SA.sa.sa_virta_taustatiedot f6 on f6.vastaajaid = f.vastaajaid

	WHERE f5.tyyppi = 'itsearviointi' 
	AND f3.valtakunnallinen = 1 
	AND f3.taustakysymyksen_tyyppi is null


) MAIN_QUERY

LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_koodi = MAIN_QUERY.koulutustoimija
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = CAST(MAIN_QUERY.vastausaika AS date)
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = MAIN_QUERY.kysymysryhmaid AND d6.kysymysid = MAIN_QUERY.kysymysid AND d6.kysymysryhmajarjestys = MAIN_QUERY.kysymysryhmajarjestys
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = MAIN_QUERY.kyselykertaid
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MAIN_QUERY.numerovalinta and d15.kysymysid = MAIN_QUERY.kysymysid




GO


