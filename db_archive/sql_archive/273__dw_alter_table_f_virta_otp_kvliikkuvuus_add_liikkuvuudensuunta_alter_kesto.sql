IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_otp_kvliikkuvuus'
  and COLUMN_NAME='d_liikkuvuudensuunta_id'
) BEGIN

ALTER TABLE dw.f_virta_otp_kvliikkuvuus ADD d_liikkuvuudensuunta_id int NULL

exec('UPDATE dw.f_virta_otp_kvliikkuvuus SET d_liikkuvuudensuunta_id=-1')

ALTER TABLE dw.f_virta_otp_kvliikkuvuus ALTER COLUMN d_liikkuvuudensuunta_id int NOT NULL

END


IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_otp_kvliikkuvuus'
  and COLUMN_NAME='kesto' and DATA_TYPE='varchar'
) BEGIN

UPDATE dw.f_virta_otp_kvliikkuvuus SET kesto=NULL WHERE ISNUMERIC(kesto)<>1

ALTER TABLE dw.f_virta_otp_kvliikkuvuus ALTER COLUMN kesto int NULL

END
