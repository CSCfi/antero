IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_kaikki'
  and COLUMN_NAME='kysymysryhmajarjestys'
) BEGIN
ALTER TABLE sa.sa_arvo_kaikki ADD
  kysymysryhmajarjestys int NULL,
  kysymysjarjestys int NULL
END
