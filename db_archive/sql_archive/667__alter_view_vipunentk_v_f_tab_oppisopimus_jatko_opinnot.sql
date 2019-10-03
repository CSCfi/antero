USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_oppisopimus_jatko_opinnot]    Script Date: 13.7.2017 11:32:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER view [dbo].[v_f_tab_oppisopimus_jatko_opinnot] as


SELECT [Tilastovuosi] = f.tilastovuosi
      ,[Oppisopimus_osallistuneet_ja_tutkinnon_suorittaneet] = d1.oppis_osallis_ja_tutk_suor
      ,[Sukupuoli] = d2.sukupuoli
      ,[Aidinkieli versio1] = d3.aidinkieli_versio1
	  ,[Ika] = d4.ika
	  ,[Opetushallinnon koulutusala] = d5.koulutusala2002
	  ,[Ammatillisen koulutuksen koulutuslaji] = d6.ammatillisen_koulutuksen_koulutuslaji
	  ,[Koulutuksen sijaintimaakunta] = d7.maakunta
	  ,[Jatko opintojen koulutusaste] = d8.koulutusaste2002
      ,[Opiskelijat]
	  ,[Jatko opiskelu] = d9.jatko_opiskelu
--ruotsi
	  ,[Statistikår] = f.tilastovuosi
      ,[Grupp] = d1.oppis_osallis_ja_tutk_suor_SV
      ,[Kön] = d2.sukupuoli_SV
      ,[Modersmål] = d3.aidinkieli_versio1_SV
	  ,[Åldersgrupp] = d4.ika_SV
	  ,[Utbildningsområde] = d5.koulutusala2002_SV
	  ,[Typ av examen] = d6.ammatillisen_koulutuksen_koulutuslaji_SV
	  ,[Utb.anordnarens landskap] = d7.maakunta_SV
	  ,[Utb.nivå (fortsatta studier)] = d8.koulutusaste2002_SV
	  ,[Fortsatta studier] = d9.jatko_opiskelu_SV
--englanti	 	  
	  ,[Statistical year] = f.tilastovuosi
      ,[Group] = d1.oppis_osallis_ja_tutk_suor_EN
      ,[Gender] = d2.sukupuoli_EN
      ,[Mother tongue] = d3.aidinkieli_versio1_EN
	  ,[Age group] = d4.ika_EN
	  ,[Field of education] = d5.koulutusala2002_EN
	  ,[Qualification type] = d6.ammatillisen_koulutuksen_koulutuslaji_EN
	  ,[Region of the education provider] = d7.maakunta_EN
	  ,[Level of ed. (of further education)] = d8.koulutusaste2002_EN
	  ,[Further education] = d9.jatko_opiskelu_en
 
	  --jarjestyskentät
	  ,[Oppisryh jarjestys]= d1.jarjestys
	  ,[Sukupuoli jarjestys] = d2.jarjestys
	  ,[Aidinkieli versio1 jarjestys] = d3.jarjestys
	  ,[Ika jarjestys] = d4.jarjestys_ika
	  ,[Opetushallinnon koulutusala jarjestys] = d5.jarjestys_koulutusala2002
	  ,[Ammatillisen koulutuksen koulutuslaji jarjestys] = d6.jarjestys
	  ,[Koulutuksen sijaintimaakunta jarjestys] = d7.jarjestys_maakunta
	  ,[Jatko opintojen jarjestys] = d8.jarjestys_koulutusaste2002
	  ,[jatko opinto jarjestys] = d9.jarjestys
	 

      


FROM [VipunenTK].[dbo].[f_3_2_Oppisopimus_jatko_opinnot] f

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

	LEFT JOIN VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d6
	on d6.id=f.ammatillisen_koulutuksen_koulutuslaji_id

	LEFT JOIN VipunenTK.dbo.d_alueluokitus d7
	on d7.id=f.koulutuksen_sijaintimaakunta_id
 
 
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d8
	on d8.id=f.jatko_opintojen_koulutusaste_id

	LEFT JOIN VipunenTK.dbo.d_jatko_opiskelu d9
	on d9.id=f.jatko_opiskelu_id





GO

USE [ANTERO]

