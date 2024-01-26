USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_erilliset_opinto_oikeudet]    Script Date: 31.1.2023 11:52:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_erilliset_opinto_oikeudet] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_erilliset_opinto_oikeudet_esilataus]
END

IF ((((	select count (*) from (
		select	[tilastovuosi], [koulutusala], [okm_ohjauksen_ala], [yliopisto], [suorittaneiden_lkm], [opettajakoulutus_suorittaneiden_lkm], [erillisilla_oik_op_lkm],
				[erillisilla_oik_opkoul_op_lkm], [koodit_yliopisto], [koodit_koulutusala], [koodit_okm_ohjauksen_ala]
		from [dw].[api_erilliset_opinto_oikeudet] s
		except
		select	[tilastovuosi], [koulutusala], [okm_ohjauksen_ala], [yliopisto], [suorittaneiden_lkm], [opettajakoulutus_suorittaneiden_lkm], [erillisilla_oik_op_lkm],
				[erillisilla_oik_opkoul_op_lkm], [koodit_yliopisto], [koodit_koulutusala], [koodit_okm_ohjauksen_ala]
		from [api].[erilliset_opinto_oikeudet]) s ) > 0)
		or
		((select count(*) from [api].[erilliset_opinto_oikeudet]) <> (select count(*) from [dw].[api_erilliset_opinto_oikeudet])))
		and
		(select count(*) from [dw].[api_erilliset_opinto_oikeudet]) > 0)

BEGIN
  
  SET @pvm = dbo.api_update_time(getdate())
  
  TRUNCATE TABLE [api].[erilliset_opinto_oikeudet]

  INSERT INTO [api].[erilliset_opinto_oikeudet] (
       [defaultorder]
      ,[tilastovuosi]
      ,[koulutusala]
      ,[okm_ohjauksen_ala]
      ,[yliopisto]
      ,[suorittaneiden_lkm]
      ,[opettajakoulutus_suorittaneiden_lkm]
      ,[erillisilla_oik_op_lkm]
      ,[erillisilla_oik_opkoul_op_lkm]
      ,[koodit_yliopisto]
      ,[koodit_koulutusala]
      ,[koodit_okm_ohjauksen_ala]
	  ,[tietojoukko_paivitetty_pvm]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[koulutusala]
      ,[okm_ohjauksen_ala]
      ,[yliopisto]
      ,[suorittaneiden_lkm]
      ,[opettajakoulutus_suorittaneiden_lkm]
      ,[erillisilla_oik_op_lkm]
      ,[erillisilla_oik_opkoul_op_lkm]
      ,[koodit_yliopisto]
      ,[koodit_koulutusala]
      ,[koodit_okm_ohjauksen_ala]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_erilliset_opinto_oikeudet]

END

IF ((select count(*) from [dw].[api_erilliset_opinto_oikeudet]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]