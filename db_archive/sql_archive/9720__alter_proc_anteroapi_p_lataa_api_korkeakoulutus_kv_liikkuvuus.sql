USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_korkeakoulutus_kv_liikkuvuus]    Script Date: 25.3.2024 8:37:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dw].[p_lataa_api_korkeakoulutus_kv_liikkuvuus] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_korkeakoulutus_kv_liikkuvuus_esilataus]
END

IF ((	select count (*) from (
		select [tilastovuosi],[sektori],[sukupuoli],[korkeakoulu],[koulutusnimike],[koulutusaste_taso_1],[koulutusaste_taso_2],
			   [koulutusala_taso_1],[koulutusala_taso_2],[koulutusala_taso_3],[okm_ohjauksen_ala],[liikkuvuuden_suunta],
			   [liikkuvuuden_kesto],[liikkuvuusjaksot_lkm],[koodit_korkeakoulu],[koodit_koulutusnimike],[liikkuvuuden_tyyppi]
		from [dw].[api_korkeakoulutus_kv_liikkuvuus]
		except
		select [tilastovuosi],[sektori],[sukupuoli],[korkeakoulu],[koulutusnimike],[koulutusaste_taso_1],[koulutusaste_taso_2],
			   [koulutusala_taso_1],[koulutusala_taso_2],[koulutusala_taso_3],[okm_ohjauksen_ala],[liikkuvuuden_suunta],
			   [liikkuvuuden_kesto],[liikkuvuusjaksot_lkm],[koodit_korkeakoulu],[koodit_koulutusnimike],[liikkuvuuden_tyyppi]
		from [api].[korkeakoulutus_kv_liikkuvuus]) s ) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
  
  TRUNCATE TABLE [api].[korkeakoulutus_kv_liikkuvuus]

  INSERT INTO [api].[korkeakoulutus_kv_liikkuvuus] (
       [defaultorder]
      ,[tilastovuosi]
      ,[sektori]
      ,[sukupuoli]
      ,[korkeakoulu]
      ,[koulutusnimike]
      ,[koulutusaste_taso_1]
      ,[koulutusaste_taso_2]
      ,[koulutusala_taso_1]
      ,[koulutusala_taso_2]
      ,[koulutusala_taso_3]
      ,[okm_ohjauksen_ala]
      ,[liikkuvuuden_suunta]
      ,[liikkuvuuden_kesto]
	  ,[liikkuvuuden_tyyppi]
      ,[liikkuvuusjaksot_lkm]
      ,[koodit_korkeakoulu]
      ,[koodit_koulutusnimike]
	  ,[tietojoukko_paivitetty_pvm]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[sektori]
      ,[sukupuoli]
      ,[korkeakoulu]
      ,[koulutusnimike]
      ,[koulutusaste_taso_1]
      ,[koulutusaste_taso_2]
      ,[koulutusala_taso_1]
      ,[koulutusala_taso_2]
      ,[koulutusala_taso_3]
      ,[okm_ohjauksen_ala]
      ,[liikkuvuuden_suunta]
      ,[liikkuvuuden_kesto]
	  ,[liikkuvuuden_tyyppi]
      ,[liikkuvuusjaksot_lkm]
      ,[koodit_korkeakoulu]
      ,[koodit_koulutusnimike]
	  ,[tietojoukkoPaivitettyPvm] = @pvm
  FROM [dw].[api_korkeakoulutus_kv_liikkuvuus]

END

 
GO

USE [ANTERO]