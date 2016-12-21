IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_amk7opiskelijat') BEGIN

CREATE TABLE dbo.sa_virta_otp_amk7opiskelijat(
	id bigint IDENTITY(1,1) NOT NULL,
	kk varchar(10) null,
	koulutusalakoodi varchar(2) null,
	opiskelijaAvain nvarchar(100) null,
  opiskeluOikeudenAlku Date null,
  opiskeluOikeudenPaattymispvm Date null,
  opiskeluOikeusAvain nvarchar(100) null,
  opiskeluoikeudenKohteenaOlevanKoulutuksenTunniste nvarchar(200) null,
  organisaatiokoodi varchar(5) null,
  sukupuoli varchar(2) null,
  vuosi int null,
	loadtime datetime2(4) NOT NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_amk7opiskelijat PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.sa_virta_otp_amk7opiskelijat ADD  CONSTRAINT DF__sa_virta_otp_amk7opiskelijat__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_otp_amk7opiskelijat ADD  CONSTRAINT DF__sa_virta_otp_amk7opiskelijat__username  DEFAULT (suser_name()) FOR username
;

END
