USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_2_9_Korkeakoulut_tutkinnot]    Script Date: 5.11.2025 10.24.20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_9_Korkeakoulut_tutkinnot]') AND type in (N'U'))
  DROP TABLE [dbo].[sa_2_9_Korkeakoulut_tutkinnot]
GO

CREATE TABLE [dbo].[sa_2_9_Korkeakoulut_tutkinnot](
	[tilv] [varchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [varchar](1) NULL,
	[lahde] [varchar](2) NULL,
	[tunn] [varchar](5) NULL,
	[jarj] [varchar](10) NULL,
	[koulk] [varchar](6) NULL,
	[opm95opa] [varchar](2) NULL,
	[kkun] [varchar](3) NULL,
	[sp] [varchar](1) NULL,
	[aikielir1x] [varchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[tilvaskun] [varchar](3) NULL,
	[tilvaskunx] [varchar](3) NULL,
	[kansalr2] [varchar](1) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[rahlahde] [varchar](1) NULL,
	[alvv_kksek] [varchar](4) NULL,
	[alvv_kksek_lasna] [varchar](4) NULL,
	[alvv_sek] [varchar](4) NULL,
	[alvv_sek_lasna] [varchar](4) NULL,
	[alvv_kk] [varchar](4) NULL,
	[alvv_kk_lasna] [varchar](4) NULL,
	[alvv_opa] [varchar](4) NULL,
	[alvv_opa_lasna] [varchar](4) NULL,
	[lkm] [int] NULL,
	[tutkamk] [varchar](3) NULL,
	[tunimamk] [varchar](60) NULL,
	[koamk] [varchar](4) NULL,
	[konimamk] [varchar](60) NULL,
	[suun_v] [varchar](5) NULL,
	[svnim] [varchar](60) NULL,
	[koultyp] [varchar](1) NULL,
	[kkieli] [varchar](2) NULL,
	[lasnalk] [int] NULL,
	[poissalk] [int] NULL,
	[oplaaj] [int] NULL,
	[kirtu1v] [varchar](4) NULL,
	[kirtu1k] [varchar](1) NULL,
	[opyhtamk] [int] NULL,
	[opylamamk] [int] NULL,
	[opmuuamk] [int] NULL,
	[opoamk] [int] NULL,
	[opmamk] [int] NULL,
	[opyliopamk] [int] NULL,
	[opulkomamk] [int] NULL,
	[tilmaa] [varchar](1) NULL,
	[tutkyo] [varchar](3) NULL,
	[tunimyo] [varchar](60) NULL,
	[koyo] [varchar](4) NULL,
	[konim] [varchar](60) NULL,
	[paine] [varchar](4) NULL,
	[painenim] [varchar](60) NULL,
	[tdk] [varchar](2) NULL,
	[om] [varchar](1) NULL,
	[opkelp] [varchar](1) NULL,
	[opyhtyo] [int] NULL,
	[opulkyo] [int] NULL,
	[opmuuyo] [int] NULL,
	[opoylio] [int] NULL,
	[opaylio] [int] NULL,
	[opmylio] [int] NULL,
	[opamkyo] [int] NULL,
	[ltop] [int] NULL,
	[laak] [int] NULL,
	[ophal] [varchar](1) NULL,
	[kvopisk] [varchar](1) NULL,
	[suormaa] [varchar](1) NULL,
	[liikkuvuuden_kesto] [varchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
GO


