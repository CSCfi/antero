IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_oppilaitosluokitus'
  and COLUMN_NAME='osoite'
)
BEGIN

ALTER TABLE sa.sa_oppilaitosluokitus ADD
  osoite nvarchar(500) NULL,
  postinumero varchar(5) NULL,
  postitoimipaikka nvarchar(200) NULL,
  latitude varchar(30) NULL,
  longitude varchar(30) NULL

END
/* revert
ALTER TABLE sa.sa_oppilaitosluokitus DROP COLUMN
  osoite,
  postinumero,
  postitoimipaikka,
  latitude,
  longitude
--*/
