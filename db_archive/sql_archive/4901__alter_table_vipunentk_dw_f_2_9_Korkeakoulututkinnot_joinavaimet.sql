use VipunenTK_DW
go

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'f_2_9_Korkeakoulututkinnot_joinavaimet' AND COLUMN_NAME = 'ltop'
)
BEGIN
  ALTER TABLE f_2_9_Korkeakoulututkinnot_joinavaimet ADD ltop nvarchar(1) NULL
END