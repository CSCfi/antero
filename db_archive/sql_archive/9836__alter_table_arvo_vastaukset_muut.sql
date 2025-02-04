USE [Arvo_SA]
GO

DROP INDEX [NC__sa_arvo_vastaukset_muut] ON [sa].[sa_arvo_vastaukset_muut]
GO


ALTER TABLE [Arvo_SA].[sa].[sa_arvo_vastaukset_muut]
ALTER COLUMN numerovalinta DECIMAL(10,2)
GO

CREATE NONCLUSTERED INDEX [NC__sa_arvo_vastaukset_muut] ON [sa].[sa_arvo_vastaukset_muut]
(
	[kysymysid] ASC
)
INCLUDE([vastaajaid],[vastaajatunnusid],[kyselykertaid],[numerovalinta]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
