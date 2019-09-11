USE ANTERO
GO
IF EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_yhteiskaksoistutkinnot'
) 
BEGIN
DROP TABLE sa.sa_virta_otp_yhteiskaksoistutkinnot
END


IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_yhteiskaksoistutkinnot'
) 
BEGIN


CREATE TABLE [sa].[sa_virta_otp_yhteiskaksoistutkinnot](

	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ika] [smallint] NULL,
	[kansalaisuus] [varchar](3) NULL,
	[kk] [varchar](10) NULL,
	[luokittelukoodi] [smallint] NULL,
	[opiskelijaavain] [varchar](200) NULL,
	[oppilaitoskoodi] [varchar](5) NULL,
	[sukupuoli] [smallint] NULL,
	[tutkintokoodi] [varchar](6) NULL,
	[tutkintovuosi] [int] NULL,
	
	[loadtime] [datetime2](4) NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NULL  
	
CONSTRAINT PK__sa_virta_otp_yhteiskaksoistutkinnot PRIMARY KEY CLUSTERED (	id ASC) 
) ;


ALTER TABLE sa.sa_virta_otp_yhteiskaksoistutkinnot ADD  CONSTRAINT DF__sa_virta_otp_yhteiskaksoistutkinnot__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_yhteiskaksoistutkinnot ADD  CONSTRAINT DF__sa_virta_otp_yhteiskaksoistutkinnot__username  DEFAULT (suser_name()) FOR username
;

END
