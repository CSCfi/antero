IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_yoavoimenopintopisteetjarj') BEGIN

CREATE TABLE sa.sa_virta_otp_yoavoimenopintopisteetjarj(
  id bigint IDENTITY(1,1) NOT NULL,

  db varchar(8) null,
  koodi varchar(2) NULL,
  kuvaus nvarchar(255) NULL,
  Luoja nvarchar(255) NULL,
  luontipaivamaara bigint null,
  opintopisteet int null,
  oppilaitostyyppi varchar(2) null,
  paivittaja nvarchar(255) null,
  paivityspaivamaara bigint null,
  vuosi int null,
  
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_yoavoimenopintopisteetjarj PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_yoavoimenopintopisteetjarj ADD  CONSTRAINT DF__sa_virta_otp_yoavoimenopintopisteetjarj__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_yoavoimenopintopisteetjarj ADD  CONSTRAINT DF__sa_virta_otp_yoavoimenopintopisteetjarj__username  DEFAULT (suser_name()) FOR username
;

END
