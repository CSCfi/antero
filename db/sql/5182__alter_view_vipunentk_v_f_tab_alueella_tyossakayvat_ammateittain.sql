USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_alueella_tyossakayvat_ammateittain]    Script Date: 2.12.2021 20:05:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_tab_alueella_tyossakayvat_ammateittain] AS

SELECT [Tilastovuosi] = [tilv]
      ,[lkm]
      ,[Ammattiryhmä 1. taso] = d1.mitenna_ammattiryhma1
      ,[Ammattiryhmä 2. taso] = d1.mitenna_ammattiryhma2
	  ,[Ammatti] = d1.mitenna_ammatti
	  ,[Sukupuoli] = d2.sukupuoli
	  ,[Äidinkieli] = d4.aidinkieli_versio1
      ,[Ikäryhmä] = d3.ika5v
	  ,[Koulutusaste] = d5.koulutusaste2002
	  ,[Koulutusaste, taso 1] = d5b.iscle2011
	  ,[Koulutusaste, taso 2] = d5b.Koulutusaste_taso2
	  ,[Koulutusala, taso 1] = d8b.iscfibroad2013
	  ,[Koulutusala, taso 2] = d8b.iscfinarrow2013
	  ,[Ammatillisen koulutuksen koulutuslaji] = d6.ammatillisen_koulutuksen_koulutuslaji
	  ,[Opintoala] = d8.opintoala2002
	  ,[Koulutusala] = d8.koulutusala2002
      ,[Työpaikan sijaintimaakunta] = d7.maakunta

	  --Ruotsi
	  ,[Statistikår] = [tilv]
      ,[Yrkesgrupp, nivå 1] = d1.mitenna_ammattiryhma1_SV
      ,[Yrkesgrupp, nivå 2] = d1.mitenna_ammattiryhma2_SV
	  ,[Yrke] = d1.mitenna_ammatti_SV
	  ,[Kön] = d2.sukupuoli_SV
	  ,[Modersmål] = d4.aidinkieli_versio1_SV
      ,[Åldersgrupp] = d3.ika5v_SV
	  ,[Utbildningsnivå] = d5.koulutusaste2002_SV
	  ,[Utbildningsnivå, nivå 1] = d5b.iscle2011_SV
	  ,[Utbildningsnivå, nivå 2] = d5b.Koulutusaste_taso2_SV
	  ,[Utbildningsområde, nivå 1] = d8b.iscfibroad2013_SV
	  ,[Utbildningsområde, nivå 2] = d8b.iscfinarrow2013_SV
	  ,[Utbildningsslag] = d6.ammatillisen_koulutuksen_koulutuslaji_SV
	  ,[Studieområde] = d8.opintoala2002_SV
	  ,[Utbildningsområde] = d8.koulutusala2002_SV
      ,[Arbetsplatsens landskap] = d7.maakunta_SV

	  --Englanti
	  ,[Statistical year] = [tilv]
      ,[Profession group, level 1] = d1.mitenna_ammattiryhma1_EN
      ,[Profession group, level 2] = d1.mitenna_ammattiryhma2_EN
	  ,[Profession] = d1.mitenna_ammatti_EN
	  ,[Gender] = d2.sukupuoli_EN
	  ,[Mother tongue] = d4.aidinkieli_versio1_EN
      ,[Age group] = d3.ika5v_EN
	  ,[Level of education] = d5.koulutusaste2002_EN
	  ,[Level of education, tier 1] = d5b.iscle2011_EN
	  ,[Level of education, tier 2] = d5b.Koulutusaste_taso2_EN
	  ,[Field of education, tier 1] = d8b.iscfibroad2013_EN
	  ,[Field of education, tier 2] = d8b.iscfinarrow2013_EN
	  ,[Form of education and training] = d6.ammatillisen_koulutuksen_koulutuslaji_EN
	  ,[Subfield of education] = d8.opintoala2002_EN
	  ,[Field of education] = d8.koulutusala2002_EN
      ,[Region where the job is located] = d7.maakunta_EN

	  --koodimuuttujat
	  ,d8.koulutusala2002_koodi as "Koodit Koulutusala"
	  ,d8.opintoala2002_koodi as "Koodit Opintoala"
	  ,d8.koulutusaste2002_koodi as "Koodit Koulutusaste"
	  ,d7.maakunta_koodi as "Koodit Työpaikan maakunta"
	  ,d5b.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
	  ,d5b.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
	  ,d8b.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
	  ,d8b.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
/*
	  --isced
	  ,d8.iscle2011 as "Koulutusaste, taso 1"
	  ,d8.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	  ,d8.iscfibroad2013 as "Koulutusala, taso 1"
	  ,d8.iscfinarrow2013 as "Koulutusala, taso 2"
	  ,d8.iscfi2013 as "Koulutusala, taso 3"
	  ,d8.OKM_ohjauksen_ala as "OKM ohjauksen ala, korkeak."
	  ,d8.iscle2011_SV as "Utbildn.nivå, nivå 1"
	  ,d8.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	  ,d8.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	  ,d8.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	  ,d8.iscfi2013_SV as "Utbildn.område, nivå 3"
	  ,d8.OKM_ohjauksen_ala_SV as "UKM-styrningsområde, högskolor"
	  ,d8.iscle2011_EN as "Level of education, tier 1"
	  ,d8.Koulutusaste_taso2_EN as "Level of education, tier 2"
	  ,d8.iscfibroad2013_EN as "Field of education, tier 1"
	  ,d8.iscfinarrow2013_EN as "Field of education, tier 2"
	  ,d8.iscfi2013_EN as "Field of education, tier 3"
	  ,d8.OKM_ohjauksen_ala_EN as "Field of ed., HE steering"
*/
	  --järjestyskentät
	  ,[Ammattiryhmä 1. taso järj] = RIGHT(d1.jarjestys_ammattiryhma1,2)
      ,[Ammattiryhmä 2. taso järj] = CASE RIGHT(d1.jarjestys_ammattiryhma2,5) when '010.2' then '01.02' when '020.9' then '02.09' else RIGHT(d1.jarjestys_ammattiryhma2,5) end
	  ,[Ammatti järj] = RIGHT(d1.jarjestys_ammatti,5)
	  ,[Sukupuoli järj] = d2.jarjestys
	  ,[Äidinkieli järj] = d4.jarjestys
      ,[Ikäryhmä järj] = d3.jarjestys_ika5v
	  ,[Koulutusaste järj] = d5.jarjestys_koulutusaste2002
	  ,[Ammatillisen koulutuksen koulutuslaji järj] = d6.jarjestys
	  ,[Opintoala järj] = d8.jarjestys_opintoala2002
	  ,[Koulutusala järj] = d8.jarjestys_koulutusala2002
      ,[Työpaikan sijaintimaakunta järj] = d7.jarjestys_maakunta
	  ,d5b.jarjestys_iscle2011 as jarj_isced_koulast1
	  ,d5b.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
	  ,d8b.jarjestys_iscfibroad2013 as jarj_isced_koulala1
	  ,d8b.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
	  --,d8.jarjestys_iscfi2013 as jarj_isced_koulala3
	  --,d8.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1

  FROM [VipunenTK].[dbo].[f_tyossakayvat_ammateittain] f
  LEFT JOIN dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
  LEFT JOIN dbo.d_sukupuoli d2 on d2.id=f.sukupuoli_id
  LEFT JOIN dbo.d_ika d3 on d3.id=f.ika_id
  LEFT JOIN dbo.d_aidinkieli_versio1 d4 on d4.id=f.aikielir1_id

  LEFT JOIN dbo.d_koulutusluokitus d5 on d5.id=f.koulutusaste_id
  LEFT JOIN dbo.d_koulutusluokitus d5b on d5b.id=f.koulutusaste_taso2_id

  LEFT JOIN dbo.d_ammatillisen_koulutuksen_koulutuslaji d6 on d6.id=f.tutkintolaji_id
  LEFT JOIN dbo.d_alueluokitus d7 on d7.id=f.tyomaakunta_id

  LEFT JOIN dbo.d_koulutusluokitus d8 on d8.id=f.koulutusluokitus_id
  LEFT JOIN dbo.d_koulutusluokitus d8b on d8b.id=f.koulutusala_taso2_id



GO


