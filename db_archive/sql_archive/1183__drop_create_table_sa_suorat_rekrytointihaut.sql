USE ANTERO
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
	[Korkeakoulu] [nvarchar](5) NULL,
	[Tilastovuosi] [nvarchar](4) NULL,
	[Hakunumero] [nvarchar](100) NULL,
	[Haun kansainvälisyys] [nvarchar](5) NULL,
	[Sukupuoli] [nvarchar](5) NULL,
	[Kansalaisuus] [nvarchar](5) NULL,
	[Ei-suomalaisen hakijan maanosa] [nvarchar](5) NULL,
	[Hakijoiden määrä] [nvarchar](100) NULL,
	[Hakijoiden määrä yhteensä haussa] [nvarchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [nvarchar](100) NULL
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
	[Korkeakoulu] [nvarchar](5) NULL,
	[Tilastovuosi] [nvarchar](4) NULL,
	[Hakunumero] [nvarchar](100) NULL,
	[Kutsuhaku] [nvarchar](5) NULL,
	[Yhteisprofessuuri] [nvarchar](5) NULL,
	[Haun kansainvälisyys] [nvarchar](5) NULL,
	[Sukupuoli] [nvarchar](5) NULL,
	[Kansalaisuus] [nvarchar](5) NULL,
	[Ei-suomalaisen hakijan maanosa] [nvarchar](5) NULL,
	[Hakijoiden määrä] [nvarchar](100) NULL,
	[Hakijoiden määrä yhteensä haussa] [nvarchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [nvarchar](100) NULL
) ON [PRIMARY]
END
