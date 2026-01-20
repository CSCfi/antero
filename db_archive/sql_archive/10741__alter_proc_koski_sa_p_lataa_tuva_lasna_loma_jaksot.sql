USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_tuva_lasna_loma_jaksot]    Script Date: 15.4.2025 8.58.48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [sa].[p_lataa_tuva_lasna_loma_jaksot] AS

--tuva-opiskelijoiden rajaamiseksi muiden koulutusten opiskelijoista

DROP TABLE IF EXISTS [sa].tuva_lasna_loma_jaksot

SELECT DISTINCT
	oppija_oid
	,master_oid
	,alku
	,loppu = coalesce(loppu,'9999-12-31')
INTO sa.tuva_lasna_loma_jaksot
FROM sa.sa_koski_opiskeluoikeus oo
JOIN [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
WHERE oo.koulutusmuoto = 'tuva'
AND ooa.tila in ('lasna','loma')


CREATE NONCLUSTERED INDEX [NC_tuva_lasna_loma_jaksot] ON [sa].tuva_lasna_loma_jaksot
(
	oppija_oid ASC
	,alku ASC
	,loppu ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

USE [ANTERO]