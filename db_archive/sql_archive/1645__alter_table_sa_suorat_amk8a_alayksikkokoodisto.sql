USE ANTERO

GO

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_suorat_amk8a_alayksikkokoodisto' AND COLUMN_NAME = 'Alayksikon_nimi_sv')
BEGIN
ALTER table [sa].[sa_suorat_amk8a_alayksikkokoodisto] ADD  Alayksikon_nimi_sv nvarchar(150);
END

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_suorat_amk8a_alayksikkokoodisto' AND COLUMN_NAME = 'Alayksikon_nimi_en')
BEGIN
ALTER table [sa].[sa_suorat_amk8a_alayksikkokoodisto] ADD  Alayksikon_nimi_en nvarchar(150)
END
