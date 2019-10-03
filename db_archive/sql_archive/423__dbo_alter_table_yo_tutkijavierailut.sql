IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo7_opettaja_ja_tutkijavierailut'
  and COLUMN_NAME='VIERAILUT_ULKOMAILLE_LKM'
) BEGIN
ALTER TABLE sa.sa_suorat_yo7_opettaja_ja_tutkijavierailut alter column VIERAILUT_ULKOMAILLE_LKM decimal(16,2)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo7_opettaja_ja_tutkijavierailut'
  and COLUMN_NAME='VIERAILUT_ULKOMAILTA_LKM'
) BEGIN
ALTER TABLE sa.sa_suorat_yo7_opettaja_ja_tutkijavierailut alter column VIERAILUT_ULKOMAILTA_LKM decimal(16,2)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='sa_suorat_yo7_opettaja_ja_tutkijavierailut'
  and COLUMN_NAME='vierailut_ulkomaille_lkm'
) BEGIN
ALTER TABLE dw.f_yo_opettaja_ja_tutkijavierailut alter column vierailut_ulkomaille_lkm decimal(16,2)
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='sa_suorat_yo7_opettaja_ja_tutkijavierailut'
  and COLUMN_NAME='vierailut_ulkomailta_lkm'
) BEGIN
ALTER TABLE dw.f_yo_opettaja_ja_tutkijavierailut alter column vierailut_ulkomailta_lkm decimal(16,2)
END
