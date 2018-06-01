USE ANTERO

GO

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso1koodi')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso1koodi] [nvarchar](200) NULL
END

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso1nimi')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso1nimi] [nvarchar](200) NULL
END

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso1nimi_sv')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso1nimi_sv] [nvarchar](200) NULL
END


IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso1nimi_en')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso1nimi_en] [nvarchar](200) NULL
END
