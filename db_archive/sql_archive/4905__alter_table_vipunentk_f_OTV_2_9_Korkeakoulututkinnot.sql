use VipunenTK
go

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'f_OTV_2_9_Korkeakoulututkinnot' AND COLUMN_NAME = 'patevyyteen_tahtaavat_opinnot_id'
)
BEGIN
  ALTER TABLE f_OTV_2_9_Korkeakoulututkinnot ADD patevyyteen_tahtaavat_opinnot_id int NULL
END