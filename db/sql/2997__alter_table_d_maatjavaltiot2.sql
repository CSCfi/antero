USE ANTERO
GO

IF NOT EXISTS (
SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'd_maatjavaltiot2' AND COLUMN_NAME = 'maanosa4_koodi')
BEGIN
    ALTER TABLE [dw].[d_maatjavaltiot2] ADD maanosa4_koodi nvarchar(3)
END

IF NOT EXISTS (
SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'd_maatjavaltiot2' AND COLUMN_NAME = 'maanosa4_en')
BEGIN
    ALTER TABLE [dw].[d_maatjavaltiot2] ADD maanosa4_en nvarchar(200)
END

IF NOT EXISTS (
SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'd_maatjavaltiot2' AND COLUMN_NAME = 'maanosa4_fi')
BEGIN
    ALTER TABLE [dw].[d_maatjavaltiot2] ADD maanosa4_fi nvarchar(200)
END

IF NOT EXISTS (
SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'd_maatjavaltiot2' AND COLUMN_NAME = 'maanosa4_sv')
BEGIN
    ALTER TABLE [dw].[d_maatjavaltiot2] ADD maanosa4_sv nvarchar(200)
END

IF NOT EXISTS (
SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'd_maatjavaltiot2' AND COLUMN_NAME = 'jarjestys_maanosa4_koodi')
BEGIN
    ALTER TABLE [dw].[d_maatjavaltiot2] ADD jarjestys_maanosa4_koodi nvarchar(5)
END