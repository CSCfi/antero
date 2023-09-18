USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_poistuma_kertoimet]    Script Date: 18.9.2023 9:20:00 ******/
DROP TABLE [dbo].[f_poistuma_kertoimet]
GO

/****** Object:  Table [dbo].[f_poistuma_kertoimet]    Script Date: 18.9.2023 9:20:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_poistuma_kertoimet](
	[tilastovuosi] [int] NOT NULL,
	[ika_int] [int] NULL,
	[mitenna_ammattiryhma2_koodi] [nvarchar](20) NULL,
	[d_elakkeelle_siirtynyt_tai_kuollut_id] [int] NULL,
	[kerroin] [float] NULL,
	[vuodet] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]