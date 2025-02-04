USE ANTERO
GO

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'dw' AND TABLE_NAME = 'd_organisaation_alayksikot' AND COLUMN_NAME = 'tiedejatutkimusfi_nakyvyyden_rajaus')
BEGIN
     ALTER TABLE [ANTERO].[dw].[d_organisaation_alayksikot] ADD [tiedejatutkimusfi_nakyvyyden_rajaus] [NVARCHAR](1) NULL
END
