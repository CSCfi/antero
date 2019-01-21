-- FF check ok Lukuvuosimaksuvelvolliset aloitusvuosi tieto lisätty
USE ANTERO
GO
IF EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_virta_otp_lukuvuosimaksuvelvolliset'
) BEGIN
	DROP TABLE dw.f_virta_otp_lukuvuosimaksuvelvolliset
END

GO
IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_virta_otp_lukuvuosimaksuvelvolliset'
) 
BEGIN

CREATE TABLE dw.f_virta_otp_lukuvuosimaksuvelvolliset  (

	[id] [bigint] IDENTITY(1,1) NOT NULL,	
	[aloitusvuosi] [int] NULL,	
	
	[tilastovuosi] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_ika_id] [int] NOT NULL,
	[d_maatjavaltiot_kansalaisuus_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NOT NULL,
	[d_organisaatioluokitus_jarjestaja_id] [int] NOT NULL,
	[lkm] [int] NOT NULL, 
	
	loadtime datetime2(4)  NULL,
	source nvarchar(255) NULL,
	username nvarchar(128)  NULL,
	
  CONSTRAINT PK__f_virta_otp_lukuvuosimaksuvelvolliset PRIMARY KEY CLUSTERED (id ASC)
)
END

GO

ALTER TABLE dw.f_virta_otp_lukuvuosimaksuvelvolliset ADD  CONSTRAINT DF__f_virta_otp_lukuvuosimaksuvelvolliset__loadtime  DEFAULT (getdate()) FOR loadtime
GO

ALTER TABLE dw.f_virta_otp_lukuvuosimaksuvelvolliset ADD  CONSTRAINT DF__f_virta_otp_lukuvuosimaksuvelvolliset__username  DEFAULT (suser_name()) FOR username
GO
 