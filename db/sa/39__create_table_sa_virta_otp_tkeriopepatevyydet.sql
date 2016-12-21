IF NOT EXISTS (
    select * from INFORMATION_SCHEMA.TABLES
    where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_tkeriopepatevyydet'
) BEGIN

CREATE TABLE dbo.sa_virta_otp_tkeriopepatevyydet(
  id bigint IDENTITY(1,1) NOT NULL,

  db varchar(20) null,
  erillisetOpettajanOpinnot varchar(3) null,
  etunimet varchar(50) null,
  henkilonNimi varchar(60) null,
  henkilotunnus varchar(11) null,
  koulutuksenSijaintikunta varchar(3) null,
  kunta varchar(30) null,
  opintosuorituksenAvain nvarchar(100) null,
  opiskelijaAvain varchar(50) null,
  oppilaitosnimi varchar(50) null,
  oppilaitostunnus varchar(5) null,
  paivityspvm bigint null, --date
  patevyysSelite varchar(50) null,
  sukunimi varchar(50) null,
  suorituspvm bigint null, --date
  suoritusvuosiJaKuukausi varchar(6) null,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_tkeriopepatevyydet PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.sa_virta_otp_tkeriopepatevyydet
  ADD CONSTRAINT DF__sa_virta_otp_tkeriopepatevyydet__loadtime
  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_otp_tkeriopepatevyydet
  ADD CONSTRAINT DF__sa_virta_otp_tkeriopepatevyydet__username
  DEFAULT (suser_name()) FOR username
;

END
