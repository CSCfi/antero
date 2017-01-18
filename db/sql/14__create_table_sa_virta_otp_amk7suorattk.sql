IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_amk7suorattk') BEGIN

CREATE TABLE sa.sa_virta_otp_amk7suorattk(
  id bigint IDENTITY(1,1) NOT NULL,
  organisaatiokoodi nvarchar(255) NULL,
  vuosi int NULL,
  naisia int NULL,
  koulutusala int NULL,
  miehia int NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_virta_otp_amk7suorattk PRIMARY KEY CLUSTERED 
(
  id ASC
)
)
;

ALTER TABLE sa.sa_virta_otp_amk7suorattk ADD  CONSTRAINT DF__sa_virta_otp_amk7suorattk__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_amk7suorattk ADD  CONSTRAINT DF__sa_virta_otp_amk7suorattk__username  DEFAULT (suser_name()) FOR username
;

END
