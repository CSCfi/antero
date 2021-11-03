USE [ANTERO]
GO

/****** Object:  Table [api].[amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta]    Script Date: 3.11.2021 9:43:34 ******/
DROP TABLE [api].[amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta]
GO

/****** Object:  Table [api].[amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta]    Script Date: 3.11.2021 9:43:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[oppilaitoksen_maakunta] [nvarchar](100) NULL,
	[sukupuoli] [nvarchar](30) NULL,
	[aidinkieli] [nvarchar](30) NULL,
	[ika] [nvarchar](30) NULL,
	[kansalaisuus] [nvarchar](30) NULL,
	[uudet_opiskelijat_lkm] [int] NULL,
	[opiskelijat_lkm] [int] NULL,
	[tutkinnon_suorittaneet_lkm] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


