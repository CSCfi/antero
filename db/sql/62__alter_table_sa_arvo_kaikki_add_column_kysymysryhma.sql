IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_kaikki'
  and COLUMN_NAME='kysymysryhma'
) BEGIN
ALTER TABLE sa.sa_arvo_kaikki ADD
  kysymysryhma nvarchar(max) NULL
END
