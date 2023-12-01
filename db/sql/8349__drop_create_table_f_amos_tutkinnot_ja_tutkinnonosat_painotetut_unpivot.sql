USE [ANTERO]
GO

/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]    Script Date: 29.11.2023 12:38:28 ******/
DROP TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]
GO

/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]    Script Date: 29.11.2023 12:38:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
	[d_organisaatioluokitus_oppilaitos_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[d_kieli_suoritus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kieli_suoritus_luvanmukainen_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[painottamaton_osaamispisteet_summa] [decimal](30, 20) NULL,
	[d_amos_painotuksen_tyyppi_id] [int] NULL,
	[laskentaan_hyvaksyttava] [int] NOT NULL,
	[painottamaton_tutkinnot_ja_osaamispisteet] [decimal](30, 20) NULL,
	[painotettu_tutkinnot_ja_osaamispisteet] [decimal](30, 20) NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]

GO
