USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_5]    Script Date: 4.2.2020 18:47:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER view [dbo].[v_f_tab_opettajat_7_5] as

Select
      [Tilastovuosi] = f.tilastointivuosi
      ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
      ,[Koulutuksen järjestäjän koko] = d4.koko
      ,[Koulutuksen järjestäjän kieli] = d5.kieli
	  ,[Koulutuksen järjestäjän omistajatyyppi] = (select top 1 oppilaitoksen_omistajatyyppi from dbo.d_oppilaitoksen_taustatiedot where oppilaitoksen_omistajatyyppikoodi=f.koulutuksen_jarjestajan_omistajatyyppi)
      ,[Koulutuksen järjestäjän maakunta] = (select top 1 maakunta from dbo.d_alueluokitus where maakunta_koodi=f.koulutuksen_jarjestajan_maakunta)
      ,[Koulutuksen järjestäjän kuntaryhmitys] = (select top 1 kuntaryhma from dbo.d_alueluokitus where kuntaryhma_koodi=f.koulutuksen_jarjestajan_kuntaryhmitys)

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
      ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Utbildningsanordnarens storlek] = d4.koko_SV
      ,[Utbildningsanordnarens språk] = d5.kieli_SV
	  ,[Utbildningsanordnarens ägartyp] = (select top 1 oppilaitoksen_omistajatyyppi_SV from dbo.d_oppilaitoksen_taustatiedot where oppilaitoksen_omistajatyyppikoodi=f.koulutuksen_jarjestajan_omistajatyyppi)
      ,[Utbildningsanordnarens landskap] = (select top 1 maakunta_SV from dbo.d_alueluokitus where maakunta_koodi=f.koulutuksen_jarjestajan_maakunta)
      ,[Utbildningsanordnarens kommungruppering] = (select top 1 kuntaryhma_SV from dbo.d_alueluokitus where kuntaryhma_koodi=f.koulutuksen_jarjestajan_kuntaryhmitys)

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
      ,[Language of the institution] = d1.opetuskieli_EN
      ,[The size of the education provider] = d4.koko_EN
      ,[Language of the education provider] = d5.kieli_EN
	  ,[Type of education provider owner] = (select top 1 oppilaitoksen_omistajatyyppi_EN from dbo.d_oppilaitoksen_taustatiedot where oppilaitoksen_omistajatyyppikoodi=f.koulutuksen_jarjestajan_omistajatyyppi)
      ,[Region of the education provider] = (select top 1 maakunta_EN from dbo.d_alueluokitus where maakunta_koodi=f.koulutuksen_jarjestajan_maakunta)
      ,[Municipality type of the education provider] = (select top 1 kuntaryhma_EN from dbo.d_alueluokitus where kuntaryhma_koodi=f.koulutuksen_jarjestajan_kuntaryhmitys)

	  --koodit
	  ,(select top 1 maakunta_koodi from dbo.d_alueluokitus where maakunta_koodi=f.koulutuksen_jarjestajan_maakunta) as "Koodit Koul. järj. maakunta"
 
	  --järjestyskentät
	  ,[opetuskieli järjestys]= d1.jarjestys
	  ,[Koulutuksen järjestäjän koko järjestys] = d4.jarjestys
      ,[Koulutuksen järjestäjän kieli järjestys] = d5.jarjestys
	  ,[Koulutuksen järjestäjän omistajatyyppi järjestys] = (select top 1 jarjestys_omistajatyyppi from dbo.d_oppilaitoksen_taustatiedot where oppilaitoksen_omistajatyyppikoodi=f.koulutuksen_jarjestajan_omistajatyyppi)
	  ,[Koulutuksen järjestäjän maakunta järjestys] = (select top 1 jarjestys_maakunta from dbo.d_alueluokitus where maakunta_koodi=f.koulutuksen_jarjestajan_maakunta)
	  ,[Koulutuksen järjestäjän kuntaryhmitys järjestys] = (select top 1 jarjestys_kuntaryhma from dbo.d_alueluokitus where kuntaryhma_koodi=f.koulutuksen_jarjestajan_kuntaryhmitys)

      
FROM [dbo].[f_Opettajat_lukiokoulutus_koulutuksen_jarjestaja] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_koulutuksen_jarjestajan_koko d4 on d4.id=f.koulutuksen_jarjestajan_koko_id
LEFT JOIN dbo.d_kieli2 d5 on d5.id=f.koulutuksen_jarjestajan_kieli_id













GO


USE [ANTERO]