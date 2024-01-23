USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_alueella_tyossakayvat_ammateittain]    Script Date: 23.1.2024 16:09:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE OR ALTER     VIEW [dbo].[v_f_tab_alueella_tyossakayvat_ammateittain] AS

SELECT [Tilastovuosi] = [tilv]
      ,[lkm]
      ,[Ammattiryhm� 1. taso (Mitenna)] = d1.mitenna_ammattiryhma1
      ,[Ammattiryhm� 2. taso (Mitenna)] = d1.mitenna_ammattiryhma2
	  ,[Ammatti (Mitenna)] = d1.mitenna_ammatti
	  ,[Ammattiryhm� 1. taso] = d9.oef_ammattiryhma1
      ,[Ammattiryhm� 2. taso] = d9.oef_ammattiryhma2
	  ,[Ammatti] = d10.ammattiluokitus_2010
	  ,[Sukupuoli] = d2.sukupuoli
	  ,[�idinkieli] = d4.aidinkieli_versio1
      ,[Ik�ryhm�] = d3.ika5v
	  ,[Koulutusaste] = d5.koulutusaste2002
	  ,[Koulutusaste, taso 1] = d5b.iscle2011
	  ,[Koulutusaste, taso 2] = d5b.Koulutusaste_taso2
	  ,[Koulutusala, taso 1] = d8b.iscfibroad2013
	  ,[Koulutusala, taso 2] = d8b.iscfinarrow2013
	  ,[Ammatillisen koulutuksen koulutuslaji] = d6.ammatillisen_koulutuksen_koulutuslaji
	  ,[Opintoala] = d8.opintoala2002
	  ,[Koulutusala] = d8.koulutusala2002
      ,[Ty�paikan sijaintimaakunta] = d7.maakunta

	  --Ruotsi
	  ,[Statistik�r] = [tilv]
      ,[Yrkesgrupp, niv� 1 (Mitenna)] = d1.mitenna_ammattiryhma1_SV
      ,[Yrkesgrupp, niv� 2 (Mitenna)] = d1.mitenna_ammattiryhma2_SV
	  ,[Yrke (Mitenna)] = d1.mitenna_ammatti_SV
	  ,[Yrkesgrupp, niv� 1] = d9.oef_ammattiryhma1_SV
      ,[Yrkesgrupp, niv� 2] = d9.oef_ammattiryhma2_SV
	  ,[Yrke] = d10.ammattiluokitus_2010_SV
	  ,[K�n] = d2.sukupuoli_SV
	  ,[Modersm�l] = d4.aidinkieli_versio1_SV
      ,[�ldersgrupp] = d3.ika5v_SV
	  ,[Utbildningsniv�] = d5.koulutusaste2002_SV
	  ,[Utbildningsniv�, niv� 1] = d5b.iscle2011_SV
	  ,[Utbildningsniv�, niv� 2] = d5b.Koulutusaste_taso2_SV
	  ,[Utbildningsomr�de, niv� 1] = d8b.iscfibroad2013_SV
	  ,[Utbildningsomr�de, niv� 2] = d8b.iscfinarrow2013_SV
	  ,[Utbildningsslag] = d6.ammatillisen_koulutuksen_koulutuslaji_SV
	  ,[Studieomr�de] = d8.opintoala2002_SV
	  ,[Utbildningsomr�de] = d8.koulutusala2002_SV
      ,[Arbetsplatsens landskap] = d7.maakunta_SV

	  --Englanti
	  ,[Statistical year] = [tilv]
      ,[Profession group, level 1 (Mitenna)] = d1.mitenna_ammattiryhma1_EN
      ,[Profession group, level 2 (Mitenna)] = d1.mitenna_ammattiryhma2_EN
	  ,[Profession (Mitenna)] = d1.mitenna_ammatti_EN
	  ,[Profession group, level 1] = d9.oef_ammattiryhma1_EN
      ,[Profession group, level 2] = d9.oef_ammattiryhma2_EN
	  ,[Profession] = d10.ammattiluokitus_2010_EN
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
	  ,d7.maakunta_koodi as "Koodit Ty�paikan maakunta"
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
	  ,d8.iscle2011_SV as "Utbildn.niv�, niv� 1"
	  ,d8.Koulutusaste_taso2_SV as "Utbildn.niv�, niv� 2"
	  ,d8.iscfibroad2013_SV as "Utbildn.omr�de, niv� 1"
	  ,d8.iscfinarrow2013_SV as "Utbildn.omr�de, niv� 2"
	  ,d8.iscfi2013_SV as "Utbildn.omr�de, niv� 3"
	  ,d8.OKM_ohjauksen_ala_SV as "UKM-styrningsomr�de, h�gskolor"
	  ,d8.iscle2011_EN as "Level of education, tier 1"
	  ,d8.Koulutusaste_taso2_EN as "Level of education, tier 2"
	  ,d8.iscfibroad2013_EN as "Field of education, tier 1"
	  ,d8.iscfinarrow2013_EN as "Field of education, tier 2"
	  ,d8.iscfi2013_EN as "Field of education, tier 3"
	  ,d8.OKM_ohjauksen_ala_EN as "Field of ed., HE steering"
*/
	  --j�rjestyskent�t
	  ,[Ammattiryhm� 1. taso j�rj (Mitenna)] = RIGHT(d1.jarjestys_ammattiryhma1,2)
      ,[Ammattiryhm� 2. taso j�rj (Mitenna)] = CASE RIGHT(d1.jarjestys_ammattiryhma2,5) when '010.2' then '01.02' when '020.9' then '02.09' else RIGHT(d1.jarjestys_ammattiryhma2,5) end
	  ,[Ammatti j�rj (Mitenna)] = RIGHT(d1.jarjestys_ammatti,5)
	  ,[Ammattiryhm� 1. taso j�rj] = d9.jarjestys_ammattiryhma1
      ,[Ammattiryhm� 2. taso j�rj] = d9.jarjestys_ammattiryhma2
	  ,[Ammatti j�rj] = d10.ammattiluokitus_2010_jarjestys
	  ,[Sukupuoli j�rj] = d2.jarjestys
	  ,[�idinkieli j�rj] = d4.jarjestys
      ,[Ik�ryhm� j�rj] = d3.jarjestys_ika5v
	  ,[Koulutusaste j�rj] = d5.jarjestys_koulutusaste2002
	  ,[Ammatillisen koulutuksen koulutuslaji j�rj] = d6.jarjestys
	  ,[Opintoala j�rj] = d8.jarjestys_opintoala2002
	  ,[Koulutusala j�rj] = d8.jarjestys_koulutusala2002
      ,[Ty�paikan sijaintimaakunta j�rj] = d7.jarjestys_maakunta
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

  LEFT JOIN VipunenTK.dbo.d_oef_ammatti d9 on d9.id=f.oef_ammatti_id
  LEFT JOIN VipunenTK.dbo.v_d_ammattiluokitus_2010 d10 on d10.id=f.amm2010_id





GO


