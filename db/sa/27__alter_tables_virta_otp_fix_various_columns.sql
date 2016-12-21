IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_amk7opiskelijat'
  and COLUMN_NAME='opiskeluoikeudenAlku' and DATA_TYPE='varchar'
) BEGIN
ALTER TABLE dbo.sa_virta_otp_amk7opiskelijat ALTER COLUMN opiskeluOikeudenAlku bigint
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_amk7opiskelijat'
  and COLUMN_NAME='opiskeluOikeudenPaattymispvm' and DATA_TYPE='varchar'
) BEGIN
ALTER TABLE dbo.sa_virta_otp_amk7opiskelijat ALTER COLUMN opiskeluOikeudenPaattymispvm bigint
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_amkavoimenopintopisteetjarj'
  and COLUMN_NAME='oppilaitostyyppi'
  and DATA_TYPE='varchar' and CHARACTER_MAXIMUM_LENGTH='2'
) BEGIN
ALTER TABLE dbo.sa_virta_otp_amkavoimenopintopisteetjarj ALTER COLUMN oppilaitostyyppi varchar(100)
END
