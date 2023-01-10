USE [Koski_SA]
GO

/****** Object:  Table [sa].[temp_opintojen_kulku_4_koonti]    Script Date: 10.1.2023 19:49:44 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_4_koonti]
GO

/****** Object:  Table [sa].[temp_opintojen_kulku_4_koonti]    Script Date: 10.1.2023 19:49:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[temp_opintojen_kulku_4_koonti](
	[kohortti_vp] [varchar](15) NULL,
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[ika] [int] NULL,
	[ika_aloittaessa] [int] NULL,
	[ika_paattyessa] [int] NULL,
	[perusopetuksen_suoritusvuosi] [int] NULL,
	[peruskoulu_keskiarvo_kategoria_koodi] [int] NULL,
	[keskiarvo_kvintiili_koodi] [int] NULL,
	[keskiarvo_lukuaineet_kvintiili_koodi] [int] NULL,
	[peruskoulu_keskiarvo_lukuaineet_kategoria] [int] NULL,
	[kansalaisuus_koodi] [varchar](3) NULL,
	[sukupuoli_koodi] [varchar](50) NULL,
	[aidinkieli_koodi] [varchar](50) NULL,
	[koulutus_kytkin] [varchar](23) NULL,
	[sarja] [bigint] NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[oppimaara] [varchar](255) NULL,
	[priorisoitu_tilanne_koodi] [int] NULL,
	[vaihtanut_jarjestajaa] [int] NULL,
	[vaihtanut_oppilaitosta] [int] NULL,
	[lopputulema] [varchar](15) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


