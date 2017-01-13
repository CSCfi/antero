IF NOT EXISTS (
    select * from INFORMATION_SCHEMA.TABLES
    where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_tktarkistus'
) BEGIN

CREATE TABLE sa.sa_virta_otp_tktarkistus(
  id bigint IDENTITY(1,1) NOT NULL,

  arvo varchar(50) null,
  db varchar(8) null,
  luoja nvarchar(255) null,
  luontipaivamaara bigint null, --date
  opintosuoritusId bigint null,
  opintosuoritusavain nvarchar(100) null,
  opiskelijaId bigint null,
  opiskelijaavain nvarchar(100) null,
  opiskeluoikeusId bigint null,
  opiskeluoikeusavain nvarchar(100) null,
  tiedonkeruu varchar(20) null,
  virhe nvarchar(200) null,
  virhekoodi varchar(20) null,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_tktarkistus PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_tktarkistus
  ADD CONSTRAINT DF__sa_virta_otp_tktarkistus__loadtime
  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_tktarkistus
  ADD CONSTRAINT DF__sa_virta_otp_tktarkistus__username
  DEFAULT (suser_name()) FOR username
;

END
