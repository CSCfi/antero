USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_poistuma]    Script Date: 18.9.2023 9:37:26 ******/
DROP TABLE [dbo].[f_poistuma]
GO

/****** Object:  Table [dbo].[f_poistuma]    Script Date: 18.9.2023 9:37:26 ******/
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
	[tyolliset_3v] [float] NULL,
	[kuolleisuus_3v] [float] NULL,
	[tyokyvyttomyys_3v] [float] NULL,
	[vanhuuselake_3v] [float] NULL,
	[poistuma_3v] [float] NULL,
	[tyolliset_5v] [float] NULL,
	[kuolleisuus_5v] [float] NULL,
	[tyokyvyttomyys_5v] [float] NULL,
	[vanhuuselake_5v] [float] NULL,
	[poistuma_5v] [float] NULL,
	[tyolliset_7v] [float] NULL,
	[kuolleisuus_7v] [float] NULL,
	[tyokyvyttomyys_7v] [float] NULL,
	[vanhuuselake_7v] [float] NULL,
	[poistuma_7v] [float] NULL
) ON [PRIMARY]

GO

USE [ANTERO]