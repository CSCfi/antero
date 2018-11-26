-- Lukuvuosi maksulliset Virta OTP:sta uusi aloitusvuosi tieto 
USE ANTERO
GO
IF EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_lukuvuosimaksuvelvolliset'
) BEGIN
DROP TABLE sa.sa_virta_otp_lukuvuosimaksuvelvolliset
END

GO
IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_lukuvuosimaksuvelvolliset'
) 
BEGIN

CREATE TABLE sa.sa_virta_otp_lukuvuosimaksuvelvolliset  (

	[id] [bigint] IDENTITY(1,1) NOT NULL,
	
	[aloitusvuosi] [int] NULL,
	
	[henkilo] [varchar](50) NULL,
	[ika] [smallint] NULL,
	[kansalaisuus] [varchar](3) NULL,
	[koulutuskoodi] [varchar](6) NULL,
	[oppilaitos] [varchar](5) NULL,
	[sukupuoli] [smallint] NULL,
	[vuosi] [int] NULL,
	
	loadtime datetime2(4)  NULL,
	source nvarchar(255) NULL,
	username nvarchar(128)  NULL,
	
  CONSTRAINT PK__sa_virta_otp_lukuvuosimaksuvelvolliset PRIMARY KEY CLUSTERED (id ASC)
)
END

GO

ALTER TABLE sa.sa_virta_otp_lukuvuosimaksuvelvolliset ADD  CONSTRAINT DF__sa_virta_otp_lukuvuosimaksuvelvolliset__loadtime  DEFAULT (getdate()) FOR loadtime
GO

ALTER TABLE sa.sa_virta_otp_lukuvuosimaksuvelvolliset ADD  CONSTRAINT DF__sa_virta_otp_lukuvuosimaksuvelvolliset__username  DEFAULT (suser_name()) FOR username
GO
 