USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_19]    Script Date: 1.4.2020 15:16:40 ******/
DROP VIEW IF EXISTS [dbo].[v_f_tab_opettajat_7_19]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_19]    Script Date: 1.4.2020 15:16:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














CREATE view [dbo].[v_f_tab_opettajat_7_19] as

Select
      [Tilastovuosi] = f.tilastointivuosi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
	  ,[Oppilaitostyyppi] = d2.oppilaitostyyppi
	  ,[Kelpoisuus tehtävään] = case d17.kylla_ei when 'Kyllä' then 'Ei kelpoisuutta' when 'Ei' then 'On kelpoisuus' else 'Tuntematon' end
	  ,[kelp_tehtavaan] = case eikelp_tehtavaan when 1 then 0 when 0 then 1 end
	  ,[Opettajan ensin ilmoitettu ala] = case d24.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Yhteiset tutkinnon osat' else d24.iscfibroad2013 end
      ,[Opettajan ensin ilmoitettu aine] = d25.aine
	  ,[Opettajan toiseksi ilmoitettu ala] = case d24b.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Yhteiset tutkinnon osat' else d24b.iscfibroad2013 end
      ,[Opettajan toiseksi ilmoitettu aine] = d25b.aine
	  ,[Opettajan kolmanneksi ilmoitettu ala] = case d24c.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Yhteiset tutkinnon osat' else d24c.iscfibroad2013 end
      ,[Opettajan kolmanneksi ilmoitettu aine] = d25c.aine
      ,[Oppilaitoksen maakunta] = d31.maakunta
	  ,[Ikäryhmä] = d33.ika5v
	  ,[Sukupuoli] = d34.sukupuoli

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Läroanstaltstyp] = d2.oppilaitostyyppi_SV
	  ,[Lärarens huvudsakliga utb.område] = case d24.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Gemensammma examensdelar' else d24.iscfibroad2013_SV end
      ,[Lärarens huvudsakliga ämne] = d25.aine_SV
      ,[Läroanstaltens landskap] = d31.maakunta_SV
	  ,[Åldersgrupp] = d33.ika5v_SV
	  ,[Kön] = d34.sukupuoli_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
	  ,[Language of the institution] = d1.opetuskieli_EN
      ,[Type of institution] = d2.oppilaitostyyppi_EN
	  ,[Teacher's primary field] = case d24.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Core subjects' else d24.iscfibroad2013_EN end
      ,[Teacher's primary subject] = d25.aine_EN
      ,[Region of the institution] = d31.maakunta_EN
	  ,[Age group] = d33.ika5v_EN
	  ,[Gender] = d34.sukupuoli_EN


	  --koodit
	  ,[Koodit Oppil. maakunta] = d31.maakunta_koodi
      
 
	  --järjestyskentät
	  ,[Opetuskieli järjestys]= d1.jarjestys
	  ,[Oppilaitostyyppi järjestys] = d2.jarjestys
	  ,[Opettajan ala järjestys] = d24.jarjestys_iscfibroad2013
	  ,[Opettajan aine järjestys] = d25.jarjestys
	  ,[Opettajan ala järjestys2] = d24b.jarjestys_iscfibroad2013
	  ,[Opettajan aine järjestys2] = d25b.jarjestys
	  ,[Opettajan ala järjestys3] = d24c.jarjestys_iscfibroad2013
	  ,[Opettajan aine järjestys3] = d25c.jarjestys
	  ,[Oppilaitoksen maakunta järjestys] = d31.jarjestys_maakunta
	  ,[Ikä järjestys] = d33.jarjestys_ika5v
	  ,[Sukupuoli järjestys] = d34.jarjestys
	  ,[Kelpoisuus järjestys] = case d17.kylla_ei when 'Kyllä' then 2 when 'Ei' then 1 else 3 end

      
FROM [dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_kokonaisaineisto] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_oppilaitostyyppi_amm d2 on d2.id=f.oppilaitostyyppi_id
LEFT JOIN dbo.d_alueluokitus d31 on d31.id=f.oppilaitoksen_maakunta_id
LEFT JOIN dbo.d_kylla_ei d17 on d17.id=f.eikelp_tehtavaan_id
LEFT JOIN dbo.d_ika d33 on d33.id=f.ika_id
LEFT JOIN dbo.d_sukupuoli d34 on d34.id=f.sukupuoli_id
LEFT JOIN dbo.d_koulutusluokitus d24 on d24.id=f.opettajan_ensin_ilmoitettu_ala_id
LEFT JOIN dbo.d_koulutusluokitus d24b on d24b.id=f.opettajan_toiseksi_ilmoitettu_ala_id
LEFT JOIN dbo.d_koulutusluokitus d24c on d24c.id=f.opettajan_kolmanneksi_ilmoitettu_ala_id
LEFT JOIN dbo.d_opettajat_aine_amm d25 on d25.id=f.opettajan_ensin_ilmoitettu_aine_id
LEFT JOIN dbo.d_opettajat_aine_amm d25b on d25b.id=f.opettajan_toiseksi_ilmoitettu_aine_id
LEFT JOIN dbo.d_opettajat_aine_amm d25c on d25c.id=f.opettajan_kolmanneksi_ilmoitettu_aine_id





















GO


USE [ANTERO]