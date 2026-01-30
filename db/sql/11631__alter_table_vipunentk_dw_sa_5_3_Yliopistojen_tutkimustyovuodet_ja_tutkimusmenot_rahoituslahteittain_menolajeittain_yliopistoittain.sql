USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]    Script Date: 26.1.2026 14.28.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]') AND type in (N'U'))
  DROP TABLE [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]
GO

CREATE TABLE [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[tunn] [nvarchar](10) NULL,
	[tiede] [nvarchar](10) NULL,
	[yhme] [decimal](9, 3) NULL,
	[kmeno] [decimal](9, 3) NULL,
	[palme] [decimal](9, 3) NULL,
	[apuraha] [decimal](9, 3) NULL,
	[mkmeno] [decimal](9, 3) NULL,
	[ptmeno] [decimal](9, 3) NULL,
	[akatemia] [decimal](9, 3) NULL,
	[mokm] [decimal](9, 3) NULL,
	[tekes] [decimal](9, 3) NULL,
	[mktm] [decimal](9, 3) NULL,
	[um] [decimal](9, 3) NULL,
	[om] [decimal](9, 3) NULL,
	[sm] [decimal](9, 3) NULL,
	[pm] [decimal](9, 3) NULL,
	[vm] [decimal](9, 3) NULL,
	[mmm] [decimal](9, 3) NULL,
	[lvm] [decimal](9, 3) NULL,
	[stm] [decimal](9, 3) NULL,
	[ym] [decimal](9, 3) NULL,
	[kunnat] [decimal](9, 3) NULL,
	[muuju] [decimal](9, 3) NULL,
	[rahas] [decimal](9, 3) NULL,
	[akys] [decimal](9, 3) NULL,
	[auys] [decimal](9, 3) NULL,
	[eu] [decimal](9, 3) NULL,
	[eup] [decimal](9, 3) NULL,
	[eakr] [decimal](9, 3) NULL,
	[esr] [decimal](9, 3) NULL,
	[meu] [decimal](9, 3) NULL,
	[urahas] [decimal](9, 3) NULL,
	[mkvj] [decimal](9, 3) NULL,
	[amus] [decimal](9, 3) NULL,
	[ot_menot] [decimal](9, 3) NULL,
	[rkork] [decimal](9, 3) NULL,
	[halue] [decimal](9, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
GO


