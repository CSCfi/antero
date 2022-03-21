--  Tavoiteajassa tutkinnon suorittaneet taulu paivitys ryhmakertoimet koulutuskunta ynm
USE ANTERO
GO
IF EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet'
) BEGIN
DROP TABLE sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet'
) BEGIN

CREATE TABLE sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet  (

	id bigint IDENTITY(1,1) NOT NULL,
  
	alkamispvm bigint NULL, --date
	aloitusvuosi int  NULL, 
	ika smallint NULL,
	kaytetytlukukaudet int NULL,
	kaytetytpoissakoodi2kaudet int NULL,
	kaytetytpoissakoodi2paivia int NULL,
	kaytetytpoissakoodi3kaudet int NULL,
	kaytetytpoissakoodi3paivia int NULL, 
	kk varchar(20) NULL,
	
	lasnaololukukaudet int NULL,
	
	onaiempitutkinto smallint NULL,
	opintosuoritusavain varchar(100) NULL,
	opiskelijaavain varchar(100) NULL,
	opiskeluoikeusAvain varchar(100) NULL,
	oppilaitosnro varchar(6) NULL,
	paivia int NULL,
	sukupuoli smallint NULL,
	
	tavoiteaikavuosia float NULL,
	
	tavoiteajassavalmistunut smallint NULL,
	tavoitelukukaudet int NULL,
	tutkinnonsuorituspvm bigint NULL, --date
	
	tutkintokerroin float NULL,
	
	tutkintokoodi varchar(6) NULL,
	tutkintovuosi int NULL,
	vaadittuop int NULL,
	vuosia float NULL,
	
	xkoulutuskieli char(2) NULL,
	xkoulutuskunta varchar(3) NULL,
	xonenintaan12kk smallint NULL,
	xonryhmaa smallint NULL,
	xonryhmab smallint NULL,
	xonryhmac smallint NULL,
	xonyli12kk smallint NULL,
	

	loadtime datetime2(4) NOT NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,
	
  CONSTRAINT PK__sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet ADD  CONSTRAINT DF__sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet ADD  CONSTRAINT DF__sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet__username  DEFAULT (suser_name()) FOR username
;

END
