USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]    Script Date: 28.12.2021 12:59:39 ******/
DROP TABLE IF EXISTS [dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]
GO

/****** Object:  Table [dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]    Script Date: 28.12.2021 12:59:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat](
	[tilv] [nvarchar](4) NULL,
	[lahde] [nvarchar](2) NULL,
	[alvv] [int] NULL,
	[jarj] [nvarchar](10) NULL,
	[opmala] [nvarchar](2) NULL,
	[iscfibroad2013] [nvarchar](2) NULL,
	[kmaak] [nvarchar](2) NULL,
	[suorv] [int] NULL,
	[suoropmala] [nvarchar](2) NULL,
	[suoriscfibroad2013] [nvarchar](2) NULL,
	[suortutk] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](16) NOT NULL
) ON [PRIMARY]

GO


