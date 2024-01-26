USE [Koski_SA]
GO

/****** Object:  Table [dbo].[TK_amm_tutkinnot]    Script Date: 12.10.2023 13:35:22 ******/
DROP TABLE IF EXISTS [dbo].[TK_amm_tutkinnot]
GO

/****** Object:  Table [dbo].[TK_amm_tutkinnot]    Script Date: 12.10.2023 13:35:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TK_amm_tutkinnot](
	[suorv] [int] NULL,
	[master_oppija] [varchar](50) NULL,
	[oppija] [varchar](50) NULL,
	[opiskeluoikeus] [varchar](100) NOT NULL,
	[aikielir1] [varchar](2) NOT NULL,
	[alvv] [int] NULL,
	[alkk] [int] NULL,
	[jarj_opisk] [varchar](20) NULL,
	[jarjnimi_opisk] [nvarchar](500) NULL,
	[jarj_tutk] [varchar](20) NULL,
	[jarjnimi_tutk] [nvarchar](500) NULL,
	[tavoite] [int] NULL,
	[toteuma_tutk] [int] NOT NULL,
	[koulk] [varchar](6) NULL,
	[oppis] [int] NOT NULL,
	[kustannusryhma] [varchar](10) NULL,
	[rahoitus] [varchar](2) NULL,
	[tyov] [int] NOT NULL,
	[rnk] [bigint] NULL
) ON [PRIMARY]

GO
