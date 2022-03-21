USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_muu_henkilosto_amk]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dw].[p_lataa_api_muu_henkilosto_amk] AS

BEGIN
  EXEC dw.p_lataa_api_muu_henkilosto_amk_esilataus
END

IF (select count(*) from dw.api_muu_henkilosto_amk) > 0

BEGIN

  TRUNCATE TABLE [api].[muu_henkilosto_amk]

  INSERT INTO [api].[muu_henkilosto_amk] (
	  [defaultorder]
      ,[tilastovuosi]
      ,[henkilöstöryhmä]
      ,[koulutusala]
      ,[okm_ohjauksen_ala]
      ,[ammattikorkeakoulu]
      ,[sivutoimisten_tuntiopettajien_opetustunnit]
      ,[ostopalveluna_hankittu_tuntiopetus]
      ,[henkilostoryhman_tunnit_lkm]
      ,[koodit_koulutusala]
      ,[koodit_okm_ohjauksen_ala]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_henkilöstöryhmä]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[henkilöstöryhmä]
      ,[koulutusala]
      ,[okm_ohjauksen_ala]
      ,[ammattikorkeakoulu]
      ,[sivutoimisten_tuntiopettajien_opetustunnit]
      ,[ostopalveluna_hankittu_tuntiopetus]
      ,[henkilostoryhman_tunnit_lkm]
      ,[koodit_koulutusala]
      ,[koodit_okm_ohjauksen_ala]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_henkilöstöryhmä]
  FROM [dw].[api_muu_henkilosto_amk]

END

ELSE RAISERROR('Source table has no rows.',11,1)

GO
	
USE [ANTERO]