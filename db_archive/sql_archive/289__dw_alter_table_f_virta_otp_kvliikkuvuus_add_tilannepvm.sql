IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_otp_kvliikkuvuus'
  and COLUMN_NAME='tilannepvm'
) BEGIN

ALTER TABLE dw.f_virta_otp_kvliikkuvuus ADD tilannepvm date NULL

END
