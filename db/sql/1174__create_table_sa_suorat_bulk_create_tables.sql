
USE VipunenKK_SA
IF  EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk7a_rekrytointihaut')
BEGIN
drop table [sa].[sa_suorat_amk7a_rekrytointihaut]
END

IF NOT EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk7a_rekrytointihaut')

BEGIN
CREATE TABLE [sa].[sa_suorat_amk7a_rekrytointihaut](
	[Korkeakoulu] [varchar](5) NULL,
	[Tilastovuosi] [varchar](4) NULL,
	[Hakunumero] [varchar](100) NULL,
	[Haun kansainvälisyys] [varchar](5) NULL,
	[Sukupuoli] [varchar](5) NULL,
	[Kansalaisuus] [varchar](5) NULL,
	[Ei-suomalaisen hakijan maanosa] [varchar](5) NULL,
	[Hakijoiden määrä per maanosa] [varchar](5) NULL,
	[Hakijoiden määrä yhteensä haussa] [varchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL
) ON [PRIMARY]
END
IF  EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk7b_rekrytointi_valitun_tiedot')
BEGIN
drop table [sa].[sa_suorat_amk7b_rekrytointi_valitun_tiedot]
END

IF NOT EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk7a_rekrytointi_valitun_tiedot')

BEGIN
CREATE TABLE [sa].[sa_suorat_amk7b_rekrytointi_valitun_tiedot](
	[Korkeakoulu] [varchar](5) NULL,
	[Tilastovuosi] [varchar](4) NULL,
	[Hakunumero] [varchar](100) NULL,
	[Sopimusnumero] [varchar](100) NULL,
	[Henkilönumero] [varchar](11) NULL,
	[Nimike] [varchar](100) NULL,
	[Tehtäväryhmä] [varchar](5) NULL,
	[Nimitystapa] [varchar](5) NULL,
	[Tohtorintutkinnon suoritusvuosi] [varchar](4) NULL,
	[Tohtorintutkinnon suoritusmaa] [varchar](5) NULL,
	[Tohtorintutkinnon yliopisto] [varchar](5) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL
) ON [PRIMARY]
END
IF  EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk1_henkilokunta_tk')
BEGIN
drop table [sa].[sa_suorat_amk1_henkilokunta_tk]
END

IF NOT EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk1_henkilokunta_tk')

BEGIN
CREATE TABLE [sa].[sa_suorat_amk1_henkilokunta_tk](
	[Ammattikorkeakoulu] [varchar](4000) NULL,
	[Nimike] [varchar](4000) NULL,
	[Tutkinnon suoritusmaa] [varchar](4000) NULL,
	[Sukupuoli] [varchar](4000) NULL,
	[Syntymävuosi] [varchar](4000) NULL,
	[Kansalaisuus] [varchar](4000) NULL,
	[Äidinkieli] [varchar](4000) NULL,
	[Pääasiallinen tieteenala] [varchar](4000) NULL,
	[Tehtävänjaottelu] [varchar](4000) NULL,
	[Päätoimiset opettajat] [varchar](4000) NULL,
	[Muun henkilökunnan henkilöstöryhmä] [varchar](4000) NULL,
	[Työajan käyttötiedot, opetus] [varchar](4000) NULL,
	[Työajan käyttötiedot, TKI-toiminta] [varchar](4000) NULL,
	[Kelpoisuus, tutkinto] [varchar](4000) NULL,
	[Kelpoisuus, työkokemus] [varchar](4000) NULL,
	[Kelpoisuus, opettajankoulutus] [varchar](4000) NULL,
	[Henkilotyovuosi] [varchar](4000) NULL,
	[Vuosi] [varchar](4000) NULL,
	[Henkilönumero] [varchar](4000) NULL,
	[Toimipaikka] [varchar](4000) NULL,
	[Merkittävimmän tutkinnon taso] [varchar](4000) NULL,
	[Henkilön suorittaman merkittävin tutkinto] [varchar](4000) NULL,
	[Laitos tai vastaava] [varchar](4000) NULL,
	[Nimitystapa (työsuhteen vakituisuus  määräaikaisuus)] [varchar](4000) NULL,
	[Työajan käyttötiedot, muu] [varchar](4000) NULL,
	[ORCID-tunniste] [varchar](4000) NULL,
	[Sopimusnumero] [varchar](4000) NULL,
	[Sopimuksen alkupäivämäärä] [varchar](4000) NULL,
	[Sopimuksen loppupäivämäärä] [varchar](4000) NULL,
	[Hakunumero] [varchar](4000) NULL,
	[latausaika] [datetime] NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL
) ON [PRIMARY]

END
IF  EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo1_henkilokunta_tk')
BEGIN
drop table [sa].[sa_suorat_yo1_henkilokunta_tk]
END

IF NOT EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo1_henkilokunta_tk')

BEGIN
CREATE TABLE [sa].[sa_suorat_yo1_henkilokunta_tk](
	[Yliopisto] [varchar](4000) NULL,
	[Tiedekunta tai vastaava] [varchar](4000) NULL,
	[Laitos tai vastaava] [varchar](4000) NULL,
	[Nimike] [varchar](4000) NULL,
	[Tutkinnon suoritusmaa] [varchar](4000) NULL,
	[Sukupuoli] [varchar](4000) NULL,
	[Syntymävuosi] [varchar](4000) NULL,
	[Kansalaisuus] [varchar](4000) NULL,
	[Äidinkieli] [varchar](4000) NULL,
	[Pääasiallinen tieteenala] [varchar](4000) NULL,
	[Tutkijanuravaihe tai tuntiopettajuus] [varchar](4000) NULL,
	[Henkilöstöryhmä] [varchar](4000) NULL,
	[Harjoittelukoulujen henkilöstöryhmä] [varchar](4000) NULL,
	[Valinta kutsumenettelyllä] [varchar](4000) NULL,
	[Henkilotyovuosi] [varchar](4000) NULL,
	[Vuosi] [varchar](4000) NULL,
	[Henkilönumero] [varchar](4000) NULL,
	[Toimipaikka] [varchar](4000) NULL,
	[ORCID-tunniste] [varchar](4000) NULL,
	[Merkittävin tutkinto] [varchar](4000) NULL,
	[Nimitystapa   työsopimuksen kesto] [varchar](4000) NULL,
	[Tehtäväjaottelu] [varchar](4000) NULL,
	[CHECKSUM_Y01_HENKILOKUNTA] [int] NULL,
	[Sopimusnumero] [varchar](4000) NULL,
	[Sopimuksen alkupäivämäärä] [varchar](4000) NULL,
	[Sopimuksen loppupäivämäärä] [varchar](4000) NULL,
	[Hakunumero] [varchar](4000) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL
) ON [PRIMARY]
END
IF  EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo8a_rekrytointihaut')
BEGIN
drop table [sa].[sa_suorat_yo8a_rekrytointihaut]
END

IF NOT EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo8a_rekrytointihaut')

BEGIN
CREATE TABLE [sa].[sa_suorat_yo8a_rekrytointihaut](
	[Korkeakoulu] [varchar](5) NULL,
	[Tilastovuosi] [varchar](4) NULL,
	[Hakunumero] [varchar](100) NULL,
	[Kutsuhaku] [varchar](5) NULL,
	[Yhteisprofessuuri] [varchar](5) NULL,
	[Haun kansainvälisyys] [varchar](5) NULL,
	[Sukupuoli] [varchar](5) NULL,
	[Kansalaisuus] [varchar](5) NULL,
	[Ei-suomalaisen hakijan maanosa] [varchar](5) NULL,
	[Hakijoiden määrä per maanosa] [varchar](5) NULL,
	[Hakijoiden määrä yhteensä haussa] [varchar](5) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL
) ON [PRIMARY]
END
IF  EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo8b_rekrytointi_valitun_tiedot')
BEGIN
drop table [sa].[sa_suorat_yo8b_rekrytointi_valitun_tiedot]
END

IF NOT EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo8b_rekrytointi_valitun_tiedot')

BEGIN
CREATE TABLE [sa].[sa_suorat_yo8b_rekrytointi_valitun_tiedot](
	[Korkeakoulu] [varchar](5) NULL,
	[Tilastovuosi] [varchar](5) NULL,
	[Hakunumero] [varchar](100) NULL,
	[Sopimusnumero] [varchar](100) NULL,
	[Henkilönumero] [varchar](11) NULL,
	[Nimike] [varchar](5) NULL,
	[Tutkijanuraporras] [varchar](5) NULL,
	[Nimitystapa] [varchar](5) NULL,
	[Tohtorintutkinnon suoritusvuosi] [varchar](5) NULL,
	[Tohtorintutkinnon suoritusmaa] [varchar](5) NULL,
	[Tohtorintutkinnon yliopisto] [varchar](5) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL
) ON [PRIMARY]
END
IF  EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo8c_rekrytointi_valitun_taustatiedot')
BEGIN
drop table [sa].[sa_suorat_yo8c_rekrytointi_valitun_taustatiedot]
END

IF NOT EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo8c_rekrytointi_valitun_taustatiedot')

BEGIN
CREATE TABLE [sa].[sa_suorat_yo8c_rekrytointi_valitun_taustatiedot](
	[Vastaajatunnus] [nvarchar](max) NULL,
	[korkeakoulu_tunnus] [nvarchar](50) NULL,
	[Henkilönumero] [nvarchar](max) NULL,
	[Haun numero] [nvarchar](max) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[kysymysryhmä] [nvarchar](100) NULL,
	[Kysymys] [nvarchar](600) NULL,
	[Vastaus] [nvarchar](600) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
IF  EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot')
BEGIN
drop table [sa].[sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot]
END

IF NOT EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot')

BEGIN
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
END
;
