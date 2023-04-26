USE [ANTERO]
GO

--NonClusteredIndex-20211228-193250
DROP INDEX IF EXISTS [NonClusteredIndex-20220126-132127] ON [sa].[sa_ehoks_perustiedot_laajempi]
GO

DROP INDEX IF EXISTS [NonClusteredIndex-20220126-132247] ON [sa].[sa_ehoks_perustiedot_laajempi]
GO

DROP INDEX IF EXISTS [NonClusteredIndex-20211228-193250] ON [sa].[sa_ehoks_hato]
GO

DROP INDEX IF EXISTS [NC_idx_sa_ehoks_hato__1] ON [sa].[sa_ehoks_hato]
GO

/****** Object:  Index [NonClusteredIndex-20220126-132247]    Script Date: 26.4.2023 11:38:15 ******/
DROP INDEX IF EXISTS [NC_idx_sa_ehoks_perustiedot_laajempi__ehoks_id] ON [sa].[sa_ehoks_perustiedot_laajempi]
GO

/****** Object:  Index [NonClusteredIndex-20220126-132247]    Script Date: 26.4.2023 11:38:15 ******/
DROP INDEX IF EXISTS [NC_idx_sa_ehoks_perustiedot_laajempi__opiskeluoikeus_oid] ON [sa].[sa_ehoks_perustiedot_laajempi]
GO

/****** Object:  Index [NonClusteredIndex-20220126-132247]    Script Date: 26.4.2023 11:38:15 ******/
CREATE NONCLUSTERED INDEX [NC_idx_sa_ehoks_perustiedot_laajempi__ehoks_id] ON [sa].[sa_ehoks_perustiedot_laajempi]
(
	[ehoks_id] ASC
	--,opiskeluoikeus_oid ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

/****** Object:  Index [NonClusteredIndex-20220126-132247]    Script Date: 26.4.2023 11:38:15 ******/
CREATE NONCLUSTERED INDEX [NC_idx_sa_ehoks_perustiedot_laajempi__opiskeluoikeus_oid] ON [sa].[sa_ehoks_perustiedot_laajempi]
(
	opiskeluoikeus_oid ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

/****** Object:  Index [NonClusteredIndex-20211228-193250]    Script Date: 26.4.2023 17:49:34 ******/
CREATE NONCLUSTERED INDEX [NC_idx_sa_ehoks_hato__1] ON [sa].[sa_ehoks_hato]
(
	[opiskeluoikeus_oid] ASC,
	[osaamisen_hankkimistapa_koodi] ASC
)
INCLUDE (
	[alku],
	[loppu],
	[ehoks_id],
	[tyopaikan_ytunnus]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

