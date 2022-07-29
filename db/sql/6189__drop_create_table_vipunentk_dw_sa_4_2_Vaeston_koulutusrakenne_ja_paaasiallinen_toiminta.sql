USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 5.5.2022 20:47:37 ******/
DROP TABLE [dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]
GO

/****** Object:  Table [dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 5.5.2022 20:47:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[tilvasmaak] [nvarchar](2) NULL,
	[kansalr1] [nvarchar](1) NULL,
	[pohjmaa] [nvarchar](1) NULL,
	[eumaa] [nvarchar](1) NULL,
	[etamaa] [nvarchar](1) NULL,
	[suorv] [nvarchar](4) NULL,
	[suormaak] [nvarchar](2) NULL,
	[koulk] [nvarchar](6) NULL,
	[kouljat] [nvarchar](1) NULL,
	[oppis] [nvarchar](1) NULL,
	[tutklaja_tr] [nvarchar](1) NULL,
	[ptoim1r6] [nvarchar](2) NULL,
	[amm2001] [nvarchar](2) NULL,
	[amm2010] [nvarchar](2) NULL,
	[tsekt] [nvarchar](2) NULL,
	[opiskkoulk] [nvarchar](6) NULL,
	[tutkjoht] [nvarchar](1) NULL,
	[ulkom] [nvarchar](1) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


