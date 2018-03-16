USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_korkeakouluopiskelijoiden_aikaisempi_koulutus_amk]    Script Date: 16.3.2018 17:10:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER VIEW [dbo].[v_f_tab_korkeakouluopiskelijoiden_aikaisempi_koulutus_amk] AS

Select [Opisk2] = opiskelijat,
[Aloitt2] = coalesce(aloittaneet,0)
,[Ylempi_korkeakoulututkinto] = ylempi_korkeakoulututkinto
,[Ylempi_amk_tutkinto] = ylempi_amk_tutkinto
,[Alempi_korkeakoulututkinto] = alempi_korkeakoulututkinto
,[Amk_tutkinto] = amk_tutkinto
,[Ammatillinen_perustutkinto] = ammatillinen_perustutkinto
,[Ylioppilastutkinto] = ylioppilastutkinto
,[Ei_perusasteen_jalkeista_koulutusta] = ei_perusasteen_jalkeista_koulutusta
,[Tilastovuosi] AS Tilastovuosi
,d2.aidinkieli_versio1 AS Äidinkieli
,d3.avi AS "Asuinalueen AVI"
,d3.ely AS "Asuinalueen ELY"
,d3.kielisuhde AS "Asuinkunnan kielisuhde"
,d3.maakunta AS Asuinmaakunta
,d3.kunta AS Asuinkunta
,d4.sukupuoli AS Sukupuoli
,d5.ika AS Ikä
,d5.ika5v AS Ikäryhmä
,d5b.ika AS "Ikä 15-65"
,d5b.ika5v AS "Ikäryhmä 15-65"
,d5c.ika AS "Ikä 18-65"
,d5c.ika5v AS "Ikäryhmä 18-65"
,d6.ika5v AS Ikäryhmä2
,d7.koulutustyyppi AS Koulutustyyppi
,d8.kansalaisuus_versio2 AS Kansalaisuus
,d9.oppilaitos AS Oppilaitos
,d9.oppilaitos AS Yliopisto
,d9.oppilaitos AS Ammattikorkeakoulu
,d9.opetuskieli AS Opetuskieli
,d9.oppilaitoksen_omistajatyyppi AS "Oppilaitoksen omistajatyyppi"
,d9.oppilaitostyyppi AS Oppilaitostyyppi
,d10.lahde AS Lähde
,d12.opiskelijan_olo AS "Kirjoillaolo (syysk.)"
,d12b.opiskelijan_olo_tamm AS "Kirjoillaolo (tammik.)"
,d13.rahoituslahde AS Rahoituslähde
,d14a.oppilaitos AS "Pohjakoul. oppilaitos (lukio)"
,d14a.opetuskieli AS "Pohjakoul. oppil. opetuskieli (lukio)"
,d14a.oppilaitoksen_omistajatyyppi AS "Pohjakoul. oppil. omistajatyyppi (lukio)"
,d14a.oppilaitostyyppi AS "Pohjakoul. oppil.tyyppi (lukio)"
,d14b.oppilaitos AS "Pohjakoul. oppilaitos (amm)"
,d14b.opetuskieli AS "Pohjakoul. oppil. opetuskieli (amm)"
,d14b.oppilaitoksen_omistajatyyppi AS "Pohjakoul. oppil. omistajatyyppi (amm)"
,d14b.oppilaitostyyppi AS "Pohjakoul. oppil.tyyppi (amm)"
,d14c.oppilaitos AS "Pohjakoul. oppilaitos (amk)"
,d14c.opetuskieli AS "Pohjakoul. oppil. opetuskieli (amk)"
,d14c.oppilaitoksen_omistajatyyppi AS "Pohjakoul. oppil. omistajatyyppi (amk)"
,d14c.oppilaitostyyppi AS "Pohjakoul. oppil.tyyppi (amk)"
,d14d.oppilaitos AS "Pohjakoul. oppilaitos (ylempi amk)"
,d14d.opetuskieli AS "Pohjakoul. oppil. opetuskieli (ylempi amk)"
,d14d.oppilaitoksen_omistajatyyppi AS "Pohjakoul. oppil. omistajatyyppi (ylempi amk)"
,d14d.oppilaitostyyppi AS "Pohjakoul. oppil.tyyppi (ylempi amk)"
,d14e.oppilaitos AS "Pohjakoul. oppilaitos (alempi kk)"
,d14e.opetuskieli AS "Pohjakoul. oppil. opetuskieli (alempi kk)"
,d14e.oppilaitoksen_omistajatyyppi AS "Pohjakoul. oppil. omistajatyyppi (alempi kk)"
,d14e.oppilaitostyyppi AS "Pohjakoul. oppil.tyyppi (alempi kk)"
,d14f.oppilaitos AS "Pohjakoul. oppilaitos (ylempi kk)"
,d14f.opetuskieli AS "Pohjakoul. oppil. opetuskieli (ylempi kk)"
,d14f.oppilaitoksen_omistajatyyppi AS "Pohjakoul. oppil. omistajatyyppi (ylempi kk)"
,d14f.oppilaitostyyppi AS "Pohjakoul. oppil.tyyppi (ylempi kk)"
,d15a.opintoala1995 AS "Pohjakoul. koul.ala (95 luokitus) (lukio)"
,d15a.opintoala2002 AS "Pohjakoul. opintoala (lukio)"
,d15a.koulutusala2002 AS "Pohjakoul. koul.ala (02 luokitus) (lukio)"
,d15a.koulutus AS "Pohjakoul. koul.nimike (lukio)"
,d15a.koulutusaste2002 as "Pohjakoul. koul.aste (lukio)"
,d15b.opintoala1995 AS "Pohjakoul. koul.ala (95 luokitus) (amm)"
,d15b.opintoala2002 AS "Pohjakoul. opintoala (amm)"
,d15b.koulutusala2002 AS "Pohjakoul. koul.ala (02 luokitus) (amm)"
,d15b.koulutus AS "Pohjakoul. koul.nimike (amm)"
,d15b.koulutusaste2002 as "Pohjakoul. koul.aste (amm)"
,d15c.opintoala1995 AS "Pohjakoul. koul.ala (95 luokitus) (amk)"
,d15c.opintoala2002 AS "Pohjakoul. opintoala (amk)"
,d15c.koulutusala2002 AS "Pohjakoul. koul.ala (02 luokitus) (amk)"
,d15c.koulutus AS "Pohjakoul. koul.nimike (amk)"
,d15c.koulutusaste2002 as "Pohjakoul. koul.aste (amk)"
,d15d.opintoala1995 AS "Pohjakoul. koul.ala (95 luokitus) (ylempi amk)"
,d15d.opintoala2002 AS "Pohjakoul. opintoala (ylempi amk)"
,d15d.koulutusala2002 AS "Pohjakoul. koul.ala (02 luokitus) (ylempi amk)"
,d15d.koulutus AS "Pohjakoul. koul.nimike (ylempi amk)"
,d15d.koulutusaste2002 as "Pohjakoul. koul.aste (ylempi amk)"
,d15e.opintoala1995 AS "Pohjakoul. koul.ala (95 luokitus) (alempi kk)"
,d15e.opintoala2002 AS "Pohjakoul. opintoala (alempi kk)"
,d15e.koulutusala2002 AS "Pohjakoul. koul.ala (02 luokitus) (alempi kk)"
,d15e.koulutus AS "Pohjakoul. koul.nimike (alempi kk)"
,d15e.koulutusaste2002 as "Pohjakoul. koul.aste (alempi kk)"
,d15f.opintoala1995 AS "Pohjakoul. koul.ala (95 luokitus) (ylempi kk)"
,d15f.opintoala2002 AS "Pohjakoul. opintoala (ylempi kk)"
,d15f.koulutusala2002 AS "Pohjakoul. koul.ala (02 luokitus) (ylempi kk)"
,d15f.koulutus AS "Pohjakoul. koul.nimike (ylempi kk)"
,d15f.koulutusaste2002 as "Pohjakoul. koul.aste (ylempi kk)"
,d15g.opintoala1995 AS "Pohjakoul. koul.ala (95 luokitus)"
,d15g.opintoala2002 AS "Pohjakoul. opintoala"
,d15g.koulutusala2002 AS "Pohjakoul. koul.ala (02 luokitus)"
,d15g.koulutus AS "Pohjakoul. koul.nimike"
,d15g.koulutusaste2002 as "Pohjakoul. koul.aste"
,d15h.opintoala2002 as "Pohjakoul. opintoala2"
,d15i.opintoala1995 as "Pohjakoul. koul.ala (95 luokitus)2"
,d16a.vuosiselite AS "Pohjakoul. suoritusvuosi (lukio)"
,d16b.vuosiselite AS "Pohjakoul. suoritusvuosi (amm)"
,d16c.vuosiselite AS "Pohjakoul. suoritusvuosi (amk)"
,d16d.vuosiselite AS "Pohjakoul. suoritusvuosi (ylempi amk)"
,d16e.vuosiselite AS "Pohjakoul. suoritusvuosi (alempi kk)"
,d16f.vuosiselite AS "Pohjakoul. suoritusvuosi (ylempi kk)"
,d17a.koulutuksesta_kulunut_aika AS "Pohjakoulutuksesta kulunut aika (lukio)"
,d17b.koulutuksesta_kulunut_aika AS "Pohjakoulutuksesta kulunut aika (amm)"
,d17c.koulutuksesta_kulunut_aika AS "Pohjakoulutuksesta kulunut aika (amk)"
,d17d.koulutuksesta_kulunut_aika AS "Pohjakoulutuksesta kulunut aika (ylempi amk)"
,d17e.koulutuksesta_kulunut_aika AS "Pohjakoulutuksesta kulunut aika (alempi kk)"
,d17f.koulutuksesta_kulunut_aika AS "Pohjakoulutuksesta kulunut aika (ylempi kk)"
,d21.koulutusaste2002 as Koulutusaste
,d21.koulutusala2002 as "Koulutusala (02 luokitus)"
,d21.opintoala1995 as "Koulutusala (95 luokitus)"
,d21.opintoala2002 as Opintoala
,d21.koulutus as Koulutusnimike
,d22.avi as "Koulutuksen AVI"
,d22.ely as "Koulutuksen ELY"
,d22.maakunta as "Koulutuksen maakunta"
,d22.kielisuhde as "Koulutuksen kunnan kielisuhde"
,d22.kunta as "Koulutuksen kunta"
,d23.vuosiselite as "Kirjoihintulovuosi"
,d24.lukukausiselite as "Kirjoihintulolukukausi"
,d24b.vuosiselite as "Kirjoihintulovuosi (kk-sektori)"
,d24c.vuosiselite as "Kirjoihintulovuosi (kk-sektori läsna)"
,d24d.vuosiselite as "Kirjoihintulovuosi (sektori)"
,d24e.vuosiselite as "Kirjoihintulovuosi (sektori läsnä)"
,d24f.vuosiselite as "Kirjoihintulovuosi (korkeakoulu)"
,d24g.vuosiselite as "Kirjoihintulovuosi (korkeakoulu läsnä)"
,d24h.vuosiselite as "Kirjoihintulovuosi (opintoala)"
,d24i.vuosiselite as "Kirjoihintulovuosi (opintoala läsnä)"
,d25.aikaisempi_korkein_tutkinto as "Aikaisempi korkein tutkinto"
,d26.avoinvayla as "Avoin väylä"
,d27.vahintaan_45_op_suorittanut as "Suorittanut väh. 45 op"
,d28.vahintaan_55_op_suorittanut as "Suorittanut väh. 55 op"
,d29.opiskelijan_fte_tieto as "Opiskelijan FTE-tieto"
,d30.opiskelumuoto as Opiskelumuoto
,d31.pohjakoulutuksen_tila as "Pohjakoulutuksen tila"
,[aikaisemmin_suoritettu_yotutk] as jarj_aik_yo
,[aikaisemmin_suoritettu_yotutk_tarkempi] as "Aikaisempi lukiokoulutus"
,[yotutk_pohjakoulutuksen_tila] as "Aik. lukiokoul. tila"
,[aikaisemmin_suoritettu_ammtutk] as jarj_aik_amm
,[aikaisemmin_suoritettu_ammtutk_tarkempi] as "Aikaisempi amm. koulutus"
,[ammtutk_pohjakoulutuksen_tila] as "Aik. amm. koulutuksen tila"
,[aikaisemmin_suoritettu_amktutk] as jarj_aik_amk
,[aikaisemmin_suoritettu_amktutk_tarkempi] as "Aikaisempi amk-tutkinto"
,[amktutk_pohjakoulutuksen_tila] as "Aik. amk-tutkinnon tila"
,[aikaisemmin_suoritettu_ylempiamktutk] as jarj_aik_ylempiamk
,[aikaisemmin_suoritettu_ylempiamktutk_tarkempi] as "Aikaisempi ylempi amk-tutkinto"
,[ylempiamktutk_pohjakoulutuksen_tila] as "Aik. ylemmän amk-tutkinnon tila"
,[aikaisemmin_suoritettu_alempikktutk] as jarj_aik_alempikk
,[aikaisemmin_suoritettu_alempikktutk_tarkempi] as "Aikaisempi alempi kk-tutkinto"
,[alempikktutk_pohjakoulutuksen_tila] as "Aik. alemman kk-tutkinnon tila"
,[aikaisemmin_suoritettu_ylempikktutk] as jarj_aik_ylempikk
,[aikaisemmin_suoritettu_ylempikktutk_tarkempi] as "Aikaisempi ylempi kk-tukinto"
,[ylempikktutk_pohjakoulutuksen_tila] as "Aik. ylemmän kk-tutkinnon tila"
,[aiemman_tutkinnon_yotutk_opintoala1995_sama] as "Pohjakoul. koul.ala (95) sama (lukio)"
,[aiemman_tutkinnon_yotutk_opintoala2002_sama] as "Pohjakoul. op.ala sama (lukio)"
,[aiemman_tutkinnon_yotutk_koulutusala2002_sama] as "Pohjakoul. koul.ala (02) sama (lukio)"
,[aiemman_tutkinnon_yotutk_koulutusaste2002_sama] as "Pohjakoul. koul.aste sama (lukio)"
,[aiemman_tutkinnon_ammtutk_opintoala1995_sama] as "Pohjakoul. koul.ala (95) sama (amm)"
,[aiemman_tutkinnon_ammtutk_opintoala2002_sama] as "Pohjakoul. op.ala sama (amm)"
,[aiemman_tutkinnon_ammtutk_koulutusala2002_sama] as "Amm. tutk. sama koul.ala (02)"
,[aiemman_tutkinnon_ammtutk_koulutusaste2002_sama] as "Pohjakoul. koul.aste sama (amm)"
,[aiemman_tutkinnon_amktutk_opintoala1995_sama] as "Pohjakoul. koul.ala (95) sama (amk)"
,[aiemman_tutkinnon_amktutk_opintoala2002_sama] as "Pohjakoul. op.ala sama (amk)"
,[aiemman_tutkinnon_amktutk_koulutusala2002_sama] as "Amk-tutkinto sama koul.ala (02)"
,[aiemman_tutkinnon_amktutk_koulutusaste2002_sama] as "Pohjakoul. koul.aste sama (amk)"
,[aiemman_tutkinnon_ylempiamktutk_opintoala1995_sama] as "Pohjakoul. koul.ala (95) sama (ylempi amk)"
,[aiemman_tutkinnon_ylempiamktutk_opintoala2002_sama] as "Pohjakoul. op.ala sama (ylempi amk)"
,[aiemman_tutkinnon_ylempiamktutk_koulutusala2002_sama] as "Ylempi amk tutk. sama koul.ala (02)"
,[aiemman_tutkinnon_ylempiamktutk_koulutusaste2002_sama] as "Pohjakoul. koul.aste sama (ylempi amk)"
,[aiemman_tutkinnon_alempikktutk_opintoala1995_sama] as "Pohjakoul. koul.ala (95) sama (alempi kk)"
,[aiemman_tutkinnon_alempikktutk_opintoala2002_sama] as "Pohjakoul. op.ala sama (alempi kk)"
,[aiemman_tutkinnon_alempikktutk_koulutusala2002_sama] as "Alempi kk-tutk. sama koul.ala (02)"
,[aiemman_tutkinnon_alempikktutk_koulutusaste2002_sama] as "Pohjakoul. koul.aste sama (alempi kk)"
,[aiemman_tutkinnon_ylempikktutk_opintoala1995_sama] as "Pohjakoul. koul.ala (95) sama (ylempi kk)"
,[aiemman_tutkinnon_ylempikktutk_opintoala2002_sama] as "Pohjakoul. op.ala sama (ylempi kk)"
,[aiemman_tutkinnon_ylempikktutk_koulutusala2002_sama] as "Ylempi kk-tutk. sama koul.ala (02)"
,[aiemman_tutkinnon_ylempikktutk_koulutusaste2002_sama] as "Pohjakoul. koul.aste sama (ylempi kk)"
,[aiemman_tutkinnon_opintoala1995_sama] as "Pohjakoul. koul.ala (95) sama"
,[aiemman_tutkinnon_opintoala2002_sama] as "Pohjakoul. op.ala sama"
,[aiemman_tutkinnon_koulutusala2002_sama] as "Pohjakoul. koul.ala (02) sama"
,[aiemman_tutkinnon_koulutusaste2002_sama] as "Pohjakoul. koul.aste sama"
,d2.jarjestys AS jarj_aidinkieli
,d3.jarjestys_avi AS jarj_as_avi
,d3.jarjestys_ely AS jarj_as_ely
,d3.jarjestys_kielisuhde AS jarj_as_kielisuhde
,d3.jarjestys_maakunta AS jarj_as_maakunta
,d3.jarjestys AS jarj_as_kunta
,d5.jarjestys_ika
,d5.jarjestys_ika5v AS jarj_ika5v
,d5b.jarjestys_ika AS jarj_1565_1v
,d5b.jarjestys_ika5v AS jarj_1565_5v
,d5c.jarjestys_ika AS jarj_1865_1v
,d5c.jarjestys_ika5v AS jarj_1865_5v
,d6.jarjestys_ika5v AS jarj_ikaryhma2
,d7.jarjestys AS jarj_koultyyppi
,d7.koulutustyyppi_koodi
,d8.jarjestys AS jarj_kansalaisuus
,d9.jarjestys_oppilaitos
,d9.jarjestys_opetuskieli
,d9.jarjestys_omistajatyyppi
,d9.jarjestys_oppilaitostyyppi
,d10.lahde_koodi
,d12.jarjestys AS jarj_kirjolosyys
,d12b.jarjestys AS jarj_kirjolotammi
,d13.jarjestys AS jarj_rahoitus
,d14a.jarjestys_oppilaitos AS jarj_pohj_14a_oppil
,d14a.jarjestys_oppilaitostyyppi AS jarj_pohj_14a_oppiltyp
,d14a.jarjestys_opetuskieli AS jarj_pohj_14a_opkiel
,d14a.jarjestys_omistajatyyppi AS jarj_pohj_14a_oppilomist
,d14b.jarjestys_oppilaitos AS jarj_pohj_14b_oppil
,d14b.jarjestys_oppilaitostyyppi AS jarj_pohj_14b_oppiltyp
,d14b.jarjestys_opetuskieli AS jarj_pohj_14b_opkiel
,d14b.jarjestys_omistajatyyppi AS jarj_pohj_14b_oppilomist
,d14c.jarjestys_oppilaitos AS jarj_pohj_14c_oppil
,d14c.jarjestys_oppilaitostyyppi AS jarj_pohj_14c_oppiltyp
,d14c.jarjestys_opetuskieli AS jarj_pohj_14c_opkiel
,d14c.jarjestys_omistajatyyppi AS jarj_pohj_14c_oppilomist
,d14d.jarjestys_oppilaitos AS jarj_pohj_14d_oppil
,d14d.jarjestys_oppilaitostyyppi AS jarj_pohj_14d_oppiltyp
,d14d.jarjestys_opetuskieli AS jarj_pohj_14d_opkiel
,d14d.jarjestys_omistajatyyppi AS jarj_pohj_14d_oppilomist
,d14e.jarjestys_oppilaitos AS jarj_pohj_14e_oppil
,d14e.jarjestys_oppilaitostyyppi AS jarj_pohj_14e_oppiltyp
,d14e.jarjestys_opetuskieli AS jarj_pohj_14e_opkiel
,d14e.jarjestys_omistajatyyppi AS jarj_pohj_14e_oppilomist
,d14f.jarjestys_oppilaitos AS jarj_pohj_14f_oppil
,d14f.jarjestys_oppilaitostyyppi AS jarj_pohj_14f_oppiltyp
,d14f.jarjestys_opetuskieli AS jarj_pohj_14f_opkiel
,d14f.jarjestys_omistajatyyppi AS jarj_pohj_14f_oppilomist
,d15a.jarjestys_opintoala1995 AS jarj_15a_koulala95
,d15a.jarjestys_opintoala2002 AS jarj_15a_opala
,d15a.jarjestys_koulutusala2002 AS jarj_15a_koulala02
,d15a.jarjestys AS jarj_15a_koulnimike
,d15a.jarjestys_koulutusaste2002 AS jarj_15a_koulaste
,d15b.jarjestys_opintoala1995 AS jarj_15b_koulala95
,d15b.jarjestys_opintoala2002 AS jarj_15b_opala
,d15b.jarjestys_koulutusala2002 AS jarj_15b_koulala02
,d15b.jarjestys AS jarj_15b_koulnimike
,d15b.jarjestys_koulutusaste2002 AS jarj_15b_koulaste
,d15c.jarjestys_opintoala1995 AS jarj_15c_koulala95
,d15c.jarjestys_opintoala2002 AS jarj_15c_opala
,d15c.jarjestys_koulutusala2002 AS jarj_15c_koulala02
,d15c.jarjestys AS jarj_15c_koulnimike
,d15c.jarjestys_koulutusaste2002 AS jarj_15c_koulaste
,d15d.jarjestys_opintoala1995 AS jarj_15d_koulala95
,d15d.jarjestys_opintoala2002 AS jarj_15d_opala
,d15d.jarjestys_koulutusala2002 AS jarj_15d_koulala02
,d15d.jarjestys AS jarj_15d_koulnimike
,d15d.jarjestys_koulutusaste2002 AS jarj_15d_koulaste
,d15e.jarjestys_opintoala1995 AS jarj_15e_koulala95
,d15e.jarjestys_opintoala2002 AS jarj_15e_opala
,d15e.jarjestys_koulutusala2002 AS jarj_15e_koulala02
,d15e.jarjestys AS jarj_15e_koulnimike
,d15e.jarjestys_koulutusaste2002 AS jarj_15e_koulaste
,d15f.jarjestys_opintoala1995 AS jarj_15f_koulala95
,d15f.jarjestys_opintoala2002 AS jarj_15f_opala
,d15f.jarjestys_koulutusala2002 AS jarj_15f_koulala02
,d15f.jarjestys AS jarj_15f_koulnimike
,d15f.jarjestys_koulutusaste2002 AS jarj_15f_koulaste
,d15g.jarjestys_opintoala1995 AS jarj_15g_koulala95
,d15g.jarjestys_opintoala2002 AS jarj_15g_opala
,d15g.jarjestys_koulutusala2002 AS jarj_15g_koulala02
,d15g.jarjestys AS jarj_15g_koulnimike
,d15g.jarjestys_koulutusaste2002 AS jarj_15g_koulaste
,d15h.jarjestys_opintoala2002 AS jarj_15h_opala
,d15i.jarjestys_opintoala1995 AS jarj_15i_koulala95
,d17a.jarjestys AS jarj_yo_kulunutaika
,d17b.jarjestys AS jarj_amm_kulunutaika
,d17c.jarjestys AS jarj_amk_kulunutaika
,d17d.jarjestys AS jarj_ylempi_amk_kulunutaika
,d17e.jarjestys AS jarj_alempi_kk_kulunutaika
,d17f.jarjestys AS jarj_ylempi_kk_kulunutaika
,d21.jarjestys_koulutusaste2002
,d21.jarjestys_koulutusala2002
,d21.jarjestys_opintoala1995
,d21.jarjestys_opintoala2002
,d21.jarjestys as jarj_koulnimike
,d22.jarjestys_avi
,d22.jarjestys_ely
,d22.jarjestys_maakunta
,d22.jarjestys_kielisuhde
,d22.jarjestys as jarj_kunta
,d24.jarjestys as jarj_lukukausi
,d25.jarjestys as jarj_aikkorktutkinto
,d26.jarjestys as jarj_avoin
,d27.jarjestys as jarj_vah45
,d28.jarjestys as jarj_vah55
,d29.jarjestys as jarj_op_fte
,d30.jarjestys as jarj_opmuoto
,d31.jarjestys as jarj_pohjkoultila
FROM dbo.f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus
	LEFT JOIN d_aidinkieli_versio1 d2 ON d2.id = aidinkieli_versio1_id
	LEFT JOIN d_alueluokitus d3 ON d3.id = kotikunta_id
	LEFT JOIN d_sukupuoli d4 ON d4.id = sukupuoli_id
	LEFT JOIN d_ika d5 ON d5.id = ika_1v_id
	LEFT JOIN d_ika d5b ON d5b.id = ika_14_65_id
	LEFT JOIN d_ika d5c ON d5c.id = ika_18_65_id
	LEFT JOIN d_ika d6 ON d6.id = ika_5v_id
	LEFT JOIN d_koulutustyyppi d7 ON d7.id = koulutustyyppi_id
	LEFT JOIN d_kansalaisuus_versio2 d8 ON d8.id = kansalaisuus_versio2_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d9 ON d9.id = oppilaitoksen_taustatiedot_id
	LEFT JOIN d_lahde d10 ON d10.id = lahde_id
	LEFT JOIN d_opiskelijan_olo d12 ON d12.id = opiskelijan_olo_syys_id
	LEFT JOIN d_opiskelijan_olo_tamm d12b ON d12b.id = opiskelijan_olo_tamm_id
	LEFT JOIN d_rahoituslahde d13 ON d13.id = rahoituslahde_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d14a ON d14a.id = aikaisemmin_suoritetun_yotutk_oppilaitostiedot_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d14b ON d14b.id = aikaisemmin_suoritetun_ammtutk_oppilaitostiedot_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d14c ON d14c.id = aikaisemmin_suoritetun_amktutk_oppilaitostiedot_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d14d ON d14d.id = aikaisemmin_suoritetun_ylempiamktutk_oppilaitostiedot_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d14e ON d14e.id = aikaisemmin_suoritetun_alempikktutk_oppilaitostiedot_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d14f ON d14f.id = aikaisemmin_suoritetun_ylempikktutk_oppilaitostiedot_id
	LEFT JOIN d_koulutusluokitus d15a ON d15a.id = aikaisemmin_suoritetun_yotutk_koulutustiedot_id
	LEFT JOIN d_koulutusluokitus d15b ON d15b.id = aikaisemmin_suoritetun_ammtutk_koulutustiedot_id
	LEFT JOIN d_koulutusluokitus d15c ON d15c.id = aikaisemmin_suoritetun_amktutk_koulutustiedot_id
	LEFT JOIN d_koulutusluokitus d15d ON d15d.id = aikaisemmin_suoritetun_ylempiamktutk_koulutustiedot_id
	LEFT JOIN d_koulutusluokitus d15e ON d15e.id = aikaisemmin_suoritetun_alempikktutk_koulutustiedot_id
	LEFT JOIN d_koulutusluokitus d15f ON d15f.id = aikaisemmin_suoritetun_ylempikktutk_koulutustiedot_id
	LEFT JOIN d_koulutusluokitus d15g ON d15g.id = opiskelijan_koulutus_edellisvuonna_id
	LEFT JOIN d_koulutusluokitus d15h ON d15h.id = opiskelijan_opintoala2002_edellisvuonna_id
	LEFT JOIN d_koulutusluokitus d15i ON d15i.id = opiskelijan_opintoala1995_edellisvuonna_id
	LEFT JOIN d_kausi d16a ON d16a.kausi_id = aikaisemmin_suoritetun_yotutk_suoritusvuosi_id
	LEFT JOIN d_kausi d16b ON d16b.kausi_id = aikaisemmin_suoritetun_ammtutk_suoritusvuosi_id
	LEFT JOIN d_kausi d16c ON d16c.kausi_id = aikaisemmin_suoritetun_amktutk_suoritusvuosi_id
	LEFT JOIN d_kausi d16d ON d16d.kausi_id = aikaisemmin_suoritetun_ylempiamktutk_suoritusvuosi_id
	LEFT JOIN d_kausi d16e ON d16e.kausi_id = aikaisemmin_suoritetun_alempikktutk_suoritusvuosi_id
	LEFT JOIN d_kausi d16f ON d16f.kausi_id = aikaisemmin_suoritetun_ylempikktutk_suoritusvuosi_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d17a ON d17a.id = aikaisemmasta_koulutuksesta_yotutk_kulunut_aika_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d17b ON d17b.id = aikaisemmasta_koulutuksesta_ammtutk_kulunut_aika_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d17c ON d17c.id = aikaisemmasta_koulutuksesta_amktutk_kulunut_aika_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d17d ON d17d.id = aikaisemmasta_koulutuksesta_ylamktutk_kulunut_aika_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d17e ON d17e.id = aikaisemmasta_koulutuksesta_alkktutk_kulunut_aika_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d17f ON d17f.id = aikaisemmasta_koulutuksesta_ylkktutk_kulunut_aika_id
	LEFT JOIN d_koulutusluokitus d21 ON d21.id = koulutusluokitus_id
	LEFT JOIN d_alueluokitus d22 ON d22.id = koulutuksen_kunta_id
	LEFT JOIN d_kausi d23 ON d23.kausi_id = kirjoihintulovuosi_id
	LEFT JOIN d_kausi d24 ON d24.kausi_id = kirjoihintulolukukausi_id
	LEFT JOIN d_kausi d24b ON d24b.kausi_id = kirjoihintulovuosi_korkeakoulusektori_id
	LEFT JOIN d_kausi d24c ON d24c.kausi_id = kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id
	LEFT JOIN d_kausi d24d ON d24d.kausi_id = kirjoihintulovuosi_sektori_id
	LEFT JOIN d_kausi d24e ON d24e.kausi_id = kirjoihintulovuosi_sektori_lasnaoleva_id
	LEFT JOIN d_kausi d24f ON d24f.kausi_id = kirjoihintulovuosi_korkeakoulu_id
	LEFT JOIN d_kausi d24g ON d24g.kausi_id = kirjoihintulovuosi_korkeakoulu_lasnaoleva_id
	LEFT JOIN d_kausi d24h ON d24h.kausi_id = kirjoihintulovuosi_opintoala_id
	LEFT JOIN d_kausi d24i ON d24i.kausi_id = kirjoihintulovuosi_opintoala_lasnaoleva_id
	LEFT JOIN d_aikaisempi_korkein_tutkinto d25 ON d25.id = aikaisempi_korkein_tutkinto_id
	LEFT JOIN d_avoinvayla d26 ON d26.id = avoinvayla_id
	LEFT JOIN d_vahintaan_45_op_suorittanut d27 ON d27.id = vahintaan_45_op_suorittanut_id
	LEFT JOIN d_vahintaan_55_op_suorittanut d28 ON d28.id = vahintaan_55_op_suorittanut_id
	LEFT JOIN d_opiskelijan_fte_tieto d29 ON d29.id = opiskelijan_fte_tieto_id
	LEFT JOIN d_opiskelumuoto d30 ON d30.id = opiskelumuoto_id
	LEFT JOIN d_pohjakoulutuksen_tila d31 ON d31.id = pohjakoulutuksen_tila_id
WHERE d10.lahde_koodi = '41' AND d9.oppilaitoskoodi <> '02557' AND d9.oppilaitoskoodi <> '10031' AND d9.oppilaitoskoodi <> '02358'



GO


USE [ANTERO]