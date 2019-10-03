USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]    Script Date: 9.3.2018 17:09:07 ******/
DROP TABLE IF EXISTS [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
GO
/****** Object:  Table [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]    Script Date: 9.3.2018 17:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [nvarchar](10) NULL,
	[tieteenala_avain] [nvarchar](10) NULL,
	[virkaryhma_avain] [nvarchar](10) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[sukupuoli_avain] [nvarchar](10) NULL,
	[tutkintotaso_avain] [nvarchar](10) NULL,
	[lkm_tutkimustyovuodet] [decimal](8, 4) NULL,
	[apuraha] [decimal](8, 4) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]