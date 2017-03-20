IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_maaluokitus'
) BEGIN

CREATE TABLE sa.sa_maaluokitus(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  koodi nvarchar(3) NOT NULL,
  nimi nvarchar(200) NULL,
  nimi_sv nvarchar(200) NULL,
  nimi_en nvarchar(200) NULL,
  alkupvm date NULL,
  loppupvm date NULL,
  maanosatkoodi nvarchar(3) NULL,
  maanosatnimi nvarchar(200) NULL,
  maanosatnimi_sv nvarchar(200) NULL,
  maanosatnimi_en nvarchar(200) NULL,
  maanosat2koodi nvarchar(3) NULL,
  maanosat2nimi nvarchar(200) NULL,
  maanosat2nimi_sv nvarchar(200) NULL,
  maanosat2nimi_en nvarchar(200) NULL,
  maanosat3koodi nvarchar(3) NULL,
  maanosat3nimi nvarchar(200) NULL,
  maanosat3nimi_sv nvarchar(200) NULL,
  maanosat3nimi_en nvarchar(200) NULL,
  CONSTRAINT PK__sa_maaluokitus PRIMARY KEY CLUSTERED (id ASC)
)

ALTER TABLE sa.sa_maaluokitus ADD  CONSTRAINT DF__sa_maaluokitus__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE sa.sa_maaluokitus ADD  CONSTRAINT DF__sa_maaluokitus__username  DEFAULT (suser_name()) FOR username

END
/* revert
DROP TABLE sa.sa_maaluokitus
--*/
