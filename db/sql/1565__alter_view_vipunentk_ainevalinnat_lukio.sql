USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_ainevalinnat_lukio]    Script Date: 23.4.2018 17:40:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



alter view [dbo].[v_f_tab_ainevalinnat_lukio] AS
/*
CSC Jarmo 9.2.2016

Select * from [VipunenTK].[dbo].[v_f_tab_ainevalinnat_lukio]
*/

SELECT 
       [ainevalintojen_lkm]
	   ,[opiskelijat_lkm] = 0

	  --suomi
	  ,[Tilastovuosi] = f.tilastovuosi
	  ,[Aine] = d2.aine
	  ,[Aineryhmä] = d2.aineryhmä
	  ,[Laajuus] = d2.laajuus
      ,[Oppilaitos] = d3.oppilaitos
	  ,[Oppilaitoksen kunta] = d1.kunta
	  ,[Oppilaitoksen maakunta] = d1.maakunta
	  ,[Oppilaitoksen AVI] = d1.avi
	  ,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	  ,[Oppilaitoksen opetuskieli] = d3.opetuskieli
	  ,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
      ,[Koulutuksen järjestäjä] = d3.koulutuksen_jarjestaja
	  ,[Sukupuoli] = d4.sukupuoli

	  --englanti
	  ,[Statistical year] = f.tilastovuosi
	  ,[Subject] = d2.aine_EN
	  ,[Subject group] = d2.aineryhmä_EN
	  ,[Scope] = d2.laajuus_EN
      ,[Educational institution] = d3.oppilaitos_EN
	  ,[Municipality of the institution] = d1.kunta_EN
	  ,[Region of the institution] = d1.maakunta_EN
	  ,[AVI area of the institution] = d1.avi_EN
	  ,[Type of institution] = d3.oppilaitostyyppi_EN
	  ,[Language of the institution] = d3.opetuskieli_EN
	  ,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
      ,[Education provider] = d3.koulutuksen_jarjestaja_EN
	  ,[Gender] = d4.sukupuoli_EN

	  --ruotsi
	  ,[Statistikår] = f.tilastovuosi
	  ,[Ämne] = d2.aine_SV
	  ,[Ämnesgrupp] = d2.aineryhmä_SV
	  ,[Omfattning] = d2.laajuus_SV
      ,[Läroanstalt] = d3.oppilaitos_SV
	  ,[Läroanstaltens kommun] = d1.kunta_SV
	  ,[Läroanstaltens landskap] = d1.maakunta_SV
	  ,[Läroanstaltens RFV-område] = d1.avi_SV
	  ,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	  ,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV
	  ,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
      ,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	  ,[Kön] = d4.sukupuoli_SV


	  --koodimuuttujat
	  ,"Koodit Oppilaitos" = d3.oppilaitoskoodi
	  ,"Koodit Oppilaitoksen kunta" = d1.kunta_koodi
	  ,"Koodit Oppilaitoksen maakunta" = d1.maakunta_koodi
	  ,"Koodit Koulutuksen järjestäjä" = d3.koulutuksen_jarjestajakoodi

	  --järjestys
	  ,[jarjestys_kunta] = d1.jarjestys
	  ,d1.jarjestys_maakunta
	  ,d1.jarjestys_avi
	  ,[jarjestys_aine] = d2.aine_jarjestys
	  ,[jarjestys_aineryhma] = d2.aineryhmä_jarjestys
	  ,[jarjestys_laajuus] = d2.laajuus_jarjestys
	  ,d3.jarjestys_oppilaitos
	  ,d3.jarjestys_oppilaitostyyppi
	  ,d3.jarjestys_opetuskieli
	  ,d3.jarjestys_omistajatyyppi
	  ,d3.jarjestys_koulutuksen_jarjestaja
	  ,[jarjestys_sukupuoli] = d4.jarjestys

FROM [VipunenTK].[dbo].[f_AVL_ainevalinnat] f
LEFT JOIN [VipunenTK].[dbo].[d_alueluokitus] d1
	ON d1.id = f.oppilaitoksensijainti_id
LEFT JOIN [VipunenTK].[dbo].[d_lukion_ainevalinnat] d2
	ON d2.id = f.ainevalinta_id
LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d3
	ON d3.id = f.oppilaitos_id
LEFT JOIN [VipunenTK].[dbo].[d_sukupuoli] d4
	ON d4.id = f.sukupuoli_id

UNION ALL

SELECT 
       [ainevalintojen_lkm] = 0
	   ,[opiskelijat_lkm] = f.opiskelijoiden_lkm

	  --suomi
	  ,[Tilastovuosi] = f.tilastovuosi
	  ,[Aine] = 'englanti'
	  ,[Aineryhmä] = null
	  ,[Laajuus] = null
      ,[Oppilaitos] = d3.oppilaitos
	  ,[Oppilaitoksen kunta] = d1.kunta
	  ,[Oppilaitoksen maakunta] = d1.maakunta
	  ,[Oppilaitoksen AVI] = d1.avi
	  ,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	  ,[Oppilaitoksen opetuskieli] = d3.opetuskieli
	  ,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
      ,[Koulutuksen järjestäjä] = d3.koulutuksen_jarjestaja
	  ,[Sukupuoli] = d4.sukupuoli

	  --englanti
	  ,[Statistical year] = f.tilastovuosi
	  ,[Subject] = 'english'
	  ,[Subject group] = null
	  ,[Scope] = null
      ,[Educational institution] = d3.oppilaitos_EN
	  ,[Municipality of the institution] = d1.kunta_EN
	  ,[Region of the institution] = d1.maakunta_EN
	  ,[AVI area of the institution] = d1.avi_EN
	  ,[Type of institution] = d3.oppilaitostyyppi_EN
	  ,[Language of the institution] = d3.opetuskieli_EN
	  ,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
      ,[Education provider] = d3.koulutuksen_jarjestaja_EN
	  ,[Gender] = d4.sukupuoli_EN

	  --ruotsi
	  ,[Statistikår] = f.tilastovuosi
	  ,[Ämne] = 'engelska'
	  ,[Ämnesgrupp] = null
	  ,[Omfattning] = null
      ,[Läroanstalt] = d3.oppilaitos_SV
	  ,[Läroanstaltens kommun] = d1.kunta_SV
	  ,[Läroanstaltens landskap] = d1.maakunta_SV
	  ,[Läroanstaltens RFV-område] = d1.avi_SV
	  ,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	  ,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV
	  ,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
      ,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	  ,[Kön] = d4.sukupuoli_SV


	  --koodimuuttujat
	  ,"Koodit Oppilaitos" = d3.oppilaitoskoodi
	  ,"Koodit Oppilaitoksen kunta" = d1.kunta_koodi
	  ,"Koodit Oppilaitoksen maakunta" = d1.maakunta_koodi
	  ,"Koodit Koulutuksen järjestäjä" = d3.koulutuksen_jarjestajakoodi

	  --järjestys
	  ,[jarjestys_kunta] = d1.jarjestys
	  ,d1.jarjestys_maakunta
	  ,d1.jarjestys_avi
	  ,[jarjestys_aine] = 99999
	  ,[jarjestys_aineryhma] = 99999
	  ,[jarjestys_laajuus] = 99999
	  ,d3.jarjestys_oppilaitos
	  ,d3.jarjestys_oppilaitostyyppi
	  ,d3.jarjestys_opetuskieli
	  ,d3.jarjestys_omistajatyyppi
	  ,d3.jarjestys_koulutuksen_jarjestaja
	  ,[jarjestys_sukupuoli] = d4.jarjestys

FROM [VipunenTK].[dbo].[f_AVL_oppimaaran_suorittaneet] f
LEFT JOIN [VipunenTK].[dbo].[d_alueluokitus] d1
	ON d1.id = f.oppilaitoksensijainti_id
LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d3
	ON d3.id = f.oppilaitos_id
LEFT JOIN [VipunenTK].[dbo].[d_sukupuoli] d4
	ON d4.id = f.sukupuoli_id


GO


USE [ANTERO]