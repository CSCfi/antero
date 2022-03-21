USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_8]    Script Date: 13.2.2020 15:38:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER view [dbo].[v_f_tab_opettajat_7_8] as

Select
      [Tilastovuosi] = f.tilastointivuosi
	  ,[Oppilaitoksen kieli] = d1.opetuskieli
      ,[Tehtävätyyppi ammatillisessa koulutuksessa] = d2.tehtavatyyppi
      ,[Pääasiallinen koulutusaste] = d5.koulutusaste
      ,[Pääasiallinen koulutusala] = case 
										when tilastointivuosi >= 2019
										then (case d4.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Yhteiset tutkinnon osat' else d4.iscfibroad2013 end)
										else (case d4.koulutusala2002 when 'Yleissivistävä koulutus' then 'Ammattitaitoa täydentävät tutkinnon osat (yhteiset opinnot)' else d4.koulutusala2002 end)											
									 end
      --,[Täydennyskoulutustiedot toisen oppilaitoksen yhteydessä] = d8.kylla_ei
      --,[Täydennyskoulutuksesta ei tietoa] = d9.kylla_ei
      --,[Ei ole osallistunut täydennyskoulutukseen] = d10.kylla_ei
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
      ,[Työelämäjakso työpäivät] = f.tyoelamajakso_lkm
      --,[Ei ole osallistunut työelämäjaksolle] = d12.kylla_ei
      --,[Työelämäjaksolle osallistumisesta ei tietoa] = d13.kylla_ei
	  ,[Kouluttautunut mentoriksi] = d21.kylla_ei
	  ,[Toiminut mentorina] = d22.kylla_ei
	  ,[Ollut mentoroitavana] = d23.kylla_ei
	  ,[Kouluttautunut työnohjaajaksi] = d24.kylla_ei
	  ,[Toiminut työnohjaajana] = d25.kylla_ei
	  ,[Ollut työnohjauksessa] = d26.kylla_ei
	  ,[Osallistunut työelämäjaksolle] = d27.kylla_ei
	  ,[Työelämäjakso: opiskelijan ohjaamista työelämäjaksolla] = d28.kylla_ei
	  ,[Työelämäjakso: työpaikkaohjaajan/-kouluttajan ohjaamista] = d29.kylla_ei
	  ,[Työelämäjakso: opintojen sisällön ohjaamista] = d30.kylla_ei
	  ,[Työelämäjakso: oman osaamisen kasvattamista] = d32.kylla_ei
	  ,[Työpaikalla tapahtuva työ] = f.tyopaikoilla_tapahtuva_tyo
	  ,[Työpaikoilla tapahtuva työ: opiskelijan ohjaamista] = d33.kylla_ei
	  ,[Työpaikoilla tapahtuva työ: työpaikkaohjaajan/-kouluttajan ohjaamista] = d34.kylla_ei
	  ,[Työpaikoilla tapahtuva työ: opintojen sisällön ohjaamista] = d35.kylla_ei
	  ,[Työpaikoilla tapahtuva työ: oman osaamisen kasvattamista] = d36.kylla_ei

      ,[Sukupuoli] = d6.sukupuoli
      ,[Oppilaitoksen maakunta] = d31.maakunta
      ,[Ikäryhmä] = d7.ika5v
      ,[Täydennyskoulutus tai asiantuntijavaihto] = case when f.taydennyskoulutus_ei=4 or f.asiantuntijavaihto_oma_aika>0 or f.asiantuntijavaihto_tyoaika>0 then 1 else 0 end
	  ,[Viikkotunnit, opetus] = f.opettajan_tunnit
	  ,[Viikkotunnit, henkilökohtaistaminen] = f.hlokohtaistamisen_tunnit
	  ,[Viikkotunnit, suunnittelu ja ohjaus] = f.suunnittelu_ohjaus_tunnit
	  ,[Viikkotunnit, hallinnolliset tehtävät] = f.hallinnolliset_tunnit

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Uppgiftstyp] = d2.tehtavatyyppi_SV
      ,[Huvudsaklig utbildningsform] = d5.koulutusaste_SV
      ,[Lärarens huvudsakliga utb.område] = case 
												when tilastointivuosi >= 2019
												then (case d4.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Gemensammma examensdelar' else d4.iscfibroad2013_SV end)
												else (case d4.koulutusala2002 when 'Yleissivistävä koulutus' then 'Examensdelar som kompletterar yrkeskompetensen (gemensammma studier)' else d4.koulutusala2002_SV end)
											end
      ,[Kön] = d6.sukupuoli_SV
      ,[Läroanstaltens landskap] = d31.maakunta_SV
      ,[Åldersgrupp] = d7.ika5v_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
	  ,[Language of the institution] = d1.opetuskieli_EN
      ,[Type of task] = d2.tehtavatyyppi_EN
      ,[Teacher's primary level] = d5.koulutusaste_EN
      ,[Teacher's primary field] = case 
										when tilastointivuosi >= 2019
										then (case d4.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Core subjects' else d4.iscfibroad2013_EN end)
										else (case d4.koulutusala2002 when 'Yleissivistävä koulutus' then 'Core subjects' else d4.koulutusala2002_EN end)
									end
      ,[Gender] = d6.sukupuoli_EN
      ,[Region of the institution] = d31.maakunta_EN
      ,[Age group] = d7.ika5v_EN

	  --koodit
	  ,[Koodit Oppil. maakunta] = d31.maakunta_koodi

	  --järjestyskentät
	  ,[opetuskieli järjestys]= d1.jarjestys
	  ,[Tehtävätyyppi järjestys] = d2.jarjestys
	  ,[Koulutusaste järjestys] = d5.jarjestys
	  ,[Koulutusala järjestys] = coalesce(nullif(d4.jarjestys_iscfibroad2013, '998'), '99'+d4.jarjestys_koulutusala2002)
	  ,[Sukupuoli järjestys] = d6.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = d31.jarjestys_maakunta
	  ,[Ikä järjestys] = d7.jarjestys_ika5v
	  

      
FROM [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa d2 on d2.id=f.tehtävätyyppi_amm_koulutuksessa_id
LEFT JOIN dbo.d_koulutusluokitus d4 on d4.id=f.pääasiallinen_koulutusala_id
LEFT JOIN dbo.d_opettajat_koulutusaste_amm d5 on d5.id=pääasiallinen_koulutusaste_id
LEFT JOIN dbo.d_sukupuoli d6 on d6.id=f.sukupuoli_id
LEFT JOIN dbo.d_ika d7 on d7.id=f.ika_id
LEFT JOIN dbo.d_kylla_ei d8 on d8.id=f.taydennyskoulutus_osallistuminen
LEFT JOIN dbo.d_kylla_ei d9 on d9.id=f.taydennyskoulutus_ei_tietoa
LEFT JOIN dbo.d_kylla_ei d10 on d10.id=f.taydennyskoulutus_ei
LEFT JOIN dbo.d_kylla_ei d11 on d11.id=f.koulutussuunnitelma
LEFT JOIN dbo.d_kylla_ei d12 on d12.id=f.tyoelamajakso
LEFT JOIN dbo.d_kylla_ei d13 on d13.id=f.tyoelamajakso_ei_tietoa
LEFT JOIN dbo.d_alueluokitus d31 on d31.id=f.oppilaitoksen_maakunta_id
LEFT JOIN dbo.d_kylla_ei d21 on d21.kylla_ei_koodi=f.kouluttautunut_mentoriksi
LEFT JOIN dbo.d_kylla_ei d22 on d22.kylla_ei_koodi=f.toiminut_mentorina
LEFT JOIN dbo.d_kylla_ei d23 on d23.kylla_ei_koodi=f.ollut_mentoroitavana
LEFT JOIN dbo.d_kylla_ei d24 on d24.kylla_ei_koodi=f.kouluttautunut_tyonohjaajaksi
LEFT JOIN dbo.d_kylla_ei d25 on d25.kylla_ei_koodi=f.toiminut_tyonohjaajana
LEFT JOIN dbo.d_kylla_ei d26 on d26.kylla_ei_koodi=f.ollut_tyonohjauksessa
LEFT JOIN dbo.d_kylla_ei d27 on d27.kylla_ei_koodi=f.osallistunut_tyoelamajaksolle
LEFT JOIN dbo.d_kylla_ei d28 on d28.kylla_ei_koodi=f.opiskelijan_ohjaamista
LEFT JOIN dbo.d_kylla_ei d29 on d29.kylla_ei_koodi=f.tyopaikkaohjaajan_kouluttajan_ohjaamista
LEFT JOIN dbo.d_kylla_ei d30 on d30.kylla_ei_koodi=f.opintojen_sisallon_ohjaamista
LEFT JOIN dbo.d_kylla_ei d32 on d32.kylla_ei_koodi=f.oman_osaamisen_kasvattamista
LEFT JOIN dbo.d_kylla_ei d33 on d33.kylla_ei_koodi=f.opiskelijan_ohjaamista_tp
LEFT JOIN dbo.d_kylla_ei d34 on d34.kylla_ei_koodi=f.tyopaikkaohjaajan_kouluttajan_ohjaamista_tp
LEFT JOIN dbo.d_kylla_ei d35 on d35.kylla_ei_koodi=f.opintojen_sisallon_ohjaamista_tp
LEFT JOIN dbo.d_kylla_ei d36 on d36.kylla_ei_koodi=f.oman_osaamisen_kasvattamista_tp






























GO


USE [ANTERO]