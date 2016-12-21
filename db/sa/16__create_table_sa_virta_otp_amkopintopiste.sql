IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_amkopintopiste') BEGIN

CREATE TABLE dbo.sa_virta_otp_amkopintopiste(
	id bigint IDENTITY(1,1) NOT NULL,
	avoinKK float NULL,
	paivittaja nvarchar(255) NULL,
	hyvaksiluetut float NULL,
	mValKo float NULL,
	tkiToiminnanLaajuus float NULL,
	erikoistumisopinnot float NULL,
	vuosi int NULL,
	db varchar(8) NULL,
	koodi varchar(2) NULL,
	tkiHarjoittelunLaajuus float NULL,
	koulutustyyppi varchar(2) NULL,
	perustutkinto float NULL,
	tkiMuutLaajuus float NULL,
	paivityspaivamaara nvarchar(255) NULL,
	kuvaus nvarchar(255) NULL,
	kvVaihto float NULL,
	vieraskielinen float NULL,
	erillinenOO float NULL,
	luontipaivamaara bigint NULL,
	luoja nvarchar(255) NULL,
	joo float NULL,
	loadtime datetime2(4) NOT NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_virta_otp_amkopintopiste PRIMARY KEY CLUSTERED 
(
	id ASC
)
)
;

ALTER TABLE dbo.sa_virta_otp_amkopintopiste ADD  CONSTRAINT DF__sa_virta_otp_amkopintopiste__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_otp_amkopintopiste ADD  CONSTRAINT DF__sa_virta_otp_amkopintopiste__username  DEFAULT (suser_name()) FOR username
;

END
