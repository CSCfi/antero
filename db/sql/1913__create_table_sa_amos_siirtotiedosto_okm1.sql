USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_amos_siirtotiedosto_okm1')
BEGIN
	DROP TABLE [sa].[sa_amos_siirtotiedosto_okm1];
END
GO
IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_amos_siirtotiedosto_okm1')

BEGIN
CREATE TABLE [sa].[sa_amos_siirtotiedosto_okm1](
  id bigint IDENTITY(1,1) NOT NULL,
  [vanha] [varchar](61) NOT NULL,
  [uusi] [varchar](50) NOT NULL,
  [voimaan_alkaen] [date] NOT NULL,
  [kommentti] [varchar](255) NULL,
  [tiedostonimi] [varchar](255) NULL,
  [latauspvm] [date] NULL,
	[lastmodified] [datetime] NULL,
		[source] [varchar](255) NULL,
  [username] [varchar](100) NULL,
  [loadtime] [datetime] NULL,
  CONSTRAINT [PK__sa_amos_siirtotiedosto_okm1] PRIMARY KEY CLUSTERED (id ASC))

END
GO

ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm1] ADD  CONSTRAINT [DF__sa_amos_siirtotiedosto_okm1__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm1] ADD  CONSTRAINT [DF__sa_amos_siirtotiedosto_okm1__username]  DEFAULT (suser_name()) FOR [username]
GO
