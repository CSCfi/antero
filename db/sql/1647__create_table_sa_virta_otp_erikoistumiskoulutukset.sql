-- Erikoistumiskoulutukset Virrasta

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_erikoistumiskoulutukset'
) BEGIN


CREATE TABLE sa.sa_virta_otp_erikoistumiskoulutukset(

		id bigint IDENTITY(1,1) NOT NULL,
		erikoistumiskoulutuskoodi nvarchar(20) NULL,
		ika smallint  NULL,
		ohjauksenalakoodi nvarchar(20) NULL,
		opiskeluoikeudenalkamispaivamaara bigint NULL,
		oppilaitoskoodi nvarchar(8) NULL,
		sukupuolikoodi (5) NOT NULL,

		loadtime datetime2(4) NOT NULL,
		source nvarchar(255) NULL,
		username nvarchar(128) NOT NULL,

	CONSTRAINT PK_korkeakouluhaut_hakijat_tutkinnot PRIMARY KEY CLUSTERED (id ASC)
)
;

END
