USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [sa].[sa_oiva_jarjestysluvat] ALTER COLUMN [id] [varchar] (40) NULL;
ALTER TABLE [sa].[sa_oiva_jarjestysluvat] ALTER COLUMN [lupatila_id] [varchar] (40) NULL;
ALTER TABLE [sa].[sa_oiva_jarjestysluvat] ALTER COLUMN [meta.paatos_old_id] [varchar] (40) NULL;
ALTER TABLE [sa].[sa_oiva_jarjestysluvat] ALTER COLUMN [paatoskierros_id] [varchar] (40) NULL;
