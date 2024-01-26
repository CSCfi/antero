USE [ANTERO]
GO

/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 5.12.2022 18:11:19 ******/
DROP TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]
GO

/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 5.12.2022 18:11:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
	[d_osaamisala_id] [int] NULL,
	[d_kieli_suoritus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kieli_suoritus_luvanmukainen_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[painottamaton_tutkinnot] [decimal](30, 20) NULL,
	[painottamaton_osatutkinnot] [decimal](30, 20) NULL,
	[painottamaton_osaamispisteet] [decimal](30, 20) NULL,
	[painottamaton_osaamispisteet_summa] [decimal](30, 20) NULL,
	[painotettu_tutkinnot_pt_kr_pk] [decimal](30, 20) NULL,
	[painotettu_tutkinnot_at_eat_kr_pk] [decimal](30, 20) NULL,
	[painotettu_tutkinnot_erityistuki] [decimal](30, 20) NULL,
	[painotettu_tutkinnot_erityistuki_hyv] [decimal](30, 20) NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_pt_kr] [decimal](30, 20) NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] [decimal](30, 20) NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_erityistuki] [decimal](30, 20) NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv] [decimal](30, 20) NULL,
	[painotettu_tutkinnot_yht] [decimal](30, 20) NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_yht] [decimal](30, 20) NULL,
 CONSTRAINT [PK_f_amos_tutkinnot_ja_tutkinnonosat_painotetut] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


