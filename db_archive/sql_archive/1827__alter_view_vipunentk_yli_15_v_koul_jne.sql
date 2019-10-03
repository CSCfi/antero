USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_yli_15-v_koul_kielen_ja_askunnan_mukaan]    Script Date: 11.9.2018 15:41:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[v_f_tab_yli_15-v_koul_kielen_ja_askunnan_mukaan] AS

SELECT [tilv] AS Tilastovuosi
      ,CASE WHEN d1.aidinkieli_versio2_koodi in ('fi', 'se') THEN 'suomi (sis. saame)' ELSE d1.aidinkieli_versio2 END AS [Äidinkieli I]
      ,d2.kieli AS [Äidinkieli II]
	  ,d3.kunta AS [Asuinkunta]
	  ,d3.maakunta AS [Asuinmaakunta]
	  ,d3.ely AS [Asuinalueen ELY]
	  ,d3.avi AS [Asuinalueen AVI]
      ,CASE WHEN d4.ika_int >= 70 THEN 'yli 70-vuotiaat' ELSE d4.ika5v END AS [Ikäryhmä]
      ,d5.koulutusala AS [Koulutusala]
      ,CASE WHEN d6.koulutusaste_2002koodi = 90 THEN 'Ei perusasteen jälkeistä tutkintoa tai tutkinto tuntematon' ELSE d6.koulutusaste_2002 END AS [Koulutusaste]
	  ,d7.iscfibroad2013 AS 'Koulutusala, taso 1'
	  ,case when d8.Koulutusaste_taso2_koodi in (-1,91) then 'Ei perusasteen jälkeistä tutkintoa tai tutkinto tuntematon' else d8.Koulutusaste_taso2 end as "Koulutusaste, taso 2"
	  ,case when d8.iscle2011_koodi in (-1,9) then 'Ei perusasteen jälkeistä tutkintoa tai tutkinto tuntematon' else d8.iscle2011 end as "Koulutusaste, taso 1"

      ,[lkm] AS lkm_int2
	  

	  --ruotsi
	  ,[tilv] AS [Statistikår]
      ,CASE WHEN d1.aidinkieli_versio2_koodi in ('fi', 'se') THEN 'finska (inn. samiska)' ELSE d1.aidinkieli_versio2_SV END AS [Modersmål I]
      ,d2.kieli_SV AS [Modersmål II]
	  ,d3.kunta_SV AS [Bostadskommun]
	  ,d3.maakunta_SV AS [Bostadslandskap]
	  ,d3.ely_SV AS [Bostadsortens NTM-område]
	  ,d3.avi_SV AS [Bostadsortens RFV-område]
      ,CASE WHEN d4.ika_int >= 70 THEN 'mer än 70 år' ELSE d4.ika5v_SV END AS [Åldersgrupp]
      ,d5.koulutusala_SV AS [Utbildningsområde]
      ,CASE WHEN d6.koulutusaste_2002koodi = 90 THEN 'Inget diplom efter grundutbildning eller diplom okänd' ELSE d6.koulutusaste_2002_SV END AS [Utbildningsnivå]
	  ,d2.jarjestys_kieli_se AS jarjestys_aidinkieli_II_sv
	  ,d7.iscfibroad2013_SV AS 'Utbildningsområde, nivå 1'
	  ,case when d8.iscle2011_koodi in (-1,9) then 'Ingen examen efter den grundläggande utbildningen eller examen okänd' else d8.iscle2011_SV end as "Utbildningsnivå, nivå 1"
	  ,case when d8.Koulutusaste_taso2_koodi in (-1,91) then 'Ingen examen efter den grundläggande utbildningen eller examen okänd' else d8.Koulutusaste_taso2_SV end as "Utbildningsnivå, nivå 2"

	  --englanti
	  ,[tilv] AS [Statistical year]
      ,CASE WHEN d1.aidinkieli_versio2_koodi in ('fi', 'se') THEN 'Finnish (incl. Lapp, Saam)' ELSE d1.aidinkieli_versio2_EN END AS [Mother tongue I]
      ,d2.kieli_EN AS [Mother tongue II]
	  ,d3.kunta_EN AS [Municipality of residence]
	  ,d3.maakunta_EN AS [Region of residence]
	  ,d3.ely_EN AS [ELY area of the place of residence]
	  ,d3.avi_EN AS [AVI area of the place of residence]
      ,CASE WHEN d4.ika_int >= 70 THEN 'over 70 year old' ELSE d4.ika5v_EN END AS [Age group]
      ,d5.koulutusala_EN AS [Field of education]
      ,CASE WHEN d6.koulutusaste_2002koodi = 90 THEN 'No diploma after elementary education or diploma unknown' ELSE d6.koulutusaste_2002_EN END AS [Level of education]
	  ,d7.iscfibroad2013_EN AS 'Field of education, tier 1'
	  ,case when d8.iscle2011_koodi in (-1,9) then 'No degree after elementary education or degree unknown' else d8.iscle2011_EN end as "Level of education, tier 1"
	  ,case when d8.Koulutusaste_taso2_koodi in (-1,91) then 'No degree after elementary education or degree unknown' else d8.Koulutusaste_taso2_EN end as "Level of education, tier 2"

	  --järjestys
	  ,CASE WHEN d1.aidinkieli_versio2_koodi in ('fi', 'se') THEN 1 WHEN d1.aidinkieli_versio2_koodi = 'sv' THEN 2 WHEN d1.aidinkieli_versio2_koodi = '99' THEN 3 ELSE d1.jarjestys END AS jarjestys_aidinkieli_I
	  ,d2.jarjestys_kieli_fi AS jarjestys_aidinkieli_II
	  ,d2.jarjestys_kieli_en AS jarjestys_aidinkieli_II_en
	  ,d3.jarjestys
	  ,d3.jarjestys_maakunta
	  ,d3.jarjestys_ely
	  ,d3.jarjestys_avi
	  ,d4.jarjestys_ika5v
	  ,d5.jarjestys AS jarjestys_koulutusala
	  ,d6.jarjestys AS jarjestys_koulutusaste
	  ,d7.jarjestys_iscfibroad2013 AS jarjestys_koulutusala_taso1
	  ,d8.jarjestys_Koulutusaste_taso2 AS jarjestys_koulutusaste_taso2
	  ,d8.jarjestys_iscle2011 AS jarjestys_koulutusaste_taso1
  FROM [VipunenTK].[dbo].[f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan] f
  LEFT JOIN [VipunenTK].[dbo].[d_aidinkieli_versio2] d1 ON f.aidinkieli_I_id = d1.id
  LEFT JOIN [VipunenTK].[dbo].[v_d_kieli_jarjestys_nimen_mukaan] d2 ON f.aidinkieli_II_id = d2.id
  LEFT JOIN [VipunenTK].[dbo].[d_alueluokitus] d3 ON f.alueluokitus_id = d3.id
  LEFT JOIN [VipunenTK].[dbo].[d_ika] d4 ON f.ika_id = d4.id
  LEFT JOIN [VipunenTK].[dbo].[d_opetushallinnon_koulutusala] d5 ON f.koulutusala_id = d5.id
  LEFT JOIN [VipunenTK].[dbo].[d_koulutusaste_2002] d6 ON f.koulutusaste_id = d6.id
  LEFT JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d7 ON f.koulutusala_taso1_id = d7.id
  LEFT JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d8 ON f.koulutusaste_taso2_id = d8.id




GO


USE [ANTERO]