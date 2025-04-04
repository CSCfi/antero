USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amis]    Script Date: 4.4.2025 9.53.08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_arvo_amis] AS

DROP TABLE IF EXISTS [dw].[f_arvo_amis_MAIN_QUERY] 

--välitaulu
SELECT f2.oppilaitoskoodi
	,f.koulutustoimija
	,f2.tutkintokoodi
	,tk_sp.koodi as sp_koodi
	,tk_sp.kysymysid as sp_kysymysid
	,tk_sp.kysymysversio as sp_kysymysversio
	,tk_ak.koodi as ak_koodi
	,tk_ak.kysymysid as ak_kysymysid
	,tk_ak.kysymysversio as ak_kysymysversio
	,tk_ika.koodi as ika_koodi
	,tk_ika.kysymysid as ika_kysymysid
	,tk_ika.kysymysversio as ika_kysymysversio
	,tk_hv.koodi as hv_koodi
	,tk_hv.kysymysid as hv_kysymysid
	,tk_hv.kysymysversio as hv_kysymysversio
	,tk_oppis.koodi as oppis_koodi
	,tk_oppis.kysymysid as oppis_kysymysid
	,tk_oppis.kysymysversio as oppis_kysymysversio
	,tk_arvio.koodi as arvio_koodi
	,tk_arvio.kysymysid as arvio_kysymysid
	,tk_arvio.kysymysversio as arvio_kysymysversio
	,f2.kuntakoodi as kotikunta
	,f2.vastaajatunnus_alkupvm
	,f.vastausaika
	,CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE -1 END as vastausid_monivalinta
	,f.numerovalinta
	,f.vastaajaid
	,f6.vastaajatunnus
	--,f.kyselyid
	,f6.kyselykertaid
	,f3.kysymysid
	,f3.kysymysversio
	,f3.kysymysryhmaid
	,f4.jarjestys as kysymysryhmajarjestys
	,f6.suorituskieli
	,f7.osaamisen_hankkimistavat
--	,osaamisalat_avain = COALESCE(NULLIF(f8.osaamisala, '[]'), '-1') --kuutiossa kaksi aputaulua, jottei vastaukset monistu. JS 21.1.2025
	,'ETL: p_lataa_f_arvo_amis' AS source

INTO [dw].[f_arvo_amis_MAIN_QUERY]

FROM Arvo_SA.sa.sa_arvo_vastaukset_amis as f
LEFT JOIN Arvo_SA.sa.sa_arvo_vastaajat f2 on f2.vastaajaid = f.vastaajaid
LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid and f3.kysymysversio = f.kysymysversio
INNER JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid --inner, koska ed. liitoksessa osalla useampia ryhmiä. JS 17.7.2023
LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselykertaid = f.kyselykertaid --and f5.kyselyid = f4.kyselyid
LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet f6 on f6.vastaajatunnusid = f2.vastaajatunnusid
LEFT JOIN ANTERO.sa.sa_arvo_osaamisen_hankkimistavat_amis f7 on f7.vastaajatunnusid = f.vastaajatunnusid
-- LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot f8 on f8.vastaajatunnusid = f.vastaajatunnusid
--HENKILÖN TAUSTATIEDOT
LEFT JOIN (
	select distinct
		kyselyid
		,kyselykertaid
		,vastaajaid
		,a.kysymysid
		,a.kysymysversio
		,numerovalinta as koodi
	from Arvo_SA.sa.sa_arvo_vastaukset_amis a
	inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = a.kysymysversio
	where b.taustakysymyksen_tyyppi = 'sukupuoli'
) AS tk_sp ON tk_sp.vastaajaid = f.vastaajaid AND tk_sp.kyselykertaid = f.kyselykertaid

LEFT JOIN (
	select distinct
		kyselyid
		,kyselykertaid
		,vastaajaid
		,a.kysymysid
		,a.kysymysversio
		,numerovalinta as koodi
	from Arvo_SA.sa.sa_arvo_vastaukset_amis a
	inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = a.kysymysversio
	where b.taustakysymyksen_tyyppi = 'aidinkieli'
) AS tk_ak ON tk_ak.vastaajaid = f.vastaajaid AND tk_ak.kyselykertaid = f.kyselykertaid

LEFT JOIN (
	select distinct
		kyselyid
		,kyselykertaid
		,vastaajaid
		,a.kysymysid
		,a.kysymysversio
		,numerovalinta as koodi
	from Arvo_SA.sa.sa_arvo_vastaukset_amis a
	inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = a.kysymysversio
	where b.taustakysymyksen_tyyppi = 'ika'
) AS tk_ika ON tk_ika.vastaajaid = f.vastaajaid AND tk_ika.kyselykertaid = f.kyselykertaid

LEFT JOIN (
	select distinct
		kyselyid
		,kyselykertaid
		,vastaajaid
		,a.kysymysid
		,a.kysymysversio
		,numerovalinta as koodi
	from Arvo_SA.sa.sa_arvo_vastaukset_amis a
	inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = a.kysymysversio
	where b.taustakysymyksen_tyyppi = 'hakeutumisvayla'
) AS tk_hv ON tk_hv.vastaajaid = f.vastaajaid AND tk_hv.kyselykertaid = f.kyselykertaid

LEFT JOIN (
	select distinct
		kyselyid
		,kyselykertaid
		,vastaajaid
		,a.kysymysid
		,a.kysymysversio
		,case vaihtoehto when 'ei' then 0 when 'kylla' then 1 else 0 end as koodi
	from Arvo_SA.sa.sa_arvo_vastaukset_amis a
	inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = a.kysymysversio
	where b.taustakysymyksen_tyyppi = 'oppisopimuskoulutus'
) AS tk_oppis ON tk_oppis.vastaajaid = f.vastaajaid AND tk_oppis.kyselykertaid = f.kyselykertaid

LEFT JOIN (
	select distinct
		kyselyid
		,kyselykertaid
		,vastaajaid
		,a.kysymysid
		,a.kysymysversio
		,numerovalinta as koodi
	from Arvo_SA.sa.sa_arvo_vastaukset_amis a
	inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid = a.kysymysid and b.kysymysversio = a.kysymysversio
	where b.taustakysymyksen_tyyppi = 'arvio_tulevaisuudesta'
) AS tk_arvio ON tk_arvio.vastaajaid = f.vastaajaid AND tk_arvio.kyselykertaid = f.kyselykertaid

WHERE f5.tyyppi = 'ammatillisen-opiskelijapalaute'
AND f5.kyselypohja_tarkenne not like '%pilotti%'
AND f3.valtakunnallinen = 1
--AND coalesce(f3.taustakysymyksen_tyyppi,'') not in ('sukupuoli','aidinkieli','ika','hakeutumisvayla','oppisopimuskoulutus','arvio_tulevaisuudesta','pohjakoulutus')
AND (f3.taustakysymyksen_tyyppi is null OR f3.taustakysymyksen_tyyppi IN ('kiusaaminen','kiusaamiseen_puuttuminen'))
AND f3.vastaustyyppi != 'vapaateksti'



--insert
ALTER TABLE [dw].[f_arvo_amis] DROP CONSTRAINT IF EXISTS [PK__f_arvo_amis]

TRUNCATE TABLE dw.f_arvo_amis

INSERT INTO dw.f_arvo_amis (
	koulutustoimija
	,d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_amos_spl_jarjestaja_linkki_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_arvovastaus_taustakysymys_sukupuoli_id
	,d_arvovastaus_taustakysymys_aidinkieli_id
	,d_arvovastaus_taustakysymys_ika_id
	,d_arvovastaus_taustakysymys_hakeutumisvayla_id
	,d_oppisopimuskoulutus_id
	,d_osaamisen_hankkimistavat_id
	,d_arvovastaus_taustakysymys_arvio_tilanteesta_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvokyselykerta_id
	,d_arvovastaus_monivalinta_id
	,numerovalinta
	,vastaajaid
	,vastaajatunnus
	,d_suoritus_kieli_id
--	,osaamisalat_avain
	,source
)

SELECT DISTINCT
    MQ.koulutustoimija
	,coalesce(d1a.id,-1) AS d_organisaatio_oppilaitos_id
	,coalesce(d1b.id,-1) AS d_organisaatio_koulutustoimija_id
	,coalesce(d1c.id,-1) AS d_amos_spl_jarjestaja_linkki_id
	,coalesce(d2a.id,-1) AS d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id,-1) AS d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id,-1) AS d_koulutusluokitus_id
	,coalesce(d8.id,-1) AS d_arvovastaus_taustakysymys_sukupuoli_id
	,coalesce(d9.id,-1) AS d_arvovastaus_taustakysymys_aidinkieli_id
	,coalesce(d10.id,-1) AS d_arvovastaus_taustakysymys_ika_id
	,coalesce(d11.id,-1) as d_arvovastaus_taustakysymys_hakeutumisvayla_id
	,coalesce(d13.id,-1) as d_oppisopimuskoulutus_id
	,coalesce(d17.id,-1) as d_osaamisen_hankkimistavat_id
	,coalesce(d14.id,-1) as d_arvovastaus_taustakysymys_arvio_tilanteesta_id
	,coalesce(d4.id,-1) AS d_alueluokitus_henkilon_kotikunta_id
	,coalesce(d5.id,-1) AS d_kalenteri_tunnus_luotu_id
	,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d7.id,-1) AS d_arvokyselykerta_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,MQ.numerovalinta
	,MQ.vastaajaid
	,MQ.vastaajatunnus
	,coalesce(d16.id, -1) as d_suoritus_kieli_id
--	,osaamisalat_avain
	,MQ.source

FROM [dw].[f_arvo_amis_MAIN_QUERY] MQ
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1c ON d1c.ytunnus_avain = MQ.koulutustoimija
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MQ.oppilaitoskoodi
-- Fuusiot näkyviin heti kun tullut voimaan, AP 5.7.2022
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' 
	and d1b.organisaatio_koodi =
		case 
			when coalesce(d1c.voimaan_alkaen,'9999-12-31') <= getdate() then coalesce(d1c.ytunnus_amos_spl, d1c.ytunnus_avain) 
			else MQ.koulutustoimija 
		end
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_avain like 'koulutus_%' and d3.koulutusluokitus_koodi = MQ.tutkintokoodi
LEFT JOIN dw.d_alueluokitus d4 ON d4.alueluokitus_avain like 'kunta_%' and d4.kunta_koodi = MQ.kotikunta
LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = MQ.vastaajatunnus_alkupvm
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = MQ.vastausaika
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = MQ.kysymysryhmaid AND d6.kysymysid = MQ.kysymysid AND d6.kysymysryhmajarjestys = MQ.kysymysryhmajarjestys and d6.kysymysversio = MQ.kysymysversio
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = MQ.kyselykertaid --and d7.kyselyid = MQ.kyselyid
LEFT JOIN dw.d_arvovastaus_taustakysymys d8 ON d8.koodi = MQ.sp_koodi and d8.kysymysid = MQ.sp_kysymysid and d8.kysymysversio = MQ.sp_kysymysversio
LEFT JOIN dw.d_arvovastaus_taustakysymys d9 ON d9.koodi = MQ.ak_koodi and d9.kysymysid = MQ.ak_kysymysid and d9.kysymysversio = MQ.ak_kysymysversio
LEFT JOIN dw.d_arvovastaus_taustakysymys d10 ON d10.koodi = MQ.ika_koodi and d10.kysymysid = MQ.ika_kysymysid and d10.kysymysversio = MQ.ika_kysymysversio
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.koodi = MQ.hv_koodi and d11.kysymysid = MQ.hv_kysymysid and d11.kysymysversio = MQ.hv_kysymysversio
LEFT JOIN dw.d_oppisopimuskoulutus d13 ON d13.koodi = MQ.oppis_koodi --and d13.kysymysid = MQ.oppis_kysymysid
LEFT JOIN dw.d_arvovastaus_taustakysymys d14 ON d14.koodi = MQ.arvio_koodi and d14.kysymysid = MQ.arvio_kysymysid and d14.kysymysversio = MQ.arvio_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MQ.numerovalinta and d15.kysymysid = MQ.kysymysid and d15.kysymysversio = MQ.kysymysversio
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MQ.suorituskieli
LEFT JOIN dw.d_osaamisen_hankkimistavat d17 on d17.koodi = MQ.osaamisen_hankkimistavat


EXEC dw.p_lataa_f_arvo_amis_generoi_tyhjat_kuukaudet


-- Faktataulu visualisointeja varten: CSCVIPUNEN-4457
TRUNCATE TABLE [dw].[f_arvo_amis_vastaajat]

INSERT INTO [dw].[f_arvo_amis_vastaajat]
(
	vastaajaid,
	d_kalenteri_tunnus_luotu_id,
	d_organisaatio_koulutustoimija_id,
	d_arvokyselykerta_id,
	d_koulutusluokitus_id,
	d_arvovastaus_taustakysymys_sukupuoli_id,
	d_arvovastaus_taustakysymys_aidinkieli_id,
	d_suoritus_kieli_id,
	d_arvovastaus_taustakysymys_hakeutumisvayla_id,
	d_arvovastaus_taustakysymys_ika_id,
	d_arvovastaus_taustakysymys_arvio_tilanteesta_id,
	source
)
SELECT DISTINCT
	f.vastaajaid,
	f.d_kalenteri_tunnus_luotu_id,
	f.d_organisaatio_koulutustoimija_id,
	f.d_arvokyselykerta_id,
	f.d_koulutusluokitus_id,
	f.d_arvovastaus_taustakysymys_sukupuoli_id,
	f.d_arvovastaus_taustakysymys_aidinkieli_id,
	f.d_suoritus_kieli_id,
	f.d_arvovastaus_taustakysymys_hakeutumisvayla_id,
	f.d_arvovastaus_taustakysymys_ika_id,
	f.d_arvovastaus_taustakysymys_arvio_tilanteesta_id,
	'ETL: p_lataa_f_arvo_amis' as source
FROM dw.f_arvo_amis AS f
WHERE f.vastaajaid is not null


ALTER TABLE [dw].[f_arvo_amis] ADD  CONSTRAINT [PK__f_arvo_amis] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]


DROP TABLE IF EXISTS [dw].[f_arvo_amis_MAIN_QUERY]

GO

USE [ANTERO]