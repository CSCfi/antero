USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]    Script Date: 31.1.2023 11:48:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto] AS

DECLARE @pvm date

BEGIN
EXEC [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto_esilataus]
END

IF ((((	select count (*) from (
		select	tilastovuosi, tutkinto, s.koulutuksenJarjestaja as koulutuksen_jarjestaja, s.uudetOpiskelijatLkm as uudet_opiskelijat_lkm,
				s.opiskelijatLkm as opiskelijat_lkm, s.tutkinnonSuorittaneetLkm as tutkinnon_suorittaneet_lkm, s.koodiKoulutuksenJarjestaja as koodi_koulutuksen_jarjestaja, 
				s.koodiTutkinto as koodi_tutkinto
		from [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto] s
		except
		select	tilastovuosi, tutkinto, koulutuksen_jarjestaja, uudet_opiskelijat_lkm, opiskelijat_lkm, tutkinnon_suorittaneet_lkm,
				koodi_koulutuksen_jarjestaja, koodi_tutkinto
		from [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]) s ) > 0)
		or
		((select count(*) from [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]) <> (select count(*) from [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto])))
		and
		(select count(*) from [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]) > 0)

BEGIN

SET @pvm = dbo.api_update_time(getdate())

TRUNCATE TABLE [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto];

INSERT INTO [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto](
	defaultorder,
	tilastovuosi,
	tutkinto,
	koulutuksen_jarjestaja,
	uudet_opiskelijat_lkm,
	opiskelijat_lkm,
	tutkinnon_suorittaneet_lkm,
	koodi_koulutuksen_jarjestaja,
	koodi_tutkinto,
	tietojoukko_paivitetty_pvm
)

SELECT
	f.defaultorder,
	f.tilastovuosi,
	f.tutkinto,
	f.koulutuksenJarjestaja,
	f.uudetOpiskelijatLkm,
	f.opiskelijatLkm,
	f.tutkinnonSuorittaneetLkm,
	f.koodiKoulutuksenJarjestaja,
	f.koodiTutkinto,
	[tietojoukko_paivitetty_pvm] = @pvm
FROM dw.api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto f

END

IF ((select count(*) from [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]