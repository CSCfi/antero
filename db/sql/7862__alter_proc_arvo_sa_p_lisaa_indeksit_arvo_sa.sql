USE [Arvo_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lisaa_indeksit_arvo_sa]    Script Date: 12.7.2023 18:00:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [sa].[p_lisaa_indeksit_arvo_sa] AS

--vastaajat
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

--kohteet
DROP INDEX IF EXISTS [NC__sa_arvo_kohteet] ON [sa].[sa_arvo_kohteet]
CREATE NONCLUSTERED INDEX [NC__sa_arvo_kohteet] ON [sa].[sa_arvo_kohteet]
(
	[vastaajatunnusid] ASC
) 
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

--taustatiedot
DROP INDEX IF EXISTS [NC__sa_arvo_kohteet_taustatiedot] ON [sa].[sa_arvo_kohteet_taustatiedot]
CREATE NONCLUSTERED INDEX [NC__sa_arvo_kohteet_taustatiedot] ON [sa].[sa_arvo_kohteet_taustatiedot]
(
	[vastaajatunnusid] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

--vastaukset (vanha taulu sekä pilkotut)
DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset] ON [sa].[sa_arvo_vastaukset]
CREATE NONCLUSTERED INDEX [NC__sa_arvo_vastaukset] ON [sa].[sa_arvo_vastaukset] 
(
	[kysymysid]
)
INCLUDE ([vastaajaid],
	[vastaajatunnusid],
	[kyselykertaid],
	[numerovalinta]
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_amis] ON [sa].[sa_arvo_vastaukset_amis]
CREATE NONCLUSTERED INDEX [NC__sa_arvo_vastaukset__amis] ON [sa].[sa_arvo_vastaukset_amis] 
(
	[kysymysid]
)
INCLUDE ([vastaajaid],
	[vastaajatunnusid],
	[kyselykertaid],
	[numerovalinta]
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_amk_uraseuranta] ON [sa].[sa_arvo_vastaukset_amk_uraseuranta]
CREATE NONCLUSTERED INDEX [NC__sa_arvo_vastaukset_amk_uraseuranta] ON [sa].[sa_arvo_vastaukset_amk_uraseuranta] 
(
	[kysymysid]
)
INCLUDE ([vastaajaid],
	[vastaajatunnusid],
	[kyselykertaid],
	[numerovalinta]
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_avop] ON [sa].[sa_arvo_vastaukset_avop]
CREATE NONCLUSTERED INDEX [NC__sa_arvo_vastaukset_avop] ON [sa].[sa_arvo_vastaukset_avop] 
(
	[kysymysid]
)
INCLUDE ([vastaajaid],
	[vastaajatunnusid],
	[kyselykertaid],
	[numerovalinta]
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_kandi] ON [sa].[sa_arvo_vastaukset_kandi]
CREATE NONCLUSTERED INDEX [NC__sa_arvo_vastaukset_kandi] ON [sa].[sa_arvo_vastaukset_kandi] 
(
	[kysymysid]
)
INCLUDE ([vastaajaid],
	[vastaajatunnusid],
	[kyselykertaid],
	[numerovalinta]
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_muut] ON [sa].[sa_arvo_vastaukset_muut]
CREATE NONCLUSTERED INDEX [NC__sa_arvo_vastaukset_muut] ON [sa].[sa_arvo_vastaukset_muut] 
(
	[kysymysid]
)
INCLUDE ([vastaajaid],
	[vastaajatunnusid],
	[kyselykertaid],
	[numerovalinta]
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_tep] ON [sa].[sa_arvo_vastaukset_tep]
CREATE NONCLUSTERED INDEX [NC__sa_arvo_vastaukset_tep] ON [sa].[sa_arvo_vastaukset_tep] 
(
	[kysymysid]
)
INCLUDE ([vastaajaid],
	[vastaajatunnusid],
	[kyselykertaid],
	[numerovalinta]
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
