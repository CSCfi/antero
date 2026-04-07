USE [Arvo_SA]
GO

/****** Object:  StoredProcedure [sa].[p_paivita_kysymysten_vastaustyypit]    Script Date: 16.3.2026 10.22.10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE [sa].[p_paivita_kysymysten_vastaustyypit] AS

-- nps
update [Arvo_SA].[sa].[sa_arvo_kysymykset]
SET vastaustyyppi = 'nps'
WHERE vastaustyyppi = 'nps_kaanteinen_selko'
update [Arvo_SA].[sa].[sa_arvo_v2_kysymykset]
SET kysymystyyppi = 'nps'
WHERE kysymystyyppi = 'nps_kaanteinen_selko'

-- nps
update [Arvo_SA].[sa].[sa_arvo_v2_kysymykset]
SET kysymystyyppi = 'nps'
WHERE kysymystyyppi = 'nps_kaanteinen_selko'

-- asteikko5_1
update [Arvo_SA].[sa].[sa_arvo_v2_kysymykset]
SET kysymystyyppi = 'asteikko5_1'
WHERE kysymystyyppi = 'asteikko5_1_selko'