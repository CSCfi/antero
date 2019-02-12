-- Erikoistumiskoulutukset Virrasta
USE ANTERO
GO
IF EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_erikoistumiskoulutukset'
) BEGIN
DROP TABLE sa.sa_virta_otp_erikoistumiskoulutukset
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_erikoistumiskoulutukset'
) BEGIN



CREATE TABLE sa.sa_virta_otp_erikoistumiskoulutukset(

		id bigint IDENTITY(1,1) NOT NULL,
		erikoistumiskoulutuskoodi nvarchar(20) NULL,
		ika smallint  NULL,
		ohjauksenalakoodi nvarchar(20) NULL,
		opiskeluoikeudenalkamispaivamaara bigint NULL,
		oppilaitoskoodi nvarchar(8) NULL,
		sukupuolikoodi nvarchar (5) NOT NULL,
		
		tutkinnonsuorituspvm bigint NULL,
		tutkinnonsuoropkoodi nvarchar(8) NULL,
		tutkinnontasokoodi smallint  NULL,
        ylinuusintutkintokoodi  nvarchar(6) NULL,
		
		loadtime datetime2(4) NOT NULL,
		source nvarchar(255) NULL,
		username nvarchar(128) NOT NULL,

	CONSTRAINT PK_erikoistumiskoulutukset PRIMARY KEY CLUSTERED (id ASC)
)
;


ALTER TABLE sa.sa_virta_otp_erikoistumiskoulutukset ADD  CONSTRAINT DF__sa_virta_otp_erikoistumiskoulutukset__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_erikoistumiskoulutukset ADD  CONSTRAINT DF__sa_virta_otp_erikoistumiskoulutukset__username  DEFAULT (suser_name()) FOR username
;

END
