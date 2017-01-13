IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_koodistot') BEGIN

CREATE TABLE sa.sa_koodistot(
  id bigint IDENTITY(1,1) NOT NULL,
  koodisto nvarchar(100) NOT NULL,
  koodi nvarchar(30) NOT NULL,
  nimi nvarchar(200) NULL,
  nimi_sv nvarchar(200) NULL,
  nimi_en nvarchar(200) NULL,
  alkupvm date NULL,
  loppupvm date NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_koodistot PRIMARY KEY CLUSTERED 
(
  id ASC
)
)
;

ALTER TABLE sa.sa_koodistot ADD  CONSTRAINT DF__sa_koodistot__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_koodistot ADD  CONSTRAINT DF__sa_koodistot__username  DEFAULT (suser_name()) FOR username
;

END
