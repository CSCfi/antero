IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_cimopitkalahteva') BEGIN

CREATE TABLE dbo.sa_virta_otp_cimopitkalahteva(
  id bigint IDENTITY(1,1) NOT NULL,

  hetu varchar(11) null,
  jaksoAlkupvm bigint null, --date
  jaksoLoppupvm bigint null, --date
  kesto varchar(4) null,
  koultyp varchar(2) null,
  koulutusala varchar(2) null,
  koulutuskoodi varchar(6) null,
  liikkuvuusjaksoId int null,
  liikkuvuusjaksoavain nvarchar(100) null,
  luoja nvarchar(255) null,
  luontipaivamaara bigint null, --date
  opintoaste varchar(2) null,
  opiskelijaId int null,
  opiskelijaavain nvarchar(100) null,
  opiskeluoikeusId int null,
  opiskeluoikeusavain nvarchar(100) null,
  oppilaitos varchar(5) null,
  sp varchar(2) null,
  tyyppi varchar(2) null,
  
  kohdemaa varchar(3) null,
  liikkuvuusohjelma varchar(3) null,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_cimopitkalahteva PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.sa_virta_otp_cimopitkalahteva ADD  CONSTRAINT DF__sa_virta_otp_cimopitkalahteva__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_otp_cimopitkalahteva ADD  CONSTRAINT DF__sa_virta_otp_cimopitkalahteva__username  DEFAULT (suser_name()) FOR username
;

END
