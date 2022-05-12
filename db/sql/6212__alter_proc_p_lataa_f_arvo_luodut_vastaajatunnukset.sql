USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset]    Script Date: 12.5.2022 10:00:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
      ,sum([vastauskertoja])
      ,'p_lataa_f_arvo_luodut_vastaajatunnukset'
FROM [Arvo_SA].[sa].[sa_arvo_luodut_vastaajatunnukset] vt
JOIN Arvo_SA.sa.sa_arvo_kyselykerrat kk on kk.kyselykertaid=vt.kyselykertaid
WHERE oppilaitoskoodi is not null and kk.tyyppi = ('amk-uraseuranta')
GROUP BY vt.[kyselykertaid],[oppilaitoskoodi],[tutkintokoodi],concat(coalesce([kuukausi],concat(kk.kyselykerta_vuosi, '-10')),'-01')

GO


USE [ANTERO]