USE [AnteroAPI]
GO

/****** Object:  Table [api].[julkaisut]    Script Date: 31.1.2023 11:25:30 ******/
DROP TABLE [api].[julkaisut]
GO

/****** Object:  Table [api].[julkaisut]    Script Date: 31.1.2023 11:25:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[julkaisut](
	[defaultorder] [bigint] IDENTITY(0,1) NOT NULL,
	[Tilastovuosi] [int] NULL,
	[julkaisunTunnus] [varchar](50) NULL,
	[Koodit Sektori] [varchar](4) NULL,
	[Sektori] [varchar](200) NULL,
	[Sektor] [varchar](200) NULL,
	[Sector] [varchar](200) NULL,
	[Koodit Organisaatio] [varchar](20) NULL,
	[Organisaatio] [varchar](255) NULL,
	[OrganisationSV] [varchar](255) NULL,
	[OrganisationEN] [varchar](255) NULL,
	[Koodit Ammattikorkeakoulu] [varchar](20) NULL,
	[Ammattikorkeakoulu] [varchar](255) NULL,
	[Koodit Yliopisto] [varchar](20) NULL,
	[Yliopisto] [varchar](255) NULL,
	[Koodit Julkaisufoorumitaso] [varchar](100) NULL,
	[Julkaisufoorumitaso] [varchar](255) NULL,
	[JulkaisufoorumitasoSV] [varchar](255) NULL,
	[JulkaisufoorumitasoEN] [varchar](255) NULL,
	[Koodit Julkaisufoorumitaso 2011-2014] [varchar](100) NULL,
	[Julkaisufoorumitaso 2011-2014] [varchar](255) NULL,
	[Julkaisufoorumitaso 2011-2014SV] [varchar](255) NULL,
	[Julkaisufoorumitaso 2011-2014EN] [varchar](255) NULL,
	[Koodit Julkaisufoorumitaso 2015->] [varchar](100) NULL,
	[Julkaisufoorumitaso 2015->] [varchar](255) NULL,
	[Julkaisufoorumitaso 2015->SV] [varchar](255) NULL,
	[Julkaisufoorumitaso 2015->EN] [varchar](255) NULL,
	[Koodit Julkaisun pääluokka] [varchar](2) NULL,
	[Julkaisun pääluokka] [varchar](200) NULL,
	[Julkaisun pääluokkaSV] [varchar](200) NULL,
	[Julkaisun pääluokkaEN] [varchar](200) NULL,
	[Koodit Julkaisutyyppi] [varchar](4) NULL,
	[Julkaisutyyppi] [varchar](200) NULL,
	[JulkaisutyyppiSV] [varchar](200) NULL,
	[JulkaisutyyppiEN] [varchar](200) NULL,
	[Koodit Julkaisun kansainvälisyys] [varchar](100) NULL,
	[Julkaisun kansainvälisyys] [varchar](255) NULL,
	[Julkaisun kansainvälisyysSV] [varchar](255) NULL,
	[Julkaisun kansainvälisyysEN] [varchar](255) NULL,
	[Koodit Kansainvälinen yhteisjulkaisu] [varchar](100) NULL,
	[Kansainvälinen yhteisjulkaisu] [varchar](255) NULL,
	[Kansainvälinen yhteisjulkaisuSV] [varchar](255) NULL,
	[Kansainvälinen yhteisjulkaisuEN] [varchar](255) NULL,
	[Koodit Päätieteenala] [int] NULL,
	[Päätieteenala] [varchar](200) NULL,
	[PäätieteenalaSV] [varchar](200) NULL,
	[PäätieteenalaEN] [varchar](200) NULL,
	[Koodit Tieteenala] [int] NULL,
	[Tieteenala] [varchar](200) NULL,
	[TieteenalaSV] [varchar](200) NULL,
	[TieteenalaEN] [varchar](200) NULL,
	[Koodit OKM ohjauksen ala] [int] NULL,
	[OKM ohjauksen ala] [varchar](100) NULL,
	[OKM ohjauksen alaSV] [varchar](100) NULL,
	[OKM ohjauksen alaEN] [varchar](100) NULL,
	[Koodit Koulutusala 95] [int] NULL,
	[Koulutusala 95] [varchar](55) NULL,
	[Utbildningsområde 95] [varchar](55) NULL,
	[Field of education 95] [varchar](55) NULL,
	[Koodit Koulutusala 02] [int] NULL,
	[Koulutusala 02] [varchar](255) NULL,
	[Utbildningsområde 02] [varchar](255) NULL,
	[Field of education 02] [varchar](255) NULL,
	[Yhteisjulk. yliop. sairaanhoitopiiri] [varchar](100) NULL,
	[Yhteisjulk. valtion sektoritutkimuslaitos] [varchar](100) NULL,
	[Yhteisjulk. muu kotim. tutkimusorganisaatio] [varchar](100) NULL,
	[Yhteisjulkaisu yrityksen kanssa] [varchar](100) NULL,
	[Julkaisu rinnakkaistallennettu] [varchar](100) NULL,
	[Koodit Avoin saatavuus] [int] NULL,
	[Avoin saatavuus] [varchar](100) NULL,
	[JufoTunnus] [varchar](10) NULL,
	[lukumaara] [decimal](15, 5) NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]