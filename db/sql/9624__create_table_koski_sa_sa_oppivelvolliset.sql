USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_oppivelvolliset]    Script Date: 21.2.2024 14:03:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oppivelvolliset]') AND type in (N'U'))
DROP TABLE [sa].[sa_oppivelvolliset]
GO

/****** Object:  Table [sa].[sa_oppivelvolliset]    Script Date: 21.2.2024 14:03:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_oppivelvolliset](
	[oppija_oid] [varchar](50) NULL,
	[alkuPvm] [date] NULL,
	[loppuPvm] [date] NULL
) ON [PRIMARY]
GO

USE [ANTERO]