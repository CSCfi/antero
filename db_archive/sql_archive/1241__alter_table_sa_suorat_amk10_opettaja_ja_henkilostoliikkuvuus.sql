-- liikkuvuusohjelma-sarakkeen pituuden lisäys

IF  EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_suorat_amk10_opettaja_ja_henkilostoliikkuvuus' AND COLUMN_NAME='liikkuvuusohjelma')

BEGIN
	ALTER TABLE [sa].[sa_suorat_amk10_opettaja_ja_henkilostoliikkuvuus]
	ALTER COLUMN	[liikkuvuusohjelma] [varchar](3)
END
