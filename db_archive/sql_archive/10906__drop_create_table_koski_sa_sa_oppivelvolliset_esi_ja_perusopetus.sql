USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_oppivelvolliset_esi_ja_perusopetus]    Script Date: 29.7.2025 15.46.19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oppivelvolliset_esi_ja_perusopetus]') AND type in (N'U'))
DROP TABLE [sa].[sa_oppivelvolliset_esi_ja_perusopetus]
GO

/****** Object:  Table [sa].[sa_oppivelvolliset_esi_ja_perusopetus]    Script Date: 29.7.2025 15.46.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_oppivelvolliset_esi_ja_perusopetus](
	[master_oid] [varchar](50) NULL,
	[alkuPvm] [date] NULL,
	[loppuPvm] [date] NULL
) ON [PRIMARY]
GO


