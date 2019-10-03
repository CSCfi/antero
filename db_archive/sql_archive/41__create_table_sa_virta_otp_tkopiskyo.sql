IF NOT EXISTS (
    select * from INFORMATION_SCHEMA.TABLES
    where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_tkopiskyo'
) BEGIN

CREATE TABLE sa.sa_virta_otp_tkopiskyo(
  id bigint IDENTITY(1,1) NOT NULL,

  enimi nvarchar(255) null,
  ht varchar(11) null,
  kkun varchar(3) null,
  koulk varchar(6) null,
  luoja nvarchar(255) null,
  luontipaivamaara bigint null, --date
  olosyys varchar(2) null,
  olotamm varchar(2) null,
  opek varchar(4) null,
  opes varchar(4) null,
  opiskelijaId bigint null,
  opiskelijaavain nvarchar(100) null,
  opiskeluoikeusId bigint null,
  opiskeluoikeusavain nvarchar(100) null,
  snimi nvarchar(255) null,
  opker varchar(4) null,
  sp varchar(2) null,

  aikieliy varchar(2) null,
  askuntay varchar(3) null,
  avo varchar(2) null,
  fuksi varchar(2) null,
  kansaly varchar(3) null,
  kirtu varchar(5) null,
  kk varchar(2) null,
  lkmmt varchar(2) null,
  om varchar(2) null,
  opoik varchar(5) null,
  sv varchar(3) null,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_tkopiskyo PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_tkopiskyo
  ADD CONSTRAINT DF__sa_virta_otp_tkopiskyo__loadtime
  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_tkopiskyo
  ADD CONSTRAINT DF__sa_virta_otp_tkopiskyo__username
  DEFAULT (suser_name()) FOR username
;

END
