USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_oppisopimus_paaasiallinen_toiminta]    Script Date: 7.8.2018 15:40:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER view [dbo].[v_f_tab_oppisopimus_paaasiallinen_toiminta] as


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
	  ,[Paaasiallinen toiminta_versio3] = d9.paaasiallinen_toiminta
	  ,[Ammattiasema] = d10.ammattiasema
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
	  ,[Paaasiallinen toiminta versio3 jarjestys] = d9.jarjestys
	  ,[Ammattiasema jarjestys] = d10.jarjestys
	  

      


FROM [VipunenTK].[dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] f

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

		LEFT JOIN VipunenTK.dbo.d_paaasiallinen_toiminta d9
	on d9.id=f.paaasiallinen_toiminta_versio3_id

	LEFT JOIN VipunenTK.dbo.d_ammattiasema d10
	on d10.id=f.ammattiasema_id

	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d11
	on d11.id=f.koulutusala_taso_1_id

	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d12
	on d11.id=f.koulutusaste_taso_2_id





GO

USE[ANTERO]

