IF EXISTS (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_amk7opiskelijat' and COLUMN_NAME='opiskeluoikeudenAlku' and DATA_TYPE='date') BEGIN

ALTER TABLE dbo.sa_virta_otp_amk7opiskelijat ALTER COLUMN opiskeluOikeudenAlku varchar(30)

END

IF EXISTS (select * from INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_amk7opiskelijat' and COLUMN_NAME='opiskeluOikeudenPaattymispvm' and DATA_TYPE='date') BEGIN

ALTER TABLE dbo.sa_virta_otp_amk7opiskelijat ALTER COLUMN opiskeluOikeudenPaattymispvm varchar(30)

END
