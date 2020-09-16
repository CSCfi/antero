USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_17]    Script Date: 25.2.2020 19:29:15 ******/
DROP VIEW IF EXISTS [dbo].[v_f_tab_opettajat_7_17]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_17]    Script Date: 25.2.2020 19:29:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[v_f_tab_opettajat_7_17] as 

Select
      [Tilastovuosi] = f.tilastointivuosi
      ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
      ,[Tehtävätyyppi] = d2.tehtavatyyppi
	  ,[Täydennyskoulutus tai asiantuntijavaihto] = case when d8.kylla_ei = 'Kyllä' or f.asiantuntijavaihto_oma_aika>0 or f.asiantuntijavaihto_tyoaika>0 then 1 else 0 end
	  ,[Osallistuminen täydennyskoulutukseen] = d8.kylla_ei
	  ,[Osa-alue, jolla tarvitsee eniten täydennyskoulutusta] = d9.osaalue
      ,[Osallistuminen tutkintotavoitteeseen koulutukseen työajalla] = f.taydennyskoulutus_tyoaika
      ,[Osallistuminen tutkintotavoitteeseen omalla ajalla] = f.taydennyskoulutus_oma_aika 
      ,[Osallistuminen kelpoisuuden tai pätevyyden tuottavaan koulutukseen työajalla] = f.taydennyskoulutus_kelp_tyoaika 
      ,[Osallistuminen kelpoisuuden tai pätevyyden tuottavaan koulutukseen omalla ajalla] = f.taydennyskoulutus_kelp_oma_aika 
      ,[Osallistuminen työantajan järjestämään henkilöstökoulutukseen työajalla] = f.taydennyskoulutus_tantaja_tyoaika 
      ,[Osallistuminen työantajan järjestämään henkilöstökoulutukseen omalla ajalla] = f.taydennyskoulutus_tantaja_oma_aika
      ,[Osallistuminen muuhun toimintaan työajalla] = f.taydennyskoulutus_muu_tyoaika 
      ,[Osallistuminen muuhun toimintaan omalla ajalla] = f.taydennyskoulutus_muu_oma_aika 
	  ,[Osallistuminen kotimaiseen tai kansainväliseen asiantuntijavaihtoon työajalla] = f.asiantuntijavaihto_tyoaika
	  ,[Osallistuminen kotimaiseen tai kansainväliseen asiantuntijavaihtoon omalla ajalla] = f.asiantuntijavaihto_oma_aika
      ,[Koulutus- ja kehittämissuunnitelma] = d11.kylla_ei
      ,[Sukupuoli] = d3.sukupuoli
      ,[Oppilaitoksen maakunta] = d5.maakunta
	  ,[Ikäryhmä] = d4.ika5v 

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
      ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Uppgiftstyp] = d2.tehtavatyyppi_SV
      ,[Kön] = d3.sukupuoli_SV
      ,[Läroanstaltens landskap] = d5.maakunta_SV
	  ,[Åldersgrupp] = d4.ika5v_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
      ,[Language of the institution] = d1.opetuskieli_EN
      ,[Type of task] = d2.tehtavatyyppi_EN
      ,[Gender] = d3.sukupuoli_EN
      ,[Region of the institution] = d5.maakunta_EN
	  ,[Age group] = d4.ika5v_EN

	  --koodit
	  ,[Koodit Oppil. maakunta] = d5.maakunta_koodi
 
	  --järjestyskentät
	  ,[opetuskieli järjestys]= d1.jarjestys
	  ,[Tehtavätyyppi järjestys] = d2.jarjestys
	  ,[Sukupuoli järjestys] = d3.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = d5.jarjestys_maakunta
	  ,[Ikä järjestys] = d4.jarjestys_ika5v
	  ,[Osa-alue järjestys] = d9.jarjestys

      
FROM [dbo].[f_Opettajat_taiteen_perusopetus_osallistuminen_taydennyskoulutukseen] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa d2 on d2.id=f.tehtavatyyppi_id
LEFT JOIN dbo.d_sukupuoli d3 on d3.id=f.sukupuoli_id
LEFT JOIN dbo.d_ika d4 on d4.id=f.ika_id
LEFT JOIN dbo.d_alueluokitus d5 on d5.id=f.oppilaitoksen_maakunta_id
LEFT JOIN dbo.d_kylla_ei d8 on d8.id=f.taydennyskoulutus_osallistuminen
LEFT JOIN dbo.d_opettajat_taydennyskoulutus_tpo d9 on d9.id=f.taydennyskoulutus_osaalue
LEFT JOIN dbo.d_kylla_ei d11 on d11.id=f.koulutussuunnitelma



GO

USE [ANTERO]