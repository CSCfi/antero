--
--  create table sa_suorat_yo8c_rekrytointi_valitun_taustatiedot
--

IF NOT EXISTS
(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_suorat_yo8c_rekrytointi_valitun_taustatiedot')

	BEGIN


	CREATE TABLE [sa].[sa_suorat_yo8c_rekrytointi_valitun_taustatiedot](
		[Vastaajatunnus] [nvarchar](max) NULL,
		[Henkilönumero] [nvarchar](max) NULL,
		[Haun numero] [nvarchar](max) NULL,
		[Nykyisessä yliopistossa / ammattikorkeakoulussa:] [nvarchar](max) NULL,
		[Muussa yliopistossa Suomessa:] [nvarchar](max) NULL,
		[Muussa ammattikorkeakoulussa Suomessa:] [nvarchar](max) NULL,
		[Tutkimuslaitoksessa Suomessa:] [nvarchar](max) NULL,
		[Ulkomaisessa korkeakoulussa / tutkimuslaitoksessa:] [nvarchar](max) NULL,
		[Vähintään yhdessä muussa oppilaitoksessa (ei korkeakoulu) Suomessa tai ulkomailla:] [nvarchar](max) NULL,
		[Yrityksessä (yrityksen toimipaikka sijainnut Suomessa):] [nvarchar](max) NULL,
		[Yrityksessä (yrityksen toimipaikka sijainnut ulkomailla):] [nvarchar](max) NULL,
		[Julkinen hallinto (valtio, kunnat (ml. yliopistolliset keskussairaalat), Kela, yms.)  Suomessa tai ulkomailla:] [nvarchar](max) NULL,
		[Muussa organisaatiossa (järjestöt jne.) (organisaation toimipaikka sijainnut Suomessa):] [nvarchar](max) NULL,
		[Muussa organisaatiossa (järjestöt jne.) (organisaation toimipaikka sijainnut ulkomailla):] [nvarchar](max) NULL,
		[Mikä seuraavista oli viimeisin työpaikkasi?] [nvarchar](max) NULL,
		[FileId] [nvarchar](55) NULL,
		[FileRowNumber] [int] NOT NULL,
		[CheckFileId] [varchar](30) NULL,
		[DUMMY_CHECKSUM] [int] NULL,
		[IMP_CREATED_DATE] [datetime] NULL,
		[IMP_UPDATED_DATE] [datetime] NULL,
		[IMP_CREATED_BY] [varchar](100) NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
  END

	/* revert
	drop table sa.koulutustarjonta_koulutus
	--*/
