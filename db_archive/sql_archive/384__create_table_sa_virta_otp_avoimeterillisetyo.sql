IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_avoimeterillisetyo'
) BEGIN

CREATE TABLE sa.sa_virta_otp_avoimeterillisetyo(
  id bigint IDENTITY(1,1) NOT NULL,
  
  avoMiehet int null,
  avoNaiset int null,
  avoTutkintoMiehet int null,
  avoTutkintoNaiset int null,
  erillisetOikeudet int null,
  erillisetOpettajat int null,
  kk varchar(8) null,
  organisaatioKoodi varchar(5) null,
  vuosi int null,
  
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__virta_otp_avoimeterillisetyo PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_avoimeterillisetyo ADD  CONSTRAINT DF__sa_virta_otp_avoimeterillisetyo__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_avoimeterillisetyo ADD  CONSTRAINT DF__sa_virta_otp_avoimeterillisetyo__username  DEFAULT (suser_name()) FOR username
;

END
