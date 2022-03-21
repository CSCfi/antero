USE [ANTERO]
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet]    Script Date: 23.10.2019 18:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijavuodet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_opiskelijavuodet](
	[vuosi] [int] NULL,
	[d_kalenteri_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_osa_aikaisuus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_majoitus_id] [int] NULL,
	[d_kytkin_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_kytkin_henkilostokoulutus_id] [int] NULL,
	[d_kytkin_tyovoimakoulutus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [nchar](10) NULL,
	[opiskelijavuodet] [decimal](20, 10) NULL,
	[opiskelijavuodet_hylatyt] [decimal](20, 10) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet_painotetut]    Script Date: 23.10.2019 18:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijavuodet_painotetut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_opiskelijavuodet_painotetut](
	[tilastovuosi] [int] NULL,
	[d_kalenteri_tilastokuukausi_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_osa_aikaisuus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_majoitus_id] [int] NULL,
	[d_kytkin_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_kytkin_henkilostokoulutus_id] [int] NULL,
	[d_kytkin_tyovoimakoulutus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [int] NULL,
	[opiskelijavuodet_painottamaton] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_yhteensa] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_pt] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_at_eat] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_valma_telma] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_opisk_valm_tukevat] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_muu] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_erityistuki] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_majoitus] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_henkilostokoulutus] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_tyovoimakoulutus] [decimal](20, 10) NULL,
	[opiskelijavuodet_painotettu_vankilaopetus] [decimal](20, 10) NULL,
	[opiskelijavuodet_hylatyt] [decimal](20, 10) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 23.10.2019 18:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tutkinnot_ja_tutkinnonosat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat](
	[Tilastovuosi] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [bigint] NULL,
	[koko_tutkinto] [int] NULL,
	[tutkinnon_osat] [int] NULL,
	[osaamispisteet] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 23.10.2019 18:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut](
	[tilastovuosi] [int] NOT NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [bigint] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[painottamaton_tutkinnot] [int] NULL,
	[painottamaton_osatutkinnot] [int] NULL,
	[painottamaton_osaamispisteet] [float] NULL,
	[painottamaton_osaamispisteet_summa] [float] NULL,
	[painotettu_tutkinnot_pt_kr_pk] [decimal](38, 6) NULL,
	[painotettu_tutkinnot_at_eat_kr_pk] [decimal](38, 6) NULL,
	[painotettu_tutkinnot_erityistuki] [decimal](23, 4) NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_pt_kr] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_erityistuki] [float] NULL,
	[painotettu_tutkinnot_yht] [decimal](38, 6) NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_yht] [float] NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]