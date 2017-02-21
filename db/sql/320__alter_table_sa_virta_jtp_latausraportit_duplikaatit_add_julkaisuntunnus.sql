IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_latausraportit_duplikaatit'
  and COLUMN_NAME='julkaisuntunnus'
) BEGIN
ALTER TABLE sa.sa_virta_jtp_latausraportit_duplikaatit ADD
  julkaisuntunnus nvarchar(MAX) NULL
END