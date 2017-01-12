IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_jtp_latausraportit_tilanne'
  and COLUMN_NAME='luontiPaivamaara'
  and DATA_TYPE='date'
) BEGIN
ALTER TABLE dbo.sa_virta_jtp_latausraportit_tilanne ALTER COLUMN luontiPaivamaara varchar(50) null
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_jtp_latausraportit_tilanne'
  and COLUMN_NAME='paivitysPaivamaara'
  and DATA_TYPE='date'
) BEGIN
ALTER TABLE dbo.sa_virta_jtp_latausraportit_tilanne ALTER COLUMN paivitysPaivamaara varchar(50) null
END
