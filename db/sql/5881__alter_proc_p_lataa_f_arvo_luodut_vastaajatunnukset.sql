ALTER PROCEDURE [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset] AS

TRUNCATE TABLE dw.f_arvo_luodut_vastaajatunnukset

INSERT INTO dw.f_arvo_luodut_vastaajatunnukset (
   [kyselykertaid]
  ,[oppilaitoskoodi]
  ,[tutkintokoodi]
  ,[kuukausi]
  ,[vastaajatunnukset_lkm]
  ,source
)
SELECT
       vt.[kyselykertaid]
      ,[oppilaitoskoodi]
      ,[tutkintokoodi]
      ,concat([kuukausi],'-01')
      ,[vastauskertoja]
      ,'p_lataa_f_arvo_luodut_vastaajatunnukset'
FROM [Arvo_SA].[sa].[sa_arvo_luodut_vastaajatunnukset] vt
JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=vt.kyselykertaid
WHERE oppilaitoskoodi is not null and kuukausi is not null and kk.tyyppi != ('amk-uraseuranta')

UNION ALL

SELECT
       vt.[kyselykertaid]
      ,[oppilaitoskoodi]
      ,[tutkintokoodi]
      ,concat(coalesce([kuukausi],concat(kk.kyselykerta_vuosi, '-10')),'-01')
      ,[vastauskertoja]
      ,'p_lataa_f_arvo_luodut_vastaajatunnukset'
FROM [Arvo_SA].[sa].[sa_arvo_luodut_vastaajatunnukset] vt
JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=vt.kyselykertaid
WHERE oppilaitoskoodi is not null and kk.tyyppi = ('amk-uraseuranta')

GO

USE [ANTERO]