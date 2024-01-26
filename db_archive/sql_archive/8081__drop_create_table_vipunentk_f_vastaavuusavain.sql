USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_vastaavuusavain]    Script Date: 21.9.2023 13:25:11 ******/
DROP TABLE [dbo].[f_vastaavuusavain]
GO

/****** Object:  Table [dbo].[f_vastaavuusavain]    Script Date: 21.9.2023 13:25:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_vastaavuusavain](
	[Tilastovuosi] [int] NULL,
	[lkm] [float] NULL,
	[Ammattiryhmä 1. taso] [nvarchar](250) NULL,
	[Ammattiryhmä 2. taso] [nvarchar](250) NULL,
	[Koulutusaste] [varchar](26) NULL,
	[Koulutusala, taso 1] [nvarchar](255) NULL,
	[Koulutusala, taso 2] [nvarchar](255) NULL,
	[Koulutusala, taso 3] [nvarchar](255) NULL,
	[koulutusta_jarjestetaan] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]