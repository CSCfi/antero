IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_liikennevalot'
) BEGIN

DROP TABLE sa.sa_virta_otp_liikennevalot

END

CREATE TABLE sa.sa_virta_otp_liikennevalot(
  id bigint IDENTITY(1,1) NOT NULL,
  
  ensisijaisuusPuuttuu int NULL,
  kk nvarchar(8) NULL,
  lasnaolevienTutkintoopiskelijoidenLkm int NULL,
  liikkuvuusjaksojenLkm int NULL,
  lukukausiilmoittautumisiaVuosilleLkm int NULL,
  luoja nvarchar(30) NULL, -- NOT NULL
  luontipaivamaara int NULL, -- datetime2(0) NOT NULL
  opintosuoritukseltaPuuttuuNimi int NULL,
  opintosuoritukseltaPuuttuuArvosana int NULL,
  opintosuoritukseltaPuuttuuKoulutusala int NULL,
  opintosuorituksenSisaltyvyys int NULL,
  opintosuoritusIlmanOpintooikeuttaAmk int NULL,
  opiskelijallaEiOleHetua int NULL,
  opiskelijallaEiOleOpiskeluoikeuttaLukukausiilmoittautumistaTaiOpintosuoritusta int NULL,
  opiskelijoidenLkm int NULL,
  opiskeluoikeudenOpiskeluoikeusjaksoEiMuodostaEheaaAikajaksoa int NULL,
  opiskeluoikeudenTilaEiMuodostaEheaaAikajaksoa int NULL,
  opiskeluoikeuksienEnsisijaisuuksissaPaallekkaisyyksia int NULL,
  opiskeluoikeusjaksoltaPuuttuuKoulutuskoodi int NULL,
  oppilaitostunnus varchar(5) NULL,
  tietovarannonTietojenPaivitysLainMukaisellaAikataululla int NULL,
  tutkintoIlmanKoulutuskoodia int NULL,
  tutkintoopiskelijoidenLkm int NULL,

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
