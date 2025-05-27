USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_kandi]    Script Date: 14.3.2025 8.20.34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_arvo_kandi] AS

DROP TABLE IF EXISTS [dw].[f_arvo_kandi_MAIN_QUERY]
DROP TABLE IF EXISTS [sa].temp_arvo_kandi_taustat

--taustat (indeksointi tarvittaessa)
select distinct a.kyselyid, a.vastaajaid, a.kysymysid, a.kysymysversio, a.numerovalinta as koodi, b.taustakysymyksen_tyyppi 
into [sa].temp_arvo_kandi_taustat
from Arvo_SA.sa.sa_arvo_vastaukset_kandi a 
join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = b.kysymysversio
join Arvo_SA.sa.sa_arvo_kyselykerrat c on c.kyselyid = a.kyselyid
where b.taustakysymyksen_tyyppi in ('sukupuoli','ika','pohjakoulutus')
and c.tyyppi = 'kandipalaute'

--välitaulu
SELECT k.oppilaitoskoodi
	,f.koulutustoimija
	,f2.tutkinto as tutkintokoodi
	,tk_sp.koodi as sp_koodi
	,tk_sp.kysymysid as sp_kysymysid
	,tk_sp.kysymysversio as sp_kysymysversio
	,tk_ika.koodi as ika_koodi
	,tk_ika.kysymysid as ika_kysymysid
	,tk_ika.kysymysversio as ika_kysymysversio
	,tk_pk.koodi as pk_koodi
	,tk_pk.kysymysid as pk_kysymysid
	,tk_pk.kysymysversio as pk_kysymysversio
	,f2.kunta as kotikunta
	,k.vastaajatunnus_alkupvm
	,f.vastausaika
	,CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE -1 END as vastausid_monivalinta
	,f.numerovalinta
	,f.vastaajaid
	,f.kyselyid
	,f5.kyselykertaid
	,CASE
		WHEN f3.kysymysid in('1088', '4069') THEN '11238'
		WHEN f3.kysymysid in('1115', '4084') THEN '11253'
		WHEN f3.kysymysid in('1117', '4086') THEN '11279'
		WHEN f3.kysymysid in('1120', '4089') THEN '11282'
		WHEN f3.kysymysid in('1143', '4093') THEN '11257'
		WHEN f3.kysymysid in('1132', '4111') THEN '11265'
		ELSE f3.kysymysid
	END as kysymysid
	,CASE
		WHEN f3.kysymysid in ('1088', '4069','1115', '4084','1117', '4086','1120', '4089','1143', '4093','1132', '4111') THEN '1'
		ELSE f3.kysymysversio
	END as kysymysversio
	,f3.kysymysid as kysymysid_rahoitusmalli
	,f3.kysymysversio as kysymysversio_rahoitusmalli
	,CASE 
		WHEN f3.kysymysid in('1088', '4069') THEN '1185'
		WHEN f3.kysymysid in('1115', '4084') THEN '1186'
		WHEN f3.kysymysid in('1117', '4086', '1120', '4089') THEN '1187'
		WHEN f3.kysymysid in('1143', '4093') THEN '1188'
		WHEN f3.kysymysid in('1132', '4111') THEN '1189'
		ELSE f3.kysymysryhmaid
	END as kysymysryhmaid
	,f3.kysymysryhmaid as kysymysryhmaid_rahoitusmalli
	,CASE 
		WHEN f3.kysymysid in('1088', '4069') THEN '1'
		WHEN f3.kysymysid in('1115', '4084') THEN '2'
		WHEN f3.kysymysid in('1117', '4086', '1120', '4089') THEN '3'
		WHEN f3.kysymysid in('1143', '4093') THEN '4'
		WHEN f3.kysymysid in('1132', '4111') THEN '5'
		ELSE f4.jarjestys
	END as kysymysryhmajarjestys
	,f4.jarjestys as kysymysryhma_rahoitusmallijarjestys
	,k.suorituskieli as suorituskieli
	,f6.id as teema
	,f.vaihtoehto
	,f2.rahoituslahde
	,'ETL: p_lataa_f_arvo_kandi' AS source

INTO [dw].[f_arvo_kandi_MAIN_QUERY]

FROM Arvo_SA.sa.sa_arvo_vastaukset_kandi f
LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot f2 on f2.vastaajatunnusid = f.vastaajatunnusid
LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet k on f2.vastaajatunnusid = k.vastaajatunnusid
LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid and f3.kysymysversio = f.kysymysversio
LEFT JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselyid = f4.kyselyid
LEFT JOIN  Arvo_SA.sa.sa_arvo_teemat f6 on f6.koodi = f3.teema

--HENKILÖN TAUSTATIEDOT
LEFT JOIN [sa].temp_arvo_kandi_taustat tk_sp ON tk_sp.vastaajaid = f.vastaajaid AND tk_sp.kyselyid = f.kyselyid AND tk_sp.taustakysymyksen_tyyppi = 'sukupuoli'
LEFT JOIN [sa].temp_arvo_kandi_taustat tk_ika ON tk_ika.vastaajaid = f.vastaajaid AND tk_ika.kyselyid = f.kyselyid AND tk_ika.taustakysymyksen_tyyppi = 'ika'
LEFT JOIN [sa].temp_arvo_kandi_taustat tk_pk ON tk_pk.vastaajaid = f.vastaajaid AND tk_pk.kyselyid = f.kyselyid AND tk_pk.taustakysymyksen_tyyppi = 'pohjakoulutus'

WHERE f5.tyyppi = 'kandipalaute' 
AND f3.valtakunnallinen = 1 
AND f3.taustakysymyksen_tyyppi is null
AND f3.vastaustyyppi not in ('vapaateksti', 'luku')


--insert
ALTER TABLE [dw].[f_arvo_kandi] DROP CONSTRAINT IF EXISTS [PK__f_arvo_kandi]

TRUNCATE TABLE dw.f_arvo_kandi

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
	,d_arvokysymys_vanha_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,d_arvoteema_id
	,d_virta_rahoituslahde_id
	,numerovalinta
	,d_arvovaihtoehto_id
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
	,coalesce(MQ.teema, -1) AS d_arvoteema_id
	,coalesce(d18.id,-1) as d_virta_rahoituslahde_id
	,MQ.numerovalinta
	,d17.id as d_arvovaihtoehto_id
	,MQ.vastaajaid
	,MQ.source
FROM [dw].[f_arvo_kandi_MAIN_QUERY] MQ
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MQ.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = MQ.koulutustoimija
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = MQ.tutkintokoodi
LEFT JOIN dw.d_alueluokitus d4 ON d4.kunta_koodi = MQ.kotikunta
LEFT JOIN dw.d_kalenteri d5a ON d5a.kalenteri_avain = CAST(MQ.vastaajatunnus_alkupvm AS date)
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = CAST(MQ.vastausaika AS date)
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = MQ.kysymysryhmaid AND d6.kysymysid = MQ.kysymysid AND d6.kysymysryhmajarjestys = MQ.kysymysryhmajarjestys AND d6.kysymysversio = MQ.kysymysversio
LEFT JOIN dw.d_arvokysymys d6b ON d6b.kysymysryhmaid = MQ.kysymysryhmaid_rahoitusmalli AND d6b.kysymysid = MQ.kysymysid_rahoitusmalli AND d6b.kysymysryhmajarjestys = MQ.kysymysryhma_rahoitusmallijarjestys AND d6b.kysymysversio = MQ.kysymysversio_rahoitusmalli
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = MQ.kyselykertaid
LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.koodi = MQ.sp_koodi and d8.kysymysid = MQ.sp_kysymysid and d8.kysymysversio = MQ.sp_kysymysversio
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.koodi = MQ.ika_koodi and d10.kysymysid = MQ.ika_kysymysid and d10.kysymysversio = MQ.ika_kysymysversio
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.koodi = MQ.pk_koodi and d11.kysymysid = MQ.pk_kysymysid and d11.kysymysversio = MQ.pk_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MQ.numerovalinta and d15.kysymysid = MQ.kysymysid_rahoitusmalli and d15.kysymysversio = MQ.kysymysversio_rahoitusmalli
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MQ.suorituskieli
LEFT JOIN dw.d_arvovaihtoehto d17 ON d17.vastaus_koodi = MQ.vaihtoehto
LEFT JOIN dw.d_virta_rahoituslahde d18 on d18.rahoituslahde_koodi = MQ.rahoituslahde

-- Tallennetaan kyselykerta + koulutusluokitusparit temp-tauluun
DROP TABLE IF EXISTS ANTERO.dbo.arvo_kandi_temp
SELECT DISTINCT concat(d_arvokyselykerta_id,'_',d_koulutusluokitus_id, '_', d_kalenteri_tunnus_luotu_id) as avain 
INTO ANTERO.dbo.arvo_kandi_temp
FROM ANTERO.dw.f_arvo_kandi

-- Generoidaan niiden kyselykertojen tiedot joilta ei ole vastaajia
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
	,d_arvokysymys_vanha_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,d_arvoteema_id
	,d_virta_rahoituslahde_id
	,numerovalinta
	,d_arvovaihtoehto_id
	,vastaajaid
	,source
)

SELECT DISTINCT
	 coalesce(d1a.id, '-1') as d_organisaatio_oppilaitos_id
	,coalesce(d1b.id, '-1') as d_organisaatio_koulutustoimija_id
	,coalesce(d2a.id, '-1') as d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id, '-1') as d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id, '-1') as d_koulutusluokitus_id
	,'-1' as d_kieli_suorituskieli_id
	,'-1' as d_arvovastaus_taustakysymys_sukupuoli_id 
	,'-1' as d_arvovastaus_taustakysymys_ika_id
	,'-1' as d_arvovastaus_taustakysymys_pohjakoulutus_id
	,'-1' as d_alueluokitus_henkilon_kotikunta_id
	,coalesce(d5.id, '-1') as d_kalenteri_tunnus_luotu_id
	,'-1' as d_kalenteri_vastaus_id
	,'-1' as d_arvokysymys_id
	,'-1' as d_arvokysymys_vanha_id
	,coalesce(d4.id, '-1') as d_arvokyselykerta_id
	,'-1' as d_arvovastaus_monivalinta_id
	,'-1' as d_arvoteema_id
	,'-1' as d_virta_rahoituslahde_id
	,NULL as numerovalinta
	,NULL as d_arvovaihtoehto_id
	,NULL as vastaajaid
	,'ETL: p_lataa_f_arvo_kandi' as source
	
FROM [Arvo_SA].[sa].[sa_arvo_kohteet] vt
INNER JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid = vt.kyselykertaid
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = vt.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_oid = d1a.ylaorganisaatio_oid
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = vt.tutkintokoodi
LEFT JOIN dw.d_arvokyselykerta d4 on d4.kyselykertaid = vt.kyselykertaid
LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain = vt.vastaajatunnus_alkupvm
WHERE oppilaitoskoodi is not null 
and kk.tyyppi = 'kandipalaute' 
and kk.kyselykerta_vuosi is not null 
and YEAR(vt.vastaajatunnus_alkupvm) >= 2018
and concat(d4.id, '_', d3.id, '_', d5.id) not in (SELECT avain FROM ANTERO.dbo.arvo_kandi_temp)

DROP TABLE IF EXISTS ANTERO.dbo.arvo_kandi_temp

ALTER TABLE [dw].[f_arvo_kandi] ADD  CONSTRAINT [PK__f_arvo_kandi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]


DROP TABLE IF EXISTS [dw].[f_arvo_kandi_MAIN_QUERY]
DROP TABLE IF EXISTS [sa].temp_arvo_kandi_uudetkysymykset
DROP TABLE IF EXISTS [sa].temp_arvo_kandi_taustat

EXEC dw.p_lataa_f_indikaattorit_kk_kandipalaute

GO

USE [ANTERO]