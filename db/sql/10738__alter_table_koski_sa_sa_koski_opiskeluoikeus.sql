USE [Koski_SA]

GO

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_koski_opiskeluoikeus'
      AND COLUMN_NAME = 'master_oid'
)
BEGIN
    ALTER TABLE Koski_SA.sa.sa_koski_opiskeluoikeus
    ADD master_oid [varchar](150) NULL
END

GO

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_koski_opiskeluoikeus_ytr'
      AND COLUMN_NAME = 'master_oid'
)
BEGIN
    ALTER TABLE Koski_SA.sa.sa_koski_opiskeluoikeus_ytr
    ADD master_oid [varchar](150) NULL
END

GO 

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_valpas_oppivelvollisuuden_keskeytys'
      AND COLUMN_NAME = 'master_oid'
)
BEGIN
    ALTER TABLE Koski_SA.sa.sa_valpas_oppivelvollisuuden_keskeytys
    ADD master_oid [varchar](150) NULL
END

GO 

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_valpas_oppivelvollisuuden_keskeytyshistoria'
      AND COLUMN_NAME = 'master_oid'
)
BEGIN
    ALTER TABLE Koski_SA.sa.sa_valpas_oppivelvollisuuden_keskeytyshistoria
    ADD master_oid [varchar](150) NULL
END

GO 

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'sa_valpas_oppivelvollisuudesta_vapautetut'
      AND COLUMN_NAME = 'master_oid'
)
BEGIN
    ALTER TABLE Koski_SA.sa.sa_valpas_oppivelvollisuudesta_vapautetut
    ADD master_oid [varchar](150) NULL
END

GO 

USE [ANTERO]