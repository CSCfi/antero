USE [VipunenTK_SA]
GO
/****** Object:  Table [dbo].[sa_api_vaestoennuste_2019]    Script Date: 7.1.2020 17:56:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_api_vaestoennuste_2019]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_api_vaestoennuste_2019](
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
END
GO
USE [ANTERO]