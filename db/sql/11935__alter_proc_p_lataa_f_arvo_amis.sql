USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amis]    Script Date: 7.4.2026 14.54.18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

































ALTER PROCEDURE [dw].[p_lataa_f_arvo_amis] AS
/* Testi arvo 2.0 keskeneräinen*/

DROP TABLE IF EXISTS [dw].[f_arvo_amis_MAIN_QUERY] 
drop table if exists #taustakysymykset
drop table if exists #taustakysymyksetv2

SELECT DISTINCT
	a.kyselyid
	,a.vastaajaid
	,numerovalinta as koodi
	,vaihtoehto
	,b.taustakysymyksen_tyyppi
	,b.kysymysid
	,b.kysymysversio
	,rank() OVER(PARTITION BY a.kyselyid, vastaajaid, b.kysymysid, b.kysymysversio ORDER BY CASE a.numerovalinta
							WHEN 4 THEN 1
							WHEN 3 THEN 2
							WHEN 2 THEN 3
							WHEN 1 THEN 4
							WHEN 5 THEN 5
							WHEN 7 THEN 6
							WHEN 0 THEN 7
							WHEN 6 THEN 8
							ELSE 9
						 END asc) as rnk_korkein_koul
INTO #taustakysymyksetv2
FROM Arvo_SA.sa.sa_arvo_v2_vastaukset_amis a
INNER JOIN Arvo_SA.sa.sa_arvo_v2_kysymykset b ON b.kyselyid=a.kyselyid and b.kysymysid = a.kysymysid and b.kysymysversio = a.kysymysversio
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset vt on a.vastaajatunnusid=vt.vastaajatunnusid
WHERE b.taustakysymyksen_tyyppi is not null and vt.voimassa_alkupvm > '2021-06-30'

SELECT DISTINCT
	v.kyselyid
	,v.vastaajaid
	,numerovalinta as koodi
	,vaihtoehto
	,k.taustakysymyksen_tyyppi
	,k.kysymysid
	,k.kysymysversio
	,rank() OVER(PARTITION BY v.kyselyid, v.vastaajaid, k.kysymysid, k.kysymysversio ORDER BY CASE v.numerovalinta
							WHEN 4 THEN 1
							WHEN 3 THEN 2
							WHEN 2 THEN 3
							WHEN 1 THEN 4
							WHEN 5 THEN 5
							WHEN 7 THEN 6
							WHEN 0 THEN 7
							WHEN 6 THEN 8
							ELSE 9
						 END asc) as rnk_korkein_koul
INTO #taustakysymykset
FROM Arvo_SA.sa.sa_arvo_vastaukset_amis v
INNER JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid = v.kysymysid and k.kysymysversio = v.kysymysversio
LEFT JOIN Arvo_SA.sa.sa_arvo_vastaajat vt on v.vastaajaid= vt.vastaajaid
WHERE k.taustakysymyksen_tyyppi is not null and vt.vastaajatunnus_alkupvm <= '2021-06-30'


--välitaulu
SELECT f2.oppilaitoskoodi
	,f5.koulutustoimija_oid as koulutustoimija --(Tulossa vaihtuu oidiksi)
	,toimipiste_oid = 
		case 
			when (f2.[heratepvm] > '2024-06-30' and f2.vastaajatunnusid != 1224658)
				or f2.voimassa_alkupvm between '2021-07-01' and '2024-06-30' 
			then f2.toimipiste_oid
		end 
	,f2.tutkinto
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
	,tk_pkoul.koodi as pkoul_koodi
	,tk_pkoul.kysymysid as pkoul_kysymysid
	,tk_pkoul.kysymysversio as pkoul_kysymysversio
	,tk_arvio.koodi as arvio_koodi
	,tk_arvio.kysymysid as arvio_kysymysid
	,tk_arvio.kysymysversio as arvio_kysymysversio
	,f2.asuinkunta_koodi as kotikunta 
	,tunnus_pvm = 
		case 
			when f2.[heratepvm] > '2024-06-30' and f2.vastaajatunnusid != 1224658 then f2.[heratepvm] 
			when f2.voimassa_alkupvm <= '2024-06-30' then f2.voimassa_alkupvm
		end 
	,f.vastausaika
	,CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE -1 END as vastausid_monivalinta
	,f.numerovalinta
	,f.vastaajaid
	,f2.vastaajatunnus
	,f.kyselyid
	--,f6.kyselykertaid (Tämä poistuu)
	,f3.kysymysid
	,f3.kysymysversio
	,f3.kysymysryhmaid
	,f4.jarjestys as kysymysryhmajarjestys
	,f2.tutkinnon_suorituskieli
	,f7.osaamisen_hankkimistavat
	,oppisopimuksen_perustat = NULLIF(CONCAT(case when f2.oppisopimuksen_perusta like '%01%' then '01' end, case when f2.oppisopimuksen_perusta like '%02%' then '02' end), '')
	,osaamisalat_avain = COALESCE(NULLIF(f2.osaamisala, '[]'), '-1') --kuutiossa kaksi aputaulua, jottei vastaukset monistu. JS 21.1.2025
	,'ETL: p_lataa_f_arvo_amis' AS source

INTO [dw].[f_arvo_amis_MAIN_QUERY]

FROM Arvo_SA.sa.sa_arvo_v2_vastaukset_amis as f
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset f2 on f2.vastaajatunnusid = f.vastaajatunnusid
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kysymykset f3 on f3.kysymysid = f.kysymysid and f3.kysymysversio = f.kysymysversio and f.kyselyid=f3.kyselyid
INNER JOIN Arvo_SA.sa.sa_arvo_v2_kysymysryhmat f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid --inner, koska ed. liitoksessa osalla useampia ryhmiä. JS 17.7.2023 
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt f5 on f5.kyselyid = f.kyselyid 
--LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet f6 on f6.vastaajatunnusid = f2.vastaajatunnusid (Pois tilalla f2)
LEFT JOIN ANTERO.sa.sa_arvo_osaamisen_hankkimistavat_amis f7 on f7.vastaajatunnusid = f.vastaajatunnusid 
--LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot f8 on f8.vastaajatunnusid = f.vastaajatunnusid (Myös tämä f2)
--HENKILÖN TAUSTATIEDOT 425492
 LEFT JOIN (select * from #taustakysymyksetv2 where taustakysymyksen_tyyppi =  'sukupuoli') AS tk_sp ON tk_sp.vastaajaid = f.vastaajaid AND tk_sp.kyselyid = f.kyselyid
LEFT JOIN (select * from #taustakysymyksetv2 where taustakysymyksen_tyyppi = 'aidinkieli') AS tk_ak ON tk_ak.vastaajaid = f.vastaajaid AND tk_ak.kyselyid = f.kyselyid
LEFT JOIN (select * from #taustakysymyksetv2 where taustakysymyksen_tyyppi =  'ika') AS tk_ika ON tk_ika.vastaajaid = f.vastaajaid AND tk_ika.kyselyid = f.kyselyid
LEFT JOIN (select * from #taustakysymyksetv2 where taustakysymyksen_tyyppi =  'hakeutumisvayla') AS tk_hv ON tk_hv.vastaajaid = f.vastaajaid AND tk_hv.kyselyid = f.kyselyid

LEFT JOIN (
	select
		 kyselyid
		,vastaajaid
		,kysymysid
		,kysymysversio
		,case vaihtoehto when 'ei' then 0 when 'kylla' then 1 else 0 end as koodi
	from #taustakysymyksetv2
	where taustakysymyksen_tyyppi = 'oppisopimuskoulutus'
) AS tk_oppis ON tk_oppis.vastaajaid = f.vastaajaid AND tk_oppis.kyselyid = f.kyselyid


LEFT JOIN  (
	select
		kyselyid
		,vastaajaid
		,kysymysid
		,kysymysversio
		,koodi
	from #taustakysymyksetv2
	where taustakysymyksen_tyyppi = 'pohjakoulutus' and rnk_korkein_koul=1
) AS tk_pkoul ON tk_pkoul.vastaajaid = f.vastaajaid AND tk_pkoul.kyselyid = f.kyselyid

LEFT JOIN (select * from #taustakysymyksetv2 where taustakysymyksen_tyyppi = 'arvio_tulevaisuudesta') AS tk_arvio ON tk_arvio.vastaajaid = f.vastaajaid AND tk_arvio.kyselyid = f.kyselyid
WHERE f5.kyselytyyppi = 'ammatillisen-opiskelijapalaute'
AND f5.tiedonkeruu not like '%pilotti%'
AND f4.kategoria = 'valtakunnallinen'
--AND coalesce(f3.taustakysymyksen_tyyppi,'') not in ('sukupuoli','aidinkieli','ika','hakeutumisvayla','oppisopimuskoulutus','arvio_tulevaisuudesta','pohjakoulutus')
AND (f3.taustakysymyksen_tyyppi is null OR f3.taustakysymyksen_tyyppi IN ('kiusaaminen','kiusaamiseen_puuttuminen'))
AND f3.kysymystyyppi != 'vapaateksti'
AND f2.voimassa_alkupvm > '2021-06-30'

UNION ALL

SELECT f2.oppilaitoskoodi
	,f1.organisaatio_oid as koulutustoimija
	,toimipiste_oid = NULL
	,f2.tutkintokoodi as tutkinto
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
	,tk_pkoul.koodi as pkoul_koodi
	,tk_pkoul.kysymysid as pkoul_kysymysid
	,tk_pkoul.kysymysversio as pkoul_kysymysversio
	,tk_arvio.koodi as arvio_koodi
	,tk_arvio.kysymysid as arvio_kysymysid
	,tk_arvio.kysymysversio as arvio_kysymysversio
	,f2.kuntakoodi as kotikunta
	,tunnus_pvm = f6.vastaajatunnus_alkupvm 
	,f.vastausaika
	,CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE -1 END as vastausid_monivalinta
	,f.numerovalinta
	,f.vastaajaid
	,f6.vastaajatunnus
	,f.kyselyid
	--,f6.kyselykertaid
	,f3.kysymysid
	,f3.kysymysversio
	,f3.kysymysryhmaid
	,f4.jarjestys as kysymysryhmajarjestys
	,f6.suorituskieli
	,f7.osaamisen_hankkimistavat
	,oppisopimuksen_perustat = NULLIF(CONCAT(case when f8.oppisopimuksen_perusta like '%01%' then '01' end, case when f8.oppisopimuksen_perusta like '%02%' then '02' end), '')
	,osaamisalat_avain = COALESCE(NULLIF(f8.osaamisala, '[]'), '-1') --kuutiossa kaksi aputaulua, jottei vastaukset monistu. JS 12.6.2025
	,'ETL: p_lataa_f_arvo_amis' AS source

FROM Arvo_SA.sa.sa_arvo_vastaukset_amis as f
LEFT JOIN dw.d_organisaatioluokitus f1 ON f1.organisaatio_koodi = f.koulutustoimija
LEFT JOIN Arvo_SA.sa.sa_arvo_vastaajat f2 on f2.vastaajaid = f.vastaajaid
LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid and f3.kysymysversio = f.kysymysversio
INNER JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid --inner, koska ed. liitoksessa osalla useampia ryhmiä. JS 17.7.2023
LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselyid = f4.kyselyid
LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet f6 on f6.vastaajatunnusid = f2.vastaajatunnusid
LEFT JOIN ANTERO.sa.sa_arvo_osaamisen_hankkimistavat_amis f7 on f7.vastaajatunnusid = f.vastaajatunnusid
LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot f8 on f8.vastaajatunnusid = f.vastaajatunnusid
--HENKILÖN TAUSTATIEDOT
LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi =  'sukupuoli') AS tk_sp ON tk_sp.vastaajaid = f.vastaajaid AND tk_sp.kyselyid = f.kyselyid
LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi = 'aidinkieli') AS tk_ak ON tk_ak.vastaajaid = f.vastaajaid AND tk_ak.kyselyid = f.kyselyid
LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi =  'ika') AS tk_ika ON tk_ika.vastaajaid = f.vastaajaid AND tk_ika.kyselyid = f.kyselyid
LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi =  'hakeutumisvayla') AS tk_hv ON tk_hv.vastaajaid = f.vastaajaid AND tk_hv.kyselyid = f.kyselyid
LEFT JOIN (
	select
		 kyselyid
		,vastaajaid
		,kysymysid
		,kysymysversio
		,case vaihtoehto when 'ei' then 0 when 'kylla' then 1 else 0 end as koodi
	from #taustakysymykset
	where taustakysymyksen_tyyppi = 'oppisopimuskoulutus'
) AS tk_oppis ON tk_oppis.vastaajaid = f.vastaajaid AND tk_oppis.kyselyid = f.kyselyid

LEFT JOIN  (
	select
		kyselyid
		,vastaajaid
		,kysymysid
		,kysymysversio
		,koodi	
	from #taustakysymykset
	where taustakysymyksen_tyyppi = 'pohjakoulutus' and rnk_korkein_koul=1
) AS tk_pkoul ON tk_pkoul.vastaajaid = f.vastaajaid AND tk_pkoul.kyselyid = f.kyselyid

LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi = 'arvio_tulevaisuudesta') AS tk_arvio ON tk_arvio.vastaajaid = f.vastaajaid AND tk_arvio.kyselyid = f.kyselyid

WHERE f5.tyyppi = 'ammatillisen-opiskelijapalaute'
AND f5.kyselypohja_tarkenne not like '%pilotti%'
AND f3.valtakunnallinen = 1
--AND coalesce(f3.taustakysymyksen_tyyppi,'') not in ('sukupuoli','aidinkieli','ika','hakeutumisvayla','oppisopimuskoulutus','arvio_tulevaisuudesta','pohjakoulutus')
AND (f3.taustakysymyksen_tyyppi is null OR f3.taustakysymyksen_tyyppi IN ('kiusaaminen','kiusaamiseen_puuttuminen'))
AND f3.vastaustyyppi != 'vapaateksti'
AND f2.vastaajatunnus_alkupvm <= '2021-06-30'




--insert
ALTER TABLE [dw].[f_arvo_amis] DROP CONSTRAINT IF EXISTS [PK__f_arvo_amis]

TRUNCATE TABLE dw.f_arvo_amis

INSERT INTO dw.f_arvo_amis (
	koulutustoimija
	,d_organisaatio_toimipiste_id
	,d_organisaatio_oppilaitos_id
	,d_organisaatio_koulutustoimija_id
	,d_amos_spl_jarjestaja_linkki_id
	,d_alueluokitus_toimipiste_id
	,d_alueluokitus_oppilaitos_id
	,d_alueluokitus_koulutustoimija_id
	,d_koulutusluokitus_id
	,d_arvovastaus_taustakysymys_sukupuoli_id
	,d_arvovastaus_taustakysymys_aidinkieli_id
	,d_arvovastaus_taustakysymys_ika_id
	,d_arvovastaus_taustakysymys_hakeutumisvayla_id
	,d_oppisopimuskoulutus_id
	,d_osaamisen_hankkimistavat_id
	,d_arvovastaus_koulutustausta_id
	,d_arvovastaus_taustakysymys_arvio_tilanteesta_id
	,d_alueluokitus_henkilon_kotikunta_id
	,d_kalenteri_tunnus_luotu_id
	,d_kalenteri_vastaus_id
	,d_arvokysymys_id
	,d_arvokysely_id
	,d_arvovastaus_monivalinta_id
	,numerovalinta
	,vastaajaid
	,vastaajatunnus
	,d_suoritus_kieli_id
	,oppisopimuksen_perustat
	,osaamisalat_avain
	,source
)

SELECT DISTINCT
    MQ.koulutustoimija
	,coalesce(d1.id,-1) AS d_organisaatio_toimipiste_id
	,coalesce(d1a.id,-1) AS d_organisaatio_oppilaitos_id
	,coalesce(d1b.id,-1) AS d_organisaatio_koulutustoimija_id
	,coalesce(d1c.id,-1) AS d_amos_spl_jarjestaja_linkki_id
	,coalesce(d2.id,-1) AS d_alueluokitus_toimipiste_id
	,coalesce(d2a.id,-1) AS d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id,-1) AS d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id,-1) AS d_koulutusluokitus_id
	,coalesce(d8.id,-1) AS d_arvovastaus_taustakysymys_sukupuoli_id
	,coalesce(d9.id,-1) AS d_arvovastaus_taustakysymys_aidinkieli_id
	,coalesce(d10.id,-1) AS d_arvovastaus_taustakysymys_ika_id
	,coalesce(d11.id,-1) as d_arvovastaus_taustakysymys_hakeutumisvayla_id
	,coalesce(d13.id,-1) as d_oppisopimuskoulutus_id
	,coalesce(d17.id,-1) as d_osaamisen_hankkimistavat_id
	,coalesce(d18.id,-1) as d_arvovastaus_koulutustausta_id
	,coalesce(d14.id,-1) as d_arvovastaus_taustakysymys_arvio_tilanteesta_id
	,coalesce(d4.id,-1) AS d_alueluokitus_henkilon_kotikunta_id
	,coalesce(d5.id,-1) AS d_kalenteri_tunnus_luotu_id
	,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d7.id,-1) AS d_arvokysely_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,MQ.numerovalinta
	,MQ.vastaajaid
	,MQ.vastaajatunnus
	,coalesce(d16.id, -1) as d_suoritus_kieli_id
	,oppisopimuksen_perustat
	,osaamisalat_avain
	,MQ.source

FROM [dw].[f_arvo_amis_MAIN_QUERY] MQ
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1c ON d1c.oid_avain = MQ.koulutustoimija
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_oid = MQ.toimipiste_oid
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MQ.oppilaitoskoodi
-- Fuusiot näkyviin heti kun tullut voimaan, AP 5.7.2022
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' 
	and d1b.organisaatio_oid =
		case 
			when coalesce(d1c.voimaan_alkaen,'9999-12-31') <= getdate() then coalesce(d1c.oid_amos_spl, d1c.oid_avain) 
			else MQ.koulutustoimija 
		end
LEFT JOIN dw.d_alueluokitus d2 ON d2.kunta_koodi = d1.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_avain like 'koulutus_%' and d3.koulutusluokitus_koodi = MQ.tutkinto
LEFT JOIN dw.d_alueluokitus d4 ON d4.alueluokitus_avain like 'kunta_%' and d4.kunta_koodi = MQ.kotikunta
LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = MQ.tunnus_pvm
LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = MQ.vastausaika
LEFT JOIN dw.d_arvokysymys d6 ON d6.kyselyid=MQ.kyselyid and d6.kysymysryhmaid = MQ.kysymysryhmaid AND d6.kysymysid = MQ.kysymysid AND d6.kysymysryhmajarjestys = MQ.kysymysryhmajarjestys and d6.kysymysversio = MQ.kysymysversio
LEFT JOIN dw.d_arvotiedonkeruu d7 ON d7.kyselyid = MQ.kyselyid
LEFT JOIN dw.d_arvovastaus_monivalinta d8 ON d8.koodi = MQ.sp_koodi and d8.kysymysid = MQ.sp_kysymysid and d8.kysymysversio = MQ.sp_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d9 ON d9.koodi = MQ.ak_koodi and d9.kysymysid = MQ.ak_kysymysid and d9.kysymysversio = MQ.ak_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d10 ON d10.koodi = MQ.ika_koodi and d10.kysymysid = MQ.ika_kysymysid and d10.kysymysversio = MQ.ika_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d11 ON d11.koodi = MQ.hv_koodi and d11.kysymysid = MQ.hv_kysymysid and d11.kysymysversio = MQ.hv_kysymysversio
LEFT JOIN dw.d_oppisopimuskoulutus d13 ON d13.koodi = MQ.oppis_koodi --and d13.kysymysid = MQ.oppis_kysymysid
LEFT JOIN dw.d_arvovastaus_monivalinta d14 ON d14.koodi = MQ.arvio_koodi and d14.kysymysid = MQ.arvio_kysymysid and d14.kysymysversio = MQ.arvio_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MQ.numerovalinta and d15.kysymysid = MQ.kysymysid and d15.kysymysversio = MQ.kysymysversio
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MQ.tutkinnon_suorituskieli
LEFT JOIN dw.d_osaamisen_hankkimistavat d17 on d17.koodi = MQ.osaamisen_hankkimistavat
LEFT JOIN dw.d_arvovastaus_monivalinta d18 ON d18.koodi = MQ.pkoul_koodi and d18.kysymysid = MQ.pkoul_kysymysid and d18.kysymysversio = MQ.pkoul_kysymysversio


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
	osaamisalat_avain,
	source
)
SELECT DISTINCT
	f.vastaajaid,
	f.d_kalenteri_tunnus_luotu_id,
	f.d_organisaatio_koulutustoimija_id,
	f.d_arvokysely_id as d_arvokyselykerta_id,
	f.d_koulutusluokitus_id,
	f.d_arvovastaus_taustakysymys_sukupuoli_id,
	f.d_arvovastaus_taustakysymys_aidinkieli_id,
	f.d_suoritus_kieli_id,
	f.d_arvovastaus_taustakysymys_hakeutumisvayla_id,
	f.d_arvovastaus_taustakysymys_ika_id,
	f.d_arvovastaus_taustakysymys_arvio_tilanteesta_id,
	f.osaamisalat_avain,
	'ETL: p_lataa_f_arvo_amis' as source
FROM dw.f_arvo_amis AS f
WHERE f.vastaajaid is not null






ALTER TABLE [dw].[f_arvo_amis] ADD  CONSTRAINT [PK__f_arvo_amis] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]


DROP TABLE IF EXISTS [dw].[f_arvo_amis_MAIN_QUERY]
drop table if exists #taustakysymykset
drop table if exists #taustakysymyksetv2