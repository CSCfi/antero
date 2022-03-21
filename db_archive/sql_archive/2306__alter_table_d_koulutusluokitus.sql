USE ANTERO
GO
IF NOT EXISTS(
  SELECT *
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    TABLE_NAME = 'd_koulutusluokitus'
    AND COLUMN_NAME = 'uusi_eat_koodi')
BEGIN
  ALTER TABLE dw.d_koulutusluokitus
    ADD [uusi_eat_koodi] varchar(6) NULL
END;