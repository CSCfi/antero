USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot_generoi_hyvaksytty_korotustekija]    Script Date: 6.3.2022 18:38:31 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot_generoi_hyvaksytty_korotustekija]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]    Script Date: 6.3.2022 18:38:31 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 6.3.2022 18:38:31 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 6.3.2022 18:38:31 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot_generoi_hyvaksytty_korotustekija]    Script Date: 6.3.2022 18:38:31 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot_generoi_hyvaksytty_korotustekija]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot]    Script Date: 6.3.2022 18:38:31 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]    Script Date: 6.3.2022 18:38:31 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet]    Script Date: 6.3.2022 18:38:31 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet]
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]    Script Date: 6.3.2022 18:38:31 ******/
DROP TABLE IF EXISTS [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 6.3.2022 18:38:31 ******/
DROP TABLE IF EXISTS [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 6.3.2022 18:38:31 ******/
DROP TABLE IF EXISTS [dw].[f_amos_tutkinnot_ja_tutkinnonosat]
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet_painotetut_unpivot]    Script Date: 6.3.2022 18:38:31 ******/
DROP TABLE IF EXISTS [dw].[f_amos_opiskelijavuodet_painotetut_unpivot]
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet_painotetut]    Script Date: 6.3.2022 18:38:31 ******/
DROP TABLE IF EXISTS [dw].[f_amos_opiskelijavuodet_painotetut]
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet]    Script Date: 6.3.2022 18:38:31 ******/
DROP TABLE IF EXISTS [dw].[f_amos_opiskelijavuodet]
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet]    Script Date: 6.3.2022 18:38:31 ******/
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
	[d_koulutusluokitus_pihvi_id] [int] NULL,
	[d_koulutusluokitus_tutk_osaa_pienempi_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_jarj_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_hist_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_kieli_suoritus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [nchar](10) NULL,
	[d_kytkin_verrataan_lupatietoihin_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_majoitus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kieli_suoritus_luvanmukainen_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[opiskelijavuodet] [decimal](30, 20) NULL,
	[opiskelijavuodet_hylatyt] [decimal](30, 20) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet_painotetut]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijavuodet_painotetut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_opiskelijavuodet_painotetut](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
	[d_koulutusluokitus_tutk_osaa_pienempi_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_jarj_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_hist_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_kieli_suoritus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_majoitus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kieli_suoritus_luvanmukainen_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[d_kytkin_sisaopp_ov_ylittyy_id] [int] NULL,
	[d_kytkin_erityistuen_ov_ylittyy_id] [int] NULL,
	[d_kytkin_oppivelvollisuus_id] [int] NULL,
	[opiskelijavuodet_painottamaton] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_yhteensa] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_pt] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_at_eat] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_valma_telma] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_opisk_valm_tukevat] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_muu] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_erityistuki] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_erityistuki_hyv] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_majoitus] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_majoitus_hyv] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_henkilostokoulutus] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_tyovoimakoulutus] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_vankilaopetus] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_oppivelvollisuus] [decimal](30, 20) NULL,
	[opiskelijavuodet_hylatyt] [decimal](30, 20) NULL,
	[loadtime] [datetime] NULL,
 CONSTRAINT [PK_f_amos_opiskelijavuodet_painotetut] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_opiskelijavuodet_painotetut_unpivot]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_opiskelijavuodet_painotetut_unpivot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_opiskelijavuodet_painotetut_unpivot](
	[id] [int] NOT NULL,
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
	[d_koulutusluokitus_tutk_osaa_pienempi_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [int] NULL,
	[d_organisaatioluokitus_jarj_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarj_pihvi_hist_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_kieli_suoritus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[muu_ammatillinen_tarkenne] [char](5) NULL,
	[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_majoitus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kieli_suoritus_luvanmukainen_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[d_kytkin_sisaopp_ov_ylittyy_id] [int] NULL,
	[d_kytkin_erityistuen_ov_ylittyy_id] [int] NULL,
	[d_kytkin_oppivelvollisuus_id] [int] NULL,
	[d_amos_painotuksen_tyyppi_id] [int] NULL,
	[painotettu] [decimal](30, 20) NULL,
	[painottamaton] [decimal](30, 20) NULL,
	[hylatty] [decimal](30, 20) NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tutkinnot_ja_tutkinnonosat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat](
	[Tilastovuosi] [int] NULL,
	[d_kalenteri_id] [int] NULL,
	[d_kalenteri_alkamispaiva_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_kieli_suoritus_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_hist_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_kytkin_verrataan_lupatietoihin_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kieli_suoritus_luvanmukainen_id] [int] NULL,
	[diaarinumero] [varchar](50) NULL,
	[koko_tutkinto] [int] NULL,
	[tutkinnon_osat] [int] NULL,
	[osaamispisteet] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[d_kalenteri_id] [int] NULL,
	[d_kalenteri_alkamispaiva_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_hist_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_kieli_suoritus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kieli_suoritus_luvanmukainen_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[painottamaton_tutkinnot] [float] NULL,
	[painottamaton_osatutkinnot] [float] NULL,
	[painottamaton_osaamispisteet] [float] NULL,
	[painottamaton_osaamispisteet_summa] [float] NULL,
	[painotettu_tutkinnot_pt_kr_pk] [float] NULL,
	[painotettu_tutkinnot_at_eat_kr_pk] [float] NULL,
	[painotettu_tutkinnot_erityistuki] [float] NULL,
	[painotettu_tutkinnot_erityistuki_hyv] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_pt_kr] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_erityistuki] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv] [float] NULL,
	[painotettu_tutkinnot_yht] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_yht] [float] NULL,
 CONSTRAINT [PK_f_amos_tutkinnot_ja_tutkinnonosat_painotetut] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot](
	[id] [int] NOT NULL,
	[tilastovuosi] [int] NULL,
	[d_kalenteri_id] [int] NULL,
	[d_kalenteri_alkamispaiva_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_hist_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_kieli_suoritus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kieli_suoritus_luvanmukainen_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[painottamaton_osaamispisteet_summa] [float] NULL,
	[d_amos_painotuksen_tyyppi_id] [int] NULL,
	[laskentaan_hyvaksyttava] [int] NOT NULL,
	[painottamaton_tutkinnot_ja_osaamispisteet] [float] NULL,
	[painotettu_tutkinnot_ja_osaamispisteet] [float] NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_opiskelijavuodet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet] AS' 
END
GO




ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet] AS


TRUNCATE TABLE [ANTERO].[dw].[f_amos_opiskelijavuodet]

INSERT INTO ANTERO.dw.f_amos_opiskelijavuodet (
	 vuosi
	,d_kalenteri_id
	,d_sukupuoli_id
	,d_kieli_aidinkieli_id
	,d_ika_id
	,d_osa_aikaisuus_id
	,d_erityisopetus_id
	,d_majoitus_id
	,d_kytkin_oppisopimuskoulutus_id
	,d_kytkin_vankilaopetus_id
	,d_kytkin_henkilostokoulutus_id
	,d_kytkin_tyovoimakoulutus_id
	,d_koulutusluokitus_id
	,d_koulutusluokitus_pihvi_id
	,d_koulutusluokitus_tutk_osaa_pienempi_id
	,d_organisaatioluokitus_oppilaitos_id
	,d_organisaatioluokitus_jarj_id
	,d_organisaatioluokitus_jarj_hist_id
	,d_organisaatioluokitus_jarj_pihvi_id
	,d_organisaatioluokitus_jarj_pihvi_hist_id
	,d_organisaatioluokitus_toimipiste_id
	,d_amos_spl_jarjestaja_linkki_id
	,d_kustannusryhma_id
	,d_suorituksen_tyyppi_id
	,d_kieli_suoritus_id
	,d_opintojenrahoitus_id
	,d_osaamisala_id
	,muu_ammatillinen_tarkenne
	,d_amos_spl_opiskelijavuodet_hylkaamisperuste_id
	,d_kytkin_verrataan_lupatietoihin_id
	,d_amos_luvaton_koulutus_id
	,d_amos_luvaton_majoitus_id
	,d_amos_luvaton_korotustekija_id
	,d_kieli_suoritus_luvanmukainen_id
	,d_kytkin_hankintakoulutus_id
	,opiskelijavuodet
	,opiskelijavuodet_hylatyt
	,loadtime
)

SELECT 
	
	 q.vuosi
	,d_kalenteri_id = COALESCE(d1.id,-1)
	,d_sukupuoli_id = COALESCE(d2.id,-1)
	,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
	,d_ika_id = COALESCE(d4.id,-1)
	,d_osa_aikaisuus_id = COALESCE(d20.id,-1)
	,d_erityisopetus_id = COALESCE(d5.id,-1)
	,d_majoitus_id = COALESCE(d6.id,-1)
	,d_kytkin_oppisopimuskoulutus_id = COALESCE(d7.id,-1)
	,d_kytkin_vankilaopetus_id = COALESCE(d8.id,-1)
	,d_kytkin_henkilostokoulutus_id = COALESCE(d9.id,-1)
	,d_kytkin_tyovoimakoulutus_id = COALESCE(d10.id,-1)
	,d_koulutusluokitus_id = COALESCE(d11a.id,-1)
	,d_koulutusluokitus_pihvi_id = COALESCE(d11b.id,-1)
	,d_koulutusluokitus_tutk_osaa_pienempi_id = COALESCE(d11c.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d13.id,-1)
	,d_organisaatioluokitus_jarj_hist_id = COALESCE(d13c.id,-1)
	,d_organisaatioluokitus_jarj_pihvi_id = COALESCE(d13d.id,-1)
	,d_organisaatioluokitus_jarj_pihvi_hist_id = COALESCE(d13e.id,-1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d18.id,-1)
	,d_amos_spl_jarjestaja_linkki_id = COALESCE(d13b.id,-1)
	,d_kustannusryhma_id = COALESCE(d15.id,-1)
	,d_suorituksen_tyyppi_id = COALESCE(d14.id,-1)
	,d_kieli_suoritus_id = COALESCE(d26.id,-1)
	,d_opintojenrahoitus_id = COALESCE(d16.id,-1)
	,d_osaamisala_id = COALESCE(d17.id,-1)
	,muu_ammatillinen_tarkenne = COALESCE(muu_ammatillinen_tarkenne, -1)
	,d_amos_spl_opiskelijavuodet_hylkaamisperuste = COALESCE(d19.id,-1)
	,d_kytkin_verrataan_lupatietoihin_id = COALESCE(d21.id,-1)
	,d_amos_luvaton_koulutus_id = COALESCE(d22.id,-1)
	,d_amos_luvaton_majoitus_id = COALESCE(d23.id,-1)
	,d_amos_luvaton_korotustekija_id = COALESCE(d24.id,-1)
	,d_kieli_luvanmukainen_suoritus_id = COALESCE(d27.id,-1)
	,d_kytkin_hankintakoulutus_id = COALESCE(d25.id,-1)
	,opiskelijavuodet = SUM(case when q.hyvaksytaan = 1 then op_vuodet else 0 end)
	,opiskelijavuodet_hylatyt = SUM(case when q.hyvaksytaan = 0 then op_vuodet else 0 end)
	,GETDATE()
	
FROM [Koski_SA].[dbo].[opiskelijavuodet_valitaulu_unpivot_luvat] q
LEFT JOIN dw.d_kalenteri d1 ON d1.kalenteri_avain = q.tilv_date
LEFT JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi = q.sukupuoli
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi = q.aidinkieli
LEFT JOIN dw.d_ika d4 ON d4.ika_avain = q.ika
LEFT JOIN dw.d_erityisopetus d5 ON d5.erityisopetus_koodi = q.erityisopetus
LEFT JOIN dw.d_majoitus d6 ON d6.majoitus_koodi = q.majoitus
LEFT JOIN dw.d_kytkin d7 ON d7.kytkin_koodi = q.oppis
LEFT JOIN dw.d_kytkin d8 ON d8.kytkin_koodi = q.vankilaopetus
LEFT JOIN dw.d_kytkin d9 ON d9.kytkin_koodi = q.henkilostokoulutus
LEFT JOIN dw.d_kytkin d10 ON d10.kytkin_koodi = q.tyovoimakoulutus
LEFT JOIN dw.d_koulutusluokitus d11a ON d11a.koulutusluokitus_koodi = q.koulk
LEFT JOIN dw.d_koulutusluokitus d11b ON d11b.koulutusluokitus_koodi = q.koulk_pihvi
LEFT JOIN (
	select distinct
		tutkintotyyppi_koodi
		,id = (select top 1 id from dw.d_koulutusluokitus d1 where tutkintotyyppi_koodi = d.tutkintotyyppi_koodi)
	from dw.d_koulutusluokitus d
) d11c ON d11c.tutkintotyyppi_koodi = q.tutkosaa_pienempi_tt
LEFT JOIN dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = q.tunn_oid
LEFT JOIN dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = q.jarj_oid
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d13b ON d13b.oid_avain = q.jarj_oid
LEFT JOIN dw.d_organisaatioluokitus d13c ON d13c.organisaatio_oid = q.jarj_oid_hist
LEFT JOIN dw.d_organisaatioluokitus d13d ON d13d.organisaatio_oid = q.jarj_oid_pihvi
LEFT JOIN dw.d_organisaatioluokitus d13e ON d13e.organisaatio_oid = q.jarj_oid_pihvi_hist
LEFT JOIN dw.d_suorituksen_tyyppi d14 ON d14.koodi = q.suorituksen_tyyppi
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d15 ON d15.koodi = q.kustannusryhma
LEFT JOIN dw.d_opintojenrahoitus d16 ON d16.koodi = q.opintojen_rahoitus
LEFT JOIN dw.d_osaamisala d17 ON d17.koodi = q.osaamisala
LEFT JOIN dw.d_organisaatioluokitus d18 ON d18.organisaatio_oid = q.toim_oid
LEFT JOIN dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste d19 ON d19.koodi = q.hylkaamisen_peruste
LEFT JOIN dw.d_kytkin d20 ON d20.kytkin_koodi = q.osa_aikaisuus
LEFT JOIN dw.d_kytkin d25 ON d25.kytkin_koodi = (case when q.jarj_oid_pihvi is null then 0 else 1 end)
LEFT JOIN dw.d_kytkin d21 ON d21.kytkin_koodi = q.verrataan_lupatietoihin
LEFT JOIN dw.d_amos_luvaton_koulutus d22 ON d22.koodi = q.lupa_koulutus
LEFT JOIN dw.d_amos_luvaton_majoitus d23 ON d23.koodi = q.lupa_majoitus
LEFT JOIN dw.d_amos_luvaton_korotustekija d24 ON d24.koodi = q.lupa_korotustekija
LEFT JOIN dw.d_kieli d26 ON d26.kieli_koodi = q.suorituksen_kieli
LEFT JOIN dw.d_kieli d27 ON d27.kieli_koodi = q.lupa_suorituskieli


GROUP BY 
q.vuosi
,d1.id
,d2.id
,d3.id
,d4.id
,d5.id
,d6.id
,d7.id
,d8.id
,d9.id
,d10.id
,d11a.id
,d11b.id
,d11c.id
,d12.id
,d13.id
,d13b.id
,d13c.id
,d13d.id
,d13e.id
,d14.id
,d15.id
,d16.id
,d17.id
,d18.id
,d19.id
,d20.id
,d21.id
,d22.id
,d23.id
,d24.id
,d25.id
,d26.id
,d27.id
,muu_ammatillinen_tarkenne


GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut] AS' 
END
GO




ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut] AS


TRUNCATE TABLE [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut]

INSERT INTO dw.f_amos_opiskelijavuodet_painotetut (
	 [tilastovuosi]
    ,[d_kalenteri_tilastokuukausi_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_osa_aikaisuus_id]
    ,[d_erityisopetus_id]
    ,[d_majoitus_id]
    ,[d_kytkin_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_kytkin_henkilostokoulutus_id]
    ,[d_kytkin_tyovoimakoulutus_id]
    ,[d_koulutusluokitus_id]
	,[d_koulutusluokitus_tutk_osaa_pienempi_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_jarj_id]
	,[d_organisaatioluokitus_jarj_hist_id]
	,[d_organisaatioluokitus_jarj_pihvi_id]
	,[d_organisaatioluokitus_jarj_pihvi_hist_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
    ,[d_opintojenrahoitus_id]
	,[d_osaamisala_id]
	,[muu_ammatillinen_tarkenne]
	,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_majoitus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_kytkin_sisaopp_ov_ylittyy_id]
	,[d_kytkin_erityistuen_ov_ylittyy_id]
	,[d_kytkin_oppivelvollisuus_id]
    ,[opiskelijavuodet_painottamaton]
    ,[opiskelijavuodet_painotettu_pt]
    ,[opiskelijavuodet_painotettu_at_eat]
    ,[opiskelijavuodet_painotettu_valma_telma]
    ,[opiskelijavuodet_painotettu_opisk_valm_tukevat]
    ,[opiskelijavuodet_painotettu_muu]
    ,[opiskelijavuodet_painotettu_erityistuki]
	,[opiskelijavuodet_painotettu_erityistuki_hyv]
    ,[opiskelijavuodet_painotettu_majoitus]
	,[opiskelijavuodet_painotettu_majoitus_hyv]
    ,[opiskelijavuodet_painotettu_henkilostokoulutus]
    ,[opiskelijavuodet_painotettu_tyovoimakoulutus]
    ,[opiskelijavuodet_painotettu_vankilaopetus]
	,[opiskelijavuodet_painotettu_oppivelvollisuus]
	,[opiskelijavuodet_hylatyt]
	,[opiskelijavuodet_painotettu_yhteensa]
	,loadtime
)

SELECT  
	 *
	,[opiskelijavuodet_painotettu_yhteensa] = [opiskelijavuodet_painotettu_pt] + [opiskelijavuodet_painotettu_at_eat] + [opiskelijavuodet_painotettu_valma_telma] + [opiskelijavuodet_painotettu_opisk_valm_tukevat] + [opiskelijavuodet_painotettu_muu] + [opiskelijavuodet_painotettu_erityistuki_hyv] + [opiskelijavuodet_painotettu_majoitus_hyv] + [opiskelijavuodet_painotettu_henkilostokoulutus] + [opiskelijavuodet_painotettu_tyovoimakoulutus] + [opiskelijavuodet_painotettu_vankilaopetus] + [opiskelijavuodet_painotettu_oppivelvollisuus]
	,GETDATE()

FROM (

	SELECT 
		[tilastovuosi] = f.[vuosi]
		,[d_kalenteri_id]
		,[d_sukupuoli_id]
		,[d_kieli_aidinkieli_id]
		,[d_ika_id]
		,[d_osa_aikaisuus_id]
		,[d_erityisopetus_id]
		,[d_majoitus_id]
		,[d_kytkin_oppisopimuskoulutus_id]
		,[d_kytkin_vankilaopetus_id]
		,[d_kytkin_henkilostokoulutus_id]
		,[d_kytkin_tyovoimakoulutus_id]
		,[d_koulutusluokitus_id]
		,[d_koulutusluokitus_tutk_osaa_pienempi_id]
		,[d_organisaatioluokitus_oppilaitos_id]
		,f.[d_organisaatioluokitus_jarj_id]
		,[d_organisaatioluokitus_jarj_hist_id]
		,[d_organisaatioluokitus_jarj_pihvi_id]
		,[d_organisaatioluokitus_jarj_pihvi_hist_id]
		,[d_organisaatioluokitus_toimipiste_id]
		,[d_amos_spl_jarjestaja_linkki_id]
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id]
		,[d_kieli_suoritus_id]
		,[d_opintojenrahoitus_id]
		,[d_osaamisala_id]
		,[muu_ammatillinen_tarkenne]
		,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
		,[d_amos_luvaton_koulutus_id]
		,[d_amos_luvaton_majoitus_id]
		,[d_amos_luvaton_korotustekija_id]
		,[d_kieli_suoritus_luvanmukainen_id]
		,[d_kytkin_hankintakoulutus_id]	
		,[d_kytkin_sisaopp_ov_ylittyy_id] = case when coalesce(som.ov_sisa,0) > coalesce(jl.sisaoppilaitosmuotoinen,999999) then 1 else 2 end
		,[d_kytkin_erityistuen_ov_ylittyy_id] = case when coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,999999) then 1 else 2 end
		,[d_kytkin_oppivelvollisuus_id] = d13.id

		,[opiskelijavuodet_painottamaton] = [opiskelijavuodet]
		,[opiskelijavuodet_painotettu_pt] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.vuosi+2 = varainhoitovuosi) *
			( 
					(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
			)

		,[opiskelijavuodet_painotettu_at_eat] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
			( 
					(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
			)

		,[opiskelijavuodet_painotettu_valma_telma] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_6' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='vt' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_opisk_valm_tukevat] =
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_7' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='ot' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_muu] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='muu' then opiskelijavuodet else 0 end)
			

		,[opiskelijavuodet_painotettu_erityistuki] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_14' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='3' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_18' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='7' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_19' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='8' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_20' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='9' then opiskelijavuodet else 0 end)
	
		,[opiskelijavuodet_painotettu_erityistuki_hyv] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_14' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='3' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='4' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then cast(opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) as decimal(25,20)) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='5' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then cast(opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) as decimal(25,20)) else 0 end) 
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='6' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then cast(opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) as decimal(25,20)) else 0 end) 
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_18' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='7' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='7' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then cast(opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) as decimal(25,20)) else 0 end) 
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_19' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='8' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='8' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then cast(opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) as decimal(25,20)) else 0 end) 
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_20' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='9' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='9' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then cast(opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) as decimal(25,20)) else 0 end) 
	
		

		,[opiskelijavuodet_painotettu_majoitus] =
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='3' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_majoitus_hyv] =
		-- luvan ylittävät sisäoppilaitosmuotoisen koulutuksen opiskelijavuodet painotetaan tavallisen majoituksen opiskelijavuosien painolla
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet when d7.majoitus_koodi='3' and coalesce(som.ov_sisa,0) > coalesce(jl.sisaoppilaitosmuotoinen,0) and coalesce(jl.sisaoppilaitosmuotoinen,0) > 0 then cast(opiskelijavuodet-opiskelijavuodet*(jl.sisaoppilaitosmuotoinen/som.ov_sisa) as decimal(23,20)) else 0 end) 
	+	(case when d11.koodi = 2 then (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) else (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and f.vuosi+2 = varainhoitovuosi) end) * (case when d7.majoitus_koodi='3' and (coalesce(som.ov_sisa,0) <= coalesce(jl.sisaoppilaitosmuotoinen,0) or coalesce(jl.sisaoppilaitosmuotoinen,0)=0) then opiskelijavuodet when d7.majoitus_koodi='3' and coalesce(som.ov_sisa,0) > coalesce(jl.sisaoppilaitosmuotoinen,0) then cast(opiskelijavuodet*(jl.sisaoppilaitosmuotoinen/som.ov_sisa) as decimal(23,20)) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)


		,[opiskelijavuodet_painotettu_henkilostokoulutus] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_25' and f.vuosi+2 = varainhoitovuosi) * 
			(
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.vuosi+2 = varainhoitovuosi) *
				( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
				)
			+
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
				( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
				)
			)
		+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and f.vuosi+2 = varainhoitovuosi) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d2.koodi='muu' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and kerroin_koodi='tk_27' and f.vuosi+2 = varainhoitovuosi)  * 
			(
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
				( 
				  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
				)
			)
		+	coalesce((select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and kerroin_koodi='tk_28' and f.vuosi+2 = varainhoitovuosi), 0)  * 
				(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and d2.koodi='muu' then opiskelijavuodet else 0 end)
			
		,[opiskelijavuodet_painotettu_vankilaopetus] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='vankilaopetus'and f.vuosi+2 = varainhoitovuosi) * (case when d3.kytkin_koodi = '1' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_oppivelvollisuus] = f.opiskelijavuodet * coalesce(sa1.kerroin,0)

		,[opiskelijavuodet_hylatyt]

	FROM [ANTERO].[dw].[f_amos_opiskelijavuodet] f
	left join dw.d_koulutusluokitus d1 on d1.id = coalesce(nullif(f.d_koulutusluokitus_tutk_osaa_pienempi_id,'-1'), f.d_koulutusluokitus_id)
	left join dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	left join dw.d_kytkin d3 on d3.id = f.d_kytkin_vankilaopetus_id
	left join dw.d_kytkin d4 on d4.id = f.d_kytkin_tyovoimakoulutus_id
	left join dw.d_kytkin d5 on d5.id = f.d_kytkin_henkilostokoulutus_id
	left join dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	left join dw.d_majoitus d7 on d7.id = f.d_majoitus_id
	left join dw.d_amos_luvaton_korotustekija d8 on d8.id = f.d_amos_luvaton_korotustekija_id
	left join dw.d_organisaatioluokitus d9 on d9.id = f.d_organisaatioluokitus_jarj_id
	left join dw.d_kalenteri d10 on d10.id = f.d_kalenteri_id
	left join dw.d_amos_luvaton_majoitus d11 on d11.id = f.d_amos_luvaton_majoitus_id
	left join dw.d_ika d12 on d12.id = f.d_ika_id
	left join dw.d_suorituksen_tyyppi d14 on d14.id = f.d_suorituksen_tyyppi_id
	left join sa.amos_opiskelijavuodet_oppivelvollisuuskerroin sa1 on d10.paivays between alkaa and paattyy and coalesce(nullif(d12.ika_avain,-1),99) <= sa1.ikaraja and d1.tutkintotyyppi_koodi in ('02','19','91') and d14.koodi in (1,2)
	left join dw.d_kytkin d13 on d13.kytkin_koodi = (case when sa1.kerroin is not null then 1 else 0 end)
	--sisäoppilaitosmuotoisen majoituksen opiskelijavuodet summa per vuosi
	left join (
		select 
			vuosi
			,d_organisaatioluokitus_jarj_id
			,ov_sisa = sum(opiskelijavuodet)
		from dw.f_amos_opiskelijavuodet f
		left join dw.d_majoitus d1 on d1.id=f.d_majoitus_id
		left join dw.d_amos_luvaton_koulutus d2 on d2.id = f.d_amos_luvaton_koulutus_id
		where d1.majoitus_koodi='3' and d2.koodi=1
		group by vuosi,d_organisaatioluokitus_jarj_id
	) som on som.vuosi=f.vuosi and som.d_organisaatioluokitus_jarj_id=f.d_organisaatioluokitus_jarj_id
	--vaativan erityisen tuen opiskelijavuodet summa per vuosi
	left join (
		select 
			vuosi
			,d_organisaatioluokitus_jarj_id
			,ov = sum(opiskelijavuodet)
		from dw.f_amos_opiskelijavuodet f
		left join dw.d_erityisopetus d1 on d1.id=f.d_erityisopetus_id
		left join dw.d_amos_luvaton_koulutus d2 on d2.id = f.d_amos_luvaton_koulutus_id
		where d1.jarjestys_erityisopetus_ryhma='3' and d2.koodi=1
		group by vuosi,d_organisaatioluokitus_jarj_id
	) vet on vet.vuosi=f.vuosi and vet.d_organisaatioluokitus_jarj_id=f.d_organisaatioluokitus_jarj_id

	--järjestämisluvan rajoite sisäoppilaitosmuotoiselle majoitukselle ja vaativalle erityiselle tuelle
	left join sa.v_amos_oiva_opiskelijavuodet_rajoite jl on jl.jarjestajaYtunnus=d9.organisaatio_koodi and d10.paivays between jl.alkupvm and jl.loppupvm

) q


--UNION ALL

/* 2018 TIETOJA EI NÄYTETÄ ENÄÄ LIVERAPORTILLA */

INSERT INTO dw.f_amos_opiskelijavuodet_painotetut (
	 [tilastovuosi]
    ,[d_kalenteri_tilastokuukausi_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_osa_aikaisuus_id]
    ,[d_erityisopetus_id]
    ,[d_majoitus_id]
    ,[d_kytkin_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_kytkin_henkilostokoulutus_id]
    ,[d_kytkin_tyovoimakoulutus_id]
    ,[d_koulutusluokitus_id]
	,[d_koulutusluokitus_tutk_osaa_pienempi_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_jarj_id]
	,[d_organisaatioluokitus_jarj_hist_id]
	,[d_organisaatioluokitus_jarj_pihvi_id]
	,[d_organisaatioluokitus_jarj_pihvi_hist_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
    ,[d_opintojenrahoitus_id]
	,[d_osaamisala_id]
	,[muu_ammatillinen_tarkenne]
	,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_majoitus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_kytkin_sisaopp_ov_ylittyy_id]
	,[d_kytkin_erityistuen_ov_ylittyy_id]
	,[d_kytkin_oppivelvollisuus_id]
    ,[opiskelijavuodet_painottamaton]
    ,[opiskelijavuodet_painotettu_pt]
    ,[opiskelijavuodet_painotettu_at_eat]
    ,[opiskelijavuodet_painotettu_valma_telma]
    ,[opiskelijavuodet_painotettu_opisk_valm_tukevat]
    ,[opiskelijavuodet_painotettu_muu]
    ,[opiskelijavuodet_painotettu_erityistuki]
	,[opiskelijavuodet_painotettu_erityistuki_hyv]
    ,[opiskelijavuodet_painotettu_majoitus]
	,[opiskelijavuodet_painotettu_majoitus_hyv]
    ,[opiskelijavuodet_painotettu_henkilostokoulutus]
    ,[opiskelijavuodet_painotettu_tyovoimakoulutus]
    ,[opiskelijavuodet_painotettu_vankilaopetus]
	,[opiskelijavuodet_painotettu_oppivelvollisuus]
	,[opiskelijavuodet_hylatyt]
	,[opiskelijavuodet_painotettu_yhteensa]
	,loadtime
)

SELECT 
	*
	,[opiskelijavuodet_painotettu_yhteensa] = [opiskelijavuodet_painotettu_pt] + [opiskelijavuodet_painotettu_at_eat] + [opiskelijavuodet_painotettu_valma_telma] + [opiskelijavuodet_painotettu_opisk_valm_tukevat] + [opiskelijavuodet_painotettu_muu] + [opiskelijavuodet_painotettu_erityistuki] + [opiskelijavuodet_painotettu_majoitus] + [opiskelijavuodet_painotettu_henkilostokoulutus] + [opiskelijavuodet_painotettu_tyovoimakoulutus] + [opiskelijavuodet_painotettu_vankilaopetus]
	,GETDATE()
FROM (

	SELECT  
		 [tilastovuosi]
		,[d_kalenteri_id] = '-1'
		,[d_sukupuoli_id] = '-1'
		,[d_kieli_aidinkieli_id] = '-1'
		,[d_ika_id] = '-1'
		,[d_osa_aikaisuus_id] = '-1'
		,[d_erityisopetus_id]
		,[d_majoitus_id] 
		,[d_kytkin_oppisopimuskoulutus_id]
		,[d_kytkin_vankilaopetus_id]
		,[d_kytkin_henkilostokoulutus_id]
		,[d_kytkin_tyovoimakoulutus_id]
		,[d_koulutusluokitus_id] = '-1'
		,[d_koulutusluokitus_tutk_osaa_pienempi_id] = '-1'
		,[d_organisaatioluokitus_oppilaitos_id] = '-1'
		,[d_organisaatioluokitus_jarj_id]
		,[d_organisaatioluokitus_jarj_hist_id] = '-1'
		,[d_organisaatioluokitus_jarj_pihvi_id] = '-1'
		,[d_organisaatioluokitus_jarj_pihvi_hist_id] = '-1'
		,[d_organisaatioluokitus_toimipiste_id] = '-1'
		,[d_amos_spl_jarjestaja_linkki_id]
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id] = '-1'
		,[d_kieli_suoritus_id] = '-1'
		,[d_opintojenrahoitus_id]
		,[d_osaamisala_id] = '-1'
		,[muu_ammatillinen_tarkenne] = '-1'
		,[d_amos_spl_opiskelijavuodet_hylkaamisperuste] = '9'
		,[d_amos_luvaton_koulutus_id] = '0'
		,[d_amos_luvaton_majoitus_id] = '0'
		,[d_amos_luvaton_korotustekija_id] = '0'
		,[d_kytkin_hankintakoulutus_id] = '-1'
		,[d_kytkin_sisaopp_ov_ylittyy_id] = '2'
		,[d_kytkin_erityistuen_ov_ylittyy_id] = '2'
		,[d_kytkin_oppivelvollisuus_id] = '2'

		,[opiskelijavuodet_painottamaton] = sum(eioppis_eivankila) + sum(henkilosto_eioppis_eivankila) + sum(majoitus_eioppis_eivankila) + sum(tyovoima_eioppis_eivankila) + sum(tyovoima_henkilosto_eioppis_eivankila) + sum(oppis) + sum(henkilosto_oppis) + sum(majoitus_oppis) + sum(vankila)
		,[opiskelijavuodet_painotettu_pt] = 0 
		,[opiskelijavuodet_painotettu_at_eat] = 0
		,[opiskelijavuodet_painotettu_valma_telma] = 0
		,[opiskelijavuodet_painotettu_opisk_valm_tukevat]  = 0
		,[opiskelijavuodet_painotettu_muu] = 
		  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and v.tilastovuosi+2 = varainhoitovuosi) * 
			(sum(eioppis_eivankila) + sum(henkilosto_eioppis_eivankila) + sum(majoitus_eioppis_eivankila) + sum(tyovoima_eioppis_eivankila) + sum(tyovoima_henkilosto_eioppis_eivankila) + sum(oppis) + sum(henkilosto_oppis) + sum(majoitus_oppis) + sum(vankila))
		
		,[opiskelijavuodet_painotettu_erityistuki] = 0

		,[opiskelijavuodet_painotettu_erityistuki_hyv] = 0
		
		,[opiskelijavuodet_painotettu_majoitus] = 
			(sum(majoitus_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(majoitus_oppis) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))

		,[opiskelijavuodet_painotettu_majoitus_hyv] = 
			(sum(majoitus_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(majoitus_oppis) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))
		
		,[opiskelijavuodet_painotettu_henkilostokoulutus] = 
		  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and v.tilastovuosi+2 = varainhoitovuosi) * 
			(
			(sum(henkilosto_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(tyovoima_henkilosto_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(henkilosto_oppis) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and v.tilastovuosi+2 = varainhoitovuosi))
			)
		
		,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 
		  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and v.tilastovuosi+2 = varainhoitovuosi) * 
			(sum(tyovoima_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and v.tilastovuosi+2 = varainhoitovuosi))
		
		,[opiskelijavuodet_painotettu_vankilaopetus] = 
			(sum(vankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='vankilaopetus'and v.tilastovuosi+2 = varainhoitovuosi))
		
		,[opiskelijavuodet_painotettu_oppivelvollisuus] = 0
		,[opiskelijavuodet_hylatyt] = 0

	FROM [sa].[v_amos_muut_tutkinnot] v
	GROUP BY v.tilastovuosi,d_kytkin_oppisopimuskoulutus_id,d_kytkin_vankilaopetus_id,d_kytkin_henkilostokoulutus_id,d_kytkin_tyovoimakoulutus_id,d_organisaatioluokitus_jarj_id,d_kustannusryhma_id,d_opintojenrahoitus_id,d_erityisopetus_id,d_majoitus_id,d_amos_spl_jarjestaja_linkki_id

) q2


GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot] AS' 
END
GO





ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot] AS


DROP TABLE IF EXISTS [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut_unpivot]


SELECT 
	 unpvt.[id]
	,[tilastovuosi]
    ,[d_kalenteri_tilastokuukausi_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_osa_aikaisuus_id]
    ,[d_erityisopetus_id]
    ,[d_majoitus_id]
    ,[d_kytkin_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_kytkin_henkilostokoulutus_id]
    ,[d_kytkin_tyovoimakoulutus_id]
    ,[d_koulutusluokitus_id]
    ,[d_koulutusluokitus_tutk_osaa_pienempi_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_jarj_id]
    ,[d_organisaatioluokitus_jarj_hist_id]
    ,[d_organisaatioluokitus_jarj_pihvi_id]
    ,[d_organisaatioluokitus_jarj_pihvi_hist_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
    ,[d_opintojenrahoitus_id]
    ,[d_osaamisala_id]
    ,[muu_ammatillinen_tarkenne]
    ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] =
		case 
			when opv_tyyppi = 'opiskelijavuodet_hylatty_painotettu_erityistuki' and opv_summa > 0 then (select id from dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste where koodi = '8')
			when opv_tyyppi = 'opiskelijavuodet_hylatty_painotettu_majoitus' and opv_summa > 0 and d_amos_luvaton_majoitus_id = 0 then (select id from dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste where koodi = '7')
			else d_amos_spl_opiskelijavuodet_hylkaamisperuste_id
		end
    ,[d_amos_luvaton_koulutus_id]
    ,[d_amos_luvaton_majoitus_id] =
		case
			when opv_tyyppi in ('opiskelijavuodet_hylatty_painotettu_majoitus' ,'opiskelijavuodet_painottamaton') then d_amos_luvaton_majoitus_id
			else 0
		end
    ,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
    ,[d_kytkin_hankintakoulutus_id]
    ,[d_kytkin_sisaopp_ov_ylittyy_id]
    ,[d_kytkin_erityistuen_ov_ylittyy_id]
    ,[d_kytkin_oppivelvollisuus_id]

	,[d_amos_painotuksen_tyyppi_id] = coalesce(d.id, '-1')
	,painotettu = nullif(case when opv_tyyppi like '%painotettu%' then opv_summa else 0 end, 0)
	,painottamaton = nullif(case when opv_tyyppi like '%painottamaton%' then opv_summa else 0 end, 0)
	,hylatty = nullif(case when opv_tyyppi like '%hylatty%' then opv_summa else 0 end, 0)
	,loadtime = getdate()

INTO [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut_unpivot] 

FROM (	

	SELECT 
		f.*
		,ca.opiskelijavuodet_hylatty_painotettu_erityistuki
		,ca.opiskelijavuodet_hylatty_painotettu_majoitus
		,ca.opiskelijavuodet_hylatty_painottamaton
	FROM dw.f_amos_opiskelijavuodet_painotetut f
	CROSS APPLY (
		SELECT
			opiskelijavuodet_hylatty_painotettu_majoitus = cast([opiskelijavuodet_painotettu_majoitus]-[opiskelijavuodet_painotettu_majoitus_hyv] as decimal(30,20)),
			opiskelijavuodet_hylatty_painotettu_erityistuki = cast([opiskelijavuodet_painotettu_erityistuki]-[opiskelijavuodet_painotettu_erityistuki_hyv] as decimal(30,20)),
			opiskelijavuodet_hylatty_painottamaton = [opiskelijavuodet_hylatyt]
	) ca

) k

UNPIVOT (
	opv_summa for opv_tyyppi in (
		 [opiskelijavuodet_painotettu_pt]
		,[opiskelijavuodet_painotettu_at_eat]
		,[opiskelijavuodet_painotettu_valma_telma]
		,[opiskelijavuodet_painotettu_opisk_valm_tukevat]
		,[opiskelijavuodet_painotettu_muu]
		,[opiskelijavuodet_painotettu_erityistuki_hyv]
		,[opiskelijavuodet_painotettu_majoitus_hyv]
		,[opiskelijavuodet_painotettu_henkilostokoulutus]
		,[opiskelijavuodet_painotettu_tyovoimakoulutus]
		,[opiskelijavuodet_painotettu_vankilaopetus]
		,[opiskelijavuodet_painotettu_oppivelvollisuus]
		,[opiskelijavuodet_painottamaton]
		,[opiskelijavuodet_hylatty_painotettu_majoitus]
		,[opiskelijavuodet_hylatty_painotettu_erityistuki]
		,[opiskelijavuodet_hylatty_painottamaton]
	)
) unpvt

LEFT JOIN dw.d_amos_painotuksen_tyyppi d on d.koodi = unpvt.opv_tyyppi
WHERE opv_summa != 0.00



--litistystä
--SELECT
--	 [id]
--	,[tilastovuosi]
--    ,[d_kalenteri_tilastokuukausi_id]
--    ,[d_sukupuoli_id]
--    ,[d_kieli_aidinkieli_id]
--    ,[d_ika_id]
--    ,[d_osa_aikaisuus_id]
--    ,[d_erityisopetus_id]
--    ,[d_majoitus_id]
--    ,[d_kytkin_oppisopimuskoulutus_id]
--    ,[d_kytkin_vankilaopetus_id]
--    ,[d_kytkin_henkilostokoulutus_id]
--    ,[d_kytkin_tyovoimakoulutus_id]
--    ,[d_koulutusluokitus_id]
--    ,[d_koulutusluokitus_tutk_osaa_pienempi_id]
--    ,[d_organisaatioluokitus_oppilaitos_id]
--    ,[d_organisaatioluokitus_jarj_id]
--    ,[d_organisaatioluokitus_jarj_hist_id]
--    ,[d_organisaatioluokitus_jarj_pihvi_id]
--    ,[d_organisaatioluokitus_jarj_pihvi_hist_id]
--    ,[d_organisaatioluokitus_toimipiste_id]
--    ,[d_amos_spl_jarjestaja_linkki_id]
--    ,[d_kustannusryhma_id]
--    ,[d_suorituksen_tyyppi_id]
--	,[d_kieli_suoritus_id]
--    ,[d_opintojenrahoitus_id]
--    ,[d_osaamisala_id]
--    ,[muu_ammatillinen_tarkenne]
--    ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
--    ,[d_amos_luvaton_koulutus_id]
--    ,[d_amos_luvaton_majoitus_id]
--    ,[d_amos_luvaton_korotustekija_id]
--	,[d_kieli_suoritus_luvanmukainen_id]
--    ,[d_kytkin_hankintakoulutus_id]
--    ,[d_kytkin_sisaopp_ov_ylittyy_id]
--    ,[d_kytkin_erityistuen_ov_ylittyy_id]
--    ,[d_kytkin_oppivelvollisuus_id]
--    ,[d_amos_painotuksen_tyyppi_id]
--    ,[painotettu] = SUM([painotettu])
--    ,[painottamaton] = SUM([painottamaton])
--    ,[hylatty] = SUM([hylatty])
--	,[loadtime] = GETDATE()
--INTO #temp
--FROM [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut_unpivot]
--GROUP BY
--	 [id]
--	,[tilastovuosi]
--    ,[d_kalenteri_tilastokuukausi_id]
--    ,[d_sukupuoli_id]
--    ,[d_kieli_aidinkieli_id]
--    ,[d_ika_id]
--    ,[d_osa_aikaisuus_id]
--    ,[d_erityisopetus_id]
--    ,[d_majoitus_id]
--    ,[d_kytkin_oppisopimuskoulutus_id]
--    ,[d_kytkin_vankilaopetus_id]
--    ,[d_kytkin_henkilostokoulutus_id]
--    ,[d_kytkin_tyovoimakoulutus_id]
--    ,[d_koulutusluokitus_id]
--    ,[d_koulutusluokitus_tutk_osaa_pienempi_id]
--    ,[d_organisaatioluokitus_oppilaitos_id]
--    ,[d_organisaatioluokitus_jarj_id]
--    ,[d_organisaatioluokitus_jarj_hist_id]
--    ,[d_organisaatioluokitus_jarj_pihvi_id]
--    ,[d_organisaatioluokitus_jarj_pihvi_hist_id]
--    ,[d_organisaatioluokitus_toimipiste_id]
--    ,[d_amos_spl_jarjestaja_linkki_id]
--    ,[d_kustannusryhma_id]
--    ,[d_suorituksen_tyyppi_id]
--	,[d_kieli_suoritus_id]
--    ,[d_opintojenrahoitus_id]
--    ,[d_osaamisala_id]
--    ,[muu_ammatillinen_tarkenne]
--    ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
--    ,[d_amos_luvaton_koulutus_id]
--    ,[d_amos_luvaton_majoitus_id]
--    ,[d_amos_luvaton_korotustekija_id]
--    ,[d_kytkin_hankintakoulutus_id]
--    ,[d_kytkin_sisaopp_ov_ylittyy_id]
--    ,[d_kytkin_erityistuen_ov_ylittyy_id]
--    ,[d_kytkin_oppivelvollisuus_id]
--    ,[d_amos_painotuksen_tyyppi_id]
--	,[d_kieli_suoritus_luvanmukainen_id]


--DROP TABLE IF EXISTS [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut_unpivot]

--SELECT * INTO [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut_unpivot] FROM #temp 


--DROP TABLE #temp
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot_generoi_hyvaksytty_korotustekija]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot_generoi_hyvaksytty_korotustekija]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot_generoi_hyvaksytty_korotustekija] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot_generoi_hyvaksytty_korotustekija] AS




SELECT distinct
	[tilastovuosi]
    ,[d_kalenteri_tilastokuukausi_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_osa_aikaisuus_id]
    ,[d_erityisopetus_id]
    ,[d_majoitus_id]
    ,[d_kytkin_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_kytkin_henkilostokoulutus_id]
    ,[d_kytkin_tyovoimakoulutus_id]
    ,[d_koulutusluokitus_id]
    ,[d_koulutusluokitus_tutk_osaa_pienempi_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_jarj_id]
    ,[d_organisaatioluokitus_jarj_hist_id]
    ,[d_organisaatioluokitus_jarj_pihvi_id]
    ,[d_organisaatioluokitus_jarj_pihvi_hist_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_opintojenrahoitus_id]
    ,[d_osaamisala_id]
    ,[muu_ammatillinen_tarkenne]
    ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
    ,[d_amos_luvaton_koulutus_id]
    ,[d_amos_luvaton_majoitus_id] = 0
	,[d_amos_luvaton_korotustekija_id] = 0
	,[d_kieli_suoritus_luvanmukainen_id]
    ,[d_kytkin_hankintakoulutus_id]
    ,[d_kytkin_sisaopp_ov_ylittyy_id]
    ,[d_kytkin_erityistuen_ov_ylittyy_id]
    ,[d_kytkin_oppivelvollisuus_id]
    ,[d_amos_painotuksen_tyyppi_id]
    ,[painotettu] = null
    ,[painottamaton] = null
    ,[hylatty] = null
	,[loadtime] = GETDATE()

INTO #temp
FROM [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut_unpivot] f1
WHERE NOT EXISTS (select d_organisaatioluokitus_jarj_id from dw.f_amos_opiskelijavuodet_painotetut_unpivot f2 where d_amos_luvaton_korotustekija_id = 0 and f2.d_organisaatioluokitus_jarj_id = f1.d_organisaatioluokitus_jarj_id)


INSERT INTO [dw].[f_amos_opiskelijavuodet_painotetut_unpivot] (
	 [tilastovuosi]
    ,[d_kalenteri_tilastokuukausi_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_osa_aikaisuus_id]
    ,[d_erityisopetus_id]
    ,[d_majoitus_id]
    ,[d_kytkin_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_kytkin_henkilostokoulutus_id]
    ,[d_kytkin_tyovoimakoulutus_id]
    ,[d_koulutusluokitus_id]
    ,[d_koulutusluokitus_tutk_osaa_pienempi_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_jarj_id]
    ,[d_organisaatioluokitus_jarj_hist_id]
    ,[d_organisaatioluokitus_jarj_pihvi_id]
    ,[d_organisaatioluokitus_jarj_pihvi_hist_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_opintojenrahoitus_id]
    ,[d_osaamisala_id]
    ,[muu_ammatillinen_tarkenne]
    ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
    ,[d_amos_luvaton_koulutus_id]
    ,[d_amos_luvaton_majoitus_id]
    ,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
    ,[d_kytkin_hankintakoulutus_id]
    ,[d_kytkin_sisaopp_ov_ylittyy_id]
    ,[d_kytkin_erityistuen_ov_ylittyy_id]
    ,[d_kytkin_oppivelvollisuus_id]
    ,[d_amos_painotuksen_tyyppi_id]
    ,[painotettu]
    ,[painottamaton]
    ,[hylatty]
	,[loadtime]
) 
SELECT 
	 [tilastovuosi]
    ,[d_kalenteri_tilastokuukausi_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_osa_aikaisuus_id]
    ,[d_erityisopetus_id]
    ,[d_majoitus_id]
    ,[d_kytkin_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_kytkin_henkilostokoulutus_id]
    ,[d_kytkin_tyovoimakoulutus_id]
    ,[d_koulutusluokitus_id]
    ,[d_koulutusluokitus_tutk_osaa_pienempi_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_jarj_id]
    ,[d_organisaatioluokitus_jarj_hist_id]
    ,[d_organisaatioluokitus_jarj_pihvi_id]
    ,[d_organisaatioluokitus_jarj_pihvi_hist_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_opintojenrahoitus_id]
    ,[d_osaamisala_id]
    ,[muu_ammatillinen_tarkenne]
    ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
    ,[d_amos_luvaton_koulutus_id]
    ,[d_amos_luvaton_majoitus_id]
    ,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
    ,[d_kytkin_hankintakoulutus_id]
    ,[d_kytkin_sisaopp_ov_ylittyy_id]
    ,[d_kytkin_erityistuen_ov_ylittyy_id]
    ,[d_kytkin_oppivelvollisuus_id]
    ,[d_amos_painotuksen_tyyppi_id]
    ,[painotettu] 
    ,[painottamaton] 
    ,[hylatty]
	,[loadtime]
FROM #temp

DROP TABLE #temp

GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat] AS' 
END
GO




ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat] AS


TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat]

INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat] (
	 [Tilastovuosi]
    ,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_koulutusluokitus_id]
    ,[d_opintojenrahoitus_id]
    ,[d_kustannusryhma_id]
    ,[d_oppisopimuskoulutus_id]
    ,[d_erityisopetus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
    ,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_toimipiste_id]
	,[d_kytkin_verrataan_lupatietoihin_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
    ,[koko_tutkinto]
    ,[tutkinnon_osat]
    ,[osaamispisteet]
)

SELECT 
	 [Tilastovuosi] = tt.vuosi
	,d_kalenteri_id = coalesce(d9.id, -1)
	,d_kalenteri_alkamispaiva_id = coalesce(d9b.id, -1)
	,d_sukupuoli_id = coalesce(d11.id, -1)
	,d_kieli_aidinkieli_id = coalesce(d12.id, -1)
	,d_ika_id = coalesce(d13.id, -1)
	,d_koulutusluokitus_id = coalesce(d2b.id,d2.id, -1)
	
	,d_opintojenrahoitus_id = coalesce(d5.id, -1)
	,d_kustannusryhma_id = coalesce(d7.id, -1)
	,d_oppisopimuskoulutus_id = coalesce(d4.id, -1)
	,d_erityisopetus_id = coalesce(d3.id, -1)
	,d_kytkin_vankilaopetus_id = coalesce(d10.id, -1)
	,d_suorituksen_tyyppi_id = coalesce(d8.id, -1)
	,d_kieli_suoritus_id = coalesce(d16.id, -1)

	,d_organisaatioluokitus_jarjestaja_id = coalesce(d1a.id, -1)
	,d_organisaatioluokitus_jarjestaja_hist_id = coalesce(d1e.id, -1)
	,d_organisaatioluokitus_jarjestaja_pihvi_id = coalesce(d1f.id, -1)
	,d_organisaatioluokitus_jarjestaja_pihvi_hist_id = coalesce(d1g.id, -1)
	,d_amos_spl_jarjestaja_linkki_id = coalesce(d1d.id, -1)
	,d_organisaatioluokitus_oppilaitos_id = coalesce(d1b.id, -1)
	,d_organisaatioluokitus_toimipiste_id = coalesce(d1c.id, -1)

	,d_kytkin_verrataan_lupatietoihin_id = coalesce(d14.id, -1)
	,d_kytkin_hankintakoulutus_id = coalesce(d15.id, -1)

	,d_amos_luvaton_koulutus = coalesce(d17.id, -1)
	,d_amos_luvaton_korotustekija = coalesce(d18.id, -1)
	,d_kieli_suoritus_luvanmukainen_id = coalesce(d19.id, -1)

    ,koko_tutkinto = tt.tutkinnot
    ,tutkinnon_osat = tt.tutkinnon_osat
	,osaamispisteet = tt.osaamispisteet

FROM Koski_SA.dbo.tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat tt

LEFT JOIN dw.d_organisaatioluokitus d1a on d1a.organisaatio_oid = tt.koulutustoimija_oid
LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid = tt.oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d1c on d1c.organisaatio_oid = tt.toimipiste_oid
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1d on d1d.oid_avain = tt.koulutustoimija_oid
LEFT JOIN dw.d_organisaatioluokitus d1e on d1e.organisaatio_oid = tt.koulutustoimija_oid_hist
LEFT JOIN dw.d_organisaatioluokitus d1f on d1f.organisaatio_oid = tt.koulutustoimija_oid_pihvi
LEFT JOIN dw.d_organisaatioluokitus d1g on d1g.organisaatio_oid = tt.koulutustoimija_oid_pihvi_hist
LEFT JOIN dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = tt.tutkinto_koodi
LEFT JOIN dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = coalesce(d2.uusi_eat_koodi,d2.koulutusluokitus_koodi)
LEFT JOIN dw.d_erityisopetus d3 on d3.erityisopetus_koodi = tt.erityisopetus_koodi
LEFT JOIN dw.d_oppisopimuskoulutus d4 on d4.koodi = tt.oppisopimus_koodi
LEFT JOIN dw.d_opintojenrahoitus d5 on d5.koodi = tt.opintojen_rahoitus_koodi
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d7 on d7.koodi = tt.kustannusryhma_koodi
LEFT JOIN dw.d_suorituksen_tyyppi d8 on d8.koodi = tt.suorituksen_tyyppi_koodi
LEFT JOIN dw.d_kalenteri d9 on d9.kalenteri_avain = concat(tt.vuosi,'-',right(concat('00', tt.kuukausi),2),'-01')
LEFT JOIN dw.d_kalenteri d9b on d9b.kalenteri_avain = tt.alkamispaiva
LEFT JOIN dw.d_kytkin d10 on d10.kytkin_koodi = tt.vankilaopetus_koodi
LEFT JOIN dw.d_sukupuoli d11 on d11.sukupuoli_koodi = tt.sukupuoli
LEFT JOIN dw.d_kieli d12 on d12.kieli_koodi = tt.aidinkieli
LEFT JOIN dw.d_ika d13 on d13.ika_avain = tt.ika
LEFT JOIN dw.d_kytkin d14 on d14.kytkin_koodi = tt.verrataan_lupatietoihin
LEFT JOIN dw.d_kytkin d15 on d15.kytkin_koodi = (case when tt.koulutustoimija_oid_pihvi is null then 0 else 1 end)
LEFT JOIN dw.d_kieli d16 on d16.kieli_koodi = tt.suorituskieli_koodiarvo
LEFT JOIN dw.d_amos_luvaton_koulutus d17 on d17.koodi = tt.lupa_koulutus
LEFT JOIN dw.d_amos_luvaton_korotustekija d18 on d18.koodi = tt.lupa_korotustekija
LEFT JOIN dw.d_kieli d19 on d19.kieli_koodi = tt.lupa_suorituskieli





GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut] AS' 
END
GO





ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut] AS


DECLARE @maxTilv as int
SET @maxTilv = (select max(vuosi) from sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot)


TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]

INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut] (
	[tilastovuosi]
    ,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_erityisopetus_id]
    ,[d_koulutusluokitus_id]
    ,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
    ,[d_opintojenrahoitus_id]
    ,[d_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
    ,[painottamaton_tutkinnot]
    ,[painottamaton_osatutkinnot]
    ,[painottamaton_osaamispisteet]
    ,[painottamaton_osaamispisteet_summa]
    ,[painotettu_tutkinnot_pt_kr_pk]
    ,[painotettu_tutkinnot_at_eat_kr_pk]
    ,[painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnot_erityistuki_hyv]
    ,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv]
    ,[painotettu_tutkinnot_yht]
    ,[painotettu_tutkinnon_osien_osaamispisteet_yht]
	)

SELECT  
	 [tilastovuosi]
	,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
	,[d_amos_spl_jarjestaja_linkki_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
	,[d_opintojenrahoitus_id]
	,[d_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[painottamaton_tutkinnot]
	,[painottamaton_osatutkinnot] 
	,[painottamaton_osaamispisteet]
	,[painottamaton_osaamispisteet_summa]
	,[painotettu_tutkinnot_pt_kr_pk]
	,[painotettu_tutkinnot_at_eat_kr_pk]
	,[painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnot_erityistuki_hyv]
	,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr]
	,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv]
	,[painotettu_tutkinnot_yht] = [painotettu_tutkinnot_pt_kr_pk] + [painotettu_tutkinnot_at_eat_kr_pk] + [painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_yht] = [painotettu_tutkinnon_osien_osaamispisteet_pt_kr] + [painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] + [painotettu_tutkinnon_osien_osaamispisteet_erityistuki]

FROM (

	SELECT
		 f.[Tilastovuosi]
		,[d_kalenteri_id]
		,[d_kalenteri_alkamispaiva_id]
		,[d_sukupuoli_id]
		,[d_kieli_aidinkieli_id]
		,[d_ika_id]
		,[d_erityisopetus_id]
		,[d_koulutusluokitus_id]
		,[d_organisaatioluokitus_jarjestaja_id]
		,[d_organisaatioluokitus_jarjestaja_pihvi_id]
		,[d_organisaatioluokitus_jarjestaja_hist_id]
		,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
		,[d_amos_spl_jarjestaja_linkki_id]
		,[d_organisaatioluokitus_oppilaitos_id]
		,[d_organisaatioluokitus_toimipiste_id]
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id]
		,[d_kieli_suoritus_id]
		,[d_opintojenrahoitus_id]
		,[d_oppisopimuskoulutus_id]
		,[d_kytkin_vankilaopetus_id]
		,[d_amos_luvaton_koulutus_id] 
		,[d_amos_luvaton_korotustekija_id] 
		,[d_kieli_suoritus_luvanmukainen_id]
		,[d_kytkin_hankintakoulutus_id]
		,[painottamaton_tutkinnot] = [koko_tutkinto]
		,[painottamaton_osatutkinnot] = [tutkinnon_osat]
		,[painottamaton_osaamispisteet] = f.[osaamispisteet]
		,[painottamaton_osaamispisteet_summa] = 0--os_pisteet_summa.osaamispisteet_sum
		,[painotettu_tutkinnot_pt_kr_pk] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					)
			   + (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_2' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					)
			)

		,[painotettu_tutkinnot_at_eat_kr_pk] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					)
			   + (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_2' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					)
			)

		,[painotettu_tutkinnot_erityistuki] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' and d5.koodi = '1' then koko_tutkinto else 0 end)
			)

		,[painotettu_tutkinnot_erityistuki_hyv] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='6' and d5.koodi = '1' then koko_tutkinto else 0 end)
			)
		
		,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then osaamispisteet else 0 end) 
			)
		
		,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then osaamispisteet else 0 end) 
			)	  
		
		,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki] = 
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' then osaamispisteet else 0 end)

		,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv] = 
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then osaamispisteet else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='4' then osaamispisteet else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='5' then osaamispisteet else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='6' then osaamispisteet else 0 end)
			
			

	FROM [dw].[f_amos_tutkinnot_ja_tutkinnonosat] f
	left join dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	left join dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	left join dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	left join dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatioluokitus_jarjestaja_id
	left join sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot d4 on d4.vuosi = (case when f.Tilastovuosi > @maxTilv then f.Tilastovuosi-1 else f.Tilastovuosi end) and d4.ytunnus = d3.organisaatio_koodi and cast(d4.kr as varchar) = d2.koodi and d4.tutktyyppi = (case when d1.tutkintotyyppi_koodi in ('19','20') then '19_20' else tutkintotyyppi_koodi end)
	left join dw.d_suorituksen_tyyppi d5 on d5.id = f.d_suorituksen_tyyppi_id
	left join dw.d_amos_luvaton_korotustekija d24 on d24.koodi = f.d_amos_luvaton_korotustekija_id
	--jos järjestäjälle ei löydy pohjakoulutustietoja, käytetään koko aineiston jakaumaa
	cross apply (SELECT avg([osuus_ei_pohjakoul_koko]) as ka_koko FROM [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='02' and vuosi=@maxTilv) A1
	cross apply (SELECT avg([osuus_pohjakoul_koko]) as ka_koko FROM [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='02' and vuosi=@maxTilv) A2
	cross apply (SELECT avg([osuus_ei_pohjakoul_koko]) as ka_koko FROM [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='19_20' and vuosi=@maxTilv) B1
	cross apply (SELECT avg([osuus_pohjakoul_koko]) as ka_koko FROM [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='19_20' and vuosi=@maxTilv) B2
	  
) q




GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot] AS' 
END
GO





ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot] AS


DROP TABLE IF EXISTS [ANTERO].[dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]
--TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]

--INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot] (
--	[tilastovuosi]
--	,[d_kalenteri_id]
--	,[d_kalenteri_alkamispaiva_id]
--	,[d_sukupuoli_id]
--	,[d_kieli_aidinkieli_id]
--	,[d_ika_id]
--	,[d_erityisopetus_id]
--	,[d_koulutusluokitus_id]
--	,[d_organisaatioluokitus_jarjestaja_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
--	,[d_organisaatioluokitus_jarjestaja_hist_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
--	,[d_amos_spl_jarjestaja_linkki_id]
--	,[d_organisaatioluokitus_oppilaitos_id]
--	,[d_organisaatioluokitus_toimipiste_id]
--	,[d_kustannusryhma_id]
--	,[d_suorituksen_tyyppi_id]
--	,[d_kieli_suoritus_id]
--	,[d_kieli_suoritus_lupa_id]
--	,[d_opintojenrahoitus_id]
--	,[d_oppisopimuskoulutus_id]
--	,[d_kytkin_vankilaopetus_id]
--	,[d_amos_luvaton_koulutus_id]
--	,[d_amos_luvaton_korotustekija_id]
--	,[d_kytkin_hankintakoulutus_id]
--	,[painottamaton_osaamispisteet_summa]
--	,[d_amos_painotuksen_tyyppi_id]
--	,[laskentaan_hyvaksyttava]
--	,[painottamaton_tutkinnot_ja_osaamispisteet]
--	,[painotettu_tutkinnot_ja_osaamispisteet]
--	,[loadtime]
--)

SELECT
	unpvt.id
	,[tilastovuosi]
    ,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_erityisopetus_id]
    ,[d_koulutusluokitus_id]
    ,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
    ,[d_opintojenrahoitus_id]
    ,[d_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[painottamaton_osaamispisteet_summa]
	--
	,[d_amos_painotuksen_tyyppi_id] = coalesce(d.id, '-1')
	,laskentaan_hyvaksyttava = case when tyyppi like '%hylatty%' then 0 else 1 end
	,painottamaton_tutkinnot_ja_osaamispisteet = case when tyyppi like '%painottamaton%' then summa else 0 end
	--,painottamaton_tutkinnon_osien_osaamispisteet = case when tyyppi like '%painottamaton%' and tyyppi like '%osaamispisteet%' then summa else 0 end
	,painotettu_tutkinnot_ja_osaamispisteet = case when tyyppi like '%painotettu%' then summa else 0 end
	--,painotettu_tutkinnon_osien_osaamispisteet = case when tyyppi like '%painotettu%' and tyyppi like '%osaamispisteet%' then summa else 0 end
	,loadtime = getdate()
   
INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]

FROM (

	SELECT  
		f.*
		,ca2.painottamaton_tutkinnot_pt
		,ca2.painottamaton_tutkinnot_at_eat
		,ca2.painottamaton_osatutkinnot_pt
		,ca2.painottamaton_osatutkinnot_at_eat
		,ca2.painottamaton_osaamispisteet_hyvaksytty_pt
		,ca2.painottamaton_osaamispisteet_hyvaksytty_at_eat
		,ca2.painottamaton_osaamispisteet_hylatty_pt
		,ca2.painottamaton_osaamispisteet_hylatty_at_eat
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_pt_kr
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_at_eat_kr
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_erityistuki
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hylatty_pt_kr
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hylatty_at_eat_kr
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hylatty_erityistuki
	FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut f
	JOIN dw.d_koulutusluokitus kl on kl.id = f.d_koulutusluokitus_id
	JOIN dw.d_amos_luvaton_koulutus lk on lk.id = f.d_amos_luvaton_koulutus_id

	--tavoitteelliset opiskelijavuodet (fuusiot huomioiden)
	LEFT JOIN dw.d_opintojenrahoitus opr on opr.id = f.d_opintojenrahoitus_id
	LEFT JOIN dw.d_organisaatioluokitus d1a on d1a.id = f.d_organisaatioluokitus_jarjestaja_id
	LEFT JOIN (
		SELECT
			ytunnus = coalesce(d.ytunnus_amos_spl, sa.ytunnus)
			,vuosi
			,tavoitteelliset_opiskelijavuodet = SUM(tavoitteelliset_opiskelijavuodet)
		FROM sa.sa_amos_tavoitteelliset_opiskelijavuodet sa
		LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = sa.ytunnus 
		GROUP BY coalesce(d.ytunnus_amos_spl, sa.ytunnus),vuosi
	) sa1 on sa1.ytunnus = d1a.organisaatio_koodi and sa1.vuosi = f.tilastovuosi

	--tutkinnon osien osaamispisteiden leikkuria varten lasketaan rahoituksessa huomioitavien luvallisten osaamispisteiden summa per järjestäjä per vuosi
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d9 on d9.id = f.d_amos_spl_jarjestaja_linkki_id
	LEFT JOIN (
		SELECT 
			f.tilastovuosi
			,organisaatio_koodi = d1.ytunnus_amos_spl
			,osaamispisteet_sum = sum(f.painottamaton_osaamispisteet)
		FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut f
		JOIN dw.d_amos_spl_jarjestaja_linkki d1 on d1.id = f.d_amos_spl_jarjestaja_linkki_id
		JOIN dw.d_opintojenrahoitus d2 on d2.id = f.d_opintojenrahoitus_id
		JOIN dw.d_amos_luvaton_koulutus d3 on d3.id = f.d_amos_luvaton_koulutus_id
		WHERE d2.sisaltyy_okm_suoritusrahoitus = 1 and d3.hyvaksytaan = 1
		GROUP BY f.tilastovuosi, d1.ytunnus_amos_spl
	) os_pisteet_summa on os_pisteet_summa.organisaatio_koodi = d9.ytunnus_amos_spl AND os_pisteet_summa.tilastovuosi = f.tilastovuosi

	--laskentaan hyväksyttävä osaamispistemäärä
	CROSS APPLY (
		SELECT
			leikkauskerroin = 
				CASE 
					WHEN os_pisteet_summa.osaamispisteet_sum > 120.0 * sa1.tavoitteelliset_opiskelijavuodet THEN (120.0 * sa1.tavoitteelliset_opiskelijavuodet) / os_pisteet_summa.osaamispisteet_sum
					ELSE 1.0
				END
	) ca1
	CROSS APPLY (
		SELECT
			painottamaton_tutkinnot_pt = case when kl.tutkintotyyppi_koodi = '02' then painottamaton_tutkinnot else 0 end,
			painottamaton_tutkinnot_at_eat = case when kl.tutkintotyyppi_koodi in ('19','20') then painottamaton_tutkinnot else 0 end,
			painottamaton_osatutkinnot_pt = case when kl.tutkintotyyppi_koodi = '02' then painottamaton_osatutkinnot else 0 end,
			painottamaton_osatutkinnot_at_eat = case when kl.tutkintotyyppi_koodi in ('19','20') then painottamaton_osatutkinnot else 0 end,
			painottamaton_osaamispisteet_hyvaksytty_pt = case when kl.tutkintotyyppi_koodi = '02' then leikkauskerroin * painottamaton_osaamispisteet else 0 end,
			painottamaton_osaamispisteet_hyvaksytty_at_eat = case when kl.tutkintotyyppi_koodi in ('19','20') then leikkauskerroin * painottamaton_osaamispisteet else 0 end,
			painottamaton_osaamispisteet_hylatty_pt = case when kl.tutkintotyyppi_koodi = '02' then (1.0-leikkauskerroin) * painottamaton_osaamispisteet else 0 end,
			painottamaton_osaamispisteet_hylatty_at_eat = case when kl.tutkintotyyppi_koodi in ('19','20') then (1.0-leikkauskerroin) * painottamaton_osaamispisteet else 0 end,
			painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_pt_kr = leikkauskerroin * painotettu_tutkinnon_osien_osaamispisteet_pt_kr,
			painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_at_eat_kr = leikkauskerroin * painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr,
			painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_erityistuki = leikkauskerroin * painotettu_tutkinnon_osien_osaamispisteet_erityistuki,
			painotettu_tutkinnon_osien_osaamispisteet_hylatty_pt_kr = (1.0-leikkauskerroin) * painotettu_tutkinnon_osien_osaamispisteet_pt_kr,
			painotettu_tutkinnon_osien_osaamispisteet_hylatty_at_eat_kr = (1.0-leikkauskerroin) * painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr,
			painotettu_tutkinnon_osien_osaamispisteet_hylatty_erityistuki = (1.0-leikkauskerroin) * painotettu_tutkinnon_osien_osaamispisteet_erityistuki
	) ca2
) k


UNPIVOT (
	summa for tyyppi in (
		 [painottamaton_tutkinnot_pt]
		,[painottamaton_tutkinnot_at_eat]
		,[painottamaton_osatutkinnot_pt]
		,[painottamaton_osatutkinnot_at_eat]
		,[painottamaton_osaamispisteet_hyvaksytty_pt]
		,[painottamaton_osaamispisteet_hyvaksytty_at_eat]
		,[painottamaton_osaamispisteet_hylatty_pt]
		,[painottamaton_osaamispisteet_hylatty_at_eat]
		,[painotettu_tutkinnot_pt_kr_pk]
		,[painotettu_tutkinnot_at_eat_kr_pk]
		,[painotettu_tutkinnot_erityistuki]
		,[painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_pt_kr]
		,[painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_at_eat_kr]
		,[painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_erityistuki]
		,[painotettu_tutkinnon_osien_osaamispisteet_hylatty_pt_kr]
		,[painotettu_tutkinnon_osien_osaamispisteet_hylatty_at_eat_kr]
		,[painotettu_tutkinnon_osien_osaamispisteet_hylatty_erityistuki]
	)
) unpvt

LEFT JOIN dw.d_amos_painotuksen_tyyppi d on d.koodi = unpvt.tyyppi

WHERE summa != 0


----
--SELECT
--	[tilastovuosi]
--    ,[d_kalenteri_id]
--	,[d_kalenteri_alkamispaiva_id]
--    ,[d_sukupuoli_id]
--    ,[d_kieli_aidinkieli_id]
--    ,[d_ika_id]
--    ,[d_erityisopetus_id]
--    ,[d_koulutusluokitus_id]
--    ,[d_organisaatioluokitus_jarjestaja_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
--	,[d_organisaatioluokitus_jarjestaja_hist_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
--    ,[d_amos_spl_jarjestaja_linkki_id]
--    ,[d_organisaatioluokitus_oppilaitos_id]
--    ,[d_organisaatioluokitus_toimipiste_id]
--    ,[d_kustannusryhma_id]
--    ,[d_suorituksen_tyyppi_id]
--	,[d_kieli_suoritus_id]
--	,[d_kieli_suoritus_lupa_id]
--    ,[d_opintojenrahoitus_id]
--    ,[d_oppisopimuskoulutus_id]
--    ,[d_kytkin_vankilaopetus_id]
--	,[d_amos_luvaton_koulutus_id]
--	,[d_amos_luvaton_korotustekija_id]
--	,[d_kytkin_hankintakoulutus_id]
--	,[painottamaton_osaamispisteet_summa]
--	,[d_amos_painotuksen_tyyppi_id]
--	,laskentaan_hyvaksyttava
--	,painottamaton_tutkinnot_ja_osaamispisteet = SUM(painottamaton_tutkinnot_ja_osaamispisteet)
--	,painotettu_tutkinnot_ja_osaamispisteet = SUM(painotettu_tutkinnot_ja_osaamispisteet)
--	,[loadtime] = GETDATE()
--INTO #temp
--FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot
--GROUP BY 
--	[tilastovuosi]
--    ,[d_kalenteri_id]
--	,[d_kalenteri_alkamispaiva_id]
--    ,[d_sukupuoli_id]
--    ,[d_kieli_aidinkieli_id]
--    ,[d_ika_id]
--    ,[d_erityisopetus_id]
--    ,[d_koulutusluokitus_id]
--    ,[d_organisaatioluokitus_jarjestaja_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
--	,[d_organisaatioluokitus_jarjestaja_hist_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
--    ,[d_amos_spl_jarjestaja_linkki_id]
--    ,[d_organisaatioluokitus_oppilaitos_id]
--    ,[d_organisaatioluokitus_toimipiste_id]
--    ,[d_kustannusryhma_id]
--    ,[d_suorituksen_tyyppi_id]
--	,[d_kieli_suoritus_id]
--	,[d_kieli_suoritus_lupa_id]
--    ,[d_opintojenrahoitus_id]
--    ,[d_oppisopimuskoulutus_id]
--    ,[d_kytkin_vankilaopetus_id]
--	,[d_amos_luvaton_koulutus_id]
--	,[d_amos_luvaton_korotustekija_id]
--	,[d_kytkin_hankintakoulutus_id]
--	,[painottamaton_osaamispisteet_summa]
--	,[d_amos_painotuksen_tyyppi_id]
--	,laskentaan_hyvaksyttava


--DROP TABLE IF EXISTS [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]
--SELECT * INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot] FROM #temp

--DROP TABLE #temp
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot_generoi_hyvaksytty_korotustekija]    Script Date: 6.3.2022 18:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot_generoi_hyvaksytty_korotustekija]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot_generoi_hyvaksytty_korotustekija] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot_generoi_hyvaksytty_korotustekija] AS



SELECT distinct
	 [tilastovuosi]
	,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
	,[d_amos_spl_jarjestaja_linkki_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
	,[d_opintojenrahoitus_id]
	,[d_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id] = 0
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_amos_painotuksen_tyyppi_id]
	,[painottamaton_osaamispisteet_summa]
	,[laskentaan_hyvaksyttava]
	,[painottamaton_tutkinnot_ja_osaamispisteet] = 0
	--,[painottamaton_tutkinnon_osien_osaamispisteet] = 0
	,[painotettu_tutkinnot_ja_osaamispisteet] = 0
	--,[painotettu_tutkinnon_osien_osaamispisteet] = 0
	,loadtime = GETDATE()
	
INTO #temp
FROM [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot] f1
WHERE NOT EXISTS (select 1 from dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot f2 where f2.d_amos_luvaton_korotustekija_id = 0 and f2.d_organisaatioluokitus_jarjestaja_id = f1.d_organisaatioluokitus_jarjestaja_id)


INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot] (
	[tilastovuosi]
	,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
	,[d_amos_spl_jarjestaja_linkki_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
	,[d_opintojenrahoitus_id]
	,[d_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_amos_painotuksen_tyyppi_id]
	,[painottamaton_osaamispisteet_summa]
	,[laskentaan_hyvaksyttava]
	,[painottamaton_tutkinnot_ja_osaamispisteet] 
	,[painotettu_tutkinnot_ja_osaamispisteet] 
	,loadtime
)

SELECT [tilastovuosi]
	,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
	,[d_amos_spl_jarjestaja_linkki_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
	,[d_opintojenrahoitus_id]
	,[d_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id] = 0
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_amos_painotuksen_tyyppi_id]
	,[painottamaton_osaamispisteet_summa]
	,[laskentaan_hyvaksyttava]
	,[painottamaton_tutkinnot_ja_osaamispisteet] = 0
	--,[painottamaton_tutkinnon_osien_osaamispisteet] = 0
	,[painotettu_tutkinnot_ja_osaamispisteet] = 0
	--,[painotettu_tutkinnon_osien_osaamispisteet] = 0
	,loadtime
FROM #temp

DROP TABLE #temp

