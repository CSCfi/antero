USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]    Script Date: 6.9.2023 18:22:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto] AS

DECLARE @pvm date

BEGIN
	EXEC [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto_esilataus]
END

IF 
(
	(
		(
			(	
				select count (*) from (
					select [tilastovuosi], [suorituksen_tyyppi], [tutkintotyyppi], [tutkinto], [koulutuksen_jarjestaja], [hankintakoulutuksen_jarjestaja], [hankintakoulutus_kylla_ei], [koodi_tutkinto], [koodi_koulutuksen_jarjestaja], [koodi_hankintakoulutuksen_jarjestaja], [uudet_opiskelijat_lkm], [opiskelijat_lkm], [tutkinnon_suorittaneet_lkm], [nettoopiskelijamaara_lkm]
					from [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto] s
					except
					select [tilastovuosi], [suorituksen_tyyppi], [tutkintotyyppi], [tutkinto], [koulutuksen_jarjestaja], [hankintakoulutuksen_jarjestaja], [hankintakoulutus_kylla_ei], [koodi_tutkinto], [koodi_koulutuksen_jarjestaja], [koodi_hankintakoulutuksen_jarjestaja], [uudet_opiskelijat_lkm], [opiskelijat_lkm], [tutkinnon_suorittaneet_lkm], [nettoopiskelijamaara_lkm]
					from [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]
				) s 
			) 
			> 0
		)
		or
		(
			(select count(*) from [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]) <> (select count(*) from [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto])
			and (select count(*) from [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]) > 0
		)
	)		
)

BEGIN

	SET @pvm = dbo.api_update_time(getdate())

	TRUNCATE TABLE [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto];

	INSERT INTO [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto](
	[defaultorder]
		,[tilastovuosi]
		,[suorituksen_tyyppi]
		,[tutkintotyyppi]
		,[tutkinto]
		,[koulutuksen_jarjestaja]
		,[hankintakoulutuksen_jarjestaja]
		,[hankintakoulutus_kylla_ei]
		,[koodi_tutkinto]
		,[koodi_koulutuksen_jarjestaja]
		,[koodi_hankintakoulutuksen_jarjestaja]
		,[uudet_opiskelijat_lkm]
		,[opiskelijat_lkm]
		,[tutkinnon_suorittaneet_lkm]
		,[nettoopiskelijamaara_lkm]
		,[tietojoukko_paivitetty_pvm]
	)

	SELECT
		[defaultorder]
		,[tilastovuosi]
		,[suorituksen_tyyppi]
		,[tutkintotyyppi]
		,[tutkinto]
		,[koulutuksen_jarjestaja]
		,[hankintakoulutuksen_jarjestaja]
		,[hankintakoulutus_kylla_ei]
		,[koodi_tutkinto]
		,[koodi_koulutuksen_jarjestaja]
		,[koodi_hankintakoulutuksen_jarjestaja]
		,[uudet_opiskelijat_lkm]
		,[opiskelijat_lkm]
		,[tutkinnon_suorittaneet_lkm]
		,[nettoopiskelijamaara_lkm]
		,[tietojoukko_paivitetty_pvm] = @pvm
	FROM dw.api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto f

END


IF ((select count(*) from [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]) = 0)

BEGIN
	RAISERROR('Source table has no rows.',11,1)
END

GO
