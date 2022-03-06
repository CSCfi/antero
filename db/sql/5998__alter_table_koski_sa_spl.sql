USE [Koski_SA]
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]    Script Date: 6.3.2022 18:42:27 ******/
DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 6.3.2022 18:42:27 ******/
DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 6.3.2022 18:42:27 ******/
DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]    Script Date: 6.3.2022 18:42:27 ******/
DROP TABLE IF EXISTS [dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu_unpivot]    Script Date: 6.3.2022 18:42:27 ******/
DROP TABLE IF EXISTS [dbo].[opiskelijavuodet_valitaulu_unpivot]
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu]    Script Date: 6.3.2022 18:42:27 ******/
DROP TABLE IF EXISTS [dbo].[opiskelijavuodet_valitaulu]
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu]    Script Date: 6.3.2022 18:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijavuodet_valitaulu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opiskelijavuodet_valitaulu](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[tilv_date] [date] NULL,
	[oppija_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[osa_aikaisuus] [int] NOT NULL,
	[oppis] [varchar](50) NULL,
	[erityisopetus] [int] NOT NULL,
	[majoitus] [int] NOT NULL,
	[vankilaopetus] [varchar](50) NULL,
	[henkilostokoulutus] [int] NULL,
	[tyovoimakoulutus] [int] NOT NULL,
	[koulk] [char](6) NULL,
	[diaarinumero] [varchar](20) NULL,
	[koulk_pihvi] [char](6) NULL,
	[diaarinumero_pihvi] [varchar](20) NULL,
	[koulutusmuoto_pihvi] [varchar](100) NULL,
	[tunn_oid] [varchar](100) NULL,
	[jarj_oid] [varchar](100) NULL,
	[jarj_oid_hist] [varchar](100) NULL,
	[jarj_oid_pihvi] [varchar](100) NULL,
	[jarj_oid_pihvi_hist] [varchar](100) NULL,
	[toim_oid] [varchar](100) NULL,
	[kustannusryhma] [varchar](50) NULL,
	[suorituksen_tyyppi] [varchar](250) NOT NULL,
	[suorituksen_kieli] [varchar](50) NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[osaamisala] [varchar](50) NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[alkamispaiva] [date] NULL,
	[tutkosaa_pienempi_tt] [char](2) NULL,
	[opiskelijavuosi_lasna] [decimal](30, 20) NULL,
	[opiskelijavuosi_loma] [decimal](30, 20) NULL,
	[opiskelijavuosi_opva] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_loma] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_amm] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_lukio] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus] [decimal](30, 20) NULL,
	[hylatty_opiskelijavuosi_sisaltyy_toiseen] [decimal](30, 20) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu_unpivot]    Script Date: 6.3.2022 18:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijavuodet_valitaulu_unpivot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opiskelijavuodet_valitaulu_unpivot](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[tilv_date] [date] NULL,
	[oppija_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[osa_aikaisuus] [int] NOT NULL,
	[oppis] [varchar](50) NULL,
	[erityisopetus] [int] NOT NULL,
	[majoitus] [int] NOT NULL,
	[vankilaopetus] [varchar](50) NULL,
	[henkilostokoulutus] [int] NULL,
	[tyovoimakoulutus] [int] NOT NULL,
	[koulk] [varchar](50) NULL,
	[diaarinumero] [varchar](20) NULL,
	[koulk_pihvi] [char](6) NULL,
	[diaarinumero_pihvi] [varchar](20) NULL,
	[koulutusmuoto_pihvi] [varchar](100) NULL,
	[tunn_oid] [varchar](100) NULL,
	[jarj_oid] [varchar](100) NULL,
	[jarj_oid_hist] [varchar](100) NULL,
	[jarj_oid_pihvi] [varchar](100) NULL,
	[jarj_oid_pihvi_hist] [varchar](100) NULL,
	[toim_oid] [varchar](100) NULL,
	[suorituksen_tyyppi] [int] NOT NULL,
	[suorituksen_kieli] [varchar](50) NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[osaamisala] [varchar](50) NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[alkamispaiva] [date] NULL,
	[tutkosaa_pienempi_tt] [char](2) NULL,
	[kustannusryhma] [varchar](50) NULL,
	[hylkaamisen_peruste] [int] NULL,
	[hyvaksytaan] [int] NULL,
	[op_vuodet] [decimal](30, 20) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]    Script Date: 6.3.2022 18:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[opiskelijavuodet_valitaulu_unpivot_luvat](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[tilv_date] [date] NULL,
	[oppija_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[osa_aikaisuus] [int] NOT NULL,
	[oppis] [varchar](50) NULL,
	[erityisopetus] [int] NOT NULL,
	[majoitus] [int] NOT NULL,
	[vankilaopetus] [varchar](50) NULL,
	[henkilostokoulutus] [int] NULL,
	[tyovoimakoulutus] [int] NOT NULL,
	[koulk] [varchar](50) NULL,
	[diaarinumero] [varchar](20) NULL,
	[koulk_pihvi] [char](6) NULL,
	[diaarinumero_pihvi] [varchar](20) NULL,
	[koulutusmuoto_pihvi] [varchar](100) NULL,
	[tunn_oid] [varchar](100) NULL,
	[jarj_oid] [varchar](100) NULL,
	[jarj_oid_hist] [varchar](100) NULL,
	[jarj_oid_pihvi] [varchar](100) NULL,
	[jarj_oid_pihvi_hist] [varchar](100) NULL,
	[toim_oid] [varchar](100) NULL,
	[suorituksen_tyyppi] [int] NOT NULL,
	[suorituksen_kieli] [varchar](50) NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[osaamisala] [varchar](50) NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[alkamispaiva] [date] NULL,
	[tutkosaa_pienempi_tt] [char](2) NULL,
	[kustannusryhma] [varchar](50) NULL,
	[hylkaamisen_peruste] [int] NULL,
	[hyvaksytaan] [int] NULL,
	[op_vuodet] [decimal](30, 20) NULL,
	[lupa_koulutus] [int] NOT NULL,
	[lupa_majoitus] [int] NOT NULL,
	[lupa_korotustekija] [int] NOT NULL,
	[lupa_suorituskieli] [varchar](50) NULL,
	[verrataan_lupatietoihin] [nvarchar](10) NULL,
	[lupa_jarj_nimi] [nvarchar](255) NULL,
	[lupa_jarj_ytunnus] [varchar](20) NULL,
	[lupa_koulutus_laaja_oppis] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 6.3.2022 18:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[koulutustoimija_oid_hist] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi_hist] [varchar](100) NULL,
	[oppija_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[hankintakoulutus] [int] NULL,
	[alkamispaiva] [date] NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[suoritustason_tunniste] [bigint] NULL,
	[koulutusmoduuli_koodiarvo] [varchar](250) NULL,
	[koulutusmoduuli_koodiarvo_numeerinen] [varchar](250) NULL,
	[diaarinumero] [varchar](max) NULL,
	[diaarinumero_tutkinnonosa_koodi] [int] NULL,
	[koulutusmoduuli_laajuus_arvo_alkup] [float] NULL,
	[tos_koulutusmoduuli_laajuus_arvo] [float] NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[osaamisala_koodiarvo] [int] NULL,
	[diaarinumero_tutkinto_koodi] [int] NULL,
	[diaarinumero_tutkinto_ja_osaamisala_koodi] [int] NULL,
	[suorituskieli_koodiarvo] [varchar](10) NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[ep_usean_tutkinnon_tutkinnonosa] [int] NULL,
	[yhteinen_tutkinnon_osa] [int] NULL,
	[toisesta_tutkinnosta_sisallytetty_tutkinnonosa] [int] NULL,
	[suorittaa_koko_tutkintoa] [int] NULL,
	[arviointi_paiva] [datetime] NULL,
	[vahvistus_paiva] [datetime] NULL,
	[opintojen_rahoitus_koodi] [varchar](max) NULL,
	[suorituksen_tyyppi] [varchar](max) NULL,
	[oppisopimus_koodi] [int] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetus_koodi] [int] NULL,
	[paataso] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 6.3.2022 18:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[sukupuoli] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[koulutustoimija_oid_hist] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi_hist] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[hankintakoulutus] [int] NULL,
	[alkamispaiva] [date] NULL,
	[opintojen_rahoitus_koodi] [varchar](max) NULL,
	[suorituksen_tyyppi_koodi] [int] NOT NULL,
	[suorituskieli_koodiarvo] [varchar](10) NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[oppisopimus_koodi] [int] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetus_koodi] [int] NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[tutkinnot] [int] NULL,
	[tutkinnon_osat] [int] NULL,
	[osaamispisteet] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]    Script Date: 6.3.2022 18:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[sukupuoli] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[koulutustoimija_oid_hist] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi_hist] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[hankintakoulutus] [int] NULL,
	[alkamispaiva] [date] NULL,
	[opintojen_rahoitus_koodi] [varchar](max) NULL,
	[suorituksen_tyyppi_koodi] [int] NOT NULL,
	[suorituskieli_koodiarvo] [varchar](10) NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[oppisopimus_koodi] [int] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetus_koodi] [int] NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[tutkinnot] [int] NULL,
	[tutkinnon_osat] [int] NULL,
	[osaamispisteet] [float] NULL,
	[lupa_koulutus] [int] NOT NULL,
	[lupa_korotustekija] [int] NOT NULL,
	[lupa_suorituskieli] [varchar](10) NULL,
	[verrataan_lupatietoihin] [nvarchar](10) NULL,
	[lupa_jarj_nimi] [nvarchar](255) NULL,
	[lupa_jarj_ytunnus] [varchar](20) NULL,
	[lupa_tutk_nimi] [varchar](1000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
USE ANTERO