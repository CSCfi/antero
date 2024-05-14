USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[oef_osaamis_ammatti_luokitusavain]    Script Date: 14.5.2024 13:17:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oef_osaamis_ammatti_luokitusavain]') AND type in (N'U'))
DROP TABLE [dbo].[oef_osaamis_ammatti_luokitusavain]
GO

/****** Object:  Table [dbo].[oef_osaamis_ammatti_luokitusavain]    Script Date: 14.5.2024 13:17:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[oef_osaamis_ammatti_luokitusavain](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oef_ammatti_koodi] [nvarchar](10) NOT NULL,
	[oef_osaaminen_koodi] [nvarchar](10) NOT NULL,
	[oef_osaaminen] [nvarchar](1000) NOT NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
GO

USE [ANTERO]