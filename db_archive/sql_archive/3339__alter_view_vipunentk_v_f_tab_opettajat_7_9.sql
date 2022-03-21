USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_9]    Script Date: 6.2.2020 12:47:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






















ALTER view [dbo].[v_f_tab_opettajat_7_9] as

Select
      [Tilastovuosi] = f.tilastointivuosi
      ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
      ,[Tehtävätyyppi vapaassa sivistystyössä] = d2.tehtavatyyppi
      --,[Täydennyskoulutustiedot toisen oppilaitoksen yhteydessä] = d8.kylla_ei
      --,[Täydennyskoulutustietoja ei saatu] = d9.kylla_ei
      --,[Täydennyskoulutus ei osallistunut] = d10.kylla_ei
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
	  ,[Kouluttautunut mentoriksi] = d21.kylla_ei
	  ,[Toiminut mentorina] = d22.kylla_ei
	  ,[Ollut mentoroitavana] = d23.kylla_ei
	  ,[Kouluttautunut työnohjaajaksi] = d24.kylla_ei
	  ,[Toiminut työnohjaajana] = d25.kylla_ei
	  ,[Ollut työnohjauksessa] = d26.kylla_ei
	  ,[Opettajan tunnit] = f.opettajan_tunnit
      ,[Sukupuoli] = d3.sukupuoli
      ,[Oppilaitoksen maakunta] = d5.maakunta
	  ,[Ikäryhmä] = d4.ika5v
	  ,[Täydennyskoulutus tai asiantuntijavaihto] = case when f.taydennyskoulutus_ei=4 or f.asiantuntijavaihto_oma_aika>0 or f.asiantuntijavaihto_tyoaika>0 then 1 else 0 end
      

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
	  

      
FROM [dbo].[f_Opettajat_vapaa_sivistystyo_osallistuminen_taydennyskoulutukseen] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa d2 on d2.id=f.tehtavatyyppi_vapaassa_sivistystyossa_id
LEFT JOIN dbo.d_sukupuoli d3 on d3.id=f.sukupuoli_id
LEFT JOIN dbo.d_ika d4 on d4.id=f.ika_id
LEFT JOIN d_alueluokitus d5 on d5.id=f.oppilaitoksen_maakunta_id
LEFT JOIN VipunenTK..d_kylla_ei d8 on d8.id=f.taydennyskoulutus_osallistuminen
LEFT JOIN VipunenTK..d_kylla_ei d9 on d9.id=f.taydennyskoulutus_ei_tietoa
LEFT JOIN VipunenTK..d_kylla_ei d10 on d10.id=f.taydennyskoulutus_ei
LEFT JOIN VipunenTK..d_kylla_ei d11 on d11.id=f.koulutussuunnitelma
LEFT JOIN dbo.d_kylla_ei d21 on d21.kylla_ei_koodi=f.kouluttautunut_mentoriksi
LEFT JOIN dbo.d_kylla_ei d22 on d22.kylla_ei_koodi=f.toiminut_mentorina
LEFT JOIN dbo.d_kylla_ei d23 on d23.kylla_ei_koodi=f.ollut_mentoroitavana
LEFT JOIN dbo.d_kylla_ei d24 on d24.kylla_ei_koodi=f.kouluttautunut_tyonohjaajaksi
LEFT JOIN dbo.d_kylla_ei d25 on d25.kylla_ei_koodi=f.toiminut_tyonohjaajana
LEFT JOIN dbo.d_kylla_ei d26 on d26.kylla_ei_koodi=f.ollut_tyonohjauksessa


























GO


USE [ANTERO]