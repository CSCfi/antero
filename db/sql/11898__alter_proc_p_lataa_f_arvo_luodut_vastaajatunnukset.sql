USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset]    Script Date: 16.3.2026 10.46.46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset] AS

DROP INDEX IF EXISTS [NC_arvo_luodut_vastaajatunnukset] ON [dw].[f_arvo_luodut_vastaajatunnukset]

TRUNCATE TABLE dw.f_arvo_luodut_vastaajatunnukset

INSERT INTO dw.f_arvo_luodut_vastaajatunnukset (
   [kyselyid]
  ,toimipiste_oid
  ,[oppilaitoskoodi]
  ,[ytunnus]
  ,[tutkintokoodi]
  ,[kuukausi]
  ,[vastaajatunnukset_lkm]
  ,[tyonantaja]
  ,[sopimustyyppi]
  ,[oppisopimuksen_perusta]
	--poistettu ks. CSCVIPUNEN-3260
	--,[rahoitusryhma]
  ,[jaksojen_kesto]
  ,source
)

SELECT
	kyselyid
	,toimipiste_oid
	,oppilaitoskoodi
	,ytunnus = koulutustoimija --coalesce(d2.organisaatio_koodi, ytunnus)
	,tutkintokoodi
	,kuukausi
	,vastauskertoja
	,tyonantaja
	,sopimustyyppi
	,oppisopimuksen_perusta
	--poistettu ks. CSCVIPUNEN-3260
	--,rahoitusryhma
	,jaksojen_kesto
	,Q.source
FROM (
	SELECT
		vt.kyselyid
		,toimipiste_oid = null
		,[oppilaitoskoodi]
		,kk.koulutustoimija --ytunnus = null
		,[tutkintokoodi]
		,kuukausi = concat([kuukausi],'-01')
		,[vastauskertoja]
		,tyonantaja = null
		,sopimustyyppi = null
		,oppisopimuksen_perusta = null
		--poistettu ks. CSCVIPUNEN-3260
		--,rahoitusryhma = null
		,jaksojen_kesto = null
		,source = 'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM Arvo_SA.[sa].[sa_arvo_luodut_vastaajatunnukset] vt
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselyid=vt.kyselyid
	WHERE 1=1
	--and oppilaitoskoodi is not null
	and kuukausi is not null
	and (kk.tyyppi not in ('ammatillisen-opiskelijapalaute', 'tyopaikkaohjaajakysely', 'amk-uraseuranta', 'kandipalaute', 'avop') or (kk.tyyppi = 'ammatillisen-opiskelijapalaute' and concat([kuukausi],'-01') < '2021-07-01'))

	UNION ALL

	SELECT --Irrotettu yltä, koska oppilaitoskoodi puuttuu oppisopimustoimistoilta ja taulu käytössä latauksessa [dw].[p_lataa_f_amos_opiskelijapalaute_vastausosuudet_kertoimet]. JS 25.10.2022
		k.kyselyid
		,k.toimipiste_oid
		,k.oppilaitoskoodi
		,d1.organisaatio_koodi as koulutustoimija
		,k.tutkinto as tutkintokoodi
		,concat(year(k.voimassa_alkupvm),'-',right('0'+cast(month(k.voimassa_alkupvm) as varchar(2)),2),'-01')
		,count(distinct k.vastaajatunnus) --toimii amispalautteelle ainakin 07/2021 alkaen
		,null
		,null
		,null
		--poistettu ks. CSCVIPUNEN-3260
		--,k.[taustatiedot.rahoitusryhma]
		,null
		,'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM  Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset k
	JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt kk on kk.kyselyid=k.kyselyid
	LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_oid=kk.koulutustoimija_oid
	WHERE (kk.kyselytyyppi = 'ammatillisen-opiskelijapalaute' and k.voimassa_alkupvm between '2021-07-01' and '2024-06-30')
	GROUP BY k.kyselyid
		,k.toimipiste_oid
		,oppilaitoskoodi
		,d1.organisaatio_koodi
		,k.tutkinto
		--poistettu ks. CSCVIPUNEN-3260
		--,[taustatiedot.rahoitusryhma]
		,concat(year(k.voimassa_alkupvm),'-',right('0'+cast(month(k.voimassa_alkupvm) as varchar(2)),2),'-01')

UNION ALL

	SELECT  --s24 alkaen ajoittaminen herätepvm perusteella (null vanhoilla, osin alkupvm s22 asti). JS 1.9.2025
		k.kyselyid
		,k.toimipiste_oid
		,k.oppilaitoskoodi
		,d1.organisaatio_koodi as koulutustoimija
		,k.tutkinto as tutkintokoodi
		,concat(year(k.[heratepvm]),'-',right('0'+cast(month(k.[heratepvm]) as varchar(2)),2),'-01')
		,count(distinct k.vastaajatunnus) --toimii amispalautteelle ainakin 07/2021 alkaen
		,null
		,null
		,null
		--poistettu ks. CSCVIPUNEN-3260
		--,k.[taustatiedot.rahoitusryhma]
		,null
		,'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM  Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset k
	JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt kk on kk.kyselyid=k.kyselyid
	LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_oid=kk.koulutustoimija_oid
	WHERE (kk.kyselytyyppi = 'ammatillisen-opiskelijapalaute' and k.[heratepvm] > '2024-06-30' and k.vastaajatunnusid != 1224658)
	GROUP BY k.kyselyid
		,k.toimipiste_oid
		,oppilaitoskoodi
		,d1.organisaatio_koodi
		,k.tutkinto
		--poistettu ks. CSCVIPUNEN-3260
		--,[taustatiedot.rahoitusryhma]
		,concat(year(k.[heratepvm]),'-',right('0'+cast(month(k.[heratepvm]) as varchar(2)),2),'-01')

	UNION ALL

	SELECT
		k.kyselyid
		,NULL as toimipiste_oid
		,k.oppilaitoskoodi
		,kk.koulutustoimija
		,k.tutkintokoodi
		,concat(year(k.vastaajatunnus_alkupvm),'-',right('0'+cast(month(k.vastaajatunnus_alkupvm) as varchar(2)),2),'-01')
		,count(distinct k.vastaajatunnus)
		,d.ytunnus
		,k.[taustatiedot.sopimustyyppi]
		,k.[taustatiedot.oppisopimuksen_perusta]
		--poistettu ks. CSCVIPUNEN-3260
		--,k.[taustatiedot.rahoitusryhma]
		,sum(cast(k.[taustatiedot.tyopaikkajakson_kesto] as float))
		,'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM Arvo_SA.[sa].[sa_arvo_kohteet] k
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=k.kyselykertaid
	LEFT JOIN dw.d_ytj_yritystiedot d on d.ytunnus = [taustatiedot.tyonantaja]
	WHERE kk.tyyppi = 'tyopaikkaohjaajakysely' and k.vastaajatunnus_alkupvm  < '2021-07-01'
	GROUP BY k.kyselyid
		,k.oppilaitoskoodi
		,kk.koulutustoimija
		,k.tutkintokoodi
		,concat(year(k.vastaajatunnus_alkupvm),'-',right('0'+cast(month(k.vastaajatunnus_alkupvm) as varchar(2)),2),'-01')
		,d.ytunnus
		,k.[taustatiedot.sopimustyyppi]
		,k.[taustatiedot.oppisopimuksen_perusta]
		--poistettu ks. CSCVIPUNEN-3260
		--,k.[taustatiedot.rahoitusryhma]

	UNION ALL

	SELECT
		k.kyselyid
		,NULL as toimipiste_oid
		,k.oppilaitoskoodi
		,d1.organisaatio_koodi as koulutustoimija
		,k.tutkinto as tutkintokoodi
		,concat(year(k.voimassa_alkupvm),'-',right('0'+cast(month(k.voimassa_alkupvm) as varchar(2)),2),'-01')
		,count(distinct k.vastaajatunnus)
		,d.ytunnus
		,k.osaamisen_hankkimistapa
		,k.oppisopimuksen_perusta
		--poistettu ks. CSCVIPUNEN-3260
		--,k.[taustatiedot.rahoitusryhma]
		,sum(cast(k.tyopaikkajakson_kesto as float))
		,'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset k
	JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt kk on kk.kyselyid=k.kyselyid
	LEFT JOIN dw.d_ytj_yritystiedot d on d.ytunnus = tyonantaja
	LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_oid=kk.koulutustoimija_oid
	WHERE kk.kyselytyyppi = 'tyopaikkaohjaajakysely' and k.voimassa_alkupvm > '2021-06-30'
	GROUP BY k.kyselyid
		,k.oppilaitoskoodi
		,d1.organisaatio_koodi
		,k.tutkinto
		,concat(year(k.voimassa_alkupvm),'-',right('0'+cast(month(k.voimassa_alkupvm) as varchar(2)),2),'-01')
		,d.ytunnus
		,k.osaamisen_hankkimistapa
		,k.oppisopimuksen_perusta
		--poistettu ks. CSCVIPUNEN-3260
		--,k.[taustatiedot.rahoitusryhma]

	UNION ALL

	SELECT  
		k.kyselyid,
		NULL as toimipiste_oid,
		k.oppilaitoskoodi,
		NULL as koulutustoimija,
		k.tutkinto as tutkintokoodi,
		DATEADD(day,1,EOMONTH(DATEADD(month,-1,k.voimassa_alkupvm))) as kuukausi,
		COALESCE(SUM(k.kohteiden_lkm),0) as vastauskertoja,
		NULL as tyonantaja,
		NULL as sopimustyyppi,
		NULL as oppisopimuksen_perusta,
		NULL as jaksojen_kesto,
		'p_lataa_f_arvo_luodut_vastaajatunnukset' as source
	FROM Arvo_SA.sa.sa_arvo_v2_vastaajatunnukset k
	LEFT JOIN Arvo_SA.sa.sa_arvo_v2_kyselyt kk on k.kyselyid = kk.kyselyid
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.organisaatio_koodi = k.oppilaitoskoodi
	WHERE (kk.kyselytyyppi = 'avop' OR kk.kyselytyyppi in ('amk-uraseuranta', 'kandipalaute')) AND k.oppilaitoskoodi is not null
	AND CAST(RIGHT(kk.tiedonkeruu,4) as int) >= 2022
	GROUP BY
	k.kyselyid,
	k.oppilaitoskoodi,
	k.tutkinto,
	DATEADD(day,1,EOMONTH(DATEADD(month,-1,k.voimassa_alkupvm)))

	UNION ALL

	SELECT  
		k.kyselyid,
		NULL as toimipiste_oid,
		k.oppilaitoskoodi,
		NULL as koulutustoimija,
		k.tutkintokoodi,
		DATEADD(day,1,EOMONTH(DATEADD(month,-1,vastaajatunnus_alkupvm))) as kuukausi,
		COALESCE(SUM(k.kohteiden_lkm),0) as vastauskertoja,
		NULL as tyonantaja,
		NULL as sopimustyyppi,
		NULL as oppisopimuksen_perusta,
		NULL as jaksojen_kesto,
		'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM [Arvo_SA].[sa].[sa_arvo_kohteet] k
	LEFT JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on k.kyselyid = kk.kyselyid
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.organisaatio_koodi = k.oppilaitoskoodi
	WHERE ((kk.tyyppi = 'avop' AND kk.kyselykerta_vuosi between 2017 and 2021) OR (kk.tyyppi in ('amk-uraseuranta', 'kandipalaute') AND kk.kyselykerta_vuosi BETWEEN 2018 AND 2021)) AND k.oppilaitoskoodi is not null
	GROUP BY
	k.kyselyid,
	k.oppilaitoskoodi,
	k.tutkintokoodi,
	DATEADD(day,1,EOMONTH(DATEADD(month,-1,vastaajatunnus_alkupvm)))

) Q
--LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = Q.oppilaitoskoodi
--LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_oid = d1.ylaorganisaatio_oid


CREATE NONCLUSTERED INDEX [NC_arvo_luodut_vastaajatunnukset]
ON [dw].[f_arvo_luodut_vastaajatunnukset] ([kyselyid])
INCLUDE ([oppilaitoskoodi],[tutkintokoodi],[kuukausi],[vastaajatunnukset_lkm])