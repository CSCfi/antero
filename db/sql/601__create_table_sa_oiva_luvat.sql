IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_luvat') BEGIN

CREATE TABLE sa.sa_oiva_luvat(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,

  _source_id int,
    diaarinumero varchar(20),
    jarjestajaYtunnus varchar(30),
    jarjestajaOid varchar(100),
    alkupvm varchar(10),
    paatospvm varchar(10),
    meta nvarchar(max),
    ministeri nvarchar(100),
    esittelija nvarchar(100),
    paatos_old_id int,
    ministeri_nimike nvarchar(50),
    esittelija_nimike nvarchar(50),
    koulutustehtava_old_id int,
    maksu bit,
 CONSTRAINT PK__sa_oiva_luvat PRIMARY KEY (id)
)

ALTER TABLE sa.sa_oiva_luvat ADD  CONSTRAINT DF__sa_oiva_luvat__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE sa.sa_oiva_luvat ADD  CONSTRAINT DF__sa_oiva_luvat__username  DEFAULT (suser_name()) FOR username

END
/* revert
drop table sa.sa_oiva_luvat
--*/
