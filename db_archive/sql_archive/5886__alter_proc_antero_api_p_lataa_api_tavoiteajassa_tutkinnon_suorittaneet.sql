USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 14.2.2022 15:58:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet] AS

BEGIN
  EXEC dw.p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet_esilataus
END

IF (select count(*) from dw.api_tavoiteajassa_tutkinnon_suorittaneet) > 0 

BEGIN

  TRUNCATE TABLE [api].[tavoiteajassa_tutkinnon_suorittaneet]

  INSERT INTO [api].[tavoiteajassa_tutkinnon_suorittaneet] (
	  [Tilastovuosi]
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
	  ,[rahoituslahde]
      ,[Koodi Sektori]
      ,[Koodi Korkeakoulu]
      ,[Koodi Koulutus]
  )
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
	  ,[rahoituslahde]
      ,[Koodi Sektori]
      ,[Koodi Korkeakoulu]
      ,[Koodi Koulutus]
  FROM [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]

END

ELSE RAISERROR('Source table has no rows.',11,1)

GO

USE [ANTERO]