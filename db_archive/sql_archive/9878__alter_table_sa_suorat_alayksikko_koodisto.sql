USE ANTERO
GO

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_amk8a_alayksikkokoodisto' AND COLUMN_NAME = 'nakyvyys_rajoitettu')
BEGIN
     ALTER TABLE [ANTERO].[sa].[sa_suorat_amk8a_alayksikkokoodisto] ADD [nakyvyys_rajoitettu] [NVARCHAR](1) NULL
END

GO

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo9a_alayksikkokoodisto' AND COLUMN_NAME = 'nakyvyys_rajoitettu')
BEGIN
  ALTER TABLE [ANTERO].[sa].[sa_suorat_yo9a_alayksikkokoodisto] ADD [nakyvyys_rajoitettu] [NVARCHAR](1) NULL
END
