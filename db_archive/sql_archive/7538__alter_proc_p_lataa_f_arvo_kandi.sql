USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_kandi]    Script Date: 3.4.2023 9:21:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_arvo_kandi] AS

DROP TABLE IF EXISTS [dw].[f_arvo_kandi_MAIN_QUERY] --välitaulu
DROP TABLE IF EXISTS [sa].temp_arvo_kandi_uudetkysymykset
DROP TABLE IF EXISTS [sa].temp_arvo_kandi_taustat
;

--uudet kysymykset
select distinct f.kysymysid, f3.kysymysryhmaid, f4.jarjestys, f3.kysymys_fi, f3.kysymys_sv, f3.kysymys_en
into [sa].temp_arvo_kandi_uudetkysymykset 
from Arvo_SA.sa.sa_arvo_vastaukset as f
inner join Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid
inner join Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
inner join Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselykertaid = f.kyselykertaid
WHERE f5.kyselykerta_vuosi = 2021 and f5.tyyppi = 'kandipalaute' AND f3.taustakysymyksen_tyyppi is null
;

--taustat (indeksointi tarvittaessa)
select distinct a.kyselykertaid, a.vastaajaid, a.kysymysid, a.numerovalinta as koodi, b.taustakysymyksen_tyyppi 
into [sa].temp_arvo_kandi_taustat
from Arvo_SA.sa.sa_arvo_vastaukset a 
join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid 
join Arvo_SA.sa.sa_arvo_kyselykerrat c on c.kyselykertaid=a.kyselykertaid
where b.taustakysymyksen_tyyppi in ('sukupuoli','ika','pohjakoulutus')
and c.tyyppi = 'kandipalaute'
;

--välitaulu
SELECT k.oppilaitoskoodi
	,f.koulutustoimija
	,f2.tutkinto as tutkintokoodi
	,tk_sp.koodi as sp_koodi
	,tk_sp.kysymysid as sp_kysymysid
	,tk_ika.koodi as ika_koodi
	,tk_ika.kysymysid as ika_kysymysid
	,tk_pk.koodi as pk_koodi
	,tk_pk.kysymysid as pk_kysymysid
	,f2.kunta as kotikunta
	,k.vastaajatunnus_alkupvm
	,f.vastausaika
	,CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE -1 END as vastausid_monivalinta
	,f.numerovalinta
	,f.vastaajaid
	,f.kyselyid
	,f.kyselykertaid
	,CASE
		WHEN uk.kysymysid is not null THEN uk.kysymysid
		WHEN f3.kysymysid in('1088', '4069') THEN '11238'
		WHEN f3.kysymysid in('1115', '4084') THEN '11253'
		WHEN f3.kysymysid in('1117', '4086') THEN '11279'
		WHEN f3.kysymysid in('1120', '4089') THEN '11282'
		WHEN f3.kysymysid in('1143', '4093') THEN '11257'
		WHEN f3.kysymysid in('1132', '4111') THEN '11265'
		ELSE f3.kysymysid
		END as kysymysid
	--,f3.kysymysid as kysymysid
	,f3.kysymysid as kysymysid_rahoitusmalli
	,CASE 
		WHEN uk.kysymysryhmaid is not null THEN uk.kysymysryhmaid
		WHEN f3.kysymysid in('1088', '4069') THEN '1185'
		WHEN f3.kysymysid in('1115', '4084') THEN '1186'
		WHEN f3.kysymysid in('1117', '4086', '1120', '4089') THEN '1187'
		WHEN f3.kysymysid in('1143', '4093') THEN '1188'
		WHEN f3.kysymysid in('1132', '4111') THEN '1189'
		ELSE f3.kysymysryhmaid
		END as kysymysryhmaid
	--,f3.kysymysryhmaid as kysymysryhmaid
	,f3.kysymysryhmaid as kysymysryhmaid_rahoitusmalli
	,CASE 
		WHEN uk.kysymysryhmaid is not null THEN uk.jarjestys
		WHEN f3.kysymysid in('1088', '4069') THEN '1'
		WHEN f3.kysymysid in('1115', '4084') THEN '2'
		WHEN f3.kysymysid in('1117', '4086', '1120', '4089') THEN '3'
		WHEN f3.kysymysid in('1143', '4093') THEN '4'
		WHEN f3.kysymysid in('1132', '4111') THEN '5'
		ELSE f4.jarjestys
		END as kysymysryhmajarjestys
	--,f4.jarjestys as kysymysryhmajarjestys
	,f4.jarjestys as kysymysryhma_rahoitusmallijarjestys
	,k.suorituskieli as suorituskieli
	,f6.id as teema
	,'ETL: p_lataa_f_arvo_kandi' AS source

INTO [dw].[f_arvo_kandi_MAIN_QUERY]

FROM Arvo_SA.sa.sa_arvo_vastaukset as f
INNER JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot f2 on f2.vastaajatunnusid = f.vastaajatunnusid
LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet k on f2.vastaajatunnusid = k.vastaajatunnusid
INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid
INNER JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
INNER JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselyid = f4.kyselyid and f5.kyselykertaid = f.kyselykertaid
LEFT JOIN  Arvo_SA.sa.sa_arvo_teemat f6 on f6.koodi = f3.teema
--HENKILÖN TAUSTATIEDOT
LEFT JOIN [sa].temp_arvo_kandi_taustat tk_sp ON tk_sp.vastaajaid = f.vastaajaid AND tk_sp.kyselykertaid = f.kyselykertaid AND tk_sp.taustakysymyksen_tyyppi = 'sukupuoli'
LEFT JOIN [sa].temp_arvo_kandi_taustat tk_ika ON tk_ika.vastaajaid = f.vastaajaid AND tk_ika.kyselykertaid = f.kyselykertaid AND tk_ika.taustakysymyksen_tyyppi = 'ika'
LEFT JOIN [sa].temp_arvo_kandi_taustat tk_pk ON tk_pk.vastaajaid = f.vastaajaid AND tk_pk.kyselykertaid = f.kyselykertaid AND tk_pk.taustakysymyksen_tyyppi = 'pohjakoulutus'
--uudetkysymykset 
LEFT JOIN [sa].temp_arvo_kandi_uudetkysymykset uk ON uk.kysymys_fi = f3.kysymys_fi AND uk.kysymys_sv = f3.kysymys_sv AND uk.kysymys_en = f3.kysymys_en

WHERE f5.tyyppi = 'kandipalaute' 
AND f3.valtakunnallinen = 1 
AND f3.taustakysymyksen_tyyppi is null
AND f3.vastaustyyppi != 'vapaateksti'
;

DROP TABLE IF EXISTS [sa].temp_arvo_kandi_uudetkysymykset
DROP TABLE IF EXISTS [sa].temp_arvo_kandi_taustat
;

--insert
ALTER TABLE [dw].[f_arvo_kandi_testi] DROP CONSTRAINT IF EXISTS [PK__f_arvo_kandi_testi]

TRUNCATE TABLE dw.f_arvo_kandi_testi

INSERT INTO dw.f_arvo_kandi_testi (
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
	,d_arvokysymys_vanha_id
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
	,coalesce(d6b.id,-1) AS d_arvokysymys_vanha_id
	,coalesce(d7.id,-1) AS d_arvokyselykerta_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,coalesce(MAIN_QUERY.teema, -1) AS d_arvoteema_id
	,MAIN_QUERY.numerovalinta
	,MAIN_QUERY.vastaajaid
	,MAIN_QUERY.source

FROM [dw].[f_arvo_kandi_MAIN_QUERY] MAIN_QUERY

LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MAIN_QUERY.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = MAIN_QUERY.koulutustoimija
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = MAIN_QUERY.tutkintokoodi
LEFT JOIN dw.d_alueluokitus d4 ON d4.kunta_koodi = MAIN_QUERY.kotikunta
LEFT JOIN dw.d_kalenteri d5a ON d5a.kalenteri_avain = CAST(MAIN_QUERY.vastaajatunnus_alkupvm AS date)
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = CAST(MAIN_QUERY.vastausaika AS date)
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = MAIN_QUERY.kysymysryhmaid AND d6.kysymysid = MAIN_QUERY.kysymysid AND d6.kysymysryhmajarjestys = MAIN_QUERY.kysymysryhmajarjestys
LEFT JOIN dw.d_arvokysymys d6b ON d6b.kysymysryhmaid = MAIN_QUERY.kysymysryhmaid_rahoitusmalli AND d6b.kysymysid = MAIN_QUERY.kysymysid_rahoitusmalli AND d6b.kysymysryhmajarjestys = MAIN_QUERY.kysymysryhma_rahoitusmallijarjestys
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = MAIN_QUERY.kyselykertaid
LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.koodi = MAIN_QUERY.sp_koodi and d8.kysymysid = MAIN_QUERY.sp_kysymysid
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.koodi = MAIN_QUERY.ika_koodi and d10.kysymysid = MAIN_QUERY.ika_kysymysid
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.koodi = MAIN_QUERY.pk_koodi and d11.kysymysid = MAIN_QUERY.pk_kysymysid
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MAIN_QUERY.numerovalinta and d15.kysymysid = MAIN_QUERY.kysymysid_rahoitusmalli
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MAIN_QUERY.suorituskieli
;


ALTER TABLE [dw].[f_arvo_kandi_testi] ADD  CONSTRAINT [PK__f_arvo_kandi_testi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]


DROP TABLE IF EXISTS [dw].[f_arvo_kandi_MAIN_QUERY]

GO

USE [ANTERO]