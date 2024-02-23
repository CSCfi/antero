USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_oppivelvolliset_esi_ja_perusopetus]    Script Date: 21.2.2024 14:04:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oppivelvolliset_esi_ja_perusopetus]') AND type in (N'U'))
DROP TABLE [sa].[sa_oppivelvolliset_esi_ja_perusopetus]
GO

/****** Object:  Table [sa].[sa_oppivelvolliset_esi_ja_perusopetus]    Script Date: 21.2.2024 14:04:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_oppivelvolliset_esi_ja_perusopetus](
	[oppija_oid] [varchar](50) NULL,
	[alkuPvm] [date] NULL,
	[loppuPvm] [date] NULL
) ON [PRIMARY]
GO

USE [ANTERO]