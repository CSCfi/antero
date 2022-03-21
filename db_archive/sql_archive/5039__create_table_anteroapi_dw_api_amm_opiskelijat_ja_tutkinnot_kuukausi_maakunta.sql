USE [AnteroAPI]
GO

/****** Object:  Table [api].[tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 15.11.2021 13:53:21 ******/
DROP TABLE IF EXISTS [dw].[api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta]
GO

/****** Object:  Table [api].[tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 15.11.2021 13:53:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_amm_opiskelijat_ja_tutkinnot_kuukausi_maakunta](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[oppilaitoksenMaakunta] [nvarchar](100) NULL,
	[sukupuoli] [nvarchar](30) NULL,
	[aidinkieli] [nvarchar](30) NULL,
	[ika] [nvarchar](30) NULL,
	[kansalaisuus] [nvarchar](30) NULL,
	[uudetOpiskelijatLkm] [int] NULL,
	[opiskelijatLkm] [int] NULL,
	[tutkinnonSuorittaneetLkm] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]

