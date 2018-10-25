USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [sa].[sa_oiva_maaraykset_pdi] ALTER COLUMN [id] [varchar] (40) NULL
ALTER TABLE [sa].[sa_oiva_maaraykset_pdi] ALTER COLUMN [lupaId] [varchar] (40) NULL
