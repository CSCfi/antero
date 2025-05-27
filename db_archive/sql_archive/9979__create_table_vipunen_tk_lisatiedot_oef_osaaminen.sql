USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[oef_osaaminen]    Script Date: 30.7.2024 12:53:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oef_osaaminen]') AND type in (N'U'))
DROP TABLE [dbo].[oef_osaaminen]
GO

/****** Object:  Table [dbo].[oef_osaaminen]    Script Date: 30.7.2024 12:53:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[oef_osaaminen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oef_osaaminen_koodi] [nvarchar](10) NOT NULL,
	[oef_osaaminen] [nvarchar](1000) NOT NULL,
	[oef_osaaminen_SV] [nvarchar](1000) NOT NULL,
	[oef_osaaminen_EN] [nvarchar](1000) NOT NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
GO

