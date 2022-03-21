USE [ANTERO]
GO

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
      ,COALESCE([kuukausi],'1900-01')+'-01'
      ,[vastauskertoja]
      ,'p_lataa_f_arvo_luodut_vastaajatunnukset'
FROM [Arvo_SA].[sa].[sa_arvo_luodut_vastaajatunnukset]
WHERE oppilaitoskoodi is not null and tutkintokoodi is not null
