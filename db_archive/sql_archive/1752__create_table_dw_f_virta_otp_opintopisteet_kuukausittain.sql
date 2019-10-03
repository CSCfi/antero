--  Opintopisteet kuukausittain ja vuosittain uusinta luonti
USE ANTERO
GO
IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_virta_otp_opintopisteet_kuukausittain'
) 
BEGIN

CREATE TABLE dw.f_virta_otp_opintopisteet_kuukausittain  (

	id bigint IDENTITY(1,1) NOT NULL,
	hkoodi varchar(200) NULL,
	kk varchar(10) NULL,
	kuukausi smallint NULL,	
	laajuus float NULL,	 		
	[d_opryhma_id] [int]  NULL,			
	[d_ohjauksenala_id] [int]  NULL,
	opintosuoritusavain varchar(100) NULL,
	opiskelijaavain varchar(100) NULL,
	opiskeluoikeusavain varchar(100) NULL,	
	d_organisaatio_id [int] NOT NULL,	
	d_virta_os_luokittelu_id [int]  NULL,		
	suorituspaivamaara date NULL,  			
	vuosi int NULL,	
	loadtime datetime2(4)  NULL,
	source nvarchar(255) NULL,
	username nvarchar(128)  NULL,
	
  CONSTRAINT PK__f_virta_otp_opintopisteet_kuukausittain PRIMARY KEY CLUSTERED (id ASC)
)
END

GO

ALTER TABLE dw.f_virta_otp_opintopisteet_kuukausittain ADD  CONSTRAINT DF__f_virta_otp_opintopisteet_kuukausittain__loadtime  DEFAULT (getdate()) FOR loadtime
GO

ALTER TABLE dw.f_virta_otp_opintopisteet_kuukausittain ADD  CONSTRAINT DF__f_virta_otp_opintopisteet_kuukausittain__username  DEFAULT (suser_name()) FOR username
GO
 