USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[toimialaennuste_perus]    Script Date: 19.12.2023 14:14:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toimialaennuste_perus]') AND type in (N'U'))
DROP TABLE [dbo].[toimialaennuste_perus]
GO

/****** Object:  Table [dbo].[toimialaennuste_perus]    Script Date: 19.12.2023 14:14:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[toimialaennuste_perus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oef_toimiala_koodi] [nvarchar](10) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[tyolliset] [float] NOT NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
GO

USE [ANTERO]