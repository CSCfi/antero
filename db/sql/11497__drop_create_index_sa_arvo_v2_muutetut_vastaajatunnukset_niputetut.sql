USE [Arvo_SA]
GO

/****** Object:  Index [NCI-sa_arvo_v2_muutetut_vastaajatunnukset_niputetut]    Script Date: 30.12.2025 16.32.58 ******/
DROP INDEX [NCI-sa_arvo_v2_muutetut_vastaajatunnukset_niputetut] ON [sa].[sa_arvo_v2_muutetut_vastaajatunnukset_niputetut]
GO

/****** Object:  Index [NCI-sa_arvo_v2_muutetut_vastaajatunnukset_niputetut]    Script Date: 30.12.2025 16.32.58 ******/
CREATE NONCLUSTERED INDEX [NCI-sa_arvo_v2_muutetut_vastaajatunnukset_niputetut] ON [sa].[sa_arvo_v2_muutetut_vastaajatunnukset_niputetut]
(
	[vastaajatunnusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


USE ANTERO
