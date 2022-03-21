USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_rahoitus]    Script Date: 26.3.2020 11:49:19 ******/
DROP TABLE [dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_rahoitus]
GO

/****** Object:  Table [dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_rahoitus]    Script Date: 26.3.2020 11:49:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_rahoitus](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[yosairaala_avain] [varchar](5) NULL,
	[yosairaala_id] [int] NOT NULL,
	[rahoituslahde_avain] [varchar](20) NOT NULL,
	[rahoituslahde_id] [int] NOT NULL,
	[tutkimusrahoitus] [decimal](10, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]