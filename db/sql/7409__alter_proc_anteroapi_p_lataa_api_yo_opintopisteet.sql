USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yo_opintopisteet]    Script Date: 22.2.2023 7:46:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_yo_opintopisteet] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_yo_opintopisteet_esilataus]
END

IF (((((	select count (*) from (
		select	[tilastovuosi],[kuukausi],[yliopisto],[koodit_yliopisto],[okm_ohjauksen_ala],[koodit_okm_ohjauksen_ala],[op_perustutkinto_opiskelijat_lkm],
				[op_avoin_yo_opetus_lkm],[op_erikoistumiskoulutus_lkm],[op_erilliset_opinto_oikeudet_lkm],[op_erilliset_opinto_oikeudet_opettaja_lkm],
				[op_korkeakoulujen_yhteistyo_lkm],[op_saapuvat_vaihto_opiskelijat_lkm],[op_ulkomainen_harjoittelu_lkm],[op_ulkomailta_hyvaksiluetut_lkm],
				[op_vieraskielinen_opetus_lkm],[op_kv_suomi_vieraana_lkm],[op_kv_ruotsi_vieraana_lkm],[op_muun_kuin_korkeakoulun_yhteistyo_lkm],[aineistotyyppi]
		from [dw].[api_yo_opintopisteet] s
		except
		select	[tilastovuosi],[kuukausi],[yliopisto],[koodit_yliopisto],[okm_ohjauksen_ala],[koodit_okm_ohjauksen_ala],[op_perustutkinto_opiskelijat_lkm],
				[op_avoin_yo_opetus_lkm],[op_erikoistumiskoulutus_lkm],[op_erilliset_opinto_oikeudet_lkm],[op_erilliset_opinto_oikeudet_opettaja_lkm],
				[op_korkeakoulujen_yhteistyo_lkm],[op_saapuvat_vaihto_opiskelijat_lkm],[op_ulkomainen_harjoittelu_lkm],[op_ulkomailta_hyvaksiluetut_lkm],
				[op_vieraskielinen_opetus_lkm],[op_kv_suomi_vieraana_lkm],[op_kv_ruotsi_vieraana_lkm],[op_muun_kuin_korkeakoulun_yhteistyo_lkm],[aineistotyyppi]
		from [api].[yo_opintopisteet]) s ) > 0)
		or
		((select count(*) from [api].[yo_opintopisteet]) <> (select count(*) from [dw].[api_yo_opintopisteet])))
		and
		(select count(*) from [dw].[api_yo_opintopisteet]) > 0)
		and
		((SELECT (SELECT MIN(tilastovuosi) FROM [dw].[api_yo_opintopisteet]
		WHERE aineistotyyppi = 'Live') - (SELECT MAX(tilastovuosi) FROM [dw].[api_yo_opintopisteet]
		WHERE aineistotyyppi = 'Lopullinen')) = 1 AND (SELECT COUNT(*) FROM [dw].[api_yo_opintopisteet] WHERE aineistotyyppi = 'Lopullinen') > 0
		AND (SELECT COUNT(*) FROM [dw].[api_yo_opintopisteet] WHERE aineistotyyppi = 'Live') > 0))

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
  
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
	  ,[op_kv_suomi_vieraana_lkm]
      ,[op_kv_ruotsi_vieraana_lkm]
      ,[op_muun_kuin_korkeakoulun_yhteistyo_lkm]
      ,[aineistotyyppi]
	  ,[tietojen_ajankohta]
	  ,[tietojoukko_paivitetty_pvm]
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
	  ,[op_kv_suomi_vieraana_lkm]
      ,[op_kv_ruotsi_vieraana_lkm]
      ,[op_muun_kuin_korkeakoulun_yhteistyo_lkm]
      ,[aineistotyyppi]
	  ,[tietojen_ajankohta]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_yo_opintopisteet]

END

IF ((SELECT (SELECT MIN(tilastovuosi) FROM [dw].[api_yo_opintopisteet]
	WHERE aineistotyyppi = 'Live') - (SELECT MAX(tilastovuosi) FROM [dw].[api_yo_opintopisteet]
	WHERE aineistotyyppi = 'Lopullinen')) <> 1 OR (SELECT COUNT(*) FROM [dw].[api_yo_opintopisteet] WHERE aineistotyyppi = 'Lopullinen') = 0
	OR (SELECT COUNT(*) FROM [dw].[api_yo_opintopisteet] WHERE aineistotyyppi = 'Live') = 0)

BEGIN

RAISERROR('Source table has no rows or years are missing.',11,1)

END

GO

USE [ANTERO]