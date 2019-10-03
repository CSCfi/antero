USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_Vaestoennuste]    Script Date: 28.11.2018 15:07:52 ******/
DROP TABLE [dbo].[f_Vaestoennuste]
GO

/****** Object:  Table [dbo].[f_Vaestoennuste]    Script Date: 28.11.2018 15:07:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Vaestoennuste](
	[ennv] [varchar](4) NULL,
	[tilvaskun] [varchar](3) NULL,
	[tilvaskun_id] [int] NULL,
	[sp_id] [int] NULL,
	[ika_id] [int] NULL,
	[lkm] [int] NULL,
	[ennustemalli] [varchar](20) NULL
) ON [PRIMARY]

GO

USE [ANTERO]