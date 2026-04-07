USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo]    Script Date: 16.3.2026 11.38.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE  [dw].[p_lataa_f_arvo_avop] AS

DROP TABLE IF EXISTS [dw].[f_arvo_avop_MAIN_QUERY]
DROP TABLE IF EXISTS [dw].[f_arvo_avop_CTE]

--aputaulu
select distinct 
	 a.kyselyid
	,a.vastaajaid
	,a.kysymysid
	,a.kysymysversio
	,a.numerovalinta as koodi
	,b.taustakysymyksen_tyyppi
into [dw].[f_arvo_avop_CTE]
from Arvo_SA.sa.sa_arvo_v2_vastaukset_avop a 
join Arvo_SA.sa.sa_arvo_v2_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = b.kysymysversio and a.kyselyid = b.kyselyid
join Arvo_SA.sa.sa_arvo_v2_kyselyt c on c.kyselyid = a.kyselyid
where b.taustakysymyksen_tyyppi in ('sukupuoli','ika','pohjakoulutus')
and c.kyselytyyppi = 'avop'

--välitaulu
SELECT
	RIGHT(f5.tiedonkeruu,4) as kyselyvuosi
	,f2.oppilaitoskoodi
	,f.koulutustoimija
	,f2.tutkinto
	,tk_sp.koodi as sp_koodi
	,tk_sp.kysymysid as sp_kysymysid
	,tk_sp.kysymysversio as sp_kysymysversio
	,tk_ika.koodi as ika_koodi
	,tk_ika.kysymysid as ika_kysymysid
	,tk_ika.kysymysversio as ika_kysymysversio
	,tk_pk.koodi as pk_koodi
	,tk_pk.kysymysid as pk_kysymysid
	,tk_pk.kysymysversio as pk_kysymysversio
	,f2.asuinkunta_koodi as kotikunta
	,concat(year(f2.voimassa_alkupvm),'-',right('0'+cast(month(f2.voimassa_alkupvm) as varchar(2)),2),'-01') as vastaajatunnus_alkupvm
	,f.vastausaika
	,CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE -1 END as vastausid_monivalinta
	,numerovalinta = 1.0 * f.numerovalinta --ks. update, jossa käsitellään muutama kysymysid erikseen
	,numerovalinta2 = f.numerovalinta
	,f.vastaajaid
	,f.kyselyid
	,f3.kysymysid
	,f3.kysymysversio
	,f3.kysymysryhmaid
	,f4.jarjestys as kysymysryhmajarjestys
	,f2.koulutuskieli
	,f2.rahoituslahde
	,CASE WHEN f2.oppilaitoskoodi = '02557' THEN 0 ELSE 1 END as opetushallinnon_alainen_koulutus
	,'ETL: p_lataa_f_arvo_avop' AS source

INTO [dw].[f_arvo_avop_MAIN_QUERY]

FROM Arvo_SA.sa.sa_arvo_v2_vastaukset_avop as f
INNER JOIN Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset f2 on f2.vastaajatunnusid = f.vastaajatunnusid and f.kyselyid = f2.kyselyid
INNER JOIN Arvo_SA.sa.sa_arvo_v2_kysymykset f3 on f3.kysymysid = f.kysymysid and f3.kysymysversio = f.kysymysversio and f3.kyselyid = f.kyselyid
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kysymysryhmat f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt f5 on f5.kyselyid = f.kyselyid
--HENKILÖN TAUSTATIEDOT
LEFT JOIN [dw].[f_arvo_avop_CTE] tk_sp ON tk_sp.vastaajaid = f.vastaajaid AND tk_sp.kyselyid = f.kyselyid and tk_sp.taustakysymyksen_tyyppi = 'sukupuoli'
LEFT JOIN [dw].[f_arvo_avop_CTE] tk_ika ON tk_ika.vastaajaid = f.vastaajaid AND tk_ika.kyselyid = f.kyselyid and tk_ika.taustakysymyksen_tyyppi = 'ika'
LEFT JOIN [dw].[f_arvo_avop_CTE] tk_pk ON tk_pk.vastaajaid = f.vastaajaid AND tk_pk.kyselyid = f.kyselyid and tk_pk.taustakysymyksen_tyyppi = 'pohjakoulutus'
WHERE f5.kyselytyyppi = 'avop' 
AND f4.kategoria in ('valinnainen','valtakunnallinen') 
AND f3.taustakysymyksen_tyyppi is null
AND f3.kysymystyyppi != 'vapaateksti'
AND CAST(RIGHT(f5.tiedonkeruu,4) as int) >= 2022

--update
update dw.f_arvo_avop_MAIN_QUERY
set numerovalinta = 1 + 1.5 * (4 - numerovalinta) --0 -> 7.0; 1 -> 5.5; 2 -> 4.0; 3 -> 2.5; 4 -> 1.0
where kysymysid in (
	select distinct kysymysid 
	from ANTERO.dw.d_arvokysymys
	where kysymys_fi = 'Missä määrin opiskelijoiden palaute mielestäsi huomioitiin opintojen kehittämisessä? Palaute huomioitiin'
)


--insert
ALTER TABLE [dw].[f_arvo_avop] DROP CONSTRAINT IF EXISTS [PK__f_arvo_avop]

TRUNCATE TABLE dw.f_arvo_avop

INSERT INTO dw.f_arvo_avop (
	kyselyvuosi
	,d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_kytkin_opetushallinnon_alainen_koulutus_id
	,d_kieli_koulutuskieli_id
	,d_arvovastaus_taustakysymys_sukupuoli_id 
	,d_arvovastaus_taustakysymys_ika_id
	,d_arvovastaus_taustakysymys_pohjakoulutus_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvovastaus_monivalinta_id
	,d_virta_rahoituslahde_id
	,numerovalinta
	,kyselyid
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
	,coalesce(d17.id,-1) AS d_kytkin_opetushallinnon_alainen_koulutus_id
	,coalesce(d16.id, -1) as d_kieli_koulutuskieli_id
	,coalesce(d8.id,-1) AS d_arvovastaus_taustakysymys_sukupuoli_id
	,coalesce(d10.id,-1) AS d_arvovastaus_taustakysymys_ika_id
	,coalesce(d11.id,-1) AS d_arvovastaus_taustakysymys_pohjakoulutus_id
	,coalesce(d4.id,-1) AS d_alueluokitus_henkilon_kotikunta_id
	,coalesce(d5a.id,-1) AS d_kalenteri_tunnus_luotu_id
	,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,coalesce(d18.id,-1) as d_virta_rahoituslahde_id
	,MQ.numerovalinta
	,MQ.kyselyid
	,MQ.vastaajaid
	,MQ.source

FROM [dw].[f_arvo_avop_MAIN_QUERY] MQ
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MQ.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = MQ.koulutustoimija
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = MQ.tutkinto
LEFT JOIN dw.d_alueluokitus d4 ON d4.kunta_koodi = MQ.kotikunta
LEFT JOIN dw.d_kalenteri d5a ON d5a.kalenteri_avain = CAST(MQ.vastaajatunnus_alkupvm AS date)
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = CAST(MQ.vastausaika AS date)
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysid = MQ.kysymysid AND d6.kyselyid = MQ.kyselyid and d6.rnk = 1 and MQ.kysymysversio = d6.kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d8 ON d8.koodi = MQ.sp_koodi and d8.kysymysid = MQ.sp_kysymysid and d8.kysymysversio = MQ.sp_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d10 ON d10.koodi = MQ.ika_koodi and d10.kysymysid = MQ.ika_kysymysid and d10.kysymysversio = MQ.ika_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d11 ON d11.koodi = MQ.pk_koodi and d11.kysymysid = MQ.pk_kysymysid and d11.kysymysversio = MQ.pk_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MQ.numerovalinta2 and d15.kysymysid = MQ.kysymysid and d15.kysymysversio = MQ.kysymysversio
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MQ.koulutuskieli
LEFT JOIN dw.d_kytkin d17 ON d17.kytkin_koodi = MQ.opetushallinnon_alainen_koulutus
LEFT JOIN dw.d_virta_rahoituslahde d18 ON d18.rahoituslahde_koodi = MQ.rahoituslahde

-- Vuotta 2022 edeltävät tiedot

DROP TABLE IF EXISTS [dw].[f_arvo_avop_MAIN_QUERY]
DROP TABLE IF EXISTS [dw].[f_arvo_avop_CTE]

select distinct 
	a.kyselyid
	,a.vastaajaid
	,a.kysymysid
	,a.kysymysversio
	,a.numerovalinta as koodi
	,b.taustakysymyksen_tyyppi
into [dw].[f_arvo_avop_CTE]
from Arvo_SA.sa.sa_arvo_vastaukset_avop a 
join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = b.kysymysversio
join Arvo_SA.sa.sa_arvo_kyselykerrat c on c.kyselyid = a.kyselyid
where b.taustakysymyksen_tyyppi in ('sukupuoli','ika','pohjakoulutus')
and c.tyyppi = 'avop' and c.kyselykerta_vuosi < 2022

SELECT k.oppilaitoskoodi
	,f.koulutustoimija
	,k.tutkintokoodi as tutkinto
	,tk_sp.koodi as sp_koodi
	,tk_sp.kysymysid as sp_kysymysid
	,tk_sp.kysymysversio as sp_kysymysversio
	,tk_ika.koodi as ika_koodi
	,tk_ika.kysymysid as ika_kysymysid
	,tk_ika.kysymysversio as ika_kysymysversio
	,tk_pk.koodi as pk_koodi
	,tk_pk.kysymysid as pk_kysymysid
	,tk_pk.kysymysversio as pk_kysymysversio
	,k.kuntakoodi as kotikunta
	,concat(year(k.vastaajatunnus_alkupvm),'-',right('0'+cast(month(k.vastaajatunnus_alkupvm) as varchar(2)),2),'-01') as vastaajatunnus_alkupvm
	,f.vastausaika
	,CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE -1 END as vastausid_monivalinta
	,numerovalinta = 1.0 * f.numerovalinta --ks. update, jossa käsitellään muutama kysymysid erikseen
	,numerovalinta2 = f.numerovalinta
	,f.vastaajaid
	,f.kyselyid
	,f5.kyselykertaid
	,f3.kysymysid
	,f3.kysymysversio
	,f3.kysymysryhmaid
	,f4.jarjestys as kysymysryhmajarjestys
	,f2.koulutuskieli
	,f2.rahoituslahde
	,f5.kyselykerta_vuosi as kyselyvuosi
	,CASE WHEN k.oppilaitoskoodi = '02557' THEN 0 ELSE 1 END as opetushallinnon_alainen_koulutus
	,'ETL: p_lataa_f_arvo_avop' AS source

INTO [dw].[f_arvo_avop_MAIN_QUERY]

FROM Arvo_SA.sa.sa_arvo_vastaukset_avop as f
INNER JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot f2 on f2.vastaajatunnusid = f.vastaajatunnusid
LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet k on f2.vastaajatunnusid = k.vastaajatunnusid
INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid and f3.kysymysversio = f.kysymysversio
INNER JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
INNER JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselyid = f4.kyselyid
--HENKILÖN TAUSTATIEDOT
LEFT JOIN (
	select kyselyid
		,vastaajaid
		,kysymysid
		,kysymysversio
		,koodi
	from [dw].[f_arvo_avop_CTE]
	where taustakysymyksen_tyyppi = 'sukupuoli'
) AS tk_sp ON tk_sp.vastaajaid = f.vastaajaid AND tk_sp.kyselyid = f.kyselyid
LEFT JOIN (
	select kyselyid
		,vastaajaid
		,kysymysid
		,kysymysversio
		,koodi
	from [dw].[f_arvo_avop_CTE]  
	where taustakysymyksen_tyyppi = 'ika'
) AS tk_ika ON tk_ika.vastaajaid = f.vastaajaid AND tk_ika.kyselyid = f.kyselyid
LEFT JOIN (
	select kyselyid
		,vastaajaid
		,kysymysid
		,kysymysversio
		,koodi
	from [dw].[f_arvo_avop_CTE] 
	where taustakysymyksen_tyyppi = 'pohjakoulutus'
) AS tk_pk ON tk_pk.vastaajaid = f.vastaajaid AND tk_pk.kyselyid = f.kyselyid
WHERE f5.tyyppi = 'avop' 
AND f3.valtakunnallinen = 1 
AND f3.taustakysymyksen_tyyppi is null
AND f3.vastaustyyppi != 'vapaateksti'
AND f5.kyselykerta_vuosi < 2022

--update
update dw.f_arvo_avop_MAIN_QUERY
set numerovalinta = 1 + 1.5 * (4 - numerovalinta) --0 -> 7.0; 1 -> 5.5; 2 -> 4.0; 3 -> 2.5; 4 -> 1.0
where kysymysid in (
	select distinct kysymysid 
	from ANTERO.dw.d_arvokysymys
	where kysymys_fi = 'Missä määrin opiskelijoiden palaute mielestäsi huomioitiin opintojen kehittämisessä? Palaute huomioitiin'
)

INSERT INTO dw.f_arvo_avop (
	kyselyvuosi
	,d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_kytkin_opetushallinnon_alainen_koulutus_id
	,d_kieli_koulutuskieli_id
	,d_arvovastaus_taustakysymys_sukupuoli_id 
	,d_arvovastaus_taustakysymys_ika_id
	,d_arvovastaus_taustakysymys_pohjakoulutus_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvovastaus_monivalinta_id
	,d_virta_rahoituslahde_id
	,numerovalinta
	,kyselyid
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
	,coalesce(d17.id,-1) AS d_kytkin_opetushallinnon_alainen_koulutus_id
	,coalesce(d16.id, -1) as d_kieli_koulutuskieli_id
	,coalesce(d8.id,-1) AS d_arvovastaus_taustakysymys_sukupuoli_id
	,coalesce(d10.id,-1) AS d_arvovastaus_taustakysymys_ika_id
	,coalesce(d11.id,-1) AS d_arvovastaus_taustakysymys_pohjakoulutus_id
	,coalesce(d4.id,-1) AS d_alueluokitus_henkilon_kotikunta_id
	,coalesce(d5a.id,-1) AS d_kalenteri_tunnus_luotu_id
	,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,coalesce(d18.id,-1) as d_virta_rahoituslahde_id
	,MQ.numerovalinta
	,MQ.kyselyid
	,MQ.vastaajaid
	,MQ.source

FROM [dw].[f_arvo_avop_MAIN_QUERY] MQ
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MQ.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = MQ.koulutustoimija
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = MQ.tutkinto
LEFT JOIN dw.d_alueluokitus d4 ON d4.kunta_koodi = MQ.kotikunta
LEFT JOIN dw.d_kalenteri d5a ON d5a.kalenteri_avain = CAST(MQ.vastaajatunnus_alkupvm AS date)
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = CAST(MQ.vastausaika AS date)
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysid = MQ.kysymysid AND d6.kyselyid = MQ.kyselyid and d6.rnk = 1 and d6.kysymysversio = MQ.kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d8 ON d8.koodi = MQ.sp_koodi and d8.kysymysid = MQ.sp_kysymysid and d8.kysymysversio = MQ.sp_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d10 ON d10.koodi = MQ.ika_koodi and d10.kysymysid = MQ.ika_kysymysid and d10.kysymysversio = MQ.ika_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d11 ON d11.koodi = MQ.pk_koodi and d11.kysymysid = MQ.pk_kysymysid and d11.kysymysversio = MQ.pk_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MQ.numerovalinta2 and d15.kysymysid = MQ.kysymysid and d15.kysymysversio = MQ.kysymysversio
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MQ.koulutuskieli
LEFT JOIN dw.d_kytkin d17 ON d17.kytkin_koodi = MQ.opetushallinnon_alainen_koulutus
LEFT JOIN dw.d_virta_rahoituslahde d18 ON d18.rahoituslahde_koodi = MQ.rahoituslahde

-- Tallennetaan kyselykerta + koulutusluokitusparit temp-tauluun
DROP TABLE IF EXISTS ANTERO.dbo.arvo_avop_temp
SELECT DISTINCT concat(kyselyid,'_',d_koulutusluokitus_id, '_', d_kalenteri_tunnus_luotu_id) as avain 
INTO ANTERO.dbo.arvo_avop_temp
FROM ANTERO.dw.f_arvo_avop

-- Generoidaan niiden kyselykertojen tiedot joilta ei ole vastaajia
INSERT INTO dw.f_arvo_avop (
	kyselyvuosi
	,d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_kytkin_opetushallinnon_alainen_koulutus_id
	,d_kieli_koulutuskieli_id
	,d_arvovastaus_taustakysymys_sukupuoli_id 
	,d_arvovastaus_taustakysymys_ika_id
	,d_arvovastaus_taustakysymys_pohjakoulutus_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvovastaus_monivalinta_id
	,d_virta_rahoituslahde_id
	,numerovalinta
	,kyselyid
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
	,coalesce(d6.id, '-1') as d_kytkin_opetushallinnon_alainen_koulutus_id
	,'-1' as d_kieli_koulutuskieli_id
	,'-1' as d_arvovastaus_taustakysymys_sukupuoli_id 
	,'-1' as d_arvovastaus_taustakysymys_ika_id
	,'-1' as d_arvovastaus_taustakysymys_pohjakoulutus_id
	,'-1' as d_alueluokitus_henkilon_kotikunta_id
	,coalesce(d5.id, '-1') as d_kalenteri_tunnus_luotu_id
	,'-1' as d_kalenteri_vastaus_id
	,'-1' as d_arvokysymys_id
	,'-1' as d_arvovastaus_monivalinta_id
	,'-1' as d_virta_rahoituslahde_id
	,NULL as numerovalinta
	,vt.kyselyid
	,NULL as vastaajaid
	,'ETL: p_lataa_f_arvo_avop' as source
	
FROM Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset vt
INNER JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt kk on kk.kyselyid = vt.kyselyid
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = vt.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_oid = d1a.ylaorganisaatio_oid
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = vt.tutkinto
LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain = concat(year(vt.voimassa_alkupvm),'-',right('0'+cast(month(vt.voimassa_alkupvm) as varchar(2)),2),'-01')
LEFT JOIN dw.d_kytkin d6 ON d6.kytkin_koodi = CASE WHEN d1b.organisaatio_koodi = '02557' THEN 0 ELSE 1 END 
WHERE oppilaitoskoodi is not null 
and kk.kyselytyyppi = 'avop' 
and RIGHT(kk.tiedonkeruu,4) >= 2022
and concat(vt.kyselyid, '_', d3.id, '_', d5.id) not in (SELECT avain FROM ANTERO.dbo.arvo_avop_temp)

INSERT INTO dw.f_arvo_avop (
	 kyselyvuosi
	,d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_kytkin_opetushallinnon_alainen_koulutus_id
	,d_kieli_koulutuskieli_id
	,d_arvovastaus_taustakysymys_sukupuoli_id 
	,d_arvovastaus_taustakysymys_ika_id
	,d_arvovastaus_taustakysymys_pohjakoulutus_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvovastaus_monivalinta_id
	,d_virta_rahoituslahde_id
	,numerovalinta
	,kyselyid
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
	,coalesce(d6.id, '-1') as d_kytkin_opetushallinnon_alainen_koulutus_id
	,'-1' as d_kieli_koulutuskieli_id
	,'-1' as d_arvovastaus_taustakysymys_sukupuoli_id 
	,'-1' as d_arvovastaus_taustakysymys_ika_id
	,'-1' as d_arvovastaus_taustakysymys_pohjakoulutus_id
	,'-1' as d_alueluokitus_henkilon_kotikunta_id
	,coalesce(d5.id, '-1') as d_kalenteri_tunnus_luotu_id
	,'-1' as d_kalenteri_vastaus_id
	,'-1' as d_arvokysymys_id
	,'-1' as d_arvovastaus_monivalinta_id
	,'-1' as d_virta_rahoituslahde_id
	,NULL as numerovalinta
	,kk.kyselyid
	,NULL as vastaajaid
	,'ETL: p_lataa_f_arvo_avop' as source
	
FROM [Arvo_SA].[sa].[sa_arvo_kohteet] vt
INNER JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid = vt.kyselykertaid
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = vt.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_oid = d1a.ylaorganisaatio_oid
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_koodi = vt.tutkintokoodi
LEFT JOIN dw.d_arvotiedonkeruu d4 on d4.kyselyid = vt.kyselyid
LEFT JOIN dw.d_kalenteri d5 on d5.kalenteri_avain = concat(year(vt.vastaajatunnus_alkupvm),'-',right('0'+cast(month(vt.vastaajatunnus_alkupvm) as varchar(2)),2),'-01')
LEFT JOIN dw.d_kytkin d6 ON d6.kytkin_koodi = CASE WHEN d1b.organisaatio_koodi = '02557' THEN 0 ELSE 1 END 
WHERE oppilaitoskoodi is not null 
and kk.tyyppi = 'avop' 
and kk.kyselykerta_vuosi BETWEEN 2016 and 2021
and concat(d4.kyselyid, '_', d3.id, '_', d5.id) not in (SELECT avain FROM ANTERO.dbo.arvo_avop_temp)

DROP TABLE IF EXISTS ANTERO.dbo.arvo_avop_temp

SELECT 
	f.d_organisaatio_oppilaitos_id,
	f.d_virta_rahoituslahde_id,
	f.d_koulutusluokitus_id,
	f.kyselyvuosi,
	COUNT(DISTINCT vastaajaid) as vastaajat
INTO #avop_temp
FROM ANTERO.dw.f_arvo_avop f
GROUP BY
f.d_organisaatio_oppilaitos_id,
f.d_virta_rahoituslahde_id,
f.d_koulutusluokitus_id,
f.kyselyvuosi

UPDATE f
SET visualisointiin = case when f.vastaajaid is null then 0 when kt.vastaajat > 1 and d3.rahoitusmallikysymys = 1 then 1 else 0 end
FROM ANTERO.dw.f_arvo_avop f
LEFT JOIN ANTERO.dw.d_arvokysymys d3 on d3.id = f.d_arvokysymys_id
LEFT JOIN #avop_temp kt on kt.d_organisaatio_oppilaitos_id = f.d_organisaatio_oppilaitos_id and kt.d_virta_rahoituslahde_id = f.d_virta_rahoituslahde_id
and kt.d_koulutusluokitus_id = f.d_koulutusluokitus_id and f.kyselyvuosi = kt.kyselyvuosi

DROP TABLE IF EXISTS #avop_temp

ALTER TABLE [dw].[f_arvo_avop] ADD  CONSTRAINT [PK__f_arvo_avop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]


DROP TABLE IF EXISTS [dw].[f_arvo_avop_MAIN_QUERY]
DROP TABLE IF EXISTS [dw].[f_arvo_avop_CTE]

EXEC dw.p_lataa_f_indikaattorit_kk_avop