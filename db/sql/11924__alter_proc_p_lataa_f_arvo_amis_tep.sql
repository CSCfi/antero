USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amis_tep]    Script Date: 7.4.2026 14.58.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


























ALTER PROCEDURE [dw].[p_lataa_f_arvo_amis_tep] AS
/* Tämä on testi Arvo 2.0 apiin. Kesken!*/

--Yhdistetty vastaajatunnisteita yhteisiä mittareita varten, lisätty myös kyselykohtaiset muuttujat tarvittavaa erottelua varten. JS 13.4.2022

DROP TABLE IF EXISTS dw.f_arvo_amis_tep
DROP TABLE IF EXISTS #taustakysymykset
DROP TABLE IF EXISTS #kyselyjen_linkitys

SELECT DISTINCT
	a.kyselyid
	,vastaajaid
	,numerovalinta
	,vaihtoehto
	,Koodi
	,b.taustakysymyksen_tyyppi
	,b.kysymysid
	,b.kysymysversio
INTO #taustakysymykset
FROM Arvo_SA.sa.sa_arvo_v2_vastaukset_tep a
INNER JOIN Arvo_SA.sa.sa_arvo_v2_kysymykset b ON b.kyselyid=a.kyselyid and b.kysymysid = a.kysymysid and b.kysymysversio = a.kysymysversio
WHERE b.taustakysymyksen_tyyppi is not null

SELECT DISTINCT
	tyopaikkakysely_vastaajatunnus = k_tpk.vastaajatunnus
	,tyopaikkakysely_liittyva_ohjaajatunnus = tpok_tt.vastaajatunnus
INTO #kyselyjen_linkitys
FROM Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset k_tpk
LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt kk ON kk.kyselyid = k_tpk.kyselyid
LEFT JOIN (
	SELECT DISTINCT
		k_tpok.vastaajatunnus
		,k_tpok.koulutustoimija_oid
		,k_tpok.tyonantaja
		,tyopaikka_normalisoitu
		,k_tpok.tyopaikkajakson_loppupvm
	FROM Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset k_tpok
	LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt kk ON kk.kyselyid = k_tpok.kyselyid
	WHERE kk.kyselytyyppi = 'tyopaikkaohjaajakysely'
	AND coalesce(k_tpok.oppisopimuksen_perusta,'') != '02' --yrittäjiä ei yhdistetä
) tpok_tt ON tpok_tt.koulutustoimija_oid = k_tpk.koulutustoimija_oid
AND tpok_tt.tyonantaja = k_tpk.tyonantaja
AND coalesce(tpok_tt.tyopaikka_normalisoitu,'') = coalesce(k_tpk.tyopaikka_normalisoitu,'')
AND tpok_tt.tyopaikkajakson_loppupvm between k_tpk.tiedonkeruu_alkupvm and k_tpk.tiedonkeruu_loppupvm
WHERE kk.kyselytyyppi = 'tyopaikkakysely'


SELECT DISTINCT
     coalesce(d1.id,-1) AS d_organisaatio_toimipiste_id
    ,coalesce(d1a.id,-1) AS d_organisaatio_oppilaitos_id
	,coalesce(d1b.id,-1) AS d_organisaatio_koulutustoimija_id
	,coalesce(d1c.id,-1) AS d_amos_spl_jarjestaja_linkki_id
	,coalesce(d2.id,-1) AS d_alueluokitus_toimipiste_id
	,coalesce(d2a.id,-1) AS d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id,-1) AS d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id,-1) AS d_koulutusluokitus_id
	,coalesce(d9.id,-1) AS d_alueluokitus_toimipaikka_id
	,coalesce(d10.id,-1) AS d_maatjavaltiot2_toimipaikka_id
	,coalesce(d5.id, -1) as d_kalenteri_jakso_paattynyt_id
	,osaamisalat_avain
	--,coalesce(d5a.id,-1) AS d_kalenteri_tunnus_luotu_id
	--,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d7.id,-1) AS d_arvokysely_id
	,coalesce(d11.id,-1) as d_arvovastaus_taustakysymys_tehtava_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,coalesce(d16.id,-1) AS d_suoritus_kieli_id
	,coalesce(d17.id,-1) AS d_ytj_yritystiedot_tyonantaja_id
	,coalesce(d18.id,-1) AS d_oppisopimuksen_perusta_id
	,coalesce(d19.id,-1) AS d_tutkinnon_osa_id
	,coalesce(d20.id,-1) AS d_osaamisen_hankkimistapa_id
	,MQ.numerovalinta
	,ca.vaihtoehto
	,tyopaikkajakson_kesto = cast(MQ.tyopaikkajakson_kesto as float)
	--yhteiset (jakso)mittarit
	,vastaajaid = case when MQ.kyselytyyppi = 'tyopaikkakysely' and MQ.vastaajaid is not null then oa.tyopaikkakysely_liittyva_ohjaajatunnus else cast(vastaajaid as varchar) end
	,vastaajatunnus = case when MQ.kyselytyyppi = 'tyopaikkakysely' then oa.tyopaikkakysely_liittyva_ohjaajatunnus else vastaajatunnus end
	--tarvittaessa erilliset mittarit
	,tyopaikkaohjaajakysely_vastaajaid = case when MQ.kyselytyyppi = 'tyopaikkaohjaajakysely' then vastaajaid end
	,tyopaikkaohjaajakysely_vastaajatunnus = case when MQ.kyselytyyppi = 'tyopaikkaohjaajakysely' then vastaajatunnus end
	,tyopaikkakysely_vastaajaid = case when MQ.kyselytyyppi = 'tyopaikkakysely' then vastaajaid end
	,tyopaikkakysely_vastaajatunnus = case when MQ.kyselytyyppi = 'tyopaikkakysely' then vastaajatunnus end
	,oa.tyopaikkakysely_liittyva_ohjaajatunnus
	--
	,cast(MQ.source as varchar(250)) AS source

INTO dw.f_arvo_amis_tep

FROM (

	SELECT
		 f2.toimipiste_oid
		,f2.oppilaitoskoodi
		,f2.koulutustoimija_oid
		,f2.tutkinto
		,tsk_koodi = tk_tsk.Koodi
		,tsm_koodi = tk_tsm.Koodi
		,sts_koodi = tk_sts.vaihtoehto
		,tk_teht_koodi = tk_teht.numerovalinta
		,tk_teht_kysymysid = tk_teht.kysymysid
		,tk_teht_kysymysversio = tk_teht.kysymysversio
		,f2.tyopaikkajakson_loppupvm
		,osaamisalat_avain = COALESCE(NULLIF(f2.osaamisala, '[]'), '-1') --kuutiossa kaksi aputaulua, jottei vastaukset monistu. JS 12.6.2025
		--,f2.vastaajatunnus_alkupvm
		,f2.tyopaikkajakson_kesto
		--,f.vastausaika
		,vastausid_monivalinta = CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE '-1' END
		,f.numerovalinta
		,f.vaihtoehto
		,f.vastaajaid
		,f2.vastaajatunnus
		,f2.kyselyid
		,f5.kyselytyyppi
		,f3.kysymysid
		,f3.kysymysversio
		,f3.kysymysryhmaid
		,f4.jarjestys as kysymysryhmajarjestys
		,f2.suorituskieli
		,f2.tyonantaja
		,f2.osaamisen_hankkimistapa
		,f2.oppisopimuksen_perusta
		,f2.tutkinnon_osa
		,'ETL: p_lataa_f_arvo_amis_tep' AS source

	FROM Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset f2
	LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt f5 on f5.kyselyid = f2.kyselyid
	--LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot tt ON tt.vastaajatunnusid = f2.vastaajatunnusid (tämä mukana f2)
	LEFT JOIN (
		--esim. vain taustakysymyksiin vastanneet kyselyn kohteiksi vaikkei itse kysymyksiä; poistettu aiemmat rajaus ja delete. JS 29.3.2022
		select v.*, k.kysymysryhmaid
		from Arvo_SA.sa.sa_arvo_v2_vastaukset_tep v
		left join Arvo_SA.sa.sa_arvo_v2_kysymykset k on k.kyselyid=v.kyselyid and k.kysymysid = v.kysymysid and k.kysymysversio = v.kysymysversio
		left join Arvo_SA.sa.sa_arvo_v2_kysymysryhmat kkr on kkr.kysymysryhmaid = k.kysymysryhmaid and kkr.kyselyid = v.kyselyid -- aiemmin inner, koska ed. liitoksessa osalla useampia ryhmiä. Nyt edellisen joinin kyselyid liitos poistaa ne. JK 25.4.2025
		where taustakysymyksen_tyyppi is null and coalesce(kategoria, 'valtakunnallinen') = 'valtakunnallinen' and coalesce(kysymystyyppi,'') != 'vapaateksti'
	) f on f.vastaajatunnusid = f2.vastaajatunnusid
	LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kysymykset f3 on f3.kyselyid=f.kyselyid and f3.kysymysid = f.kysymysid and f3.kysymysversio = f.kysymysversio and f3.kysymysryhmaid = f.kysymysryhmaid
	LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kysymysryhmat f4 on f4.kysymysryhmaid = f.kysymysryhmaid and f4.kyselyid = f.kyselyid
	--TAUSTAKYSYMYKSET
	LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi = 'toimipaikan_kunta') AS tk_tsk ON tk_tsk.vastaajaid = f.vastaajaid AND tk_tsk.kyselyid = f.kyselyid
	LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi = 'toimipaikan_maa') AS tk_tsm ON tk_tsm.vastaajaid = f.vastaajaid AND tk_tsm.kyselyid = f.kyselyid
	LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi = 'toimipaikka_suomessa') AS tk_sts ON tk_sts.vastaajaid = f.vastaajaid AND tk_sts.kyselyid = f.kyselyid
	LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi = 'tehtava_tyonantajalla') AS tk_teht ON tk_teht.vastaajaid = f.vastaajaid AND tk_teht.kyselyid = f.kyselyid

	WHERE f5.kyselytyyppi in ('tyopaikkaohjaajakysely', 'tyopaikkakysely')

) MQ

LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1c ON d1c.oid_avain = MQ.koulutustoimija_oid
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_oid = MQ.toimipiste_oid
LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MQ.oppilaitoskoodi
-- Fuusiot näkyviin heti kun tullut voimaan, AP 5.7.2022
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' 
	and d1b.organisaatio_oid = 
		case 
			when coalesce(d1c.voimaan_alkaen,'9999-12-31') <= getdate() then coalesce(d1c.oid_amos_spl, d1c.oid_avain) 
			else MQ.koulutustoimija_oid 
		end
LEFT JOIN dw.d_alueluokitus d2 ON d2.kunta_koodi = d1.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_avain like 'koulutus_%' and d3.koulutusluokitus_koodi = MQ.tutkinto
LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = MQ.tyopaikkajakson_loppupvm
--LEFT JOIN dw.d_kalenteri d5a ON d5a.kalenteri_avain = MQ.vastaajatunnus_alkupvm
--LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = MQ.vastausaika
LEFT JOIN dw.d_arvokysymys d6 ON d6.kyselyid=MQ.kyselyid and d6.kysymysryhmaid = MQ.kysymysryhmaid AND d6.kysymysid = MQ.kysymysid AND d6.kysymysryhmajarjestys = MQ.kysymysryhmajarjestys AND d6.kysymysversio = MQ.kysymysversio
LEFT JOIN dw.d_arvotiedonkeruu d7 ON d7.kyselyid = MQ.kyselyid
LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi = MQ.tsk_koodi
LEFT JOIN dw.d_maatjavaltiot2 d10 ON d10.maatjavaltiot2_koodi = coalesce(MQ.tsm_koodi, case when MQ.sts_koodi = 'kylla' then (select maatjavaltiot2_koodi from dw.d_maatjavaltiot2 where maatjavaltiot2_fi = 'Suomi') end)
LEFT JOIN dw.d_arvovastaus_monivalinta d11 ON d11.koodi = MQ.tk_teht_koodi and d11.kysymysid = MQ.tk_teht_kysymysid AND d11.kysymysversio = MQ.tk_teht_kysymysversio
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MQ.numerovalinta and d15.kysymysid = MQ.kysymysid AND d15.kysymysversio = MQ.kysymysversio
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MQ.suorituskieli
LEFT JOIN dw.d_ytj_yritystiedot d17 ON d17.ytunnus = MQ.tyonantaja
LEFT JOIN dw.d_oppisopimuksen_perusta d18 ON d18.koodi = MQ.oppisopimuksen_perusta
LEFT JOIN dw.d_tutkinnon_osa d19 ON d19.koodi = MQ.tutkinnon_osa
LEFT JOIN dw.d_osaamisen_hankkimistapa d20 ON d20.koodi = MQ.osaamisen_hankkimistapa
--työpaikkakyselyn rivien monistaminen työpaikkaohjaajan kyselyn kohteilla
OUTER APPLY (select * from #kyselyjen_linkitys kl where kl.tyopaikkakysely_vastaajatunnus = MQ.vastaajatunnus) oa
CROSS APPLY (select vaihtoehto = case MQ.vaihtoehto when 'kylla' then 'Kyllä' when 'ei' then 'Ei' else MQ.vaihtoehto end) ca


--työpaikkakyselyn taustatietojen päivittäminen työpaikkaohjaajan kyselyn taustatiedoilla
UPDATE f
SET
     [d_organisaatio_toimipiste_id] = coalesce(f2.[d_organisaatio_toimipiste_id], f.[d_organisaatio_toimipiste_id])
	,[d_organisaatio_oppilaitos_id] = coalesce(f2.[d_organisaatio_oppilaitos_id], f.[d_organisaatio_oppilaitos_id])
	,[d_alueluokitus_toimipiste_id] = coalesce(f2.[d_alueluokitus_toimipiste_id], f.[d_alueluokitus_toimipiste_id])
    ,[d_alueluokitus_oppilaitos_id] = coalesce(f2.[d_alueluokitus_oppilaitos_id], f.[d_alueluokitus_oppilaitos_id])
    ,[d_koulutusluokitus_id] = coalesce(f2.[d_koulutusluokitus_id], f.[d_koulutusluokitus_id])
    --,[d_alueluokitus_toimipaikka_id] = f2.[d_alueluokitus_toimipaikka_id]
    --,[d_maatjavaltiot2_toimipaikka_id] = f2.[d_maatjavaltiot2_toimipaikka_id]
    ,[d_suoritus_kieli_id] = coalesce(f2.[d_suoritus_kieli_id], f.[d_suoritus_kieli_id])
    ,[d_oppisopimuksen_perusta_id] = coalesce(f2.[d_oppisopimuksen_perusta_id], f.[d_oppisopimuksen_perusta_id])
    ,[d_tutkinnon_osa_id] = coalesce(f2.[d_tutkinnon_osa_id], f.[d_tutkinnon_osa_id])
	,[d_kalenteri_jakso_paattynyt_id] = coalesce(f2.d_kalenteri_jakso_paattynyt_id, f.d_kalenteri_jakso_paattynyt_id)
	,[d_osaamisen_hankkimistapa_id] = coalesce(f2.[d_osaamisen_hankkimistapa_id], f.[d_osaamisen_hankkimistapa_id])
    ,[tyopaikkajakson_kesto] = coalesce(f2.[tyopaikkajakson_kesto], f.[tyopaikkajakson_kesto])
	,[osaamisalat_avain] = coalesce(f2.[osaamisalat_avain], f.[osaamisalat_avain])
FROM dw.f_arvo_amis_tep f
LEFT JOIN dw.f_arvo_amis_tep f2 on f2.tyopaikkaohjaajakysely_vastaajatunnus = f.tyopaikkakysely_liittyva_ohjaajatunnus
WHERE f.tyopaikkakysely_liittyva_ohjaajatunnus is not null


CREATE NONCLUSTERED INDEX [NC_arvo_amis_tep]
ON [dw].[f_arvo_amis_tep] ([d_koulutusluokitus_id])
INCLUDE ([d_organisaatio_oppilaitos_id],[d_kalenteri_jakso_paattynyt_id],[d_arvokysely_id])

drop table if exists #taustakysymykset
drop table if exists #kyselyjen_linkitys