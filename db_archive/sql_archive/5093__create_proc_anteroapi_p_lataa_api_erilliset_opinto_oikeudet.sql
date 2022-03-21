USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_erilliset_opinto_oikeudet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_erilliset_opinto_oikeudet] AS

BEGIN
  EXEC [dw].[p_lataa_api_erilliset_opinto_oikeudet_esilataus]
END

IF (select count(*) from [dw].[api_erilliset_opinto_oikeudet]) > 0

BEGIN
  
  TRUNCATE TABLE [api].[erilliset_opinto_oikeudet]

  INSERT INTO [api].[erilliset_opinto_oikeudet] (
       [defaultorder]
      ,[tilastovuosi]
      ,[koulutusala]
      ,[okm_ohjauksen_ala]
      ,[yliopisto]
      ,[suorittaneiden_lkm]
      ,[opettajakoulutus_suorittaneiden_lkm]
      ,[erillisilla_oik_op_lkm]
      ,[erillisilla_oik_opkoul_op_lkm]
      ,[koodit_yliopisto]
      ,[koodit_koulutusala]
      ,[koodit_okm_ohjauksen_ala]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[koulutusala]
      ,[okm_ohjauksen_ala]
      ,[yliopisto]
      ,[suorittaneiden_lkm]
      ,[opettajakoulutus_suorittaneiden_lkm]
      ,[erillisilla_oik_op_lkm]
      ,[erillisilla_oik_opkoul_op_lkm]
      ,[koodit_yliopisto]
      ,[koodit_koulutusala]
      ,[koodit_okm_ohjauksen_ala]
  FROM [dw].[api_erilliset_opinto_oikeudet]

END

ELSE RAISERROR('Source table has no rows.',11,1)
 
GO

USE [ANTERO]
