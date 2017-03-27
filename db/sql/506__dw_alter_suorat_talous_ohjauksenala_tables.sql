IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_4_tutkimusmenot'
  and COLUMN_NAME='ohjauksenala_koodi'
) BEGIN

ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ADD ohjauksenala_koodi int NULL;
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ADD ohjauksenala varchar(255) NULL, ohjauksenala_koodi int NULL;

END