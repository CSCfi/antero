USE [Koski_SA]
GO

/****** Object:  Table [dbo].[TK_amm_tutkinnot_rahoituskausittain]    Script Date: 17.1.2024 13:05:33 ******/
DROP TABLE IF EXISTS [dbo].[TK_amm_tutkinnot_rahoituskausittain]
GO

/****** Object:  Table [dbo].[TK_amm_tutkinnot_rahoituskausittain]    Script Date: 17.1.2024 13:05:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TK_amm_tutkinnot_rahoituskausittain](
	[rahoituskausi] [varchar](39) NOT NULL,
	[suorv] [int] NOT NULL,
	[vahvistus_paiva] [datetime] NULL,
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
	[rahoitus] [varchar](10) NULL,
	[tyov] [int] NOT NULL,
	[rnk] [bigint] NULL
) ON [PRIMARY]

GO
