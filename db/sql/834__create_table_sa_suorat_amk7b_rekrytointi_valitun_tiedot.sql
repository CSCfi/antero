--
--  create table s
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
		[Henkilönumero] [varchar](11) NULL,
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

	/* revert
	drop table sa.sa_suorat_amk7b_rekrytointi_valitun_tiedot
	--*/
