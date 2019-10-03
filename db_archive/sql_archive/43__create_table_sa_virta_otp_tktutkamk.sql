IF NOT EXISTS (
    select * from INFORMATION_SCHEMA.TABLES
    where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_tktutkamk'
) BEGIN

CREATE TABLE sa.sa_virta_otp_tktutkamk(
  id bigint IDENTITY(1,1) NOT NULL,

  enimi nvarchar(255) null,
  ht varchar(11) null,
  kkun varchar(3) null,
  luoja nvarchar(255) null,
  luontipaivamaara bigint null, --date
  opintosuoritusId bigint null,
  opintosuoritusavain nvarchar(100) null,
  opiskelijaId bigint null,
  opiskelijaavain nvarchar(100) null,
  opiskeluoikeusId bigint null,
  opiskeluoikeusavain nvarchar(100) null,
  opmuu varchar(4) null,
  optutk varchar(4) null,
  opulk varchar(4) null,
  opyht varchar(4) null,
  snimi nvarchar(255) null,
  sp varchar(2) null,
  suorituspaivamaara bigint null, --date
  suorpvm varchar(8) null,

  aikieli varchar(2) null,
  askunta varchar(3) null,
  kansal varchar(3) null,
  kiel varchar(2) null,
  kirtu1pv varchar(8) null,
  kirtupv varchar(8) null,
  koulk varchar(6) null,
  koultyp varchar(4) null,
  laajuus varchar(4) null,
  lasnalk varchar(4) null,
  lastu varchar(2) null,
  oikeusAlkamispaivamaara bigint null, --date
  oikeusPaattymispaivamaara bigint null, --date
  oikeusSiirtopaivamaara bigint null, --date
  opmamk varchar(4) null,
  opoamk varchar(4) null,
  opylei varchar(4) null,
  opylio varchar(4) null,
  poissalk varchar(4) null,
  rahlahde varchar(2) null,
  tilmaa varchar(3) null,
  tunn varchar(5) null,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_tktutkamk PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_tktutkamk
  ADD CONSTRAINT DF__sa_virta_otp_tktutkamk__loadtime
  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_tktutkamk
  ADD CONSTRAINT DF__sa_virta_otp_tktutkamk__username
  DEFAULT (suser_name()) FOR username
;

END
