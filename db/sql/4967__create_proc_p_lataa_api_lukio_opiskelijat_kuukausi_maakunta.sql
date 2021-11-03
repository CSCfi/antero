USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_api_lukio_opiskelijat_kuukausi_maakunta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_api_lukio_opiskelijat_kuukausi_maakunta] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_api_lukio_opiskelijat_kuukausi_maakunta] AS

BEGIN
EXEC [dw].[p_lataa_api_lukio_opiskelijat_kuukausi_maakunta_esilataus]
END

IF (SELECT COUNT(*) FROM dw.api_lukio_opiskelijat_kuukausi_maakunta) > 0 AND (SELECT COUNT(DISTINCT tilastovuosi) FROM dw.api_lukio_opiskelijat_kuukausi_maakunta) >= 4

BEGIN

TRUNCATE TABLE [api].[lukio_opiskelijat_kuukausi_maakunta];

INSERT INTO [api].[lukio_opiskelijat_kuukausi_maakunta]

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
FROM dw.api_lukio_opiskelijat_kuukausi_maakunta f

END

ELSE RAISERROR('Input table has 0 rows',11,1)

GO

USE [ANTERO]