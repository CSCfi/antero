-- change a set of column types based on one check
IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_opintopisteet'
  and COLUMN_NAME='kaikki_tutk_op_lkm' and IS_NULLABLE='NO'
) BEGIN
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN kaikki_tutk_op_lkm int NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN vierkielper_op_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN erillisilla_oik_op_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN erillisilla_oik_opkoul_op_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN joo_op_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN kv_vaihtoopiskelijat_op_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN erikoul_suor_op_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN ulkom_hyv_luetut_op_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN ulkom_harj_op_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN avoinop_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN avoinop_yliop_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN avoinop_amk_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN avoinop_kesa_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN avoinop_kansan_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN avoinop_kansal_lkm int  NULL
ALTER TABLE dw.f_yo_opintopisteet ALTER COLUMN avoinop_muut_lkm int  NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_opintopisteet'
  and COLUMN_NAME='kaikki_tutk_lkm' and IS_NULLABLE='NO'
) BEGIN
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN kaikki_tutk_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN tki_pisteet_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN tki_harj_pisteet_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN tki_muu_pisteet_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN vierkiel_pisteet_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN ulkom_hyv_op_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN ulkom_harj_op_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN avoinamk_op_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN avoinamk_op_amk_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN avoinamk_op_yliop_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN avoinamk_op_kesa_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN avoinamk_op_kansan_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN avoinamk_op_kansal_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN avoinamk_op_muut_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN kv_vaihtoopiskelijat_op_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN kk_yhteistyo_op_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN erilopintooik_op_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN mamu_op_lkm int NULL
ALTER TABLE dw.f_amk_opintopisteet ALTER COLUMN erikoul_suor_op_lkm int NULL
END
