USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]    Script Date: 28.5.2019 15:51:29 ******/
DROP TABLE [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]
GO

/****** Object:  Table [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]    Script Date: 28.5.2019 15:51:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[tunn] [nvarchar](10) NULL,
	[tiede] [nvarchar](10) NULL,
	[yhme] [decimal](8, 3) NULL,
	[kmeno] [decimal](8, 3) NULL,
	[palme] [decimal](8, 3) NULL,
	[apuraha] [decimal](8, 3) NULL,
	[mkmeno] [decimal](8, 3) NULL,
	[ptmeno] [decimal](8, 3) NULL,
	[sakat] [decimal](8, 3) NULL,
	[mokm] [decimal](8, 3) NULL,
	[tekes] [decimal](8, 3) NULL,
	[mtem] [decimal](8, 3) NULL,
	[um] [decimal](8, 3) NULL,
	[om] [decimal](8, 3) NULL,
	[sm] [decimal](8, 3) NULL,
	[pm] [decimal](8, 3) NULL,
	[vm] [decimal](8, 3) NULL,
	[mmm] [decimal](8, 3) NULL,
	[lvm] [decimal](8, 3) NULL,
	[stm] [decimal](8, 3) NULL,
	[ym] [decimal](8, 3) NULL,
	[kunnat] [decimal](8, 3) NULL,
	[mjulk] [decimal](8, 3) NULL,
	[krahas] [decimal](8, 3) NULL,
	[kyrit] [decimal](8, 3) NULL,
	[uyrit] [decimal](8, 3) NULL,
	[eu] [decimal](8, 3) NULL,
	[eupuite] [decimal](8, 3) NULL,
	[eakr] [decimal](8, 3) NULL,
	[esr] [decimal](8, 3) NULL,
	[muueu] [decimal](8, 3) NULL,
	[urahas] [decimal](8, 3) NULL,
	[kv_jarj] [decimal](8, 3) NULL,
	[mulko] [decimal](8, 3) NULL,
	[ot_menot] [decimal](8, 3) NULL,
	[rkork] [decimal](8, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]