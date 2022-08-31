USE [Koski_SA]
GO

GO
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_ytr'
  and COLUMN_NAME='school_details_period_1' and DATA_TYPE='datetime2'
)
BEGIN
  ALTER TABLE sa.sa_ytr ADD COLUMN school_details_period_1 datetime2 NULL
END
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_ytr'
  and COLUMN_NAME='school_details_period_2' and DATA_TYPE='datetime2'
)
BEGIN
  ALTER TABLE sa.sa_ytr ADD COLUMN school_details_period_2 datetime2 NULL
END
USE ANTERO
