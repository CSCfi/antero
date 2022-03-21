USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amis]    Script Date: 7.5.2019 16:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_arvo_amis] AS


TRUNCATE TABLE dw.f_arvo_amis

INSERT INTO dw.f_arvo_amis (
	 d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_arvovastaus_taustakysymys_sukupuoli_id 
	,d_arvovastaus_taustakysymys_aidinkieli_id 
	,d_arvovastaus_taustakysymys_ika_id
	,d_arvovastaus_taustakysymys_hakeutumisvayla_id 
	,d_oppisopimuskoulutus_id
	,d_arvovastaus_taustakysymys_arvio_tilanteesta_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,numerovalinta
	,vastaajaid
	,d_suoritus_kieli_id
	,source
)

SELECT 
     coalesce(d1a.id,-1) AS d_organisaatio_oppilaitos_id
	,coalesce(d1b.id,-1) AS d_organisaatio_koulutustoimija_id
	,coalesce(d2a.id,-1) AS d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id,-1) AS d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id,-1) AS d_koulutusluokitus_id
	,coalesce(d8.id,-1) AS d_arvovastaus_taustakysymys_sukupuoli_id
	,coalesce(d9.id,-1) AS d_arvovastaus_taustakysymys_aidinkieli_id
	,coalesce(d10.id,-1) AS d_arvovastaus_taustakysymys_ika_id
	,coalesce(d11.id,-1) as d_arvovastaus_taustakysymys_hakeutumisvayla_id
	,coalesce(d13.id,-1) as d_oppisopimuskoulutus_id
	,coalesce(d14.id,-1) as d_arvovastaus_taustakysymys_arvio_tilanteesta_id
	,coalesce(d4.id,-1) AS d_alueluokitus_henkilon_kotikunta_id
	,coalesce(d5.id,-1) AS d_kalenteri_tunnus_luotu_id
	,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d7.id,-1) AS d_arvokyselykerta_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,MAIN_QUERY.numerovalinta
	,MAIN_QUERY.vastaajaid
	,coalesce(d16.id, -1) as d_suoritus_kieli_id
	,MAIN_QUERY.source

FROM (

	SELECT 
		 f2.oppilaitoskoodi
		,f.koulutustoimija
		,f2.tutkintokoodi
		,tk_sp.koodi as sp_koodi
		,tk_sp.kysymysid as sp_kysymysid
		,tk_ak.koodi as ak_koodi
		,tk_ak.kysymysid as ak_kysymysid
		,tk_ika.koodi as ika_koodi
		,tk_ika.kysymysid as ika_kysymysid
		,tk_hv.koodi as hv_koodi
		,tk_hv.kysymysid as hv_kysymysid
		,tk_oppis.koodi as oppis_koodi
		,tk_oppis.kysymysid as oppis_kysymysid
		,tk_arvio.koodi as arvio_koodi
		,tk_arvio.kysymysid as arvio_kysymysid
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
		,'ETL: p_lataa_f_arvo_amis' AS source

	FROM Arvo_SA.sa.sa_arvo_vastaukset as f
	LEFT JOIN Arvo_SA.sa.sa_arvo_vastaajat f2 on f2.vastaajaid = f.vastaajaid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselyid = f4.kyselyid and f5.kyselykertaid = f.kyselykertaid
	--HENKILÖN TAUSTATIEDOT
	LEFT JOIN (
		select distinct 
			 kyselyid
			,kyselykertaid
			,vastaajaid
			,a.kysymysid
			,numerovalinta as koodi
		 from Arvo_SA.sa.sa_arvo_vastaukset a 
		 inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid 
		 where b.taustakysymyksen_tyyppi = 'sukupuoli'
	) AS tk_sp ON tk_sp.vastaajaid = f.vastaajaid AND tk_sp.kyselykertaid = f.kyselykertaid

	LEFT JOIN (
		select distinct 
			 kyselyid
			,kyselykertaid
			,vastaajaid
			,a.kysymysid
			,numerovalinta as koodi
		 from Arvo_SA.sa.sa_arvo_vastaukset a 
		 inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid 
		 where b.taustakysymyksen_tyyppi = 'aidinkieli'
	) AS tk_ak ON tk_ak.vastaajaid = f.vastaajaid AND tk_ak.kyselykertaid = f.kyselykertaid

	LEFT JOIN (
		select distinct 
			 kyselyid
			,kyselykertaid
			,vastaajaid
			,a.kysymysid
			,numerovalinta as koodi
		 from Arvo_SA.sa.sa_arvo_vastaukset a 
		 inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid 
		 where b.taustakysymyksen_tyyppi = 'ika'
	) AS tk_ika ON tk_ika.vastaajaid = f.vastaajaid AND tk_ika.kyselykertaid = f.kyselykertaid

	LEFT JOIN (
		select distinct 
			 kyselyid
			,kyselykertaid
			,vastaajaid
			,a.kysymysid
			,numerovalinta as koodi
		 from Arvo_SA.sa.sa_arvo_vastaukset a 
		 inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid 
		 where b.taustakysymyksen_tyyppi = 'hakeutumisvayla'
	) AS tk_hv ON tk_hv.vastaajaid = f.vastaajaid AND tk_hv.kyselykertaid = f.kyselykertaid

	LEFT JOIN (
		select distinct 
			 kyselyid
			,kyselykertaid
			,vastaajaid
			,a.kysymysid
			,case vaihtoehto when 'ei' then 0 when 'kylla' then 1 else 0 end as koodi
		 from Arvo_SA.sa.sa_arvo_vastaukset a 
		 inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid 
		 where b.taustakysymyksen_tyyppi = 'oppisopimuskoulutus'
	) AS tk_oppis ON tk_oppis.vastaajaid = f.vastaajaid AND tk_oppis.kyselykertaid = f.kyselykertaid

	LEFT JOIN (
		select distinct 
			 kyselyid
			,kyselykertaid
			,vastaajaid
			,a.kysymysid
			,numerovalinta as koodi
		 from Arvo_SA.sa.sa_arvo_vastaukset a 
		 inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid 
		 where b.taustakysymyksen_tyyppi = 'arvio_tulevaisuudesta'
	) AS tk_arvio ON tk_arvio.vastaajaid = f.vastaajaid AND tk_arvio.kyselykertaid = f.kyselykertaid

	WHERE f5.tyyppi = 'amispalaute' 
	AND valtakunnallinen = 1 
	AND (case when f3.taustakysymyksen_tyyppi in ('kiusaaminen','kiusaamiseen_puuttuminen') then null else f3.taustakysymyksen_tyyppi end) is null
	AND vastaustyyppi != 'vapaateksti'
	AND f5.kyselypohja_tarkenne not like '%pilotti%'


) MAIN_QUERY

LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MAIN_QUERY.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = MAIN_QUERY.koulutustoimija
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_avain like 'koulutus_%' and d3.koulutusluokitus_koodi = MAIN_QUERY.tutkintokoodi
LEFT JOIN dw.d_alueluokitus d4 ON d4.alueluokitus_avain like 'kunta_%' and d4.kunta_koodi = MAIN_QUERY.kotikunta
LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = MAIN_QUERY.vastaajatunnus_alkupvm
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = MAIN_QUERY.vastausaika
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = MAIN_QUERY.kysymysryhmaid AND d6.kysymysid = MAIN_QUERY.kysymysid AND d6.kysymysryhmajarjestys = MAIN_QUERY.kysymysryhmajarjestys
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = MAIN_QUERY.kyselykertaid
LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.koodi = MAIN_QUERY.sp_koodi and d8.kysymysid = MAIN_QUERY.sp_kysymysid
LEFT JOIN dw.d_arvovastaus_taustakysymys d9 ON d9.koodi = MAIN_QUERY.ak_koodi and d9.kysymysid = MAIN_QUERY.ak_kysymysid
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.koodi = MAIN_QUERY.ika_koodi and d10.kysymysid = MAIN_QUERY.ika_kysymysid
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.koodi = MAIN_QUERY.hv_koodi and d11.kysymysid = MAIN_QUERY.hv_kysymysid
LEFT JOIN dw.d_oppisopimuskoulutus d13 ON d13.koodi = MAIN_QUERY.oppis_koodi --and d13.kysymysid = MAIN_QUERY.oppis_kysymysid
LEFT JOIN dw.d_arvovastaus_taustakysymys d14 ON d14.koodi = MAIN_QUERY.arvio_koodi and d14.kysymysid = MAIN_QUERY.arvio_kysymysid
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MAIN_QUERY.numerovalinta and d15.kysymysid = MAIN_QUERY.kysymysid
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MAIN_QUERY.suorituskieli

