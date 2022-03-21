USE ANTERO

ALTER TABLE [sa].[sa_oiva_luvat] ALTER COLUMN [_source_id] varchar(255) null

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_luvat'
  AND COLUMN_NAME ='edellinen_lupa_id')
BEGIN
	ALTER TABLE [sa].[sa_oiva_luvat] ADD [edellinen_lupa_id] varchar(40) null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_luvat'
  AND COLUMN_NAME ='lupatila_id')
BEGIN
	ALTER TABLE [sa].[sa_oiva_luvat] ADD [lupatila_id] varchar(40) null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_luvat'
  AND COLUMN_NAME ='asiatyyppi_id')
BEGIN
	ALTER TABLE [sa].[sa_oiva_luvat] ADD [asiatyyppi_id] varchar(40) null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_luvat'
  AND COLUMN_NAME ='loppupvm')
BEGIN
	ALTER TABLE [sa].[sa_oiva_luvat] ADD [loppupvm] datetime null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_luvat'
  AND COLUMN_NAME ='kirje')
BEGIN
	ALTER TABLE [sa].[sa_oiva_luvat] ADD [kirje] nvarchar(4000) null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_luvat'
  AND COLUMN_NAME ='luoja')
BEGIN
	ALTER TABLE [sa].[sa_oiva_luvat] ADD [luoja] nvarchar(255) null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_luvat'
  AND COLUMN_NAME ='luontipvm')
BEGIN
	ALTER TABLE [sa].[sa_oiva_luvat] ADD [luontipvm] datetime null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_luvat'
  AND COLUMN_NAME ='paivittaja')
BEGIN
	ALTER TABLE [sa].[sa_oiva_luvat] ADD [paivittaja] nvarchar(255) null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_luvat'
  AND COLUMN_NAME ='paivityspvm')
BEGIN
	ALTER TABLE [sa].[sa_oiva_luvat] ADD [paivityspvm] datetime null
END
