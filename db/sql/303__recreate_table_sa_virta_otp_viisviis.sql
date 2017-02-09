-- re-create as column names do not have underscore on virta-otp api
IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_viisviis'
) BEGIN
DROP TABLE sa.sa_virta_otp_viisviis
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_viisviis'
) BEGIN

CREATE TABLE sa.sa_virta_otp_viisviis(
  id bigint IDENTITY(1,1) NOT NULL,

  edellinenSyysolo smallint NULL,
  hetu varchar(11) NULL,
  kevat int NULL,
  loAloituspvm bigint NULL, --date
  olok smallint NULL,
  olos smallint NULL,
  ooAloituspvm bigint NULL, --date
  opSummaKunOtePankista int NULL,
  opiskelijaavain varchar(100) NULL,
  opiskeluoikeusavain varchar(100) NULL,
  opiskeluoikeusid int NULL,
  oppilaitos varchar(20) NULL,
  oppilaitostunnus varchar(10) NULL,
  pankkiKumuEnnen55 int NULL,
  pankkiSaldo55 int NULL,
  regDatum bigint NULL, --smalldatetime
  sukupuoli smallint NULL,
  summa int NULL,
  suorittanut27 smallint NULL,
  suorittanut55ilmanPankkia smallint NULL,
  suorittanut55pankinAvulla smallint NULL,
  syys int NULL,
  tkoodi varchar(6) NULL,
  uusiOpisk smallint NULL,
  uusiOpiskKevat smallint NULL,
  uuttaPankkiin int NULL,
  vuosi int NULL,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_viisviis PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_viisviis ADD  CONSTRAINT DF__sa_virta_otp_viisviis__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_viisviis ADD  CONSTRAINT DF__sa_virta_otp_viisviis__username  DEFAULT (suser_name()) FOR username
;

END
