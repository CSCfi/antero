IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_yoopintopiste') BEGIN

CREATE TABLE dbo.sa_virta_otp_yoopintopiste(
  id bigint IDENTITY(1,1) NOT NULL,

  vuosi int NULL,
  koodi varchar(2) NULL,
  db varchar(8) NULL,
  kuvaus nvarchar(255) NULL,
  perustutkinto float NULL,
  vieraskielinen float NULL,
  avoinKK float NULL,
  erillinenOO float NULL,
  joo float NULL,
  kvVaihto float NULL,
  erikoistumisopinnot float NULL,
  hyvaksiluetut float NULL,
  erillinenopettaja float NULL,

  luoja nvarchar(255) NULL,
  luontipaivamaara bigint NULL, --date
  paivittaja nvarchar(255) NULL,
  paivityspaivamaara bigint NULL, --date

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_virta_otp_yoopintopiste PRIMARY KEY CLUSTERED 
(
  id ASC
)
)
;

ALTER TABLE dbo.sa_virta_otp_yoopintopiste ADD  CONSTRAINT DF__sa_virta_otp_yoopintopiste__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_otp_yoopintopiste ADD  CONSTRAINT DF__sa_virta_otp_yoopintopiste__username  DEFAULT (suser_name()) FOR username
;

END
