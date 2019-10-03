IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_maara') BEGIN

CREATE TABLE sa.sa_oiva_maara(
  id bigint IDENTITY(1,1) NOT NULL,
  alkupvm nvarchar(255) NULL,
  urheilija bit NULL,
  valma_erityinen bit NULL,
  sisaoppilaitosopiskelijamaara_2 int NULL,
  sisaoppilaitosopiskelijamaara_1 int NULL,
  erityisopiskelijamaara_1 int NULL,
  erityisopiskelijamaara_2 int NULL,
  valma bit NULL,
  sisaoppilaitos bit NULL,
  erityisopiskelijamaara int NULL,
  kokonaisopiskelijamaara_1 int NULL,
  kokonaisopiskelijamaara_2 int NULL,
  kokonaisopiskelijamaara int NULL,
  sisaoppilaitosopiskelijamaara int NULL,
  ytunnus nvarchar(255) NULL,
  opetuskieli nvarchar(255) NULL,
  loppupvm nvarchar(255) NULL,
  paatospvm nvarchar(255) NULL,
  tutkintoonvalmistava_erityinen bit NULL,
  kehittamis_erityinen bit NULL,
  telma_erityinen bit NULL,
  diaarinro nvarchar(255) NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_oiva_maara PRIMARY KEY CLUSTERED 
(
  id ASC
)
)
;

ALTER TABLE sa.sa_oiva_maara ADD  CONSTRAINT DF__sa_oiva_maara__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_oiva_maara ADD  CONSTRAINT DF__sa_oiva_maara__username  DEFAULT (suser_name()) FOR username
;

END
