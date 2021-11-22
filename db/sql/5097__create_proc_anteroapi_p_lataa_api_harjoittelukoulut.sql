USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_harjoittelukoulut]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dw].[p_lataa_api_harjoittelukoulut] AS

BEGIN
  EXEC [dw].[p_lataa_api_harjoittelukoulut_esilataus]
END

IF (select count(*) from [dw].[api_harjoittelukoulut]) > 0

BEGIN
  
  TRUNCATE TABLE [api].[harjoittelukoulut]

  INSERT INTO [api].[harjoittelukoulut] (
       [defaultorder]
      ,[tilastovuosi]
      ,[yliopisto]
      ,[henkilostoryhma]
      ,[koulutusala]
      ,[ohjauksen_ala]
      ,[harjoittelukoulun_oppilaat_esiopetus]
      ,[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6]
      ,[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9]
      ,[harjoittelukoulun_oppilaat_lukio]
      ,[harjoittelukoulun_oppilaat_yhteensa]
      ,[harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit]
      ,[harjoittelukoulun_kokonaistuntimaara]
      ,[opintopisteet_lastentarha]
      ,[opintopisteet_luokanopettaja]
      ,[opintopisteet_aineenopettaja]
      ,[opintopisteet_erityisopettaja]
      ,[opintopisteet_opinto_ohjaaja]
      ,[opintopisteet_aikuiskoulutus]
      ,[opintopisteet_muut]
      ,[henkilotyovuosi]
      ,[koodit_yliopisto]
      ,[koodit_koulutusala]
      ,[koodit_ohjauksen_ala]
      ,[koodit_henkilostoryhma]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[yliopisto]
      ,[henkilostoryhma]
      ,[koulutusala]
      ,[ohjauksen_ala]
      ,[harjoittelukoulun_oppilaat_esiopetus]
      ,[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6]
      ,[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9]
      ,[harjoittelukoulun_oppilaat_lukio]
      ,[harjoittelukoulun_oppilaat_yhteensa]
      ,[harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit]
      ,[harjoittelukoulun_kokonaistuntimaara]
      ,[opintopisteet_lastentarha]
      ,[opintopisteet_luokanopettaja]
      ,[opintopisteet_aineenopettaja]
      ,[opintopisteet_erityisopettaja]
      ,[opintopisteet_opinto_ohjaaja]
      ,[opintopisteet_aikuiskoulutus]
      ,[opintopisteet_muut]
      ,[henkilotyovuosi]
      ,[koodit_yliopisto]
      ,[koodit_koulutusala]
      ,[koodit_ohjauksen_ala]
      ,[koodit_henkilostoryhma]
  FROM [dw].[api_harjoittelukoulut]

END

ELSE RAISERROR('Source table has no rows.',11,1)
 
GO
	
USE [ANTERO]
