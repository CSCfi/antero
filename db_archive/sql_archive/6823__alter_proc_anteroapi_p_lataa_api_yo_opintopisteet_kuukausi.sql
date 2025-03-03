USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yo_opintopisteet_kuukausi]    Script Date: 2.1.2023 10:41:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_api_yo_opintopisteet_kuukausi] AS

BEGIN
  EXEC [dw].[p_lataa_api_yo_opintopisteet_kuukausi_esilataus]
END

IF ((SELECT COUNT(DISTINCT tilastovuosi) FROM [dw].[api_yo_opintopisteet_kuukausi]) >= 3 AND  (SELECT MAX(tilastovuosi) FROM [dw].[api_yo_opintopisteet_kuukausi]) in (YEAR(GETDATE()), YEAR(GETDATE()) - 1))

BEGIN
  
  TRUNCATE TABLE [api].[yo_opintopisteet_kuukausi]

  INSERT INTO [api].[yo_opintopisteet_kuukausi] (
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
	  ,[tietojen_ajankohta]
  FROM [dw].[api_yo_opintopisteet_kuukausi]

END

ELSE RAISERROR('Source table has no rows or years are missing.',11,1)

GO

USE [ANTERO]