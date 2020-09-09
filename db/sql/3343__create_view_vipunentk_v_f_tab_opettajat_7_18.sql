USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_18]    Script Date: 1.4.2020 14:55:43 ******/
DROP VIEW IF EXISTS [dbo].[v_f_tab_opettajat_7_18]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_18]    Script Date: 1.4.2020 14:55:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














CREATE view [dbo].[v_f_tab_opettajat_7_18] as

Select
      [Tilastovuosi] = f.tilastointivuosi
      ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
      ,[Oppilaitostyyppi] = d2.oppilaitostyyppi
      ,[Tehtävätyyppi] = d7.tehtavatyyppi
      ,[Opettajan ensin ilmoitettu aine] = d21.aine
      ,[Opettajan toiseksi ilmoitettu aine] = d21b.aine
      ,[Opettajan kolmanneksi ilmoitettu aine] = d21c.aine
      ,[Sukupuoli] = d22.sukupuoli
      ,[Oppilaitoksen maakunta] = d4.maakunta
      ,[Oppilaitoksen sijaintikunnan kuntaryhmitys] = d3.kuntaryhma
      ,[Ikäryhmä] = d23.ika5v
	  ,[Kelpoisuus] = case d25.kylla_ei when 'Kyllä' then 'On kelpoisuus' when 'Ei' then 'Ei kelpoisuutta' else 'Tuntematon' end
	  ,[kelp_tehtavaan]

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
      ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Läroanstaltstyp] = d2.oppilaitostyyppi_SV
      ,[Uppgiftstyp] = d7.tehtavatyyppi_SV
      ,[Lärarens huvudsakliga ämne] = d21.aine_SV
      ,[Kön] = d22.sukupuoli_SV
      ,[Läroanstaltens landskap] = d4.maakunta_SV
      ,[Läroanstaltens kommungruppering] = d3.kuntaryhma_SV
      ,[Åldersgrupp] = d23.ika5v_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
      ,[Language of the institution] = d1.opetuskieli_EN
      ,[Type of institution] = d2.oppilaitostyyppi_EN
      ,[Type of task] = d7.tehtavatyyppi_EN
      ,[Primary taught subject] = d21.aine_EN
      ,[Gender] = d22.sukupuoli_EN
      ,[Region of the institution] = d4.maakunta_EN
      ,[Municipality type of the institution] = d3.kuntaryhma_EN
      ,[Age group] = d23.ika5v_EN


	  --koodit
	  ,[Koodit Oppil. maakunta] = d4.maakunta_koodi

 
	  --järjestyskentät
	  ,[opetuskieli järjestys]= d1.jarjestys
	  ,[Oppilaitostyyppi järjestys] = d2.jarjestys
	  ,[tehtävätyyppi järjestys] = d7.jarjestys
	  ,[aine järjestys] = d21.jarjestys
	  ,[aine2 järjestys] = d21b.jarjestys
	  ,[aine3 järjestys] = d21c.jarjestys
	  ,[sukupuoli järjestys] = d22.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = d4.jarjestys_maakunta
	  ,[Oppilaitoksen kuntaryhmitys järjestys] = d3.jarjestys
	  ,[ikä järjestys] = d23.jarjestys_ika5v
	  ,[kelpoisuus järjestys] = d25.jarjestys
      
FROM [dbo].[f_Opettajat_perus_ja_lukioaste_kelpoisuus_kokonaisaineisto] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_oppilaitostyyppi d2 on d2.id=f.oppilaitostyyppi_id
LEFT JOIN dbo.d_kuntaryhma d3 on d3.id=f.kuntaryhmitys_oppilaitos_id
LEFT JOIN dbo.d_alueluokitus d4 on d4.id=f.maakunta_oppilaitos_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_perusopetuksessa d7 on d7.id=f.tehtavatyyppi_perusopetuksessa_id
LEFT JOIN dbo.d_opettajat_aine d21 on d21.id=f.opettajan_ensin_ilmoitettu_aine_id
LEFT JOIN dbo.d_opettajat_aine d21b on d21b.id=f.opettajan_toiseksi_ilmoitettu_aine_id
LEFT JOIN dbo.d_opettajat_aine d21c on d21c.id=f.opettajan_kolmanneksi_ilmoitettu_aine_id
LEFT JOIN dbo.d_sukupuoli d22 on d22.id=f.sukupuoli_id
LEFT JOIN dbo.d_ika d23 on d23.id=f.ika_id
LEFT JOIN dbo.d_kylla_ei d25 on d25.id=f.kelp_tehtavaan_id











GO


USE [ANTERO]