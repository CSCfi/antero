IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_tktutkyo') BEGIN

CREATE TABLE sa.sa_virta_otp_tktutkyo(
  id bigint IDENTITY(1,1) NOT NULL,
  
  kk varchar(2) NULL,
  ht varchar(11) NULL,
  kirtu varchar(5) NULL,
  opoik varchar(5) NULL,
  sv varchar(3) NULL,
  om varchar(1) NULL,
  suorpvm varchar(8) NULL,
  kkun varchar(3) NULL,
  sp varchar(1) NULL,
  aikieliy varchar(1) NULL,
  kansaly varchar(3) NULL,
  snimi nvarchar(255) NULL,
  enimi nvarchar(255) NULL,
  opoylio varchar(4) NULL,
  opaylio varchar(3) NULL,
  opmylio varchar(3) NULL,
  opamk varchar(3) NULL,
  opulk varchar(3) NULL,
  opmuu varchar(3) NULL,
  opyht varchar(4) NULL,
  lkmmt varchar(1) NULL,
  koulky varchar(6) NULL,
  optutk varchar(4) NULL,
  ohjauksenAla varchar(3) NULL,
  ekkoodi varchar(3) NULL,
  opiskelijaavain varchar(100) NULL,
  opintosuoritusavain varchar(100) NULL,
  opiskeluoikeusavain varchar(100) NULL,
  suorituspaivamaara date NULL,
  opiskelija_id int NULL,
  opintosuoritus_id int NULL,
  opiskeluoikeus_id int NULL,
  luoja nvarchar(128) NULL,
  luontipaivamaara datetime NOT NULL,
  
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__virta_otp_tktutkyo PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_tktutkyo ADD  CONSTRAINT DF__sa_virta_otp_tktutkyo__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_tktutkyo ADD  CONSTRAINT DF__sa_virta_otp_tktutkyo__username  DEFAULT (suser_name()) FOR username
;

END
