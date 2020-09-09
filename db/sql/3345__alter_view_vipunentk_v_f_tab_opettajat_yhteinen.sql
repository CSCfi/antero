USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_yhteinen]    Script Date: 5.3.2020 14:07:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO















ALTER view [dbo].[v_f_tab_opettajat_yhteinen] as



select
	   [Tilastovuosi] 
      ,[Oppilaitoksen opetuskieli] 
      ,[Sukupuoli] 
      ,[Oppilaitoksen maakunta] 
      ,[Ikäryhmä] 
	  ,[Kelpoisuus] 
	  ,[Koulutusaste]
	  ,[Koulutusmuoto] 
	  ,[Tehtävätyyppi] 
	  ,[Päätoiminen] = [Kokoaikainen]

	  --Ruotsi
	  ,[Statistikår]
      ,[Läroanstaltens undervisningsspråk] 
      ,[Kön] 
      ,[Läroanstaltens landskap] 
      ,[Åldersgrupp]
	  ,[Utbildningsnivå] 
	  ,[Utbildningsform]
	  ,[Typ av uppgift​]

	  --Englanti
	  ,[Statistical year] 
      ,[Language of the institution]
      ,[Gender]
      ,[Region of the institution] 
      ,[Age group] 
	  ,[Level of education] 
	  ,[Form of education]
	  ,[Type of task]

	  --koodit
	  ,[Koodit Oppil. maakunta] 
 
	  --järjestyskentät
	  ,[Opetuskieli järjestys]
	  ,[sukupuoli järjestys] 
	  ,[Oppilaitoksen maakunta järjestys] 
	  ,[ikä järjestys] 
	  ,[Koulutusaste järjestys] 
	  ,[Tehtävätyyppi järjestys] 
	  ,[Koulutusmuoto järjestys] = 
		case ff.Koulutusmuoto 
			when 'Esiopetus' then 1 
			when 'Perusopetus' then 2  
			when 'Lukiokoulutus' then 3
			when 'Ammatillinen peruskoulutus' then 4
			when 'Ammatti- ja erikoisammattitutkintoon valmistava koulutus' then 5
			when 'Vapaa sivistystyö' then 6
			when 'Taiteen perusopetus' then 7
			else 99
		end

from (

Select
      [Tilastovuosi] = f.tilastointivuosi
      ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
      ,[Sukupuoli] = d22.sukupuoli
      ,[Oppilaitoksen maakunta] = (select top 1 maakunta from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
    --,[Oppilaitoksen sijaintikunnan kuntaryhmitys] = (select top 1 kuntaryhma from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
      ,[Ikäryhmä] = d23.ika5v
	  ,[Kelpoisuus] = case d25.opettajankelpoisuus when 'Kelpoinen antamaan opetusta' then 'Kyllä' else 'Ei' end
	  ,[Koulutusaste] = 'Perusopetus'
	  ,[Koulutusmuoto] = case when d3.luokka_aste = 'esiopetus' then 'Esiopetus' else 'Perusopetus' end
	  ,[Tehtävätyyppi] = d4.tehtavatyyppi
	  ,[Kokoaikainen] = case d5.koko_osa_aikainen_koodi when 1 then 1 else 0 end

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
      ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Kön] = d22.sukupuoli_SV
      ,[Läroanstaltens landskap] = (select top 1 maakunta_SV from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
      ,[Åldersgrupp] = d23.ika5v_SV
	  ,[Utbildningsnivå] = 'Grundutbildning'
	  ,[Utbildningsform] = case when d3.luokka_aste = 'esiopetus' then 'Förskoleundervisning' else 'Grundläggande utbildning' end
	  ,[Typ av uppgift​] = d4.tehtavatyyppi_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
      ,[Language of the institution] = d1.opetuskieli_EN
      ,[Gender] = d22.sukupuoli_EN
      ,[Region of the institution] = (select top 1 maakunta_EN from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
      ,[Age group] = d23.ika5v_EN
	  ,[Level of education] = 'Basic education'
	  ,[Form of education] = case when d3.luokka_aste = 'esiopetus' then 'Pre-primary education' else 'Basic education' end
	  ,[Type of task] = d4.tehtavatyyppi_EN

	  --koodit
	  ,[Koodit Oppil. maakunta] = (select top 1 maakunta_koodi from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
 
	  --järjestyskentät
	  ,[Opetuskieli järjestys]= d1.jarjestys
	  ,[sukupuoli järjestys] = d22.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = (select top 1 jarjestys_maakunta from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
	  --,[Oppilaitoksen kuntaryhmitys järjestys] = (select top 1 jarjestys_kuntaryhma from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
	  ,[ikä järjestys] = d23.jarjestys_ika5v
	  ,[Koulutusaste järjestys] = 1
	  ,[Tehtävätyyppi järjestys] = d4.jarjestys

      
FROM [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_oppilaitostyyppi d2 on d2.id=f.oppilaitostyyppi_id
LEFT JOIN dbo.d_sukupuoli d22 on d22.id=f.sukupuoli_id
LEFT JOIN dbo.d_ika d23 on d23.id=f.ika_id
LEFt JOIN dbo.d_opettajankelpoisuus2 d25 on d25.id=f.kelp_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_perusopetuksessa d4 on d4.id=f.tehtavatyyppi_perusopetuksessa_id
LEFT JOIN dbo.d_opettajat_luokka_aste d3 on d3.id=f.oman_luokan_aste_id
LEFT JOIN dbo.d_opettajat_koko_osa_aikainen d5 on d5.id=f.koko_osa_aikainen_id
--where f.tilastointivuosi >= 2013


UNION ALL


Select
      [Tilastovuosi] = f.tilastointivuosi
      ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
      ,[Sukupuoli] = d22.sukupuoli
      ,[Oppilaitoksen maakunta] = (select top 1 maakunta from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
      --,[Oppilaitoksen kuntaryhmitys] = (select top 1 kuntaryhma from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
      ,[Ikä] = d23.ika5v
	  ,[Kelpoisuus] = case d25.opettajankelpoisuus when 'Kelpoinen antamaan opetusta' then 'Kyllä' else 'Ei' end
	  ,[Koulutusaste] = 'Lukiokoulutus'
	  ,[Koulutusmuoto] = 'Lukiokoulutus'
	  ,[Tehtävätyyppi] = d4.tehtavatyyppi
	  ,[Kokoaikainen] = case d5.koko_osa_aikainen_koodi when 1 then 1 else 0 end
 
	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
      ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Kön] = d22.sukupuoli_SV
      ,[Läroanstaltens landskap] = (select top 1 maakunta_SV from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
      ,[Åldersgrupp] = d23.ika5v_SV
	  ,[Utbildningsnivå] = 'Gymnasietutbildning'
	  ,[Utbildningsform] = 'Gymnasietutbildning'
	  ,[Typ av uppgift​] = d4.tehtavatyyppi_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
      ,[Language of the institution] = d1.opetuskieli_EN
      ,[Gender] = d22.sukupuoli_EN
      ,[Region of the institution] = (select top 1 maakunta_EN from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
      ,[Age group] = d23.ika5v_EN
	  ,[Level of education] = 'General upper secondary education'
	  ,[Form of education] = 'General upper secondary education'
	  ,[Type of task] = d4.tehtavatyyppi_EN

	  --koodit
	  ,[Koodit Oppil. maakunta] = (select top 1 maakunta_koodi from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)

	  --järjestyskentät
	  ,[opetuskieli järjestys]= d1.jarjestys
	  ,[sukupuoli järjestys] = d22.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = (select top 1 jarjestys_maakunta from dbo.d_alueluokitus where maakunta_koodi=f.maakunta_oppilaitos)
	 -- ,[Oppilaitoksen kuntaryhmitys järjestys] = (select top 1 jarjestys_kuntaryhma from dbo.d_alueluokitus where kuntaryhma_koodi=f.kuntaryhmitys_oppilaitos)
	  ,[ikä järjestys] = d23.jarjestys_ika5v
	  ,[Koulutusaste järjestys] = 2
	  ,[Tehtävätyyppi järjestys] = d4.jarjestys
	  
      
FROM [dbo].[f_Opettajat_lukiokoulutus_kelpoisuus_aine] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_lukiokoulutuksessa d7 on d7.id=f.tehtavatyyppi_lukiokoulutuksessa_id
LEFT JOIN dbo.d_opettajat_koulutusaste d8 on d8.id=f.paaasiallinen_koulutusmuoto_id
LEFT JOIN dbo.d_opettajat_aine d21 on d21.id=f.opettajan_eniten_opettama_aine_id
LEFT JOIN dbo.d_sukupuoli d22 on d22.id=f.sukupuoli_id
LEFT JOIN dbo.d_ika d23 on d23.id=f.ika_id
LEFT JOIN dbo.d_opettajankelpoisuus2 d25 on d25.id=f.kelp_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_lukiokoulutuksessa d4 on d4.id=f.tehtavatyyppi_lukiokoulutuksessa_id
LEFT JOIN dbo.d_opettajat_koko_osa_aikainen d5 on d5.id=f.koko_osa_aikainen_id
--where f.tilastointivuosi >= 2013


UNION ALL


Select
      [Tilastovuosi] = f.tilastointivuosi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
	  ,[Sukupuoli] = d34.sukupuoli
	  ,[Oppilaitoksen maakunta] = d31.maakunta
	  ,[Ikä] = d33.ika5v
      ,[Kelpoisuus] = case d17.kylla_ei when 'Kyllä' then 'Ei' else 'Kyllä' end
	  ,[Koulutusaste] = 'Ammatillinen koulutus'
	  ,[Koulutusmuoto] =
		case 
			when d5.koulutusaste = 'Ammatillinen perustutkintokoulutus' then 'Ammatillinen peruskoulutus'
			when d5.koulutusaste in ('Ammattitutkintokoulutus', 'Erikoisammattitutkintokoulutus') then 'Ammatti- ja erikoisammattitutkintoon valmistava koulutus'
			else 'Muu tai tuntematon'
		end
	  ,[Tehtävätyyppi] = d4.tehtavatyyppi
	  ,[Kokoaikainen] = case d6.koko_osa_aikainen_koodi when 1 then 1 else 0 end

  	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
      ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Kön] = d34.sukupuoli_SV
      ,[Läroanstaltens landskap] = d31.maakunta_SV
      ,[Åldersgrupp] = d33.ika5v_SV
	  ,[Utbildningsnivå] = 'Yrkesutbildning'
	  ,[Utbildningsform] =		
		case 
			when d5.koulutusaste = 'Ammatillinen perustutkintokoulutus' then 'Grundläggande yrkesutbildning'
			when d5.koulutusaste in ('Ammattitutkintokoulutus', 'Erikoisammattitutkintokoulutus') then 'Förberedande utbildning för yrkes- och specialyrkesexamen'
			else 'Annan eller okänd'
		end
	  ,[Typ av uppgift​] = d4.tehtavatyyppi_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
      ,[Language of the institution] = d1.opetuskieli_EN
      ,[Gender] = d34.sukupuoli_EN
      ,[Region of the institution] = d31.maakunta_EN
      ,[Age group] = d33.ika5v_EN
	  ,[Level of education] = 'Vocational education and training'
	  ,[Form of education] = 
		case 
			when d5.koulutusaste = 'Ammatillinen perustutkintokoulutus' then 'Vocational upper secondary education and training'
			when d5.koulutusaste in ('Ammattitutkintokoulutus', 'Erikoisammattitutkintokoulutus') then 'Preparatory training for further vocational and specialist vocational qualifications'
			else 'Other or unknown'
		end
	  ,[Type of task] = d4.tehtavatyyppi_EN

	  --koodit
	  ,[Koodit Oppil. maakunta] = d31.maakunta_koodi
 
	  --järjestyskentät
	  ,[opetuskieli järjestys]= d1.jarjestys
	  ,[Sukupuoli järjestys] = d34.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = d31.jarjestys_maakunta
	  ,[Ikä järjestys] = d33.jarjestys_ika5v
	  ,[Koulutusaste järjestys] = 3
	  ,[Tehtävätyyppi järjestys] = d4.jarjestys  

      
FROM [dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_kylla_ei d17 on d17.id=f.eikelp_tehtavaan
LEFT JOIN dbo.d_alueluokitus d31 on d31.id=f.oppilaitoksen_maakunta_id
LEFT JOIN dbo.d_ika d33 on d33.id=f.ika_id
LEFT JOIN dbo.d_sukupuoli d34 on d34.id=f.sukupuoli_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa d4 on d4.id=f.tehtavatyyppi_ammatillisessa_id
left join VipunenTK.dbo.d_opettajat_koulutusaste_amm d5 on d5.id=f.pääasiallinen_koulutusaste_id
LEFT JOIN dbo.d_opettajat_koko_osa_aikainen d6 on d6.id=f.koko_osa_aikainen_id
--where f.tilastointivuosi >= 2013


UNION ALL


Select
      [Tilastovuosi] = f.tilastointivuosi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli 
	  ,[Sukupuoli] = d34.sukupuoli
      ,[Oppilaitoksen maakunta] = d31.maakunta
	  ,[Ikä] = d33.ika5v
	  ,[Kelpoisuus] = d17.kylla_ei
	  ,[Koulutusaste] = 'Vapaa sivistystyö'
	  ,[Koulutusmuoto] = 'Vapaa sivistystyö'
	  ,[Tehtävätyyppi] = d4.tehtavatyyppi    
	  ,[Kokoaikainen] = case d5.koko_osa_aikainen_koodi when 1 then 1 else 0 end
	  
	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
      ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Kön] = d34.sukupuoli_SV
      ,[Läroanstaltens landskap] = d31.maakunta_SV
      ,[Åldersgrupp] = d33.ika5v_SV
	  ,[Utbildningsnivå] = 'Utbildningar som ordnats som fritt bildningsarbete'
	  ,[Utbildningsform] = 'Utbildningar som ordnats som fritt bildningsarbete'
	  ,[Typ av uppgift​] = d4.tehtavatyyppi_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
      ,[Language of the institution] = d1.opetuskieli_EN
      ,[Gender] = d34.sukupuoli_EN
      ,[Region of the institution] = d31.maakunta_EN
      ,[Age group] = d33.ika5v_EN
	  ,[Level of education] = 'Liberal (non-formal) adult education'
	  ,[Form of education] = 'Liberal (non-formal) adult education'
	  ,[Type of task] = d4.tehtavatyyppi_EN

	  --koodit
	  ,[Koodit Oppil. maakunta] = d31.maakunta_koodi
   
	  --järjestyskentät
	  ,[Opetuskieli järjestys]= d1.jarjestys
	  ,[Sukupuoli järjestys] = d34.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = d31.jarjestys_maakunta
	  ,[Ikä järjestys] = d33.jarjestys_ika5v
	  ,[Koulutusaste järjestys] = 4
	  ,[Tehtävätyyppi järjestys] = d4.jarjestys

      
FROM [dbo].[f_Opettajat_vapaa_sivistystyo_kelpoisuus_aine] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_kylla_ei d17 on d17.id=f.kelpoisuus_kunnossa_id
LEFT JOIN dbo.d_alueluokitus d31 on d31.id=f.oppilaitoksen_maakunta_id
LEFT JOIN dbo.d_ika d33 on d33.id=f.ika_id
LEFT JOIN dbo.d_sukupuoli d34 on d34.id=f.sukupuoli_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa d4 on d4.id=f.tehtavatyyppi_id
LEFT JOIN dbo.d_opettajat_koko_osa_aikainen d5 on d5.id=f.koko_osa_aikainen_id
--where f.tilastointivuosi >= 2013


) ff









GO


USE [ANTERO]