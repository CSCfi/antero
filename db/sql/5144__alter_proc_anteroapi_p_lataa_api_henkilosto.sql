USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_henkilosto]    Script Date: 22.11.2021 15:50:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_henkilosto] AS

BEGIN
  EXEC [dw].[p_lataa_api_henkilosto_esilataus]
END

IF (select count(*) from [dw].[api_henkilosto]) > 0

BEGIN
  
  TRUNCATE TABLE [api].[henkilosto]

  INSERT INTO [api].[henkilosto] (
       [defaultorder]
      ,[tilastovuosi]
      ,[sukupuoli]
      ,[kansalaisuus]
      ,[tehtäväjaottelu]
      ,[tutkijanuravaihe_tai_tuntiopettajuus]
      ,[henkilöstöryhmä]
      ,[henkilöstöryhmä(harjoittelukoulut)]
      ,[merkittävimmän_tutkinnon_taso]
      ,[muun_henkilöstön_henkilöstöryhmä]
      ,[työsuhteen_nimitystapa]
      ,[sektori]
      ,[koulutusala_02]
      ,[Koulutusala_95]
      ,[okm_ohjauksen_ala]
      ,[päätieteenala]
      ,[tieteenala]
      ,[ammattikorkeakoulu]
      ,[yliopisto]
      ,[henkilotyovuosi]
      ,[koodit_tehtäväjaottelu]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_yliopisto]
      ,[koodit_henkilöstöryhmä]
      ,[koodit_okm_ohjauksen_ala]
      ,[koodit_tieteenala]
      ,[koodit_päätieteenala]
      ,[koodit_merkittävimmän_tutkinnon_taso]
      ,[koodit_muun_henkilöstön_henkilöstöryhmä]
      ,[koodit_työsuhteen_nimitystapa]
      ,[kansalaisuus_järj]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[sukupuoli]
      ,[kansalaisuus]
      ,[tehtäväjaottelu]
      ,[tutkijanuravaihe_tai_tuntiopettajuus]
      ,[henkilöstöryhmä]
      ,[henkilöstöryhmä(harjoittelukoulut)]
      ,[merkittävimmän_tutkinnon_taso]
      ,[muun_henkilöstön_henkilöstöryhmä]
      ,[työsuhteen_nimitystapa]
      ,[sektori]
      ,[koulutusala_02]
      ,[Koulutusala_95]
      ,[okm_ohjauksen_ala]
      ,[päätieteenala]
      ,[tieteenala]
      ,[ammattikorkeakoulu]
      ,[yliopisto]
      ,[henkilotyovuosi]
      ,[koodit_tehtäväjaottelu]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_yliopisto]
      ,[koodit_henkilöstöryhmä]
      ,[koodit_okm_ohjauksen_ala]
      ,[koodit_tieteenala]
      ,[koodit_päätieteenala]
      ,[koodit_merkittävimmän_tutkinnon_taso]
      ,[koodit_muun_henkilöstön_henkilöstöryhmä]
      ,[koodit_työsuhteen_nimitystapa]
      ,[kansalaisuus_järj]
  FROM [dw].[api_henkilosto]

END

ELSE RAISERROR('Source table has no rows.',11,1)
	
GO

USE [ANTERO]
