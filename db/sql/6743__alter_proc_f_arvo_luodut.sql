USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset]    Script Date: 7.12.2022 21:46:46 ******/
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
  ,[rahoitusryhma]
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
    ,rahoitusryhma
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
		,rahoitusryhma = null
		,jaksojen_kesto = null
		,source = 'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM Arvo_SA.[sa].[sa_arvo_luodut_vastaajatunnukset] vt
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=vt.kyselykertaid
	WHERE 1=1
	--and oppilaitoskoodi is not null 
	and kuukausi is not null
	and (kk.tyyppi not in ('amispalaute', 'tyoelamapalaute', 'amk-uraseuranta') or (kk.tyyppi = 'amispalaute' and concat([kuukausi],'-01') < '2021-07-01'))

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
		,k.[taustatiedot.rahoitusryhma]
		,null
		,'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM Arvo_SA.[sa].[sa_arvo_kohteet] k
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=k.kyselykertaid
	WHERE kk.tyyppi = 'amispalaute' and k.vastaajatunnus_alkupvm > '2021-06-30'
	GROUP BY k.kyselykertaid
		,oppilaitoskoodi
		,kk.koulutustoimija
		,tutkintokoodi
		,[taustatiedot.rahoitusryhma]
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
		,k.[taustatiedot.rahoitusryhma]
		,sum(cast(k.[taustatiedot.tyopaikkajakson_kesto] as float))
		,'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM Arvo_SA.[sa].[sa_arvo_kohteet] k
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=k.kyselykertaid
	LEFT JOIN dw.d_ytj_yritystiedot d on d.ytunnus = [taustatiedot.tyonantaja]
	WHERE kk.tyyppi = 'tyoelamapalaute'
	GROUP BY k.kyselykertaid
		,k.oppilaitoskoodi
		,kk.koulutustoimija
		,k.tutkintokoodi
		,concat(year(k.vastaajatunnus_alkupvm),'-',right('0'+cast(month(k.vastaajatunnus_alkupvm) as varchar(2)),2),'-01')
		,d.ytunnus
		,k.[taustatiedot.sopimustyyppi]
		,k.[taustatiedot.oppisopimuksen_perusta]
		,k.[taustatiedot.rahoitusryhma]

	UNION ALL

	SELECT
       vt.[kyselykertaid]
      ,[oppilaitoskoodi]
	  ,ytunnus = null
      ,[tutkintokoodi]
      ,concat(coalesce(concat(LEFT([kuukausi],4),'-10'),concat(kk.kyselykerta_vuosi, '-10')),'-01')
      ,sum([vastauskertoja])
	  ,tyonanataja = null
	  ,sopimustyyppi = null
	  ,oppisopimuksen_perusta = null
	  ,rahoitusryhma = null
	  ,jaksojen_kesto = null
      ,'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM Arvo_SA.[sa].[sa_arvo_luodut_vastaajatunnukset] vt
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=vt.kyselykertaid
	WHERE oppilaitoskoodi is not null and kk.tyyppi = ('amk-uraseuranta')
	GROUP BY vt.[kyselykertaid],[oppilaitoskoodi],[tutkintokoodi],concat(coalesce(concat(LEFT([kuukausi],4),'-10'),concat(kk.kyselykerta_vuosi, '-10')),'-01')

) Q
--LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = Q.oppilaitoskoodi
--LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_oid = d1.ylaorganisaatio_oid


CREATE NONCLUSTERED INDEX [NC_arvo_luodut_vastaajatunnukset]
ON [dw].[f_arvo_luodut_vastaajatunnukset] ([kyselykertaid])
INCLUDE ([oppilaitoskoodi],[tutkintokoodi],[kuukausi],[vastaajatunnukset_lkm])
