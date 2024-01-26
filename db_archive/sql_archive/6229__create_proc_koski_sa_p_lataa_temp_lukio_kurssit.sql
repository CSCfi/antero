USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_temp_lukio_kurssit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_temp_lukio_kurssit] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lataa_temp_lukio_kurssit] AS

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_lukio_kurssit]

SELECT * INTO [Koski_SA].[sa].[temp_lukio_kurssit]
FROM [Koski_SA].[sa].[sa_koski_osasuoritus] os
WHERE os.koulutusmoduuli_koodisto in ('lukionkurssit','lukionkurssitops2003nuoret','lukionkurssitops2004aikuiset') and os.suorituksen_tyyppi = 'lukionkurssi' and arviointi_hyvaksytty = 1


GO

USE [ANTERO]