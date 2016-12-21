IF NOT EXISTS (
    select * from INFORMATION_SCHEMA.TABLES
    where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_opettajapatevyydet'
) BEGIN

CREATE TABLE dbo.sa_virta_otp_opettajapatevyydet(
  id bigint IDENTITY(1,1) NOT NULL,

  db varchar(8) null,
  henkiloID int null,
  henkilotunnus varchar(11) null,
  laajuus float null,
  opintosuoritusAvain nvarchar(100) null,
  opintosuorituslaji int null,
  opiskelijaAvain nvarchar(100) null,
  oppilaitostyyppiKoodi varchar(2) null,
  organisaatiokoodi varchar(5) null,
  paivamaara bigint null, --date
  patevyysKoodi varchar(5) null,
  patevyysNimi nvarchar(200) null,
  regDatum bigint null, --date
  vuosi int null,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_opettajapatevyydet PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.sa_virta_otp_opettajapatevyydet
  ADD CONSTRAINT DF__sa_virta_otp_opettajapatevyydet__loadtime
  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_otp_opettajapatevyydet
  ADD CONSTRAINT DF__sa_virta_otp_opettajapatevyydet__username
  DEFAULT (suser_name()) FOR username
;

END
