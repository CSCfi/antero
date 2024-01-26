USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_amis_tep]    Script Date: 13.4.2022 10:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_arvo_amis_tep] AS

--Yhdistetty vastaajatunnisteita yhteisiä mittareita varten, lisätty myös kyselykohtaiset muuttujat tarvittavaa erottelua varten. JS 13.4.2022

DROP INDEX IF EXISTS [NC_arvo_amis_tep] ON [dw].[f_arvo_amis_tep]

DROP TABLE IF EXISTS dw.f_arvo_amis_tep

--TRUNCATE TABLE dw.f_arvo_amis_tep

drop table if exists #taustakysymykset
--;WITH 
--taustakysymykset AS (
	select distinct 
		kyselykertaid
		,vastaajaid
		,numerovalinta
		,vaihtoehto
		,b.taustakysymyksen_tyyppi
		,b.kysymysid
	into #taustakysymykset
	from Arvo_SA.sa.sa_arvo_vastaukset a 
	inner join Arvo_SA.sa.sa_arvo_kysymykset b on b.kysymysid=a.kysymysid 
--)

drop table if exists #kyselyjen_linkitys
--,kyselyjen_linkitys AS (
	SELECT distinct 
		 tyopaikkakysely_vastaajatunnus = k_tpk.vastaajatunnus
		,tyopaikkakysely_liittyva_ohjaajatunnus = tpok_tt.vastaajatunnus
	into #kyselyjen_linkitys
	FROM Arvo_SA.sa.sa_arvo_kohteet k_tpk
	LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot tpk_tt ON tpk_tt.vastaajatunnusid = k_tpk.vastaajatunnusid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid = k_tpk.kyselykertaid
	LEFT JOIN (
		SELECT distinct
			k_tpok.vastaajatunnus
			,kk.koulutustoimija
			,tt.tyonantaja
			,tyopaikka_normalisoitu
			,tt.tyopaikkajakson_loppupvm
		FROM Arvo_SA.sa.sa_arvo_kohteet k_tpok
		LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot tt ON tt.vastaajatunnusid = k_tpok.vastaajatunnusid
		LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid = k_tpok.kyselykertaid
		WHERE kk.tyyppi = 'tyoelamapalaute'
	) tpok_tt ON tpok_tt.koulutustoimija = kk.koulutustoimija
				 AND tpok_tt.tyonantaja = tpk_tt.tyonantaja
				 AND coalesce(tpok_tt.tyopaikka_normalisoitu,'') = coalesce(tpk_tt.tyopaikka_normalisoitu,'')
				 AND tpok_tt.tyopaikkajakson_loppupvm between tpk_tt.tiedonkeruu_alkupvm and tpk_tt.tiedonkeruu_loppupvm
	WHERE kk.tyyppi = 'tyopaikkakysely' 
--)


SELECT distinct
     coalesce(d1a.id,-1) AS d_organisaatio_oppilaitos_id
	,coalesce(d1b.id,-1) AS d_organisaatio_koulutustoimija_id
	,coalesce(d1c.id,-1) AS d_amos_spl_jarjestaja_linkki_id
	,coalesce(d2a.id,-1) AS d_alueluokitus_oppilaitos_id
	,coalesce(d2b.id,-1) AS d_alueluokitus_koulutustoimija_id
	,coalesce(d3.id,-1) AS d_koulutusluokitus_id
	,coalesce(d9.id,-1) AS d_alueluokitus_toimipaikka_id
	,coalesce(d10.id,-1) AS d_maatjavaltiot2_toimipaikka_id
	,coalesce(d5.id, -1) as d_kalenteri_jakso_paattynyt_id
	--,coalesce(d5a.id,-1) AS d_kalenteri_tunnus_luotu_id
	--,coalesce(d5b.id,-1) AS d_kalenteri_vastaus_id
	,coalesce(d6.id,-1) AS d_arvokysymys_id
	,coalesce(d7.id,-1) AS d_arvokyselykerta_id
	,coalesce(d11.id,-1) as d_arvovastaus_taustakysymys_tehtava_id
	,coalesce(d15.id,-1) AS d_arvovastaus_monivalinta_id
	,coalesce(d16.id,-1) AS d_suoritus_kieli_id
	,coalesce(d17.id,-1) AS d_ytj_yritystiedot_tyonantaja_id
	,coalesce(d18.id,-1) AS d_oppisopimuksen_perusta_id
	,coalesce(d19.id,-1) AS d_tutkinnon_osa_id
	,coalesce(d20.id,-1) AS d_osaamisen_hankkimistapa_id
	,MAIN_QUERY.numerovalinta
	,ca.vaihtoehto
	,tyopaikkajakson_kesto = cast(MAIN_QUERY.tyopaikkajakson_kesto as float)
	--yhteiset (jakso)mittarit
	,vastaajaid = case when MAIN_QUERY.tyyppi = 'tyopaikkakysely' and MAIN_QUERY.vastaajaid is not null then oa.tyopaikkakysely_liittyva_ohjaajatunnus else cast(vastaajaid as varchar) end
	,vastaajatunnus = case when MAIN_QUERY.tyyppi = 'tyopaikkakysely' then oa.tyopaikkakysely_liittyva_ohjaajatunnus else vastaajatunnus end
	--tarvittaessa erilliset mittarit
	,tyopaikkaohjaajakysely_vastaajaid = case when MAIN_QUERY.tyyppi = 'tyoelamapalaute' then vastaajaid end
	,tyopaikkaohjaajakysely_vastaajatunnus = case when MAIN_QUERY.tyyppi = 'tyoelamapalaute' then vastaajatunnus end
	,tyopaikkakysely_vastaajaid = case when MAIN_QUERY.tyyppi = 'tyopaikkakysely' then vastaajaid end
	,tyopaikkakysely_vastaajatunnus = case when MAIN_QUERY.tyyppi = 'tyopaikkakysely' then vastaajatunnus end
	,oa.tyopaikkakysely_liittyva_ohjaajatunnus
	--
	,cast(MAIN_QUERY.source as varchar(250)) AS source

INTO dw.f_arvo_amis_tep

FROM (

	SELECT 
		 f2.oppilaitoskoodi
		,f5.koulutustoimija
		,f2.tutkintokoodi
		,tsk_koodi = tk_tsk.numerovalinta
		,tsm_koodi = tk_tsm.numerovalinta
		,sts_koodi = tk_sts.vaihtoehto
		,tk_teht_koodi = tk_teht.numerovalinta
		,tk_teht_kysymysid = tk_teht.kysymysid
		,tt.tyopaikkajakson_loppupvm
		--,f2.vastaajatunnus_alkupvm
		,tyopaikkajakson_kesto = f2.[taustatiedot.tyopaikkajakson_kesto]
		--,f.vastausaika
		,vastausid_monivalinta = CASE WHEN monivalintavaihtoehto_fi IS NOT NULL THEN f.vastausid ELSE '-1' END
		,f.numerovalinta
		,f.vaihtoehto
		,f.vastaajaid
		,f2.vastaajatunnus
		,f2.kyselykertaid
		,f5.tyyppi
		,f3.kysymysid
		,f3.kysymysryhmaid
		,f4.jarjestys as kysymysryhmajarjestys
		,f2.suorituskieli
		,f2.[taustatiedot.tyonantaja]
		,f2.[taustatiedot.sopimustyyppi]
		,f2.[taustatiedot.oppisopimuksen_perusta]
		,f2.[taustatiedot.tutkinnon_osa]
		,'ETL: p_lataa_f_arvo_amis_tep' AS source

	FROM Arvo_SA.sa.sa_arvo_kohteet f2
	LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet_taustatiedot tt ON tt.vastaajatunnusid = f2.vastaajatunnusid
	LEFT JOIN (
		--esim. vain taustakysymyksiin vastanneet kyselyn kohteiksi vaikkei itse kysymyksiä; poiskommentoitu aiemmat rajaus ja delete. JS 29.3.2022
		select v.* 
		from Arvo_SA.sa.sa_arvo_vastaukset v
		left join Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid = v.kysymysid
		where taustakysymyksen_tyyppi is null and coalesce(valtakunnallinen, 1) = 1 and coalesce(vastaustyyppi,'') != 'vapaateksti'
	) f on f.vastaajatunnusid = f2.vastaajatunnusid 
	LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset f3 on f3.kysymysid = f.kysymysid 
	LEFT JOIN Arvo_SA.sa.sa_arvo_kysely_kysymysryhma f4 on f4.kysymysryhmaid = f3.kysymysryhmaid and f4.kyselyid = f.kyselyid
	LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat f5 on f5.kyselykertaid = f2.kyselykertaid 
	--TAUSTAKYSYMYKSET
	LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi = 'toimipaikan_kunta') AS tk_tsk ON tk_tsk.vastaajaid = f.vastaajaid AND tk_tsk.kyselykertaid = f.kyselykertaid
	LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi = 'toimipaikan_maa') AS tk_tsm ON tk_tsm.vastaajaid = f.vastaajaid AND tk_tsm.kyselykertaid = f.kyselykertaid
	LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi = 'toimipaikka_suomessa') AS tk_sts ON tk_sts.vastaajaid = f.vastaajaid AND tk_sts.kyselykertaid = f.kyselykertaid
	LEFT JOIN (select * from #taustakysymykset where taustakysymyksen_tyyppi = 'tehtava_tyonantajalla') AS tk_teht ON tk_teht.vastaajaid = f.vastaajaid AND tk_teht.kyselykertaid = f.kyselykertaid
	
	WHERE 1=1
	AND f5.tyyppi in ('tyoelamapalaute','tyopaikkakysely')
	--AND coalesce(vastaustyyppi,'') != 'vapaateksti'

) MAIN_QUERY

LEFT JOIN dw.d_organisaatioluokitus d1a ON d1a.organisaatio_avain like 'oppilaitos_%' and d1a.organisaatio_koodi = MAIN_QUERY.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d1b ON d1b.organisaatio_avain like 'koulutustoimija_%' and d1b.organisaatio_koodi = MAIN_QUERY.koulutustoimija
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1c ON d1c.ytunnus_avain = d1b.organisaatio_koodi
LEFT JOIN dw.d_alueluokitus d2a ON d2a.kunta_koodi = d1a.kunta_koodi
LEFT JOIN dw.d_alueluokitus d2b ON d2b.kunta_koodi = d1b.kunta_koodi
LEFT JOIN dw.d_koulutusluokitus d3 ON d3.koulutusluokitus_avain like 'koulutus_%' and d3.koulutusluokitus_koodi = MAIN_QUERY.tutkintokoodi
LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = MAIN_QUERY.tyopaikkajakson_loppupvm
--LEFT JOIN dw.d_kalenteri d5a ON d5a.kalenteri_avain = MAIN_QUERY.vastaajatunnus_alkupvm
--LEFT JOIN dw.d_kalenteri d5b ON d5b.kalenteri_avain = MAIN_QUERY.vastausaika
LEFT JOIN dw.d_arvokysymys d6 ON d6.kysymysryhmaid = MAIN_QUERY.kysymysryhmaid AND d6.kysymysid = MAIN_QUERY.kysymysid AND d6.kysymysryhmajarjestys = MAIN_QUERY.kysymysryhmajarjestys
LEFT JOIN dw.d_arvokyselykerta d7 ON d7.kyselykertaid = MAIN_QUERY.kyselykertaid
LEFT JOIN dw.d_alueluokitus d9 ON d9.kunta_koodi = MAIN_QUERY.tsk_koodi 
LEFT JOIN dw.d_maatjavaltiot2 d10 ON d10.maatjavaltiot2_koodi = coalesce(MAIN_QUERY.tsm_koodi, case when MAIN_QUERY.sts_koodi = 'kylla' then (select maatjavaltiot2_koodi from dw.d_maatjavaltiot2 where maatjavaltiot2_fi = 'Suomi') end)
LEFT JOIN dw.d_arvovastaus_taustakysymys d11 ON d11.koodi = MAIN_QUERY.tk_teht_koodi and d11.kysymysid = MAIN_QUERY.tk_teht_kysymysid
LEFT JOIN dw.d_arvovastaus_monivalinta d15 ON d15.koodi = MAIN_QUERY.numerovalinta and d15.kysymysid = MAIN_QUERY.kysymysid
LEFT JOIN dw.d_kieli d16 ON d16.kieli_koodi = MAIN_QUERY.suorituskieli
LEFT JOIN dw.d_ytj_yritystiedot d17 ON d17.ytunnus = MAIN_QUERY.[taustatiedot.tyonantaja]
LEFT JOIN dw.d_oppisopimuksen_perusta d18 ON d18.koodi = MAIN_QUERY.[taustatiedot.oppisopimuksen_perusta]
LEFT JOIN dw.d_tutkinnon_osa d19 ON d19.koodi = MAIN_QUERY.[taustatiedot.tutkinnon_osa]
LEFT JOIN dw.d_osaamisen_hankkimistapa d20 ON d20.koodi = MAIN_QUERY.[taustatiedot.sopimustyyppi]
--työpaikkakyselyn rivien monistaminen työpaikkaohjaajan kyselyn kohteilla
OUTER APPLY (select * from #kyselyjen_linkitys kl where kl.tyopaikkakysely_vastaajatunnus = MAIN_QUERY.vastaajatunnus) oa
CROSS APPLY (select vaihtoehto = case MAIN_QUERY.vaihtoehto when 'kylla' then 'Kyllä' when 'ei' then 'Ei' else MAIN_QUERY.vaihtoehto end) ca


drop table if exists #taustakysymykset
drop table if exists #kyselyjen_linkitys


--työpaikkakyselyn taustatietojen päivittäminen työpaikkaohjaajan kyselyn taustatiedoilla
UPDATE f
SET 
	[d_organisaatio_oppilaitos_id] = coalesce(f2.[d_organisaatio_oppilaitos_id], f.[d_organisaatio_oppilaitos_id])
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

FROM dw.f_arvo_amis_tep f
LEFT JOIN dw.f_arvo_amis_tep f2 on f2.tyopaikkaohjaajakysely_vastaajatunnus = f.tyopaikkakysely_liittyva_ohjaajatunnus
WHERE f.tyopaikkakysely_liittyva_ohjaajatunnus is not null


----yhdistämisen jälkeen taustakysymysten ja ei-valtakunnallisten kysymysten poisto
--DELETE f 
--FROM dw.f_arvo_amis_tep f
--LEFT JOIN dw.d_arvokysymys d on d.id = f.d_arvokysymys_id
--LEFT JOIN Arvo_SA.sa.sa_arvo_kysymykset k on k.kysymysid = d.kysymysid
--WHERE coalesce(k.valtakunnallinen, 1) != 1 OR k.taustakysymyksen_tyyppi is not null


CREATE NONCLUSTERED INDEX [NC_arvo_amis_tep]
ON [dw].[f_arvo_amis_tep] ([d_koulutusluokitus_id])
INCLUDE ([d_organisaatio_oppilaitos_id],[d_kalenteri_jakso_paattynyt_id],[d_arvokyselykerta_id])


