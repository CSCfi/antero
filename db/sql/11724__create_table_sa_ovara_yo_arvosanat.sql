USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_ovara_yo_arvosanat]    Script Date: 4.2.2026 9.55.45 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ovara_yo_arvosanat]') AND type in (N'U'))
DROP TABLE [sa].[sa_ovara_yo_arvosanat]
GO

/****** Object:  Table [sa].[sa_ovara_yo_arvosanat]    Script Date: 4.2.2026 9.55.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ovara_yo_arvosanat](
	[master_oid] [nvarchar](255) NULL,
	[valmistumispaivamaara] [date] NULL,
	[arvosana_id] [nvarchar](255) NULL,
	[arvosana] [nvarchar](255) NULL,
	[arvosana_asteikko] [int] NULL,
	[pisteet] [int] NULL,
	[aine] [nvarchar](255) NULL,
	[koetunnus] [nvarchar](255) NULL,
	[lisatieto] [nvarchar](255) NULL,
	[valinnainen] [int] NULL,
	[myonnetty] [date] NULL, 
	[loadtime] [datetime] NOT NULL,
	[source] [varchar] (100) NULL
) ON [PRIMARY]