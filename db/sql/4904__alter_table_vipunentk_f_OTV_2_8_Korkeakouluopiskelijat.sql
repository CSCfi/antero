use VipunenTK
go

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'f_OTV_2_8_Korkeakouluopiskelijat' AND COLUMN_NAME = 'patevyyteen_tahtaavat_opinnot_id'
)
BEGIN
  ALTER TABLE f_OTV_2_8_Korkeakouluopiskelijat ADD patevyyteen_tahtaavat_opinnot_id int NULL
END