USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_ehoks_hato'
) BEGIN
DROP TABLE sa.sa_ehoks_hato
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_ehoks_hato')
BEGIN
	CREATE TABLE [sa].[sa_ehoks_hato](
		[id] [bigint] IDENTITY(1,1) NOT NULL,
		[ehoks_id] [int] NULL,
		[tutkinnon_osa_koodi] [varchar](100) NULL,
		[tutkinnon_osa_koodi_versio] [int] NULL,
		[osaamisen_osoittaminen] [varchar](max) NULL,
		[module_id] [varchar](100) NULL,
		[hankkimistavat_module_id] [varchar](100) NULL,
		[olennainen_seikka] [bit] NULL,
		[koulutuksen_jarjestaja_oid] [varchar](100) NULL,
		[oppija_oid] [varchar](100) NULL,
		[opiskeluoikeus_oid] [varchar](100) NULL,
		[osaamisen_hankkimistapa_koodi] [varchar](100) NULL,
		[vastuullinen_tyopaikkaohjaaja] [varchar](300) NULL,
		[keskeiset_tyotehtavat] [varchar](max) NULL,
		[tyopaikan_nimi] [varchar](500) NULL,
		[tyopaikan_ytunnus] [varchar](100) NULL,
		[alku] [datetime] NULL,
		[loppu] [datetime] NULL,
		[imp_created_date] [datetime] NULL,
		[imp_load_file] [varchar](100) NULL,
		[loadtime] [datetime]  NOT NULL,
		[source] [nvarchar](255) NULL,
		[username] [nvarchar](255) NOT NULL,
		CONSTRAINT PK_ehoks_hato PRIMARY KEY CLUSTERED (id ASC)
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE sa.sa_ehoks_hato ADD  CONSTRAINT DF__sa_ehoks_hato__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_ehoks_hato ADD  CONSTRAINT DF__sa_ehoks_hato__username  DEFAULT (suser_name()) FOR username
;

END

GO
