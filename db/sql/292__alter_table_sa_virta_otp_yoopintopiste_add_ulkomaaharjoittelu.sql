IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_yoopintopiste'
  and COLUMN_NAME='ulkomaaHarjoittelu'
) BEGIN

ALTER TABLE sa.sa_virta_otp_yoopintopiste ADD ulkomaaHarjoittelu float NULL

END
