USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yo_opintopisteet]    Script Date: 19.1.2022 8:40:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_yo_opintopisteet] AS

BEGIN
  EXEC [dw].[p_lataa_api_yo_opintopisteet_esilataus]
END

IF (SELECT (SELECT MIN(tilastovuosi) FROM [dw].[api_yo_opintopisteet]
	WHERE aineistotyyppi = 'Live') - (SELECT MAX(tilastovuosi) FROM [dw].[api_yo_opintopisteet]
	WHERE aineistotyyppi = 'Lopullinen')) = 1 AND (SELECT COUNT(*) FROM [dw].[api_yo_opintopisteet] WHERE aineistotyyppi = 'Lopullinen') > 0
	AND (SELECT COUNT(*) FROM [dw].[api_yo_opintopisteet] WHERE aineistotyyppi = 'Live') > 0

BEGIN
  
  TRUNCATE TABLE [api].[yo_opintopisteet]

  INSERT INTO [api].[yo_opintopisteet] (
       [defaultorder]
      ,[tilastovuosi]
	  ,[kuukausi]
      ,[yliopisto]
      ,[koodit_yliopisto]
      ,[okm_ohjauksen_ala]
      ,[koodit_okm_ohjauksen_ala]
      ,[op_perustutkinto_opiskelijat_lkm]
      ,[op_avoin_yo_opetus_lkm]
      ,[op_erikoistumiskoulutus_lkm]
      ,[op_erilliset_opinto_oikeudet_lkm]
      ,[op_erilliset_opinto_oikeudet_opettaja_lkm]
      ,[op_korkeakoulujen_yhteistyo_lkm]
      ,[op_saapuvat_vaihto_opiskelijat_lkm]
      ,[op_ulkomainen_harjoittelu_lkm]
      ,[op_ulkomailta_hyvaksiluetut_lkm]
      ,[op_vieraskielinen_opetus_lkm]
      ,[aineistotyyppi]
	  ,[tietojen_ajankohta]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
	  ,[kuukausi]
      ,[yliopisto]
      ,[koodit_yliopisto]
      ,[okm_ohjauksen_ala]
      ,[koodit_okm_ohjauksen_ala]
      ,[op_perustutkinto_opiskelijat_lkm]
      ,[op_avoin_yo_opetus_lkm]
      ,[op_erikoistumiskoulutus_lkm]
      ,[op_erilliset_opinto_oikeudet_lkm]
      ,[op_erilliset_opinto_oikeudet_opettaja_lkm]
      ,[op_korkeakoulujen_yhteistyo_lkm]
      ,[op_saapuvat_vaihto_opiskelijat_lkm]
      ,[op_ulkomainen_harjoittelu_lkm]
      ,[op_ulkomailta_hyvaksiluetut_lkm]
      ,[op_vieraskielinen_opetus_lkm]
      ,[aineistotyyppi]
	  ,[tietojen_ajankohta]
  FROM [dw].[api_yo_opintopisteet]

END

ELSE RAISERROR('Source table has no rows or years are missing.',11,1)

GO

USE [ANTERO]