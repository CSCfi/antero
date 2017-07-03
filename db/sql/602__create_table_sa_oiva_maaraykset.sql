IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_oiva_maaraykset') BEGIN

CREATE TABLE sa.sa_oiva_maaraykset(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,

  _source_id int,
  lupaId int,
  koodisto varchar(100),
  koodiarvo nvarchar(100),
  meta nvarchar(max),
 CONSTRAINT PK__sa_oiva_maaraykset PRIMARY KEY (id)
)

ALTER TABLE sa.sa_oiva_maaraykset ADD  CONSTRAINT DF__sa_oiva_maaraykset__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE sa.sa_oiva_maaraykset ADD  CONSTRAINT DF__sa_oiva_maaraykset__username  DEFAULT (suser_name()) FOR username

END
/* revert
drop table sa.sa_oiva_maaraykset
--*/
