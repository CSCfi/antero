USE ANTERO

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut' AND COLUMN_NAME = 'VII Koulutusala')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut] ADD 	[VII Koulutusala] [nvarchar](50) NULL
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut' AND COLUMN_NAME = 'VIII Koulutusala')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut] ADD 	[VIII Koulutusala] [nvarchar](50) NULL
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut' AND COLUMN_NAME = 'IX Koulutusala')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut] ADD 	[IX Koulutusala] [nvarchar](50) NULL
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut' AND COLUMN_NAME = 'X Koulutusala')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut] ADD 	[X Koulutusala] [nvarchar](50) NULL
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut' AND COLUMN_NAME = 'XI Koulutusala')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut] ADD 	[XI Koulutusala] [nvarchar](50) NULL
END
IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut' AND COLUMN_NAME = 'XII Koulutusala')
BEGIN
  ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut] ADD 	[XII Koulutusala] [nvarchar](50) NULL
END
------------------


IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut_keksintoilmoitukset' AND COLUMN_NAME = 'VII Koulutusala')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut_keksintoilmoitukset] ADD 	[VII Koulutusala] [varchar](4000) NULL
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut_keksintoilmoitukset' AND COLUMN_NAME = 'VIII Koulutusala')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut_keksintoilmoitukset] ADD 	[VIII Koulutusala] [varchar](4000) NULL
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut_keksintoilmoitukset' AND COLUMN_NAME = 'IX Koulutusala')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut_keksintoilmoitukset] ADD 	[IX Koulutusala] [varchar](4000) NULL
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut_keksintoilmoitukset' AND COLUMN_NAME = 'X Koulutusala')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut_keksintoilmoitukset] ADD 	[X Koulutusala] [varchar](4000) NULL
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut_keksintoilmoitukset' AND COLUMN_NAME = 'XI Koulutusala')
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut_keksintoilmoitukset] ADD 	[XI Koulutusala] [varchar](4000) NULL
END
IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_suorat_yo3b_julkaisut_keksintoilmoitukset' AND COLUMN_NAME = 'XII Koulutusala')
BEGIN
  ALTER TABLE [sa].[sa_suorat_yo3b_julkaisut_keksintoilmoitukset] ADD 	[XII Koulutusala] [varchar](4000) NULL
END
