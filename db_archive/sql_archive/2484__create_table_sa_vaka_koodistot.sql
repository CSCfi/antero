USE ANTERO
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_vaka_koodistot')

BEGIN
DROP TABLE [sa].[sa_vaka_koodistot]
END

SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON
IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_vaka_koodistot')

BEGIN
CREATE TABLE [sa].[sa_vaka_koodistot](
    [id] [int] IDENTITY(0,1) NOT NULL,
    [oid] [nvarchar](200) NULL,
  	[vaka_koodisto] [nvarchar](100) NULL,
  	[koodiarvo] [nvarchar](10) NULL,
  	[alkupvm] [nvarchar](100) NULL,
  	[loppupvm] [nvarchar](100) NULL,
  	[loadtime] [datetime] NULL,
  	[source] [nvarchar](100) NULL,
  	[username] [nvarchar](100) NULL
    CONSTRAINT [PK__sa_vaka_koodistot] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF_sa_vaka_koodistot_loadtime]') AND type = 'D')
	BEGIN
		ALTER TABLE [sa].[sa_vaka_koodistot] ADD  CONSTRAINT [DF_sa_vaka_koodistot_loadtime]  DEFAULT (getdate()) FOR [loadtime]
	END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF_sa_vaka_koodistot_username]') AND type = 'D')
	BEGIN
		ALTER TABLE [sa].[sa_vaka_koodistot] ADD  CONSTRAINT [DF_sa_vaka_koodistot_username]  DEFAULT (suser_sname()) FOR [username]

	END
