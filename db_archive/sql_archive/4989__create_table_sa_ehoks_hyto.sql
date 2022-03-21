USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_ehoks_hyto'
) BEGIN
DROP TABLE sa.sa_ehoks_hyto
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_ehoks_hyto')
BEGIN
	CREATE TABLE [sa].[sa_ehoks_hyto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ehoks_id] [varchar](20) NULL,
	[module_id] [varchar](100) NULL,
	[tutkinnon_osa_koodi] [varchar](100) NULL,
	[tutkinnon_osa_koodi_versio] [varchar](100) NULL,
	[olennainen-seikka] [bit] NULL,
	[oppija_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[osa_alue_koodi] [varchar](100) NULL,
	[imp_created_date] [datetime] NULL,
	[imp_load_file] [varchar](100) NULL,
	[loadtime] [datetime]  NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](255) NOT NULL,
	CONSTRAINT PK_ehoks_hyto PRIMARY KEY CLUSTERED (id ASC)
) ON [PRIMARY]
ALTER TABLE sa.sa_ehoks_hyto ADD  CONSTRAINT DF__sa_ehoks_hyto__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_ehoks_hyto ADD  CONSTRAINT DF__sa_ehoks_hyto__username  DEFAULT (suser_name()) FOR username
;

END

GO
