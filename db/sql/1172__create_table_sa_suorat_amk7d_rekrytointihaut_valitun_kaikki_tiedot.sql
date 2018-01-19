USE [ANTERO]

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot')
BEGIN

CREATE TABLE [sa].[sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot](
	[Korkeakoulu] [nvarchar](5) NULL,
	[Tilastovuosi] [nvarchar](5) NULL,
	[Hakunumero] [nvarchar](100) NULL,
	[Henkilönumero] [nvarchar](20) NULL,
	[Sopimusnumero] [nvarchar](100) NULL,
	[Nimike] [nvarchar](100) NULL,
	[Tehtäväryhmä] [nvarchar](5) NULL,
	[Nimitystapa] [nvarchar](5) NULL,
	[Kysymysryhmä] [nvarchar](100) NULL,
	[Kysymys] [nvarchar](400) NULL,
	[Vastaus] [nvarchar](400) NULL,
	[Sukupuoli] [nvarchar](5) NULL,
	[Kansalaisuus] [nvarchar](5) NULL,
	[Äidinkieli] [nvarchar](5) NULL,
	[Pääasiallinen tieteenala] [nvarchar](5) NULL,
	[Tehtävänjaottelu] [nvarchar](5) NULL,
	[Päätoimiset opettajat] [nvarchar](5) NULL,
	[Toimipaikka] [nvarchar](5) NULL,
	[Henkilön suorittaman merkittävin tutkinto] [nvarchar](5) NULL,
	[Merkittävimmän tutkinnon taso] [nvarchar](5) NULL,
	[Tutkinnon suoritusmaa] [nvarchar](5) NULL,
	[Kelpoisuus, tutkinto] [nvarchar](5) NULL,
	[Kelpoisuus, työkokemus] [nvarchar](5) NULL,
	[Kelpoisuus, opettajankoulutus] [nvarchar](5) NULL,
	[alayksikkö] [nvarchar](20) NULL,
	[Sopimuksen alkupäivämäärä] [datetime] NULL,
	[Sopimuksen loppupäivämäärä] [datetime] NULL,
	[Ikä] [nvarchar](5) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [nvarchar](100) NULL
) ON [PRIMARY]
END
