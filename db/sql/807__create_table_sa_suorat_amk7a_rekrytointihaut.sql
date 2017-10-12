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
	;
	--
	--  create table sa_suorat_amk7b_rekrytointi_valitun_tiedot
	--
