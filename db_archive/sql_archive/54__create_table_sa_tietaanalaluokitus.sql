IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_tieteenalaluokitus') BEGIN

CREATE TABLE sa.sa_tieteenalaluokitus(
  id bigint IDENTITY(1,1) NOT NULL,

  koodi varchar(4) NOT NULL,
  nimi nvarchar(200) NULL,
  nimi_sv nvarchar(200) NULL,
  nimi_en nvarchar(200) NULL,
  alkupvm date NULL,
  loppupvm date NULL,
  paatieteenalakoodi varchar(2) NULL,
  paatieteenalanimi nvarchar(200) NULL,
  paatieteenalanimi_sv nvarchar(200) NULL,
  paatieteenalanimi_en nvarchar(200) NULL,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_tieteenalaluokitus PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_tieteenalaluokitus ADD  CONSTRAINT DF__sa_tieteenalaluokitus__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_tieteenalaluokitus ADD  CONSTRAINT DF__sa_tieteenalaluokitus__username  DEFAULT (suser_name()) FOR username
;

END
