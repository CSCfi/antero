IF NOT EXISTS (
    select * from INFORMATION_SCHEMA.TABLES
    where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_tktutkyo'
) BEGIN

CREATE TABLE sa.sa_virta_otp_tktutkyo(
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

  aikieliy varchar(2) null,
  kansaly varchar(3) null,
  kirtu varchar(5) null,
  kk varchar(2) null,
  koulky varchar(6) null,
  lkmmt varchar(2) null,
  om varchar(2) null,
  opamk varchar(4) null,
  opaylio varchar(4) null,
  opmylio varchar(4) null,
  opoik varchar(5) null,
  opoylio varchar(4) null,
  sv varchar(3) null,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_tktutkyo PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_tktutkyo
  ADD CONSTRAINT DF__sa_virta_otp_tktutkyo__loadtime
  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_tktutkyo
  ADD CONSTRAINT DF__sa_virta_otp_tktutkyo__username
  DEFAULT (suser_name()) FOR username
;

END
