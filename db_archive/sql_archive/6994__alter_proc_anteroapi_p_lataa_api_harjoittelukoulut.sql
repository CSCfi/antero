USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_harjoittelukoulut]    Script Date: 31.1.2023 11:53:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_harjoittelukoulut] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_harjoittelukoulut_esilataus]
END

IF ((((	select count (*) from (
		select	[tilastovuosi],[yliopisto],[henkilöstöryhmä],[koulutusala],[ohjauksen_ala],[harjoittelukoulun_oppilaat_esiopetus],[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6],
				[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9],[harjoittelukoulun_oppilaat_lukio],[harjoittelukoulun_oppilaat_yhteensa],[harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit],
				[harjoittelukoulun_kokonaistuntimaara],[opintopisteet_lastentarha],[opintopisteet_luokanopettaja],[opintopisteet_aineenopettaja],[opintopisteet_erityisopettaja],[opintopisteet_opinto_ohjaaja],
				[opintopisteet_aikuiskoulutus],[opintopisteet_muut],[henkilotyovuosi],[koodit_yliopisto],[koodit_koulutusala],[koodit_ohjauksen_ala],[koodit_henkilöstöryhmä]
		from [dw].[api_harjoittelukoulut] s
		except
		select	[tilastovuosi],[yliopisto],[henkilöstöryhmä],[koulutusala],[ohjauksen_ala],[harjoittelukoulun_oppilaat_esiopetus],[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6],
				[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9],[harjoittelukoulun_oppilaat_lukio],[harjoittelukoulun_oppilaat_yhteensa],[harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit],
				[harjoittelukoulun_kokonaistuntimaara],[opintopisteet_lastentarha],[opintopisteet_luokanopettaja],[opintopisteet_aineenopettaja],[opintopisteet_erityisopettaja],[opintopisteet_opinto_ohjaaja],
				[opintopisteet_aikuiskoulutus],[opintopisteet_muut],[henkilotyovuosi],[koodit_yliopisto],[koodit_koulutusala],[koodit_ohjauksen_ala],[koodit_henkilöstöryhmä]
		from [api].[harjoittelukoulut]) s ) > 0)
		or
		((select count(*) from [api].[harjoittelukoulut]) <> (select count(*) from [dw].[api_harjoittelukoulut])))
		and
		(select count(*) from [dw].[api_harjoittelukoulut]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
  
  TRUNCATE TABLE [api].[harjoittelukoulut]

  INSERT INTO [api].[harjoittelukoulut] (
       [defaultorder]
      ,[tilastovuosi]
      ,[yliopisto]
      ,[henkilöstöryhmä]
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
      ,[koodit_henkilöstöryhmä]
	  ,[tietojoukko_paivitetty_pvm]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[yliopisto]
      ,[henkilöstöryhmä]
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
      ,[koodit_henkilöstöryhmä]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_harjoittelukoulut]

END

IF ((select count(*) from [dw].[api_harjoittelukoulut]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END
 

GO

USE [ANTERO]