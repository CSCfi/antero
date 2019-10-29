USE [Koski_SA]
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 29.10.2019 9:59:03 ******/
DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]
GO
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 29.10.2019 9:59:03 ******/
DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu_unpivot]    Script Date: 29.10.2019 9:59:03 ******/
DROP TABLE IF EXISTS [dbo].[opiskelijavuodet_valitaulu_unpivot]
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu]    Script Date: 29.10.2019 9:59:03 ******/
DROP TABLE IF EXISTS [dbo].[opiskelijavuodet_valitaulu]
GO
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu]    Script Date: 29.10.2019 9:59:03 ******/
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
/****** Object:  Table [dbo].[opiskelijavuodet_valitaulu_unpivot]    Script Date: 29.10.2019 9:59:03 ******/
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
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 29.10.2019 9:59:03 ******/
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
	[koulutusmoduuli_koodiarvo] [varchar](250) NULL,
	[koulutusmoduuli_koodiarvo_numeerinen] [varchar](250) NULL,
	[diaarinumero] [varchar](max) NULL,
	[diaarinumero_tutkinnonosa_koodi] [int] NULL,
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
/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 29.10.2019 9:59:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty](
	[koulutustoimija_oid] [varchar](max) NULL,
	[opintojen_rahoitus_koodi] [varchar](max) NULL,
	[suorituksen_tyyppi_koodi] [int] NOT NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[oppisopimus_koodi] [int] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[tutkinto] [varchar](max) NULL,
	[tutkinnon_osa] [bigint] NULL,
	[laajuus] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
USE [ANTERO]