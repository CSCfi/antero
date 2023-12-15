USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_poistuma]    Script Date: 15.12.2023 10:33:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_poistuma]') AND type in (N'U'))
DROP TABLE [dbo].[f_poistuma]
GO

/****** Object:  Table [dbo].[f_poistuma]    Script Date: 15.12.2023 10:33:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_poistuma](
	[tilastovuosi] [int] NULL,
	[ennustevuosi] [int] NULL,
	[d_oef_ammatti_id] [int] NULL,
	[oef_toimiala_koodi] [nvarchar](20) NULL,
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