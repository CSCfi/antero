IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='d_avopkysymys_id'
) AND
NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='d_arvokysymys_id'
) BEGIN

EXEC sp_RENAME 'dw.f_avop_tilasto.d_avopkysymys_id', 'd_arvokysymys_id', 'COLUMN';

END
