--  uudestaan Valmentavaan koulutukseen osallistuneet taulu
USE ANTERO
GO

IF EXISTS (
  SELECT * from INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_valmentavaan_koulutukseen_osallistuneet'
) BEGIN
DROP TABLE sa.sa_virta_otp_valmentavaan_koulutukseen_osallistuneet

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_valmentavaan_koulutukseen_osallistuneet'
) BEGIN

CREATE TABLE sa.sa_virta_otp_valmentavaan_koulutukseen_osallistuneet  (

	id bigint IDENTITY(1,1) NOT NULL,
  
	atunniste int NOT NULL,
	ika smallint NULL,
	sukupuoli smallint NULL,
	tkk varchar(10) NULL,
	tkoulutuskoodi int NULL,
	
	tooalkamispaivamaara bigint NULL,
	toopaattymispaivamaara bigint NULL,
	
	tootyyppi int NULL,
	
	toppilaitosnro varchar(5) NULL,
	ttutkinnonsuorituspvm bigint NULL,
	
	vkk varchar(10) NULL,
	
	vooalkamispaivamaara bigint NULL,
	voopaattymispaivamaara bigint NULL,
	
	vootyyppi int NULL,
	voppilaitosnro varchar(5) NULL,	

	loadtime datetime2(4) NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,
	
  CONSTRAINT PK__sa_virta_otp_valmentavaan_koulutukseen_osallistuneet PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_valmentavaan_koulutukseen_osallistuneet ADD  CONSTRAINT DF__sa_virta_otp_valmentavaan_koulutukseen_osallistuneet__loadtime  DEFAULT (getdate()) FOR [loadtime]
;
ALTER TABLE sa.sa_virta_otp_valmentavaan_koulutukseen_osallistuneet ADD  CONSTRAINT DF__sa_virta_otp_valmentavaan_koulutukseen_osallistuneet__username  DEFAULT (suser_name()) FOR username
;

END
