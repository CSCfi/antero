USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta]    Script Date: 31.1.2023 11:47:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta] AS

DECLARE @pvm date

BEGIN
EXEC [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta_esilataus]
END

IF ((((	select count (*) from (
		select	tilastovuosi, kuukausi, s.oppilaitoksenMaakunta as oppilaitoksen_maakunta, sukupuoli, aidinkieli, ika, kansalaisuus,
				s.uudetOpiskelijatLkm as uudet_opiskelijat_lkm, s.opiskelijatLkm as opiskelijat_lkm, s.tutkinnonSuorittaneetLkm as tutkinnon_suorittaneet_lkm
		from [dw].[api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta] s
		except
		select	tilastovuosi, kuukausi, oppilaitoksen_maakunta, sukupuoli, aidinkieli, ika, kansalaisuus,
				uudet_opiskelijat_lkm, opiskelijat_lkm, tutkinnon_suorittaneet_lkm
		from [api].[amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta]) s ) > 0)
		or
		((select count(*) from [api].[amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta]) <> (select count(*) from [dw].[api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta])))
		and
		(select count(*) from [dw].[api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta]) > 0)

BEGIN

SET @pvm = dbo.api_update_time(getdate())

TRUNCATE TABLE [api].[amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta];

INSERT INTO [api].[amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta](
	defaultorder,
	tilastovuosi,
	kuukausi,
	oppilaitoksen_maakunta,
	sukupuoli,
	aidinkieli,
	ika,
	kansalaisuus,
	uudet_opiskelijat_lkm,
	opiskelijat_lkm,
	tutkinnon_suorittaneet_lkm,
	tietojoukko_paivitetty_pvm)

SELECT
	   f.defaultorder
      ,f.tilastovuosi
      ,f.kuukausi
      ,f.oppilaitoksenMaakunta
      ,f.sukupuoli
      ,f.aidinkieli
      ,f.ika
      ,f.kansalaisuus
      ,f.uudetOpiskelijatLkm
      ,f.opiskelijatLkm 
      ,f.tutkinnonSuorittaneetLkm 
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
FROM dw.api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta f

END

IF ((select count(*) from [dw].[api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]