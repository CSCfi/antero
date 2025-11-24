USE [AnteroAPI]
GO

/****** Object:  Table [api].[tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 24.11.2025 9.40.15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[api].[tavoiteajassa_tutkinnon_suorittaneet]') AND type in (N'U'))
DROP TABLE [api].[tavoiteajassa_tutkinnon_suorittaneet]
GO

/****** Object:  Table [api].[tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 24.11.2025 9.40.15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[tavoiteajassa_tutkinnon_suorittaneet](
	[defaultorder] [bigint] IDENTITY(1,1) NOT NULL,
	[Tilastovuosi] [int] NULL,
	[Kuukausi] [int] NULL,
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
	[koulutustyyppi] [nvarchar](255) NULL,
	[koulutuskieli] [nvarchar](255) NULL,
	[rahoituslahde] [nvarchar](100) NULL,
	[Koodi Sektori] [varchar](2) NULL,
	[Koodi Korkeakoulu] [varchar](6) NULL,
	[Koodi Koulutus] [varchar](6) NULL,
	[Aineistotyyppi] [varchar](20) NULL,
	[Tietojen ajankohta] [varchar](15) NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

