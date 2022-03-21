USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_api_opiskelijat_ja_tutkinnot]    Script Date: 2.9.2020 11:10:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_opiskelijat_ja_tutkinnot] AS

TRUNCATE TABLE [api].[opiskelijat_ja_tutkinnot]

INSERT INTO [api].[opiskelijat_ja_tutkinnot]

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
      ,[defaultorder]

FROM [ANTERO].[dw].[api_opiskelijat_ja_tutkinnot]
