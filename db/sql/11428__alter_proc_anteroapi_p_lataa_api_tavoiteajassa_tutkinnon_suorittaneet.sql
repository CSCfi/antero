USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 24.11.2025 10.09.18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet] AS

DECLARE @pvm date

BEGIN
  EXEC dw.p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet_esilataus
END

IF (((((select count (*) from (
		select	[Tilastovuosi],[Kuukausi],[Sektori],[Korkeakoulu],[Koulutus],[Tutkinnot],[Tavoiteajassa],[Tavoiteaika ylitetty korkeintaan 12 kk],
				[Tavoiteaika ylitetty yli 12 kk],[On aiempi korkeakoulututkinto],[Tutkintopisteet],[Tutkintopisteluokka],[Koulutusaste taso 1],
				[Koulutusaste taso 2],[Koulutusala taso 1],[Koulutusala taso 2],[Koulutusala taso 3],[OKM ohjauksen ala],[Rahoitusmalliala amk 2017-2020],
				[Rahoitusmalliala amk 2021-2024],[Rahoitusmalliala yo 2017-2020],[Rahoitusmalliala yo 2021-2024],[rahoituslahde],[Koodi Sektori],
				[Koodi Korkeakoulu],[Koodi Koulutus],[Aineistotyyppi], koulutuskieli, koulutustyyppi
		from [dw].[api_tavoiteajassa_tutkinnon_suorittaneet] s
		except
		select	[Tilastovuosi],[Kuukausi],[Sektori],[Korkeakoulu],[Koulutus],[Tutkinnot],[Tavoiteajassa],[Tavoiteaika ylitetty korkeintaan 12 kk],
				[Tavoiteaika ylitetty yli 12 kk],[On aiempi korkeakoulututkinto],[Tutkintopisteet],[Tutkintopisteluokka],[Koulutusaste taso 1],
				[Koulutusaste taso 2],[Koulutusala taso 1],[Koulutusala taso 2],[Koulutusala taso 3],[OKM ohjauksen ala],[Rahoitusmalliala amk 2017-2020],
				[Rahoitusmalliala amk 2021-2024],[Rahoitusmalliala yo 2017-2020],[Rahoitusmalliala yo 2021-2024],[rahoituslahde],[Koodi Sektori],
				[Koodi Korkeakoulu],[Koodi Koulutus],[Aineistotyyppi], koulutuskieli, koulutustyyppi
		from [api].[tavoiteajassa_tutkinnon_suorittaneet]) s ) > 0)
		or
		((select count(*) from [api].[tavoiteajassa_tutkinnon_suorittaneet]) <> (select count(*) from [dw].[api_tavoiteajassa_tutkinnon_suorittaneet])))
		and
		(select count(*) from [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]) > 0)
		and 
		(select count(distinct Tilastovuosi) from dw.api_tavoiteajassa_tutkinnon_suorittaneet) >= (YEAR(getdate()) - 2015))

BEGIN

  SET @pvm = dbo.api_update_time(getdate())

  TRUNCATE TABLE [api].[tavoiteajassa_tutkinnon_suorittaneet]

  INSERT INTO [api].[tavoiteajassa_tutkinnon_suorittaneet] (
	  [Tilastovuosi]
	  ,[Kuukausi]
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
	  ,[koulutustyyppi]
	  ,[koulutuskieli]
	  ,[rahoituslahde]
      ,[Koodi Sektori]
      ,[Koodi Korkeakoulu]
      ,[Koodi Koulutus]
	  ,[Aineistotyyppi]
	  ,[Tietojen ajankohta]
	  ,[tietojoukko_paivitetty_pvm]
  )
  SELECT [Tilastovuosi]
	  ,[Kuukausi]
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
	  ,[koulutustyyppi]
	  ,[koulutuskieli]
	  ,[rahoituslahde]
      ,[Koodi Sektori]
      ,[Koodi Korkeakoulu]
      ,[Koodi Koulutus]
	  ,[Aineistotyyppi]
	  ,[Tietojen ajankohta]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]

END

IF ((select count(distinct Tilastovuosi) from dw.api_tavoiteajassa_tutkinnon_suorittaneet) < (YEAR(getdate()) - 2015))

BEGIN

RAISERROR('Source table has no rows or years are missing.',11,1)

END

GO
