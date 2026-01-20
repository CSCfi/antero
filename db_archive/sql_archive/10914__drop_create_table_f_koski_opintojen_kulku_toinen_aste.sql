USE [ANTERO]
GO

ALTER TABLE [dw].[f_koski_opintojen_kulku_toinen_aste] DROP CONSTRAINT [DF__f_koski_opintojen_kulku_toinen_aste__username__531856C7]
GO

ALTER TABLE [dw].[f_koski_opintojen_kulku_toinen_aste] DROP CONSTRAINT [DF__f_koski_opintojen_kulku_toinen_aste__loadtime__5224328E]
GO

/****** Object:  Table [dw].[f_koski_opintojen_kulku_toinen_aste]    Script Date: 30.7.2025 7.41.46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_opintojen_kulku_toinen_aste]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_opintojen_kulku_toinen_aste]
GO

/****** Object:  Table [dw].[f_koski_opintojen_kulku_toinen_aste]    Script Date: 30.7.2025 7.41.46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_opintojen_kulku_toinen_aste](
	[master_oid] [varchar](50) NULL,
	[alku] [date] NULL,
	[loppu] [date] NULL,
	[opiskeluoikeus_oid_alkuperainen] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[tilanne] [int] NOT NULL,
	[tilanne_prio] [int] NULL,
	[aika_vuosina] [float] NULL,
	[suorituksen_tyyppi_alkuperainen] [varchar](250) NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[koulutusmuoto_alkuperainen] [varchar](250) NULL,
	[koulutusmuoto] [varchar](250) NULL,
	[aloitettu_koulutus] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_kytkin_suorittanut_perusopetuksen_id] [int] NULL,
	[d_kytkin_oppivelvollinen_id] [int] NULL,
	[d_kytkin_kotikunta_mannersuomessa_id] [int] NULL,
	[d_erityisopetus_aloitettu_koulutus_id] [int] NULL,
	[d_koulutusluokitus_alkuperainen_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_kytkin_perusop_suor_aloitusvuoden_kevaana_id] [int] NULL,
	[d_kytkin_oppivelvollinen_alkamispaivana_id] [int] NULL,
	[oppimaara_alkuperainen] [int] NULL,
	[oppimaara] [int] NULL,
	[d_organisaatioluokitus_koulutuksen_jarjestaja_alkuperainen_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_alkuperainen_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_alkuperainen_id] [int] NULL,
	[d_organisaatioluokitus_koulutuksen_jarjestaja_id] [int] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [int] NULL,
	[d_kytkin_valm_alk_koko_tutk_joht_koul_id] [int] NULL,
	[d_kytkin_valm_muu_koko_tutk_joht_koul_id] [int] NULL,
	[d_kytkin_jatk_alk_koko_tutk_joht_koul_id] [int] NULL,
	[d_kytkin_jatk_muu_koko_tutk_joht_koul_id] [int] NULL,
	[d_kytkin_jatk_alk_valm_koul_id] [int] NULL,
	[d_kytkin_jatk_muu_valm_koul_id] [int] NULL,
	[d_kytkin_valm_amm_tutk_osa_koul_id] [int] NULL,
	[d_kytkin_jatk_amm_tutk_osa_koul_id] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_koski_opintojen_kulku_toinen_aste] ADD  CONSTRAINT [DF__f_koski_opintojen_kulku_toinen_aste__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_koski_opintojen_kulku_toinen_aste] ADD  CONSTRAINT [DF__f_koski_opintojen_kulku_toinen_aste__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO


