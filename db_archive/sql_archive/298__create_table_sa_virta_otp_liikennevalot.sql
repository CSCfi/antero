IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_liikennevalot'
) BEGIN

CREATE TABLE sa.sa_virta_otp_liikennevalot(
  id bigint IDENTITY(1,1) NOT NULL,
  
  ensisijaisuus_puuttuu int NULL,
  kk nvarchar(8) NULL,
  lasnaolevien_tutkintoopiskelijoiden_lkm int NULL,
  liikkuvuusjaksojen_lkm int NULL,
  lukukausiilmoittautumisia_vuosille_lkm int NULL,
  luoja nvarchar(30) NULL, -- NOT NULL
  luontipaivamaara int NULL, -- datetime2(0) NOT NULL
  opintosuoritukselta_puuttuu_nimi int NULL,
  opintosuoritukselta_puuttuu_arvosana int NULL,
  opintosuoritukselta_puuttuu_koulutusala int NULL,
  opintosuorituksen_sisaltyvyys int NULL,
  opintosuoritus_ilman_opintooikeutta_amk int NULL,
  opiskelijalla_ei_ole_hetua int NULL,
  opiskelijalla_ei_ole_opiskeluoikeutta_lukukausiilmoittautumista_tai_opintosuoritusta int NULL,
  opiskelijoiden_lkm int NULL,
  opiskeluoikeuden_opiskeluoikeusjakso_ei_muodosta_eheaa_aikajaksoa int NULL,
  opiskeluoikeuden_tila_ei_muodosta_eheaa_aikajaksoa int NULL,
  opiskeluoikeuksien_ensisijaisuuksissa_paallekkaisyyksia int NULL,
  opiskeluoikeusjaksolta_puuttuu_koulutuskoodi int NULL,
  oppilaitostunnus varchar(5) NULL,
  tietovarannon_tietojen_paivitys_lain_mukaisella_aikataululla int NULL,
  tutkinto_ilman_koulutuskoodia int NULL,
  tutkintoopiskelijoiden_lkm int NULL,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_liikennevalot PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_liikennevalot ADD  CONSTRAINT DF__sa_virta_otp_liikennevalot__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_liikennevalot ADD  CONSTRAINT DF__sa_virta_otp_liikennevalot__username  DEFAULT (suser_name()) FOR username
;

END
