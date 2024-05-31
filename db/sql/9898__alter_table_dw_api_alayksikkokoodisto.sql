USE AnteroAPI
GO

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'dw' AND TABLE_NAME = 'api_alayksikkokoodisto' AND COLUMN_NAME = 'tiedejatutkimusfi_nakyvyyden_rajaus')
BEGIN
     ALTER TABLE [ANTERO].[dw].[api_alayksikkokoodisto] ADD [tiedejatutkimusfi_nakyvyyden_rajaus] [NVARCHAR](1) NULL
END

USE Antero
