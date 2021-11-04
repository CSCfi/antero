USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_lukio_opiskelijat_vuosi_tutkinto]    Script Date: 3.11.2021 11:29:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_lukio_opiskelijat_vuosi_tutkinto] AS

BEGIN
EXEC [dw].[p_lataa_api_lukio_opiskelijat_vuosi_tutkinto_esilataus]
END

IF(SELECT COUNT(*) FROM dw.api_lukio_opiskelijat_vuosi_tutkinto) > 0 AND (SELECT COUNT(DISTINCT tilastovuosi) FROM dw.api_lukio_opiskelijat_vuosi_tutkinto) >= 4

BEGIN

TRUNCATE TABLE [api].[lukio_opiskelijat_vuosi_tutkinto];

INSERT INTO [api].[lukio_opiskelijat_vuosi_tutkinto](
	defaultorder,
	tilastovuosi,
	tutkinto,
	koulutuksen_jarjestaja,
	uudet_opiskelijat_lkm,
	opiskelijat_lkm,
	koodi_koulutuksen_jarjestaja,
	koodi_tutkinto
)

SELECT
	f.defaultorder,
	f.tilastovuosi,
	f.tutkinto,
	f.koulutuksenJarjestaja,
	f.uudetOpiskelijatLkm,
	f.opiskelijatLkm,
	f.koodiKoulutuksenJarjestaja,
	f.koodiTutkinto
FROM dw.api_lukio_opiskelijat_vuosi_tutkinto f

END

ELSE RAISERROR('Input table has 0 rows',11,1)

GO


