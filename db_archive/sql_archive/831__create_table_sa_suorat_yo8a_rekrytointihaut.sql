--
--  create table sa_suorat_yo8a_rekrytointihaut

IF NOT EXISTS
(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_suorat_yo8b_rekrytointihaut')

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



	/* revert
	drop table sa.sa_suorat_yo8a_rekrytointihaut
	--*/
