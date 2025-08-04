USE [ANTERO]
GO

/****** Object:  Table [dw].[f_ehoks_tutkinnon_suorittaneet]    Script Date: 30.7.2025 11.43.06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_ehoks_tutkinnon_suorittaneet]') AND type in (N'U'))
DROP TABLE [dw].[f_ehoks_tutkinnon_suorittaneet]
GO

/****** Object:  Table [dw].[f_ehoks_tutkinnon_suorittaneet]    Script Date: 30.7.2025 11.43.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_ehoks_tutkinnon_suorittaneet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[master_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[ehoks_id] [int] NULL,
	[alkamispaiva] [datetime] NULL,
	[alkamisvuosi] [int] NULL,
	[paattymispaiva] [datetime] NULL,
	[paattymisvuosi] [varchar](12) NULL,
	[vahvistuspaiva] [datetime] NULL,
	[opiskeluoikeuden_kesto_paivia] [int] NULL,
	[opiskeluoikeuden_kesto_paivia_kaikki_tilat] [int] NULL,
	[d_organisaatioluokitus_jarj_id] [bigint] NULL,
	[d_kytkin_koulutus_paattynyt_id] [int] NULL,
	[d_kytkin_valmistunut_id] [int] NULL,
	[oppilaitosmuotoinen_paivat] [int] NULL,
	[koulutussopimus_paivat] [int] NULL,
	[oppisopimus_paivat] [int] NULL,
	[d_osaamisen_hankkimistavat_id] [int] NOT NULL,
	[d_kytkin_muu_ammatillinen_id] [int] NOT NULL,
	[d_kytkin_tutkinnon_osakohtaisia_jaksoja_hoksissa_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_aidinkieli_id] [int] NULL,
	[d_ika_alkamisvuonna_id] [bigint] NULL,
	[d_osaamisen_hankkimistapa_id] [int] NULL,
	[ytunnus] [varchar](100) NULL,
	[d_toimiala_id] [int] NULL,
	[sopimuksen_alku] [datetime] NULL,
	[sopimuksen_loppu] [datetime] NULL,
	[paivat_hankkimistapa] [int] NULL,
	[paivat_kaikki] [int] NULL,
	[paivat_tyopaikka] [int] NULL,
	[sopimusten_lkm_opiskeluoikeus_yritys] [int] NULL,
	[aika_aloittamisesta_sopimusjaksoon_kk] [numeric](17, 0) NULL,
	[koulutussopimuksen_osuus] [numeric](25, 14) NULL,
	[oppisopimuksen_osuus] [numeric](25, 14) NULL,
	[muu_oppismisympäristö_osuus] [numeric](25, 14) NULL,
	[generoitu] [int] NOT NULL,
 CONSTRAINT [PK_f_ehoks_tutkinnon_suorittaneet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


