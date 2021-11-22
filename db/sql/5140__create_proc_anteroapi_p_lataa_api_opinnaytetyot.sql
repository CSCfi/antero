USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_opinnaytetyot]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dw].[p_lataa_api_opinnaytetyot] AS

BEGIN
  EXEC dw.p_lataa_api_opinnaytetyot_esilataus
END

IF (select count(*) from dw.api_opinnaytetyot) > 0

BEGIN

  TRUNCATE TABLE [api].[opinnaytetyot]

  INSERT INTO [api].[opinnaytetyot] (
	 [defaultorder]
      ,[tilastovuosi]
      ,[okm_ohjauksen_ala]
      ,[koulutusala_02]
      ,[koulutustyyppi]
      ,[koulutusaste]
      ,[ammattikorkeakoulu]
      ,[hankkeistetut_opinnaytetyot]
      ,[opinnaytetyot_ei_hankkeistetut]
      ,[koodit_koulutusala_2002]
      ,[koodit_okm_ohjauksen_ala]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_koulutustyyppi]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[okm_ohjauksen_ala]
      ,[koulutusala_02]
      ,[koulutustyyppi]
      ,[koulutusaste]
      ,[ammattikorkeakoulu]
      ,[hankkeistetut_opinnaytetyot]
      ,[opinnaytetyot_ei_hankkeistetut]
      ,[koodit_koulutusala_2002]
      ,[koodit_okm_ohjauksen_ala]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_koulutustyyppi]
  FROM [dw].[api_opinnaytetyot]

END

ELSE RAISERROR('Source table has no rows.',11,1)

GO
	
USE [ANTERO]