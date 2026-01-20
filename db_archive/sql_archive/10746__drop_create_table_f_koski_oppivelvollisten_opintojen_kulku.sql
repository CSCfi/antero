USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_oppivelvollisten_opintojen_kulku]    Script Date: 15.4.2025 10.27.13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_oppivelvollisten_opintojen_kulku]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_oppivelvollisten_opintojen_kulku]
GO

/****** Object:  Table [dw].[f_koski_oppivelvollisten_opintojen_kulku]    Script Date: 15.4.2025 10.27.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_oppivelvollisten_opintojen_kulku](
	[master_oid] [varchar](50) NULL,
	[alku] [date] NULL,
	[loppu] [date] NULL,
	[opiskeluoikeus_alkuperainen] [varchar](150) NULL,
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
	[d_kytkin_oppivelvollisuus_paattynyt_id] [int] NULL,
	[d_pidennetty_oppivelvollisuus_id] [int] NULL,
	[d_perusopetuksen_oppimaaran_yksilollistaminen_id] [int] NULL,
	[d_kytkin_kotikunta_mannersuomessa_id] [int] NULL,
	[d_erityisopetus_aloitettu_koulutus_id] [int] NULL,
	[d_kytkin_valm_alk_koko_tutk_joht_koul_id] [int] NULL,
	[d_kytkin_valm_muu_koko_tutk_joht_koul_id] [int] NULL,
	[d_kytkin_jatk_alk_koko_tutk_joht_koul_id] [int] NULL,
	[d_kytkin_jatk_muu_koko_tutk_joht_koul_id] [int] NULL,
	[d_kytkin_valm_alk_valm_koul_id] [int] NULL,
	[d_kytkin_valm_muu_valm_koul_id] [int] NULL,
	[d_kytkin_jatk_alk_valm_koul_id] [int] NULL,
	[d_kytkin_jatk_muu_valm_koul_id] [int] NULL,
	[d_kytkin_valm_amm_tutk_osa_koul_id] [int] NULL,
	[d_kytkin_jatk_amm_tutk_osa_koul_id] [int] NULL,
	[d_kytkin_valm_per_op_koul_id] [int] NULL,
	[d_kytkin_jatk_per_op_koul_id] [int] NULL,
	[d_kytkin_koul_jok_ei_kelp_ov_suor_id] [int] NULL,
	[d_kytkin_ei_koul_id] [int] NULL,
	[d_kytkin_kesk_ov_suor_val_id] [int] NULL,
	[d_kytkin_kesk_ov_suor_val_valpas_id] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_koski_oppivelvollisten_opintojen_kulku] ADD  CONSTRAINT [DF__f_koski_oppivelvollisten_opintojen_kulku__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_koski_oppivelvollisten_opintojen_kulku] ADD  CONSTRAINT [DF__f_koski_oppivelvollisten_opintojen_kulku__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]