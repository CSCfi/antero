USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset]    Script Date: 28.2.2019 16:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset] AS

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
      ,[kuukausi]+'-01'
      ,[vastauskertoja]
      ,'p_lataa_f_arvo_luodut_vastaajatunnukset'
FROM [Arvo_SA].[sa].[sa_arvo_luodut_vastaajatunnukset]
WHERE oppilaitoskoodi is not null and tutkintokoodi is not null
