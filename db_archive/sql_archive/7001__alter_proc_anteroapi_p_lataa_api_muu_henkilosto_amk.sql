USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_muu_henkilosto_amk]    Script Date: 31.1.2023 12:04:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_muu_henkilosto_amk] AS

DECLARE @pvm date

BEGIN
  EXEC dw.p_lataa_api_muu_henkilosto_amk_esilataus
END

IF ((((	select count (*) from (
		select	[tilastovuosi], [henkilöstöryhmä], [koulutusala], [okm_ohjauksen_ala], [ammattikorkeakoulu], [sivutoimisten_tuntiopettajien_opetustunnit],
				[ostopalveluna_hankittu_tuntiopetus], [henkilostoryhman_tunnit_lkm], [koodit_koulutusala], [koodit_okm_ohjauksen_ala],
				[koodit_ammattikorkeakoulu], [koodit_henkilöstöryhmä]
		from [dw].[api_muu_henkilosto_amk] s
		except
		select	[tilastovuosi], [henkilöstöryhmä], [koulutusala], [okm_ohjauksen_ala], [ammattikorkeakoulu], [sivutoimisten_tuntiopettajien_opetustunnit],
				[ostopalveluna_hankittu_tuntiopetus], [henkilostoryhman_tunnit_lkm], [koodit_koulutusala], [koodit_okm_ohjauksen_ala],
				[koodit_ammattikorkeakoulu], [koodit_henkilöstöryhmä]
		from [api].[muu_henkilosto_amk]) s ) > 0)
		or
		((select count(*) from [api].[muu_henkilosto_amk]) <> (select count(*) from [dw].[api_muu_henkilosto_amk])))
		and
		(select count(*) from [dw].[api_muu_henkilosto_amk]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())

  TRUNCATE TABLE [api].[muu_henkilosto_amk]

  INSERT INTO [api].[muu_henkilosto_amk] (
	  [defaultorder]
      ,[tilastovuosi]
      ,[henkilöstöryhmä]
      ,[koulutusala]
      ,[okm_ohjauksen_ala]
      ,[ammattikorkeakoulu]
      ,[sivutoimisten_tuntiopettajien_opetustunnit]
      ,[ostopalveluna_hankittu_tuntiopetus]
      ,[henkilostoryhman_tunnit_lkm]
      ,[koodit_koulutusala]
      ,[koodit_okm_ohjauksen_ala]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_henkilöstöryhmä]
	  ,[tietojoukko_paivitetty_pvm]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[henkilöstöryhmä]
      ,[koulutusala]
      ,[okm_ohjauksen_ala]
      ,[ammattikorkeakoulu]
      ,[sivutoimisten_tuntiopettajien_opetustunnit]
      ,[ostopalveluna_hankittu_tuntiopetus]
      ,[henkilostoryhman_tunnit_lkm]
      ,[koodit_koulutusala]
      ,[koodit_okm_ohjauksen_ala]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_henkilöstöryhmä]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_muu_henkilosto_amk]

END

IF ((select count(*) from [dw].[api_muu_henkilosto_amk]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]