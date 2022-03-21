USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]    Script Date: 28.12.2021 12:57:30 ******/
DROP TABLE IF EXISTS [dbo].[sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]
GO

/****** Object:  Table [dbo].[sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]    Script Date: 28.12.2021 12:57:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat](
	[tilv] [nvarchar](4) NULL,
	[lahde] [nvarchar](2) NULL,
	[kmaak] [nvarchar](2) NULL,
	[jarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[ophal] [nvarchar](2) NULL,
	[tutkmaak] [nvarchar](2) NULL,
	[tutkjarj] [nvarchar](10) NULL,
	[tutkkoulk] [nvarchar](6) NULL,
	[seurvkmaak] [nvarchar](3) NULL,
	[seurvjarj] [nvarchar](10) NULL,
	[seurvkoulk] [nvarchar](6) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](11) NOT NULL
) ON [PRIMARY]

GO


