USE [Arvo_SA]
GO

/****** Object:  StoredProcedure [sa].[p_poista_indeksit_arvo_sa]    Script Date: 26.4.2023 19:39:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_poista_indeksit_arvo_sa] AS

DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset] ON [sa].[sa_arvo_vastaukset]
DROP INDEX IF EXISTS [NC__sa_arvo_vastaajat] ON [sa].[sa_arvo_vastaajat]
DROP INDEX IF EXISTS [NC__sa_arvo_kohteet] ON [sa].[sa_arvo_kohteet]
DROP INDEX IF EXISTS [NC__sa_arvo_kohteet_taustatiedot] ON [sa].[sa_arvo_kohteet_taustatiedot]

GO


