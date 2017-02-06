IF EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_tktutkamk') BEGIN
  DROP TABLE sa.sa_virta_otp_tktutkamk
END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_tktutkamk') BEGIN

CREATE TABLE sa.sa_virta_otp_tktutkamk(
  id bigint IDENTITY(1,1) NOT NULL,
  
  tunn varchar(5) NULL,
  koultyp varchar(1) NULL,
  kiel varchar(2) NULL,
  kkun varchar(3) NULL,
  ht varchar(11) NULL,
  snimi varchar(255) NULL,
  enimi varchar(255) NULL,
  sp varchar(1) NULL,
  aikieli varchar(2) NULL,
  askunta varchar(3) NULL,
  kansal varchar(3) NULL,
  kirtupv varchar(8) NULL,
  suorpvm varchar(8) NULL,
  opoamk varchar(3) NULL,
  opmamk varchar(3) NULL,
  opylio varchar(3) NULL,
  opylei varchar(3) NULL,
  opulk varchar(3) NULL,
  opmuu varchar(3) NULL,
  opyht varchar(4) NULL,
  lasnalk varchar(4) NULL,
  poissalk varchar(4) NULL,
  laajuus varchar(4) NULL,
  kirtu1pv varchar(8) NULL,
  lastu varchar(1) NULL,
  rahlahde varchar(1) NULL,
  tilmaa varchar(3) NULL,
  koulk varchar(6) NULL,
  optutk varchar(4) NULL,
  ohjauksenAla varchar(3) NULL,
  ekkoodi varchar(3) NULL,
  suorituspaivamaara date NULL,
  opiskelijaavain varchar(100) NULL,
  opintosuoritusavain varchar(100) NULL,
  opiskeluoikeusavain varchar(100) NULL,
  opiskelija_id int NULL,
  opintosuoritus_id int NULL,
  opiskeluoikeus_id int NULL,
  oikeus_alkamispaivamaara date NULL,
  oikeus_paattymispaivamaara date NULL,
  oikeus_siirtopaivamaara date NULL,
  luoja nvarchar(128) NULL,
  luontipaivamaara datetime NOT NULL,
  
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__virta_otp_tktutkamk PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_tktutkamk ADD  CONSTRAINT DF__sa_virta_otp_tktutkamk__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_tktutkamk ADD  CONSTRAINT DF__sa_virta_otp_tktutkamk__username  DEFAULT (suser_name()) FOR username
;

END
