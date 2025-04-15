USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[paivita_sa_koski_opiskeluoikeus]    Script Date: 15.4.2025 8.27.54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [sa].[paivita_valpas] AS

update v
set master_oid = h.master_oid
FROM Koski_SA.sa.sa_valpas_oppivelvollisuudesta_vapautetut v
LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = v.oppija_oid

update v
set master_oid = h.master_oid
FROM Koski_SA.sa.sa_valpas_oppivelvollisuuden_keskeytys v
LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = v.oppija_oid

update v
set master_oid = h.master_oid
FROM Koski_SA.sa.sa_valpas_oppivelvollisuuden_keskeytyshistoria v
LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = v.oppija_oid

GO 

USE [ANTERO]