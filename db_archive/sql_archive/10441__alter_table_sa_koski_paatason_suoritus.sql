USE Koski_SA

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_koski_paatason_suoritus' AND COLUMN_NAME = 'koulutusmoduuli_pakollinen' AND TABLE_SCHEMA = 'sa'
	)
BEGIN
    ALTER TABLE sa.sa_koski_paatason_suoritus ADD  koulutusmoduuli_pakollinen bit
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_koski_paatason_suoritus' AND COLUMN_NAME = 'koulutusmoduuli_kieli' AND TABLE_SCHEMA = 'sa'
	)
BEGIN
    ALTER TABLE sa.sa_koski_paatason_suoritus ADD  koulutusmoduuli_kieli varchar(10)
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_koski_paatason_suoritus' AND COLUMN_NAME = 'luokkaaste_koodiarvo' AND TABLE_SCHEMA = 'sa'
	)
BEGIN
    ALTER TABLE sa.sa_koski_paatason_suoritus ADD  luokkaaste_koodiarvo varchar(2)
END
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_koski_paatason_suoritus' AND COLUMN_NAME = 'jaa_luokalle' AND TABLE_SCHEMA = 'sa'
	)
BEGIN
    ALTER TABLE sa.sa_koski_paatason_suoritus ADD  jaa_luokalle bit
END

USE ANTERO
