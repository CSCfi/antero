USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [sa].[sa_koski_mitatoity_opiskeluoikeus] ALTER COLUMN [oppilaitos_nimi] [varchar](500) NULL;
ALTER TABLE [sa].[sa_koski_mitatoity_opiskeluoikeus] ALTER COLUMN	[koulutustoimija_nimi] [varchar](500) NULL;

USE ANTERO
