USE [AnteroAPI]
GO

/****** Object:  Table [dw].[api_opiskelijat_ja_tutkinnot]    Script Date: 1.3.2024 9:40:27 ******/
DROP TABLE [dw].[api_opiskelijat_ja_tutkinnot]
GO

/****** Object:  Table [dw].[api_opiskelijat_ja_tutkinnot]    Script Date: 1.3.2024 9:40:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_opiskelijat_ja_tutkinnot](
	[Tilastovuosi] [varchar](50) NULL,
	[Aineistotyyppi] [nvarchar](100) NULL,
	[Sektori] [nvarchar](60) NULL,
	[Korkeakoulu] [nvarchar](255) NULL,
	[Koulutus] [nvarchar](200) NULL,
	[Sukupuoli] [nvarchar](100) NULL,
	[Tutkinnot] [int] NULL,
	[Opiskelijat] [int] NULL,
	[opiskelijatFte] [float] NULL,
	[Uudet opiskelijat] [int] NULL,
	[Koulutusaste taso 1] [nvarchar](200) NULL,
	[Koulutusaste taso 2] [nvarchar](200) NULL,
	[Koulutusala taso 1] [nvarchar](200) NULL,
	[Koulutusala taso 2] [nvarchar](200) NULL,
	[Koulutusala taso 3] [nvarchar](200) NULL,
	[OKM ohjauksen ala] [nvarchar](200) NULL,
	[Rahoitusmalliala amk 2017-2020] [nvarchar](255) NULL,
	[Rahoitusmalliala amk 2021-2024] [nvarchar](255) NULL,
	[Rahoitusmalliala yo 2017-2020] [nvarchar](255) NULL,
	[Rahoitusmalliala yo 2021-2024] [nvarchar](255) NULL,
	[rahoituslahde] [nvarchar](255) NULL,
	[Koodi Sektori] [varchar](2) NULL,
	[Koodi Korkeakoulu] [varchar](50) NULL,
	[Koodi Koulutus] [varchar](50) NULL
) ON [PRIMARY]

GO

USE [ANTERO]