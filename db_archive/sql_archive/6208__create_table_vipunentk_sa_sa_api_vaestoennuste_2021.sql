USE [VipunenTK_SA]
GO

/****** Object:  Table [dbo].[sa_api_vaestoennuste_2021]    Script Date: 11.5.2022 12:03:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_api_vaestoennuste_2021](
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