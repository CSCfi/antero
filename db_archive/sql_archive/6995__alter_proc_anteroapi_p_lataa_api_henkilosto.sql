USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_henkilosto]    Script Date: 31.1.2023 11:54:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_henkilosto] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_henkilosto_esilataus]
END

IF ((((	select count (*) from (
		select	[tilastovuosi],[sukupuoli],[kansalaisuus],[tehtäväjaottelu],[tutkijanuravaihe_tai_tuntiopettajuus],[henkilöstöryhmä],[henkilöstöryhmä(harjoittelukoulut)],
				[merkittävimmän_tutkinnon_taso],[muun_henkilöstön_henkilöstöryhmä],[työsuhteen_nimitystapa],[sektori],[koulutusala_02],[Koulutusala_95],
				[okm_ohjauksen_ala],[päätieteenala],[tieteenala],[ammattikorkeakoulu],[yliopisto],[henkilotyovuosi],[koodit_tehtäväjaottelu],
				[koodit_ammattikorkeakoulu],[koodit_yliopisto],[koodit_henkilöstöryhmä],[koodit_okm_ohjauksen_ala],[koodit_tieteenala],[koodit_päätieteenala],
				[koodit_merkittävimmän_tutkinnon_taso],[koodit_muun_henkilöstön_henkilöstöryhmä],[koodit_työsuhteen_nimitystapa],[kansalaisuus_järj]
		from [dw].[api_henkilosto] s
		except
		select	[tilastovuosi],[sukupuoli],[kansalaisuus],[tehtäväjaottelu],[tutkijanuravaihe_tai_tuntiopettajuus],[henkilöstöryhmä],[henkilöstöryhmä(harjoittelukoulut)],
				[merkittävimmän_tutkinnon_taso],[muun_henkilöstön_henkilöstöryhmä],[työsuhteen_nimitystapa],[sektori],[koulutusala_02],[Koulutusala_95],
				[okm_ohjauksen_ala],[päätieteenala],[tieteenala],[ammattikorkeakoulu],[yliopisto],[henkilotyovuosi],[koodit_tehtäväjaottelu],
				[koodit_ammattikorkeakoulu],[koodit_yliopisto],[koodit_henkilöstöryhmä],[koodit_okm_ohjauksen_ala],[koodit_tieteenala],[koodit_päätieteenala],
				[koodit_merkittävimmän_tutkinnon_taso],[koodit_muun_henkilöstön_henkilöstöryhmä],[koodit_työsuhteen_nimitystapa],[kansalaisuus_järj]
		from [api].[henkilosto]) s ) > 0)
		or
		((select count(*) from [api].[henkilosto]) <> (select count(*) from [dw].[api_henkilosto])))
		and
		(select count(*) from [dw].[api_henkilosto]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
  
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
	  ,[tietojoukko_paivitetty_pvm]
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
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_henkilosto]

END

IF ((select count(*) from [dw].[api_henkilosto]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END
	

GO

USE [ANTERO]