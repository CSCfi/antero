IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='d_avopkysymys_id'
) BEGIN
  ALTER TABLE dbo.f_avop_tilasto ADD d_avopkysymys_id int NULL -- NB! could have "NOT NULL DEFAULT -1" but that generates constraint, skipping
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='kysymysryhma_fi'
) BEGIN
  ALTER TABLE dbo.f_avop_tilasto DROP COLUMN kysymysryhma_fi
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='kysymysryhma_sv'
) BEGIN
  ALTER TABLE dbo.f_avop_tilasto DROP COLUMN kysymysryhma_sv
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='kysymysryhma_en'
) BEGIN
  ALTER TABLE dbo.f_avop_tilasto DROP COLUMN kysymysryhma_en
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='kysymys_fi'
) BEGIN
  ALTER TABLE dbo.f_avop_tilasto DROP COLUMN kysymys_fi
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='kysymys_sv'
) BEGIN
  ALTER TABLE dbo.f_avop_tilasto DROP COLUMN kysymys_sv
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='kysymys_en'
) BEGIN
  ALTER TABLE dbo.f_avop_tilasto DROP COLUMN kysymys_en
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='rahoitusmallikysymys'
) BEGIN
  ALTER TABLE dbo.f_avop_tilasto DROP COLUMN rahoitusmallikysymys
END
