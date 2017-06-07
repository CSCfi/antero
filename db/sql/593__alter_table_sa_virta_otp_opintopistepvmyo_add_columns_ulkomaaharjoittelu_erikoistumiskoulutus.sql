
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_opintopistepvmyo'
  and COLUMN_NAME='ulkomaaharjoittelu'
) BEGIN
ALTER TABLE sa.sa_virta_otp_opintopistepvmyo ADD
  ulkomaaharjoittelu int NULL  
END


IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_opintopistepvmyo'
  and COLUMN_NAME='erikoistumiskoulutus'
) BEGIN
ALTER TABLE sa.sa_virta_otp_opintopistepvmyo ADD  
  erikoistumiskoulutus int NULL
END
