USE [VipunenTK]
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut_yliopisto]    Script Date: 6.7.2018 15:04:03 ******/
DROP VIEW IF EXISTS [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut_yliopisto]
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut_toinen_aste]    Script Date: 6.7.2018 15:04:03 ******/
DROP VIEW IF EXISTS [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut_toinen_aste]
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut]    Script Date: 6.7.2018 15:04:03 ******/
DROP VIEW IF EXISTS [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut]
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_hakijat]    Script Date: 6.7.2018 15:04:03 ******/
DROP VIEW IF EXISTS [dbo].[v_f_tab_Moninkertainen_haku_hakijat]
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_edelliset_haut]    Script Date: 6.7.2018 15:04:03 ******/
DROP VIEW IF EXISTS [dbo].[v_f_tab_Moninkertainen_haku_edelliset_haut]
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_edellisen_vuoden_opiskelut]    Script Date: 6.7.2018 15:04:03 ******/
DROP VIEW IF EXISTS [dbo].[v_f_tab_Moninkertainen_haku_edellisen_vuoden_opiskelut]
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_aiemmat_tutkinnot]    Script Date: 6.7.2018 15:04:03 ******/
DROP VIEW IF EXISTS [dbo].[v_f_tab_Moninkertainen_haku_aiemmat_tutkinnot]
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_aiemmat_tutkinnot]    Script Date: 6.7.2018 15:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_f_tab_Moninkertainen_haku_aiemmat_tutkinnot]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[v_f_tab_Moninkertainen_haku_aiemmat_tutkinnot] AS

--Select * from VipunenTK.dbo.v_f_tab_Moninkertainen_haku_hakijat

SELECT
--Organisaatiomuuttujat
      [Aik. tutkinnon oppilaitos] = d_ol.oppilaitos
      ,[Aik. tutkinnon oppil. kunta] = d_ol_al.kunta
      ,[Aik. tutkinnon oppil. maakunta] = d_ol_al.maakunta
--Koulutusmuuttujat
      ,[Aik. tutkinnon koul.aste] = d_koul.koulutusaste2002
	  ,[Aik. tutkinnon koul.aste, taso 1] = d_koul.iscle2011
	  ,[Aik. tutkinnon koul.aste, taso 2] = d_koul.Koulutusaste_taso2
      ,[Aik. tutkinnon opintoala] = d_koul.opintoala2002
      ,[Aik. tutkinnon koul.ala (95 luokitus)] = d_koul.opintoala1995
	  ,[Aik. tutkinnon koul.ala (02 luokitus)] = d_koul.koulutusala2002
	  ,[Aik. tutkinnon koul.nimike] = d_koul.koulutus
	  ,[Aik. tutkinnon koul.ala, taso 1] = d_koul.iscfibroad2013
	  ,[Aik. tutkinnon koul.ala, taso 2] = d_koul.iscfinarrow2013
	  ,[Aik. tutkinnon koul.ala, taso 3] = d_koul.iscfi2013
	  ,[Aik. tutkinnon sektori] = d_tutk.tutkinto
	  ,[Aik. tutkinnon suoritusvuosi] = [Aiemmin_suoritettu_tutkinto_suoritusvuosi]
	  ,[Aik. tutkinto tuorein] = [Aiemmin_suoritettu_tutkinto_tuorein]
	  ,[Aik. tutkinnon ajankohta] = d_ajkohta.suhteellinen_ajankohta
	  ,[Aik. tutkinnon ikä] = [Aiemmin_suoritettu_tutkinto_ika]
--Järjestyskentät
	  ,jarjestys_oppilaitos = d_ol.jarjestys_oppilaitos
	  ,jarjestys_oppilaitoskunta = d_ol_al.jarjestys
	  ,jarjestys_oppilaitosmaakunta = d_ol_al.jarjestys_maakunta
	  ,jarjestys_koulutusaste2002 = d_koul.jarjestys_koulutusaste2002
	  ,jarjestys_koulutusaste_taso1 = d_koul.jarjestys_iscle2011
	  ,jarjestys_koulutusaste_taso2 = d_koul.jarjestys_Koulutusaste_taso2
	  ,jarjestys_opintoala2002 = d_koul.jarjestys_opintoala2002
	  ,jarjestys_opintoala1995 = d_koul.jarjestys_opintoala1995
	  ,jarjestys_koulutusala2002 = d_koul.jarjestys_koulutusala2002
	  ,jarjestys_koulutusala_taso1 = d_koul.jarjestys_iscfibroad2013
	  ,jarjestys_koulutusala_taso2 = d_koul.jarjestys_iscfinarrow2013
	  ,jarjestys_koulutusala_taso3 = d_koul.jarjestys_iscfi2013
	  ,jarjestys_koulutus = d_koul.koulutus
	  ,jarjestys_tutk_sektori = d_tutk.jarjestys
	  ,jarjestys_ajankohta = d_ajkohta.jarjestys
--Lukumäärämuuttujat
      ,''lkm_edtutk2'' = [lkm]
--Faktat yhdistävä kenttä
      ,[rivinumero]
  FROM [dbo].[f_Moninkertainen_haku_aiemmat_tutkinnot] f
JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d_ol
	ON d_ol.id = f.Aiemmin_suoritettu_tutkinto_oppilaitos_id
JOIN VipunenTK.dbo.d_alueluokitus d_ol_al
	ON d_ol_al.id = f.Aiemmin_suoritettu_tutkinto_oppilaitoksen_alueluokitus_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_koul
	ON d_koul.id = f.Aiemmin_suoritettu_tutkinto_koulutusluokitus_id
JOIN VipunenTK.dbo.d_tutkinto d_tutk
	ON d_tutk.id = f.Aiemmin_suoritettu_tutkinto_sektori_id
JOIN VipunenTK.dbo.d_suhteellinen_ajankohta d_ajkohta
	ON d_ajkohta.id = f.Aiemmin_suoritettu_tutkinto_ajankohta_id




' 
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_edellisen_vuoden_opiskelut]    Script Date: 6.7.2018 15:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_f_tab_Moninkertainen_haku_edellisen_vuoden_opiskelut]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[v_f_tab_Moninkertainen_haku_edellisen_vuoden_opiskelut] AS

--Select * from VipunenTK.dbo.v_f_tab_Moninkertainen_haku_hakijat

SELECT
--Organisaatiomuuttujat
      [Edellisen vuoden oppilaitos] = d_ol.oppilaitos
	  ,[Edellisen vuoden koul. järjestäjä] = d_ol.koulutuksen_jarjestaja
      ,[Edellisen vuoden oppil. kunta] = d_ol_al.kunta
      ,[Edellisen vuoden oppil. maakunta] = d_ol_al.maakunta
--Koulutusmuuttujat
      ,[Edellisen vuoden koul.aste] = d_koul.koulutusaste2002
	  ,[Edellisen vuoden koul.aste, taso 1] = d_koul.iscle2011
	  ,[Edellisen vuoden koul.aste, taso 2] = d_koul.Koulutusaste_taso2
      ,[Edellisen vuoden opintoala] = d_koul.opintoala2002
      ,[Edellisen vuoden koul.ala (95 luokitus)] = d_koul.opintoala1995
	  ,[Edellisen vuoden koul.ala (02 luokitus)] = d_koul.koulutusala2002
	  ,[Edellisen vuoden koul.ala, taso 1] = d_koul.iscfibroad2013
	  ,[Edellisen vuoden koul.ala, taso 2] = d_koul.iscfinarrow2013
	  ,[Edellisen vuoden koul.ala, taso 3] = d_koul.iscfi2013
	  ,[Edellisen vuoden koul.nimike] = d_koul.koulutus
	  ,[Edellisen vuoden opiskelu] = d_ed.edellisen_vuoden_opiskelu_koulutus
	  ,[Edellisen vuoden opiskelu (tarkennus)] = d_ed.edellisen_vuoden_opiskelu_tarkennus
--Järjestyskentät
	  ,jarjestys_oppilaitos = d_ol.jarjestys_oppilaitos
	  ,jarjestys_oppilaitoskunta = d_ol_al.jarjestys
	  ,jarjestys_oppilaitosmaakunta = d_ol_al.jarjestys_maakunta
	  ,jarjestys_koulutusaste2002 = d_koul.jarjestys_koulutusaste2002
	  ,jarjestys_koulutusaste_taso1 = d_koul.jarjestys_iscle2011
	  ,jarjestys_koulutusaste_taso2 = d_koul.jarjestys_Koulutusaste_taso2
	  ,jarjestys_opintoala2002 = d_koul.jarjestys_opintoala2002
	  ,jarjestys_opintoala1995 = d_koul.jarjestys_opintoala1995
	  ,jarjestys_koulutusala2002 = d_koul.jarjestys_koulutusala2002
	  ,jarjestys_koulutusala_taso1 = d_koul.jarjestys_iscfibroad2013
	  ,jarjestys_koulutusala_taso2 = d_koul.jarjestys_iscfinarrow2013
	  ,jarjestys_koulutusala_taso3 = d_koul.jarjestys_iscfi2013
	  ,jarjestys_koulutus = d_koul.koulutus
	  ,jarjestys_ed_opiskelu = d_ed.jarjestys_koulutus
	  ,jarjestys_ed_opiskelu_tarkennus = d_ed.jarjestys_tarkennus
--Lukumäärämuuttujat
      ,''lkm_edop2'' = [lkm]
--Faktat yhdistävä kenttä
      ,[rivinumero]
  FROM [dbo].[f_Moninkertainen_haku_edellisen_vuoden_opiskelut] f
JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d_ol
	ON d_ol.id = f.Edellisen_vuoden_opiskelu_oppilaitos_id
JOIN VipunenTK.dbo.d_alueluokitus d_ol_al
	ON d_ol_al.id = f.Edellisen_vuoden_opiskelu_oppilaitoksen_alueluokitus_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_koul
	ON d_koul.id = f.Edellisen_vuoden_opiskelu_koulutusluokitus_id
JOIN VipunenTK.dbo.d_edellisen_vuoden_opiskelu d_ed
	ON d_ed.id = f.Edellisen_vuoden_opiskelu_id
	




' 
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_edelliset_haut]    Script Date: 6.7.2018 15:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_f_tab_Moninkertainen_haku_edelliset_haut]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_f_tab_Moninkertainen_haku_edelliset_haut] AS

--Select * from VipunenTK.dbo.v_f_tab_Moninkertainen_haku_edelliset_haut

SELECT 
--Aikamuuttujat
       [Edellisen haun ajankohta] = d_sa.suhteellinen_ajankohta
--Hakukohdemuuttujat
      ,[Edellinen hakukohde] = d_hk.hakukohde
      ,''Hakenut toiselle asteelle'' = [Johdettu_Hakenut_toiselle_asteelle]
      ,''Hakenut korkeakoulutukseen'' = [Johdettu_Hakenut_korkeakoulutukseen]
      ,''Hakenut'' = [Johdettu_Hakenut]
--Järjestyskentät
	  ,jarjestys_hakukohde = d_hk.jarjestys
	  ,jarjestys_suhteellinen_ajankohta = d_sa.jarjestys
--Lukumäärämuuttujat
      ,''lkm_edhaut2'' = [lkm]
--Faktat yhdistävä kenttä
      ,[rivinumero]
  FROM [dbo].[f_Moninkertainen_haku_edelliset_haut] f
JOIN VipunenTK.dbo.d_hakukohde d_hk
	ON d_hk.id = f.Edellinen_haku_id
JOIN VipunenTK.dbo.d_suhteellinen_ajankohta d_sa
	ON d_sa.id = f.Edellinen_haku_ajankohta_id
	


' 
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_hakijat]    Script Date: 6.7.2018 15:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_f_tab_Moninkertainen_haku_hakijat]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_f_tab_Moninkertainen_haku_hakijat] AS

--Select * from VipunenTK.dbo.v_f_tab_Moninkertainen_haku_hakijat

SELECT
--Aikamuuttujat
	   [Tilastovuosi]
      ,Aloituslukuvuosi = d_kausi.lukuvuosi
	  ,Aloitusvuosi = d_kausi.vuosiselite
      ,Aloituslukukausi = d_kausi.lukukausiselite
--Henkilömuuttujat
	  ,''Sukupuoli'' = d_sp.sukupuoli
	  ,''Ikä'' = d_ika.ika
	  ,''Ikäryhmä'' = d_ika.ika5v
      ,''Syntymävuosi'' = [Syntymavuosi]
	  ,''Äidinkieli'' = d_ak.[aidinkieli_versio1]
      ,''Kotikunta vuotta aiemmin'' = d_al.[kunta]
      ,''Kotimaakunta vuotta aiemmin'' = d_al.[maakunta]
	  ,''Henkilötunnuksen oikeellisuus'' = d_ho.[hetu_ok]
      ,''Toiminta vuotta aiemmin'' = d_pt.[paaasiallinen_toiminta]
--Järjestyskentät
	  ,jarjestys_sukupuoli = d_sp.jarjestys
	  ,d_ika.jarjestys_ika
	  ,d_ika.jarjestys_ika5v
	  ,jarjestys_aidinkieli = d_ak.jarjestys
	  ,jarjestys_kotikunta = d_al.jarjestys
	  ,d_al.jarjestys_maakunta
	  ,jarjestys_hetuok = d_ho.jarjestys
	  ,jarjestys_paatoiminta = d_pt.jarjestys
--Lukumäärämuuttujat
      ,''lkm_hak2'' = [lkm]
--Faktat yhdistävä kenttä
      ,[rivinumero]
  FROM [dbo].[f_Moninkertainen_haku_hakijat] f
JOIN VipunenTK.dbo.d_kausi
	ON d_kausi.kausi_id = f.Koulutuksen_alkamislukukausi_avain
JOIN VipunenTK.dbo.d_sukupuoli d_sp
	ON d_sp.id = f.sukupuoli_id
JOIN VipunenTK.dbo.d_ika 
	ON d_ika.id = f.Ika_id
JOIN VipunenTK.dbo.d_aidinkieli_versio1 d_ak
	ON d_ak.id = f.Aidinkielir1_id
JOIN VipunenTK.dbo.d_alueluokitus d_al
	ON d_al.id = f.Kotikunta_vuotta_aiemmin_id
JOIN VipunenTK.dbo.d_hetu_ok d_ho
	ON d_ho.id = f.Hetuntila_id
JOIN VipunenTK.dbo.d_paaasiallinen_toiminta d_pt
	ON d_pt.id = f.Toiminta_vuotta_aiemmin_id
	



' 
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut]    Script Date: 6.7.2018 15:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_f_tab_Moninkertainen_haku_uudet_haut]'))
EXEC dbo.sp_executesql @statement = N'












CREATE VIEW [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut] AS

--Select * from VipunenTK.dbo.v_f_tab_Moninkertainen_haku_uudet_haut

SELECT 
--Aikamuuttujat
       ''Hakukohteen aloituslukuvuosi'' = d_kau.lukuvuosi
	  ,''Hakukohteen aloitusvuosi'' = d_kau.vuosiselite
      ,''Hakukohteen aloituslukukausi'' = d_kau.lukukausiselite
--Organisaatiomuuttujat
	  ,[Hakukohde] = d_hk.hakukohde
      ,[Hakukohteen oppilaitos] = d_ol.oppilaitos
	  ,[Hakukohteen koul. järjestäjä] = d_ol.koulutuksen_jarjestaja
      ,[Hakukohteen oppil. kunta] = d_ol_al.kunta
      ,[Hakukohteen oppil. maakunta] = d_ol_al.maakunta
--Hakukohdemuuttujat
      ,[Hakukohteen koulutusaste] = d_ka02.koulutusaste2002
	  ,[Hakukohteen koulutusaste, taso 1] = d_kastet2.iscle2011
	  ,[Hakukohteen koulutusaste, taso 2] = d_kastet2.Koulutusaste_taso2
      ,[Hakukohteen opintoala] = d_oa02.opintoala2002
	  ,[Hakukohteen koulutusala (02 luokitus)] = d_oa02.koulutusala2002
      ,[Hakukohteen koulutusala (95 luokitus)] = d_oa95.opintoala1995
	  ,[Hakukohteen koulutusala, taso 1] = d_iscfibroad.iscfibroad2013
      ,[Hakukohteen prioriteetti] = d_hp.hakukohteen_prioriteetti
      ,[Hakukohde hyväksytty] = d_ht.hakukohde_hyvaksytty
      ,[Hakukohde vastaanotettu] = d_ht.hakukohde_vastaanotettu
      ,[Hakukohteen tutkinnon taso] = d_htt.hakukohde_tutkinnon_taso
      ,[Hakukohteen tutk. taso tarkennus] = case when d_htt.hakukohde_tutkinnon_taso_tarkennus=''Tuntematon'' then d_htt.hakukohde_tutkinnon_taso else d_htt.hakukohde_tutkinnon_taso_tarkennus end
      ,[Hakukohde erillisvalinta] = d_hev.hakukohde_erillisvalinta
      ,''Aik. tutkinto haun koul.asteella''= [Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.asteella''= [Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.alalla (95)''= [Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.alalla (95)''= [Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun opintoalalla''= [Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun opintoalalla''= [Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.alalla (02)''= [Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.alalla (02)''= [Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun oppilaitoksessa''= [Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun oppilaitoksessa''= [Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.sektorilla''= [Johdettu_Sama_sektori_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.sektorilla''= [Johdettu_Sama_sektori_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto tai opiskelu haun sektorilla''= [Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.sektorilla (laaja)''= [Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.sektorilla (laaja)''= [Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto tai opiskelu haun sektorilla (laaja)''= [Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku]
      ,''Hakenut amk ja yo''= [Johdettu_Hakenut_Amk_ja_Yo]
      ,''Hakenut toinen aste ja korkeakoulut''= [Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste]
      ,''Hakenut lukio ja ammatillinen''= [Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus]
--Järjestyskentät
	  ,jarjestys_hakukohde = d_hk.jarjestys
	  ,jarjestys_oppilaitos = d_ol.jarjestys_oppilaitos
	  ,jarjestys_oppilaitoskunta = d_ol_al.jarjestys
	  ,jarjestys_oppilaitosmaakunta = d_ol_al.jarjestys_maakunta
	  ,jarjestys_koulutusaste2002 = d_ka02.jarjestys_koulutusaste2002
	  ,jarjestys_koulutusaste_taso1 = d_kastet2.jarjestys_iscle2011
	  ,jarjestys_koulutusaste_taso2 = d_kastet2.jarjestys_Koulutusaste_taso2
	  ,jarjestys_opintoala2002 = d_oa02.jarjestys_opintoala2002
	  ,jarjestys_koulutusala2002 = d_oa02.jarjestys_koulutusala2002
	  ,jarjestys_opintoala1995 = d_oa95.jarjestys_opintoala1995
	  ,jarjestys_koulutusala_taso1 = d_iscfibroad.jarjestys_iscfibroad2013
	  ,jarjestys_hakukohteen_prioriteetti = d_hp.jarjestys
	  ,jarjestys_hakukohde_hyvaksytty = d_ht.jarjestys_hyvaksytty
	  ,jarjestys_hakukohde_vastaanotettu = d_ht.jarjestys_vastaanotettu
	  ,jarjestys_hakukohde_tutkinnon_taso = d_htt.jarjestys_hakukohde_tutkinnon_taso
	  ,jarjestys_hakukohde_tutkinnon_taso_tarkennus = case d_htt.hakukohde_tutkinnon_taso when ''Ylempi amk-tutkinto'' then 99 else d_htt.jarjestys_hakukohde_tutkinnon_taso_tarkennus end
	  ,jarjestys_hakukohde_erillisvalinta = d_hev.jarjestys
--Lukumäärämuuttujat
      ,''lkm_uusih2'' = [lkm]
--Faktat yhdistävä kenttä
      ,[rivinumero]
  FROM [dbo].[f_Moninkertainen_haku_uudet_haut] f
JOIN VipunenTK.dbo.d_hakukohde d_hk						ON d_hk.id = f.hakukohde_id
JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d_ol	ON d_ol.id = f.Hakukohde_oppilaitos_id
JOIN VipunenTK.dbo.d_alueluokitus d_ol_al				ON d_ol_al.id = f.Hakukohde_oppilaitoksen_alueluokitus_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_ka02			ON d_ka02.id = f.Hakukohde_koulutusaste2002_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_kastet2			ON d_kastet2.id = f.Hakukohde_koulutusaste_taso2_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_oa02			ON d_oa02.id = f.Hakukohde_opintoala2002_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_oa95			ON d_oa95.id = f.Hakukohde_opintoala1995_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_iscfibroad		ON d_iscfibroad.id = f.Hakukohde_koulutusala_taso1_id
JOIN VipunenTK.dbo.d_hakukohteen_prioriteetti d_hp		ON d_hp.id = f.Hakukohde_prioriteetti_id
JOIN VipunenTK.dbo.d_hakukohteen_tulos d_ht				ON d_ht.hakukohde_hyvaksytty_koodi = f.Hakukohde_hyvaksytty AND d_ht.hakukohde_vastaanotettu_koodi = f.Hakukohde_vastaanotettu
JOIN VipunenTK.dbo.d_hakukohteen_tutkinnon_taso d_htt	ON d_htt.hakukohde_tutkinnon_taso_koodi = f.Hakukohde_tutkinnon_taso AND d_htt.Hakukohde_tutkinnon_taso_tarkennus_koodi = f.Hakukohde_tutkinnon_taso_tarkennus
JOIN VipunenTK.dbo.d_hakukohde_erillisvalinta d_hev		ON d_hev.id = f.Hakukohde_erillisvalinta_id
JOIN VipunenTK.dbo.d_kausi d_kau						ON d_kau.kausi_id = f.Hakukohde_koulutuksen_alkamislukukausi_id

WHERE d_hk.jarjestys in (13,14)









' 
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut_toinen_aste]    Script Date: 6.7.2018 15:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_f_tab_Moninkertainen_haku_uudet_haut_toinen_aste]'))
EXEC dbo.sp_executesql @statement = N'








CREATE VIEW [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut_toinen_aste] AS

--Select * from VipunenTK.dbo.v_f_tab_Moninkertainen_haku_uudet_haut

SELECT
--Aikamuuttujat
       ''Hakukohteen aloituslukuvuosi'' = d_kau.lukuvuosi
	  ,''Hakukohteen aloitusvuosi'' = d_kau.vuosiselite
      ,''Hakukohteen aloituslukukausi'' = d_kau.lukukausiselite
--Organisaatiomuuttujat
	  ,[Hakukohde] = d_hk.hakukohde
      ,[Hakukohteen oppilaitos] = d_ol.oppilaitos
	  ,[Hakukohteen koul. järjestäjä] = d_ol.koulutuksen_jarjestaja
      ,[Hakukohteen oppil. kunta] = d_ol_al.kunta
      ,[Hakukohteen oppil. maakunta] = d_ol_al.maakunta
--Hakukohdemuuttujat
      ,[Hakukohteen koulutusaste] = d_ka02.koulutusaste2002
	  ,[Hakukohteen koulutusaste, taso 1] = d_kastet2.iscle2011
	  ,[Hakukohteen koulutusaste, taso 2] = d_kastet2.Koulutusaste_taso2
      ,[Hakukohteen opintoala] = d_oa02.opintoala2002
	  ,[Hakukohteen koulutusala (02 luokitus)] = d_oa02.koulutusala2002
      ,[Hakukohteen koulutusala (95 luokitus)] = d_oa95.opintoala1995
	  ,[Hakukohteen koulutusala, taso 1] = d_iscfibroad.iscfibroad2013
      ,[Hakukohteen prioriteetti] = d_hp.hakukohteen_prioriteetti
      ,[Hakukohde hyväksytty] = d_ht.hakukohde_hyvaksytty
      ,[Hakukohde vastaanotettu] = d_ht.hakukohde_vastaanotettu
      ,[Hakukohteen tutkinnon taso] = d_htt.hakukohde_tutkinnon_taso
      ,[Hakukohteen tutk. taso tarkennus] = d_htt.hakukohde_tutkinnon_taso_tarkennus
      ,[Hakukohde erillisvalinta] = d_hev.hakukohde_erillisvalinta
      ,''Aik. tutkinto haun koul.asteella''= [Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.asteella''= [Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.alalla (95)''= [Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.alalla (95)''= [Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun opintoalalla''= [Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun opintoalalla''= [Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.alalla (02)''= [Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.alalla (02)''= [Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun oppilaitoksessa''= [Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun oppilaitoksessa''= [Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.sektorilla''= [Johdettu_Sama_sektori_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.sektorilla''= [Johdettu_Sama_sektori_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto tai opiskelu haun sektorilla''= [Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.sektorilla (laaja)''= [Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.sektorilla (laaja)''= [Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto tai opiskelu haun sektorilla (laaja)''= [Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku]
      ,''Hakenut amk ja yo''= [Johdettu_Hakenut_Amk_ja_Yo]
      ,''Hakenut toinen aste ja korkeakoulut''= [Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste]
      ,''Hakenut lukio ja ammatillinen''= [Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus]
--Järjestyskentät
	  ,jarjestys_hakukohde = d_hk.jarjestys
	  ,jarjestys_oppilaitos = d_ol.jarjestys_oppilaitos
	  ,jarjestys_oppilaitoskunta = d_ol_al.jarjestys
	  ,jarjestys_oppilaitosmaakunta = d_ol_al.jarjestys_maakunta
	  ,jarjestys_koulutusaste2002 = d_ka02.jarjestys_koulutusaste2002
	  ,jarjestys_koulutusaste_taso1 = d_kastet2.jarjestys_iscle2011
	  ,jarjestys_koulutusaste_taso2 = d_kastet2.jarjestys_Koulutusaste_taso2
	  ,jarjestys_opintoala2002 = d_oa02.jarjestys_opintoala2002
	  ,jarjestys_koulutusala2002 = d_oa02.jarjestys_koulutusala2002
	  ,jarjestys_opintoala1995 = d_oa95.jarjestys_opintoala1995
	  ,jarjestys_koulutusala_taso1 = d_iscfibroad.jarjestys_iscfibroad2013
	  ,jarjestys_hakukohteen_prioriteetti = d_hp.jarjestys
	  ,jarjestys_hakukohde_hyvaksytty = d_ht.jarjestys_hyvaksytty
	  ,jarjestys_hakukohde_vastaanotettu = d_ht.jarjestys_vastaanotettu
	  ,jarjestys_hakukohde_tutkinnon_taso = d_htt.jarjestys_hakukohde_tutkinnon_taso
	  ,jarjestys_hakukohde_tutkinnon_taso_tarkennus = d_htt.jarjestys_hakukohde_tutkinnon_taso_tarkennus
	  ,jarjestys_hakukohde_erillisvalinta = d_hev.jarjestys
--Lukumäärämuuttujat
      ,''lkm_uusih2'' = [lkm]
--Faktat yhdistävä kenttä
      ,[rivinumero]
  FROM [dbo].[f_Moninkertainen_haku_uudet_haut] f
JOIN VipunenTK.dbo.d_hakukohde d_hk						ON d_hk.id = f.hakukohde_id
JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d_ol	ON d_ol.id = f.Hakukohde_oppilaitos_id
JOIN VipunenTK.dbo.d_alueluokitus d_ol_al				ON d_ol_al.id = f.Hakukohde_oppilaitoksen_alueluokitus_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_ka02			ON d_ka02.id = f.Hakukohde_koulutusaste2002_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_kastet2			ON d_kastet2.id = f.Hakukohde_koulutusaste_taso2_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_oa02			ON d_oa02.id = f.Hakukohde_opintoala2002_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_oa95			ON d_oa95.id = f.Hakukohde_opintoala1995_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_iscfibroad		ON d_iscfibroad.id = f.Hakukohde_koulutusala_taso1_id
JOIN VipunenTK.dbo.d_hakukohteen_prioriteetti d_hp		ON d_hp.id = f.Hakukohde_prioriteetti_id
JOIN VipunenTK.dbo.d_hakukohteen_tulos d_ht				ON d_ht.hakukohde_hyvaksytty_koodi = f.Hakukohde_hyvaksytty	AND d_ht.hakukohde_vastaanotettu_koodi = f.Hakukohde_vastaanotettu
JOIN VipunenTK.dbo.d_hakukohteen_tutkinnon_taso d_htt	ON d_htt.hakukohde_tutkinnon_taso_koodi = f.Hakukohde_tutkinnon_taso AND d_htt.Hakukohde_tutkinnon_taso_tarkennus_koodi = f.Hakukohde_tutkinnon_taso_tarkennus
JOIN VipunenTK.dbo.d_hakukohde_erillisvalinta d_hev		ON d_hev.id = f.Hakukohde_erillisvalinta_id
JOIN VipunenTK.dbo.d_kausi d_kau						ON d_kau.kausi_id = f.Hakukohde_koulutuksen_alkamislukukausi_id

WHERE d_hk.jarjestys in (11,12)






' 
GO
/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut_yliopisto]    Script Date: 6.7.2018 15:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_f_tab_Moninkertainen_haku_uudet_haut_yliopisto]'))
EXEC dbo.sp_executesql @statement = N'








CREATE VIEW [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut_yliopisto] AS

--Select * from VipunenTK.dbo.v_f_tab_Moninkertainen_haku_uudet_haut

SELECT
--Aikamuuttujat
       ''Hakukohteen aloituslukuvuosi'' = d_kau.lukuvuosi
	  ,''Hakukohteen aloitusvuosi'' = d_kau.vuosiselite
      ,''Hakukohteen aloituslukukausi'' = d_kau.lukukausiselite
--Organisaatiomuuttujat
	  ,[Hakukohde] = d_hk.hakukohde
      ,[Hakukohteen oppilaitos] = d_ol.oppilaitos
	  ,[Hakukohteen koul. järjestäjä] = d_ol.koulutuksen_jarjestaja
      ,[Hakukohteen oppil. kunta] = d_ol_al.kunta
      ,[Hakukohteen oppil. maakunta] = d_ol_al.maakunta
--Hakukohdemuuttujat
      ,[Hakukohteen koulutusaste] = d_ka02.koulutusaste2002
	  ,[Hakukohteen koulutusaste, taso 1] = d_kastet2.iscle2011
	  ,[Hakukohteen koulutusaste, taso 2] = d_kastet2.Koulutusaste_taso2
      ,[Hakukohteen opintoala] = d_oa02.opintoala2002
	  ,[Hakukohteen koulutusala (02 luokitus)] = d_oa02.koulutusala2002
      ,[Hakukohteen koulutusala (95 luokitus)] = d_oa95.opintoala1995
	  ,[Hakukohteen koulutusala, taso 1] = d_iscfibroad.iscfibroad2013
      ,[Hakukohteen prioriteetti] = d_hp.hakukohteen_prioriteetti
      ,[Hakukohde hyväksytty] = d_ht.hakukohde_hyvaksytty
      ,[Hakukohde vastaanotettu] = d_ht.hakukohde_vastaanotettu
      ,[Hakukohteen tutkinnon taso] = d_htt.hakukohde_tutkinnon_taso
      ,[Hakukohteen tutk. taso tarkennus] = d_htt.hakukohde_tutkinnon_taso_tarkennus
      ,[Hakukohde erillisvalinta] = d_hev.hakukohde_erillisvalinta
      ,''Aik. tutkinto haun koul.asteella''= [Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.asteella''= [Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.alalla (95)''= [Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.alalla (95)''= [Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun opintoalalla''= [Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun opintoalalla''= [Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.alalla (02)''= [Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.alalla (02)''= [Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun oppilaitoksessa''= [Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun oppilaitoksessa''= [Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.sektorilla''= [Johdettu_Sama_sektori_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.sektorilla''= [Johdettu_Sama_sektori_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto tai opiskelu haun sektorilla''= [Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku]
      ,''Aik. tutkinto haun koul.sektorilla (laaja)''= [Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku]
      ,''Opiskellut aik. haun koul.sektorilla (laaja)''= [Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku]
      ,''Aik. tutkinto tai opiskelu haun sektorilla (laaja)''= [Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku]
      ,''Hakenut amk ja yo''= [Johdettu_Hakenut_Amk_ja_Yo]
      ,''Hakenut toinen aste ja korkeakoulut''= [Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste]
      ,''Hakenut lukio ja ammatillinen''= [Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus]
--Järjestyskentät
	  ,jarjestys_hakukohde = d_hk.jarjestys
	  ,jarjestys_oppilaitos = d_ol.jarjestys_oppilaitos
	  ,jarjestys_oppilaitoskunta = d_ol_al.jarjestys
	  ,jarjestys_oppilaitosmaakunta = d_ol_al.jarjestys_maakunta
	  ,jarjestys_koulutusaste2002 = d_ka02.jarjestys_koulutusaste2002
	  ,jarjestys_koulutusaste_taso1 = d_kastet2.jarjestys_iscle2011
	  ,jarjestys_koulutusaste_taso2 = d_kastet2.jarjestys_Koulutusaste_taso2
	  ,jarjestys_opintoala2002 = d_oa02.jarjestys_opintoala2002
	  ,jarjestys_koulutusala2002 = d_oa02.jarjestys_koulutusala2002
	  ,jarjestys_opintoala1995 = d_oa95.jarjestys_opintoala1995
	  ,jarjestys_koulutusala_taso1 = d_iscfibroad.jarjestys_iscfibroad2013
	  ,jarjestys_hakukohteen_prioriteetti = d_hp.jarjestys
	  ,jarjestys_hakukohde_hyvaksytty = d_ht.jarjestys_hyvaksytty
	  ,jarjestys_hakukohde_vastaanotettu = d_ht.jarjestys_vastaanotettu
	  ,jarjestys_hakukohde_tutkinnon_taso = d_htt.jarjestys_hakukohde_tutkinnon_taso
	  ,jarjestys_hakukohde_tutkinnon_taso_tarkennus = d_htt.jarjestys_hakukohde_tutkinnon_taso_tarkennus
	  ,jarjestys_hakukohde_erillisvalinta = d_hev.jarjestys
--Lukumäärämuuttujat
      ,''lkm_uusih2'' = [lkm]
--Faktat yhdistävä kenttä
      ,[rivinumero]
  FROM [dbo].[f_Moninkertainen_haku_uudet_haut] f
JOIN VipunenTK.dbo.d_hakukohde d_hk						ON d_hk.id = f.hakukohde_id
JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d_ol	ON d_ol.id = f.Hakukohde_oppilaitos_id
JOIN VipunenTK.dbo.d_alueluokitus d_ol_al				ON d_ol_al.id = f.Hakukohde_oppilaitoksen_alueluokitus_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_ka02			ON d_ka02.id = f.Hakukohde_koulutusaste2002_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_kastet2			ON d_kastet2.id = f.Hakukohde_koulutusaste_taso2_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_oa02			ON d_oa02.id = f.Hakukohde_opintoala2002_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_oa95			ON d_oa95.id = f.Hakukohde_opintoala1995_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_iscfibroad		ON d_iscfibroad.id = f.Hakukohde_koulutusala_taso1_id
JOIN VipunenTK.dbo.d_hakukohteen_prioriteetti d_hp		ON d_hp.id = f.Hakukohde_prioriteetti_id
JOIN VipunenTK.dbo.d_hakukohteen_tulos d_ht				ON d_ht.hakukohde_hyvaksytty_koodi = f.Hakukohde_hyvaksytty	AND d_ht.hakukohde_vastaanotettu_koodi = f.Hakukohde_vastaanotettu
JOIN VipunenTK.dbo.d_hakukohteen_tutkinnon_taso d_htt	ON d_htt.hakukohde_tutkinnon_taso_koodi = f.Hakukohde_tutkinnon_taso AND d_htt.Hakukohde_tutkinnon_taso_tarkennus_koodi = f.Hakukohde_tutkinnon_taso_tarkennus
JOIN VipunenTK.dbo.d_hakukohde_erillisvalinta d_hev		ON d_hev.id = f.Hakukohde_erillisvalinta_id
JOIN VipunenTK.dbo.d_kausi d_kau						ON d_kau.kausi_id = f.Hakukohde_koulutuksen_alkamislukukausi_id

WHERE d_hk.jarjestys in (13,14) and hakukohde=''yliopisto''






' 
GO
USE [ANTERO]