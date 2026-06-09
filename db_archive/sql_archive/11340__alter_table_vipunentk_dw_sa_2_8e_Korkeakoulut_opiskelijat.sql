USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_2_8e_Korkeakoulut_opiskelijat]    Script Date: 31.10.2025 10.50.39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_8e_Korkeakoulut_opiskelijat]') AND type in (N'U'))
  DROP TABLE [dbo].[sa_2_8e_Korkeakoulut_opiskelijat]
GO

CREATE TABLE [dbo].[sa_2_8e_Korkeakoulut_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](1) NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](5) NULL,
	[jarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[koultyp] [nvarchar](1) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[synkk] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[olotamm] [nvarchar](1) NULL,
	[olosyys] [varchar](1) NULL,
	[kkieli] [nvarchar](2) NULL,
	[ltop] [nvarchar](1) NULL,
	[laak] [nvarchar](1) NULL,
	[alvv_kksek] [nvarchar](4) NULL,
	[kansalr2] [nvarchar](1) NULL,
	[opoikv] [nvarchar](4) NULL,
	[ophal] [varchar](1) NULL,
	[kvopisk] [varchar](1) NULL,
	[suormaa] [varchar](1) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
GO


