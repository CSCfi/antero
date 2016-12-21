IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_amk8suorattk') BEGIN

CREATE TABLE dbo.sa_virta_otp_amk8suorattk(
	id bigint IDENTITY(1,1) NOT NULL,
	organisaatiokoodi nvarchar(255) NULL,
	vuosi int NULL,
	naisia int NULL,
	koulutusala int NULL,
	miehia int NULL,
	loadtime datetime2(4) NOT NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_virta_otp_amk8suorattk PRIMARY KEY CLUSTERED 
(
	id ASC
)
)
;

ALTER TABLE dbo.sa_virta_otp_amk8suorattk ADD  CONSTRAINT DF__sa_virta_otp_amk8suorattk__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_otp_amk8suorattk ADD  CONSTRAINT DF__sa_virta_otp_amk8suorattk__username  DEFAULT (suser_name()) FOR username
;

END
