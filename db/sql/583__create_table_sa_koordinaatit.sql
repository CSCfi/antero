IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_koordinaatit'
)
BEGIN

CREATE TABLE sa.sa_koordinaatit(
  id bigint IDENTITY(1,1) NOT NULL,
  osoite nvarchar(500) NULL,
  postinumero varchar(5) NULL,
  postitoimipaikka nvarchar(200) NULL,
  latitude varchar(30) NULL,
  longitude varchar(30) NULL,

  CONSTRAINT PK__sa_koordinaatit PRIMARY KEY CLUSTERED (id ASC)
)

END
