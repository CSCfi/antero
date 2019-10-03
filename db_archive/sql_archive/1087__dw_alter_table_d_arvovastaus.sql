USE [ANTERO]
GO
IF  EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_arvovastaus')
BEGIN

  ALTER TABLE dw.d_arvovastaus ALTER COLUMN vastaus_sv nvarchar(500);
  ALTER TABLE dw.d_arvovastaus ALTER COLUMN vastaus_en nvarchar(500);
END
