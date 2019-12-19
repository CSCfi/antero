USE [ANTERO]
GO

/****** Object:  Table [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 17.12.2019 17:15:19 ******/
DROP TABLE IF EXISTS [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]
GO

/****** Object:  Table [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 17.12.2019 17:15:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--SELECT * INTO [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]
--FROM [dw].[v_api_tavoiteajassa_tutkinnon_suorittaneet];

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
	[Koodi Koulutus] [varchar](6) NULL,
	[defaultorder] [bigint] NULL
) ON [PRIMARY]




