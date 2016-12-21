IF NOT EXISTS (
    select * from INFORMATION_SCHEMA.TABLES
    where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_opintopistepvmyo'
) BEGIN

CREATE TABLE dbo.sa_virta_otp_opintopistepvmyo(
  id bigint IDENTITY(1,1) NOT NULL,

  vuosi int null,
  suorituspaiva bigint null, --date
  koodi nvarchar(20) null,
  kuvaus nvarchar(200) null,
  lukumaara int null,
  perustutkOpiskelijat int null,
  vieraskSuoritukset int null,
  kansainvVaihto int null,
  kkYhteistyo int null,
  avoinKK int null,
  erillinenOpintoOikeus int null,
  ulkomailtaHyvLuet int null,
  db varchar(8) null,
  oppilaitostunnus nvarchar(20) null,
  luoja nvarchar(255) NULL,
  luontipaivamaara bigint null, --date

  erillinenOpintoOpettaja int null,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_opintopistepvmyo PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.sa_virta_otp_opintopistepvmyo
  ADD CONSTRAINT DF__sa_virta_otp_opintopistepvmyo__loadtime
  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_otp_opintopistepvmyo
  ADD CONSTRAINT DF__sa_virta_otp_opintopistepvmyo__username
  DEFAULT (suser_name()) FOR username
;

END
