USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_keskeytaneet]    Script Date: 24.11.2021 9:26:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_tab_keskeytaneet] AS

Select 
[opiskelijat] AS lkm_int,
[tilastovuosi] AS Tilastovuosi
,d1.aineisto AS Aineisto
,d2.lahde AS Lähde
,d3.sukupuoli AS Sukupuoli
,d4.aidinkieli_versio1 AS Äidinkieli
,d5.ika AS Ikä
,d6.ika AS Ikäryhmä
,d7.kunta AS Asuinkunta
,d7.maakunta AS Asuinmaakunta
,d7.avi AS 'Asuinalueen AVI'
,d7.ely AS 'Asuinalueen ELY'
,d8.kansalaisuus_versio1 AS Kansalaisuus
,d9.eumaa AS 'EU-maan kansalainen'
,d10.etamaa AS 'ETA-maan kansalainen'
,d11.pohjoismaa AS 'Pohjoismaan kansalainen'
,d12.vuosiselite AS Aloitusvuosi
,d14.opiskelijan_olo AS Kirjoillaolo
,d15.oppilaitos as "Oppilaitos"
,d15.oppilaitostyyppi as "Oppilaitostyyppi"
,d15.opetuskieli as "Opetuskieli"
,d15.oppilaitoksen_omistajatyyppi as "Oppil. omistajatyyppi"
,d15.koulutuksen_jarjestaja as "Koulutuksen järjestäjä"
,d15.koulutuksen_jarjestajan_kieli as "Koul. järjestäjän kieli"
,d16.koulutus AS Koulutusnimike
,d16.koulutusala2002 AS Koulutusala
,d16.koulutusala2002 AS "Koulutusala (02 luokitus)"
,d16.opintoala1995 AS "Koulutusala (95 luokitus)"
,d16.opintoala2002 AS Opintoala
,Case when d16.koulutusaste2002_koodi in ('63','72')
			then 'Alempi ja ylempi korkeakoulututkinto'
			else d16.koulutusaste2002 end AS Koulutusaste 
,d17.koulutuksen_kieli_versio1 AS 'Koulutuksen kieli'
,d18.kunta AS 'Koulutuksen kunta'
,d18.maakunta AS 'Koulutuksen maakunta'
,d18.avi AS "Koulutuksen AVI-alue"
,d18.ely AS "Koulutuksen ELY-alue"
--,d19.opetushallinnon_koulutus AS Hallinnonala
,d19b.hallinnonala AS  Hallinnonala
,d20.koulutustyyppi AS Koulutustyyppi
,d21.maakunta AS 'Tutk. suoritusmaakunta'
,d22.koulutuksen_jarjestaja AS 'Tutkinnon koul. järjestäjä'
,d22.koulutuksen_jarjestajan_omistajatyyppi AS 'Tutkinnon koul. järjestäjän omistajatyyppi'
,d22.koulutuksen_jarjestajan_kieli 'Tutkinnon koul. järjestäjän kieli'
,d22.koulutuksen_jarjestajan_sijaintikunta AS 'Tutkinnon koul. järjestäjän sijaintikunta'
,d23.oppilaitos AS 'Tutkinnon oppilaitos'
,d23.oppilaitostyyppi as "Tutkinnon oppilaitostyyppi"
,d23.opetuskieli as "Tutkinnon opetuskieli"
,d23.oppilaitoksen_omistajatyyppi as "Tutkinnon oppil. omistajatyyppi"
,d24.koulutus AS 'Tutkinnon koulutusnimike'
,d24.koulutusala2002 AS 'Tutkinnon koulutusala'
,d24.koulutusala2002 AS 'Tutkinnon koulutusala (02 luokitus)'
,d24.opintoala1995 AS "Tutkinnon koulutusala (95 luokitus)"
,d24.opintoala2002 AS 'Tutkinnon opintoala'
,d24.koulutusaste2002 AS 'Tutkinnon koulutusaste'
,d25.koulutustyyppi AS 'Tutkinnon koulutustyyppi'
,d26.maakunta AS 'Seur. vuoden koul. maakunta'
,d27.koulutuksen_jarjestaja AS 'Seur. vuoden koul. järjestäjä'
,d27.koulutuksen_jarjestajan_omistajatyyppi AS 'Seur. vuoden koul. järjestäjän omistajatyyppi'
,d27.koulutuksen_jarjestajan_kieli 'Seur. vuoden koul. järjestäjän kieli'
,d27.koulutuksen_jarjestajan_sijaintikunta AS 'Seur. vuoden koul. järjestäjän sijaintikunta'
,d28.oppilaitos AS 'Seur. vuoden oppilaitos'
,d28.oppilaitostyyppi as "Seur. vuoden oppilaitostyyppi"
,d28.opetuskieli as "Seur. vuoden opetuskieli"
,d28.oppilaitoksen_omistajatyyppi as "Seur. vuoden oppil. omistajatyyppi"
,d29.koulutus AS 'Seur. vuoden koulutusnimike'
,d29.koulutusala2002 AS 'Seur. vuoden koulutusala'
,d29.koulutusala2002 AS 'Seur. vuoden koulutusala (02 luokitus)'
,d29.opintoala1995 AS "Seur. vuoden koulutusala (95 luokitus)"
,d29.opintoala2002 AS 'Seur. vuoden opintoala'
,d29.koulutusaste2002 AS 'Seur. vuoden koulutusaste'
,d30.koulutustyyppi  AS 'Seur. vuoden koulutustyyppi'
,d31.paaasiallinen_toiminta_versio2 AS 'Pääasiallinen toiminta'
,d32.ammattiasema AS Ammattiasema
--uudet
,d0_33.opintojen_kulku_kaste_t2en_mukaan AS 'Opintojen kulku 1a, koul.aste taso 2'
,d0_34.opintojen_kulku_kaste_t2en_mukaan AS 'Opintojen kulku 1b, koul.aste taso 2'
,d0_35.tutkinto_alkuperaisella_kaste_t2ella AS 'Tutk. suor. alkup. koul.asteella, taso 2'
,d0_36.tutkinto_muulla_kaste_t2ella AS 'Tutk. suor. muulla koul.asteella, taso 2'
,d0_37.jatkaa_opiskelua_alkuperaisella_kaste_t2ella AS 'Jatkaa opisk. alkup. koul.asteella, taso 2'
,d0_38.jatkaa_opiskelua_muulla_kaste_t2ella AS 'Jatkaa opisk. muulla koul.asteella, taso 2'

,d1_39.opintojen_kulku_kala_t1n_mukaan AS 'Opintojen kulku 2a, koul.ala taso 1'
,d1_40.opintojen_kulku_kala_t1n_mukaan AS 'Opintojen kulku 2b, koul.ala taso 1'
,d1_41.tutkinto_alkuperaisella_kala_t1lla AS 'Tutk. suor. alkup. koul.alalla, taso 1'
,d1_42.tutkinto_muulla_kala_t1lla AS 'Tutk. suor. muulla koul.alalla, taso 1'
,d1_43.jatkaa_opiskelua_alkuperaisella_kala_t1lla AS 'Jatkaa opisk. alkup. koul.alalla, taso 1'
,d1_44.jatkaa_opiskelua_muulla_kala_t1lla AS 'Jatkaa opisk. muulla koul.alalla, taso 1'

,d2_39.opintojen_kulku_kala_t2n_mukaan AS 'Opintojen kulku 2a, koul.ala taso 2'
,d2_40.opintojen_kulku_kala_t2n_mukaan AS 'Opintojen kulku 2b, koul.ala taso 2'
,d2_41.tutkinto_alkuperaisella_kala_t2lla AS 'Tutk. suor. alkup. koul.alalla, taso 2'
,d2_42.tutkinto_muulla_kala_t2lla AS 'Tutk. suor. muulla koul.alalla, taso 2'
,d2_43.jatkaa_opiskelua_alkuperaisella_kala_t2lla AS 'Jatkaa opisk. alkup. koul.alalla, taso 2'
,d2_44.jatkaa_opiskelua_muulla_kala_t2lla AS 'Jatkaa opisk. muulla koul.alalla, taso 2'

,d3_39.opintojen_kulku_kala_t3n_mukaan AS 'Opintojen kulku 2a, koul.ala taso 3'
,d3_40.opintojen_kulku_kala_t3n_mukaan AS 'Opintojen kulku 2b, koul.ala taso 3'
,d3_41.tutkinto_alkuperaisella_kala_t3lla AS 'Tutk. suor. alkup. koul.alalla, taso 3'
,d3_42.tutkinto_muulla_kala_t3lla AS 'Tutk. suor. muulla koul.alalla, taso 3'
,d3_43.jatkaa_opiskelua_alkuperaisella_kala_t3lla AS 'Jatkaa opisk. alkup. koul.alalla, taso 3'
,d3_44.jatkaa_opiskelua_muulla_kala_t3lla AS 'Jatkaa opisk. muulla koul.alalla, taso 3'

,d77.opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016 AS 'Opintojen kulku 4bb, koul.aste taso 2'
--vanhat
,d33.opintojen_kulku_koulutusasteen_2002_mukaan AS 'Opintojen kulku 1a'
,d34.opintojen_kulku_koulutusasteen_2002_mukaan AS 'Opintojen kulku 1b'
,d35.tutkinto_alkuperaisella_koulutusasteella_2002 AS 'Tutk. suor. alkup. koul.asteella'
,d36.tutkinto_muulla_koulutusasteella_2002 AS 'Tutk. suor. muulla koul.asteella'
,d37.jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002 AS 'Jatkaa opisk. alkup. koul.asteella'
,d38.jatkaa_opiskelua_muulla_koulutusasteella_2002 AS 'Jatkaa opisk. muulla koul.asteella'

,d39.opintojen_kulku_koulutusalan_2002_mukaan AS 'Opintojen kulku 2a'
,d40.opintojen_kulku_koulutusalan_2002_mukaan AS 'Opintojen kulku 2b'
,d41.tutkinto_alkuperaisella_koulutusalalla_2002 AS 'Tutk. suor. alkup. koul.alalla'
,d42.tutkinto_muulla_koulutusalalla_2002 AS 'Tutk. suor. muulla koul.alalla'
,d43.jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002 AS 'Jatkaa opisk. alkup. koul.alalla'
,d44.jatkaa_opiskelua_muulla_koulutusalalla_2002 AS 'Jatkaa opisk. muulla koul.alalla'

,d45.opintojen_kulku_opintoala_2002_mukaan AS 'Opintojen kulku 3a'
,d46.opintojen_kulku_opintoala_2002_mukaan AS 'Opintojen kulku 3b'
,d47.tutkinto_alkuperaisella_opintoalalla_2002 AS 'Tutk. suor. alkup. opintoalalla'
,d48.tutkinto_muulla_opintoalalla_2002 AS 'Tutk. suor. muulla opintoalalla'
,d49.jatkaa_opiskelua_alkuperaisella_opintoalalla_2002 AS 'Jatkaa opisk. alkup. opintoalalla'
,d50.jatkaa_opiskelua_muulla_opintoalalla_2002 AS 'Jatkaa opisk. muulla opintoalalla'

,d51.opintojen_kulku_koulutuksen_jarjestajan_mukaan AS 'Opintojen kulku 4a'
,d52.opintojen_kulku_koulutuksen_jarjestajan_mukaan AS 'Opintojen kulku 4b'
,d53.tutkinto_alkuperaisella_koulutuksen_jarjestajalla AS 'Tutk. suor. alkup. koul. järjestäjällä'
,d54.tutkinto_muulla_koulutuksen_jarjestajalla AS 'Tutk. suor. muulla koul. järjestäjällä'
,d55.jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla AS 'Jatkaa opisk. alkup. koul. järjestäjällä'
,d56.jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla AS 'Jatkaa opisk. muulla koul. järjestäjällä'

,d57.opintojen_kulku_oppilaitoksen_mukaan AS 'Opintojen kulku 5a'
,d58.opintojen_kulku_oppilaitoksen_mukaan AS 'Opintojen kulku 5b'
,d59.tutkinto_alkuperaisessa_oppilaitoksessa AS 'Tutk. suor. alkup. oppilaitoksessa'
,d60.tutkinto_muussa_oppilaitoksessa AS 'Tutk. suor. muussa oppilaitoksessa'
,d61.jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa AS 'Jatkaa opisk. alkup. oppilaitoksessa'
,d62.jatkaa_opiskelua_muussa_oppilaitoksessa AS 'Jatkaa opisk. muussa oppilaitoksessa'

,d63.opintojen_kulku_maakunnan_mukaan AS 'Opintojen kulku 6a'
,d64.opintojen_kulku_maakunnan_mukaan AS 'Opintojen kulku 6b'
,d65.tutkinto_alkuperaisessa_maakunnassa AS 'Tutk. suor. alkup. maakunnassa'
,d66.tutkinto_muussa_maakunnassa AS 'Tutk. suor. muussa maakunnassa'
,d67.jatkaa_opiskelua_alkuperaisessa_maakunnassa AS 'Jatkaa opisk. alkup. maakunnassa'
,d68.jatkaa_opiskelua_muussa_maakunnassa AS 'Jatkaa opisk. muussa maakunnassa'

,d69.opintojen_kulku_koulutussektorin_mukaan AS 'Opintojen kulku 7a'
,d70.opintojen_kulku_koulutussektorin_mukaan AS 'Opintojen kulku 7b'
,d71.tutkinto_alkuperaisella_koulutussektorilla AS 'Tutk. suor. alkup. koul.sektorilla'
,d72.tutkinto_muulla_koulutussektorilla AS 'Tutk. suor. muulla koul.sektorilla'
,d73.jatkaa_opiskelua_alkuperaisella_koulutussektorilla AS 'Jatkaa opisk. alkup. koul.sektorilla'
,d74.jatkaa_opiskelua_muulla_koulutussektorilla AS 'Jatkaa opisk. muulla koul.sektorilla'

,d75.opintojen_kulku_koulutusalan_2002_mukaan_versio2 AS 'Opintojen kulku 2bb'
,d76.opintojen_kulku_opintoala_2002_mukaan_versio2 AS 'Opintojen kulku 3bb'
,d77.opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2 AS 'Opintojen kulku 4bb'
,d78.opintojen_kulku_oppilaitoksen_mukaan_versio2 AS 'Opintojen kulku 5bb'

--järjestysmuuttujat
,d3.jarjestys AS jarj_Sukupuoli
,d4.jarjestys AS jarj_Äidinkieli
,d5.jarjestys_ika AS jarj_Ikä
,d6.jarjestys_ika5v AS jarj_Ikäryhmä
,d7.jarjestys AS jarj_Asuinkunta
,d7.jarjestys_maakunta AS jarj_Asuinmaakunta
,d7.jarjestys_avi AS jarj_AsuinalueenAVI
,d7.jarjestys_ely AS jarj_AsuinalueenELY
,d8.jarjestys AS jarj_Kansalaisuus
,d9.jarjestys_eumaa AS jarj_EU_maankansalainen
,d10.jarjestys_etamaa AS jarj_ETA_maankansalainen
,d11.jarjestys AS jarj_Pohjoismaankansalainen
,d14.jarjestys AS jarj_Kirjoillaolo
,d15.jarjestys_oppilaitostyyppi as jarj_Oppilaitostyyppi
,d15.jarjestys_opetuskieli as jarj_Opetuskieli
,d15.jarjestys_omistajatyyppi as jarj_Oppil_omistajatyyppi
,d15.jarjestys_koulutuksen_jarjestajan_kieli as jarj_Koul_järjestäjänkieli
,d16.jarjestys_koulutusala2002 AS jarj_Koulutusala
,d16.jarjestys_opintoala1995
,d16.jarjestys_opintoala2002 AS jarj_Opintoala
,Case when d16.koulutusaste2002_koodi in ('63','72')

                                     then '72'

                                     else d16.koulutusaste2002_koodi end AS jarj_Koulutusaste
,d17.jarjestys AS jarj_Koulutuksenkieli
,d18.jarjestys AS jarj_Koulutuksenkunta
,d18.jarjestys_maakunta AS jarj_Koulutuksenmaakunta
,d18.jarjestys_avi AS jarj_KoulutuksenAVI_alue
,d18.jarjestys_ely AS jarj_KoulutuksenELY_alue
,d19b.jarjestys AS jarj_Hallinnonala
,d20.jarjestys AS jarj_Koulutustyyppi
,d21.jarjestys_maakunta AS jarj_Tutk_suoritusmaakunta
,d22.jarjestys_koulutuksenjarjestaja AS jarj_Tutkinnon_koul_järjestäjän_omistajatyyppi
,d22.jarjestys_koulutuksen_jarjestajan_kieli AS jarj_Tutkinnon_koul_järjestäjän_kieli
,d23.jarjestys_oppilaitostyyppi AS jarj_Tutkinnon_oppilaitostyyppi
,d23.jarjestys_opetuskieli AS jarj_Tutkinnon_opetuskieli
,d23.jarjestys_omistajatyyppi AS jarj_Tutkinnon_oppil_omistajatyyppi
,d24.jarjestys_koulutusala2002 AS jarj_Tutkinnon_koulutusala_02_luokitus
,d24.jarjestys_opintoala1995 AS jarj_Tutkinnon_koulutusala_95_luokitus
,d24.jarjestys_opintoala2002 AS jarj_Tutkinnon_opintoala
,d24.jarjestys_koulutusaste2002 AS jarj_Tutkinnon_koulutusaste
,d25.jarjestys AS jarj_Tutkinnon_koulutustyyppi
,d26.jarjestys_maakunta AS jarj_Seur_vuoden_koul_maakunta
,d27.jarjestys_koulutuksenjarjestaja AS jarj_Seur_vuoden_koul_järjestäjän_omistajatyyppi
,d27.jarjestys_koulutuksen_jarjestajan_kieli AS jarj_Seur_vuoden_koul_järjestäjän_kieli
,d28.jarjestys_oppilaitostyyppi AS jarj_Seur_vuoden_oppilaitostyyppi
,d28.jarjestys_opetuskieli AS jarj_Seur_vuoden_opetuskieli
,d28.jarjestys_omistajatyyppi AS jarj_Seur_vuoden_oppil_omistajatyyppi
,d29.jarjestys_koulutusala2002 AS jarj_Seur_vuoden_koulutusala_02_luokitus
,d29.jarjestys_opintoala1995 AS jarj_Seur_vuoden_koulutusala_95_luokitus
,d29.jarjestys_opintoala2002 AS jarj_Seur_vuoden_opintoala
,d29.jarjestys_koulutusaste2002 AS jarj_Seur_vuoden_koulutusaste
,d30.jarjestys AS jarj_Seur_vuoden_koulutustyyppi
,d31.jarjestys AS jarj_Pääasiallinen_toiminta
,d32.jarjestys AS jarj_Ammattiasema
--uudet
,d0_33.jarjestys_1a_t2
,d0_34.jarjestys_1b_t2
,d0_35.jarjestys_1c_t2
,d0_36.jarjestys_1d_t2
,d0_37.jarjestys_1e_t2
,d0_38.jarjestys_1f_t2

,d1_39.jarjestys_2a_t1
,d1_40.jarjestys_2b_t1
,d1_41.jarjestys_2c_t1
,d1_42.jarjestys_2d_t1
,d1_43.jarjestys_2e_t1
,d1_44.jarjestys_2f_t1

,d2_39.jarjestys_2a_t2
,d2_40.jarjestys_2b_t2
,d2_41.jarjestys_2c_t2
,d2_42.jarjestys_2d_t2
,d2_43.jarjestys_2e_t2
,d2_44.jarjestys_2f_t2

,d3_39.jarjestys_2a_t3
,d3_40.jarjestys_2b_t3
,d3_41.jarjestys_2c_t3
,d3_42.jarjestys_2d_t3
,d3_43.jarjestys_2e_t3
,d3_44.jarjestys_2f_t3
--vanhat
,d33.jarjestys_1a
,d34.jarjestys_1b
,d35.jarjestys_1c
,d36.jarjestys_1d
,d37.jarjestys_1e
,d38.jarjestys_1f

,d39.jarjestys_2a
,d40.jarjestys_2b
,d41.jarjestys_2c
,d42.jarjestys_2d
,d43.jarjestys_2e
,d44.jarjestys_2f

,d45.jarjestys_3a
,d46.jarjestys_3b
,d47.jarjestys_3c
,d48.jarjestys_3d
,d49.jarjestys_3e
,d50.jarjestys_3f

,d51.jarjestys_4a
,d52.jarjestys_4b
,d53.jarjestys_4c
,d54.jarjestys_4d
,d55.jarjestys_4e
,d56.jarjestys_4f

,d57.jarjestys_5a
,d58.jarjestys_5b
,d59.jarjestys_5c
,d60.jarjestys_5d
,d61.jarjestys_5e
,d62.jarjestys_5f

,d63.jarjestys_6a
,d64.jarjestys_6b
,d65.jarjestys_6c
,d66.jarjestys_6d
,d67.jarjestys_6e
,d68.jarjestys_6f

,d69.jarjestys_7a
,d70.jarjestys_7b
,d71.jarjestys_7c
,d72.jarjestys_7d
,d73.jarjestys_7e
,d74.jarjestys_7f

,d75.jarjestys_2bb
,d76.jarjestys_3bb
,d77.jarjestys_4bb
,d78.jarjestys_5bb

--koodimuuttujat
,d1.aineisto_koodi AS 'Koodit Aineisto'
,d2.lahde_koodi AS 'Koodit Lähde'
,d7.kunta_koodi AS 'Koodit Asuinkunta'
,d7.maakunta_koodi AS 'Koodit Asuinmaakunta'
,d15.oppilaitoskoodi AS 'Koodit Oppilaitos'
,d15.koulutuksen_jarjestajakoodi AS 'Koodit Koulutuksen järjestäjä'
,d16.koulutus_koodi AS 'Koodit Koulutusnimike'
,d16.koulutusala2002_koodi AS 'Koodit Koulutusala (02 luokitus)'
,d16.opintoala1995_koodi AS 'Koodit Koulutusala (95 luokitus)'
,d16.opintoala2002_koodi AS 'Koodit Opintoala'
,Case when d16.koulutusaste2002_koodi in ('63','72')

                                     then '72'

                                     else d16.koulutusaste2002_koodi end AS 'Koodit Koulutusaste'
,d18.kunta_koodi AS 'Koodit Koulutuksen kunta'
,d18.maakunta_koodi AS 'Koodit Koulutuksen maakunta'
,d20.koulutustyyppi_koodi AS 'Koodit Koulutustyyppi'
,d21.maakunta_koodi AS 'Koodit Tutk. suoritusmaakunta'
,d22.koulutuksen_jarjestajakoodi AS 'Koodit Tutkinnon koul. järjestäjä'
,d23.oppilaitoskoodi AS 'Koodit Tutkinnon oppilaitos'
,d24.koulutus_koodi AS 'Koodit Tutkinnon koulutusnimike'
,d24.koulutusala2002_koodi AS 'Koodit Tutkinnon koulutusala (02 luokitus)'
,d24.opintoala1995_koodi AS 'Koodit Tutkinnon koulutusala (95 luokitus)'
,d24.opintoala2002_koodi AS 'Koodit Tutkinnon opintoala'
,d24.koulutusaste2002_koodi AS 'Koodit Tutkinnon koulutusaste'
,d25.koulutustyyppi_koodi AS 'Koodit Tutkinnon koulutustyyppi'
,d26.maakunta_koodi AS 'Koodit Seur. vuoden koul. maakunta'
,d27.koulutuksen_jarjestajakoodi AS 'Koodit Seur. vuoden koul. järjestäjä'
,d28.oppilaitoskoodi AS 'Koodit Seur. vuoden oppilaitos'
,d29.koulutus_koodi AS 'Koodit Seur. vuoden koulutusnimike'
,d29.koulutusala2002_koodi AS 'Koodit Seur. vuoden koulutusala (02 luokitus)'
,d29.opintoala1995_koodi AS 'Koodit Seur. vuoden koulutusala (95 luokitus)'
,d29.opintoala2002_koodi AS 'Koodit Seur. vuoden opintoala'
,d29.koulutusaste2002_koodi AS 'Koodit Seur. vuoden koulutusaste'
,d30.koulutustyyppi_koodi AS 'Koodit Seur. vuoden koulutustyyppi'

--Ruotsi
,[tilastovuosi] AS Statistikår
,d3.sukupuoli_SV AS Kön
,d4.aidinkieli_versio1_SV AS Modersmål
,d6.ika_SV AS Åldersgrupp
,d7.kunta_SV AS Bostadskommun
,d7.maakunta_SV AS Bostadslandskap
,d8.kansalaisuus_versio1_SV AS Medborgarskap
,d16.koulutus_SV AS Utbildningsbenämning
,d17.koulutuksen_kieli_versio1_SV AS [Utbildningens språk]
,d18.kunta_SV AS [Ubildningens kommun]
,d18.maakunta_SV AS [Utbildningens landskap]
,d21.maakunta_SV AS [Landskap där examen avlagts]
,d15.koulutuksen_jarjestaja_SV as [Utbildningsanordnare]
,d15.oppilaitos_SV as [Universitet]
,d15.oppilaitos_SV as [Läroanstalt]
,d75.opintojen_kulku_koulutusalan_2002_mukaan_versio2_SV AS 'Studieförlopp (utb.område)'
,d78.opintojen_kulku_oppilaitoksen_mukaan_versio2_SV AS 'Studieförlopp (läroanstalt)'
,Case when d16.koulutusaste2002_koodi in ('63','72')
			then 'Lägre och högre högskoleexamen'
			else d16.koulutusaste2002_SV end AS Utbildningsnivå
,d20.koulutustyyppi_SV AS [Typ av utbildning]
,d16.koulutusala2002_SV AS [Utbildningsområde 2002]
,d16.opintoala2002_SV AS [Studieområde 2002]
,d28.oppilaitos_SV AS 'Nästä års läroanstalt'
,d23.oppilaitos_SV AS 'Läroanstalt där examen avlagts'
,d16.opintoala1995_SV AS [Studieområde 1995]

--Englanti
,[tilastovuosi] AS [Statistical year]
,d3.sukupuoli_EN AS Gender
,d4.aidinkieli_versio1_EN AS [Mother tongue]
,d6.ika_EN AS [Age group]
,d7.kunta_EN AS [Municipality of residence]
,d7.maakunta_EN AS [Region of residence]
,d8.kansalaisuus_versio1_EN AS Nationality
,d16.koulutus_EN AS [Name of education]
,d17.koulutuksen_kieli_versio1_EN AS [Language of education]
,d18.kunta_EN AS [Municipality of education]
,d18.maakunta_EN AS [Region of education]
,d21.maakunta_EN AS [Region of degree]
,d15.koulutuksen_jarjestaja_EN as [Education provider]
,d15.oppilaitos_EN as University
,d15.oppilaitos_EN as [Educational institution]
,d75.opintojen_kulku_koulutusalan_2002_mukaan_versio2_EN AS 'Progress of studies (field of ed.)'
,d78.opintojen_kulku_oppilaitoksen_mukaan_versio2_EN AS 'Progress of studies (ed. institution)'
,Case when d16.koulutusaste2002_koodi in ('63','72')
			then 'Bachelor''s and Master''s degree'
			else d16.koulutusaste2002_EN end AS 'Level of education'
,d20.koulutustyyppi_EN AS [Type of education]
,d16.koulutusala2002_EN AS [Field of education 2002]
,d16.opintoala2002_EN AS [Subfield of education 2002]
,d28.oppilaitos_EN AS 'Next year''s ed. institution'
,d23.oppilaitos_EN AS 'Ed. institution of degree'
,d16.opintoala1995_EN AS [Subfield of education 1995]

--,d19.opetushallinnon_koulutus_SV AS Förvaltningsområde
,d19b.hallinnonala_SV AS Förvaltningsområde
--,d19.opetushallinnon_koulutus_EN AS [Administrative sector]
,d19b.hallinnonala_EN AS 'Administrative sector'

--isced
,d16.iscle2011 as "Koulutusaste, taso 1"
,d16.Koulutusaste_taso2 as "Koulutusaste, taso 2"
,d16.iscfibroad2013 as "Koulutusala, taso 1"
,d16.iscfinarrow2013 as "Koulutusala, taso 2"
,d16.iscfi2013 as "Koulutusala, taso 3"
,d16.OKM_ohjauksen_ala as "OKM ohjauksen ala"
,d16.iscle2011_SV as "Utbildn.nivå, nivå 1"
,d16.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
,d16.iscfibroad2013_SV as "Utbildn.område, nivå 1"
,d16.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
,d16.iscfi2013_SV as "Utbildn.område, nivå 3"
,d16.OKM_ohjauksen_ala_SV as "UKM-styrningsområde"
,d16.iscle2011_EN as "Level of education, tier 1"
,d16.Koulutusaste_taso2_EN as "Level of education, tier 2"
,d16.iscfibroad2013_EN as "Field of education, tier 1"
,d16.iscfinarrow2013_EN as "Field of education, tier 2"
,d16.iscfi2013_EN as "Field of education, tier 3"
,d16.OKM_ohjauksen_ala_EN as "Field of ed., HE steering"
,d16.jarjestys_iscle2011 as jarj_isced_koulast1
,d16.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
,d16.jarjestys_iscfibroad2013 as jarj_isced_koulala1
,d16.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
,d16.jarjestys_iscfi2013 as jarj_isced_koulala3
,d16.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1
,d16.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
,d16.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
,d16.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
,d16.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
,d16.iscfi2013_koodi as "Koodit Koulutusala, taso 3"
,d16.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala"

FROM dbo.f_keskeyttaneet
	LEFT JOIN d_aineisto d1 ON d1.id = aineisto_id
	LEFT JOIN d_lahde d2 ON d2.id = aineisto_id
	LEFT JOIN d_sukupuoli d3 ON d3.id = sukupuoli_id
	LEFT JOIN d_aidinkieli_versio1 d4 ON d4.id = aidinkieli_versio1x_id
	LEFT JOIN d_ika d5 ON d5.id = ika_1v_id
	LEFT JOIN d_ika d6 ON d6.id = ika_5v_id
	LEFT JOIN d_alueluokitus d7 ON d7.id= kotikunta_id
	LEFT JOIN d_kansalaisuus_versio1 d8 ON d8.id= kansalaisuus_versio1_id
	LEFT JOIN d_valtio d9 ON d9.id= eumaa_id
	LEFT JOIN d_valtio d10 ON d10.id= etamaa_id
	LEFT JOIN d_pohjoismaa d11 ON d11.id= pohjoismaa_id
	LEFT JOIN d_kausi d12 ON d12.kausi_id= kirjoihintulovuosi_id
	LEFT JOIN d_opiskelijan_olo d14 ON d14.id= opiskelijan_olo_lk_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d15 ON d15.id= oppilaitoksen_taustatiedot_id
	LEFT JOIN d_koulutusluokitus d16 ON d16.id= koulutusluokitus_id
	LEFT JOIN d_koulutuksen_kieli_versio1 d17 ON d17.id= koulutuksen_kieli_versio1_id
	LEFT JOIN d_alueluokitus d18 ON d18.id= koulutuksen_kunta_id
	LEFT JOIN d_opetushallinnon_koulutus d19 ON d19.id= opetushallinnon_koulutus_id
	LEFT JOIN d_hallinnonala2 d19b ON d19b.id=hallinnonala2_id
	LEFT JOIN d_koulutustyyppi d20 ON d20.id= koulutustyyppi_id
	LEFT JOIN d_alueluokitus d21 ON d21.id= tutkinnon_suorittamismaakunta_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d22 ON d22.id= tutkinnon_jarjestaja_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d23 ON d23.id= tutkinnon_suorittamisoppilaitos_id
	LEFT JOIN d_koulutusluokitus d24 ON d24.id= tutkinnon_koulutusluokitus_id
	LEFT JOIN d_koulutustyyppi d25 ON d25.id= tutkinnon_koulutustyyppi_id
	LEFT JOIN d_alueluokitus d26 ON d26.id= seuraavan_vuoden_maakunta_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d27 ON d27.id= seuraavan_vuoden_jarjestaja_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d28 ON d28.id= seuraavan_vuoden_oppilaitos_id
	LEFT JOIN d_koulutusluokitus d29 ON d29.id= seuraavan_vuoden_koulutusluokitus_id
	LEFT JOIN d_koulutustyyppi d30 ON d30.id= seuraavan_vuoden_koulutustyyppi_id
	LEFT JOIN d_paaasiallinen_toiminta_versio2 d31 ON d31.id = paaasiallinen_toiminta_versio2_id
	LEFT JOIN d_ammattiasema d32 ON d32.id = ammattiasema_id
	--uudet
	LEFT JOIN d_opintojen_kulku_kaste_t2en_mukaan d0_33 ON d0_33.id = [1a_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan_id]
	LEFT JOIN d_opintojen_kulku_kaste_t2en_mukaan d0_34 ON d0_34.id = [1b_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan_id]
	LEFT JOIN d_tutkinto_alkuperaisella_kaste_t2ella d0_35 ON d0_35.id = [1c_tutkinto_alkuperaisella_kaste_t2ella_id]
	LEFT JOIN d_tutkinto_muulla_kaste_t2ella d0_36 ON d0_36.id = [1d_tutkinto_muulla_kaste_t2ella_id]
	LEFT JOIN d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella d0_37 ON d0_37.id = [1e_jatkaa_opiskelua_alkuperaisella_kaste_t2ella_id]
	LEFT JOIN d_jatkaa_opiskelua_muulla_kaste_t2ella d0_38 ON d0_38.id = [1f_jatkaa_opiskelua_muulla_kaste_t2ella_id]

	LEFT JOIN d_opintojen_kulku_kala_t1n_mukaan d1_39 ON d1_39.id = [2a_opiskelijoiden_opintojen_kulku_kala_t1_mukaan_id]
	LEFT JOIN d_opintojen_kulku_kala_t1n_mukaan d1_40 ON d1_40.id = [2b_opiskelijoiden_opintojen_kulku_kala_t1_mukaan_id]
	LEFT JOIN d_tutkinto_alkuperaisella_kala_t1lla d1_41 ON d1_41.id = [2c_tutkinto_alkuperaisella_kala_t1lla_id]
	LEFT JOIN d_tutkinto_muulla_kala_t1lla d1_42 ON d1_42.id = [2d_tutkinto_muulla_kala_t1lla_id]
	LEFT JOIN d_jatkaa_opiskelua_alkuperaisella_kala_t1lla d1_43 ON d1_43.id = [2e_jatkaa_opiskelua_alkuperaisella_kala_t1lla_id]
	LEFT JOIN d_jatkaa_opiskelua_muulla_kala_t1lla d1_44 ON d1_44.id = [2f_jatkaa_opiskelua_muulla_kala_t1lla_id]

	LEFT JOIN d_opintojen_kulku_kala_t2n_mukaan d2_39 ON d2_39.id = [2a_opiskelijoiden_opintojen_kulku_kala_t2_mukaan_id]
	LEFT JOIN d_opintojen_kulku_kala_t2n_mukaan d2_40 ON d2_40.id = [2b_opiskelijoiden_opintojen_kulku_kala_t2_mukaan_id]
	LEFT JOIN d_tutkinto_alkuperaisella_kala_t2lla d2_41 ON d2_41.id = [2c_tutkinto_alkuperaisella_kala_t2lla_id]
	LEFT JOIN d_tutkinto_muulla_kala_t2lla d2_42 ON d2_42.id = [2d_tutkinto_muulla_kala_t2lla_id]
	LEFT JOIN d_jatkaa_opiskelua_alkuperaisella_kala_t2lla d2_43 ON d2_43.id = [2e_jatkaa_opiskelua_alkuperaisella_kala_t2lla_id]
	LEFT JOIN d_jatkaa_opiskelua_muulla_kala_t2lla d2_44 ON d2_44.id = [2f_jatkaa_opiskelua_muulla_kala_t2lla_id]

	LEFT JOIN d_opintojen_kulku_kala_t3n_mukaan d3_39 ON d3_39.id = [2a_opiskelijoiden_opintojen_kulku_kala_t3_mukaan_id]
	LEFT JOIN d_opintojen_kulku_kala_t3n_mukaan d3_40 ON d3_40.id = [2b_opiskelijoiden_opintojen_kulku_kala_t3_mukaan_id]
	LEFT JOIN d_tutkinto_alkuperaisella_kala_t3lla d3_41 ON d3_41.id = [2c_tutkinto_alkuperaisella_kala_t3lla_id]
	LEFT JOIN d_tutkinto_muulla_kala_t3lla d3_42 ON d3_42.id = [2d_tutkinto_muulla_kala_t3lla_id]
	LEFT JOIN d_jatkaa_opiskelua_alkuperaisella_kala_t3lla d3_43 ON d3_43.id = [2e_jatkaa_opiskelua_alkuperaisella_kala_t3lla_id]
	LEFT JOIN d_jatkaa_opiskelua_muulla_kala_t3lla d3_44 ON d3_44.id = [2f_jatkaa_opiskelua_muulla_kala_t3lla_id]
	--vanhat
	LEFT JOIN d_opintojen_kulku_koulutusasteen_2002_mukaan  d33 ON d33.id = [1a_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan_id]
	LEFT JOIN d_opintojen_kulku_koulutusasteen_2002_mukaan  d34 ON d34.id = [1b_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan_id]
	LEFT JOIN d_tutkinto_alkuperaisella_koulutusasteella_2002  d35 ON d35.id = [1c_tutkinto_alkuperaisella_koulutusasteella_2002_id]
	LEFT JOIN d_tutkinto_muulla_koulutusasteella_2002  d36 ON d36.id = [1d_tutkinto_muulla_koulutusasteella_2002_id]
	LEFT JOIN d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002 d37 ON d37.id = [1e_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_id]
	LEFT JOIN d_jatkaa_opiskelua_muulla_koulutusasteella_2002 d38 ON d38.id = [1f_jatkaa_opiskelua_muulla_koulutusasteella_2002_id]

	LEFT JOIN d_opintojen_kulku_koulutusalan_2002_mukaan d39 ON d39.id = [2a_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id]
	LEFT JOIN d_opintojen_kulku_koulutusalan_2002_mukaan d40 ON d40.id = [2b_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id]
	LEFT JOIN d_tutkinto_alkuperaisella_koulutusalalla_2002  d41 ON d41.id = [2c_tutkinto_alkuperaisella_koulutusalalla_2002_id]
	LEFT JOIN d_tutkinto_muulla_koulutusalalla_2002  d42 ON d42.id = [2d_tutkinto_muulla_koulutusalalla_2002_id]
	LEFT JOIN d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002  d43 ON d43.id = [2e_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_id]
	LEFT JOIN d_jatkaa_opiskelua_muulla_koulutusalalla_2002  d44 ON d44.id = [2f_jatkaa_opiskelua_muulla_koulutusalalla_2002_id]

	LEFT JOIN d_opintojen_kulku_opintoalan_2002_mukaan d45 ON d45.id = [3a_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id]
	LEFT JOIN d_opintojen_kulku_opintoalan_2002_mukaan d46 ON d46.id = [3b_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id]
	LEFT JOIN d_tutkinto_alkuperaisella_opintoalalla_2002  d47 ON d47.id = [3c_tutkinto_alkuperaisella_opintoalalla_2002_id]
	LEFT JOIN d_tutkinto_muulla_opintoalalla_2002  d48 ON d48.id = [3d_tutkinto_muulla_opintoalalla_2002_id]
	LEFT JOIN d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002  d49 ON d49.id = [3e_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_id]
	LEFT JOIN d_jatkaa_opiskelua_muulla_opintoalalla_2002  d50 ON d50.id = [3f_jatkaa_opiskelua_muulla_opintoalalla_2002_id]

	LEFT JOIN d_opintojen_kulku_koulutuksen_jarjestajan_mukaan d51 ON d51.id = [4a_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id]
	LEFT JOIN d_opintojen_kulku_koulutuksen_jarjestajan_mukaan d52 ON d52.id = [4b_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id]
	LEFT JOIN d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla  d53 ON d53.id = [4c_tutkinto_alkuperaisella_koulutuksen_jarjestajalla_id]
	LEFT JOIN d_tutkinto_muulla_koulutuksen_jarjestajalla  d54 ON d54.id = [4d_tutkinto_muulla_koulutuksen_jarjestajalla_id]
	LEFT JOIN d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla  d55 ON d55.id = [4e_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_id]
	LEFT JOIN d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla  d56 ON d56.id = [4f_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_id]

	LEFT JOIN d_opintojen_kulku_oppilaitoksen_mukaan d57 ON d57.id = [5a_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id]
	LEFT JOIN d_opintojen_kulku_oppilaitoksen_mukaan d58 ON d58.id = [5b_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id]
	LEFT JOIN d_tutkinto_alkuperaisessa_oppilaitoksessa  d59 ON d59.id = [5c_tutkinto_alkuperaisessa_oppilaitoksessa_id]
	LEFT JOIN d_tutkinto_muussa_oppilaitoksessa  d60 ON d60.id = [5d_tutkinto_muussa_oppilaitoksessa_id]
	LEFT JOIN d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa  d61 ON d61.id = [5e_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_id]
	LEFT JOIN d_jatkaa_opiskelua_muussa_oppilaitoksessa d62 ON d62.id = [5f_jatkaa_opiskelua_muussa_oppilaitoksessa_id]

	LEFT JOIN d_opintojen_kulku_maakunnan_mukaan d63 ON d63.id = [6a_opiskelijoiden_opintojen_kulku_maakunnan_mukaan_id]
	LEFT JOIN d_opintojen_kulku_maakunnan_mukaan d64 ON d64.id = [6b_opiskelijoiden_opintojen_kulku_maakunnan_mukaan_id]
	LEFT JOIN d_tutkinto_alkuperaisessa_maakunnassa  d65 ON d65.id = [6c_tutkinto_alkuperaisessa_maakunnassa_id]
	LEFT JOIN d_tutkinto_muussa_maakunnassa  d66 ON d66.id = [6d_tutkinto_muussa_maakunnassa_id]
	LEFT JOIN d_jatkaa_opiskelua_alkuperaisessa_maakunnassa  d67 ON d67.id = [6e_jatkaa_opiskelua_alkuperaisessa_maakunnassa_id]
	LEFT JOIN d_jatkaa_opiskelua_muussa_maakunnassa d68 ON d68.id = [6f_jatkaa_opiskelua_muussa_maakunnassa_id]

	LEFT JOIN d_opintojen_kulku_koulutussektorin_mukaan d69 ON d69.id = [7a_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan_id]
	LEFT JOIN d_opintojen_kulku_koulutussektorin_mukaan d70 ON d70.id = [7b_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan_id]
	LEFT JOIN d_tutkinto_alkuperaisella_koulutussektorilla d71 ON d71.id = [7c_tutkinto_alkuperaisella_koulutussektorilla_id]
	LEFT JOIN d_tutkinto_muulla_koulutussektorilla d72 ON d72.id = [7d_tutkinto_muulla_koulutussektorilla_id]
	LEFT JOIN d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla d73 ON d73.id = [7e_jatkaa_opiskelua_alkuperaisella_koulutussektorilla_id]
	LEFT JOIN d_jatkaa_opiskelua_muulla_koulutussektorilla d74 ON d74.id = [7f_jatkaa_opiskelua_muulla_koulutussektorilla_id]

	LEFT JOIN d_opintojen_kulku_koulutusalan_2002_mukaan_versio2 d75 ON d75.id = [2bb_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id]
	LEFT JOIN d_opintojen_kulku_opintoalan_2002_mukaan_versio2 d76 ON d76.id = [3bb_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id]
	LEFT JOIN d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2 d77 ON d77.id = [4bb_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id]
	LEFT JOIN d_opintojen_kulku_oppilaitoksen_mukaan_versio2 d78 ON d78.id = [5bb_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id]




GO


