USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus]    Script Date: 25.3.2020 9:22:58 ******/
DROP TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus]
GO

/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus]    Script Date: 25.3.2020 9:22:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [varchar](5) NOT NULL,
	[rahoituslahde_avain] [varchar](20) NOT NULL,
	[tutkimusrahoitus] [decimal](10, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]