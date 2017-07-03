USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut]    Script Date: 27.6.2017 12:09:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[v_f_tab_Moninkertainen_haku_uudet_haut] AS

--Select * from VipunenTK.dbo.v_f_tab_Moninkertainen_haku_uudet_haut

SELECT
--Aikamuuttujat
       'Hakukohteen aloituslukuvuosi' = d_kau.lukuvuosi
	  ,'Hakukohteen aloitusvuosi' = d_kau.vuosiselite
      ,'Hakukohteen aloituslukukausi' = d_kau.lukukausiselite
--Organisaatiomuuttujat
	  ,[Hakukohde] = d_hk.hakukohde
      ,[Hakukohteen oppilaitos] = d_ol.oppilaitos
	  ,[Hakukohteen koul. järjestäjä] = d_ol.koulutuksen_jarjestaja
      ,[Hakukohteen oppil. kunta] = d_ol_al.kunta
      ,[Hakukohteen oppil. maakunta] = d_ol_al.maakunta
--Hakukohdemuuttujat
      ,[Hakukohteen koulutusaste] = d_ka02.koulutusaste2002
      ,[Hakukohteen opintoala] = d_oa02.opintoala2002
	  ,[Hakukohteen koulutusala (02 luokitus)] = d_oa02.koulutusala2002
      ,[Hakukohteen koulutusala (95 luokitus)] = d_oa95.opintoala1995
      ,[Hakukohteen prioriteetti] = d_hp.hakukohteen_prioriteetti
      ,[Hakukohde hyväksytty] = d_ht.hakukohde_hyvaksytty
      ,[Hakukohde vastaanotettu] = d_ht.hakukohde_vastaanotettu
      ,[Hakukohteen tutkinnon taso] = d_htt.hakukohde_tutkinnon_taso
      ,[Hakukohteen tutk. taso tarkennus] = case when d_htt.hakukohde_tutkinnon_taso_tarkennus='Tuntematon' then d_htt.hakukohde_tutkinnon_taso else d_htt.hakukohde_tutkinnon_taso_tarkennus end
      ,[Hakukohde erillisvalinta] = d_hev.hakukohde_erillisvalinta
      ,'Aik. tutkinto haun koul.asteella'= [Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku]
      ,'Opiskellut aik. haun koul.asteella'= [Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku]
      ,'Aik. tutkinto haun koul.alalla (95)'= [Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku]
      ,'Opiskellut aik. haun koul.alalla (95)'= [Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku]
      ,'Aik. tutkinto haun opintoalalla'= [Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku]
      ,'Opiskellut aik. haun opintoalalla'= [Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku]
      ,'Aik. tutkinto haun koul.alalla (02)'= [Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku]
      ,'Opiskellut aik. haun koul.alalla (02)'= [Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku]
      ,'Aik. tutkinto haun oppilaitoksessa'= [Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku]
      ,'Opiskellut aik. haun oppilaitoksessa'= [Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku]
      ,'Aik. tutkinto haun koul.sektorilla'= [Johdettu_Sama_sektori_Aiempi_tutkinto_Haku]
      ,'Opiskellut aik. haun koul.sektorilla'= [Johdettu_Sama_sektori_Aiempi_opiskelu_Haku]
      ,'Aik. tutkinto tai opiskelu haun sektorilla'= [Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku]
      ,'Aik. tutkinto haun koul.sektorilla (laaja)'= [Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku]
      ,'Opiskellut aik. haun koul.sektorilla (laaja)'= [Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku]
      ,'Aik. tutkinto tai opiskelu haun sektorilla (laaja)'= [Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku]
      ,'Hakenut amk ja yo'= [Johdettu_Hakenut_Amk_ja_Yo]
      ,'Hakenut toinen aste ja korkeakoulut'= [Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste]
      ,'Hakenut lukio ja ammatillinen'= [Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus]
--Järjestyskentät
	  ,jarjestys_hakukohde = d_hk.jarjestys
	  ,jarjestys_oppilaitos = d_ol.jarjestys_oppilaitos
	  ,jarjestys_oppilaitoskunta = d_ol_al.jarjestys
	  ,jarjestys_oppilaitosmaakunta = d_ol_al.jarjestys_maakunta
	  ,jarjestys_koulutusaste2002 = d_ka02.jarjestys_koulutusaste2002
	  ,jarjestys_opintoala2002 = d_oa02.jarjestys_opintoala2002
	  ,jarjestys_koulutusala2002 = d_oa02.jarjestys_koulutusala2002
	  ,jarjestys_opintoala1995 = d_oa95.jarjestys_opintoala1995
	  ,jarjestys_hakukohteen_prioriteetti = d_hp.jarjestys
	  ,jarjestys_hakukohde_hyvaksytty = d_ht.jarjestys_hyvaksytty
	  ,jarjestys_hakukohde_vastaanotettu = d_ht.jarjestys_vastaanotettu
	  ,jarjestys_hakukohde_tutkinnon_taso = d_htt.jarjestys_hakukohde_tutkinnon_taso
	  ,jarjestys_hakukohde_tutkinnon_taso_tarkennus = case d_htt.hakukohde_tutkinnon_taso when 'Ylempi amk-tutkinto' then 99 else d_htt.jarjestys_hakukohde_tutkinnon_taso_tarkennus end
	  ,jarjestys_hakukohde_erillisvalinta = d_hev.jarjestys
--Lukumäärämuuttujat
      ,'lkm_uusih2' = [lkm]
--Faktat yhdistävä kenttä
      ,[rivinumero]
  FROM [dbo].[f_Moninkertainen_haku_uudet_haut] f
JOIN VipunenTK.dbo.d_hakukohde d_hk
	ON d_hk.id = f.hakukohde_id
JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d_ol
	ON d_ol.id = f.Hakukohde_oppilaitos_id
JOIN VipunenTK.dbo.d_alueluokitus d_ol_al
	ON d_ol_al.id = f.Hakukohde_oppilaitoksen_alueluokitus_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_ka02
	ON d_ka02.id = f.Hakukohde_koulutusaste2002_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_oa02
	ON d_oa02.id = f.Hakukohde_opintoala2002_id
JOIN VipunenTK.dbo.d_koulutusluokitus d_oa95
	ON d_oa95.id = f.Hakukohde_opintoala1995_id
JOIN VipunenTK.dbo.d_hakukohteen_prioriteetti d_hp
	ON d_hp.id = f.Hakukohde_prioriteetti_id
JOIN VipunenTK.dbo.d_hakukohteen_tulos d_ht
	ON d_ht.hakukohde_hyvaksytty_koodi = f.Hakukohde_hyvaksytty
	AND d_ht.hakukohde_vastaanotettu_koodi = f.Hakukohde_vastaanotettu
JOIN VipunenTK.dbo.d_hakukohteen_tutkinnon_taso d_htt
	ON d_htt.hakukohde_tutkinnon_taso_koodi = f.Hakukohde_tutkinnon_taso
	AND d_htt.Hakukohde_tutkinnon_taso_tarkennus_koodi = f.Hakukohde_tutkinnon_taso_tarkennus
JOIN VipunenTK.dbo.d_hakukohde_erillisvalinta d_hev
	ON d_hev.id = f.Hakukohde_erillisvalinta_id
JOIN VipunenTK.dbo.d_kausi d_kau
	ON d_kau.kausi_id = f.Hakukohde_koulutuksen_alkamislukukausi_id

WHERE d_hk.jarjestys in (13,14)







GO




USE [ANTERO]
