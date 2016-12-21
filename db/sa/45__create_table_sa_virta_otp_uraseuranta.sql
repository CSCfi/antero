IF NOT EXISTS (
    select * from INFORMATION_SCHEMA.TABLES
    where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_uraseuranta'
) BEGIN

CREATE TABLE dbo.sa_virta_otp_uraseuranta(
  id bigint IDENTITY(1,1) NOT NULL,

  aidinkieli varchar(2) null,
  aine varchar(250) null,
  arvosana varchar(100) null,
  asteikko varchar(200) null,
  asuinkuntaKoodi varchar(3) null,
  asuinkuntaNimi varchar(100) null,
  etunimet varchar(200) null,
  henkilotunnus varchar(15) null,
  ikaValmistuessa int null,
  kansalaisuus varchar(3) null,
  kirjoillaOloKuukausia int null,
  kk varchar(20) null,
  koulutusala varchar(200) null,
  koulutusalakoodi varchar(3) null,
  laajuus int null,
  lasnaoloLukukausia int null,
  opiskelijatunnus varchar(250) null,
  opiskelupaikkakuntaKoodi varchar(3) null,
  opiskelupaikkakuntaNimi varchar(200) null,
  regDatum bigint null, --date
  sukunimi varchar(200) null,
  sukupuoli int null,
  tutkinnonTaso int null,
  tutkintoKoulutuskoodi varchar(10) null,
  tutkintoNimi varchar(200) null,
  valintavuosi bigint null, --date
  valmistumisajankohta bigint null, --date
  valmistumisvuosi int null,
  yliopistoNimi varchar(50) null,
  yliopistoOppilaitoskoodi varchar(10) null,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_uraseuranta PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.sa_virta_otp_uraseuranta
  ADD CONSTRAINT DF__sa_virta_otp_uraseuranta__loadtime
  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_otp_uraseuranta
  ADD CONSTRAINT DF__sa_virta_otp_uraseuranta__username
  DEFAULT (suser_name()) FOR username
;

END
