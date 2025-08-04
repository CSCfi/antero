USE [ANTERO]
GO

/****** Object:  Table [dw].[f_ehoks_opiskelijat]    Script Date: 30.7.2025 11.38.43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_ehoks_opiskelijat]') AND type in (N'U'))
DROP TABLE [dw].[f_ehoks_opiskelijat]
GO

/****** Object:  Table [dw].[f_ehoks_opiskelijat]    Script Date: 30.7.2025 11.38.43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_ehoks_opiskelijat](
	[master_oid] [varchar](100) NULL,
	[ehoks_id] [int] NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[alkamispaiva] [datetime] NULL,
	[alkamisvuosi] [int] NULL,
	[paattymispaiva] [datetime] NULL,
	[paattymisvuosi] [varchar](12) NULL,
	[vahvistuspaiva] [datetime] NULL,
	[opiskeluoikeuden_kesto_paivia] [int] NULL,
	[opiskeluoikeuden_kesto_paivia_kaikki_tilat] [int] NULL,
	[ensikertainen_hyvaksyminen_kk] [numeric](17, 0) NULL,
	[d_organisaatioluokitus_jarj_id] [bigint] NULL,
	[d_kytkin_koulutus_paattynyt_id] [int] NULL,
	[d_kytkin_valmistunut_id] [int] NULL,
	[oppilaitosmuotoinen_paivat] [decimal](38, 6) NULL,
	[koulutussopimus_paivat] [decimal](38, 6) NULL,
	[oppisopimus_paivat] [decimal](38, 6) NULL,
	[sopimusjakso_alku] [datetime] NULL,
	[sopimusjakso_loppu] [datetime] NULL,
	[d_kytkin_tutkinnon_osakohtaisia_jaksoja_hoksissa_id] [int] NULL,
	[d_osaamisen_hankkimistapa_id] [int] NULL,
	[d_osaamisen_hankkimistavat_id] [int] NULL,
	[d_kytkin_olennainen_seikka_hato_id] [int] NULL,
	[d_kytkin_nimetty_vastuullinen_tyopaikkaohjaaja_id] [int] NULL,
	[d_kytkin_opiskeluvalmiuksia_tukevat_opinnot_id] [int] NULL,
	[d_kytkin_osaamisen_hankkimisen_tarve_id] [int] NULL,
	[d_kytkin_ehoks_paivitetty_id] [int] NULL,
	[urasuunnitelma] [nvarchar](1000) NULL,
	[d_toimiala_id] [int] NULL,
	[d_kytkin_olennainen_seikka_hyto_id] [int] NULL,
	[d_tutkinnon_osat_id] [bigint] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_kytkin_muu_ammatillinen_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_aidinkieli_id] [bigint] NULL,
	[d_ika_alkamisvuonna_id] [bigint] NULL
) ON [PRIMARY]
GO


