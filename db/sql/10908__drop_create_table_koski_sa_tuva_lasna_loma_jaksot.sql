USE [Koski_SA]
GO

/****** Object:  Table [sa].[tuva_lasna_loma_jaksot]    Script Date: 29.7.2025 15.53.54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[tuva_lasna_loma_jaksot]') AND type in (N'U'))
DROP TABLE [sa].[tuva_lasna_loma_jaksot]
GO

/****** Object:  Table [sa].[tuva_lasna_loma_jaksot]    Script Date: 29.7.2025 15.53.54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[tuva_lasna_loma_jaksot](
	[master_oid] [varchar](150) NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL
) ON [PRIMARY]
GO


