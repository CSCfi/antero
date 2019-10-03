IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_1_tuloslaskelma'
  and COLUMN_NAME='AKATEMIA'
) BEGIN
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma DROP COLUMN AKATEMIA;
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ADD AKATEMIA BIGINT;
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo_talous_1_tuloslaskelma'
  and COLUMN_NAME='YRITLAHJ'
) BEGIN
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma DROP COLUMN YRITLAHJ;
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ADD YRITLAHJ BIGINT;
END
