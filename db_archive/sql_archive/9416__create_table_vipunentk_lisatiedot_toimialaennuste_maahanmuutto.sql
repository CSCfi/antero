USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[toimialaennuste_maahanmuutto]    Script Date: 19.12.2023 14:13:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toimialaennuste_maahanmuutto]') AND type in (N'U'))
DROP TABLE [dbo].[toimialaennuste_maahanmuutto]
GO

/****** Object:  Table [dbo].[toimialaennuste_maahanmuutto]    Script Date: 19.12.2023 14:13:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[toimialaennuste_maahanmuutto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oef_toimiala_koodi] [nvarchar](10) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[tyolliset] [float] NOT NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
GO

USE [ANTERO]