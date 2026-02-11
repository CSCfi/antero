USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tutkinnot_ja_tutkinnonosat_uusi]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_uusi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_uusi](
	[generoitu] [int] NULL,
	[paivays] [date] NULL,
	[rahoituskausi] [varchar](24) NULL,
	vuosiraportti_1_0 int NULL,
	[Tilastovuosi] [int] NULL,
	[suorituskausi] [varchar](24) NULL,
	[d_kalenteri_id] [int] NULL,
	[d_kalenteri_alkamispaiva_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[perusopetuksen_suoritusvuosi] [int] NULL,
	[d_opintojen_kulku_keskiarvot_keskiarvoluokka_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_maksuttomuus_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_kytkin_vankilaopetus_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_osaamisala_id] [int] NULL,
	[d_kieli_suoritus_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_hist_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_pihvi_hist_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_pihvi_id] [int] NULL,
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
GO


