USE [ANTERO]
GO

DROP TABLE IF EXISTS [dbo].[sa_suorat_yo8d_rekrytointi_koonti];
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_suorat_yo8d_rekrytointi_koonti](
	[Korkeakoulu] [varchar](5) NULL,
	[Tilastovuosi] [int] NULL,
	[Hakunumero] [varchar](100) NULL,
	[Sopimusnumero] [varchar](100) NULL,
	[Henkilönumero] [varchar](11) NULL,
	[Nimike] [varchar](5) NULL,
	[Tutkijanuraporras] [varchar](5) NULL,
	[Nimitystapa] [varchar](5) NULL,
	[Tohtorintutkinnon suoritusvuosi] [varchar](5) NULL,
	[Tohtorintutkinnon suoritusmaa] [varchar](5) NULL,
	[Tohtorintutkinnon yliopisto] [varchar](5) NULL,
	[Kysymysryhmä] [varchar](100) NULL,
	[Kysymys] [varchar](600) NULL,
	[Vastaus] [varchar](600) NULL,
	[Laitos tai vastaava] [varchar](4000) NULL,
	[Sukupuoli] [varchar](4000) NULL,
	[Kansalaisuus] [varchar](4000) NULL,
	[Äidinkieli] [varchar](4000) NULL,
	[Pääasiallinen tieteenala] [varchar](4000) NULL,
	[Tutkijanuravaihe tai tuntiopettajuus] [varchar](4000) NULL,
	[Henkilöstöryhmä] [varchar](4000) NULL,
	[Harjoittelukoulujen henkilöstöryhmä] [varchar](4000) NULL,
	[Valinta kutsumenettelyllä] [varchar](4000) NULL,
	[Toimipaikka] [varchar](4000) NULL,
	[Merkittävin tutkinto] [varchar](4000) NULL,
	[Tehtäväjaottelu] [varchar](4000) NULL,
	[Sopimuksen alkupäivämäärä] [varchar](4000) NULL,
	[Sopimuksen loppupäivämäärä] [varchar](4000) NULL,
	[Ikä] [int] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[Tutkinnon suoritusmaa] [varchar](4000) NULL,
	[Tohtoritutkintokoulutuskoodi] [varchar](10) NULL,
	[Maisterintutkintokorkeakoulu] [varchar](5) NULL,
	[Maisterintutkintokoulutuskoodi] [varchar](10) NULL,
	[Maisterintutkintosuoritusvuosi] [varchar](5) NULL
) ON [PRIMARY]

GO
