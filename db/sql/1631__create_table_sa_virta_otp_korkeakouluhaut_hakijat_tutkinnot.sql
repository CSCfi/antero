-- Korkeakouluhakijoiden OID Tutkinnot Virrasta

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot'
) BEGIN


CREATE TABLE sa.sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot(

		id bigint IDENTITY(1,1) NOT NULL,
		korkeakoulu varchar(5) NULL,
		oid varchar(50) NOT NULL,
		suorituspaivamaara date NULL,
		tutkinto varchar(6) NULL,

		loadtime datetime2(4) NOT NULL,
		source nvarchar(255) NULL,
		username nvarchar(128) NOT NULL,

	CONSTRAINT PK_korkeakouluhaut_hakijat_tutkinnot PRIMARY KEY CLUSTERED (id ASC)
)
;

END
