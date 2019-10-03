
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_opintopistepvmamk'
  and COLUMN_NAME='ulkomaaharjoittelu'
) BEGIN
ALTER TABLE sa.sa_virta_otp_opintopistepvmamk ADD
  ulkomaaharjoittelu int NULL   
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_opintopistepvmamk'
  and COLUMN_NAME='erikoistumiskoulutus'
) BEGIN
ALTER TABLE sa.sa_virta_otp_opintopistepvmamk ADD
    erikoistumiskoulutus int NULL
END


