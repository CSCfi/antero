USE [Koski_SA]
GO
/****** Object:  Table [sa].[temp_opintojen_kulku_tarkastelupaivat_1]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_tarkastelupaivat_1]
GO
/****** Object:  Table [sa].[temp_opintojen_kulku_sarja_kytkin]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_sarja_kytkin]
GO
/****** Object:  Table [sa].[temp_opintojen_kulku_kohortti]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_kohortti]
GO
/****** Object:  Table [sa].[temp_opintojen_kulku_kalenteri]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_kalenteri]
GO
/****** Object:  Table [sa].[temp_opintojen_kulku_4_koonti_temp]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_4_koonti_temp]
GO
/****** Object:  Table [sa].[temp_opintojen_kulku_4_koonti]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_4_koonti]
GO
/****** Object:  Table [sa].[temp_opintojen_kulku_3b_priorisoitu_tilanne_yleissivistava2aste]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_3b_priorisoitu_tilanne_yleissivistava2aste]
GO
/****** Object:  Table [sa].[temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen]
GO
/****** Object:  Table [sa].[temp_opintojen_kulku_2a_poiminta_yleissivistava2aste]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_2a_poiminta_yleissivistava2aste]
GO
/****** Object:  Table [sa].[temp_opintojen_kulku_2a_poiminta_valmentava]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_2a_poiminta_valmentava]
GO
/****** Object:  Table [sa].[temp_opintojen_kulku_2a_poiminta_ammatillinen]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_opintojen_kulku_2a_poiminta_ammatillinen]
GO
/****** Object:  Table [sa].[temp_koski_perusaste_keskiarvot]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_koski_perusaste_keskiarvot]
GO
/****** Object:  Table [sa].[temp_koski_opintojen_kulku_2d_taustatiedot]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_koski_opintojen_kulku_2d_taustatiedot]
GO
/****** Object:  Table [sa].[temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet]
GO
/****** Object:  Table [sa].[temp_koski_opintojen_kulku_2a_valmistumiset]    Script Date: 8.12.2021 11:46:24 ******/
DROP TABLE IF EXISTS [sa].[temp_koski_opintojen_kulku_2a_valmistumiset]
GO
/****** Object:  Table [sa].[temp_koski_opintojen_kulku_2a_valmistumiset]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_koski_opintojen_kulku_2a_valmistumiset](
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[vahvistus_paiva] [datetime] NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[oppimaara] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_koski_opintojen_kulku_2c_muut_opiskeluoikeudet](
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL,
	[tila] [varchar](100) NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[oppimaara] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_koski_opintojen_kulku_2d_taustatiedot]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_koski_opintojen_kulku_2d_taustatiedot](
	[koulutus_kytkin] [varchar](23) NULL,
	[kohortti_vp] [varchar](15) NULL,
	[oppija_oid] [varchar](150) NULL,
	[peruskoulu_keskiarvo] [decimal](10, 5) NULL,
	[peruskoulu_keskiarvo_lukuaineet] [decimal](10, 5) NULL,
	[peruskoulu_keskiarvo_kategoria_koodi] [int] NOT NULL,
	[jarj_peruskoulu_keskiarvo_lukuaineet_kategoria] [int] NOT NULL,
	[keskiarvo_kvintiili_koodi] [int] NOT NULL,
	[keskiarvo_lukuaineet_kvintiili_koodi] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_koski_perusaste_keskiarvot]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_koski_perusaste_keskiarvot](
	[oppija_oid] [varchar](150) NULL,
	[keskiarvo] [decimal](10, 5) NULL,
	[keskiarvo_lukuaineet] [decimal](10, 5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_opintojen_kulku_2a_poiminta_ammatillinen]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_opintojen_kulku_2a_poiminta_ammatillinen](
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[koulutus_kytkin] [varchar](23) NULL,
	[kohortti_vp] [varchar](15) NULL,
	[alkamispaiva] [datetime] NULL,
	[paattymispaiva] [datetime] NULL,
	[viimeisin_tila] [varchar](max) NULL,
	[alku_tarkastus] [datetime] NULL,
	[tarkastuspaiva] [datetime] NULL,
	[sarja] [bigint] NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[oppimaara] [varchar](255) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[lopputulema] [varchar](15) NULL,
	[sukupuoli] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[ika_aloittaessa] [int] NULL,
	[ika_paattyessa] [int] NULL,
	[kansalaisuus] [varchar](3) NULL,
	[tila] [varchar](100) NULL,
	[taso2] [varchar](max) NULL,
	[taso1] [varchar](15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_opintojen_kulku_2a_poiminta_valmentava]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_opintojen_kulku_2a_poiminta_valmentava](
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[koulutus_kytkin] [varchar](23) NULL,
	[kohortti_vp] [varchar](15) NULL,
	[alkamispaiva] [datetime] NULL,
	[paattymispaiva] [datetime] NULL,
	[viimeisin_tila] [varchar](max) NULL,
	[alku_tarkastus] [datetime] NULL,
	[tarkastuspaiva] [datetime] NULL,
	[sarja] [bigint] NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[oppimaara] [varchar](255) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[lopputulema] [varchar](15) NULL,
	[sukupuoli] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[ika_aloittaessa] [int] NULL,
	[ika_paattyessa] [int] NULL,
	[kansalaisuus] [varchar](3) NULL,
	[tila] [varchar](100) NULL,
	[taso2] [varchar](max) NULL,
	[taso1] [varchar](15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_opintojen_kulku_2a_poiminta_yleissivistava2aste]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_opintojen_kulku_2a_poiminta_yleissivistava2aste](
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[koulutus_kytkin] [varchar](23) NULL,
	[kohortti_vp] [varchar](15) NULL,
	[alkamispaiva] [datetime] NULL,
	[paattymispaiva] [datetime] NULL,
	[viimeisin_tila] [varchar](max) NULL,
	[alku_tarkastus] [datetime] NULL,
	[tarkastuspaiva] [datetime] NULL,
	[sarja] [bigint] NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[oppimaara] [varchar](255) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[lopputulema] [varchar](15) NULL,
	[sukupuoli] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[ika_aloittaessa] [int] NULL,
	[ika_paattyessa] [int] NULL,
	[kansalaisuus] [varchar](3) NULL,
	[tila] [varchar](100) NULL,
	[taso2] [varchar](max) NULL,
	[taso1] [varchar](15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_opintojen_kulku_3a_priorisoitu_tilanne_ammatillinen](
	[kohortti_vp] [varchar](15) NULL,
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[koulutus_kytkin] [varchar](23) NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[oppimaara] [int] NULL,
	[ika] [int] NULL,
	[ika_aloittaessa] [int] NULL,
	[ika_paattyessa] [int] NULL,
	[alkamispaiva] [datetime] NULL,
	[paattymispaiva] [datetime] NULL,
	[lopputulema] [varchar](15) NULL,
	[sarja] [bigint] NULL,
	[priorisoitu_tilanne_amm_koodi] [int] NOT NULL,
	[priorisoitu_tilanne_amm] [varchar](47) NOT NULL,
	[priorisoitu_tilanne_valmentava_koodi] [int] NULL,
	[priorisoitu_tilanne_valmentava] [int] NULL,
	[priorisoitu_tilanne_yleissivistava_koodi] [int] NULL,
	[priorisoitu_tilanne_yleissivistava] [int] NULL,
	[vaihtanut_jarjestajaa] [int] NULL,
	[vaihtanut_oppilaitosta] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_opintojen_kulku_3b_priorisoitu_tilanne_yleissivistava2aste]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_opintojen_kulku_3b_priorisoitu_tilanne_yleissivistava2aste](
	[kohortti_vp] [varchar](15) NULL,
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[koulutus_kytkin] [varchar](23) NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[oppimaara] [varchar](255) NULL,
	[ika] [int] NULL,
	[ika_aloittaessa] [int] NULL,
	[ika_paattyessa] [int] NULL,
	[alkamispaiva] [datetime] NULL,
	[paattymispaiva] [datetime] NULL,
	[lopputulema] [varchar](15) NULL,
	[sarja] [bigint] NULL,
	[priorisoitu_tilanne_amm_koodi] [int] NULL,
	[priorisoitu_tilanne_amm] [int] NULL,
	[priorisoitu_tilanne_valmentava_koodi] [int] NULL,
	[priorisoitu_tilanne_valmentava] [int] NULL,
	[priorisoitu_tilanne_yleissivistava_koodi] [int] NOT NULL,
	[priorisoitu_tilanne_yleissivistava] [varchar](38) NOT NULL,
	[vaihtanut_jarjestajaa] [int] NULL,
	[vaihtanut_oppilaitosta] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_opintojen_kulku_4_koonti]    Script Date: 8.12.2021 11:46:24 ******/
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
/****** Object:  Table [sa].[temp_opintojen_kulku_4_koonti_temp]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_opintojen_kulku_4_koonti_temp](
	[kohortti_vp] [varchar](15) NULL,
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[koulutus_kytkin] [varchar](23) NULL,
	[sarja] [bigint] NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[oppimaara] [varchar](255) NULL,
	[ika] [int] NULL,
	[ika_aloittaessa] [int] NULL,
	[ika_paattyessa] [int] NULL,
	[priorisoitu_tilanne_koodi] [int] NULL,
	[vaihtanut_jarjestajaa] [int] NULL,
	[vaihtanut_oppilaitosta] [int] NULL,
	[lopputulema] [varchar](15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_opintojen_kulku_kalenteri]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_opintojen_kulku_kalenteri](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[kalenteri_avain] [varchar](20) NOT NULL,
	[paivays] [date] NULL,
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[paiva] [int] NULL,
	[vuosipuolisko] [varchar](2) NULL,
	[vuosineljannes] [varchar](2) NULL,
	[kohortti_vp] [varchar](15) NOT NULL,
	[kohortti_vn] [varchar](15) NOT NULL,
	[eka_tarkastuspaiva_vp] [date] NULL,
	[eka_tarkastuspaiva_vn] [date] NULL,
	[kohortti_fi] [varchar](37) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_opintojen_kulku_kohortti]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_opintojen_kulku_kohortti](
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[koulutus_kytkin] [varchar](23) NULL,
	[kohortti_vp] [varchar](15) NULL,
	[alkamispaiva] [datetime] NULL,
	[paattymispaiva] [datetime] NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[viimeisin_tila] [varchar](max) NULL,
	[lopputulema] [varchar](15) NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[oppimaara] [varchar](255) NULL,
	[rnk] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_opintojen_kulku_sarja_kytkin]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_opintojen_kulku_sarja_kytkin](
	[kohortti_vp] [varchar](15) NOT NULL,
	[sarja] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_opintojen_kulku_tarkastelupaivat_1]    Script Date: 8.12.2021 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_opintojen_kulku_tarkastelupaivat_1](
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[koulutus_kytkin] [varchar](23) NULL,
	[kohortti_vp] [varchar](15) NULL,
	[alkamispaiva] [datetime] NULL,
	[paattymispaiva] [datetime] NULL,
	[viimeisin_tila] [varchar](max) NULL,
	[alku_tarkastus] [datetime] NULL,
	[tarkastuspaiva] [datetime] NULL,
	[sarja] [bigint] NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[oppimaara] [varchar](255) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[lopputulema] [varchar](15) NULL,
	[sukupuoli] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[ika_aloittaessa] [int] NULL,
	[ika_paattyessa] [int] NULL,
	[kansalaisuus] [varchar](3) NULL,
	[tila] [varchar](100) NULL,
	[taso2] [varchar](max) NULL,
	[taso1] [varchar](15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
