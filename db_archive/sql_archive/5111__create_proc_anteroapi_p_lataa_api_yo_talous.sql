USE [AnteroAPI]
GO


DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_yo_talous]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_yo_talous] AS

BEGIN
  EXEC [dw].[p_lataa_api_yo_talous_esilataus]
END

IF (select count(*) from [dw].[api_yo_talous]) > 0

BEGIN
	  TRUNCATE TABLE [api].[yo_talous]

  INSERT INTO [api].[yo_talous] (
     [defaultorder]
      ,[Tilastovuosi]
      ,[Konserni]
      ,[Yliopisto]
      ,[Koulutusala]
      ,[Aineisto]
      ,[Ohjauksenala]
      ,[Statistikår]
      ,[Universitet]
      ,[Utbildningsområde]
      ,[Material typ]
      ,[Ohjauksenala_sv]
      ,[Statistical year]
      ,[University]
      ,[Field of education]
      ,[Material type]
      ,[Ohjauksenala_en]
      ,[Koodit_yliopisto]
      ,[Koodit_koulutusala]
      ,[Koodit_aineisto]
      ,[Koodit_ohjauksenala]
      ,[tili_taso0_fi]
      ,[tili_taso1_fi]
      ,[tili_taso2_fi]
      ,[tili_taso3_fi]
      ,[tili_taso4_fi]
      ,[tili_taso5_fi]
      ,[tili_taso0_sv]
      ,[tili_taso1_sv]
      ,[tili_taso2_sv]
      ,[tili_taso3_sv]
      ,[tili_taso4_sv]
      ,[tili_taso5_sv]
      ,[tili_taso0_en]
      ,[tili_taso1_en]
      ,[tili_taso2_en]
      ,[tili_taso3_en]
      ,[tili_taso4_en]
      ,[tili_taso5_en]
      ,[toiminto_nimi_fi]
      ,[arvo])

  SELECT
    [defaultorder]
    ,[Tilastovuosi]
    ,[Konserni]
    ,[Yliopisto]
    ,[Koulutusala]
    ,[Aineisto]
    ,[Ohjauksenala]
    ,[Statistikår]
    ,[Universitet]
    ,[Utbildningsområde]
    ,[Material typ]
    ,[Ohjauksenala_sv]
    ,[Statistical year]
    ,[University]
    ,[Field of education]
    ,[Material type]
    ,[Ohjauksenala_en]
    ,[Koodit_yliopisto]
    ,[Koodit_koulutusala]
    ,[Koodit_aineisto]
    ,[Koodit_ohjauksenala]
    ,[tili_taso0_fi]
    ,[tili_taso1_fi]
    ,[tili_taso2_fi]
    ,[tili_taso3_fi]
    ,[tili_taso4_fi]
    ,[tili_taso5_fi]
    ,[tili_taso0_sv]
    ,[tili_taso1_sv]
    ,[tili_taso2_sv]
    ,[tili_taso3_sv]
    ,[tili_taso4_sv]
    ,[tili_taso5_sv]
    ,[tili_taso0_en]
    ,[tili_taso1_en]
    ,[tili_taso2_en]
    ,[tili_taso3_en]
    ,[tili_taso4_en]
    ,[tili_taso5_en]
    ,[toiminto_nimi_fi]
    ,[arvo]

  FROM [dw].[api_yo_talous]

END

ELSE RAISERROR('Source table has no rows.',11,1)

GO
