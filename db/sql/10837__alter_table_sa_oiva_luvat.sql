USE ANTERO
GO
IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_oiva_luvat' AND COLUMN_NAME = 'oppilaitostyyppi' AND TABLE_SCHEMA = 'sa'
  )
BEGIN
      ALTER TABLE [sa].[sa_oiva_luvat] ADD	[oppilaitostyyppi] [INT] NULL
END
GO
