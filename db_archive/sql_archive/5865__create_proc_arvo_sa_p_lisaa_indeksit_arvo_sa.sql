USE [Arvo_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


DROP PROCEDURE IF EXISTS [sa].[p_lisaa_indeksit_arvo_sa]
GO


CREATE PROCEDURE [sa].[p_lisaa_indeksit_arvo_sa] AS

DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset] ON [sa].[sa_arvo_vastaukset]
CREATE NONCLUSTERED INDEX [NC__sa_arvo_vastaukset] ON [sa].[sa_arvo_vastaukset] 
(
	[kysymysid]
)
INCLUDE ([vastaajaid],
	[kyselykertaid],
	[numerovalinta]
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

DROP INDEX IF EXISTS [NC__sa_arvo_vastaajat] ON [sa].[sa_arvo_vastaajat]
CREATE NONCLUSTERED INDEX [NC__sa_arvo_vastaajat] ON [sa].[sa_arvo_vastaajat]
(
	[vastaajaid] ASC
)
INCLUDE ([vastaajatunnus_alkupvm],
	[oppilaitoskoodi],
	[suorituskieli],
	[tutkintokoodi],
	[kuntakoodi]
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO



