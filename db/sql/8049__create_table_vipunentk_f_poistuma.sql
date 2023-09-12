USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_poistuma]    Script Date: 12.9.2023 9:47:29 ******/
DROP TABLE IF EXISTS [dbo].[f_poistuma]
GO

/****** Object:  Table [dbo].[f_poistuma]    Script Date: 12.9.2023 9:47:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_poistuma](
	[tilastovuosi] [int] NULL,
	[ennustevuosi] [int] NULL,
	[mitenna_ammattiryhma2_koodi] [nvarchar](20) NULL,
	[mitenna_toimiala1_koodi] [nvarchar](20) NULL,
	[ika_int] [int] NULL,
	[tyolliset] [float] NULL,
	[kuolleisuus] [float] NULL,
	[tyokyvyttomyys] [float] NULL,
	[vanhuuselake] [float] NULL,
	[poistuma] [float] NULL
) ON [PRIMARY]

GO

USE [ANTERO]