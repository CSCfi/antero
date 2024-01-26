USE [Arvo_SA]
GO

/****** Object:  Table [sa].[sa_arvo_kohteet]    Script Date: 3.10.2023 13:40:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--kohteet
ALTER TABLE [sa].[sa_arvo_kohteet]
ALTER COLUMN [vastaajaid] int

DROP INDEX IF EXISTS [NC__sa_arvo_kohteet] ON [sa].[sa_arvo_kohteet]

ALTER TABLE [sa].[sa_arvo_kohteet]
ALTER COLUMN [vastaajatunnusid] int

CREATE NONCLUSTERED INDEX [NC__sa_arvo_kohteet] ON [sa].[sa_arvo_kohteet]
(
	[vastaajatunnusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

ALTER TABLE [sa].[sa_arvo_kohteet]
ALTER COLUMN [kyselykertaid] int

--taustatiedot
DROP INDEX IF EXISTS [NC__sa_arvo_kohteet_taustatiedot] ON [sa].[sa_arvo_kohteet_taustatiedot]

ALTER TABLE [sa].[sa_arvo_kohteet_taustatiedot]
ALTER COLUMN [vastaajatunnusid] int

CREATE NONCLUSTERED INDEX [NC__sa_arvo_kohteet_taustatiedot] ON [sa].[sa_arvo_kohteet_taustatiedot]
(
	[vastaajatunnusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

--virta
ALTER TABLE [sa].[sa_virta_taustatiedot]
ALTER COLUMN [vastaajaid] int

DROP INDEX IF EXISTS [NC__sa_virta_taustatiedot] ON [sa].[sa_virta_taustatiedot]
GO

ALTER TABLE [sa].[sa_virta_taustatiedot]
ALTER COLUMN [vastaajatunnusid] int

CREATE NONCLUSTERED INDEX [NC__sa_virta_taustatiedot] ON [sa].[sa_virta_taustatiedot]
(
	[vastaajatunnusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
