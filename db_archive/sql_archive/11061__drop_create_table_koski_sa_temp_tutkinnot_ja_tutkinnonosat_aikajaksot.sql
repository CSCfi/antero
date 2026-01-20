USE [Koski_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]') AND type in (N'U'))
DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot](
	[master_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[alkamispaiva] [datetime] NULL,
	[sisaltyy_toiseen] [int] NOT NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[tila] [varchar](50) NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL,
	[oppisopimus] [int] NULL,
	[opintojen_rahoitus_koodi] [varchar](50) NULL,
	[maksuton] [int] NULL,
	[oikeutta_maksuttomuuteen_pidennetty] [bit] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetuksessa] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
