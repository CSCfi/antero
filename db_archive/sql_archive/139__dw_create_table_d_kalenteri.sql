IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_kalenteri') BEGIN

CREATE TABLE dw.d_kalenteri(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,

  kalenteri_avain varchar(20) NOT NULL,
  paivays date null,
  vuosi int null,
  kuukausi int null,
  paiva int null,
  viikko int null,
  viikonpaiva int null,
  kuukausi_fi nvarchar(20) null,
  kuukausi_sv nvarchar(20) null,
  kuukausi_en nvarchar(20) null,
  viikonpaiva_fi nvarchar(20) null,
  viikonpaiva_sv nvarchar(20) null,
  viikonpaiva_en nvarchar(20) null,
)
;

ALTER TABLE dw.d_kalenteri ADD  CONSTRAINT PK__d_kalenteri PRIMARY KEY CLUSTERED (id ASC)
;

ALTER TABLE dw.d_kalenteri ADD  CONSTRAINT DF__d_kalenteri__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_kalenteri ADD  CONSTRAINT DF__d_kalenteri__username  DEFAULT (suser_name()) FOR username
;

END
