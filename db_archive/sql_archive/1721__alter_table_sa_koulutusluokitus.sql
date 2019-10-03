USE [ANTERO]

GO

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso2koodi')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso2koodi] [nvarchar](200) NULL
END

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso2nimi')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso2nimi] [nvarchar](200) NULL
END

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso2nimi_sv')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso2nimi_sv] [nvarchar](200) NULL
END


IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso2nimi_en')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso2nimi_en] [nvarchar](200) NULL
END
USE ANTERO

GO

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso3koodi')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso3koodi] [nvarchar](200) NULL
END

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso3nimi')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso3nimi] [nvarchar](200) NULL
END

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso3nimi_sv')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso3nimi_sv] [nvarchar](200) NULL
END


IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusalataso3nimi_en')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusalataso3nimi_en] [nvarchar](200) NULL
END
USE ANTERO

GO

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusastetaso1koodi')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusastetaso1koodi] [nvarchar](200) NULL
END

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusastetaso1nimi')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusastetaso1nimi] [nvarchar](200) NULL
END

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusastetaso1nimi_sv')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusastetaso1nimi_sv] [nvarchar](200) NULL
END


IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_koulutusluokitus' AND COLUMN_NAME = 'koulutusluokitus2016koulutusastetaso1nimi_en')
BEGIN
 ALTER TABLE [ANTERO].[sa].[sa_koulutusluokitus] ADD [koulutusluokitus2016koulutusastetaso1nimi_en] [nvarchar](200) NULL
END
