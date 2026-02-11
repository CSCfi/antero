USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_uusi]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_uusi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_uusi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[generoitu] [int] NULL,
	[paivays] [date] NULL,
	[rahoituskausi] [varchar](24) NULL,
	vuosiraportti_1_0 int NULL,
	[tilastovuosi] [int] NULL,
	[suorituskausi] [varchar](24) NULL,
	[d_kalenteri_id] [int] NULL,
	[d_kalenteri_alkamispaiva_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[perusopetuksen_suoritusvuosi] [int] NULL,
	[d_opintojen_kulku_keskiarvot_keskiarvoluokka_id] [int] NULL,
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
	[d_maksuttomuus_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_amos_luvaton_koulutus_id] [int] NULL,
	[d_amos_luvaton_korotustekija_id] [int] NULL,
	[d_kieli_suoritus_luvanmukainen_id] [int] NULL,
	[d_kytkin_hankintakoulutus_id] [int] NULL,
	[painottamaton_tutkinnot] [decimal](30, 20) NULL,
	[painottamaton_osatutkinnot] [decimal](30, 20) NULL,
	[painottamaton_osaamispisteet] [decimal](30, 20) NULL,
	[enimmaismaaran_mukaiset_opv_ka] [decimal](30, 20) NULL,
	[osaamispisteet_kerroin] [decimal](30, 29) NULL,
	[painotettu_tutkinnot] [decimal](30, 20) NULL,
 CONSTRAINT [PK_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_uusi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
