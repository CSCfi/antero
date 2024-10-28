USE ANTERO

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot' AND COLUMN_NAME = 'yhdistynyt_hlostokeruuseen' AND TABLE_SCHEMA = 'sa'
	)
BEGIN
    ALTER TABLE sa.sa_suorat_yo8d_rekrytointi_valitun_kaikki_tiedot ADD  yhdistynyt_hlostokeruuseen int
END


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot' AND COLUMN_NAME = 'yhdistynyt_hlostokeruuseen' AND TABLE_SCHEMA = 'sa'
	)
BEGIN
    ALTER TABLE sa.sa_suorat_amk7d_rekrytointi_valitun_kaikki_tiedot ADD  yhdistynyt_hlostokeruuseen int
END

USE ANTERO
