USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amk_opintopisteet_kuukausi]    Script Date: 31.1.2023 11:43:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER  PROCEDURE [dw].[p_lataa_api_amk_opintopisteet_kuukausi] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_amk_opintopisteet_kuukausi_esilataus]
END

IF ((SELECT COUNT(DISTINCT tilastovuosi) FROM [dw].[api_amk_opintopisteet_kuukausi]) >= 3 AND (SELECT MAX(tilastovuosi) FROM [dw].[api_amk_opintopisteet_kuukausi]) in (YEAR(GETDATE()), YEAR(GETDATE()) - 1))	

IF (((((	select count (*) from (
		select [tilastovuosi], [kuukausi], [ammattikorkeakoulu], [koodit_ammattikorkeakoulu], [okm_ohjauksen_ala], [koodit_okm_ohjauksen_ala], 
			   [koulutustyyppi], [op_perustutkinto_opiskelijat_lkm], [op_avoin_amk_opetus_lkm], [op_erikoistumiskoulutus_lkm], [op_erilliset_opinto_oikeudet_lkm],
			   [op_korkeakoulujen_yhteistyo_lkm], [op_maahanmuuttajien_valmentava_lkm], [op_saapuvat_vaihto_opiskelijat_lkm], [op_tki_opinnayte_lkm], 
			   [op_tki_harjoittelu_lkm], [op_tki_muu_lkm], [op_ulkomainen_harjoittelu_lkm] ,[op_ulkomailta_hyvaksiluetut_lkm], [op_vieraskielinen_opetus_lkm]
		from [dw].[api_amk_opintopisteet_kuukausi]
		except
		select [tilastovuosi], [kuukausi], [ammattikorkeakoulu], [koodit_ammattikorkeakoulu], [okm_ohjauksen_ala], [koodit_okm_ohjauksen_ala], 
			   [koulutustyyppi], [op_perustutkinto_opiskelijat_lkm], [op_avoin_amk_opetus_lkm], [op_erikoistumiskoulutus_lkm], [op_erilliset_opinto_oikeudet_lkm],
			   [op_korkeakoulujen_yhteistyo_lkm], [op_maahanmuuttajien_valmentava_lkm], [op_saapuvat_vaihto_opiskelijat_lkm], [op_tki_opinnayte_lkm], 
			   [op_tki_harjoittelu_lkm], [op_tki_muu_lkm], [op_ulkomainen_harjoittelu_lkm] ,[op_ulkomailta_hyvaksiluetut_lkm], [op_vieraskielinen_opetus_lkm]
		from [api].[amk_opintopisteet_kuukausi]) s ) > 0)
		or
		((select count(*) from [api].[amk_opintopisteet_kuukausi]) <> (select count(*) from [dw].[api_amk_opintopisteet_kuukausi])))
		and
		(select count(*) from [dw].[api_amk_opintopisteet_kuukausi]) > 0)
		and
		((select count(distinct tilastovuosi) from [dw].[api_amk_opintopisteet_kuukausi]) >= 3 AND (select max(tilastovuosi) from [dw].[api_amk_opintopisteet_kuukausi]) in (year(getdate()), year(getdate()) - 1)))


BEGIN

  SET @pvm = dbo.api_update_time(getdate())
  
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
	  ,[tietojen_ajankohta]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_amk_opintopisteet_kuukausi]

END

IF	(((select count(*) from [dw].[api_amk_opintopisteet_kuukausi]) = 0)
	or
	((select count(distinct tilastovuosi) from [dw].[api_amk_opintopisteet_kuukausi]) < 3 or (select max(tilastovuosi) from [dw].[api_amk_opintopisteet_kuukausi]) not in (year(getdate()), year(getdate()) - 1)))

BEGIN

RAISERROR('Source table has no rows or years are missing.',11,1)

END
 

GO

USE [ANTERO]