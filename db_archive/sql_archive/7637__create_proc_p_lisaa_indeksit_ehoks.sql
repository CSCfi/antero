USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER PROCEDURE [sa].[p_lisaa_indeksit_ehoks] AS

DROP INDEX IF EXISTS [NC_idx_sa_ehoks_hato__1] ON [sa].[sa_ehoks_hato]
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

DROP INDEX IF EXISTS [NC_idx_sa_ehoks_perustiedot_laajempi__ehoks_id] ON [sa].[sa_ehoks_perustiedot_laajempi]
CREATE NONCLUSTERED INDEX [NC_idx_sa_ehoks_perustiedot_laajempi__ehoks_id] ON [sa].[sa_ehoks_perustiedot_laajempi]
(
	[ehoks_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]

DROP INDEX IF EXISTS [NC_idx_sa_ehoks_perustiedot_laajempi__opiskeluoikeus_oid] ON [sa].[sa_ehoks_perustiedot_laajempi]
CREATE NONCLUSTERED INDEX [NC_idx_sa_ehoks_perustiedot_laajempi__opiskeluoikeus_oid] ON [sa].[sa_ehoks_perustiedot_laajempi]
(
	opiskeluoikeus_oid ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
