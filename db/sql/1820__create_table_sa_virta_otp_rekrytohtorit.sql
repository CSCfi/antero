-- Rekrytointitiedonkeruu tohtorit Virta OTP:sta 
USE ANTERO
GO
IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_rekrytohtorit'
) 
BEGIN

CREATE TABLE sa.sa_virta_otp_rekrytohtorit  (

	[id] [bigint] IDENTITY(1,1) NOT NULL,
	
	[henkilonumero] [varchar](100) NULL,
	[rekrykorkeakoulu] [varchar](5) NULL,
	[tilastovuosi] [int] NULL,
	[tohtoritutkintokorkeakoulu] [varchar](5) NULL,
	[tohtoritutkintomaa] [varchar](3) NULL,
	[tohtoritutkintosuoritusvuosi] [int] NULL,
	
	loadtime datetime2(4)  NULL,
	source nvarchar(255) NULL,
	username nvarchar(128)  NULL,
	
  CONSTRAINT PK__sa_virta_otp_rekrytohtorit PRIMARY KEY CLUSTERED (id ASC)
)
END

GO

ALTER TABLE sa.sa_virta_otp_rekrytohtorit ADD  CONSTRAINT DF__sa_virta_otp_rekrytohtorit__loadtime  DEFAULT (getdate()) FOR loadtime
GO

ALTER TABLE sa.sa_virta_otp_rekrytohtorit ADD  CONSTRAINT DF__sa_virta_otp_rekrytohtorit__username  DEFAULT (suser_name()) FOR username
GO
 