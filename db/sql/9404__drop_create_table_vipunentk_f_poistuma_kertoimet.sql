USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_poistuma_kertoimet]    Script Date: 15.12.2023 10:34:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_poistuma_kertoimet]') AND type in (N'U'))
DROP TABLE [dbo].[f_poistuma_kertoimet]
GO

/****** Object:  Table [dbo].[f_poistuma_kertoimet]    Script Date: 15.12.2023 10:34:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_poistuma_kertoimet](
	[tilastovuosi] [int] NOT NULL,
	[ika_int] [int] NULL,
	[d_oef_ammatti_id] [int] NULL,
	[d_elakkeelle_siirtynyt_tai_kuollut_id] [int] NULL,
	[kerroin] [float] NULL,
	[vuodet] [int] NULL
) ON [PRIMARY]
GO

USE [ANTERO]