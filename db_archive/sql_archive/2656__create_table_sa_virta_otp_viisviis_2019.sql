-- 2019 freezed data  
USE ANTERO
GO 

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_viisviis_2019'
) BEGIN

CREATE TABLE sa.sa_virta_otp_viisviis_2019(

  id bigint  NOT NULL,

  edellinenSyysolo smallint NULL,
   
  ika smallint NULL,
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
  
  CONSTRAINT PK__sa_virta_otp_viisviis_2019 PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_viisviis_2019 ADD  CONSTRAINT DF__sa_virta_otp_viisviis_2019__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_viisviis_2019 ADD  CONSTRAINT DF__sa_virta_otp_viisviis_2019__username  DEFAULT (suser_name()) FOR username
;

END
