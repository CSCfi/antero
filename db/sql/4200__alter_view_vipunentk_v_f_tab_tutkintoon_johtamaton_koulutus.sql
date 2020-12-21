USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_tutkintoon_johtamaton_koulutus]    Script Date: 16.12.2020 19:57:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [dbo].[v_f_tab_tutkintoon_johtamaton_koulutus] as

Select
	  --Aika
      Tilastovuosi = f.tilastointivuosi

	  --Henkilö
	  ,Sukupuoli = d1.sukupuoli

	  --Koulutus
	  ,Koulutustyyppi = d2.Koulutustyyppi
	  ,Koulutusala = d2.Koulutusala
	  ,Opintoala = d2.Opintoala

	  --Organisaatio
	  ,[Koulutuksen järjestäjä] = d3.koulutuksen_jarjestaja
	  ,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	  ,[Oppilaitos] = d3.oppilaitos
	  ,[Oppilaitoksen maakunta] = d4.maakunta
	  ,[Oppilaitoksen kunta] = d4.kunta
	  ,[Oppilaitoksen opetuskieli] = d3.opetuskieli
	  --,[Oppilaitoskoodi] = coalesce(d3.oppilaitoksen_korvaavakoodi,d3.oppilaitoskoodi)
	  ,[Oppilaitoksessa annettu tutkintoon johtamatonta koulutusta] = d5.kylla_ei

	  --Mittarit
	  ,Opetustunnit2 = f.[Opetustuntien lukumäärä]
	  ,Koulutukset2 = null
	  ,Osallistuneet2 = null

	  --Ruotsi
	  ,Statistikår = f.tilastointivuosi
	  ,Kön = d1.sukupuoli_SV
	  ,[Typ av utbildning] = d2.Koulutustyyppi_SV
	  ,Utbildningsområde = d2.Koulutusala_SV
	  ,Studieområde = d2.Opintoala_SV
	  ,Utbildningsanordnare = d3.koulutuksen_jarjestaja_SV
	  ,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	  ,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	  ,[Läroanstalt] = d3.oppilaitos_SV
	  ,[Läroanstaltens landskap] = d4.maakunta_SV
	  ,[Läroanstaltens kommun] = d4.kunta_SV
	  ,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
	  ,Gender = d1.sukupuoli_EN
	  ,[Type of education] = d2.Koulutustyyppi_EN
	  ,[Field of education] = d2.Koulutusala_EN
	  ,[Subfield of education] = d2.Opintoala_EN
	  ,[Education provider] = d3.koulutuksen_jarjestaja_EN
	  ,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	  ,[Type of institution] = d3.oppilaitostyyppi_EN
	  ,[Educational institution] = d3.oppilaitos_EN
	  ,[Region of the institution ] = d4.maakunta_EN
	  ,[Municipality of the institution] = d4.kunta_EN
	  ,[Language of the institution ] = d3.opetuskieli_EN

	  --Koodit
	  ,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	  ,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi
	  ,[Koodit Oppilaitos] = coalesce(d3.oppilaitoksen_korvaavakoodi,d3.oppilaitoskoodi)
	  ,[Koodit Koulutuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	  --,[Koodit Koulutusala]
	  --,[Koodit Opintoala]

	  --Järjestys
	  ,[Sukupuoli jarj] = d1.jarjestys
	  ,[Koulutustyyppi jarj] = d2.Koulutustyyppi_lajittelu
	  ,[Koulutusala jarj] = d2.Koulutusala_lajittelu
	  ,[Opintoala jarj] = d2.Opintoala_lajittelu
	  ,[Omistajatyyppi jarj] = d3.jarjestys_omistajatyyppi
	  ,[Oppilaitostyyppi jarj] = d3.jarjestys_oppilaitostyyppi
	  ,[Maakunta jarj] = d4.jarjestys_maakunta
	  ,[Opetuskieli jarj] = d3.jarjestys_opetuskieli
	  ,[Kyllaei d5 jarj] = d5.jarjestys
	  

FROM [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_opetustuntien_sisalto_ja_tavoiteluokitus d2 on d2.id=f.opetustunti_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
left join VipunenTK.dbo.d_alueluokitus d4 on d4.id=f.oppilaitoksen_sijaintikunta_id
left join VipunenTK.dbo.d_kylla_ei d5 on d5.id = f.eikoul_id
where d2.Koulutusala!='Muut mittarit'

UNION ALL

Select
	  --Aika
      Tilastovuosi = f.tilastointivuosi

	  --Henkilö
	  ,Sukupuoli = d1.sukupuoli

	  --Koulutus
	  ,Koulutustyyppi = d2.Koulutustyyppi
	  ,Koulutusala = d2.Koulutusala
	  ,Opintoala = d2.Opintoala

	  --Organisaatio
	  ,[Koulutuksen järjestäjä] = d3.koulutuksen_jarjestaja
	  ,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	  ,[Oppilaitos] = d3.oppilaitos
	  ,[Oppilaitoksen maakunta] = d4.maakunta
	  ,[Oppilaitoksen kunta] = d4.kunta
	  ,[Oppilaitoksen opetuskieli] = d3.opetuskieli
	  --,[Oppilaitoskoodi] = coalesce(d3.oppilaitoksen_korvaavakoodi,d3.oppilaitoskoodi)
	  ,[Oppilaitoksessa annettu tutkintoon johtamatonta koulutusta] = d5.kylla_ei

	  --Mittarit
	  ,Opetustunnit2 = null
	  ,Koulutukset2 = f.[Koulutusten lukumäärä]
	  ,Osallistuneet2 = f.[Osallistuneiden lukumäärä]

	  --Ruotsi
	  ,Statistikår = f.tilastointivuosi
	  ,Kön = d1.sukupuoli_SV
	  ,[Typ av utbildning] = d2.Koulutustyyppi_SV
	  ,Utbildningsområde = d2.Koulutusala_SV
	  ,Studieområde = d2.Opintoala_SV
	  ,Utbildningsanordnare = d3.koulutuksen_jarjestaja_SV
	  ,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	  ,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	  ,[Läroanstalt] = d3.oppilaitos_SV
	  ,[Läroanstaltens landskap] = d4.maakunta_SV
	  ,[Läroanstaltens kommun] = d4.kunta_SV
	  ,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
	  ,Gender = d1.sukupuoli_EN
	  ,[Type of education] = d2.Koulutustyyppi_EN
	  ,[Field of education] = d2.Koulutusala_EN
	  ,[Subfield of education] = d2.Opintoala_EN
	  ,[Education provider] = d3.koulutuksen_jarjestaja_EN
	  ,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	  ,[Type of institution] = d3.oppilaitostyyppi_EN
	  ,[Educational institution] = d3.oppilaitos_EN
	  ,[Region of the institution ] = d4.maakunta_EN
	  ,[Municipality of the institution] = d4.kunta_EN
	  ,[Language of the institution ] = d3.opetuskieli_EN

	  --Koodit
	  ,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	  ,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi
	  ,[Koodit Oppilaitos] = coalesce(d3.oppilaitoksen_korvaavakoodi,d3.oppilaitoskoodi)
	  ,[Koodit Koulutuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	  --,[Koodit Koulutusala]
	  --,[Koodit Opintoala]

	  --Järjestys
	  ,[Sukupuoli jarj] = d1.jarjestys
	  ,[Koulutustyyppi jarj] = d2.Koulutustyyppi_lajittelu
	  ,[Koulutusala jarj] = d2.Koulutusala_lajittelu
	  ,[Opintoala jarj] = d2.Opintoala_lajittelu
	  ,[Omistajatyyppi jarj] = d3.jarjestys_omistajatyyppi
	  ,[Oppilaitostyyppi jarj] = d3.jarjestys_oppilaitostyyppi
	  ,[Maakunta jarj] = d4.jarjestys_maakunta
	  ,[Opetuskieli jarj] = d3.jarjestys_opetuskieli
	  ,[Kyllaei d5 jarj] = d5.jarjestys
	  

FROM [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_opetustuntien_sisalto_ja_tavoiteluokitus d2 on d2.id=f.opetustunti_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
left join VipunenTK.dbo.d_alueluokitus d4 on d4.id=f.oppilaitoksen_sijaintikunta_id
left join VipunenTK.dbo.d_kylla_ei d5 on d5.id = f.eikoul_id
where d2.Opintoala='Oppilaitosten tutkintoon johtamaton koulutus koulutustyypeittäin'




GO


USE [ANTERO]