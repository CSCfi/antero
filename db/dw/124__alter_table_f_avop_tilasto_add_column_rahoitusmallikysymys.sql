IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='rahoitusmallikysymys'
) BEGIN

ALTER TABLE dbo.f_avop_tilasto ADD rahoitusmallikysymys bit NULL

END
