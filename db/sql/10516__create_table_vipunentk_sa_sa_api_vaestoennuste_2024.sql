USE [VipunenTK_SA]
GO

/****** Object:  Table [dbo].[sa_api_vaestoennuste_2024]    Script Date: 20.1.2025 13.55.17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_api_vaestoennuste_2024]') AND type in (N'U'))
DROP TABLE [dbo].[sa_api_vaestoennuste_2024]
GO

/****** Object:  Table [dbo].[sa_api_vaestoennuste_2024]    Script Date: 20.1.2025 13.55.17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_api_vaestoennuste_2024](
	[Kunta] [varchar](100) NULL,
	[Vuosi] [int] NULL,
	[Sukupuoli] [varchar](100) NULL,
	[Ika] [varchar](100) NULL,
	[Tiedot] [varchar](100) NULL,
	[Ennustemalli] [varchar](100) NULL,
	[latauspvm] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
	[Source] [varchar](200) NULL,
	[lkm] [int] NULL
) ON [PRIMARY]
GO


USE [ANTERO]