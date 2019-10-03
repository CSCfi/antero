IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_organisaatioluokitus'
  and COLUMN_NAME='latitude' and DATA_TYPE='varchar'
)  BEGIN
  ALTER TABLE dw.d_organisaatioluokitus ALTER COLUMN latitude float NULL
END

IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_organisaatioluokitus'
  and COLUMN_NAME='longitude' and DATA_TYPE='varchar'
)  BEGIN
  ALTER TABLE dw.d_organisaatioluokitus ALTER COLUMN longitude float NULL
END
/* revert
ALTER TABLE dw.d_organisaatioluokitus ALTER COLUMN latitude  varchar(30) NULL
ALTER TABLE dw.d_organisaatioluokitus ALTER COLUMN longitude varchar(30) NULL
--*/
