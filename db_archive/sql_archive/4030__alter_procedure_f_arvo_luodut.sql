USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset]    Script Date: 23.10.2020 11:00:49 ******/
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
       [kyselykertaid]
      ,[oppilaitoskoodi]
      ,[tutkintokoodi]
      ,concat([kuukausi],'-01')
      ,[vastauskertoja]
      ,'p_lataa_f_arvo_luodut_vastaajatunnukset'
FROM [Arvo_SA].[sa].[sa_arvo_luodut_vastaajatunnukset]
WHERE oppilaitoskoodi is not null and kuukausi is not null
