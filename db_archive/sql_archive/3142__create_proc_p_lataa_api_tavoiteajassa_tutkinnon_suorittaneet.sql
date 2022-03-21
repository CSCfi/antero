USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 22.6.2020 16:34:41 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 22.6.2020 16:34:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet] AS

TRUNCATE TABLE [api].[tavoiteajassa_tutkinnon_suorittaneet]

INSERT INTO [api].[tavoiteajassa_tutkinnon_suorittaneet]

SELECT [Tilastovuosi]
      ,[Sektori]
      ,[Korkeakoulu]
      ,[Koulutus]
      ,[Tutkinnot]
      ,[Tavoiteajassa]
      ,[Tavoiteaika ylitetty korkeintaan 12 kk]
      ,[Tavoiteaika ylitetty yli 12 kk]
      ,[On aiempi korkeakoulututkinto]
      ,[Tutkintopisteet]
      ,[Tutkintopisteluokka]
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

FROM [ANTERO].[dw].[api_tavoiteajassa_tutkinnon_suorittaneet]
