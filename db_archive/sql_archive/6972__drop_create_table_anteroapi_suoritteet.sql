USE [AnteroAPI]
GO

/****** Object:  Table [api].[suoritteet]    Script Date: 31.1.2023 11:30:46 ******/
DROP TABLE [api].[suoritteet]
GO

/****** Object:  Table [api].[suoritteet]    Script Date: 31.1.2023 11:30:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[suoritteet](
	[defaultorder] [bigint] NOT NULL,
	[Tilastovuosi] [nvarchar](50) NULL,
	[Sektori Koodi] [nvarchar](50) NULL,
	[Sektori] [nvarchar](200) NULL,
	[Koulutuksen järjestäjä Koodi] [nvarchar](50) NULL,
	[Koulutuksen järjestäjä] [nvarchar](255) NULL,
	[Rahoituksen koulutusala Koodi] [nvarchar](50) NULL,
	[Rahoituksen koulutusala] [nvarchar](200) NULL,
	[Koulutusmuoto Koodi] [nvarchar](50) NULL,
	[Koulutusmuoto] [nvarchar](200) NULL,
	[Omistajatyyppi Koodi] [nvarchar](50) NULL,
	[Omistajatyyppi] [nvarchar](200) NULL,
	[Koulutuksen kunta Koodi] [nvarchar](50) NULL,
	[Koulutuksen kunta] [nvarchar](300) NULL,
	[Koulutuksen maakunta Koodi] [nvarchar](2) NULL,
	[Koulutuksen maakunta] [nvarchar](300) NULL,
	[Koulutuksen järjestäjän kunta Koodi] [nvarchar](50) NULL,
	[Koulutuksen järjestäjän kunta] [nvarchar](300) NULL,
	[Koulutuksen järjestäjän maakunta Koodi] [nvarchar](50) NULL,
	[Koulutuksen järjestäjän maakunta] [nvarchar](300) NULL,
	[Suorite] [float] NULL,
	[Summa] [float] NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]