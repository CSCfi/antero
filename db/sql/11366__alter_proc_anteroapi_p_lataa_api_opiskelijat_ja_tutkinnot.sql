USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_opiskelijat_ja_tutkinnot]    Script Date: 6.11.2025 15.20.24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_opiskelijat_ja_tutkinnot] AS

DECLARE @pvm date

BEGIN
  EXEC dw.p_lataa_api_opiskelijat_ja_tutkinnot_esilataus
END

IF ((((	select count (*) from (
		select	[Tilastovuosi],[Aineistotyyppi],[Sektori],[Korkeakoulu],[Koulutus],[Sukupuoli],[Tutkinnot],[Opiskelijat],[opiskelijatFte],[Uudet opiskelijat],
				[Koulutusaste taso 1],[Koulutusaste taso 2],[Koulutusala taso 1],[Koulutusala taso 2],[Koulutusala taso 3],[OKM ohjauksen ala],
				[Rahoitusmalliala amk 2017-2020],[Rahoitusmalliala amk 2021-2024],[Rahoitusmalliala yo 2017-2020],[Rahoitusmalliala yo 2021-2024],
				[Koodi Sektori],[Koodi Korkeakoulu],[Koodi Koulutus], rahoituslahde, kirjoillaolo_tammi, kirjoillaolo_syys, koulutuksen_maakunta
		from [dw].[api_opiskelijat_ja_tutkinnot] s
		except
		select	[Tilastovuosi],[Aineistotyyppi],[Sektori],[Korkeakoulu],[Koulutus],[Sukupuoli],[Tutkinnot],[Opiskelijat],[opiskelijatFte],[Uudet opiskelijat],
				[Koulutusaste taso 1],[Koulutusaste taso 2],[Koulutusala taso 1],[Koulutusala taso 2],[Koulutusala taso 3],[OKM ohjauksen ala],
				[Rahoitusmalliala amk 2017-2020],[Rahoitusmalliala amk 2021-2024],[Rahoitusmalliala yo 2017-2020],[Rahoitusmalliala yo 2021-2024],
				[Koodi Sektori],[Koodi Korkeakoulu],[Koodi Koulutus], rahoituslahde, kirjoillaolo_tammi, kirjoillaolo_syys, koulutuksen_maakunta
		from [api].[opiskelijat_ja_tutkinnot]) s ) > 0)
		or
		((select count(*) from [api].[opiskelijat_ja_tutkinnot]) <> (select count(*) from [dw].[api_opiskelijat_ja_tutkinnot])))
		and
		(select count(*) from [dw].[api_opiskelijat_ja_tutkinnot]) > 0)

BEGIN
	
  SET @pvm = dbo.api_update_time(getdate())

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
	  ,[opiskelijatFte]
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
	  ,[rahoituslahde]
	  ,kirjoillaolo_tammi
	  ,kirjoillaolo_syys
	  ,koulutuksen_maakunta
      ,[Koodi Sektori]
      ,[Koodi Korkeakoulu]
      ,[Koodi Koulutus]
	  ,[tietojoukko_paivitetty_pvm]
  )
  SELECT [Tilastovuosi]
      ,[Aineistotyyppi]
      ,[Sektori]
      ,[Korkeakoulu]
      ,[Koulutus]
      ,[Sukupuoli]
      ,[Tutkinnot]
      ,[Opiskelijat]
	  ,[opiskelijatFte]
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
	  ,[rahoituslahde]
	  ,kirjoillaolo_tammi
	  ,kirjoillaolo_syys
	  ,koulutuksen_maakunta
      ,[Koodi Sektori]
      ,[Koodi Korkeakoulu]
      ,[Koodi Koulutus]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_opiskelijat_ja_tutkinnot]

END

IF ((select count(*) from [dw].[api_opiskelijat_ja_tutkinnot]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END

GO

