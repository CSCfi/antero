USE [Koski_SA]
GO
/****** Object:  Table [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus_vanha]    Script Date: 22.10.2019 20:40:42 ******/
DROP TABLE IF EXISTS [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus_vanha]
GO
/****** Object:  Table [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus]    Script Date: 22.10.2019 20:40:42 ******/
DROP TABLE IF EXISTS [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus]
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus]    Script Date: 22.10.2019 20:40:42 ******/
DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus]
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 22.10.2019 20:40:42 ******/
DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu_unpivot]    Script Date: 22.10.2019 20:40:42 ******/
DROP TABLE IF EXISTS [dbo].[opiskelijavuodet_valitaulu_unpivot]
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu]    Script Date: 22.10.2019 20:40:42 ******/
DROP TABLE IF EXISTS [dbo].[opiskelijavuodet_valitaulu]
GO
/****** Object:  Table [dbo].[kustannusryhma_tutkinto_ja_osaamisala]    Script Date: 22.10.2019 20:40:42 ******/
DROP TABLE IF EXISTS [dbo].[kustannusryhma_tutkinto_ja_osaamisala]
GO
/****** Object:  Table [dbo].[kustannusryhma_osasuoritus]    Script Date: 22.10.2019 20:40:42 ******/
DROP TABLE IF EXISTS [dbo].[kustannusryhma_osasuoritus]
GO
/****** Object:  Table [dbo].[eperusteet_tutkinnonosa_tutkinto_kustannusryhma]    Script Date: 22.10.2019 20:40:42 ******/
DROP TABLE IF EXISTS [dbo].[eperusteet_tutkinnonosa_tutkinto_kustannusryhma]
GO
/****** Object:  Table [dbo].[eperusteet_osaamisalat_tutkinnonosat_laajuudet]    Script Date: 22.10.2019 20:40:42 ******/
DROP TABLE IF EXISTS [dbo].[eperusteet_osaamisalat_tutkinnonosat_laajuudet]
GO
/****** Object:  Table [dbo].[eperusteet_osaamisalat_tutkinnonosat_laajuudet]    Script Date: 22.10.2019 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eperusteet_osaamisalat_tutkinnonosat_laajuudet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[eperusteet_osaamisalat_tutkinnonosat_laajuudet](
	[eperusteid] [int] NULL,
	[diaarinumero] [varchar](100) NULL,
	[diaarivuosi] [int] NULL,
	[diaarinumero_tutkinto_osaamisala_tutkinnonosa_koodi] [varchar](403) NULL,
	[diaarinumero_tutkinto_osaamisala_koodi] [varchar](302) NULL,
	[diaarinumero_tutkinnonosa_koodi] [varchar](201) NULL,
	[diaarinumero_tutkinto_tutkinnonosa_koodi] [varchar](302) NULL,
	[diaarinumero_tutkinto_koodi] [varchar](201) NULL,
	[tutkinto_ja_tutkinnonosa_koodi] [varchar](41) NULL,
	[tutkintotyyppi] [nvarchar](200) NULL,
	[tutkinto_koodi] [varchar](10) NULL,
	[tutkinto] [varchar](1000) NULL,
	[tutkinnon_laajuus] [int] NULL,
	[osaamisala_koodi] [int] NULL,
	[osaamisala] [varchar](300) NULL,
	[tutkinnonosa] [varchar](300) NULL,
	[tutkinnonosa_koodi] [int] NULL,
	[tutkinnonosa_laajuus] [int] NULL,
	[tutkinnonosa_pakollinen] [int] NULL,
	[eperuste_tila] [varchar](100) NULL,
	[eperuste_voimassaoloalkaa] [datetime] NULL,
	[eperuste_voimassaololoppuu] [datetime] NULL,
	[eperuste_paatospvm] [datetime] NULL,
	[eperuste_siirtymapaattyy] [datetime] NULL,
	[rnk] [bigint] NULL,
	[rnk2] [bigint] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[eperusteet_tutkinnonosa_tutkinto_kustannusryhma]    Script Date: 22.10.2019 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eperusteet_tutkinnonosa_tutkinto_kustannusryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[eperusteet_tutkinnonosa_tutkinto_kustannusryhma](
	[tutkinnonosa_koodi] [int] NULL,
	[tutkinto_koodi] [varchar](10) NULL,
	[osaamisala_koodi] [varchar](10) NULL,
	[kuuluu_useaan_tutkintoon] [int] NOT NULL,
	[kuuluu_eri_kustannusryhmiin] [int] NULL,
	[kuuluu_useaan_tutkintoon_yksi_kustannusryhma] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[kustannusryhma_osasuoritus]    Script Date: 22.10.2019 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kustannusryhma_osasuoritus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kustannusryhma_osasuoritus](
	[tutkinnonosa_koodi] [varchar](10) NULL,
	[tutkinnonosa_nimi_fi] [varchar](500) NULL,
	[tutkinto_koodi] [varchar](10) NULL,
	[tutkinto_nimi_fi] [varchar](500) NULL,
	[osaamisala_koodi] [varchar](10) NULL,
	[osaamisala_nimi_fi] [varchar](500) NULL,
	[kustannusryhma_koodi] [varchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[kustannusryhma_tutkinto_ja_osaamisala]    Script Date: 22.10.2019 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kustannusryhma_tutkinto_ja_osaamisala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kustannusryhma_tutkinto_ja_osaamisala](
	[diaarinumero_tutkinto_ja_osaamisala_koodi] [varchar](142) NULL,
	[tutkinto_ja_osaamisala_koodi] [varchar](41) NULL,
	[tutkinto_koodi] [varchar](10) NULL,
	[osaamisala_koodi] [varchar](6) NULL,
	[tutkinto_kustannusryhma_koodi] [varchar](10) NULL,
	[osaamisala_kustannusryhma_koodi] [varchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu]    Script Date: 22.10.2019 20:40:42 ******/
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
	[oppija_oid] [varchar](max) NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
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
	[tunn_oid] [varchar](max) NULL,
	[jarj_oid] [varchar](max) NULL,
	[toim_oid] [varchar](100) NULL,
	[kustannusryhma] [varchar](50) NULL,
	[suorituksen_tyyppi] [int] NOT NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[osaamisala] [varchar](50) NULL,
	[opiskelijavuosi_lasna] [decimal](20, 10) NULL,
	[opiskelijavuosi_loma] [decimal](20, 10) NULL,
	[opiskelijavuosi_opva] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_loma] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_amm] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_lukio] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_perusop_lisaopetus] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_sisaltyy_toiseen] [decimal](20, 10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu_unpivot]    Script Date: 22.10.2019 20:40:42 ******/
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
	[oppija_oid] [varchar](max) NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
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
	[tunn_oid] [varchar](max) NULL,
	[jarj_oid] [varchar](max) NULL,
	[toim_oid] [varchar](100) NULL,
	[suorituksen_tyyppi] [int] NOT NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[osaamisala] [varchar](50) NULL,
	[kustannusryhma] [varchar](50) NULL,
	[hylkaamisen_peruste] [int] NULL,
	[hyvaksytaan] [int] NULL,
	[op_vuodet] [numeric](27, 11) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 22.10.2019 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu](
	[toimipiste_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[suoritustason_tunniste] [bigint] NULL,
	[koulutusmoduuli_koodiarvo] [int] NULL,
	[koulutusmoduuli_koodiarvo_numeerinen] [int] NULL,
	[diaarinumero] [varchar](max) NULL,
	[diaarinumero_tutkinnonosa_koodi] [int] NULL,
	[koulutusmoduuli_laajuus_yksikko] [int] NULL,
	[koulutusmoduuli_laajuus_arvo_alkup] [float] NULL,
	[tos_koulutusmoduuli_laajuus_arvo] [float] NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[osaamisala_koodiarvo] [int] NULL,
	[tutkinto_ja_osaamisala_koodi] [int] NULL,
	[diaarinumero_tutkinto_koodi] [int] NULL,
	[diaarinumero_tutkinto_ja_osaamisala_koodi] [int] NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[alkup_kustannusryhmakoodi] [varchar](10) NULL,
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
	[paataso] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus]    Script Date: 22.10.2019 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus](
	[ol_organisaatio_koodi] [varchar](20) NULL,
	[opintojen_rahoitus_koodi] [varchar](max) NULL,
	[suorituksen_tyyppi_koodi] [int] NOT NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[oppisopimus_koodi] [int] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[count_tutkinnot_ml_oppisopimuskoulutus] [varchar](max) NULL,
	[count_tutkinnon_osat] [bigint] NULL,
	[sum_osaamispisteet] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus]    Script Date: 22.10.2019 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus](
	[diaarinumero] [varchar](50) NULL,
	[tutkinnonosa_laajuus] [float] NULL,
	[lahde] [varchar](255) NULL,
	[pvm] [date] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus_vanha]    Script Date: 22.10.2019 20:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus_vanha]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus_vanha](
	[diaarinumero] [varchar](50) NULL,
	[tutkinnonosa_laajuus] [float] NULL,
	[lahde] [varchar](255) NULL,
	[pvm] [date] NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]