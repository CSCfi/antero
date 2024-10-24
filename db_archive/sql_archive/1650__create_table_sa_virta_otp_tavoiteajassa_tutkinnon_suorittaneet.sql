--  Tavoiteajassa tutkinnon suorittaneet taulu


IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet'
) BEGIN

CREATE TABLE sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet  (

	id bigint IDENTITY(1,1) NOT NULL,
  
	alkamispvm bigint NULL, --date
	aloitusvuosi int  NULL, 
	ika smallint NULL,
	kaytetytlukukaudet int NULL,
	kk varchar(20) NULL,
	onaiempitutkinto smallint NULL,
	opintosuoritusavain varchar(100) NULL,
	opiskelijaavain varchar(100) NULL,
	opiskeluoikeusAvain varchar(100) NULL,
	oppilaitosnro varchar(6) NULL,
	paivia int NULL,
	sukupuoli smallint NULL,
	tavoiteajassavalmistunut smallint NULL,
	tavoitelukukaudet int NULL,
	tutkinnonsuorituspvm bigint NULL, --date
	tutkintokoodi varchar(6) NULL,
	tutkintovuosi int NULL,
	vaadittuop int NULL,
	vuosia float NULL,

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
