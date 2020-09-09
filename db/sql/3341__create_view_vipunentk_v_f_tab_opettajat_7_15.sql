USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_15]    Script Date: 26.2.2020 21:04:08 ******/
DROP VIEW IF EXISTS [dbo].[v_f_tab_opettajat_7_15]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_15]    Script Date: 26.2.2020 21:04:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE view [dbo].[v_f_tab_opettajat_7_15] as

Select
      [Tilastovuosi] = f.tilastointivuosi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli 
	  ,[Kelpoisuus kunnossa] = d17.kylla_ei
      ,[Pääasiallinen koulutusmuoto] = d25.koulutusaste
      ,[Opettajan eniten opettama opintotaso] = d23.opintotaso
	  ,[Opettajan eniten opettama taiteenala] = d24.ala
	  ,[Työsuhteen luonne] = d26.tyosuhteen_luonne
	  ,[Koko-/osa-aikainen] = d36.koko_osa_aikainen
	  ,[Osa-aikaisuuden syy] = d37.syy
	  ,[Pedagogiset opinnot puuttuvat] = d38.kylla_ei
	  ,[Tutkinto puuttuu] = d39.kylla_ei
      ,[Oppilaitoksen maakunta] = d31.maakunta
	  ,[Oppilaitoksen sijaintikunnan kuntaryhmitys] = d2.kuntaryhma
	  ,[Tehtävätyyppi] = d32.tehtavatyyppi
	  ,[Ikäryhmä] = d33.ika5v
	  ,[Sukupuoli] = d34.sukupuoli

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Huvudsaklig utbildningsform] = d25.koulutusaste_SV
      ,[Lärarens huvudsakliga studienivå] = d23.opintotaso_SV
	  ,[Lärarens huvudsakliga konstområde] = d24.ala_SV
      ,[Läroanstaltens landskap] = d31.maakunta_SV
	  ,[Läroanstaltens kommungruppering] = d2.kuntaryhma_SV
	  ,[Uppgiftstyp] = d32.tehtavatyyppi_SV
	  ,[Åldersgrupp] = d33.ika5v_SV
	  ,[Kön] = d34.sukupuoli_SV

	  --Englanti
      ,[Statistical year] = f.tilastointivuosi
	  ,[Language of the institution] = d1.opetuskieli_EN
      ,[Teacher's primary level of education] = d25.koulutusaste_EN
      ,[Teacher's primary level of studies] = d23.opintotaso_EN
	  ,[Teacher's primary field of arts] = d24.ala_EN
      ,[Region of institution] = d31.maakunta_EN
	  ,[Municipality type of institution] = d2.kuntaryhma_EN
	  ,[Type of task] = d32.tehtavatyyppi_EN
	  ,[Age group] = d33.ika5v_EN
	  ,[Gender] = d34.sukupuoli_EN

	  --koodit
	   ,[Koodit Oppil. maakunta] = d31.maakunta_koodi
 
	  --järjestyskentät
	  ,[Opetuskieli järjestys]= d1.jarjestys
	  ,[Opettajan aste järjestys] = d25.jarjestys
	  ,[Opettajan taso järjestys] = d23.jarjestys
	  ,[Opettajan ala järjestys] = d24.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = d31.jarjestys_maakunta
	  ,[Oppilaitoksen kuntaryhmä järjestys] = d2.jarjestys
	  ,[Tehtävätyyppi järjestys] = d32.jarjestys
	  ,[Ikä järjestys] = d33.jarjestys_ika5v
	  ,[Sukupuoli järjestys] = d34.jarjestys
	  ,[työsuhteen luonne järjestys] = d26.jarjestys

      
FROM [dbo].[f_Opettajat_taiteen_perusopetus_kelpoisuus_aine] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_kuntaryhma d2 on d2.id=f.oppilaitoksen_kuntaryhmitys
LEFT JOIN dbo.d_kylla_ei d17 on d17.id=f.kelpoisuus_kunnossa_id
LEFT JOIN dbo.d_opettajat_opintotaso_tpo d23 on d23.id=f.paaasiallinen_taso_id
LEFT JOIN dbo.d_opettajat_ala_tpo d24 on d24.id=f.paaasiallinen_ala_id
LEFT JOIN dbo.d_opettajat_koulutusaste_tpo d25 on d25.id=f.paaasiallinen_aste_id
LEFT JOIN dbo.d_opettajat_tyosuhteen_luonne d26 on d26.id=f.tyosuhteen_luonne_id
LEFT JOIN dbo.d_alueluokitus d31 on d31.id=f.oppilaitoksen_maakunta_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa d32 on d32.id=f.tehtavatyyppi_id
LEFT JOIN dbo.d_ika d33 on d33.id=f.ika_id
LEFT JOIN dbo.d_sukupuoli d34 on d34.id=f.sukupuoli_id
LEFT JOIN dbo.d_opettajat_koko_osa_aikainen d36 on d36.id=f.koko_osa_aikainen_id
LEFT JOIN dbo.d_opettajat_osa_aikaisuuden_syy d37 on d37.id=f.osa_aikaisuuden_syy_id
LEFT JOIN dbo.d_kylla_ei d38 on d38.id=f.pedagogiset_opinnot_puuttuu_id
LEFT JOIN dbo.d_kylla_ei d39 on d39.id=f.tutkinto_puuttuu_id


GO

USE [ANTERO]