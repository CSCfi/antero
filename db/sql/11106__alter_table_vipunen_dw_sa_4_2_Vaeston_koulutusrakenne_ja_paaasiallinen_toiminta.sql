USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 27.8.2025 10.00.40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]') AND type in (N'U'))
  DROP TABLE [dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]
GO

CREATE TABLE [dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[tilvasmaak] [nvarchar](3) NULL,
	[kansalr1] [nvarchar](1) NULL,
	[pohjmaa] [nvarchar](1) NULL,
	[eumaa] [nvarchar](1) NULL,
	[etamaa] [nvarchar](1) NULL,
	[suorv] [nvarchar](4) NULL,
	[suormaak] [nvarchar](2) NULL,
	[kkieli] [nvarchar](2) NULL,
	[koulk] [nvarchar](6) NULL,
	[kouljat] [nvarchar](1) NULL,
	[oppis] [nvarchar](1) NULL,
	[tutklaja_tr] [nvarchar](1) NULL,
	[ptoim1r6] [nvarchar](2) NULL,
	[amm2001] [nvarchar](2) NULL,
	[amm2010] [nvarchar](2) NULL,
	[tsekt] [nvarchar](2) NULL,
	[ka_opiskkoulk] [nvarchar](6) NULL,
	[ta_opiskkoulk] [nvarchar](6) NULL,
	[tutkjoht] [nvarchar](1) NULL,
	[kk_haku_kaste] [nvarchar](2) NULL,
	[kk_haku_vuosi] [nvarchar](4) NULL,
	[ta_haku_kaste] [nvarchar](2) NULL,
	[ta_haku_vuosi] [nvarchar](4) NULL,
	[ulkom] [nvarchar](1) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
GO


