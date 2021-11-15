USE [AnteroAPI]
GO

/****** Object:  Table [api].[tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 15.11.2021 13:53:21 ******/
DROP TABLE IF EXISTS [api].[tavoiteajassa_tutkinnon_suorittaneet]
GO

/****** Object:  Table [api].[tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 15.11.2021 13:53:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[tavoiteajassa_tutkinnon_suorittaneet](
	[defaultorder] [bigint] IDENTITY(1,1) NOT NULL,
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
	[Koodi Koulutus] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


