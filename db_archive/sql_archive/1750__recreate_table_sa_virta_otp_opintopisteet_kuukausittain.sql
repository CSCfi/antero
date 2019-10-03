--  Opintopisteet kuukausittain ja vuosittain uusinta luonti
USE ANTERO
GO

IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_opintopisteet_kuukausittain'
) BEGIN
DROP TABLE sa.sa_virta_otp_opintopisteet_kuukausittain
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_opintopisteet_kuukausittain'
) 
BEGIN

CREATE TABLE sa.sa_virta_otp_opintopisteet_kuukausittain  (

	id bigint IDENTITY(1,1) NOT NULL,

	hkoodi varchar(200) NULL,
	kk varchar(10) NULL,
	kuukausi smallint NULL,
	laajuus float NULL,	 
	ohjausalakoodi smallint NULL,
	
	opintosuoritusavain varchar(100) NULL,
	opiskelijaavain varchar(100) NULL,
	opiskeluoikeusavain varchar(100) NULL,
	
	oppilaitos varchar(6) NULL,
	osluokittelukoodi smallint NULL,
	
	suorituspaivamaara bigint NULL, --date
	
	vuosi int NULL,
	
	loadtime datetime2(4) NOT NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,
	
  CONSTRAINT PK__sa_virta_otp_opintopisteet_kuukausittain PRIMARY KEY CLUSTERED (id ASC)
)
END

GO


ALTER TABLE sa.sa_virta_otp_opintopisteet_kuukausittain ADD  CONSTRAINT DF__sa_virta_otp_opintopisteet_kuukausittain__loadtime  DEFAULT (getdate()) FOR loadtime
GO

ALTER TABLE sa.sa_virta_otp_opintopisteet_kuukausittain ADD  CONSTRAINT DF__sa_virta_otp_opintopisteet_kuukausittain__username  DEFAULT (suser_name()) FOR username
GO
 