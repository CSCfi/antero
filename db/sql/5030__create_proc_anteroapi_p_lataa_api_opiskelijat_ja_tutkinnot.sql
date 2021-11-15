USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_opiskelijat_ja_tutkinnot]    Script Date: 15.11.2021 13:09:15 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_opiskelijat_ja_tutkinnot]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_opiskelijat_ja_tutkinnot]    Script Date: 15.11.2021 13:09:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_opiskelijat_ja_tutkinnot] AS

BEGIN
  EXEC dw.p_lataa_api_opiskelijat_ja_tutkinnot_esilataus
END

IF (select count(*) from dw.api_opiskelijat_ja_tutkinnot) > 0

BEGIN

  TRUNCATE TABLE [api].[opiskelijat_ja_tutkinnot]

  INSERT INTO [api].[opiskelijat_ja_tutkinnot] (
	  [Tilastovuosi]
      ,[Aineistotyyppi]
      ,[Sektori]
      ,[Korkeakoulu]
      ,[Koulutus]
      ,[Sukupuoli]
      ,[Tutkinnot]
      ,[Opiskelijat]
      ,[Uudet opiskelijat]
      ,[Koulutusaste taso 1]
      ,[Koulutusaste taso 2]
      ,[Koulutusala taso 1]
      ,[Koulutusala taso 2]
      ,[Koulutusala taso 3]
      ,[OKM ohjauksen ala]
      ,[Rahoitusmalliala amk 2017-2020]
      ,[Rahoitusmalliala amk 2021-2024]
      ,[Rahoitusmalliala yo 2017-2020]
      ,[Rahoitusmalliala yo 2021-2024]
      ,[Koodi Sektori]
      ,[Koodi Korkeakoulu]
      ,[Koodi Koulutus]
  )
  SELECT [Tilastovuosi]
      ,[Aineistotyyppi]
      ,[Sektori]
      ,[Korkeakoulu]
      ,[Koulutus]
      ,[Sukupuoli]
      ,[Tutkinnot]
      ,[Opiskelijat]
      ,[Uudet opiskelijat]
      ,[Koulutusaste taso 1]
      ,[Koulutusaste taso 2]
      ,[Koulutusala taso 1]
      ,[Koulutusala taso 2]
      ,[Koulutusala taso 3]
      ,[OKM ohjauksen ala]
      ,[Rahoitusmalliala amk 2017-2020]
      ,[Rahoitusmalliala amk 2021-2024]
      ,[Rahoitusmalliala yo 2017-2020]
      ,[Rahoitusmalliala yo 2021-2024]
      ,[Koodi Sektori]
      ,[Koodi Korkeakoulu]
      ,[Koodi Koulutus]
  FROM [dw].[api_opiskelijat_ja_tutkinnot]

END

ELSE RAISERROR('Source table has no rows.',11,1)

GO


