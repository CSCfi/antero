IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_latausraportit_virheet'
  and COLUMN_NAME='ilmoitusVuosi'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_latausraportit_virheet ADD ilmoitusVuosi int null
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_latausraportit_virheet'
  and COLUMN_NAME='julkaisuVuosi'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_latausraportit_virheet ADD julkaisuVuosi int null
END
