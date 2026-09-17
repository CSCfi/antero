USE [ARVO_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE 

ALTER TABLE sa.sa_arvo_v2_vastaajatunnukset ADD metatiedot VARCHAR(2000);
ALTER TABLE sa.sa_arvo_v2_vastaajatunnukset ADD ei_kuulu_lahetettavien_perusjoukkoon INT;
GO
USE [ANTERO]