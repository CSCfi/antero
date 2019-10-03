
IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_toimipiste'
  and COLUMN_NAME='toiminta_tutkintoon_johtava_koulutus'
) BEGIN
  ALTER TABLE dw.d_yo_toimipiste DROP COLUMN toiminta_tutkintoon_johtava_koulutus
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_toimipiste'
  and COLUMN_NAME='toiminta_tutkimustoiminta'
) BEGIN
  ALTER TABLE dw.d_yo_toimipiste DROP COLUMN toiminta_tutkimustoiminta
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_toimipiste'
  and COLUMN_NAME='toiminta_muu'
) BEGIN
  ALTER TABLE dw.d_yo_toimipiste DROP COLUMN toiminta_muu
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_toimipiste'
  and COLUMN_NAME='d_toiminta_tutkintoon_johtava_koulutus_id'
) BEGIN
  ALTER TABLE dw.d_yo_toimipiste ADD d_toiminta_tutkintoon_johtava_koulutus_id int NULL
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_toimipiste'
  and COLUMN_NAME='d_toiminta_tutkimustoiminta_id'
) BEGIN
  ALTER TABLE dw.d_yo_toimipiste ADD d_toiminta_tutkimustoiminta_id int NULL
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_toimipiste'
  and COLUMN_NAME='d_toiminta_muu_id'
) BEGIN
  ALTER TABLE dw.d_yo_toimipiste ADD d_toiminta_muu_id int NULL
END
