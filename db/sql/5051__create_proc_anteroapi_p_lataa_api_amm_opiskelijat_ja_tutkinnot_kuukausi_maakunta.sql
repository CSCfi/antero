USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta] AS

BEGIN
EXEC [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta_esilataus]
END

IF (SELECT COUNT(*) FROM dw.api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta) > 0 AND (SELECT COUNT(DISTINCT tilastovuosi) FROM dw.api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta) >= 4

BEGIN

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
	tutkinnon_suorittaneet_lkm)

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
FROM dw.api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta f

END

ELSE RAISERROR('Input table has 0 rows',11,1)

GO


