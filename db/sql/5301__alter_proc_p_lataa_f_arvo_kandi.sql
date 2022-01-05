USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_kandi]    Script Date: 5.1.2022 14:42:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_arvo_kandi] AS


TRUNCATE TABLE dw.f_arvo_kandi

;WITH CTE AS (
	select distinct 
		 a.kyselykertaid
		,a.vastaajaid
		,a.kysymysid
		,a.numerovalinta as koodi
		,b.taustakysymyksen_tyyppi
	from Arvo_SA.sa.sa_arvo_vastaukset a 
	join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid 
	--join Arvo_SA.sa.sa_arvo_kyselykerrat c on c.kyselykertaid=a.kyselykertaid
	where b.taustakysymyksen_tyyppi in ('sukupuoli','ika','pohjakoulutus')
	--and c.tyyppi = 'kandipalaute'
)

INSERT INTO dw.f_arvo_kandi (
	 d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_kieli_suorituskieli_id
	,d_arvovastaus_taustakysymys_sukupuoli_id 
	,d_arvovastaus_taustakysymys_ika_id
	,d_arvovastaus_taustakysymys_pohjakoulutus_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,d_arvoteema_id
	,numerovalinta
	,vastaajaid
	,source
)

SELECT DISTINCT
     coalesce(d1a.id,-1) AS d_organisaatio_oppilaitos_id
	,coalesce(d1b.id,-1) AS d_organisaatio_koulutustoimija_id
	,coalesce(d2a.id,-1) AS d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id,-1) AS d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id,-1) AS d_koulutusluokitus_id
	,coalesce(d16.id, -1) as d_kieli_suorituskieli_id
	,coalesce(d8.id,-1) AS d_arvovastaus_taustakysymys_sukupuoli_id
	,coalesce(d10.id,-1) AS d_arvovastaus_taustakysymys_ika_id
	,coalesce(d11.id,-1) AS d_arvovastaus_taustakysymys_pohjakoulutus_id
	,coalesce(d4.id,-1) AS d_alueluokitus_henkilon_kotikunta_id
	,coalesce(d5a.id,-1) AS d_kalenteri_tunnus_luotu_id
	,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d7.id,-1) AS d_arvokyselykerta_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,coalesce(MAIN_QUERY.teema, -1) AS d_arvoteema_id
	,MAIN_QUERY.numerovalinta
	,MAIN_QUERY.vastaajaid
	,MAIN_QUERY.source
FROM (

	SELECT 
		 f2.oppilaitoskoodi
		,f.koulutustoimija
		,f2.tutkintokoodi
		,tk_sp.koodi as sp_koodi
		,tk_sp.kysymysid as sp_kysymysid
		,tk_ika.koodi as ika_koodi
		,tk_ika.kysymysid as ika_kysymysid
		,tk_pk.koodi as pk_koodi
		,tk_pk.kysymysid as pk_kysymysid
		,f2.kuntakoodi as kotikunta
		,f2.vastaajatunnus_alkupvm
		,f.vastausaika
		,CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE -1 END as vastausid_monivalinta
		,f.numerovalinta
		,f.vastaajaid
		,f.kyselyid
		,f.kyselykertaid
		,f3.kysymysid
		,f3.kysymysryhmaid
		,f4.jarjestys as kysymysryhmajarjestys
		,f2.suorituskieli
		,f6.id as teema
		,'ETL: p_lataa_f_arvo_kandi' AS source
	FROM Arvo_SA.sa.sa_arvo_vastaukset as f
	INNER JOIN Arvo_SA.sa.sa_arvo_vastaajat f2 on f2.vastaajaid = f.vastaajaid
	INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid
	INNER JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
	INNER JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselyid = f4.kyselyid and f5.kyselykertaid = f.kyselykertaid
	LEFT JOIN  Arvo_SA.sa.sa_arvo_teemat f6 on f6.koodi = f3.teema
	--HENKILÖN TAUSTATIEDOT
	LEFT JOIN (
		select * from CTE 
		where taustakysymyksen_tyyppi = 'sukupuoli'
	) AS tk_sp ON tk_sp.vastaajaid = f.vastaajaid AND tk_sp.kyselykertaid = f.kyselykertaid

	LEFT JOIN (
		select * from CTE 
		where taustakysymyksen_tyyppi = 'ika'
	) AS tk_ika ON tk_ika.vastaajaid = f.vastaajaid AND tk_ika.kyselykertaid = f.kyselykertaid

	LEFT JOIN (
		select * from CTE 
		where taustakysymyksen_tyyppi = 'pohjakoulutus'
	) AS tk_pk ON tk_pk.vastaajaid = f.vastaajaid AND tk_pk.kyselykertaid = f.kyselykertaid

	WHERE f5.tyyppi = 'kandipalaute' 
	AND f3.valtakunnallinen = 1 
	AND f3.taustakysymyksen_tyyppi is null
	AND f3.vastaustyyppi != 'vapaateksti'


) MAIN_QUERY

LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MAIN_QUERY.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = MAIN_QUERY.koulutustoimija
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = MAIN_QUERY.tutkintokoodi
LEFT JOIN dw.d_alueluokitus d4 ON d4.kunta_koodi = MAIN_QUERY.kotikunta
LEFT JOIN dw.d_kalenteri d5a ON d5a.kalenteri_avain = CAST(MAIN_QUERY.vastaajatunnus_alkupvm AS varchar(20))
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = CAST(MAIN_QUERY.vastausaika AS date)
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = MAIN_QUERY.kysymysryhmaid AND d6.kysymysid = MAIN_QUERY.kysymysid AND d6.kysymysryhmajarjestys = MAIN_QUERY.kysymysryhmajarjestys
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = MAIN_QUERY.kyselykertaid
LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.koodi = MAIN_QUERY.sp_koodi and d8.kysymysid = MAIN_QUERY.sp_kysymysid
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.koodi = MAIN_QUERY.ika_koodi and d10.kysymysid = MAIN_QUERY.ika_kysymysid
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.koodi = MAIN_QUERY.pk_koodi and d11.kysymysid = MAIN_QUERY.pk_kysymysid
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MAIN_QUERY.numerovalinta and d15.kysymysid = MAIN_QUERY.kysymysid
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MAIN_QUERY.suorituskieli




GO


USE [ANTERO]