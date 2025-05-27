USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[paivita_sa_koski_opiskeluoikeus]    Script Date: 15.4.2025 8.27.54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [sa].[paivita_sa_koski_opiskeluoikeus] AS

/*
Pelkkiä lukion aineopintoja ei katsota oppivelvollisuuden suorittamiseksi.
VV 28.9.2023
*/

update oo
set oppivelvollisuuden_suorittamiseen_kelpaava = 0
FROM sa.sa_koski_opiskeluoikeus oo
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN (
	SELECT DISTINCT opiskeluoikeus_oid FROM Koski_SA.sa.sa_koski_paatason_suoritus
	WHERE suorituksen_tyyppi = 'lukionoppimaara'
) om on om.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
WHERE koulutusmuoto = 'lukiokoulutus' and suorituksen_tyyppi in  ('lukionaineopinnot', 'lukionoppiaineenoppimaara') and om.opiskeluoikeus_oid is null and oppivelvollisuuden_suorittamiseen_kelpaava = 1

update oo
set master_oid = h.master_oid
FROM sa.sa_koski_opiskeluoikeus oo
LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid

update oo
set master_oid = h.master_oid
FROM sa.sa_koski_opiskeluoikeus_ytr oo
LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid

GO 

USE [ANTERO]