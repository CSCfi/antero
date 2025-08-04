USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_oppivelvolliset]    Script Date: 29.7.2025 15.45.11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oppivelvolliset]') AND type in (N'U'))
DROP TABLE [sa].[sa_oppivelvolliset]
GO

/****** Object:  Table [sa].[sa_oppivelvolliset]    Script Date: 29.7.2025 15.45.11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_oppivelvolliset](
	[master_oid] [varchar](50) NULL,
	[alkuPvm] [date] NULL,
	[loppuPvm] [date] NULL,
	[pidennetty_oppivelvollisuus] [int] NULL
) ON [PRIMARY]
GO


