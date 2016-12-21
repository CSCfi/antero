IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_arvo_kaikki'
  and COLUMN_NAME='kyselypohjajarjestys'
) BEGIN
ALTER TABLE dbo.sa_arvo_kaikki ADD
  kyselypohja_fi nvarchar(max) NULL,
  kyselypohja_sv nvarchar(max) NULL,
  kyselypohja_en nvarchar(max) NULL,
  kyselypohjajarjestys int NULL
END
