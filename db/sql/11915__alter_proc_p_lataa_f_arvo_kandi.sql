USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_kandi]    Script Date: 16.3.2026 11.46.00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_f_arvo_kandi] AS

DROP TABLE IF EXISTS [dw].[f_arvo_kandi_MAIN_QUERY]
DROP TABLE IF EXISTS [sa].temp_arvo_kandi_taustat

--taustat (indeksointi tarvittaessa)
SELECT	
	a.kyselyid, 
	a.vastaajaid, 
	a.kysymysid, 
	a.kysymysversio, 
	a.numerovalinta as koodi, 
	b.taustakysymyksen_tyyppi
INTO [sa].temp_arvo_kandi_taustat
FROM Arvo_SA.[sa].[sa_arvo_v2_vastaukset_kandi] a
join Arvo_SA.sa.sa_arvo_v2_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = a.kysymysversio and a.kyselyid = b.kyselyid
join Arvo_SA.sa.sa_arvo_v2_kyselyt c on c.kyselyid = a.kyselyid
where b.taustakysymyksen_tyyppi in ('sukupuoli', 'ika', 'pohjakoulutus')
and c.kyselytyyppi = 'kandipalaute'

--välitaulu
SELECT
	RIGHT(f5.tiedonkeruu,4) as kyselyvuosi
	,f2.oppilaitoskoodi as oppilaitoskoodi
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
	,f2.voimassa_alkupvm as vastaajatunnus_alkupvm
	,f.vastausaika
	,CASE WHEN f3.kysymystyyppi = 'monivalinta' THEN f.vastausid ELSE -1 END as vastausid_monivalinta
	,f.numerovalinta
	,f.vastaajaid
	,CASE
		WHEN f3.kysymysid in ('1088','4069','1115','4084','1117','4086','1120','4089','1143','4093','1132','4111') THEN '7807'
		ELSE f.kyselyid
	END as kyselyid
	,f.kyselyid as kyselyid_rahoitusmalli
	,CASE
		WHEN f3.kysymysid in ('1088', '4069') THEN '11238'
		WHEN f3.kysymysid in ('1115', '4084') THEN '11253'
		WHEN f3.kysymysid in ('1117', '4086') THEN '11279'
		WHEN f3.kysymysid in ('1120', '4089') THEN '11282'
		WHEN f3.kysymysid in ('1143', '4093') THEN '11257'
		WHEN f3.kysymysid in ('1132', '4111') THEN '11265'
		ELSE f3.kysymysid
	END as kysymysid
	,CASE
		WHEN f3.kysymysid in ('1088','4069','1115','4084','1117','4086','1120','4089','1143','4093','1132','4111') THEN 1
		ELSE f3.kysymysversio
	END as kysymysversio
	,f3.kysymysid as kysymysid_rahoitusmalli
	,f3.kysymysversio as kysymysversio_rahoitusmalli
	,f2.suorituskieli as suorituskieli
	,f6.id as teema
	,f.vaihtoehto
	,f2.rahoituslahde
	,coalesce(f2.kansalaisuus,-1) as kansalaisuus
	,'ETL: p_lataa_f_arvo_kandi' AS source

INTO [dw].[f_arvo_kandi_MAIN_QUERY]

FROM Arvo_SA.sa.sa_arvo_v2_vastaukset_kandi f
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt f5 on f5.kyselyid = f.kyselyid
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset f2 on f2.vastaajatunnusid = f.vastaajatunnusid
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kysymykset f3 on f3.kysymysid = f.kysymysid and f3.kysymysversio = f.kysymysversio and f3.kyselyid = f.kyselyid
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kysymysryhmat f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
LEFT JOIN Arvo_SA.sa.sa_arvo_teemat f6 on f6.koodi = f3.teema
--HENKILÖN TAUSTATIEDOT
LEFT JOIN [sa].temp_arvo_kandi_taustat tk_sp ON tk_sp.vastaajaid = f.vastaajaid AND tk_sp.kyselyid = f.kyselyid AND tk_sp.taustakysymyksen_tyyppi = 'sukupuoli' 
LEFT JOIN [sa].temp_arvo_kandi_taustat tk_ika ON tk_ika.vastaajaid = f.vastaajaid AND tk_ika.kyselyid = f.kyselyid AND tk_ika.taustakysymyksen_tyyppi = 'ika'
LEFT JOIN [sa].temp_arvo_kandi_taustat tk_pk ON tk_pk.vastaajaid = f.vastaajaid AND tk_pk.kyselyid = f.kyselyid AND tk_pk.taustakysymyksen_tyyppi = 'pohjakoulutus'

WHERE f4.kategoria in ('valinnainen','valtakunnallinen') AND
f3.taustakysymyksen_tyyppi is null and f3.kysymystyyppi not in ('vapaateksti', 'luku') AND
CAST(RIGHT(f5.tiedonkeruu,4) as int) >= 2022

--insert
ALTER TABLE [dw].[f_arvo_kandi] DROP CONSTRAINT IF EXISTS [PK__f_arvo_kandi]

TRUNCATE TABLE dw.f_arvo_kandi

INSERT INTO dw.f_arvo_kandi (
	kyselyvuosi
	,d_organisaatio_oppilaitos_id
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
	,kyselyid
	,d_arvovastaus_monivalinta_id
	,d_arvoteema_id
	,d_virta_rahoituslahde_id
	,d_maatjavaltiot2_kansalaisuus_id
	,numerovalinta
	,d_arvovaihtoehto_id
	,vastaajaid
	,source
)

SELECT DISTINCT
	MQ.kyselyvuosi
    ,coalesce(d1a.id,-1) AS d_organisaatio_oppilaitos_id
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
	,MQ.kyselyid_rahoitusmalli as kyselyid
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,coalesce(MQ.teema, -1) AS d_arvoteema_id
	,coalesce(d18.id,-1) as d_virta_rahoituslahde_id
	,coalesce(d19.id,-1) as d_maatjavaltiot2_kansalaisuus_id

	,MQ.numerovalinta
	,d17.id as d_arvovaihtoehto_id
	,MQ.vastaajaid
	,MQ.source
FROM [dw].[f_arvo_kandi_MAIN_QUERY] MQ
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MQ.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_oid = d1a.ylaorganisaatio_oid
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = MQ.tutkintokoodi
LEFT JOIN dw.d_alueluokitus d4 ON d4.kunta_koodi = MQ.kotikunta
LEFT JOIN dw.d_kalenteri d5a ON d5a.kalenteri_avain = CAST(MQ.vastaajatunnus_alkupvm AS date)
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = CAST(MQ.vastausaika AS date)
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysid = MQ.kysymysid AND d6.kyselyid = MQ.kyselyid and d6.rnk = 1 and d6.kysymysversio = MQ.kysymysversio
LEFT JOIN dw.d_arvokysymys d6b ON d6b.kysymysid = MQ.kysymysid_rahoitusmalli AND d6b.kyselyid = MQ.kyselyid_rahoitusmalli and d6b.rnk = 1 and d6b.kysymysversio = kysymysversio_rahoitusmalli
LEFT JOIN dw.d_arvovastaus_monivalinta d8 ON d8.koodi = MQ.sp_koodi and d8.kysymysid = MQ.sp_kysymysid and d8.kysymysversio = MQ.sp_kysymysversio 
LEFT JOIN dw.d_arvovastaus_monivalinta d10 ON d10.koodi = MQ.ika_koodi and d10.kysymysid = MQ.ika_kysymysid and d10.kysymysversio = MQ.ika_kysymysversio 
LEFT JOIN dw.d_arvovastaus_monivalinta d11 ON d11.koodi = MQ.pk_koodi and d11.kysymysid = MQ.pk_kysymysid and d11.kysymysversio = MQ.pk_kysymysversio 
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MQ.numerovalinta and d15.kysymysid = MQ.kysymysid_rahoitusmalli and d15.kysymysversio = d6b.kysymysversio
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MQ.suorituskieli
LEFT JOIN dw.d_arvovaihtoehto d17 ON d17.vastaus_koodi = MQ.vaihtoehto
LEFT JOIN dw.d_virta_rahoituslahde d18 on d18.rahoituslahde_koodi = MQ.rahoituslahde
LEFT JOIN dw.d_maatjavaltiot2 d19 on d19.maatjavaltiot2_koodi = MQ.kansalaisuus

-- Vuotta 2022 edeltävät tiedot

DROP TABLE IF EXISTS [dw].[f_arvo_kandi_MAIN_QUERY]
DROP TABLE IF EXISTS [sa].temp_arvo_kandi_taustat

--taustat (indeksointi tarvittaessa)
select distinct 
	a.kyselyid, 
	a.vastaajaid, 
	a.kysymysid, 
	a.kysymysversio, 
	a.numerovalinta as koodi, 
	b.taustakysymyksen_tyyppi 
into [sa].temp_arvo_kandi_taustat
from Arvo_SA.sa.sa_arvo_vastaukset_kandi a 
join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = b.kysymysversio
join Arvo_SA.sa.sa_arvo_kyselykerrat c on c.kyselyid = a.kyselyid
where b.taustakysymyksen_tyyppi in ('sukupuoli','ika','pohjakoulutus')
and c.tyyppi = 'kandipalaute' and c.kyselykerta_vuosi < 2022

--välitaulu
SELECT
	f5.kyselykerta_vuosi as kyselyvuosi
	,k.oppilaitoskoodi
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
	,CASE
		WHEN f3.kysymysid in ('1088','4069','1115','4084','1117','4086','1120','4089','1143','4093','1132','4111') THEN '7807'
		ELSE f.kyselyid
	END as kyselyid
	,f.kyselyid as kyselyid_rahoitusmalli
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
		WHEN f3.kysymysid in ('1088','4069','1115','4084','1117','4086','1120','4089','1143','4093','1132','4111') THEN 1
		ELSE f3.kysymysversio
	END as kysymysversio
	,f3.kysymysversio as kysymysverio_rahoitusmalli
	,f3.kysymysid as kysymysid_rahoitusmalli
	,k.suorituskieli as suorituskieli
	,f6.id as teema
	,f.vaihtoehto
	,f2.rahoituslahde
	,coalesce(f2.kansalaisuus,-1) as kansalaisuus
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
AND f5.kyselykerta_vuosi < 2022

INSERT INTO dw.f_arvo_kandi (
	kyselyvuosi
	,d_organisaatio_oppilaitos_id
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
	,kyselyid
	,d_arvovastaus_monivalinta_id
	,d_arvoteema_id
	,d_virta_rahoituslahde_id
	,d_maatjavaltiot2_kansalaisuus_id
	,numerovalinta
	,d_arvovaihtoehto_id
	,vastaajaid
	,source
)

SELECT DISTINCT
	MQ.kyselyvuosi
    ,coalesce(d1a.id,-1) AS d_organisaatio_oppilaitos_id
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
	,MQ.kyselyid_rahoitusmalli as kyselyid
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,coalesce(MQ.teema, -1) AS d_arvoteema_id
	,coalesce(d18.id,-1) as d_virta_rahoituslahde_id
	,coalesce(d19.id,-1) as d_maatjavaltiot2_kansalaisuus_id
	,MQ.numerovalinta
	,d17.id as d_arvovaihtoehto_id
	,MQ.vastaajaid
	,MQ.source
FROM [dw].[f_arvo_kandi_MAIN_QUERY] MQ
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MQ.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_oid = d1a.ylaorganisaatio_oid
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = MQ.tutkintokoodi
LEFT JOIN dw.d_alueluokitus d4 ON d4.kunta_koodi = MQ.kotikunta
LEFT JOIN dw.d_kalenteri d5a ON d5a.kalenteri_avain = CAST(MQ.vastaajatunnus_alkupvm AS date)
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = CAST(MQ.vastausaika AS date)
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysid = MQ.kysymysid AND d6.kyselyid = MQ.kyselyid and d6.rnk = 1 and MQ.kysymysversio = d6.kysymysversio
LEFT JOIN dw.d_arvokysymys d6b ON d6b.kysymysid = MQ.kysymysid_rahoitusmalli AND d6b.kyselyid = MQ.kyselyid_rahoitusmalli and d6b.rnk = 1 and d6b.kysymysversio = MQ.kysymysverio_rahoitusmalli
LEFT JOIN dw.d_arvovastaus_monivalinta d8 ON d8.koodi = MQ.sp_koodi and d8.kysymysid = MQ.sp_kysymysid and d8.kysymysversio = MQ.sp_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d10 ON d10.koodi = MQ.ika_koodi and d10.kysymysid = MQ.ika_kysymysid and d10.kysymysversio = MQ.ika_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d11 ON d11.koodi = MQ.pk_koodi and d11.kysymysid = MQ.pk_kysymysid and d11.kysymysversio = MQ.pk_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MQ.numerovalinta and d15.kysymysid = MQ.kysymysid_rahoitusmalli and d15.kysymysversio = d6b.kysymysversio
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MQ.suorituskieli
LEFT JOIN dw.d_arvovaihtoehto d17 ON d17.vastaus_koodi = MQ.vaihtoehto
LEFT JOIN dw.d_virta_rahoituslahde d18 on d18.rahoituslahde_koodi = MQ.rahoituslahde
LEFT JOIN dw.d_maatjavaltiot2 d19 on d19.id = MQ.kansalaisuus

-- Tallennetaan kyselykerta + koulutusluokitusparit temp-tauluun
DROP TABLE IF EXISTS ANTERO.dbo.arvo_kandi_temp
SELECT DISTINCT concat(kyselyid,'_',d_koulutusluokitus_id, '_', d_kalenteri_tunnus_luotu_id) as avain 
INTO ANTERO.dbo.arvo_kandi_temp
FROM ANTERO.dw.f_arvo_kandi

-- Generoidaan niiden kyselykertojen tiedot joilta ei ole vastaajia
INSERT INTO dw.f_arvo_kandi (
	kyselyvuosi
	,d_organisaatio_oppilaitos_id
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
	,kyselyid
	,d_arvovastaus_monivalinta_id
	,d_arvoteema_id
	,d_virta_rahoituslahde_id
	,d_maatjavaltiot2_kansalaisuus_id
	,numerovalinta
	,d_arvovaihtoehto_id
	,vastaajaid
	,source
)

SELECT DISTINCT
	RIGHT(kk.tiedonkeruu,4) as kyselyvuosi
	,coalesce(d1a.id, '-1') as d_organisaatio_oppilaitos_id
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
	,vt.kyselyid as kyselyid
	,'-1' as d_arvovastaus_monivalinta_id
	,'-1' as d_arvoteema_id
	,'-1' as d_virta_rahoituslahde_id
	,'-1' as d_maatjavaltiot2_kansalaisuus_id
	,NULL as numerovalinta
	,NULL as d_arvovaihtoehto_id
	,NULL as vastaajaid
	,'ETL: p_lataa_f_arvo_kandi' as source
	
FROM Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset vt
INNER JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt kk on kk.kyselyid = vt.kyselyid
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = vt.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_oid = d1a.ylaorganisaatio_oid
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = vt.tutkinto
LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain = vt.voimassa_alkupvm
WHERE oppilaitoskoodi is not null 
and kk.kyselytyyppi = 'kandipalaute' 
and CAST(RIGHT(kk.tiedonkeruu,4) as int) >= 2022
and concat(vt.kyselyid, '_', d3.id, '_', d5.id) not in (SELECT avain FROM ANTERO.dbo.arvo_kandi_temp)

INSERT INTO dw.f_arvo_kandi (
	kyselyvuosi
	,d_organisaatio_oppilaitos_id
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
	,kyselyid
	,d_arvovastaus_monivalinta_id
	,d_arvoteema_id
	,d_virta_rahoituslahde_id
	,d_maatjavaltiot2_kansalaisuus_id
	,numerovalinta
	,d_arvovaihtoehto_id
	,vastaajaid
	,source
)

SELECT DISTINCT
	kk.kyselykerta_vuosi as kyselyvuosi
	,coalesce(d1a.id, '-1') as d_organisaatio_oppilaitos_id
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
	,vt.kyselyid
	,'-1' as d_arvovastaus_monivalinta_id
	,'-1' as d_arvoteema_id
	,'-1' as d_virta_rahoituslahde_id
	,'-1' as d_maatjavaltiot2_kansalaisuus_id
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
LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain = vt.vastaajatunnus_alkupvm
WHERE oppilaitoskoodi is not null 
and kk.tyyppi = 'kandipalaute' 
and kk.kyselykerta_vuosi is not null 
and kk.kyselykerta_vuosi BETWEEN 2018 AND 2021
and concat(vt.kyselyid, '_', d3.id, '_', d5.id) not in (SELECT avain FROM ANTERO.dbo.arvo_kandi_temp)

DROP TABLE IF EXISTS ANTERO.dbo.arvo_kandi_temp

DROP TABLE IF EXISTS #kandi_temp

SELECT 
	f.d_organisaatio_oppilaitos_id,
	f.d_virta_rahoituslahde_id,
	d.okmohjauksenala_koodi,
	d.koulutusalataso2_koodi,
	f.kyselyvuosi,
	COUNT(DISTINCT vastaajaid) as vastaajat
INTO #kandi_temp
FROM ANTERO.dw.f_arvo_kandi f
LEFT JOIN ANTERO.dw.d_koulutusluokitus d on d.id = f.d_koulutusluokitus_id
GROUP BY
f.d_organisaatio_oppilaitos_id,
f.d_virta_rahoituslahde_id,
d.okmohjauksenala_koodi,
d.koulutusalataso2_koodi,
f.kyselyvuosi

UPDATE f
SET visualisointiin = case when f.vastaajaid is null then 0 when kt.vastaajat > 1 and d3.rahoitusmallikysymys = 1 then 1 else 0 end
FROM ANTERO.dw.f_arvo_kandi f
LEFT JOIN ANTERO.dw.d_koulutusluokitus d on d.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_arvokysymys d3 on d3.id = f.d_arvokysymys_id
LEFT JOIN #kandi_temp kt on kt.d_organisaatio_oppilaitos_id = f.d_organisaatio_oppilaitos_id and kt.d_virta_rahoituslahde_id = f.d_virta_rahoituslahde_id
and kt.koulutusalataso2_koodi = d.koulutusalataso2_koodi and kt.okmohjauksenala_koodi = d.okmohjauksenala_koodi and f.kyselyvuosi = kt.kyselyvuosi

DROP TABLE IF EXISTS #kandi_temp

SELECT 
	f.d_organisaatio_oppilaitos_id,
	f.d_virta_rahoituslahde_id,
	f.d_koulutusluokitus_id,
	f.kyselyvuosi,
	COUNT(DISTINCT vastaajaid) as vastaajat
INTO #kandi_temp2
FROM ANTERO.dw.f_arvo_kandi f
WHERE f.kyselyvuosi >= 2021
GROUP BY
f.d_organisaatio_oppilaitos_id,
f.d_virta_rahoituslahde_id,
f.d_koulutusluokitus_id,
f.kyselyvuosi

UPDATE f
SET hul_visualisointiin = case when f.vastaajaid is null then 0 when kt.vastaajat > 1 then 1 else 0 end
FROM ANTERO.dw.f_arvo_kandi f
LEFT JOIN ANTERO.dw.d_koulutusluokitus d on d.id = f.d_koulutusluokitus_id
LEFT JOIN #kandi_temp2 kt on kt.d_organisaatio_oppilaitos_id = f.d_organisaatio_oppilaitos_id and kt.d_virta_rahoituslahde_id = f.d_virta_rahoituslahde_id
and kt.d_koulutusluokitus_id = f.d_koulutusluokitus_id and f.kyselyvuosi = kt.kyselyvuosi

DROP TABLE IF EXISTS #kandi_temp2

ALTER TABLE [dw].[f_arvo_kandi] ADD  CONSTRAINT [PK__f_arvo_kandi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]


DROP TABLE IF EXISTS [dw].[f_arvo_kandi_MAIN_QUERY]
DROP TABLE IF EXISTS [sa].temp_arvo_kandi_taustat

EXEC dw.p_lataa_f_indikaattorit_kk_kandipalaute