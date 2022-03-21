USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[paivita_sa_taulujen_indeksit]    Script Date: 21.7.2020 11:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [sa].[paivita_sa_taulujen_indeksit] AS



IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('sa.sa_koski_paatason_suoritus') AND NAME ='index2')
BEGIN
	CREATE NONCLUSTERED INDEX [index2] ON [sa].[sa_koski_paatason_suoritus]
	(
		[opiskeluoikeus_oid] ASC,
		[suorituksen_tyyppi] ASC,
		[vahvistus_paiva] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
ELSE BEGIN
	ALTER INDEX [index2] ON [sa].[sa_koski_paatason_suoritus] REBUILD PARTITION = ALL WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END




IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('sa.sa_koski_osasuoritus') AND NAME ='index2')
BEGIN
	CREATE NONCLUSTERED INDEX [index2] ON [sa].[sa_koski_osasuoritus]
	(
		[arviointi_hyvaksytty] ASC,
		[arviointi_paiva] ASC,
		[rahoituksen_piirissa] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
ELSE BEGIN
	ALTER INDEX [index2] ON [sa].[sa_koski_osasuoritus] REBUILD PARTITION = ALL WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END





IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('sa.sa_koski_opiskeluoikeus_aikajakso') AND NAME ='index2')
BEGIN
	CREATE NONCLUSTERED INDEX [index2] ON [sa].[sa_koski_opiskeluoikeus_aikajakso]
	(
		[opiskeluoikeus_oid] ASC,
		[tila] ASC,
		[alku] ASC,
		[loppu] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
END
ELSE BEGIN
	ALTER INDEX [index2] ON [sa].[sa_koski_opiskeluoikeus_aikajakso] REBUILD PARTITION = ALL WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END





IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('sa.sa_koski_opiskeluoikeus') AND NAME ='index2')
BEGIN
	CREATE NONCLUSTERED INDEX [index2] ON [sa].[sa_koski_opiskeluoikeus]
	(
		[opiskeluoikeus_oid] ASC,
		[sisaltyy_opiskeluoikeuteen_oid] ASC,
		[koulutusmuoto] ASC
	)
	INCLUDE ( 	[alkamispaiva],
	[paattymispaiva]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
ELSE BEGIN
	ALTER INDEX [index2] ON [sa].[sa_koski_opiskeluoikeus] REBUILD PARTITION = ALL WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END





IF NOT EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('sa.sa_koski_henkilo') AND NAME ='index2')
BEGIN
	CREATE UNIQUE NONCLUSTERED INDEX [index2] ON [sa].[sa_koski_henkilo]
	(
		[oppija_oid] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
END
ELSE BEGIN
	ALTER INDEX [index2] ON [sa].[sa_koski_henkilo] REBUILD PARTITION = ALL WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END


GO
USE [ANTERO]