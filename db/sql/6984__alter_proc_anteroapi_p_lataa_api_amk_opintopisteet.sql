USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amk_opintopisteet]    Script Date: 31.1.2023 11:42:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_amk_opintopisteet] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_amk_opintopisteet_esilataus]
END

IF ((((	select count (*) from (
		select [tilastovuosi], [kuukausi], [ammattikorkeakoulu], [koodit_ammattikorkeakoulu], [okm_ohjauksen_ala], [koodit_okm_ohjauksen_ala],
			   [koulutustyyppi], [op_perustutkinto_opiskelijat_lkm], [op_avoin_amk_opetus_lkm], [op_erikoistumiskoulutus_lkm], [op_erilliset_opinto_oikeudet_lkm],
			   [op_korkeakoulujen_yhteistyo_lkm], [op_maahanmuuttajien_valmentava_lkm], [op_saapuvat_vaihto_opiskelijat_lkm], [op_tki_opinnayte_lkm], [op_tki_harjoittelu_lkm],
			   [op_tki_muu_lkm], [op_ulkomainen_harjoittelu_lkm], [op_ulkomailta_hyvaksiluetut_lkm], [op_vieraskielinen_opetus_lkm], [aineistotyyppi]
		from [dw].[api_amk_opintopisteet]
		except
		select [tilastovuosi], [kuukausi], [ammattikorkeakoulu], [koodit_ammattikorkeakoulu], [okm_ohjauksen_ala], [koodit_okm_ohjauksen_ala],
			   [koulutustyyppi], [op_perustutkinto_opiskelijat_lkm], [op_avoin_amk_opetus_lkm], [op_erikoistumiskoulutus_lkm], [op_erilliset_opinto_oikeudet_lkm],
			   [op_korkeakoulujen_yhteistyo_lkm], [op_maahanmuuttajien_valmentava_lkm], [op_saapuvat_vaihto_opiskelijat_lkm], [op_tki_opinnayte_lkm], [op_tki_harjoittelu_lkm],
			   [op_tki_muu_lkm], [op_ulkomainen_harjoittelu_lkm], [op_ulkomailta_hyvaksiluetut_lkm], [op_vieraskielinen_opetus_lkm], [aineistotyyppi]
		from [api].[amk_opintopisteet]) s ) > 0)
		or
		((select count(*) from [api].[amk_opintopisteet]) <> (select count(*) from [dw].[api_amk_opintopisteet])))
		and
		(select count(*) from [dw].[api_amk_opintopisteet]) > 0)
		and
		((select (select MIN(tilastovuosi) from [dw].[api_amk_opintopisteet]
	WHERE aineistotyyppi = 'Live') - (select MAX(tilastovuosi) from [dw].[api_amk_opintopisteet]
	WHERE aineistotyyppi = 'Lopullinen')) = 1 AND (select count(*) from [dw].[api_amk_opintopisteet] WHERE aineistotyyppi = 'Lopullinen') > 0
	AND (select count(*) from [dw].[api_amk_opintopisteet] WHERE aineistotyyppi = 'Live') > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
  
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
	  ,[tietojoukko_paivitetty_pvm]
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
	  ,[tietojoukko_paivitetty_pvm] = @pvm
  FROM [dw].[api_amk_opintopisteet]

END

IF (select (select MIN(tilastovuosi) from [dw].[api_amk_opintopisteet]
	WHERE aineistotyyppi = 'Live') - (select MAX(tilastovuosi) from [dw].[api_amk_opintopisteet]
	WHERE aineistotyyppi = 'Lopullinen')) <> 1 OR (select count(*) from [dw].[api_amk_opintopisteet] WHERE aineistotyyppi = 'Lopullinen') = 0
	OR (select count(*) from [dw].[api_amk_opintopisteet] WHERE aineistotyyppi = 'Live') = 0

BEGIN

RAISERROR('Source table has no rows or years are missing.',11,1)

END
 

GO

USE [ANTERO]