IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_kaikki'
  and COLUMN_NAME='kyselypohjajarjestys'
) BEGIN
ALTER TABLE sa.sa_arvo_kaikki DROP COLUMN
  kyselypohja_fi,
  kyselypohja_sv,
  kyselypohja_en,
  kyselypohjajarjestys
END
