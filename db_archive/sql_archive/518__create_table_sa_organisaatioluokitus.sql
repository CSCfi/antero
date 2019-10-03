IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_organisaatioluokitus'
)
BEGIN

CREATE TABLE sa.sa_organisaatioluokitus(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,

  oid varchar(200) NULL,
  koodi varchar(30) NULL,
  nimi nvarchar(200) NULL,
  nimi_sv nvarchar(200) NULL,
  nimi_en nvarchar(200) NULL,
  alkupvm varchar(20) NULL,
  loppupvm varchar(20) NULL,

  tyyppi varchar(30) NULL,
  parentoid varchar(200) NULL,
  liitosoid varchar(200) NULL,

  kotikunta varchar(5) NULL,
  oppilaitoksenopetuskieli varchar(5) NULL,
  oppilaitostyyppi varchar(5) NULL,

  osoitetyyppi varchar(20) NULL,
  osoite nvarchar(500) NULL,
  postinumero varchar(5) NULL,
  postitoimipaikka nvarchar(200) NULL,

  latitude varchar(30) NULL,
  longitude varchar(30) NULL,

  CONSTRAINT PK__sa_organisaatioluokitus PRIMARY KEY CLUSTERED (id ASC)
)

ALTER TABLE sa.sa_organisaatioluokitus ADD  CONSTRAINT DF__sa_organisaatioluokitus__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE sa.sa_organisaatioluokitus ADD  CONSTRAINT DF__sa_organisaatioluokitus__username  DEFAULT (suser_name()) FOR username

END
