USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_3]    Script Date: 30.1.2020 17:31:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















ALTER view [dbo].[v_f_tab_opettajat_7_3] as

Select
      [Tilastovuosi] = f.tilastointivuosi
      ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
      ,[Tehtavätyyppi perusopetuksessa] = d2.tehtavatyyppi
      --,[Täydennyskoulutustiedot] = case f.taydennyskoulutus_osallistuminen when '1' then 'Toisen oppilaitoksen yhteydessä' when '0' then 'Ei toisen oppilaitoksen yhteydessä' else '' end
      --,[Täydennyskoulutukseen osallistuminen] = case f.taydennyskoulutus_ei_tietoa when '1' then 'Ei tietoa' when '0' then 'Tieto saatu' else '' end
      --,[Täydennyskoulutus tilastovuonna] = case f.taydennyskoulutus_ei when '1' then 'Ei osallistunut' when '0' then 'Osallistui' else '' end
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
      ,[Koulutus- ja kehittämissuunnitelma] = d27.kylla_ei--case f.koulutussuunnitelma when '1' then 'On sovittu' when '0' then 'Ei ole sovittu' else '' end
	  ,[Kouluttautunut mentoriksi] = d21.kylla_ei
	  ,[Toiminut mentorina] = d22.kylla_ei
	  ,[Ollut mentoroitavana] = d23.kylla_ei
	  ,[Kouluttautunut työnohjaajaksi] = d24.kylla_ei
	  ,[Toiminut työnohjaajana] = d25.kylla_ei
	  ,[Ollut työnohjauksessa] = d26.kylla_ei
	  ,[Opettajan tunnit] = f.opettajan_tunnit
      ,[Sukupuoli] = d3.sukupuoli
      ,[Oppilaitoksen maakunta] = (select top 1 maakunta from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
	  ,[Ikäryhmä] = d4.ika5v
	  ,[Täydennyskoulutus tai asiantuntijavaihto] = case when f.taydennyskoulutus_ei=0 or f.asiantuntijavaihto_oma_aika>0 or f.asiantuntijavaihto_tyoaika>0 then 1 else 0 end

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
      ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Uppgiftstyp] = d2.tehtavatyyppi_SV
      ,[Kön] = d3.sukupuoli_SV
      ,[Läroanstaltens landskap] = (select top 1 maakunta_SV from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
	  ,[Åldersgrupp] = d4.ika5v_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
      ,[Language of the institution] = d1.opetuskieli_EN
      ,[Type of task] = d2.tehtavatyyppi_EN
      ,[Gender] = d3.sukupuoli_EN
      ,[Region of the institution] = (select top 1 maakunta_EN from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
	  ,[Age group] = d4.ika5v_EN
      
	  --koodit
	  ,[Koodit Oppil. maakunta] = (select top 1 maakunta_koodi from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
 
	  --järjestyskentät
	  ,[opetuskieli järjestys]= d1.jarjestys
	  ,[Tehtavätyyppi perusopetuksessa järjestys] = d2.jarjestys
	  ,[Sukupuoli järjestys] = d3.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = (select top 1 jarjestys_maakunta from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
	  ,[Ikä järjestys] = d4.jarjestys_ika5v
	  

      
FROM [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_perusopetuksessa d2 on d2.id=f.tehtavatyyppi_perusopetuksessa_id
LEFT JOIN dbo.d_sukupuoli d3 on d3.id=f.sukupuoli_id
LEFT JOIN dbo.d_ika d4 on d4.id=f.ika_id
LEFT JOIN dbo.d_kylla_ei d21 on d21.kylla_ei_koodi=f.kouluttautunut_mentoriksi
LEFT JOIN dbo.d_kylla_ei d22 on d22.kylla_ei_koodi=f.toiminut_mentorina
LEFT JOIN dbo.d_kylla_ei d23 on d23.kylla_ei_koodi=f.ollut_mentoroitavana
LEFT JOIN dbo.d_kylla_ei d24 on d24.kylla_ei_koodi=f.kouluttautunut_tyonohjaajaksi
LEFT JOIN dbo.d_kylla_ei d25 on d25.kylla_ei_koodi=f.toiminut_tyonohjaajana
LEFT JOIN dbo.d_kylla_ei d26 on d26.kylla_ei_koodi=f.ollut_tyonohjauksessa
LEFT JOIN dbo.d_kylla_ei d27 on d27.kylla_ei_koodi=f.koulutussuunnitelma






















GO


USE [ANTERO]