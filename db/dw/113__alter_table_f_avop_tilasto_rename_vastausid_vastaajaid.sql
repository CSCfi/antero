IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='vastausid'
) AND
NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='vastaajaid'
) BEGIN

EXEC sp_RENAME 'dbo.f_avop_tilasto.vastausid', 'vastaajaid', 'COLUMN';

END
