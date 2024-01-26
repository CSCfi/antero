USE [ANTERO]
GO

DROP TABLE IF EXISTS [sa].[sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot](
	[Korkeakoulu] [varchar](5) NULL,
	[Tilastovuosi] [varchar](5) NULL,
	[Hakunumero] [varchar](100) NULL,
	[Henkilönumero] [varchar](11) NULL,
	[Sopimusnumero] [varchar](100) NULL,
	[Nimike] [varchar](5) NULL,
	[Tutkijanuraporras] [varchar](5) NULL,
	[Nimitystapa] [varchar](5) NULL,
	[Tohtorintutkinnon suoritusvuosi] [varchar](5) NULL,
	[Tohtorintutkinnon suoritusmaa] [varchar](5) NULL,
	[Tohtorintutkinnon yliopisto] [varchar](5) NULL,
	[Tohtoritutkintokoulutuskoodi] [varchar](10) NULL,
	[Maisterintutkintokorkeakoulu] [varchar](5) NULL,
	[Maisterintutkintokoulutuskoodi] [varchar](10) NULL,
	[Maisterintutkintosuoritusvuosi] [varchar](5) NULL,
	[Kysymysryhmä] [varchar](200) NULL,
	[Kysymys] [varchar](200) NULL,
	[Vastaus] [varchar](200) NULL,
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
	[Ikä] [varchar](10) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[Sopimuksen alkupäivämäärä] [datetime] NULL,
	[Sopimuksen loppupäivämäärä] [datetime] NULL
) ON [PRIMARY]

GO
