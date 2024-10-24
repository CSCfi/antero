USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]    Script Date: 4.12.2018 15:26:45 ******/
DROP TABLE [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
GO

/****** Object:  Table [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]    Script Date: 4.12.2018 15:26:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [nvarchar](10) NULL,
	[tieteenala_avain] [nvarchar](10) NULL,
	[virkaryhma_avain] [nvarchar](10) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[sukupuoli_avain] [nvarchar](10) NULL,
	[tutkintotaso_avain] [nvarchar](10) NULL,
	[koulutusaste_taso2_avain] [nvarchar](10) NULL,
	[lkm_tutkimustyovuodet] [decimal](8, 4) NULL,
	[apuraha] [decimal](8, 4) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE[ANTERO]