
USE [ANTERO]
;
IF  EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot' AND COLUMN_NAME='Henkilön suorittaman merkittävin tutkinto')

BEGIN
ALTER TABLE sa.sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot DROP  COLUMN [Henkilön suorittaman merkittävin tutkinto]
END
;
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot' AND COLUMN_NAME='Henkilön suorittama merkittävin tutkinto')

BEGIN
ALTER TABLE sa.sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot ADD [Henkilön suorittama merkittävin tutkinto] [NVARCHAR] (10) NULL
END
;
