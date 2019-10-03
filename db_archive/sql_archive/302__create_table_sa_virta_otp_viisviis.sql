IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_viisviis'
) BEGIN

CREATE TABLE sa.sa_virta_otp_viisviis(
  id bigint IDENTITY(1,1) NOT NULL,

  edellinen_syysolo smallint NULL,
  hetu varchar(11) NULL,
  kevat int NULL,
  lo_aloituspvm bigint NULL, --date
  olok smallint NULL,
  olos smallint NULL,
  oo_aloituspvm bigint NULL, --date
  op_summa_kun_ote_pankista int NULL,
  opiskelijaavain varchar(100) NULL,
  opiskeluoikeusavain varchar(100) NULL,
  opiskeluoikeusid int NULL,
  oppilaitos varchar(20) NULL,
  oppilaitostunnus varchar(10) NULL,
  pankki_kumu_ennen55 int NULL,
  pankki_saldo55 int NULL,
  reg_datum bigint NULL, --smalldatetime
  sukupuoli smallint NULL,
  summa int NULL,
  suorittanut27 smallint NULL,
  suorittanut55ilman_pankkia smallint NULL,
  suorittanut55pankin_avulla smallint NULL,
  syys int NULL,
  tkoodi varchar(6) NULL,
  uusi_opisk smallint NULL,
  uusi_opisk_kevat smallint NULL,
  uutta_pankkiin int NULL,
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
