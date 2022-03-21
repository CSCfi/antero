USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_ehoks_perustiedot_laajempi'
) BEGIN
DROP TABLE sa.sa_ehoks_perustiedot_laajempi
END

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_ehoks_perustiedot_laajempi'
) BEGIN

CREATE TABLE [sa].[sa_ehoks_perustiedot_laajempi](
  [id] [bigint] IDENTITY(1,1) NOT NULL,
	[ehoks_id] [int] NULL,
	[oppija_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[ensikertainen_hyvaksyminen] [datetime] NULL,
	[hyvaksytty] [datetime] NULL,
	[urasuunnitelma_koodi] [varchar](100) NULL,
	[osaamisen_hankkimisen_tarve] [bit] NULL,
	[opiskeluvalmiuksia_tukevat_opinnot] [bit] NULL,
	[paivitetty] [datetime] NULL,
	[imp_created_date] [datetime] NULL,
	[imp_load_file] [varchar](100) NULL,
	[hankittavat_ammat_tutkinnon_osat] [varchar](max) NULL,
	[hankittavat_yhteiset_tutkinnon_osat] [varchar](max) NULL,
	[aiemmin_hankitut_ammat_tutkinnon_osat] [varchar](max) NULL,
	[aiemmin_hankitut_paikalliset_tutkinnon_osat] [varchar](max) NULL,
	[aiemmin_hankitut_yhteiset_tutkinnon_osat] [varchar](max) NULL,
	[hankittavat_paikalliset_tutkinnon_osat] [varchar](max) NULL,
	[opiskeluvalmiuksia_tukevat_opinnot_json] [varchar](max) NULL,
	[loadtime] [datetime]  NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](255) NOT NULL,
	CONSTRAINT PK_ehoks_perustiedot PRIMARY KEY CLUSTERED (id ASC)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE sa.sa_ehoks_perustiedot_laajempi ADD  CONSTRAINT DF__sa_ehoks_perustiedot_laajempi__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_ehoks_perustiedot_laajempi ADD  CONSTRAINT DF__sa_ehoks_perustiedot_laajempi__username  DEFAULT (suser_name()) FOR username
;

END

GO
