USE [AnteroAPI]
GO


DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_amk_opintopisteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_amk_opintopisteet] AS

BEGIN
  EXEC [dw].[p_lataa_api_amk_opintopisteet_esilataus]
END

IF (SELECT (SELECT MIN(tilastovuosi) FROM [dw].[api_amk_opintopisteet]
	WHERE aineistotyyppi = 'Live') - (SELECT MAX(tilastovuosi) FROM [dw].[api_amk_opintopisteet]
	WHERE aineistotyyppi = 'Lopullinen')) = 1 AND (SELECT COUNT(*) FROM [dw].[api_amk_opintopisteet]) > 0

BEGIN
  
  TRUNCATE TABLE [api].[amk_opintopisteet]

  INSERT INTO [api].[amk_opintopisteet] (
       [defaultorder]
      ,[tilastovuosi]
	  ,[kuukausi]
      ,[ammattikorkeakoulu]
      ,[koodit_ammattikorkeakoulu]
      ,[okm_ohjauksen_ala]
      ,[koodit_okm_ohjauksen_ala]
      ,[koulutustyyppi]
      ,[op_perustutkinto_opiskelijat_lkm]
      ,[op_avoin_amk_opetus_lkm]
      ,[op_erikoistumiskoulutus_lkm]
      ,[op_erilliset_opinto_oikeudet_lkm]
      ,[op_korkeakoulujen_yhteistyo_lkm]
      ,[op_maahanmuuttajien_valmentava_lkm]
      ,[op_saapuvat_vaihto_opiskelijat_lkm]
      ,[op_tki_opinnayte_lkm]
      ,[op_tki_harjoittelu_lkm]
      ,[op_tki_muu_lkm]
      ,[op_ulkomainen_harjoittelu_lkm]
      ,[op_ulkomailta_hyvaksiluetut_lkm]
      ,[op_vieraskielinen_opetus_lkm]
      ,[aineistotyyppi]
	  ,[tietojen_ajankohta]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
	  ,[kuukausi]
      ,[ammattikorkeakoulu]
      ,[koodit_ammattikorkeakoulu]
      ,[okm_ohjauksen_ala]
      ,[koodit_okm_ohjauksen_ala]
      ,[koulutustyyppi]
      ,[op_perustutkinto_opiskelijat_lkm]
      ,[op_avoin_amk_opetus_lkm]
      ,[op_erikoistumiskoulutus_lkm]
      ,[op_erilliset_opinto_oikeudet_lkm]
      ,[op_korkeakoulujen_yhteistyo_lkm]
      ,[op_maahanmuuttajien_valmentava_lkm]
      ,[op_saapuvat_vaihto_opiskelijat_lkm]
      ,[op_tki_opinnayte_lkm]
      ,[op_tki_harjoittelu_lkm]
      ,[op_tki_muu_lkm]
      ,[op_ulkomainen_harjoittelu_lkm]
      ,[op_ulkomailta_hyvaksiluetut_lkm]
      ,[op_vieraskielinen_opetus_lkm]
      ,[aineistotyyppi]
	  ,[tietojen_ajankohta]
  FROM [dw].[api_amk_opintopisteet]

END

ELSE RAISERROR('Source table has no rows.',11,1)
 
GO

USE [ANTERO]
