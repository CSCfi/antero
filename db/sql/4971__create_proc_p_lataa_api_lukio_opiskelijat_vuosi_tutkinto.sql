USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_api_lukio_opiskelijat_vuosi_tutkinto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_api_lukio_opiskelijat_vuosi_tutkinto] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_api_lukio_opiskelijat_vuosi_tutkinto] AS

BEGIN
EXEC [dw].[p_lataa_api_lukio_opiskelijat_vuosi_tutkinto_esilataus]
END

IF(SELECT COUNT(*) FROM dw.api_lukio_opiskelijat_vuosi_tutkinto) > 0 AND (SELECT COUNT(DISTINCT tilastovuosi) FROM dw.api_lukio_opiskelijat_vuosi_tutkinto) >= 4

BEGIN

TRUNCATE TABLE [api].[lukio_opiskelijat_vuosi_tutkinto];

INSERT INTO [api].[lukio_opiskelijat_vuosi_tutkinto]

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

USE [ANTERO]