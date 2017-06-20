
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='julkaisunTunnus'
) BEGIN
ALTER TABLE dw.f_virta_jtp_tilasto ADD
  julkaisunTunnus [varchar](50) NULL
END


