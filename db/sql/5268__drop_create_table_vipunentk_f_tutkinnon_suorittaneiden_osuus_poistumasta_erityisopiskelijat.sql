USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]    Script Date: 28.12.2021 12:50:30 ******/
DROP TABLE [dbo].[f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]
GO

/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]    Script Date: 28.12.2021 12:50:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat](
	[tilv] [nvarchar](4) NOT NULL,
	[lahde_id] [int] NOT NULL,
	[alueluokitus_id] [int] NOT NULL,
	[oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	[koulutusluokitus_id] [int] NOT NULL,
	[ophal_kylla_ei_id] [int] NOT NULL,
	[hallinnonala2_id] [int] NOT NULL,
	[tutkinnon_alueluokitus_id] [int] NOT NULL,
	[tutkinnon_oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	[tutkinnon_koulutusluokitus_id] [int] NOT NULL,
	[seurv_alueluokitus_id] [int] NOT NULL,
	[seurv_oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	[seurv_koulutusluokitus_id] [int] NOT NULL,
	[lkm] [int] NOT NULL,
	--uudet
    [opintojen_kulku_kaste_t2en_mukaan_tutkinto_priorisoitu_id] [int] NOT NULL,
    [opintojen_kulku_kaste_t2en_mukaan_opiskelu_priorisoitu_id] [int] NOT NULL,
    [opintojen_kulku_kala_t1n_mukaan_tutkinto_priorisoitu_id] [int] NOT NULL,
    [opintojen_kulku_kala_t1n_mukaan_opiskelu_priorisoitu_id] [int] NOT NULL,
    [opintojen_kulku_kala_t2n_mukaan_tutkinto_priorisoitu_id] [int] NOT NULL,
    [opintojen_kulku_kala_t2n_mukaan_opiskelu_priorisoitu_id] [int] NOT NULL,
    [opintojen_kulku_kala_t3n_mukaan_tutkinto_priorisoitu_id] [int] NOT NULL,
    [opintojen_kulku_kala_t3n_mukaan_opiskelu_priorisoitu_id] [int] NOT NULL,
    [tutkinto_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id] [int] NOT NULL,
    [tutkinto_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id] [int] NOT NULL,
    [opiskelee_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id] [int] NOT NULL,
    [opiskelee_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id] [int] NOT NULL,
    [tutkinto_tavoitet_kala_t1lla_tutkinto_priorisoitu_id] [int] NOT NULL,
    [tutkinto_tavoitet_kala_t1lla_opiskelu_priorisoitu_id] [int] NOT NULL,
    [opiskelee_tavoitet_kala_t1lla_tutkinto_priorisoitu_id] [int] NOT NULL,
    [opiskelee_tavoitet_kala_t1lla_opiskelu_priorisoitu_id] [int] NOT NULL,
    [tutkinto_tavoitet_kala_t2lla_tutkinto_priorisoitu_id] [int] NOT NULL,
    [tutkinto_tavoitet_kala_t2lla_opiskelu_priorisoitu_id] [int] NOT NULL,
    [opiskelee_tavoitet_kala_t2lla_tutkinto_priorisoitu_id] [int] NOT NULL,
    [opiskelee_tavoitet_kala_t2lla_opiskelu_priorisoitu_id] [int] NOT NULL,
    [tutkinto_tavoitet_kala_t3lla_tutkinto_priorisoitu_id] [int] NOT NULL,
    [tutkinto_tavoitet_kala_t3lla_opiskelu_priorisoitu_id] [int] NOT NULL,
    [opiskelee_tavoitet_kala_t3lla_tutkinto_priorisoitu_id] [int] NOT NULL,
    [opiskelee_tavoitet_kala_t3lla_opiskelu_priorisoitu_id] [int] NOT NULL,
	--vanhat
	[opintojen_kulku_koul_jarj_mukaan_tutkinto_priorisoitu_id] [int] NOT NULL,
	[opintojen_kulku_koul_jarj_mukaan_opiskelu_priorisoitu_id] [int] NOT NULL,
	[opintojen_kulku_koul_maakunnan_mukaan_tutkinto_priorisoitu_id] [int] NOT NULL,
	[opintojen_kulku_koul_maakunnan_mukaan_opiskelu_priorisoitu_id] [int] NOT NULL,
	[opintojen_kulku_koul_asteen_mukaan_tutkinto_priorisoitu_id] [int] NOT NULL,
	[opintojen_kulku_koul_asteen_mukaan_opiskelu_priorisoitu_id] [int] NOT NULL,
	[opintojen_kulku_koul_alan_mukaan_tutkinto_priorisoitu_id] [int] NOT NULL,
	[opintojen_kulku_koul_alan_mukaan_opiskelu_priorisoitu_id] [int] NOT NULL,
	[opintojen_kulku_opintoalan_mukaan_tutkinto_priorisoitu_id] [int] NOT NULL,
	[opintojen_kulku_opintoalan_mukaan_opiskelu_priorisoitu_id] [int] NOT NULL,
	[tutkinto_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id] [int] NOT NULL,
	[tutkinto_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id] [int] NOT NULL,
	[opiskelee_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id] [int] NOT NULL,
	[opiskelee_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id] [int] NOT NULL,
	[tutkinto_tavoitet_maakunnassa_tutkinto_priorisoitu_id] [int] NOT NULL,
	[tutkinto_tavoitet_maakunnassa_opiskelu_priorisoitu_id] [int] NOT NULL,
	[opiskelee_tavoitet_maakunnassa_tutkinto_priorisoitu_id] [int] NOT NULL,
	[opiskelee_tavoitet_maakunnassa_opiskelu_priorisoitu_id] [int] NOT NULL,
	[tutkinto_tavoitet_koul_asteella_tutkinto_priorisoitu_id] [int] NOT NULL,
	[tutkinto_tavoitet_koul_asteella_opiskelu_priorisoitu_id] [int] NOT NULL,
	[opiskelee_tavoitet_koul_asteella_tutkinto_priorisoitu_id] [int] NOT NULL,
	[opiskelee_tavoitet_koul_asteella_opiskelu_priorisoitu_id] [int] NOT NULL,
	[tutkinto_tavoitet_koul_alalla_tutkinto_priorisoitu_id] [int] NOT NULL,
	[tutkinto_tavoitet_koul_alalla_opiskelu_priorisoitu_id] [int] NOT NULL,
	[opiskelee_tavoitet_koul_alalla_tutkinto_priorisoitu_id] [int] NOT NULL,
	[opiskelee_tavoitet_koul_alalla_opiskelu_priorisoitu_id] [int] NOT NULL,
	[tutkinto_tavoitet_opintoalalla_tutkinto_priorisoitu_id] [int] NOT NULL,
	[tutkinto_tavoitet_opintoalalla_opiskelu_priorisoitu_id] [int] NOT NULL,
	[opiskelee_tavoitet_opintoalalla_tutkinto_priorisoitu_id] [int] NOT NULL,
	[opiskelee_tavoitet_opintoalalla_opiskelu_priorisoitu_id] [int] NOT NULL
) ON [PRIMARY]

GO


