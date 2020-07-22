USE [Koski_SA]
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]    Script Date: 22.7.2020 18:01:13 ******/
DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]    Script Date: 22.7.2020 18:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot](
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[alkamispaiva] [datetime] NULL,
	[sisaltyy_toiseen] [int] NOT NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[diaarinumero] [varchar](max) NULL,
	[diaarinumero_tutkinto_koodi] [int] NULL,
	[diaarinumero_tutkinto_osaamisala_koodi] [int] NULL,
	[tila] [varchar](100) NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL,
	[oppisopimus] [int] NULL,
	[opintojen_rahoitus_koodi] [varchar](max) NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetuksessa] [int] NULL,
	[paatason_suoritus_id] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [ANTERO]