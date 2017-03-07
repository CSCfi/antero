IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_hist_yo2_opintopisteet'
  and COLUMN_NAME='LATAUSAIKA'
) BEGIN
ALTER TABLE sa.sa_suorat_hist_yo2_opintopisteet ADD LATAUSAIKA DATETIME null
END