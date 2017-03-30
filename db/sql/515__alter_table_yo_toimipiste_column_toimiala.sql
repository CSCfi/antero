IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_toimipiste'
  and COLUMN_NAME='toimiala'
)
BEGIN

ALTER TABLE sa.sa_oppilaitosluokitus DROP COLUMN toimiala;

END