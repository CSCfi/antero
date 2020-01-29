USE ANTERO

ALTER TABLE [sa].[sa_oiva_maaraykset] ALTER COLUMN [_source_id] varchar(255) null
ALTER TABLE [sa].[sa_oiva_maaraykset] ALTER COLUMN [lupaId] varchar(255) null

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_maaraykset'
  AND COLUMN_NAME ='kohde_tunniste')
BEGIN
	ALTER TABLE [sa].[sa_oiva_maaraykset] ADD [kohde_tunniste] varchar(100) null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_maaraykset'
  AND COLUMN_NAME ='maaraystyyppi_tunniste')
BEGIN
	ALTER TABLE [sa].[sa_oiva_maaraykset] ADD [maaraystyyppi_tunniste] varchar(50) null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_maaraykset'
  AND COLUMN_NAME ='luoja')
BEGIN
	ALTER TABLE [sa].[sa_oiva_maaraykset] ADD [luoja] nvarchar(255) null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_maaraykset'
  AND COLUMN_NAME ='luontipvm')
BEGIN
	ALTER TABLE [sa].[sa_oiva_maaraykset] ADD [luontipvm] datetime null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_maaraykset'
  AND COLUMN_NAME ='paivittaja')
BEGIN
	ALTER TABLE [sa].[sa_oiva_maaraykset] ADD [paivittaja] nvarchar(255) null
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_maaraykset'
  AND COLUMN_NAME ='paivityspvm')
BEGIN
	ALTER TABLE [sa].[sa_oiva_maaraykset] ADD [paivityspvm] datetime null
END
