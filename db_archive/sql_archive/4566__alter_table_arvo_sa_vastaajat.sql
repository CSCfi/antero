USE ARVO_SA

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_taustatiedot'
  AND COLUMN_NAME ='koulutustoimija')
BEGIN
	ALTER TABLE [sa].[sa_virta_taustatiedot] ADD [koulutustoimija] varchar(100) null
END

GO

USE ANTERO
