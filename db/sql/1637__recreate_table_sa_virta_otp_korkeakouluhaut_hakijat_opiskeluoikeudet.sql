-- Korkeakouluhakijoiden OID opiskeluoikeudet Virrasta

IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet'
) BEGIN
DROP TABLE sa.sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet'
) BEGIN

CREATE TABLE sa.sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet(

	id bigint IDENTITY(1,1) NOT NULL,
	
	alkamispaivamaara bigint NULL, --date
	korkeakoulu varchar(5) NULL,
	oid varchar(50) NOT NULL,
	paattymispaivamaara bigint NULL, --date
	tavoitetutkinto varchar(6) NULL,
	
	loadtime datetime2(4) NOT NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,

	CONSTRAINT PK_korkeakouluhaut_hakijat_opiskeluoikeudet PRIMARY KEY CLUSTERED (id ASC)
)
;

END
