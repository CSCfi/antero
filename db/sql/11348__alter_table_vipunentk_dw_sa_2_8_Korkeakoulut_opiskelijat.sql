USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_2_8_Korkeakoulut_opiskelijat]    Script Date: 5.11.2025 10.23.32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_8_Korkeakoulut_opiskelijat]') AND type in (N'U'))
  DROP TABLE [dbo].[sa_2_8_Korkeakoulut_opiskelijat]
GO

CREATE TABLE [dbo].[sa_2_8_Korkeakoulut_opiskelijat](
	[tilv] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [varchar](1) NULL,
	[lahde] [varchar](2) NULL,
	[tunn] [varchar](5) NULL,
	[jarj] [varchar](10) NULL,
	[koulk] [varchar](6) NULL,
	[kkun] [varchar](3) NULL,
	[sp] [varchar](1) NULL,
	[aikielir1x] [varchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[tilvaskun] [varchar](6) NULL,
	[tilvaskunx] [varchar](3) NULL,
	[tilvaskun2x] [varchar](3) NULL,
	[kansalr2] [varchar](1) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[olotamm] [varchar](1) NULL,
	[olosyys] [varchar](1) NULL,
	[rahlahde] [varchar](1) NULL,
	[fte] [varchar](1) NULL,
	[alvv_kksek] [varchar](4) NULL,
	[alvv_kksek_lasna] [varchar](4) NULL,
	[alvv_sek] [varchar](4) NULL,
	[alvv_sek_lasna] [varchar](4) NULL,
	[alvv_kk] [varchar](4) NULL,
	[alvv_kk_lasna] [varchar](4) NULL,
	[alvv_opa] [varchar](4) NULL,
	[alvv_opa_lasna] [varchar](4) NULL,
	[lkm] [int] NULL,
	[opyht0] [int] NULL,
	[opyht14] [int] NULL,
	[opyht29] [int] NULL,
	[opyht44] [int] NULL,
	[opyht59] [int] NULL,
	[opyht74] [int] NULL,
	[opyht89] [int] NULL,
	[opyht104] [int] NULL,
	[opyht119] [int] NULL,
	[opyht120] [int] NULL,
	[op55] [varchar](1) NULL,
	[opes] [int] NULL,
	[opek] [int] NULL,
	[opker] [int] NULL,
	[tutkamk] [varchar](3) NULL,
	[tunimamk] [nvarchar](60) NULL,
	[koamk] [varchar](4) NULL,
	[konimamk] [nvarchar](60) NULL,
	[suun_v] [varchar](5) NULL,
	[svnim] [nvarchar](40) NULL,
	[koultyp] [varchar](1) NULL,
	[kkieli] [varchar](2) NULL,
	[lasnalk] [int] NULL,
	[poissalk] [int] NULL,
	[oplaaj] [int] NULL,
	[kirtu1v] [varchar](4) NULL,
	[kirtu1k] [varchar](1) NULL,
	[ensisop] [varchar](1) NULL,
	[tilmaa] [varchar](1) NULL,
	[tutkyo] [varchar](3) NULL,
	[tunimyo] [nvarchar](40) NULL,
	[koyo] [varchar](4) NULL,
	[konimyo] [nvarchar](50) NULL,
	[paine] [varchar](4) NULL,
	[painenim] [nvarchar](60) NULL,
	[kk] [varchar](2) NULL,
	[tdk] [varchar](2) NULL,
	[fuksi] [varchar](1) NULL,
	[opoikv] [varchar](4) NULL,
	[om] [varchar](1) NULL,
	[opkelp] [varchar](1) NULL,
	[avo] [varchar](1) NULL,
	[ltop] [int] NULL,
	[laak] [varchar](1) NULL,
	[ophal] [varchar](1) NULL,
	[kvopisk] [varchar](1) NULL,
	[suormaa] [varchar](1) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [varchar](10) NULL
) ON [PRIMARY]
GO


