USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset]    Script Date: 12.5.2022 9:57:20 ******/
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
  ,[jaksojen_kesto]
  ,source
)

SELECT 
	kyselykertaid
	,oppilaitoskoodi
	,ytunnus = d2.organisaatio_koodi
	,tutkintokoodi
	,kuukausi
	,vastauskertoja
	,tyonanataja
	,sopimustyyppi
	,oppisopimuksen_perusta
	,jaksojen_kesto
	,Q.source
FROM (

	SELECT
		vt.[kyselykertaid]
		,[oppilaitoskoodi]
		,[tutkintokoodi]
		,kuukausi = concat([kuukausi],'-01')
		,[vastauskertoja]
		,tyonanataja = null
		,sopimustyyppi = null
		,oppisopimuksen_perusta = null
		,jaksojen_kesto = null
		,source = 'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM [Arvo_SA].[sa].[sa_arvo_luodut_vastaajatunnukset] vt
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=vt.kyselykertaid
	WHERE oppilaitoskoodi is not null and kuukausi is not null
	and kk.tyyppi not in ('tyoelamapalaute', 'amk-uraseuranta')

	UNION ALL

	SELECT
		k.kyselykertaid
		,oppilaitoskoodi
		,tutkintokoodi
		,concat(year(k.vastaajatunnus_alkupvm),'-',right('0'+cast(month(k.vastaajatunnus_alkupvm) as varchar(2)),2),'-01')
		,count(distinct k.vastaajatunnus)
		,d.ytunnus
		,k.[taustatiedot.sopimustyyppi]
		,k.[taustatiedot.oppisopimuksen_perusta]
		,sum(cast(k.[taustatiedot.tyopaikkajakson_kesto] as float))
		,'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM [Arvo_SA].[sa].[sa_arvo_kohteet] k
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=k.kyselykertaid
	LEFT JOIN ANTERO.dw.d_ytj_yritystiedot d on d.ytunnus = [taustatiedot.tyonantaja]
	WHERE kk.tyyppi = 'tyoelamapalaute'
	GROUP BY k.kyselykertaid
		,oppilaitoskoodi
		,tutkintokoodi
		,concat(year(k.vastaajatunnus_alkupvm),'-',right('0'+cast(month(k.vastaajatunnus_alkupvm) as varchar(2)),2),'-01')
		,d.ytunnus
		,k.[taustatiedot.sopimustyyppi]
		,k.[taustatiedot.oppisopimuksen_perusta]

	UNION ALL

	SELECT
		vt.[kyselykertaid]
		,[oppilaitoskoodi]
		,[tutkintokoodi]
		,concat(coalesce([kuukausi],concat(kk.kyselykerta_vuosi, '-10')),'-01')
		,sum([vastauskertoja])
		,null
		,null
		,null
		,null
		,'p_lataa_f_arvo_luodut_vastaajatunnukset'
	FROM [Arvo_SA].[sa].[sa_arvo_luodut_vastaajatunnukset] vt
	JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=vt.kyselykertaid
	WHERE oppilaitoskoodi is not null
	and kk.tyyppi = 'amk-uraseuranta'
	GROUP BY vt.[kyselykertaid],[oppilaitoskoodi],[tutkintokoodi],concat(coalesce([kuukausi],concat(kk.kyselykerta_vuosi, '-10')),'-01')

) Q
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = Q.oppilaitoskoodi
LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_oid = d1.ylaorganisaatio_oid


CREATE NONCLUSTERED INDEX [NC_arvo_luodut_vastaajatunnukset]
ON [dw].[f_arvo_luodut_vastaajatunnukset] ([kyselykertaid])
INCLUDE ([oppilaitoskoodi],[tutkintokoodi],[kuukausi],[vastaajatunnukset_lkm])





GO

USE [ANTERO]