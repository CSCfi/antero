USE [Koski_SA]
GO

/****** Object:  Table [sa].[toisen_asteen_tutkinnot]    Script Date: 29.7.2025 15.41.49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[toisen_asteen_tutkinnot]') AND type in (N'U'))
DROP TABLE [sa].[toisen_asteen_tutkinnot]
GO

/****** Object:  Table [sa].[toisen_asteen_tutkinnot]    Script Date: 29.7.2025 15.41.49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[toisen_asteen_tutkinnot](
	[master_oid] [varchar](50) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[sektori] [varchar](12) NOT NULL,
	[vahvistus_paiva] [date] NULL,
	[lukion_oppimaaran_vahvistus_paiva] [date] NULL,
	[rnk] [bigint] NULL,
	[rnk_sektori] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


