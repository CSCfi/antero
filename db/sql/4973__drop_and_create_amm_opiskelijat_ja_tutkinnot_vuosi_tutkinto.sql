USE [ANTERO]
GO

/****** Object:  Table [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]    Script Date: 3.11.2021 9:49:39 ******/
DROP TABLE [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]
GO

/****** Object:  Table [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]    Script Date: 3.11.2021 9:49:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[tutkinto] [nvarchar](200) NULL,
	[koulutuksen_jarjestaja] [nvarchar](255) NULL,
	[uudet_opiskelijat_lkm] [int] NULL,
	[opiskelijat_lkm] [int] NULL,
	[tutkinnon_suorittaneet_lkm] [int] NULL,
	[koodi_koulutuksen_jarjestaja] [varchar](50) NULL,
	[koodi_tutkinto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


