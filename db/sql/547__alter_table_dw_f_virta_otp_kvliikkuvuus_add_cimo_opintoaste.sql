IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_otp_kvliikkuvuus'
  and COLUMN_NAME='d_opiskeluoikeudentyyppi_id'
) BEGIN
  ALTER TABLE dw.f_virta_otp_kvliikkuvuus DROP COLUMN d_opiskeluoikeudentyyppi_id
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_otp_kvliikkuvuus'
  and COLUMN_NAME='cimo_opintoaste'
) BEGIN
  ALTER TABLE dw.f_virta_otp_kvliikkuvuus ADD cimo_opintoaste varchar(2) NULL
END
/* revert
ALTER TABLE dw.f_virta_otp_kvliikkuvuus ADD d_opiskeluoikeudentyyppi_id int NOT NULL

ALTER TABLE dw.f_virta_otp_kvliikkuvuus DROP COLUMN cimo_opintoaste
--*/
