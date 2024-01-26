USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_vastaavuusavain]    Script Date: 15.12.2023 10:50:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_vastaavuusavain]') AND type in (N'U'))
DROP TABLE [dbo].[f_vastaavuusavain]
GO

/****** Object:  Table [dbo].[f_vastaavuusavain]    Script Date: 15.12.2023 10:50:36 ******/
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
	[koulutusta_jarjestetaan] [int] NULL,
	[jarj_koulutusala_taso1] [int] NULL,
	[jarj_koulutusala_taso2] [int] NULL,
	[jarj_koulutusala_taso3] [int] NULL,
	[jarjestys_ammattiryhma1] [varchar](26) NULL,
	[jarjestys_ammattiryhma2] [varchar](26) NULL,
	[jarjestys_koulutusaste] [int] NULL
) ON [PRIMARY]
GO

USE [ANTERO]