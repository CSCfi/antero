USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_poistuma_kertoimet]    Script Date: 12.9.2023 9:48:10 ******/
DROP TABLE IF EXISTS [dbo].[f_poistuma_kertoimet]
GO

/****** Object:  Table [dbo].[f_poistuma_kertoimet]    Script Date: 12.9.2023 9:48:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_poistuma_kertoimet](
	[tilastovuosi] [int] NOT NULL,
	[ika_int] [int] NULL,
	[mitenna_ammattiryhma2_koodi] [nvarchar](20) NULL,
	[d_elakkeelle_siirtynyt_tai_kuollut_id] [int] NULL,
	[kerroin] [float] NULL
) ON [PRIMARY]

GO

USE [ANTERO]