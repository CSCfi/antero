USE [Koski_SA]
GO

/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 5.2.2020 15:24:33 ******/
DROP TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]
GO

/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 5.2.2020 15:24:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[opintojen_rahoitus_koodi] [varchar](max) NULL,
	[suorituksen_tyyppi_koodi] [int] NOT NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[oppisopimus_koodi] [int] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetus_koodi] [int] NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[tutkinto] [varchar](100) NULL,
	[tutkinnon_osa] [bigint] NULL,
	[laajuus] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


USE [ANTERO]