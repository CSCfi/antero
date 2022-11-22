USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amk_opintopisteet_kuukausi]    Script Date: 22.11.2022 12:42:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amk_opintopisteet_kuukausi] AS

BEGIN
  EXEC [dw].[p_lataa_api_amk_opintopisteet_kuukausi_esilataus]
END

IF ((SELECT COUNT(DISTINCT tilastovuosi) FROM [dw].[api_amk_opintopisteet_kuukausi]) >= 3 AND  (SELECT MAX(tilastovuosi) FROM [dw].[api_amk_opintopisteet_kuukausi]) = YEAR(GETDATE()))
	

BEGIN
  
  TRUNCATE TABLE [api].[amk_opintopisteet_kuukausi]

  INSERT INTO [api].[amk_opintopisteet_kuukausi] (
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
	  ,[tietojen_ajankohta]
  FROM [dw].[api_amk_opintopisteet_kuukausi]

END

ELSE RAISERROR('Source table has no rows.',11,1)
 

GO


USE [ANTERO]

