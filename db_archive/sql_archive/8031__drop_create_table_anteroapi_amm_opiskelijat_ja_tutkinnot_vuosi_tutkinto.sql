USE [AnteroAPI]
GO

/****** Object:  Table [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]    Script Date: 6.9.2023 18:20:44 ******/
DROP TABLE [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]
GO

/****** Object:  Table [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]    Script Date: 6.9.2023 18:20:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[suorituksen_tyyppi] [nvarchar](200) NOT NULL,
	[tutkintotyyppi] [nvarchar](200) NOT NULL,
	[tutkinto] [nvarchar](200) NOT NULL,
	[koulutuksen_jarjestaja] [nvarchar](255) NOT NULL,
	[hankintakoulutuksen_jarjestaja] [nvarchar](255) NOT NULL,
	[hankintakoulutus_kylla_ei] [bit] NOT NULL,
	[koodi_tutkinto] [varchar](50) NOT NULL,
	[koodi_koulutuksen_jarjestaja] [varchar](50) NOT NULL,
	[koodi_hankintakoulutuksen_jarjestaja] [varchar](50) NOT NULL,
	[uudet_opiskelijat_lkm] [int] NOT NULL,
	[opiskelijat_lkm] [int] NOT NULL,
	[tutkinnon_suorittaneet_lkm] [int] NOT NULL,
	[nettoopiskelijamaara_lkm] [decimal](20,10) NOT NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
