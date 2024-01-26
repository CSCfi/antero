USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_opinnaytetyot]    Script Date: 31.1.2023 12:06:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_opinnaytetyot] AS

DECLARE @pvm date

BEGIN
  EXEC dw.p_lataa_api_opinnaytetyot_esilataus
END

IF ((((	select count (*) from (
		select	[tilastovuosi],[okm_ohjauksen_ala],[koulutusala_02],[koulutustyyppi],[koulutusaste],[ammattikorkeakoulu],[hankkeistetut_opinnaytetyot],
				[opinnaytetyot_ei_hankkeistetut],[koodit_koulutusala_2002],[koodit_okm_ohjauksen_ala],[koodit_ammattikorkeakoulu],[koodit_koulutustyyppi]
		from [dw].[api_opinnaytetyot] s
		except
		select	[tilastovuosi],[okm_ohjauksen_ala],[koulutusala_02],[koulutustyyppi],[koulutusaste],[ammattikorkeakoulu],[hankkeistetut_opinnaytetyot],
				[opinnaytetyot_ei_hankkeistetut],[koodit_koulutusala_2002],[koodit_okm_ohjauksen_ala],[koodit_ammattikorkeakoulu],[koodit_koulutustyyppi]
		from [api].[opinnaytetyot]) s ) > 0)
		or
		((select count(*) from [api].[opinnaytetyot]) <> (select count(*) from [dw].[api_opinnaytetyot])))
		and
		(select count(*) from [dw].[api_opinnaytetyot]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())

  TRUNCATE TABLE [api].[opinnaytetyot]

  INSERT INTO [api].[opinnaytetyot] (
	 [defaultorder]
      ,[tilastovuosi]
      ,[okm_ohjauksen_ala]
      ,[koulutusala_02]
      ,[koulutustyyppi]
      ,[koulutusaste]
      ,[ammattikorkeakoulu]
      ,[hankkeistetut_opinnaytetyot]
      ,[opinnaytetyot_ei_hankkeistetut]
      ,[koodit_koulutusala_2002]
      ,[koodit_okm_ohjauksen_ala]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_koulutustyyppi]
	  ,[tietojoukko_paivitetty_pvm]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[okm_ohjauksen_ala]
      ,[koulutusala_02]
      ,[koulutustyyppi]
      ,[koulutusaste]
      ,[ammattikorkeakoulu]
      ,[hankkeistetut_opinnaytetyot]
      ,[opinnaytetyot_ei_hankkeistetut]
      ,[koodit_koulutusala_2002]
      ,[koodit_okm_ohjauksen_ala]
      ,[koodit_ammattikorkeakoulu]
      ,[koodit_koulutustyyppi]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_opinnaytetyot]

END

IF ((select count(*) from [dw].[api_opinnaytetyot]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]