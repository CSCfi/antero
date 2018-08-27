USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_oppisopimus_koulutuksen_kesto]    Script Date: 8.8.2018 16:02:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER view [dbo].[v_f_tab_oppisopimus_koulutuksen_kesto] as


SELECT [Tilastovuosi] = f.tilastovuosi
      ,[Oppisopimus_osallistuneet_ja_tutkinnon_suorittaneet] = d1.oppis_osallis_ja_tutk_suor
      ,[Sukupuoli] = d2.sukupuoli
      ,[Aidinkieli versio1] = d3.aidinkieli_versio1
	  ,[Ika] = d4.ika
	  ,[Opetushallinnon koulutusala] = d5.koulutusala2002
	  ,[Opetushallinnon koulutusaste] = d6.koulutusaste2002
	  ,[Koulutusala taso 1] = d11.iscfibroad2013
	  ,[Koulutusaste taso 2] = d12.Koulutusaste_taso2
	  ,[Ammatillisen koulutuksen koulutuslaji] = d7.ammatillisen_koulutuksen_koulutuslaji
	  ,[Koulutuksen sijaintimaakunta] = d8.maakunta
	  ,[Koulutuksen arvioitu kesto] = d9.koulutuksen_kesto
	  ,[Koulutuksen toteutunut kesto] = d10.koulutuksen_kesto

	  --Ruotsi
	  ,[Statistikår] = f.tilastovuosi
      ,[Oppisopimus_osallistuneet_ja_tutkinnon_suorittaneetSV] = d1.oppis_osallis_ja_tutk_suor_SV
      ,[Kön] = d2.sukupuoli_SV
      ,[Modersmål] = d3.aidinkieli_versio1_SV
	  ,[Ålder] = d4.ika_SV
	  ,[Utbildningsområde] = d5.koulutusala2002_SV
	  ,[Utbildningsnivå] = d6.koulutusaste2002_SV
	  ,[Utbildn.område, nivå 1] = d11.iscfibroad2013_SV
	  ,[Utbildn.nivå, nivå 2] = d12.Koulutusaste_taso2_SV
	  ,[Typ av examen] = d7.ammatillisen_koulutuksen_koulutuslaji_SV
	  ,[Utbildningsanordnarens landskap] = d8.maakunta_SV
	  ,[Beräknad längd på utbildningen] = d9.koulutuksen_kesto_SV
	  ,[Utbildningens längd] = d10.koulutuksen_kesto_SV

	  --Englanti
	  ,[Statistical year] = f.tilastovuosi
      ,[Oppisopimus_osallistuneet_ja_tutkinnon_suorittaneetEN] = d1.oppis_osallis_ja_tutk_suor_EN
      ,[Gender] = d2.sukupuoli_EN
      ,[Mother tongue] = d3.aidinkieli_versio1_EN
	  ,[Age] = d4.ika_EN
	  ,[Field of education] = d5.koulutusala2002_EN
	  ,[Level of education] = d6.koulutusaste2002_EN
	  ,[Field of education, tier 1] = d11.iscfibroad2013_EN
	  ,[Level of ed., tier 2] = d12.Koulutusaste_taso2_EN
	  ,[Qualification type] = d7.ammatillisen_koulutuksen_koulutuslaji_EN
	  ,[Region of education provider] = d8.maakunta_EN
	  ,[Estimated duration of education] = d9.koulutuksen_kesto_EN
	  ,[Duration of education] = d10.koulutuksen_kesto_EN


	  --Mittari
      ,[Opiskelijat]
	  
	  --jarjestyskentät
	  ,[Oppisryh jarjestys]= d1.jarjestys
	  ,[Sukupuoli jarjestys] = d2.jarjestys
	  ,[Aidinkieli versio1 jarjestys] = d3.jarjestys
	  ,[Ika jarjestys] = d4.jarjestys_ika
	  ,[Opetushallinnon koulutusala jarjestys] = d5.jarjestys_koulutusala2002
	  ,[Opetushallinnon koulutusaste jarjestys] = d6.jarjestys_koulutusaste2002
	  ,[Koulutusala taso 1 jarjestys] = d11.jarjestys_iscfibroad2013
	  ,[Koulutusaste taso 2 jarjestys] = d12.jarjestys_Koulutusaste_taso2
	  ,[Ammatillisen koulutuksen koulutuslaji jarjestys] = d7.jarjestys
	  ,[Koulutuksen sijaintimaakunta jarjestys] = d8.jarjestys_maakunta
	  ,[Koulutuksen arvioitu kesto jarjestys] = d9.jarjestys
	  ,[Koulutuksen toteutunut kesto jarjestys] = d10.jarjestys

      


FROM [VipunenTK].[dbo].[f_3_1b_Oppisopimus_koulutuksen_kesto] f

	LEFT JOIN VipunenTK.dbo.d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet d1
	on d1.id=f.oppisryh_id
 
	LEFT JOIN VipunenTK.dbo.d_sukupuoli d2
	on d2.id=f.sukupuoli_id

	LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio1 d3
	on d3.id=f.aidinkieli_versio1_id

	LEFT JOIN VipunenTK.dbo.d_ika d4
	on d4.id=f.ika_id

	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d5
	on d5.id=f.opetushallinnon_koulutusala_id

		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d6
	on d6.id=f.opetushallinnon_koulutusaste_id

	LEFT JOIN VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d7
	on d7.id=f.ammatillisen_koulutuksen_koulutuslaji_id

	LEFT JOIN VipunenTK.dbo.d_alueluokitus d8
	on d8.id=f.koulutuksen_sijaintimaakunta_id

		LEFT JOIN VipunenTK.dbo.d_koulutuksen_kesto d9
	on d9.id=f.koulutuksen_arvioitu_kesto_id

	LEFT JOIN VipunenTK.dbo.d_koulutuksen_kesto d10
	on d10.id=f.koulutuksen_toteutunut_kesto_id

	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d11
	on d11.id=f.koulutusala_taso_1_id

	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d12
	on d12.id=f.koulutusaste_taso_2_id














GO

USE [ANTERO]
