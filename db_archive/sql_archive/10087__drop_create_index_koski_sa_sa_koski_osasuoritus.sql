USE [Koski_SA]
GO

DROP INDEX IF EXISTS [index2] ON [sa].[sa_koski_osasuoritus]
GO

CREATE NONCLUSTERED INDEX [index2] ON [sa].[sa_koski_osasuoritus]
(
	[arviointi_hyvaksytty] ASC,
	[arviointi_paiva] ASC,
	[tunnustettu] ASC,
	[rahoituksen_piirissa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
