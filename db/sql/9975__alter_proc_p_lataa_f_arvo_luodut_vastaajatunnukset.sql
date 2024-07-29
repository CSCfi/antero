USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset]    Script Date: 29.7.2024 15:08:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset] AS

DROP INDEX IF EXISTS [NC_arvo_luodut_vastaajatunnukset] ON [dw].[f_arvo_luodut_vastaajatunnukset]

TRUNCATE TABLE dw.f_arvo_luodut_vastaajatunnukset

INSERT INTO dw.f_arvo_luodut_vastaajatunnukset (
   [kyselykertaid]
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
	kyselykertaid
	,oppilaitoskoodi
	,ytunnus = koulutustoimija --coalesce(d2.organisaatio_koodi, ytunnus)
	,tutkintokoodi
	,kuukausi
	,vastauskertoja
	,tyonanataja
	,sopimustyyppi
	,oppisopimuksen_perusta
	--poistettu ks. CSCVIPUNEN-3260
	--,rahoitusryhma
	,jaksojen_kesto
	,Q.source
FROM (

	SELECT
		vt.[kyselykertaid]
		,[oppilaitoskoodi]
		,kk.koulutustoimija --ytunnus = null
		,[tutkintokoodi]
		,kuukausi = concat([kuukausi],'-01')
		,[vastauskertoja]
		,tyonanataja = null
		,sopimustyyppi = null
		,oppisopimuksen_perusta = null
		--poistettu ks. CSCVIPUNEN-3260
		--,rahoitusryhma = null
		,jaksojen_kesto = null
		,source = 'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM Arvo_SA.[sa].[sa_arvo_luodut_vastaajatunnukset] vt
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=vt.kyselykertaid
	WHERE 1=1
	--and oppilaitoskoodi is not null
	and kuukausi is not null
	and (kk.tyyppi not in ('ammatillisen-opiskelijapalaute', 'tyopaikkaohjaajakysely', 'amk-uraseuranta', 'avop', 'kandipalaute') or (kk.tyyppi = 'ammatillisen-opiskelijapalaute' and concat([kuukausi],'-01') < '2021-07-01'))

	UNION ALL

	SELECT --Irrotettu yltä, koska oppilaitoskoodi puuttuu oppisopimustoimistoilta ja taulu käytössä latauksessa [dw].[p_lataa_f_amos_opiskelijapalaute_vastausosuudet_kertoimet]. JS 25.10.2022
		k.kyselykertaid
		,k.oppilaitoskoodi
		,kk.koulutustoimija
		,k.tutkintokoodi
		,concat(year(k.vastaajatunnus_alkupvm),'-',right('0'+cast(month(k.vastaajatunnus_alkupvm) as varchar(2)),2),'-01')
		,count(distinct k.vastaajatunnus) --toimii amispalautteelle ainakin 07/2021 alkaen
		,null
		,null
		,null
		--poistettu ks. CSCVIPUNEN-3260
		--,k.[taustatiedot.rahoitusryhma]
		,null
		,'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM Arvo_SA.[sa].[sa_arvo_kohteet] k
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=k.kyselykertaid
	WHERE (kk.tyyppi = 'ammatillisen-opiskelijapalaute' and k.vastaajatunnus_alkupvm > '2021-06-30') or kk.tyyppi in ('avop', 'kandipalaute')
	GROUP BY k.kyselykertaid
		,oppilaitoskoodi
		,kk.koulutustoimija
		,tutkintokoodi
		--poistettu ks. CSCVIPUNEN-3260
		--,[taustatiedot.rahoitusryhma]
		,concat(year(k.vastaajatunnus_alkupvm),'-',right('0'+cast(month(k.vastaajatunnus_alkupvm) as varchar(2)),2),'-01')

	UNION ALL

	SELECT
		k.kyselykertaid
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
	WHERE kk.tyyppi = 'tyopaikkaohjaajakysely'
	GROUP BY k.kyselykertaid
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
		 k.[kyselykertaid]
		,k.[oppilaitoskoodi]
		,ytunnus = null
		,k.[tutkintokoodi]
		,k.vastaajatunnus_alkupvm
		,count(distinct k.vastaajatunnusid)
		,tyonanataja = null
		,sopimustyyppi = null
		,oppisopimuksen_perusta = null
		--poistettu ks. CSCVIPUNEN-3260
		--,rahoitusryhma = null
		,jaksojen_kesto = null
		,'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM Arvo_SA.[sa].[sa_arvo_kohteet_taustatiedot] vt
	LEFT JOIN Arvo_SA.sa.sa_arvo_kohteet k on k.vastaajatunnusid = vt.vastaajatunnusid
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=k.kyselykertaid
	WHERE k.oppilaitoskoodi is not null and kk.tyyppi = ('amk-uraseuranta') and YEAR(k.vastaajatunnus_alkupvm) > 2017
	GROUP BY k.[kyselykertaid],k.[oppilaitoskoodi],k.[tutkintokoodi],k.vastaajatunnus_alkupvm

) Q
--LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = Q.oppilaitoskoodi
--LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_oid = d1.ylaorganisaatio_oid


CREATE NONCLUSTERED INDEX [NC_arvo_luodut_vastaajatunnukset]
ON [dw].[f_arvo_luodut_vastaajatunnukset] ([kyselykertaid])
INCLUDE ([oppilaitoskoodi],[tutkintokoodi],[kuukausi],[vastaajatunnukset_lkm])


GO
