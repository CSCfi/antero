USE [ANTERO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--  create table sa_suorat_amk7a_rekrytointihaut
--

IF NOT EXISTS
(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_suorat_amk7a_rekrytointihaut')

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
		[FileId] [varchar](55) NULL,
		[FileRowNumber] [int] NULL,
		[CheckFileId] [varchar](30) NULL,
		[DUMMY_CHECKSUM] [int] NULL,
		[IMP_CREATED_DATE] [datetime] NULL,
		[IMP_UPDATED_DATE] [datetime] NULL,
		[IMP_CREATED_BY] [varchar](100) NULL
	) ON [PRIMARY]
	END
	GO

	--
	--  create table sa_suorat_amk7b_rekrytointi_valitun_tiedot
	--

	IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA='sa'
		AND TABLE_NAME='sa_suorat_amk7b_rekrytointi_valitun_tiedot')

		BEGIN

	CREATE TABLE [sa].[sa_suorat_amk7b_rekrytointi_valitun_tiedot](
		[Korkeakoulu] [varchar](5) NULL,
		[Tilastovuosi] [varchar](4) NULL,
		[Hakunumero] [varchar](100) NULL,
		[Sopimusnumero] [varchar](100) NULL,
		[Henkilötunnus] [varchar](11) NULL,
		[Nimike] [varchar](100) NULL,
		[Tehtäväryhmä] [varchar](5) NULL,
		[Nimitystapa] [varchar](5) NULL,
		[Tohtorintutkinnon suoritusvuosi] [varchar](4) NULL,
		[Tohtorintutkinnon suoritusmaa] [varchar](5) NULL,
		[Tohtorintutkinnon yliopisto] [varchar](5) NULL,
		[FileId] [varchar](55) NULL,
		[FileRowNumber] [int] NULL,
		[CheckFileId] [varchar](30) NULL,
		[DUMMY_CHECKSUM] [int] NULL,
		[IMP_CREATED_DATE] [datetime] NULL,
		[IMP_UPDATED_DATE] [datetime] NULL,
		[IMP_CREATED_BY] [varchar](100) NULL
	) ON [PRIMARY]
	END
	GO

	--
	--  create table sa_suorat_yo8a_rekrytointihaut
	--

	IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA='sa'
		AND TABLE_NAME='sa_suorat_yo8a_rekrytointihaut')

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
		[FileId] [varchar](55) NULL,
		[FileRowNumber] [int] NULL,
		[CheckFileId] [varchar](30) NULL,
		[DUMMY_CHECKSUM] [int] NULL,
		[IMP_CREATED_DATE] [datetime] NULL,
		[IMP_UPDATED_DATE] [datetime] NULL,
		[IMP_CREATED_BY] [varchar](100) NULL
	) ON [PRIMARY]
	END
	GO


	--
	--  create table sa_suorat_yo8b_rekrytointi_valitun_tiedot
	--

	IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA='sa'
		AND TABLE_NAME='sa_suorat_yo8b_rekrytointi_valitun_tiedot')

		BEGIN
	CREATE TABLE [sa].[sa_suorat_yo8b_rekrytointi_valitun_tiedot](
		[Korkeakoulu] [varchar](5) NULL,
		[Tilastovuosi] [varchar](5) NULL,
		[Hakunumero] [varchar](100) NULL,
		[Sopimusnumero] [varchar](100) NULL,
		[Henkilötunnus] [varchar](11) NULL,
		[Nimike] [varchar](5) NULL,
		[Tutkijanuraporras] [varchar](5) NULL,
		[Nimitystapa] [varchar](5) NULL,
		[Tohtorintutkinnon suoritusvuosi] [varchar](5) NULL,
		[Tohtorintutkinnon suoritusmaa] [varchar](5) NULL,
		[Tohtorintutkinnon yliopisto] [varchar](5) NULL,
		[FileId] [varchar](55) NULL,
		[FileRowNumber] [int] NULL,
		[CheckFileId] [varchar](30) NULL,
		[DUMMY_CHECKSUM] [int] NULL,
		[IMP_CREATED_DATE] [datetime] NULL,
		[IMP_UPDATED_DATE] [datetime] NULL,
		[IMP_CREATED_BY] [varchar](100) NULL
	) ON [PRIMARY]
	END
	GO
