-- Kansainvalinen yhteis tai kaksoistutkinto
USE ANTERO
GO

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_kansainvalisettutkinnot'
) 
BEGIN


CREATE TABLE sa.sa_virta_otp_kansainvalisettutkinnot (

	[id] [bigint] IDENTITY(1,1) NOT NULL,
	
	[kpl] [int] NULL,
	[luokittelukoodi] [varchar](3) NULL,
	[oppilaitos] [varchar](5) NULL,
	[tutkintokoodi] [varchar](6) NULL,
	[vuosi] [int] NULL,
	
	[loadtime] [datetime2](4) NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NULL 
	
)  

ALTER TABLE sa.sa_virta_otp_kansainvalisettutkinnot ADD  CONSTRAINT DF__sa_virta_otp_kansainvalisettutkinnot__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_kansainvalisettutkinnot ADD  CONSTRAINT DF__sa_virta_otp_kansainvalisettutkinnot__username  DEFAULT (suser_name()) FOR username
;

END