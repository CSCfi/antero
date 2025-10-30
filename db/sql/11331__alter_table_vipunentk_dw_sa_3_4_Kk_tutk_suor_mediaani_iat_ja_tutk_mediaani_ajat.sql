USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]    Script Date: 30.10.2025 9.53.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]') AND type in (N'U'))
  DROP TABLE [dbo].[sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]
GO

CREATE TABLE [dbo].[sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](5) NULL,
	[jarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[koultyp] [nvarchar](1) NULL,
	[rahlahde_v2] [nvarchar](2) NULL,
	[kvopisk] [nvarchar](2) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[synkk] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[alvv_kk] [nvarchar](4) NULL,
	[allk_kk] [nvarchar](1) NULL,
	[suorv] [nvarchar](4) NULL,
	[suorkk] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
GO


