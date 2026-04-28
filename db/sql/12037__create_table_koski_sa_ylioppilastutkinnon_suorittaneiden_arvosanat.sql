USE [Koski_SA]
GO

/****** Object:  Table [dbo].[ylioppilastutkinnon_suorittaneiden_arvosanat]    Script Date: 27.4.2026 12.56.27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ylioppilastutkinnon_suorittaneiden_arvosanat]') AND type in (N'U'))
DROP TABLE [dbo].[ylioppilastutkinnon_suorittaneiden_arvosanat]
GO

/****** Object:  Table [dbo].[ylioppilastutkinnon_suorittaneiden_arvosanat]    Script Date: 27.4.2026 12.56.27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ylioppilastutkinnon_suorittaneiden_arvosanat](
	[master_oid] [varchar](150) NULL,
	[valmistumispaivamaara] [datetime] NULL,
	[suoritusvuosi] [int] NULL,
	[suorituskausi] [varchar](20) NULL,
	[koodiarvo] [varchar](150) NULL,
	[arviointi_arvosana_koodiarvo] [varchar](150) NULL,
	[arviointi_pisteet] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [nvarchar](300) NULL
) ON [PRIMARY]