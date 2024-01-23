USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_alueella_tyossakayvat]    Script Date: 23.1.2024 16:40:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE OR ALTER   VIEW [dbo].[v_f_tab_alueella_tyossakayvat] AS

SELECT
	   [Tilastovuosi] = [tilv]
      ,[lkm]
      ,[Ammattiryhm� (1.taso) (Mitenna)] = d1.mitenna_ammattiryhma1
      ,[Ammattiryhm� (2.taso) (Mitenna)] = d1.mitenna_ammattiryhma2
	  ,[Ammattiryhm� (1.taso)] = d13.oef_ammattiryhma1
      ,[Ammattiryhm� (2.taso)] = d13.oef_ammattiryhma2
      ,[Toimiala (1.taso) (Mitenna)] = d2.mitenna_toimiala1
      ,[Toimiala (2.taso) (Mitenna)] = d2.mitenna_toimiala2
	  ,[Toimiala] = d14.oef_toimiala
      ,[Sukupuoli] = d3.sukupuoli
      ,[�idinkieli] = d4.aidinkieli_versio1
      ,[Ik�ryhm�] = d5.ika
      ,[Koulutusaste] = d6.koulutusaste2002
	  ,[Koulutusaste, taso 1] = d6b.iscle2011
	  ,[Koulutusaste, taso 2] = d6b.Koulutusaste_taso2
	  ,[Koulutusala, taso 1] = d8b.iscfibroad2013
	  ,[Koulutusala, taso 2] = d8b.iscfinarrow2013
      ,[Tutkintotyyppi] = d7.ammatillisen_koulutuksen_koulutuslaji
      ,[Opintoala] = d8.opintoala2002
	  ,[Koulutusala] = d8.koulutusala2002
      ,[Asuinmaakunta] = d9.maakunta
      ,[Ty�nantajasektori] = d10.tyonantajasektori
      ,[Ty�paikan sijaintimaakunta] = d11.maakunta
      ,[Sosioekonominen asema] = d12.sosioekonominen_asema_ryhma

	  --Ruotsi
	  ,[Statistik�r] = [tilv]
      ,[Yrkesgrupp, niv� 1 (Mitenna)] = d1.mitenna_ammattiryhma1_SV
      ,[Yrkesgrupp, niv� 2 (Mitenna)] = d1.mitenna_ammattiryhma2_SV
	  ,[Yrkesgrupp, niv� 1] = d13.oef_ammattiryhma1_SV
      ,[Yrkesgrupp, niv� 2] = d13.oef_ammattiryhma2_SV
      ,[Bransch, niv� 1 (Mitenna)] = d2.mitenna_toimiala1_SV
      ,[Bransch, niv� 2 (Mitenna)] = d2.mitenna_toimiala2_SV
	  ,[Bransch] = d14.oef_toimiala_SV
      ,[K�n] = d3.sukupuoli_SV
      ,[Modersm�l] = d4.aidinkieli_versio1_SV
      ,[�ldersgrupp] = d5.ika_SV
      ,[Utbildningsniv�] = d6.koulutusaste2002_SV
	  ,[Utbildningsniv�, niv� 1] = d6b.iscle2011_SV
	  ,[Utbildningsniv�, niv� 2] = d6b.Koulutusaste_taso2_SV
	  ,[Utbildningsomr�de, niv� 1] = d8b.iscfibroad2013_SV
	  ,[Utbildningsomr�de, niv� 2] = d8b.iscfinarrow2013_SV
      ,[Typ av examen] = d7.ammatillisen_koulutuksen_koulutuslaji_SV
      ,[Studieomr�de] = d8.opintoala2002_SV
	  ,[Utbildningsomr�de] = d8.koulutusala2002_SV
      ,[Bostadslandskap] = d9.maakunta_SV
      ,[Arbetsgivarens sektor] = d10.tyonantajasektori_SV
      ,[Arbetsplatsens landskap] = d11.maakunta_SV
      ,[Socioekonomisk st�llning] = d12.sosioekonominen_asema_ryhma_SV

	  --Englanti
	  ,[Statistical year] = [tilv]
      ,[Profession group, level 1 (Mitenna)] = d1.mitenna_ammattiryhma1_EN
      ,[Profession group, level 2 (Mitenna)] = d1.mitenna_ammattiryhma2_EN
	  ,[Profession group, level 1] = d13.oef_ammattiryhma1_EN
      ,[Profession group, level 2] = d13.oef_ammattiryhma2_EN
      ,[Industry, level 1 (Mitenna)] = d2.mitenna_toimiala1_EN
      ,[Industry, level 2 (Mitenna)] = d2.mitenna_toimiala2_EN
	  ,[Industry] = d14.oef_toimiala_EN
      ,[Gender] = d3.sukupuoli_EN
      ,[Mother tongue] = d4.aidinkieli_versio1_EN
      ,[Age group] = d5.ika_EN
      ,[Level of education] = d6.koulutusaste2002_EN
	  ,[Level of education, tier 1] = d6b.iscle2011_EN
	  ,[Level of education, tier 2] = d6b.Koulutusaste_taso2_EN
	  ,[Field of education, tier 1] = d8b.iscfibroad2013_EN
	  ,[Field of education, tier 2] = d8b.iscfinarrow2013_EN
      ,[Qualification type] = d7.ammatillisen_koulutuksen_koulutuslaji_EN
      ,[Subfield of education] = d8.opintoala2002_EN
	  ,[Field of education] = d8.koulutusala2002_EN
      ,[Region of residence] = d9.maakunta_EN
      ,[Employer sector] = d10.tyonantajasektori_EN
      ,[Region where the job is located] = d11.maakunta_EN
      ,[Socio-economic group] = d12.sosioekonominen_asema_ryhma_EN

	--koodimuuttujat
	  ,d8.koulutusala2002_koodi as "Koodit Koulutusala"
	  ,d8.opintoala2002_koodi as "Koodit Opintoala"
	  ,d8.koulutusaste2002_koodi as "Koodit Koulutusaste"
	  ,d9.maakunta_koodi as "Koodit Asuinmaakunta"
	  ,d11.maakunta_koodi as "Koodit Ty�paikan maakunta"
	  ,d6b.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
	  ,d6b.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
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
	  ,[Ammattiryhm� (1.taso) j�rjestys (Mitenna)] = d1.jarjestys_ammattiryhma1
      ,[Ammattiryhm� (2.taso) j�rjestys (Mitenna)] = d1.jarjestys_ammattiryhma2
	  ,[Ammattiryhm� (1.taso) j�rjestys] = d13.jarjestys_ammattiryhma1
      ,[Ammattiryhm� (2.taso) j�rjestys] = d13.jarjestys_ammattiryhma2
      ,[Toimiala (1.taso) j�rjestys (Mitenna)] = d2.jarjestys_mitenna_toimiala1
      ,[Toimiala (2.taso) j�rjestys (Mitenna)] = d2.jarjestys_mitenna_toimiala2
	  ,[Toimiala j�rjestys] = d14.jarjestys_oef_toimiala
      ,[Sukupuoli j�rjestys] = d3.jarjestys
      ,[�idinkieli j�rjestys] = d4.jarjestys
      ,[Ik�ryhm� j�rjestys] = d5.jarjestys_ika
      ,[Koulutusaste j�rjestys] = d6.jarjestys_koulutusaste2002
      ,[Tutkintotyyppi j�rjestys] = d7.jarjestys
      ,[Opintoala j�rjestys] = d8.jarjestys_opintoala2002
	  ,[koulutusala j�rjestys] = d8.jarjestys_koulutusala2002
      ,[Asuinmaakunta j�rjestys] = d9.jarjestys_maakunta
      ,[Ty�nantajasektori j�rjestys] = d10.jarjestys
      ,[Ty�paikan sijaintimaakunta j�rjestys] = d11.jarjestys_maakunta
      ,[Sosioekonominen asema j�rjestys] = d12.jarjestys_ryhma
	  ,d6b.jarjestys_iscle2011 as jarj_isced_koulast1
	  ,d6b.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
	  ,d8b.jarjestys_iscfibroad2013 as jarj_isced_koulala1
	  ,d8b.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
	  --,d8.jarjestys_iscfi2013 as jarj_isced_koulala3
	  --,d8.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1

  FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat] f
  LEFT JOIN VipunenTK.dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
  LEFT JOIN VipunenTK.dbo.d_mitenna_toimiala d2 on d2.id=f.mitenna_toimiala_id
  LEFT JOIN VipunenTK.dbo.d_sukupuoli d3 on d3.id=f.sukupuoli_id
  LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio1 d4 on d4.id=f.aikielir1_id
  LEFT JOIN VipunenTK.dbo.d_ika d5 on d5.id=f.ika_id
  LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d6 on d6.id=f.koulutusaste_id
  LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d6b on d6b.id=f.koulutusaste_taso2_id
  LEFT JOIN VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d7 on d7.id=f.tutkintolaji_id
  LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d8 on d8.id=f.opintoala_id
  LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d8b on d8b.id=f.koulutusala_taso2_id
  LEFT JOIN VipunenTK.dbo.d_alueluokitus d9 on d9.id=f.asuinmaakunta_id
  LEFT JOIN VipunenTK.dbo.d_tyonantajasektori d10 on d10.id=f.tyonantajasektori_id
  LEFT JOIN VipunenTK.dbo.d_alueluokitus d11 on d11.id=f.tyomaakunta_id
  LEFT JOIN VipunenTK.dbo.d_sosioekonominen_asema d12 on d12.id=f.sosioekonominen_asema_id

  LEFT JOIN VipunenTK.dbo.d_oef_ammatti d13 on d13.id=f.oef_ammatti_id
  LEFT JOIN VipunenTK.dbo.d_oef_toimiala d14 on d14.id=f.oef_toimiala_id



GO


