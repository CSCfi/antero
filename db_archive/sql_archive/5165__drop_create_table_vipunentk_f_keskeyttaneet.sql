USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_ika5v]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_ika1v]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_valtio_eumaa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_valtio_etamaa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_pohjoismaa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_paaasiallinen_toiminta_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_tutkinnon_suorittamisoppilaitos]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_tutkinnon_jarjestaja]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_seuraavan_vuoden_oppilaitos]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_seuraavan_vuoden_jarjestaja]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_opiskelijan_olo_lk]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_opintojen_kulku_koulutusaste2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_lahde]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_koulutustyyppi_tutkinnon_koulutustyyppi]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_koulutustyyppi_seuraavan_vuoden_koulutustyyppi]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_koulutustyyppi]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_koulutusluokitus_tutkinnon_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_koulutusluokitus_seuraavan_vuoden_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_koulutusluokitus_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_koulutuksen_kieli_versio1]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_kausi_kirjoihintulovuosi]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_kausi_kirjoihintulolukukausi]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_kansalaisuus_versio1]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_ammattiasema]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_alueluokitus_tutkinnon_suorittamismaakunta]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_alueluokitus_seuraavan_vuoden_maakunta]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_alueluokitus_koulutuksen_kunta]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_alueluokitus_kotikunta]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_aineisto]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_7f_jatkaa_opiskelua_muulla_koulutussektorilla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_7e_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_7d_d_tutkinto_muulla_koulutussektorilla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_7c_d_tutkinto_alkuperaisella_koulutussektorilla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_7b_d_opintojen_kulku_koulutussektori_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_7a_d_opintojen_kulku_koulutussektori_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_6f_jatkaa_opiskelua_muussa_maakunnassa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_6e_jatkaa_opiskelua_alkuperaisessa_maakunnassa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_6d_d_tutkinto_muussa_maakunnassa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_6c_d_tutkinto_alkuperaisessa_maakunnassa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_6b_d_opintojen_kulku_maakunnan_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_6a_d_opintojen_kulku_maakunnan_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_5f_jatkaa_opiskelua_muussa_oppilaitoksessa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_5e_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_5d_d_tutkinto_muussa_oppilaitoksessa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_5c_d_tutkinto_alkuperaisessa_oppilaitoksessa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_5bb_d_opintojen_kulku_oppilaitoksen_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_5b_d_opintojen_kulku_oppilaitoksen_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_5a_d_opintojen_kulku_oppilaitoksen_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_4f_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_4e_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_4d_d_tutkinto_muulla_koulutuksen_jarjestajalla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_4c_d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_4b_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_4a_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_3f_jatkaa_opiskelua_muulla_opintoalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_3e_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_3d_d_tutkinto_muulla_opintoalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_3c_d_tutkinto_alkuperaisella_opintoalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_3bb_d_opintojen_kulku_opintoala2002_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_3b_d_opintojen_kulku_opintoala2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_3a_d_opintojen_kulku_opintoala2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_koulutusalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_kala_t3lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_kala_t2lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_kala_t1lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_kala_t3lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_kala_t2lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_kala_t1lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_koulutusalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_kala_t3lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_kala_t2lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_kala_t1lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_koulutusalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_kala_t3lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_kala_t2lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_kala_t1lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_koulutusala2002_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_kala_t3_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_kala_t2_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_kala_t1_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2b_d_opintojen_kulku_koulutusala2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2b_d_opintojen_kulku_kala_t3_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2b_d_opintojen_kulku_kala_t2_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2b_d_opintojen_kulku_kala_t1_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2a_d_opintojen_kulku_koulutusala2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2a_d_opintojen_kulku_kala_t3_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2a_d_opintojen_kulku_kala_t2_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_2a_d_opintojen_kulku_kala_t1_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1f_jatkaa_opiskelua_muulla_koulutusasteella_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1f_jatkaa_opiskelua_muulla_kaste_t2ella]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1e_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1e_jatkaa_opiskelua_alkuperaisella_kaste_t2ella]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1d_d_tutkinto_muulla_koulutusasteella_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1d_d_tutkinto_muulla_kaste_t2ella]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1c_d_tutkinto_alkuperaisella_koulutusasteella_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1c_d_tutkinto_alkuperaisella_kaste_t2ella]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1b_d_opintojen_kulku_koulutusaste2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1b_d_opintojen_kulku_kaste_t2_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1a_d_opintojen_kulku_koulutusaste2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_1a_d_opintojen_kulku_kaste_t2_mukaan]
GO

/****** Object:  Table [dbo].[f_keskeyttaneet]    Script Date: 23.11.2021 18:01:36 ******/
DROP TABLE [dbo].[f_keskeyttaneet]
GO

/****** Object:  Table [dbo].[f_keskeyttaneet]    Script Date: 23.11.2021 18:01:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_keskeyttaneet](
	[tilastovuosi] [nvarchar](10) NULL,
	[tilv_date] [date] NULL,
	[aineisto_id] [int] NULL,
	[lahde_id] [int] NULL,
	[sukupuoli_id] [int] NULL,
	[aidinkieli_versio1x_id] [int] NULL,
	[ika_1v_id] [int] NULL,
	[ika_5v_id] [int] NULL,
	[kotikunta_id] [int] NULL,
	[kansalaisuus_versio1_id] [int] NULL,
	[eumaa_id] [int] NULL,
	[etamaa_id] [int] NULL,
	[pohjoismaa_id] [int] NULL,
	[kirjoihintulovuosi_id] [nvarchar](10) NULL,
	[kirjoihintulolukukausi_id] [nvarchar](10) NULL,
	[opiskelijan_olo_lk_id] [int] NULL,
	[oppilaitoksen_taustatiedot_id] [int] NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutuksen_kieli_versio1_id] [int] NULL,
	[koulutuksen_kunta_id] [int] NULL,
	[opetushallinnon_koulutus_id] [int] NULL,
	[hallinnonala2_id] [int] NULL,
	[koulutustyyppi_id] [int] NULL,
	[tutkinnon_suorittamismaakunta_id] [int] NULL,
	[tutkinnon_jarjestaja_id] [int] NULL,
	[tutkinnon_suorittamisoppilaitos_id] [int] NULL,
	[tutkinnon_koulutusluokitus_id] [int] NULL,
	[tutkinnon_koulutustyyppi_id] [int] NULL,
	[seuraavan_vuoden_maakunta_id] [int] NULL,
	[seuraavan_vuoden_jarjestaja_id] [int] NULL,
	[seuraavan_vuoden_oppilaitos_id] [int] NULL,
	[seuraavan_vuoden_koulutusluokitus_id] [int] NULL,
	[seuraavan_vuoden_koulutustyyppi_id] [int] NULL,
	[paaasiallinen_toiminta_versio2_id] [int] NULL,
	[ammattiasema_id] [int] NULL,
	[opiskelijat] [int] NULL,
  --uudet
	[1a_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan_id] [int] NULL,
	[1b_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan_id] [int] NULL,
	[1c_tutkinto_alkuperaisella_kaste_t2ella_id] [int] NULL,
	[1d_tutkinto_muulla_kaste_t2ella_id] [int] NULL,
	[1e_jatkaa_opiskelua_alkuperaisella_kaste_t2ella_id] [int] NULL,
	[1f_jatkaa_opiskelua_muulla_kaste_t2ella_id] [int] NULL,
	[2a_opiskelijoiden_opintojen_kulku_kala_t1_mukaan_id] [int] NULL,
	[2b_opiskelijoiden_opintojen_kulku_kala_t1_mukaan_id] [int] NULL,
	[2bb_opiskelijoiden_opintojen_kulku_kala_t1_mukaan_id] [int] NULL,
	[2c_tutkinto_alkuperaisella_kala_t1lla_id] [int] NULL,
	[2d_tutkinto_muulla_kala_t1lla_id] [int] NULL,
	[2e_jatkaa_opiskelua_alkuperaisella_kala_t1lla_id] [int] NULL,
	[2f_jatkaa_opiskelua_muulla_kala_t1lla_id] [int] NULL,
	[2a_opiskelijoiden_opintojen_kulku_kala_t2_mukaan_id] [int] NULL,
	[2b_opiskelijoiden_opintojen_kulku_kala_t2_mukaan_id] [int] NULL,
	[2bb_opiskelijoiden_opintojen_kulku_kala_t2_mukaan_id] [int] NULL,
	[2c_tutkinto_alkuperaisella_kala_t2lla_id] [int] NULL,
	[2d_tutkinto_muulla_kala_t2lla_id] [int] NULL,
	[2e_jatkaa_opiskelua_alkuperaisella_kala_t2lla_id] [int] NULL,
	[2f_jatkaa_opiskelua_muulla_kala_t2lla_id] [int] NULL,
	[2a_opiskelijoiden_opintojen_kulku_kala_t3_mukaan_id] [int] NULL,
	[2b_opiskelijoiden_opintojen_kulku_kala_t3_mukaan_id] [int] NULL,
	[2bb_opiskelijoiden_opintojen_kulku_kala_t3_mukaan_id] [int] NULL,
	[2c_tutkinto_alkuperaisella_kala_t3lla_id] [int] NULL,
	[2d_tutkinto_muulla_kala_t3lla_id] [int] NULL,
	[2e_jatkaa_opiskelua_alkuperaisella_kala_t3lla_id] [int] NULL,
	[2f_jatkaa_opiskelua_muulla_kala_t3lla_id] [int] NULL,
	[4bb_opiskelijoiden_opintojen_kulku_jarj_ja_kaste_t2_mukaan_id] [int] NULL,
  --vanhat
	[1a_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan_id] [int] NULL,
	[1b_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan_id] [int] NULL,
	[1c_tutkinto_alkuperaisella_koulutusasteella_2002_id] [int] NULL,
	[1d_tutkinto_muulla_koulutusasteella_2002_id] [int] NULL,
	[1e_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_id] [int] NULL,
	[1f_jatkaa_opiskelua_muulla_koulutusasteella_2002_id] [int] NULL,
	[2a_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id] [int] NULL,
	[2b_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id] [int] NULL,
	[2bb_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id] [int] NULL,
	[2c_tutkinto_alkuperaisella_koulutusalalla_2002_id] [int] NULL,
	[2d_tutkinto_muulla_koulutusalalla_2002_id] [int] NULL,
	[2e_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_id] [int] NULL,
	[2f_jatkaa_opiskelua_muulla_koulutusalalla_2002_id] [int] NULL,
	[3a_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id] [int] NULL,
	[3b_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id] [int] NULL,
	[3bb_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id] [int] NULL,
	[3c_tutkinto_alkuperaisella_opintoalalla_2002_id] [int] NULL,
	[3d_tutkinto_muulla_opintoalalla_2002_id] [int] NULL,
	[3e_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_id] [int] NULL,
	[3f_jatkaa_opiskelua_muulla_opintoalalla_2002_id] [int] NULL,
	[4a_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id] [int] NULL,
	[4b_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id] [int] NULL,
	[4bb_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id] [int] NULL,
	[4c_tutkinto_alkuperaisella_koulutuksen_jarjestajalla_id] [int] NULL,
	[4d_tutkinto_muulla_koulutuksen_jarjestajalla_id] [int] NULL,
	[4e_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_id] [int] NULL,
	[4f_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_id] [int] NULL,
	[5a_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id] [int] NULL,
	[5b_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id] [int] NULL,
	[5bb_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id] [int] NULL,
	[5c_tutkinto_alkuperaisessa_oppilaitoksessa_id] [int] NULL,
	[5d_tutkinto_muussa_oppilaitoksessa_id] [int] NULL,
	[5e_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_id] [int] NULL,
	[5f_jatkaa_opiskelua_muussa_oppilaitoksessa_id] [int] NULL,
	[6a_opiskelijoiden_opintojen_kulku_maakunnan_mukaan_id] [int] NULL,
	[6b_opiskelijoiden_opintojen_kulku_maakunnan_mukaan_id] [int] NULL,
	[6c_tutkinto_alkuperaisessa_maakunnassa_id] [int] NULL,
	[6d_tutkinto_muussa_maakunnassa_id] [int] NULL,
	[6e_jatkaa_opiskelua_alkuperaisessa_maakunnassa_id] [int] NULL,
	[6f_jatkaa_opiskelua_muussa_maakunnassa_id] [int] NULL,
	[7a_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan_id] [int] NULL,
	[7b_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan_id] [int] NULL,
	[7c_tutkinto_alkuperaisella_koulutussektorilla_id] [int] NULL,
	[7d_tutkinto_muulla_koulutussektorilla_id] [int] NULL,
	[7e_jatkaa_opiskelua_alkuperaisella_koulutussektorilla_id] [int] NULL,
	[7f_jatkaa_opiskelua_muulla_koulutussektorilla_id] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1a_d_opintojen_kulku_kaste_t2_mukaan] FOREIGN KEY([1a_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_kaste_t2en_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1a_d_opintojen_kulku_kaste_t2_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1a_d_opintojen_kulku_koulutusaste2002_mukaan] FOREIGN KEY([1a_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutusasteen_2002_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1a_d_opintojen_kulku_koulutusaste2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1b_d_opintojen_kulku_kaste_t2_mukaan] FOREIGN KEY([1b_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_kaste_t2en_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1b_d_opintojen_kulku_kaste_t2_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1b_d_opintojen_kulku_koulutusaste2002_mukaan] FOREIGN KEY([1b_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutusasteen_2002_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1b_d_opintojen_kulku_koulutusaste2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1c_d_tutkinto_alkuperaisella_kaste_t2ella] FOREIGN KEY([1c_tutkinto_alkuperaisella_kaste_t2ella_id])
REFERENCES [dbo].[d_tutkinto_alkuperaisella_kaste_t2ella] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1c_d_tutkinto_alkuperaisella_kaste_t2ella]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1c_d_tutkinto_alkuperaisella_koulutusasteella_2002] FOREIGN KEY([1c_tutkinto_alkuperaisella_koulutusasteella_2002_id])
REFERENCES [dbo].[d_tutkinto_alkuperaisella_koulutusasteella_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1c_d_tutkinto_alkuperaisella_koulutusasteella_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1d_d_tutkinto_muulla_kaste_t2ella] FOREIGN KEY([1d_tutkinto_muulla_kaste_t2ella_id])
REFERENCES [dbo].[d_tutkinto_muulla_kaste_t2ella] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1d_d_tutkinto_muulla_kaste_t2ella]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1d_d_tutkinto_muulla_koulutusasteella_2002] FOREIGN KEY([1d_tutkinto_muulla_koulutusasteella_2002_id])
REFERENCES [dbo].[d_tutkinto_muulla_koulutusasteella_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1d_d_tutkinto_muulla_koulutusasteella_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1e_jatkaa_opiskelua_alkuperaisella_kaste_t2ella] FOREIGN KEY([1e_jatkaa_opiskelua_alkuperaisella_kaste_t2ella_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1e_jatkaa_opiskelua_alkuperaisella_kaste_t2ella]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1e_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002] FOREIGN KEY([1e_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1e_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1f_jatkaa_opiskelua_muulla_kaste_t2ella] FOREIGN KEY([1f_jatkaa_opiskelua_muulla_kaste_t2ella_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_muulla_kaste_t2ella] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1f_jatkaa_opiskelua_muulla_kaste_t2ella]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_1f_jatkaa_opiskelua_muulla_koulutusasteella_2002] FOREIGN KEY([1f_jatkaa_opiskelua_muulla_koulutusasteella_2002_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_muulla_koulutusasteella_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_1f_jatkaa_opiskelua_muulla_koulutusasteella_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2a_d_opintojen_kulku_kala_t1_mukaan] FOREIGN KEY([2a_opiskelijoiden_opintojen_kulku_kala_t1_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_kala_t1n_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2a_d_opintojen_kulku_kala_t1_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2a_d_opintojen_kulku_kala_t2_mukaan] FOREIGN KEY([2a_opiskelijoiden_opintojen_kulku_kala_t2_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_kala_t2n_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2a_d_opintojen_kulku_kala_t2_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2a_d_opintojen_kulku_kala_t3_mukaan] FOREIGN KEY([2a_opiskelijoiden_opintojen_kulku_kala_t3_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_kala_t3n_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2a_d_opintojen_kulku_kala_t3_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2a_d_opintojen_kulku_koulutusala2002_mukaan] FOREIGN KEY([2a_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2a_d_opintojen_kulku_koulutusala2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2b_d_opintojen_kulku_kala_t1_mukaan] FOREIGN KEY([2b_opiskelijoiden_opintojen_kulku_kala_t1_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_kala_t1n_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2b_d_opintojen_kulku_kala_t1_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2b_d_opintojen_kulku_kala_t2_mukaan] FOREIGN KEY([2b_opiskelijoiden_opintojen_kulku_kala_t2_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_kala_t2n_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2b_d_opintojen_kulku_kala_t2_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2b_d_opintojen_kulku_kala_t3_mukaan] FOREIGN KEY([2b_opiskelijoiden_opintojen_kulku_kala_t3_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_kala_t3n_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2b_d_opintojen_kulku_kala_t3_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2b_d_opintojen_kulku_koulutusala2002_mukaan] FOREIGN KEY([2b_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2b_d_opintojen_kulku_koulutusala2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_kala_t1_mukaan_versio2] FOREIGN KEY([2bb_opiskelijoiden_opintojen_kulku_kala_t1_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_kala_t1n_mukaan_versio2] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_kala_t1_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_kala_t2_mukaan_versio2] FOREIGN KEY([2bb_opiskelijoiden_opintojen_kulku_kala_t2_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_kala_t2n_mukaan_versio2] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_kala_t2_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_kala_t3_mukaan_versio2] FOREIGN KEY([2bb_opiskelijoiden_opintojen_kulku_kala_t3_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_kala_t3n_mukaan_versio2] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_kala_t3_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_koulutusala2002_mukaan_versio2] FOREIGN KEY([2bb_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan_versio2] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2bb_d_opintojen_kulku_koulutusala2002_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_kala_t1lla] FOREIGN KEY([2c_tutkinto_alkuperaisella_kala_t1lla_id])
REFERENCES [dbo].[d_tutkinto_alkuperaisella_kala_t1lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_kala_t1lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_kala_t2lla] FOREIGN KEY([2c_tutkinto_alkuperaisella_kala_t2lla_id])
REFERENCES [dbo].[d_tutkinto_alkuperaisella_kala_t2lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_kala_t2lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_kala_t3lla] FOREIGN KEY([2c_tutkinto_alkuperaisella_kala_t3lla_id])
REFERENCES [dbo].[d_tutkinto_alkuperaisella_kala_t3lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_kala_t3lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_koulutusalalla_2002] FOREIGN KEY([2c_tutkinto_alkuperaisella_koulutusalalla_2002_id])
REFERENCES [dbo].[d_tutkinto_alkuperaisella_koulutusalalla_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2c_d_tutkinto_alkuperaisella_koulutusalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_kala_t1lla] FOREIGN KEY([2d_tutkinto_muulla_kala_t1lla_id])
REFERENCES [dbo].[d_tutkinto_muulla_kala_t1lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_kala_t1lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_kala_t2lla] FOREIGN KEY([2d_tutkinto_muulla_kala_t2lla_id])
REFERENCES [dbo].[d_tutkinto_muulla_kala_t2lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_kala_t2lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_kala_t3lla] FOREIGN KEY([2d_tutkinto_muulla_kala_t3lla_id])
REFERENCES [dbo].[d_tutkinto_muulla_kala_t3lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_kala_t3lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_koulutusalalla_2002] FOREIGN KEY([2d_tutkinto_muulla_koulutusalalla_2002_id])
REFERENCES [dbo].[d_tutkinto_muulla_koulutusalalla_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2d_d_tutkinto_muulla_koulutusalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_kala_t1lla] FOREIGN KEY([2e_jatkaa_opiskelua_alkuperaisella_kala_t1lla_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t1lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_kala_t1lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_kala_t2lla] FOREIGN KEY([2e_jatkaa_opiskelua_alkuperaisella_kala_t2lla_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t2lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_kala_t2lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_kala_t3lla] FOREIGN KEY([2e_jatkaa_opiskelua_alkuperaisella_kala_t3lla_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t3lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_kala_t3lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002] FOREIGN KEY([2e_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2e_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_kala_t1lla] FOREIGN KEY([2f_jatkaa_opiskelua_muulla_kala_t1lla_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_muulla_kala_t1lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_kala_t1lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_kala_t2lla] FOREIGN KEY([2f_jatkaa_opiskelua_muulla_kala_t2lla_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_muulla_kala_t2lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_kala_t2lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_kala_t3lla] FOREIGN KEY([2f_jatkaa_opiskelua_muulla_kala_t3lla_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_muulla_kala_t3lla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_kala_t3lla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_koulutusalalla_2002] FOREIGN KEY([2f_jatkaa_opiskelua_muulla_koulutusalalla_2002_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_muulla_koulutusalalla_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_2f_jatkaa_opiskelua_muulla_koulutusalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_3a_d_opintojen_kulku_opintoala2002_mukaan] FOREIGN KEY([3a_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_opintoalan_2002_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_3a_d_opintojen_kulku_opintoala2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_3b_d_opintojen_kulku_opintoala2002_mukaan] FOREIGN KEY([3b_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_opintoalan_2002_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_3b_d_opintojen_kulku_opintoala2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_3bb_d_opintojen_kulku_opintoala2002_mukaan_versio2] FOREIGN KEY([3bb_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_opintoalan_2002_mukaan_versio2] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_3bb_d_opintojen_kulku_opintoala2002_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_3c_d_tutkinto_alkuperaisella_opintoalalla_2002] FOREIGN KEY([3c_tutkinto_alkuperaisella_opintoalalla_2002_id])
REFERENCES [dbo].[d_tutkinto_alkuperaisella_opintoalalla_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_3c_d_tutkinto_alkuperaisella_opintoalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_3d_d_tutkinto_muulla_opintoalalla_2002] FOREIGN KEY([3d_tutkinto_muulla_opintoalalla_2002_id])
REFERENCES [dbo].[d_tutkinto_muulla_opintoalalla_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_3d_d_tutkinto_muulla_opintoalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_3e_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002] FOREIGN KEY([3e_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_3e_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_3f_jatkaa_opiskelua_muulla_opintoalalla_2002] FOREIGN KEY([3f_jatkaa_opiskelua_muulla_opintoalalla_2002_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_muulla_opintoalalla_2002] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_3f_jatkaa_opiskelua_muulla_opintoalalla_2002]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_4a_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan] FOREIGN KEY([4a_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_4a_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_4b_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan] FOREIGN KEY([4b_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_4b_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] FOREIGN KEY([4bb_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016] FOREIGN KEY([4bb_opiskelijoiden_opintojen_kulku_jarj_ja_kaste_t2_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_4c_d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla] FOREIGN KEY([4c_tutkinto_alkuperaisella_koulutuksen_jarjestajalla_id])
REFERENCES [dbo].[d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_4c_d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_4d_d_tutkinto_muulla_koulutuksen_jarjestajalla] FOREIGN KEY([4d_tutkinto_muulla_koulutuksen_jarjestajalla_id])
REFERENCES [dbo].[d_tutkinto_muulla_koulutuksen_jarjestajalla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_4d_d_tutkinto_muulla_koulutuksen_jarjestajalla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_4e_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla] FOREIGN KEY([4e_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_4e_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_4f_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla] FOREIGN KEY([4f_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_4f_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_5a_d_opintojen_kulku_oppilaitoksen_mukaan] FOREIGN KEY([5a_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_oppilaitoksen_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_5a_d_opintojen_kulku_oppilaitoksen_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_5b_d_opintojen_kulku_oppilaitoksen_mukaan] FOREIGN KEY([5b_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_oppilaitoksen_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_5b_d_opintojen_kulku_oppilaitoksen_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_5bb_d_opintojen_kulku_oppilaitoksen_mukaan_versio2] FOREIGN KEY([5bb_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_oppilaitoksen_mukaan_versio2] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_5bb_d_opintojen_kulku_oppilaitoksen_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_5c_d_tutkinto_alkuperaisessa_oppilaitoksessa] FOREIGN KEY([5c_tutkinto_alkuperaisessa_oppilaitoksessa_id])
REFERENCES [dbo].[d_tutkinto_alkuperaisessa_oppilaitoksessa] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_5c_d_tutkinto_alkuperaisessa_oppilaitoksessa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_5d_d_tutkinto_muussa_oppilaitoksessa] FOREIGN KEY([5d_tutkinto_muussa_oppilaitoksessa_id])
REFERENCES [dbo].[d_tutkinto_muussa_oppilaitoksessa] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_5d_d_tutkinto_muussa_oppilaitoksessa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_5e_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa] FOREIGN KEY([5e_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_5e_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_5f_jatkaa_opiskelua_muussa_oppilaitoksessa] FOREIGN KEY([5f_jatkaa_opiskelua_muussa_oppilaitoksessa_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_muussa_oppilaitoksessa] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_5f_jatkaa_opiskelua_muussa_oppilaitoksessa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_6a_d_opintojen_kulku_maakunnan_mukaan] FOREIGN KEY([6a_opiskelijoiden_opintojen_kulku_maakunnan_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_maakunnan_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_6a_d_opintojen_kulku_maakunnan_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_6b_d_opintojen_kulku_maakunnan_mukaan] FOREIGN KEY([6b_opiskelijoiden_opintojen_kulku_maakunnan_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_maakunnan_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_6b_d_opintojen_kulku_maakunnan_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_6c_d_tutkinto_alkuperaisessa_maakunnassa] FOREIGN KEY([6c_tutkinto_alkuperaisessa_maakunnassa_id])
REFERENCES [dbo].[d_tutkinto_alkuperaisessa_maakunnassa] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_6c_d_tutkinto_alkuperaisessa_maakunnassa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_6d_d_tutkinto_muussa_maakunnassa] FOREIGN KEY([6d_tutkinto_muussa_maakunnassa_id])
REFERENCES [dbo].[d_tutkinto_muussa_maakunnassa] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_6d_d_tutkinto_muussa_maakunnassa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_6e_jatkaa_opiskelua_alkuperaisessa_maakunnassa] FOREIGN KEY([6e_jatkaa_opiskelua_alkuperaisessa_maakunnassa_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_alkuperaisessa_maakunnassa] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_6e_jatkaa_opiskelua_alkuperaisessa_maakunnassa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_6f_jatkaa_opiskelua_muussa_maakunnassa] FOREIGN KEY([6f_jatkaa_opiskelua_muussa_maakunnassa_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_muussa_maakunnassa] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_6f_jatkaa_opiskelua_muussa_maakunnassa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_7a_d_opintojen_kulku_koulutussektori_mukaan] FOREIGN KEY([7a_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutussektorin_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_7a_d_opintojen_kulku_koulutussektori_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_7b_d_opintojen_kulku_koulutussektori_mukaan] FOREIGN KEY([7b_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutussektorin_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_7b_d_opintojen_kulku_koulutussektori_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_7c_d_tutkinto_alkuperaisella_koulutussektorilla] FOREIGN KEY([7c_tutkinto_alkuperaisella_koulutussektorilla_id])
REFERENCES [dbo].[d_tutkinto_alkuperaisella_koulutussektorilla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_7c_d_tutkinto_alkuperaisella_koulutussektorilla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_7d_d_tutkinto_muulla_koulutussektorilla] FOREIGN KEY([7d_tutkinto_muulla_koulutussektorilla_id])
REFERENCES [dbo].[d_tutkinto_muulla_koulutussektorilla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_7d_d_tutkinto_muulla_koulutussektorilla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_7e_jatkaa_opiskelua_alkuperaisella_koulutussektorilla] FOREIGN KEY([7e_jatkaa_opiskelua_alkuperaisella_koulutussektorilla_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_7e_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_7f_jatkaa_opiskelua_muulla_koulutussektorilla] FOREIGN KEY([7f_jatkaa_opiskelua_muulla_koulutussektorilla_id])
REFERENCES [dbo].[d_jatkaa_opiskelua_muulla_koulutussektorilla] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_7f_jatkaa_opiskelua_muulla_koulutussektorilla]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1x_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_aineisto] FOREIGN KEY([aineisto_id])
REFERENCES [dbo].[d_aineisto] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_aineisto]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_alueluokitus_kotikunta] FOREIGN KEY([kotikunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_alueluokitus_kotikunta]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_alueluokitus_koulutuksen_kunta] FOREIGN KEY([koulutuksen_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_alueluokitus_koulutuksen_kunta]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_alueluokitus_seuraavan_vuoden_maakunta] FOREIGN KEY([seuraavan_vuoden_maakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_alueluokitus_seuraavan_vuoden_maakunta]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_alueluokitus_tutkinnon_suorittamismaakunta] FOREIGN KEY([tutkinnon_suorittamismaakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_alueluokitus_tutkinnon_suorittamismaakunta]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_ammattiasema] FOREIGN KEY([ammattiasema_id])
REFERENCES [dbo].[d_ammattiasema] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_ammattiasema]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_kansalaisuus_versio1] FOREIGN KEY([kansalaisuus_versio1_id])
REFERENCES [dbo].[d_kansalaisuus_versio1] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_kansalaisuus_versio1]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_kausi_kirjoihintulolukukausi] FOREIGN KEY([kirjoihintulolukukausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_kausi_kirjoihintulolukukausi]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_kausi_kirjoihintulovuosi] FOREIGN KEY([kirjoihintulovuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_kausi_kirjoihintulovuosi]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_koulutuksen_kieli_versio1] FOREIGN KEY([koulutuksen_kieli_versio1_id])
REFERENCES [dbo].[d_koulutuksen_kieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_koulutuksen_kieli_versio1]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_koulutusluokitus_koulutusluokitus] FOREIGN KEY([koulutusluokitus_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_koulutusluokitus_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_koulutusluokitus_seuraavan_vuoden_koulutusluokitus] FOREIGN KEY([seuraavan_vuoden_koulutusluokitus_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_koulutusluokitus_seuraavan_vuoden_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_koulutusluokitus_tutkinnon_koulutusluokitus] FOREIGN KEY([tutkinnon_koulutusluokitus_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_koulutusluokitus_tutkinnon_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_koulutustyyppi] FOREIGN KEY([koulutustyyppi_id])
REFERENCES [dbo].[d_koulutustyyppi] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_koulutustyyppi]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_koulutustyyppi_seuraavan_vuoden_koulutustyyppi] FOREIGN KEY([seuraavan_vuoden_koulutustyyppi_id])
REFERENCES [dbo].[d_koulutustyyppi] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_koulutustyyppi_seuraavan_vuoden_koulutustyyppi]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_koulutustyyppi_tutkinnon_koulutustyyppi] FOREIGN KEY([tutkinnon_koulutustyyppi_id])
REFERENCES [dbo].[d_koulutustyyppi] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_koulutustyyppi_tutkinnon_koulutustyyppi]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_lahde] FOREIGN KEY([lahde_id])
REFERENCES [dbo].[d_lahde] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_lahde]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_opetushallinnon_koulutus] FOREIGN KEY([opetushallinnon_koulutus_id])
REFERENCES [dbo].[d_opetushallinnon_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_opintojen_kulku_koulutusaste2002_mukaan] FOREIGN KEY([1a_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutusasteen_2002_mukaan] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_opintojen_kulku_koulutusaste2002_mukaan]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_opiskelijan_olo_lk] FOREIGN KEY([opiskelijan_olo_lk_id])
REFERENCES [dbo].[d_opiskelijan_olo] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_opiskelijan_olo_lk]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitoksen_taustatiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_seuraavan_vuoden_jarjestaja] FOREIGN KEY([seuraavan_vuoden_jarjestaja_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_seuraavan_vuoden_jarjestaja]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_seuraavan_vuoden_oppilaitos] FOREIGN KEY([seuraavan_vuoden_oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_seuraavan_vuoden_oppilaitos]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_tutkinnon_jarjestaja] FOREIGN KEY([tutkinnon_jarjestaja_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_tutkinnon_jarjestaja]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_tutkinnon_suorittamisoppilaitos] FOREIGN KEY([tutkinnon_suorittamisoppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_oppilaitoksen_taustatiedot_tutkinnon_suorittamisoppilaitos]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_paaasiallinen_toiminta_versio2] FOREIGN KEY([paaasiallinen_toiminta_versio2_id])
REFERENCES [dbo].[d_paaasiallinen_toiminta_versio2] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_paaasiallinen_toiminta_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_pohjoismaa] FOREIGN KEY([pohjoismaa_id])
REFERENCES [dbo].[d_pohjoismaa] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_pohjoismaa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_valtio_etamaa] FOREIGN KEY([etamaa_id])
REFERENCES [dbo].[d_valtio_historia] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_valtio_etamaa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_d_valtio_eumaa] FOREIGN KEY([eumaa_id])
REFERENCES [dbo].[d_valtio_historia] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_d_valtio_eumaa]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_ika1v] FOREIGN KEY([ika_1v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_ika1v]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_ika5v] FOREIGN KEY([ika_5v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_ika5v]
GO


