USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_4]    Script Date: 5.2.2020 12:21:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




















ALTER view [dbo].[v_f_tab_opettajat_7_4] as

/* Vuoden 2016 aineluokitus muokattu yhteneväksi sa-näkymässä / jsyrjala 5.2.2020
Select
      [Tilastovuosi] = f.tilastointivuosi
      ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
      --,[Vakinainen työsuhde] = case f.tyosuhde_vakinainen when '1' then 'Vakinainen työsuhde' when '0' then 'Ei vakinainen työsuhde' end
      --,[Määräaikainen työsuhde] = case f.tyosuhde_maara_aikainen when '1' then 'Määräaikainen työsuhde' when '0' then 'Ei määräaikainen työsuhde' end
      --,[Viransijainen/toimensijainen] = case f.tyosuhde_viransijainen when '1' then 'Viransijainen/toimensijainen työsuhde' when '0' then 'Ei viransijainen/toimensijainen työsuhde' else 'Tuntematon' end
      --,[Virkavapaalla] = case f.tyosuhde_virkavapaa when '1' then 'Virkavapaalla' when '0' then 'Ei virkavapaalla' end
      --,[Osa-aikaeläkkeellä] = case f.tyosuhde_oa_elake when '1' then 'Osa-aikaeläkkeellä' when '0' then 'Ei osa-aikaeläkkeellä' end
      ,[Tehtävätyyppi] = d7.tehtavatyyppi
      ,[Pääasiallinen koulutusmuoto] = d8.koulutusaste
	  ,[Työsuhteen luonne] = d26.tyosuhteen_luonne
	  ,[Koko-/osa-aikainen] = d27.koko_osa_aikainen
	  ,[Osa-aikaisuuden syy] = d28.syy
      --,[Kelpoisuus esiopetuksen opettaja] = case f.kelp_esiopetus when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus luokanopettaja] = case f.kelp_luokanopettaja when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus aineenopettaja] = case f.kelp_aineenopettaja when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus aineenopettaja lukio] = case f.kelp_aineenopettaja_lukio when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus erityisluokan opettaja] = case f.kelp_erityisluokan_opettaja when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus osa-aikainen erityisopettaja] = case f.kelp_erityisopettaja_osa_aikainen when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus oppilaanohjaaja] = case f.kelp_oppilaanohjaaja when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus opinto-ohjaaja] = case f.kelp_opinto_ohjaaja when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      ,[Muu opettajankelpoisuus] = coalesce(d29.kylla_ei,'Tieto puuttuu')
      --,[Muodollinen kelpoisuus hoidettuun tehtävään] = case f.kelp_ei when '1' then 'Ei kelpoisuutta' when '0' then 'Kelpoisuus' end
      --,[Kelpoisuus kehitysvammaisille annettava erityisopetus] = case f.kelp_kehitysvammaiset when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' else 'Tuntematon' end
      ,[Eniten opettama aine] = d21.aine
      ,[Sukupuoli] = d22.sukupuoli
      ,[Oppilaitoksen maakunta] = (select top 1 maakunta from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
      ,[Oppilaitoksen kuntaryhmitys] = (select top 1 kuntaryhma from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
      ,[Ikäryhmä] = d23.ika5v
	  ,[Kelpoisuus] = d25.opettajankelpoisuus

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
      ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Uppgiftstyp] = d7.tehtavatyyppi_SV
      ,[Huvudsaklig utbildningsform] = d8.koulutusaste_SV
      ,[Lärarens huvudsakliga ämne] = d21.aine_SV
      ,[Kön] = d22.sukupuoli_SV
      ,[Läroanstaltens landskap] = (select top 1 maakunta_SV from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
      ,[Läroanstaltens kommungruppering] = (select top 1 kuntaryhma_SV from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
      ,[Åldersgrupp] = d23.ika5v_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
      ,[Language of the institution] = d1.opetuskieli_EN
      ,[Type of task] = d7.tehtavatyyppi_EN
      ,[Main educational structure] = d8.koulutusaste_EN
      ,[Primary taught subject] = d21.aine_EN
      ,[Gender] = d22.sukupuoli_EN
      ,[Region of the institution] = (select top 1 maakunta_EN from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
      ,[Municipality type of the institution] = (select top 1 kuntaryhma_EN from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
      ,[Age group] = d23.ika5v_EN

	  --koodit
	  ,[Koodit Oppil. maakunta] = (select top 1 maakunta_koodi from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
 
	  --järjestyskentät
	  ,[opetuskieli järjestys]= d1.jarjestys
	  ,[tehtävätyyppi järjestys] = d7.jarjestys
	  ,[koulutusmuoto järjestys]= d8.jarjestys
	  ,[aine järjestys] = d21.jarjestys
	  ,[sukupuoli järjestys] = d22.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = (select top 1 jarjestys_maakunta from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
	  ,[Oppilaitoksen kuntaryhmitys järjestys] = (select top 1 jarjestys_kuntaryhma from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
	  ,[ikä järjestys] = d23.jarjestys_ika5v
	  ,[kelpoisuus järjestys] = d25.jarjestys
	  ,[työsuhteen luonne järjestys] = d26.jarjestys

      
FROM [dbo].[f_Opettajat_lukiokoulutus_kelpoisuus_aine] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_lukiokoulutuksessa d7 on d7.id=f.tehtavatyyppi_lukiokoulutuksessa_id
LEFT JOIN dbo.d_opettajat_koulutusaste d8 on d8.id=f.paaasiallinen_koulutusmuoto_id
LEFT JOIN dbo.d_opettajat_aine d21 on d21.id=f.opettajan_eniten_opettama_aine_id
LEFT JOIN dbo.d_sukupuoli d22 on d22.id=f.sukupuoli_id
LEFT JOIN dbo.d_ika d23 on d23.id=f.ika_id
LEFT JOIN dbo.d_opettajankelpoisuus2 d25 on d25.id=f.kelp_id
LEFT JOIN dbo.d_opettajat_tyosuhteen_luonne d26 on d26.id=f.tyosuhteen_luonne_id
LEFT JOIN dbo.d_opettajat_koko_osa_aikainen d27 on d27.id=f.koko_osa_aikainen_id
LEFT JOIN dbo.d_opettajat_osa_aikaisuuden_syy d28 on d28.id=f.osa_aikaisuuden_syy_id
LEFT JOIN dbo.d_kylla_ei d29 on d29.kylla_ei_koodi=f.kelp_muu


--väliaikainen ratkaisu
where tilastointivuosi<>2016

UNION ALL
*/

Select
      [Tilastovuosi] = f.tilastointivuosi
      ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
      --,[Vakinainen työsuhde] = case f.tyosuhde_vakinainen when '1' then 'Vakinainen työsuhde' when '0' then 'Ei vakinainen työsuhde' end
      --,[Määräaikainen työsuhde] = case f.tyosuhde_maara_aikainen when '1' then 'Määräaikainen työsuhde' when '0' then 'Ei määräaikainen työsuhde' end
      --,[Viransijainen/toimensijainen] = case f.tyosuhde_viransijainen when '1' then 'Viransijainen/toimensijainen työsuhde' when '0' then 'Ei viransijainen/toimensijainen työsuhde' else 'Tuntematon' end
      --,[Virkavapaalla] = case f.tyosuhde_virkavapaa when '1' then 'Virkavapaalla' when '0' then 'Ei virkavapaalla' end
      --,[Osa-aikaeläkkeellä] = case f.tyosuhde_oa_elake when '1' then 'Osa-aikaeläkkeellä' when '0' then 'Ei osa-aikaeläkkeellä' end
      ,[Tehtävätyyppi] = d7.tehtavatyyppi
      ,[Pääasiallinen koulutusmuoto] = d8.koulutusaste
	  ,[Työsuhteen luonne] = d26.tyosuhteen_luonne
	  ,[Koko-/osa-aikainen] = d27.koko_osa_aikainen
	  ,[Osa-aikaisuuden syy] = d28.syy
      --,[Kelpoisuus esiopetuksen opettaja] = case f.kelp_esiopetus when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus luokanopettaja] = case f.kelp_luokanopettaja when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus aineenopettaja] = case f.kelp_aineenopettaja when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus aineenopettaja lukio] = case f.kelp_aineenopettaja_lukio when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus erityisluokan opettaja] = case f.kelp_erityisluokan_opettaja when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus osa-aikainen erityisopettaja] = case f.kelp_erityisopettaja_osa_aikainen when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus oppilaanohjaaja] = case f.kelp_oppilaanohjaaja when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus opinto-ohjaaja] = case f.kelp_opinto_ohjaaja when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Kelpoisuus muu] = case f.kelp_muu when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' end
      --,[Muodollinen kelpoisuus hoidettuun tehtävään] = case f.kelp_ei when '1' then 'Ei kelpoisuutta' when '0' then 'Kelpoisuus' end
      --,[Kelpoisuus kehitysvammaisille annettava erityisopetus] = case f.kelp_kehitysvammaiset when '1' then 'Kelpoisuus' when '0' then 'Ei kelpoisuutta' else 'Tuntematon' end
	  ,[Muu opettajankelpoisuus] = d29.kylla_ei
      ,[Eniten opettama aine] = d21.aine
      ,[Sukupuoli] = d22.sukupuoli
      ,[Oppilaitoksen maakunta] = (select top 1 maakunta from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
      ,[Oppilaitoksen kuntaryhmitys] = (select top 1 kuntaryhma from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
      ,[Ikäryhmä] = d23.ika5v
	  ,[Kelpoisuus] = d25.opettajankelpoisuus

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
      ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Uppgiftstyp] = d7.tehtavatyyppi_SV
      ,[Huvudsaklig utbildningsform] = d8.koulutusaste_SV
      ,[Lärarens huvudsakliga ämne] = d21.aine_SV
      ,[Kön] = d22.sukupuoli_SV
      ,[Läroanstaltens landskap] = (select top 1 maakunta_SV from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
      ,[Läroanstaltens kommungruppering] = (select top 1 kuntaryhma_SV from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
      ,[Åldersgrupp] = d23.ika5v_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
      ,[Language of the institution] = d1.opetuskieli_EN
      ,[Type of task] = d7.tehtavatyyppi_EN
      ,[Main educational structure] = d8.koulutusaste_EN
      ,[Primary taught subject] = d21.aine_EN
      ,[Gender] = d22.sukupuoli_EN
      ,[Region of the institution] = (select top 1 maakunta_EN from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
      ,[Municipality type of the institution] = (select top 1 kuntaryhma_EN from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
      ,[Age group] = d23.ika5v_EN

	  --koodit
	  ,[Koodit Oppil. maakunta] = (select top 1 maakunta_koodi from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
 
	  --järjestyskentät
	  ,[opetuskieli järjestys]= d1.jarjestys
	  ,[tehtävätyyppi järjestys] = d7.jarjestys
	  ,[koulutusmuoto järjestys]= d8.jarjestys
	  ,[aine järjestys] = d21.jarjestys
	  ,[sukupuoli järjestys] = d22.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = (select top 1 jarjestys_maakunta from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
	  ,[Oppilaitoksen kuntaryhmitys järjestys] = (select top 1 jarjestys_kuntaryhma from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
	  ,[ikä järjestys] = d23.jarjestys_ika5v
	  ,[kelpoisuus järjestys] = d25.jarjestys
	  ,[työsuhteen luonne järjestys] = d26.jarjestys

      
FROM [dbo].[f_Opettajat_lukiokoulutus_kelpoisuus_aine] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_lukiokoulutuksessa d7 on d7.id=f.tehtavatyyppi_lukiokoulutuksessa_id
LEFT JOIN dbo.d_opettajat_koulutusaste d8 on d8.id=f.paaasiallinen_koulutusmuoto_id
LEFT JOIN dbo.d_opettajat_aine d21 on d21.id=f.opettajan_eniten_opettama_aine_id
--LEFT JOIN dbo.d_opettajat_aine_2016_lukio d21 on d21.aine_koodi=f.opettajan_eniten_opettama_aine_koodi
LEFT JOIN dbo.d_sukupuoli d22 on d22.id=f.sukupuoli_id
LEFT JOIN dbo.d_ika d23 on d23.id=f.ika_id
LEFT JOIN dbo.d_opettajankelpoisuus2 d25 on d25.id=f.kelp_id
LEFT JOIN dbo.d_opettajat_tyosuhteen_luonne d26 on d26.id=f.tyosuhteen_luonne_id
LEFT JOIN dbo.d_opettajat_koko_osa_aikainen d27 on d27.id=f.koko_osa_aikainen_id
LEFT JOIN dbo.d_opettajat_osa_aikaisuuden_syy d28 on d28.id=f.osa_aikaisuuden_syy_id
LEFT JOIN dbo.d_kylla_ei d29 on d29.kylla_ei_koodi=f.kelp_muu
--where tilastointivuosi=2016
















GO


USE [ANTERO]