USE ANTERO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'  
AND COLUMN_NAME ='AVUSTUSTUOTOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [AVUSTUSTUOTOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='LIIKTUOTOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [LIIKTUOTOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='OSUUSTULOS')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [OSUUSTULOS] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='ULKLIIKTOIM')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [ULKLIIKTOIM] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KVARVONMUUTOS')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [KVARVONMUUTOS] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='VARSSIJTUOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [VARSSIJTUOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='MUUTKORKORAHTUOTOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [MUUTKORKORAHTUOTOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='ARVONALENTUMISETPAL')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [ARVONALENTUMISETPAL] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='RAHOITUSTUOTOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [RAHOITUSTUOTOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='SIDOTUT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [SIDOTUT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='SIIRTOSIDOTUSTA')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [SIIRTOSIDOTUSTA] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='SIIRTOSIDOTTUUN')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [SIIRTOSIDOTTUUN] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='OMAKATTEISET')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [OMAKATTEISET] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='SIIRTORAHASTOSTA')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [SIIRTORAHASTOSTA] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='SIIRTORAHASTOON')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [SIIRTORAHASTOON] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='VAHEMMISTOOSUUDET')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [VAHEMMISTOOSUUDET] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KORKVARSTOIMALV')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [KORKVARSTOIMALV] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='OKMKOMPENS')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [OKMKOMPENS] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='HARJOITTELUKOULUJENVM')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [HARJOITTELUKOULUJENVM] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='MUURAHKOMP')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [MUURAHKOMP] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='VMRAHHARJKOULU')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [VMRAHHARJKOULU] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='OKMRAHHARJKOULU')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [OKMRAHHARJKOULU] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='HARJKOULUKULUYHT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [HARJKOULUKULUYHT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KONELAITE')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [KONELAITE] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KERLAHJKOTITAL')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [KERLAHJKOTITAL] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KERLAHJYRI')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [KERLAHJYRI] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KERLAHJMUUT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [KERLAHJMUUT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='VARAINHANKINTA')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [VARAINHANKINTA] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='MUUVARAINHANKINTA')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [MUUVARAINHANKINTA] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KERLAHJKULU')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [KERLAHJKULU] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='VARAINHANKINTAKUL')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [VARAINHANKINTAKUL] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='MUUTVARAINHANKINTAKUL')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [MUUTVARAINHANKINTAKUL] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='VARAINHANKINTATUOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [VARAINHANKINTATUOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='OSINKOTUOTOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [OSINKOTUOTOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KORKOTUOTOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [KORKOTUOTOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='MYYNTITUOTOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [MYYNTITUOTOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='VUOKRATUOTOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [VUOKRATUOTOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='MUUTTUOTOT_3')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [MUUTTUOTOT_3] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KORKOKULUT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [KORKOKULUT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='VUOKRAKULUT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [VUOKRAKULUT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='MYYNTITAPPIOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [MYYNTITAPPIOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='LUKUKAUSIMAKSUT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [LUKUKAUSIMAKSUT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='PYSYVAISLUONTOINEN')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [PYSYVAISLUONTOINEN] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='MUUTMUUTTUOT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [MUUTMUUTTUOT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='KULUTYHT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [KULUTYHT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='MUUTKULUTYHT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [MUUTKULUTYHT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='TILAKUSTANNUKSET')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [TILAKUSTANNUKSET] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='MUUTVHKULUT')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [MUUTVHKULUT] bigint  NULL
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk_talous_1_tuloslaskelma'
AND COLUMN_NAME ='Emo_konserni')
BEGIN
	ALTER TABLE [sa].[sa_suorat_amk_talous_1_tuloslaskelma]  ADD [Emo_konserni] varchar (255) NULL
END