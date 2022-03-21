USE [ANTERO]
GO

/****** Object:  Table [api].[koulutuksenkustannukset]    Script Date: 7.5.2021 4:04:41 ******/
DROP TABLE [api].[koulutuksenkustannukset]
GO

/****** Object:  Table [api].[koulutuksenkustannukset]    Script Date: 7.5.2021 4:04:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[koulutuksenkustannukset](
	[defaultorder] [bigint] NOT NULL,
	[Tilastovuosi] [varchar](5) NULL,
	[Sektori Koodi] [varchar](30) NULL,
	[Sektori] [varchar](100) NULL,
	[Koulutuksen järjestäjä Koodi] [varchar](30) NULL,
	[Koulutuksen järjestäjä] [varchar](300) NULL,
	[Rahoituksen koulutusala Koodi] [varchar](30) NULL,
	[Rahoituksen koulutusala] [varchar](300) NULL,
	[Koulutusmuoto Koodi] [varchar](30) NULL,
	[Koulutusmuoto] [varchar](100) NULL,
	[Omistajatyyppi Koodi] [varchar](30) NULL,
	[Omistajatyyppi] [varchar](30) NULL,
	[Koulutuksen kunta Koodi] [varchar](30) NULL,
	[Koulutuksen kunta] [varchar](300) NULL,
	[Koulutuksen maakunta Koodi] [varchar](30) NULL,
	[Koulutuksen maakunta] [varchar](300) NULL,
	[Koulutuksen järjestäjän kunta Koodi] [varchar](30) NULL,
	[Koulutuksen järjestäjän kunta] [varchar](30) NULL,
	[Koulutuksen järjestäjän maakunta Koodi] [varchar](30) NULL,
	[Koulutuksen järjestäjän maakunta] [varchar](30) NULL,
	[Menolaji Koodi] [varchar](30) NULL,
	[Menolaji] [varchar](30) NULL,
	[Toiminto Koodi] [varchar](30) NULL,
	[Toiminto] [varchar](100) NULL,
	[Summa] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


