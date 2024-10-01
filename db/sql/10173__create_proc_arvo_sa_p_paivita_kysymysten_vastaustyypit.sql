USE [Arvo_SA]
GO

/****** Object:  StoredProcedure [sa].[p_paivita_kyselykertaid]    Script Date: 1.10.2024 14:17:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [sa].[p_paivita_kysymysten_vastaustyypit] AS

-- nps
update [Arvo_SA].[sa].[sa_arvo_kysymykset]
SET vastaustyyppi = 'nps'
WHERE vastaustyyppi = 'nps_kaanteinen_selko'

-- asteikko5_1
update [Arvo_SA].[sa].[sa_arvo_kysymykset]
SET vastaustyyppi = 'asteikko5_1'
WHERE vastaustyyppi = 'asteikko5_1_selko'


GO


USE [ANTERO]