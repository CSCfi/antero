-- tyhjennä alta datat pois, jotta muuttunut rakenne populoituu oikein
TRUNCATE TABLE dbo.d_arvokysymys;

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='d_arvokysymys'
  and COLUMN_NAME='vastaustyyppi'
) BEGIN

ALTER TABLE dbo.d_arvokysymys ADD vastaustyyppi varchar(50) NULL

END
