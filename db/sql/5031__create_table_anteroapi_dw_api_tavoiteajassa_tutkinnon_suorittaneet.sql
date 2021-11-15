USE [AnteroAPI]
GO

/****** Object:  Table [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 15.11.2021 13:51:49 ******/
DROP TABLE IF EXISTS [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]
GO

/****** Object:  Table [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 15.11.2021 13:51:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dw].[api_tavoiteajassa_tutkinnon_suorittaneet](
	[Tilastovuosi] [int] NULL,
	[Sektori] [nvarchar](60) NULL,
	[Korkeakoulu] [nvarchar](255) NULL,
	[Koulutus] [nvarchar](200) NULL,
	[Tutkinnot] [int] NULL,
	[Tavoiteajassa] [int] NULL,
	[Tavoiteaika ylitetty korkeintaan 12 kk] [int] NULL,
	[Tavoiteaika ylitetty yli 12 kk] [int] NULL,
	[On aiempi korkeakoulututkinto] [int] NULL,
	[Tutkintopisteet] [decimal](38, 4) NULL,
	[Tutkintopisteluokka] [decimal](38, 4) NULL,
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
	[Koodi Sektori] [varchar](2) NULL,
	[Koodi Korkeakoulu] [varchar](6) NULL,
	[Koodi Koulutus] [varchar](6) NULL
) ON [PRIMARY]

GO


