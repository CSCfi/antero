USE [Arvo_SA]
GO

/****** Object:  StoredProcedure [sa].[p_poista_indeksit_arvo_sa]    Script Date: 13.7.2023 14:28:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [sa].[p_poista_indeksit_arvo_sa] AS

DROP INDEX IF EXISTS [NC__sa_arvo_vastaajat] ON [sa].[sa_arvo_vastaajat]
DROP INDEX IF EXISTS [NC__sa_arvo_kohteet] ON [sa].[sa_arvo_kohteet]
DROP INDEX IF EXISTS [NC__sa_arvo_kohteet_taustatiedot] ON [sa].[sa_arvo_kohteet_taustatiedot]
/*
--jätetään voimaan, koska ekstraktissa update-insert
DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset] ON [sa].[sa_arvo_vastaukset] --vanha
DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_amis] ON [sa].[sa_arvo_vastaukset_amis]
DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_amk_uraseuranta] ON [sa].[sa_arvo_vastaukset_amk_uraseuranta]
DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_avop] ON [sa].[sa_arvo_vastaukset_avop]
DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_kandi] ON [sa].[sa_arvo_vastaukset_kandi]
DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_muut] ON [sa].[sa_arvo_vastaukset_muut]
DROP INDEX IF EXISTS [NC__sa_arvo_vastaukset_tep] ON [sa].[sa_arvo_vastaukset_tep]
*/

GO
