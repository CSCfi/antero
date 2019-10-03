IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_avoimen_yliopiston_kautta_opiskelevat'
  and COLUMN_NAME='asianomainen'
) AND
NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_avoimen_yliopiston_kautta_opiskelevat'
  and COLUMN_NAME='d_asianomainen_id'
) BEGIN
EXEC sp_RENAME 'dw.f_yo_avoimen_yliopiston_kautta_opiskelevat.asianomainen', 'd_asianomainen_id', 'COLUMN';
END
