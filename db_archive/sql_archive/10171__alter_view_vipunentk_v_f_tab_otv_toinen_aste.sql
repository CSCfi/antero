USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_otv_toinen_aste]    Script Date: 30.9.2024 10:58:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [dbo].[v_f_tab_otv_toinen_aste] AS

--aloittaneet ja opiskelijat
select --top 100
	[Tilastovuosi] = f.tilv
	
	,[Sukupuoli] = d1.sukupuoli
	,[Äidinkieli] = d5.aidinkieli_versio1
	,[Ikäryhmä] = d9.ika5v
	,[Nuorten/aikuisten koul.] = d4.nuorten_aikuisten_koulutus
	,[Oppisopimus purkautunut] = d10.oppisopimus_purkautunut
	,[Todistus oppisopimuskoulutuksen suorittamisesta] = d11.todistus_oppisopimuskoulutuksen_suorittamisesta
	,[Yrittäjän oppisopimuskoulutus] = d12.yrittajan_oppisopimuskoulutus
	,[TUVA-opiskeluoikeus] = d31.kylla_ei

	,[Koulutuslaji] = d6.lukiokoulutuksen_koulutuslaji
--	,[Hallinnonala] = d7.opetushallinnon_koulutus
	,[Hallinnonala] = d7.hallinnonala
	,[Koulutuksen tavoite] = d8.tutkinnon_tavoite
	,[Tutkinnon toteuma] = null
	,[Koko tutkinto / tutk. osa] = d27.koulutuksen_tavoite_toteuma
	,[Järjestämistapa] = d13.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	,[Järjestämismuoto] = d14.koulutuksen_jarjestamismuoto
	,[Koulutus- ja oppisopimusjaksot] = d14b.selite_fi
	,[Tutkintotyyppi] = d15.ammatillisen_koulutuksen_koulutuslaji
	,[Koulutusala] = d16.koulutusala2002
	,[Opintoala] = d16.opintoala2002
	,[Koulutusnimike] = d16.koulutus
	,[Osaamisala] = d17.koulutusohjelma_ammpk
	,[Rahoituslähde] = d18.rahoituslahde_amm
	,[Tutkintonimike] = d19.tutkintonimike_ammpk
	,[Koulutuksen kieli] = d20.kieli
	,[Työvoimapoliittinen koulutus] = d21.tyovoimapoliittinen_koulutus
	,[Väylä näyttötutkintoon] = null	
	,[Koulutuksen suuralue] = d22.suuralue
	,[Koulutuksen kunnan kielisuhde] = d22.kielisuhde
	,[Koulutuksen AVI] = d22.avi
	,[Koulutuksen ELY] = d22.ely
	,[Koulutuksen maakunta] = d22.maakunta
	,[Koulutuksen seutukunta] = d22.seutukunta
	,[Koulutuksen sijaintikunnan kuntaryhmä] = d22.kuntaryhma
	,[Koulutuksen kunta] = d22.kunta
	,[Koulutussektori] = d26.koulutussektori

	,[Oppilaitoksen omistajatyyppi] = d2.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d2.oppilaitostyyppi
	,[Oppilaitos] = d2.oppilaitos
	,[Oppilaitoksen suuralue] = d3.suuralue
	,[Oppilaitoksen kunnan kielisuhde] = d3.kielisuhde
	,[Oppilaitoksen AVI] = d3.avi
	,[Oppilaitoksen ELY] = d3.ely
	,[Oppilaitoksen maakunta] = d3.maakunta
	,[Oppilaitoksen seutukunta] = d3.seutukunta
	,[Oppilaitoksen sijaintikunnan kuntaryhmä] = d3.kuntaryhma
	,[Oppilaitoksen kunta] = d3.kunta
	,[Oppilaitoksen opetuskieli] = d2.opetuskieli
	--Historia
	,[Oppil. omistajatyyppi] = d2b.oppilaitoksen_omistajatyyppi
	,[Oppilaitoksen tyyppi] = d2b.oppilaitostyyppi
	,[Oppilaitos _] =  case when coalesce(nullif(d2b.oppilaitoksen_korvaavakoodi,null),'') = '' then d2b.oppilaitos else d2c.oppilaitos end --d2b.oppilaitos
	,[Oppilaitoskoodi] = case when coalesce(nullif(d2b.oppilaitoksen_korvaavakoodi,null),'') = '' then d2b.oppilaitoskoodi else right('0000'+d2b.[oppilaitoksen_korvaavakoodi],5) end --case when d2b.oppilaitoksen_korvaavakoodi is null then d2b.oppilaitoskoodi else d2c.oppilaitoskoodi end
	,[Oppil. suuralue] = d3b.suuralue
	,[Oppil. kunnan kielisuhde] = d3b.kielisuhde
	,[Oppil. AVI] = d3b.avi
	,[Oppil. ELY] = d3b.ely
	,[Oppil. maakunta] = d3b.maakunta
	,[Oppil. seutukunta] = d3b.seutukunta
	,[Oppil. sijaintikunnan kuntaryhmä] = d3b.kuntaryhma
	,[Oppil. kunta] = d3b.kunta
	,[Oppil. opetuskieli] = d2b.opetuskieli
	,[Koul. järjestäjä] = d2b.koulutuksen_jarjestaja

	,[Koulutuksen järjestäjä] = coalesce(nullif(d2d.koulutuksen_jarjestaja,'Tuntematon'),d2.koulutuksen_jarjestaja)--oppilaitos-dimensiosta puuttuu ilmeisesti koulutuksen järjestäjä -avaimia, joten haetaan puuttuva tieto oppilaitoksen perusteella
	,[Koulutuksen järjestäjän omistajatyyppi] = d2d.koulutuksen_jarjestajan_omistajatyyppi
	,[Koulutuksen järjestäjän suuralue] = d24.suuralue
	,[Koulutuksen järjestäjän kunnan kielisuhde] = d24.kielisuhde
	,[Koulutuksen järjestäjän AVI] = d24.avi
	,[Koulutuksen järjestäjän ELY] = d24.ely
	,[Koulutuksen järjestäjän maakunta] = d24.maakunta
	,[Koulutuksen järjestäjän seutukunta] = d24.seutukunta
	,[Koulutuksen järjestäjän sijaintikunnan kuntaryhmä] = d24.kuntaryhma
	,[Koulutuksen järjestäjän kunta] = d24.kunta

	,[Toimiala] = d28.toimiala_2008
	,[Työnantajasektori] = d29.tyonantajasektori
	,[Yrityksen koko] = d30.oppisopimus_yrityksen_koko

	--mittarit
	,[Aloittaneet2] = f.aloittaneet
	,[Opiskelijat2] = f.opiskelijat
	,[Tutkinnot2] = null
	,[Ammattiosaamisen näyttöjen lukumäärä] = null
	,[Ennen koulutuksen alkua hyväksiluettujen opintoviikkojen määrä] = null
	,[Koulutuksen aikana hyväksiluettujen opintoviikkojen määrä] = null
	,[Koulutuksen aikana suoritettujen opintoviikkojen määrä] = null
	,[Tutkinnon opintoviikot yhteensä] = null
	,[Työssäoppimisen opintoviikkojen määrä] = null
	,[Tutkintojen osien lukumäärä] = null

	--Ruotsi
	,[Statistikår] = f.tilv
	,[Kön] = d1.sukupuoli_SV
	,[Modersmål] = d5.aidinkieli_versio1_SV
	,[Åldersgrupp] = d9.ika5v_SV
	,[Ungdoms-/vuxenutbildning] = d4.nuorten_aikuisten_koulutus_SV
	,[Oppisopimus purkautunutSV] = d10.oppisopimus_purkautunut_SV
	,[Todistus oppisopimuskoulutuksen suorittamisestaSV] = d11.todistus_oppisopimuskoulutuksen_suorittamisesta_SV
	,[Yrittäjän oppisopimuskoulutusSV] = d12.yrittajan_oppisopimuskoulutus_SV
	,[Utbildningsslag] = d6.lukiokoulutuksen_koulutuslaji_SV
--	,[Förvaltningsområde] = d7.opetushallinnon_koulutus_SV
	,[Förvaltningsområde] = d7.hallinnonala_SV
	,[Utbildningens mål (studerandens mål i utbildningen)] = d8.tutkinnon_tavoite_SV
	,[Hela examen/del av en examen] = d27.koulutuksen_tavoite_toteuma_SV
	,[Sättet på vilket utbildningen ordnas] = d13.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_SV
	,[Formen i vilken utbildningen ordnas] = d14.koulutuksen_jarjestamismuoto_SV
	,[Utbildnings- och läroavtalsperioder] = d14b.selite_sv
	,[Typ av examen] = d15.ammatillisen_koulutuksen_koulutuslaji_SV
	,[Utbildningsområde] = d16.koulutusala2002_SV
	,[Studieområde] = d16.opintoala2002_SV
	,[Utbildningsbenämning] = d16.koulutus_SV
	,[Kompetensområde] = d17.koulutusohjelma_ammpk_SV
	,[Finansieringskälla] = d18.rahoituslahde_amm_SV
	,[Examensbeteckning] = d19.tutkintonimike_ammpk_SV
	,[Utbildningens språk] = d20.kieli_SV
	,[Työvoimapoliittinen koulutusSV] = d21.tyovoimapoliittinen_koulutus_SV
	,[Väg till fristående examen] = null
	,[Utbildningens storområde] = d22.suuralue_SV
	,[Utbildningens kommunens språkliga indelning] = d22.kielisuhde_SV
	,[Utbildningens RFV-område] = d22.avi_SV
	,[Utbildningens NMT-område] = d22.ely_SV
	,[Utbildningens landskap] = d22.maakunta_SV
	,[Utbildningens ekonomisk region] = d22.seutukunta_SV
	,[Utbildningens kommungrupp] = d22.kuntaryhma_SV
	,[Utbildningens kommun] = d22.kunta_SV

	,[Läroanstaltens ägartyp] = d2.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d2.oppilaitostyyppi_SV
	,[Läroanstalt] = d2.oppilaitos_SV
	,[Läroanstaltens storområde] = d3.suuralue_SV
	,[Läroanstaltens kommunens språkliga indelning] = d3.kielisuhde_SV
	,[Läroanstaltens RFV-område] = d3.avi_SV
	,[Läroanstaltens NMT-område] = d3.ely_SV
	,[Läroanstaltens landskap] = d3.maakunta_SV
	,[Läroanstaltens ekonomisk region] = d3.seutukunta_SV
	,[Läroanstaltens kommungrupp] = d3.kuntaryhma_SV
	,[Läroanstaltens kommun] = d3.kunta_SV
	,[Läroanstaltens undervisningsspråk] = d2.opetuskieli_SV
	--Historia
	,[Läroanstaltens ägartyp _] = d2b.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp _] = d2b.oppilaitostyyppi_SV
	,[Läroanstalt _] = d2b.oppilaitos_SV
	,[Läroanstaltens storområde _] = d3b.suuralue_SV
	,[Läroanstaltens kommunens språkliga indelning _] = d3b.kielisuhde_SV
	,[Läroanstaltens RFV-område _] = d3b.avi_SV
	,[Läroanstaltens NMT-område _] = d3b.ely_SV
	,[Läroanstaltens landskap _] = d3b.maakunta_SV
	,[Läroanstaltens ekonomisk region _] = d3b.seutukunta_SV
	,[Läroanstaltens kommungrupp _] = d3b.kuntaryhma_SV
	,[Läroanstaltens kommun _] = d3b.kunta_SV
	,[Läroanstaltens undervisningsspråk _] = d2b.opetuskieli_SV
	,[Utbildningsanordnare _] = d2b.koulutuksen_jarjestaja_SV
	--
	,[Utbildningsanordnare] = d2d.koulutuksen_jarjestaja_SV
	,[Utbildningsanordnarens ägartyp] = d2d.koulutuksen_jarjestajan_omistajatyyppi_SV
	,[Utbildningsanordnarens storområde] = d24.suuralue_SV
	,[Utbildningsanordnarens kommunens språkliga indelning] = d24.kielisuhde_SV
	,[Utbildningsanordnarens RFV-område] = d24.avi_SV
	,[Utbildningsanordnarens NMT-område] = d24.ely_SV
	,[Utbildningsanordnarens landskap] = d24.maakunta_SV
	,[Utbildningsanordnarens ekonomisk region] = d24.seutukunta_SV
	,[Utbildningsanordnarens kommungrupp] = d24.kuntaryhma_SV
	,[Utbildningsanordnarens kommun] = d24.kunta_SV

	,[Bransch] = d28.toimiala_2008_SV
	,[Arbetsgivarens sektor] = d29.tyonantajasektori_SV
	,[Företagets storlek] = d30.oppisopimus_yrityksen_koko_SV
	
	--Englanti
	,[Statistical year] = f.tilv
	,[Gender] = d1.sukupuoli_EN
	,[Mother tongue] = d5.aidinkieli_versio1_EN
	,[Age group] = d9.ika5v_EN
	,[Youth/adult education] = d4.nuorten_aikuisten_koulutus_EN
	,[Oppisopimus purkautunutEN] = d10.oppisopimus_purkautunut_EN
	,[Todistus oppisopimuskoulutuksen suorittamisestaEN] = d11.todistus_oppisopimuskoulutuksen_suorittamisesta_EN
	,[Yrittäjän oppisopimuskoulutusEN] = d12.yrittajan_oppisopimuskoulutus_EN
	,[Form of education and training] = d6.lukiokoulutuksen_koulutuslaji_EN
--	,[Administrative sector] = d7.opetushallinnon_koulutus_EN
	,[Administrative sector] = d7.hallinnonala_EN
	,[Objective of education (the student's objective for attaining education)] = d8.tutkinnon_tavoite_EN
	,[Complete qualification/module] = d27.koulutuksen_tavoite_toteuma_EN
	,[Method of vocational education and training] = d13.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_EN
	,[Form of vocational education and training] = d14.koulutuksen_jarjestamismuoto_EN
	,[Training agreement and apprenticeship training periods] = d14b.selite_en
	,[Qualification type] = d15.ammatillisen_koulutuksen_koulutuslaji_EN
	,[Field of education] = d16.koulutusala2002_EN
	,[Subfield of education] = d16.opintoala2002_EN
	,[Name of education] = d16.koulutus_EN
	,[Competence area] = d17.koulutusohjelma_ammpk_EN
	,[Source of funding] = d18.rahoituslahde_amm_EN
	,[Qualification title] = d19.tutkintonimike_ammpk_EN
	,[Language of education] = d20.kieli_EN
	,[Työvoimapoliittinen koulutusEN] = d21.tyovoimapoliittinen_koulutus_EN
	,[Route to competence-based qualification] = null
	,[Major region of education] = d22.suuralue_EN
	,[Lang. distribution of municipality of education] = d22.kielisuhde_EN
	,[AVI area of education] = d22.avi_EN
	,[ELY area of education] = d22.ely_EN
	,[Region of education] = d22.maakunta_EN
	,[Subregion of education] = d22.seutukunta_EN
	,[Municipality group of education] = d22.kuntaryhma_EN
	,[Municipality of education] = d22.kunta_EN

	,[Type of institution owner] = d2.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d2.oppilaitostyyppi_EN
	,[Educational institution] = d2.oppilaitos_EN
	,[Major region of the institution] = d3.suuralue_EN
	,[Lang. distribution of municipality of the institution] = d3.kielisuhde_EN
	,[AVI area of the institution] = d3.avi_EN
	,[ELY area of the institution] = d3.ely_EN
	,[Region of the institution] = d3.maakunta_EN
	,[Subregion of the institution] = d3.seutukunta_EN
	,[Municipality group of the institution] = d3.kuntaryhma_EN
	,[Municipality of the institution] = d3.kunta_EN
	,[Language of the institution] = d2.opetuskieli_EN
	--Historia
	,[Type of institution owner _] = d2b.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution _] = d2b.oppilaitostyyppi_EN
	,[Educational institution _] = d2b.oppilaitos_EN
	,[Major region of the institution _] = d3b.suuralue_EN
	,[Langb. distribution of municipality of the institution _] = d3b.kielisuhde_EN
	,[AVI area of the institution _] = d3b.avi_EN
	,[ELY area of the institution _] = d3b.ely_EN
	,[Region of the institution _] = d3b.maakunta_EN
	,[Subregion of the institution _] = d3b.seutukunta_EN
	,[Municipality group of the institution _] = d3b.kuntaryhma_EN
	,[Municipality of the institution _] = d3b.kunta_EN
	,[Language of the institution _] = d2b.opetuskieli_EN
	,[Education provider _] = d2b.koulutuksen_jarjestaja_EN
	--
	,[Education provider] = d2d.koulutuksen_jarjestaja_EN
	,[Type of education provider owner] = d2d.koulutuksen_jarjestajan_omistajatyyppi_EN
	,[Major region of the education provider] = d24.suuralue_EN
	,[Lang. distribution of municipality of the education provider] = d24.kielisuhde_EN
	,[AVI area of the education provider] = d24.avi_EN
	,[ELY area of the education provider] = d24.ely_EN
	,[Region of the education provider] = d24.maakunta_EN
	,[Subregion of the education provider] = d24.seutukunta_EN
	,[Municipality group of the education provider] = d24.kuntaryhma_EN
	,[Municipality of the education provider] = d24.kunta_EN

	,[Industry] = d28.toimiala_2008_EN
	,[Employer sector] = d29.tyonantajasektori_EN
	,[Employer size] = d30.oppisopimus_yrityksen_koko_EN

	--koodimuuttujat
	,[Koodit Oppilaitoksen maakunta] = d3.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d3.kunta_koodi
	,[Koodit Koulutuksen maakunta] = d22.maakunta_koodi
	,[Koodit Koulutuksen kunta] = d22.kunta_koodi
	,[Koodit Koulutuksen järjestäjän maakunta] = d24.maakunta_koodi
	,[Koodit Koulutuksen järjestäjän kunta] = d24.kunta_koodi
	,[Koodit Koulutusala] = d16.koulutusala2002_koodi
	,[Koodit Opintoala] = d16.opintoala2002_koodi
	,[Koodit Koulutusnimike] = d16.koulutus_koodi
	,[Koodit Osaamisala] = d17.koulutusohjelma_ammpk_koodi
	,[Koodit Koulutuksen järjestäjä] = d2d.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d2.oppilaitoskoodi
	,d16.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
	,d16.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
	,d16.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
	,d16.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
	,d16.iscfi2013_koodi as "Koodit Koulutusala, taso 3"

	--isced
	,d16.iscle2011 as "Koulutusaste, taso 1"
	,d16.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	,d16.iscfibroad2013 as "Koulutusala, taso 1"
	,d16.iscfinarrow2013 as "Koulutusala, taso 2"
	,d16.iscfi2013 as "Koulutusala, taso 3"
	,d16.iscle2011_SV as "Utbildn.nivå, nivå 1"
	,d16.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	,d16.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	,d16.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	,d16.iscfi2013_SV as "Utbildn.område, nivå 3"
	,d16.iscle2011_EN as "Level of education, tier 1"
	,d16.Koulutusaste_taso2_EN as "Level of education, tier 2"
	,d16.iscfibroad2013_EN as "Field of education, tier 1"
	,d16.iscfinarrow2013_EN as "Field of education, tier 2"
	,d16.iscfi2013_EN as "Field of education, tier 3"
	,d16.jarjestys_iscle2011 as jarj_isced_koulast1
	,d16.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
	,d16.jarjestys_iscfibroad2013 as jarj_isced_koulala1
	,d16.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
	,d16.jarjestys_iscfi2013 as jarj_isced_koulala3

	--järjestys
	,[Sukupuoli jarj] = d1.jarjestys
	,[Äidinkieli jarj] = d5.jarjestys
	,[Ikäryhmä jarj] = d9.jarjestys_ika5v
	,[Nuorten/aikuisten jarj] = d4.jarjestys
	,[Oppisopimus purkautunut jarj] = d10.jarjestys
	,[Todistus oppisopimuskoulutuksen suorittamisesta jarj] = d11.jarjestys
	,[Yrittäjän oppisopimuskoulutus jarj] = d12.jarjestys
	,[Koulutuslaji jarj] = d6.jarjestys
	,[Hallinnonala jarj] = d7.jarjestys
	,[Koulutuksen tavoite jarj] = d8.jarjestys
	,[Koko tutkinto / tutk. osa jarj] = d27.jarjestys
	,[Järjestämistapa jarj] = d13.jarjestys
	,[Järjestämismuoto jarj] = d14.jarjestys
	,[Koulutus- ja oppisopimusjaksot jarj] = d14b.jarjestys_koodi
	,[Tutkintotyyppi jarj] = d15.jarjestys
	,[Koulutusala jarj] = d16.jarjestys_koulutusala2002
	,[Opintoala jarj] = d16.jarjestys_opintoala2002
	,[Koulutusnimike jarj] = d16.jarjestys
	,[Osaamisala jarj] = d17.jarjestys
	,[Rahoituslähde jarj] = d18.jarjestys
	,[Tutkintonimike jarj] = d19.jarjestys
	,[Koulutuksen kieli jarj] = d20.jarjestys
	,[Työvoimapoliittinen koulutus jarj] = d21.jarjestys
	,[Väylä näyttötutkintoon jarj] = null
	,[Koulutuksen suuralue jarj] = d22.jarjestys_suuralue
	,[Koulutuksen kunnan kielisuhde jarj] = d22.jarjestys_kielisuhde
	,[Koulutuksen AVI jarj] = d22.jarjestys_avi
	,[Koulutuksen ELY jarj] = d22.jarjestys_ely
	,[Koulutuksen maakunta jarj] = d22.jarjestys_maakunta
	,[Koulutuksen seutukunta jarj] = d22.jarjestys_seutukunta
	,[Koulutuksen sijaintikunnan kuntaryhmä jarj] = d22.jarjestys_kuntaryhma
	,[Oppilaitoksen omistajatyyppi jarj] = d2.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi jarj] = d2.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen suuralue jarj] = d3.jarjestys_suuralue
	,[Oppilaitoksen AVI jarj] = d3.jarjestys_avi
	,[Oppilaitoksen ELY jarj] = d3.jarjestys_ely
	,[Oppilaitoksen maakunta jarj] = d3.jarjestys_maakunta
	,[Oppilaitoksen seutukunta jarj] = d3.jarjestys_seutukunta
	,[Oppilaitoksen kuntaryhmä jarj] = d3.jarjestys_kuntaryhma
	,[Oppilaitoksen kielisuhde jarj] = d3.jarjestys_kielisuhde
	,[Oppilaitoksen opetuskieli jarj] = d2.jarjestys_opetuskieli
	,[Koulutuksen järjestäjän omistajatyyppi jarj] = d2.jarjestys_omistajatyyppi
	,[Koulutuksen järjestäjän suuralue jarj] = d24.jarjestys_suuralue
	,[Koulutuksen järjestäjän kunnan kielisuhde jarj] = d24.jarjestys_kielisuhde
	,[Koulutuksen järjestäjän AVI jarj] = d24.jarjestys_avi
	,[Koulutuksen järjestäjän ELY jarj] = d24.jarjestys_ely
	,[Koulutuksen järjestäjän maakunta jarj] = d24.jarjestys_maakunta
	,[Koulutuksen järjestäjän seutukunta jarj] = d24.jarjestys_seutukunta
	,[Koulutuksen järjestäjän sijaintikunnan kuntaryhmä jarj] = d24.jarjestys_kuntaryhma
	,[Toimiala jarj] = d28.jarjestys
	,[Työnantaja jarj] = d29.jarjestys
	,[Yrityksen koko jarj] = d30.jarjestys
	,[TUVA-opiskeluoikeus jarjestys] = d31.jarjestys
	--Historia
	,[Oppil. omistajatyyppi jarj] = d2b.jarjestys_omistajatyyppi
	,[Oppilaitoksen tyyppi jarj] = d2b.jarjestys_oppilaitostyyppi
	,[Oppil. maakunta jarj] = d3b.jarjestys_maakunta
	,[Oppil. opetuskieli jarj] = d2b.jarjestys_opetuskieli
	


from [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2 on d2.id=f.yht_oppilaitos_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d2b on d2b.id=f.oppilaitos_historia_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d2c on SUBSTRING(d2c.oppilaitos_avain, PATINDEX('%[^0]%', d2c.oppilaitos_avain), LEN(d2c.oppilaitos_avain))=d2b.oppilaitoksen_korvaavakoodi and tilv between d2c.alkaa and d2c.paattyy
left join VipunenTK.dbo.d_alueluokitus d3 on d3.id=f.yht_oppilaitos_kunta_id
left join VipunenTK.dbo.d_alueluokitus_historia d3b on d3b.id=f.yht_oppilaitos_kunta_historia_id
left join VipunenTK.dbo.d_nuorten_aikuisten_koulutus d4 on d4.id=f.nuorten_aikuisten_koulutus_id
left join VipunenTK.dbo.d_aidinkieli_versio1 d5 on d5.id=f.aidinkieli_versio1_id
left join VipunenTK.dbo.d_lukiokoulutuksen_koulutuslaji d6 on d6.id=f.lukiokoulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_hallinnonala2 d7 on d7.id=f.hallinnonala2_id
--left join VipunenTK.dbo.d_opetushallinnon_koulutus d7 on d7.id=f.opetushallinnon_koulutus_id
left join VipunenTK.dbo.d_tutkinnon_tavoite d8 on d8.id=f.tutkinnon_tavoite_id
left join VipunenTK.dbo.d_ika d9 on d9.id=f.ika_5v_id
left join VipunenTK.dbo.d_oppisopimus_purkautunut d10 on d10.id=f.oppisopimus_purkautunut_id
left join VipunenTK.dbo.d_todistus_oppisopimuskoulutuksen_suorittamisesta d11 on d11.id=f.todistus_oppisopimuskoulutuksen_suorittamisesta_id
left join VipunenTK.dbo.d_yrittajan_oppisopimuskoulutus d12 on d12.id=f.yrittajan_oppisopimuskoulutus_id
left join VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d13 on d13.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
left join VipunenTK.dbo.d_koulutuksen_jarjestamismuoto d14 on d14.id=f.koulutuksen_jarjestamismuoto_id
left join VipunenTK.dbo.d_amm_sopimusjaksot d14b on d14b.id=f.amm_sopimusjaksot_id
left join VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d15 on d15.id=f.ammatillisen_koulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_koulutusluokitus d16 on d16.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_koulutusohjelma_ammpk d17 on d17.id=f.koulutusohjelma_ammpk_id
left join VipunenTK.dbo.d_rahoituslahde_amm d18 on d18.id=f.rahoituslahde_amm_id
left join VipunenTK.dbo.d_tutkintonimike_ammpk d19 on d19.id=f.tutkintonimike_ammpk_id
left join VipunenTK.dbo.d_kieli d20 on d20.id=f.koulutuksen_kieli_id
left join VipunenTK.dbo.d_tyovoimapoliittinen_koulutus d21 on d21.id=f.tyovoimapoliittinen_id
left join VipunenTK.dbo.d_alueluokitus d22 on d22.id=f.yht_koulutuksen_kunta_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2d on d2d.id=f.yht_koulutuksen_jarjestaja_id
left join VipunenTK.dbo.d_alueluokitus d24 on d24.id=f.yht_koulutuksen_jarjestaja_kunta_id
left join VipunenTK.dbo.d_koulutussektori d26 on d26.id=f.koulutussektori_id
left join VipunenTK.dbo.d_koulutuksen_tavoite_toteuma d27 on d27.id=f.koulutuksen_tavoite_toteuma_id
left join VipunenTK.dbo.d_toimiala_2008 d28 on d28.id=f.toimiala_2008_id
left join VipunenTK.dbo.d_tyonantajasektori d29 on d29.id=f.tyonantajasektori_id
left join VipunenTK.dbo.d_oppisopimus_yrityksen_koko d30 on d30.id=f.oppisopimus_yrityksen_koko_id

left join VipunenTK.dbo.d_kylla_ei d31 on d31.id=f.tuva_opiskeluoikeus_amm_id 

UNION ALL

--tutkinnot
select --top 100
	[Tilastovuosi] = f.tilastointivuosi
	
	,[Sukupuoli] = d1.sukupuoli
	,[Äidinkieli] = d5.aidinkieli_versio1
	,[Ikäryhmä] = d9.ika5v
	,[Nuorten/aikuisten koul.] = d4.nuorten_aikuisten_koulutus
	,[Oppisopimus purkautunut] = d10.oppisopimus_purkautunut
	,[Todistus oppisopimuskoulutuksen suorittamisesta] = d11.todistus_oppisopimuskoulutuksen_suorittamisesta
	,[Yrittäjän oppisopimuskoulutus] = d12.yrittajan_oppisopimuskoulutus
	,[TUVA-opiskeluoikeus] = d32.kylla_ei
	,[Koulutuslaji] = null
--	,[Hallinnonala] = d7.opetushallinnon_koulutus
	,[Hallinnonala] = d7.hallinnonala
	,[Koulutuksen tavoite] = null
	,[Tutkinnon toteuma] = d31.tutkinnon_toteuma
	,[Koko tutkinto / tutk. osa] = d27.koulutuksen_tavoite_toteuma
	,[Järjestämistapa] = d13.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	,[Järjestämismuoto] = d14.koulutuksen_jarjestamismuoto
	,[Koulutus- ja oppisopimusjaksot] = d14b.selite_fi
	,[Tutkintotyyppi] = d15.ammatillisen_koulutuksen_koulutuslaji
	,[Koulutusala] = d16.koulutusala2002
	,[Opintoala] = d16.opintoala2002
	,[Koulutusnimike] = d16.koulutus
	,[Osaamisala] = d17.koulutusohjelma_ammpk
	,[Rahoituslähde] = d18.rahoituslahde_amm
	,[Tutkintonimike] = d19.tutkintonimike_ammpk
	,[Koulutuksen kieli] = d20.kieli
	,[Työvoimapoliittinen koulutus] = d21.tyovoimapoliittinen_koulutus
	,[Väylä näyttötutkintoon] = d25.vayla_nayttotutkintoon	
	,[Koulutuksen suuralue] = d22.suuralue
	,[Koulutuksen kunnan kielisuhde] = d22.kielisuhde
	,[Koulutuksen AVI] = d22.avi
	,[Koulutuksen ELY] = d22.ely
	,[Koulutuksen maakunta] = d22.maakunta
	,[Koulutuksen seutukunta] = d22.seutukunta
	,[Koulutuksen sijaintikunnan kuntaryhmä] = d22.kuntaryhma
	,[Koulutuksen kunta] = d22.kunta
	,[Koulutussektori] = d26.koulutussektori

	,[Oppilaitoksen omistajatyyppi] = d2.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d2.oppilaitostyyppi
	,[Oppilaitos] = d2.oppilaitos
	,[Oppilaitoksen suuralue] = d3.suuralue
	,[Oppilaitoksen kunnan kielisuhde] = d3.kielisuhde
	,[Oppilaitoksen AVI] = d3.avi
	,[Oppilaitoksen ELY] = d3.ely
	,[Oppilaitoksen maakunta] = d3.maakunta
	,[Oppilaitoksen seutukunta] = d3.seutukunta
	,[Oppilaitoksen sijaintikunnan kuntaryhmä] = d3.kuntaryhma
	,[Oppilaitoksen kunta] = d3.kunta
	,[Oppilaitoksen opetuskieli] = d2.opetuskieli
	--Historia
	,[Oppil. omistajatyyppi] = d2b.oppilaitoksen_omistajatyyppi
	,[Oppilaitoksen tyyppi] = d2b.oppilaitostyyppi
	,[Oppilaitos _] =  case when coalesce(nullif(d2b.oppilaitoksen_korvaavakoodi,''),'') = '' then d2b.oppilaitos else d2c.oppilaitos end --d2b.oppilaitos
	,[Oppilaitoskoodi] = case when coalesce(nullif(d2b.oppilaitoksen_korvaavakoodi,''),'') = '' then d2b.oppilaitoskoodi else right('0000'+d2b.[oppilaitoksen_korvaavakoodi],5) end --case when d2b.oppilaitoksen_korvaavakoodi is null then d2b.oppilaitoskoodi else d2c.oppilaitoskoodi end
	,[Oppil. suuralue] = d3b.suuralue
	,[Oppil. kunnan kielisuhde] = d3b.kielisuhde
	,[Oppil. AVI] = d3b.avi
	,[Oppil. ELY] = d3b.ely
	,[Oppil. maakunta] = d3b.maakunta
	,[Oppil. seutukunta] = d3b.seutukunta
	,[Oppil. sijaintikunnan kuntaryhmä] = d3b.kuntaryhma
	,[Oppil. kunta] = d3b.kunta
	,[Oppil. opetuskieli] = d2b.opetuskieli
	,[Koul. järjestäjä] = d2b.koulutuksen_jarjestaja

	,[Koulutuksen järjestäjä] = coalesce(nullif(d2d.koulutuksen_jarjestaja,'Tuntematon'),d2.koulutuksen_jarjestaja)--oppilaitos-dimensiosta puuttuu ilmeisesti koulutuksen järjestäjä -avaimia, joten haetaan puuttuva tieto oppilaitoksen perusteella
	,[Koulutuksen järjestäjän omistajatyyppi] = d2d.koulutuksen_jarjestajan_omistajatyyppi
	,[Koulutuksen järjestäjän suuralue] = d24.suuralue
	,[Koulutuksen järjestäjän kunnan kielisuhde] = d24.kielisuhde
	,[Koulutuksen järjestäjän AVI] = d24.avi
	,[Koulutuksen järjestäjän ELY] = d24.ely
	,[Koulutuksen järjestäjän maakunta] = d24.maakunta
	,[Koulutuksen järjestäjän seutukunta] = d24.seutukunta
	,[Koulutuksen järjestäjän sijaintikunnan kuntaryhmä] = d24.kuntaryhma
	,[Koulutuksen järjestäjän kunta] = d24.kunta

	,[Toimiala] = d28.toimiala_2008
	,[Työnantajasektori] = d29.tyonantajasektori
	,[Yrityksen koko] = d30.oppisopimus_yrityksen_koko

	--mittarit
	,[Aloittaneet2] = 0
	,[Opiskelijat2] = 0
	,[Tutkinnot2] = f.lukumaara
	,[Ammattiosaamisen näyttöjen lukumäärä] = f.lkm_ammattiosaaminen
	,[Ennen koulutuksen alkua hyväksiluettujen opintoviikkojen määrä] = f.ov_hyvaksiluettu_ennen
	,[Koulutuksen aikana hyväksiluettujen opintoviikkojen määrä] = f.ov_hyvaksiluettu_aikana
	,[Koulutuksen aikana suoritettujen opintoviikkojen määrä] = f.ov_suoritettu_koulutuksen_aikana
	,[Tutkinnon opintoviikot yhteensä] = f.ov_yhteensa
	,[Työssäoppimisen opintoviikkojen määrä] = f.ov_tyossaoppiminen
	,[Tutkintojen osien lukumäärä] = f.lkm_opintokokonaisuus

	--Ruotsi
	,[Statistikår] = f.tilastointivuosi
	,[Kön] = d1.sukupuoli_SV
	,[Modersmål] = d5.aidinkieli_versio1_SV
	,[Åldersgrupp] = d9.ika5v_SV
	,[Ungdoms-/vuxenutbildning] = d4.nuorten_aikuisten_koulutus_SV
	,[Oppisopimus purkautunutSV] = d10.oppisopimus_purkautunut_SV
	,[Todistus oppisopimuskoulutuksen suorittamisestaSV] = d11.todistus_oppisopimuskoulutuksen_suorittamisesta_SV
	,[Yrittäjän oppisopimuskoulutusSV] = d12.yrittajan_oppisopimuskoulutus_SV
	,[Utbildningsslag] = null
--	,[Förvaltningsområde] = d7.opetushallinnon_koulutus_SV
	,[Förvaltningsområde] = d7.hallinnonala_SV
	,[Utbildningens mål (studerandens mål i utbildningen)] = d8.tutkinnon_tavoite_SV
	,[Hela examen/del av en examen] = d27.koulutuksen_tavoite_toteuma_SV
	,[Sättet på vilket utbildningen ordnas] = d13.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_SV
	,[Formen i vilken utbildningen ordnas] = d14.koulutuksen_jarjestamismuoto_SV
	,[Utbildnings- och läroavtalsperioder] = d14b.selite_sv
	,[Typ av examen] = d15.ammatillisen_koulutuksen_koulutuslaji_SV
	,[Utbildningsområde] = d16.koulutusala2002_SV
	,[Studieområde] = d16.opintoala2002_SV
	,[Utbildningsbenämning] = d16.koulutus_SV
	,[Kompetensområde] = d17.koulutusohjelma_ammpk_SV
	,[Finansieringskälla] = d18.rahoituslahde_amm_SV
	,[Examensbeteckning] = d19.tutkintonimike_ammpk_SV
	,[Utbildningens språk] = d20.kieli_SV
	,[Työvoimapoliittinen koulutusSV] = d21.tyovoimapoliittinen_koulutus_SV
	,[Väg till fristående examen] = d25.vayla_nayttotutkintoon_SV
	,[Utbildningens område] = d22.suuralue_SV
	,[Utbildningens kommunens språkliga indelning] = d22.kielisuhde_SV
	,[Utbildningens RFV-område] = d22.avi_SV
	,[Utbildningens NMT-område] = d22.ely_SV
	,[Utbildningens landskap] = d22.maakunta_SV
	,[Utbildningens ekonomisk region] = d22.seutukunta_SV
	,[Utbildningens kommungrupp] = d22.kuntaryhma_SV
	,[Utbildningens kommun] = d22.kunta_SV

	,[Läroanstaltens ägartyp] = d2.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d2.oppilaitostyyppi_SV
	,[Läroanstalt] = d2.oppilaitos_SV
	,[Läroanstaltens storområde] = d3.suuralue_SV
	,[Läroanstaltens kommunens språkliga indelning] = d3.kielisuhde_SV
	,[Läroanstaltens RFV-område] = d3.avi_SV
	,[Läroanstaltens NMT-område] = d3.ely_SV
	,[Läroanstaltens landskap] = d3.maakunta_SV
	,[Läroanstaltens ekonomisk region] = d3.seutukunta_SV
	,[Läroanstaltens kommungrupp] = d3.kuntaryhma_SV
	,[Läroanstaltens kommun] = d3.kunta_SV
	,[Läroanstaltens undervisningsspråk] = d2.opetuskieli_SV
	--Historia
	,[Läroanstaltens ägartyp _] = d2b.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp _] = d2b.oppilaitostyyppi_SV
	,[Läroanstalt _] = d2b.oppilaitos_SV
	,[Läroanstaltens storområde _] = d3b.suuralue_SV
	,[Läroanstaltens kommunens språkliga indelning _] = d3b.kielisuhde_SV
	,[Läroanstaltens RFV-område _] = d3b.avi_SV
	,[Läroanstaltens NMT-område _] = d3b.ely_SV
	,[Läroanstaltens landskap _] = d3b.maakunta_SV
	,[Läroanstaltens ekonomisk region _] = d3b.seutukunta_SV
	,[Läroanstaltens kommungrupp _] = d3b.kuntaryhma_SV
	,[Läroanstaltens kommun _] = d3b.kunta_SV
	,[Läroanstaltens undervisningsspråk _] = d2b.opetuskieli_SV
	,[Utbildningsanordnare _] = d2b.koulutuksen_jarjestaja_SV
	--
	,[Utbildningsordnare] = d2d.koulutuksen_jarjestaja_SV
	,[Utbildningsanordnarens ägartyp] = d2d.koulutuksen_jarjestajan_omistajatyyppi_SV
	,[Utbildningsordnarens storområde] = d24.suuralue_SV
	,[Utbildningsordnarens kommunens språkliga indelning] = d24.kielisuhde_SV
	,[Utbildningsordnarens RFV-område] = d24.avi_SV
	,[Utbildningsordnarens NMT-område] = d24.ely_SV
	,[Utbildningsordnarens landskap] = d24.maakunta_SV
	,[Utbildningsordnarens ekonomisk region] = d24.seutukunta_SV
	,[Utbildningsordnarens kommungrupp] = d24.kuntaryhma_SV
	,[Utbildningsordnarens kommun] = d24.kunta_SV

	,[Bransch] = d28.toimiala_2008_SV
	,[Arbetsgivarens sektor] = d29.tyonantajasektori_SV
	,[Företagets storlek] = d30.oppisopimus_yrityksen_koko_SV
	
	--Englanti
	,[Statistical year] = f.tilastointivuosi
	,[Gender] = d1.sukupuoli_EN
	,[Mother tongue] = d5.aidinkieli_versio1_EN
	,[Age group] = d9.ika5v_EN
	,[Youth/adult education] = d4.nuorten_aikuisten_koulutus_EN
	,[Oppisopimus purkautunutEN] = d10.oppisopimus_purkautunut_EN
	,[Todistus oppisopimuskoulutuksen suorittamisestaEN] = d11.todistus_oppisopimuskoulutuksen_suorittamisesta_EN
	,[Yrittäjän oppisopimuskoulutusEN] = d12.yrittajan_oppisopimuskoulutus_EN
	,[Form of education and training] = null
--	,[Administrative sector] = d7.opetushallinnon_koulutus_EN
	,[Administrative sector] = d7.hallinnonala_EN
	,[Objective of education (the student's objective for attaining education)] = d8.tutkinnon_tavoite_EN
	,[Complete qualification/module] = d27.koulutuksen_tavoite_toteuma_EN
	,[Method of vocational education and training] = d13.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_EN
	,[Form of vocational education and training] = d14.koulutuksen_jarjestamismuoto_EN
	,[Training agreement and apprenticeship training periods] = d14b.selite_en
	,[Qualification type] = d15.ammatillisen_koulutuksen_koulutuslaji_EN
	,[Field of education] = d16.koulutusala2002_EN
	,[Subfield of education] = d16.opintoala2002_EN
	,[Name of education] = d16.koulutus_EN
	,[OsaamisalaEN] = d17.koulutusohjelma_ammpk_EN
	,[Source of funding] = d18.rahoituslahde_amm_EN
	,[Qualification title] = d19.tutkintonimike_ammpk_EN
	,[Language of education] = d20.kieli_EN
	,[Työvoimapoliittinen koulutusEN] = d21.tyovoimapoliittinen_koulutus_EN
	,[Route to competence-based qualification] = d25.vayla_nayttotutkintoon_EN
	,[Major region of education] = d22.suuralue_EN
	,[Lang. distribution of municipality of education] = d22.kielisuhde_EN
	,[AVI area of education] = d22.avi_EN
	,[ELY area of education] = d22.ely_EN
	,[Region of education] = d22.maakunta_EN
	,[Subregion of education] = d22.seutukunta_EN
	,[Municipality group of education] = d22.kuntaryhma_EN
	,[Municipality of ecucation] = d22.kunta_EN

	,[Type of institution owner] = d2.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d2.oppilaitostyyppi_EN
	,[Educational institution] = d2.oppilaitos_EN
	,[Major region of the institution] = d3.suuralue_EN
	,[Lang. distribution of municipality of the institution] = d3.kielisuhde_EN
	,[AVI area of the institution] = d3.avi_EN
	,[ELY area of the institution] = d3.ely_EN
	,[Region of the institution] = d3.maakunta_EN
	,[Subregion of the institution] = d3.seutukunta_EN
	,[Municipality group of the institution] = d3.kuntaryhma_EN
	,[Municipality of the institution] = d3.kunta_EN
	,[Language of the institution] = d2.opetuskieli_EN
	--Historia
	,[Type of institution owner _] = d2b.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution _] = d2b.oppilaitostyyppi_EN
	,[Educational institution _] = d2b.oppilaitos_EN
	,[Major region of the institution _] = d3b.suuralue_EN
	,[Langb. distribution of municipality of the institution _] = d3b.kielisuhde_EN
	,[AVI area of the institution _] = d3b.avi_EN
	,[ELY area of the institution _] = d3b.ely_EN
	,[Region of the institution _] = d3b.maakunta_EN
	,[Subregion of the institution _] = d3b.seutukunta_EN
	,[Municipality group of the institution _] = d3b.kuntaryhma_EN
	,[Municipality of the institution _] = d3b.kunta_EN
	,[Language of the institution _] = d2b.opetuskieli_EN
	,[Education provider _] = d2b.koulutuksen_jarjestaja_EN
	--
	,[Education provider] = d2d.koulutuksen_jarjestaja_EN
	,[Type of education provider owner] = d2d.koulutuksen_jarjestajan_omistajatyyppi_EN
	,[Major region of the education provider] = d24.suuralue_EN
	,[Lang. distribution of municipality of the education provider] = d24.kielisuhde_EN
	,[AVI area of the education provider] = d24.avi_EN
	,[ELY area of the education provider] = d24.ely_EN
	,[Region of the education provider] = d24.maakunta_EN
	,[Subregion of the education provider] = d24.seutukunta_EN
	,[Municipality group of the education provider] = d24.kuntaryhma_EN
	,[Municipality of the education provider] = d24.kunta_EN

	,[Industry] = d28.toimiala_2008_EN
	,[Employer sector] = d29.tyonantajasektori_EN
	,[Employer size] = d30.oppisopimus_yrityksen_koko_EN

	--koodimuuttujat
	,[Koodit Oppilaitoksen maakunta] = d3.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d3.kunta_koodi
	,[Koodit Koulutuksen maakunta] = d22.maakunta_koodi
	,[Koodit Koulutuksen kunta] = d22.kunta_koodi
	,[Koodit Koulutuksen järjestäjän maakunta] = d24.maakunta_koodi
	,[Koodit Koulutuksen järjestäjän kunta] = d24.kunta_koodi
	,[Koodit Koulutusala] = d16.koulutusala2002_koodi
	,[Koodit Opintoala] = d16.opintoala2002_koodi
	,[Koodit Koulutusnimike] = d16.koulutus_koodi
	,[Koodit Osaamisala] = d17.koulutusohjelma_ammpk_koodi
	,[Koodit Koulutuksen järjestäjä] = d2d.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d2.oppilaitoskoodi
	,d16.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
	,d16.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
	,d16.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
	,d16.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
	,d16.iscfi2013_koodi as "Koodit Koulutusala, taso 3"

	--isced
	,d16.iscle2011 as "Koulutusaste, taso 1"
	,d16.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	,d16.iscfibroad2013 as "Koulutusala, taso 1"
	,d16.iscfinarrow2013 as "Koulutusala, taso 2"
	,d16.iscfi2013 as "Koulutusala, taso 3"
	,d16.iscle2011_SV as "Utbildn.nivå, nivå 1"
	,d16.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	,d16.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	,d16.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	,d16.iscfi2013_SV as "Utbildn.område, nivå 3"
	,d16.iscle2011_EN as "Level of education, tier 1"
	,d16.Koulutusaste_taso2_EN as "Level of education, tier 2"
	,d16.iscfibroad2013_EN as "Field of education, tier 1"
	,d16.iscfinarrow2013_EN as "Field of education, tier 2"
	,d16.iscfi2013_EN as "Field of education, tier 3"
	,d16.jarjestys_iscle2011 as jarj_isced_koulast1
	,d16.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
	,d16.jarjestys_iscfibroad2013 as jarj_isced_koulala1
	,d16.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
	,d16.jarjestys_iscfi2013 as jarj_isced_koulala3

	--järjestys
	,[Sukupuoli jarj] = d1.jarjestys
	,[Äidinkieli jarj] = d5.jarjestys
	,[Ikäryhmä jarj] = d9.jarjestys_ika5v
	,[Nuorten/aikuisten jarj] = d4.jarjestys
	,[Oppisopimus purkautunut jarj] = d10.jarjestys
	,[Todistus oppisopimuskoulutuksen suorittamisesta jarj] = d11.jarjestys
	,[Yrittäjän oppisopimuskoulutus jarj] = d12.jarjestys
	,[Koulutuslaji jarj] = 99
	,[Hallinnonala jarj] = d7.jarjestys
	,[Koulutuksen tavoite jarj] = d8.jarjestys
	,[Koko tutkinto / tutk. osa jarj] = d27.jarjestys
	,[Järjestämistapa jarj] = d13.jarjestys
	,[Järjestämismuoto jarj] = d14.jarjestys
	,[Koulutus- ja oppisopimusjaksot jarj] = d14b.jarjestys_koodi
	,[Tutkintotyyppi jarj] = d15.jarjestys
	,[Koulutusala jarj] = d16.jarjestys_koulutusala2002
	,[Opintoala jarj] = d16.jarjestys_opintoala2002
	,[Koulutusnimike jarj] = d16.jarjestys
	,[Osaamisala jarj] = d17.jarjestys
	,[Rahoituslähde jarj] = d18.jarjestys
	,[Tutkintonimike jarj] = d19.jarjestys
	,[Koulutuksen kieli jarj] = d20.jarjestys
	,[Työvoimapoliittinen koulutus jarj] = d21.jarjestys
	,[Väylä näyttötutkintoon jarj] = d25.jarjestys
	,[Koulutuksen suuralue jarj] = d22.jarjestys_suuralue
	,[Koulutuksen kunnan kielisuhde jarj] = d22.jarjestys_kielisuhde
	,[Koulutuksen AVI jarj] = d22.jarjestys_avi
	,[Koulutuksen ELY jarj] = d22.jarjestys_ely
	,[Koulutuksen maakunta jarj] = d22.jarjestys_maakunta
	,[Koulutuksen seutukunta jarj] = d22.jarjestys_seutukunta
	,[Koulutuksen sijaintikunnan kuntaryhmä jarj] = d22.jarjestys_kuntaryhma
	,[Oppilaitoksen omistajatyyppi jarj] = d2.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi jarj] = d2.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen suuralue jarj] = d3.jarjestys_suuralue
	,[Oppilaitoksen AVI jarj] = d3.jarjestys_avi
	,[Oppilaitoksen ELY jarj] = d3.jarjestys_ely
	,[Oppilaitoksen maakunta jarj] = d3.jarjestys_maakunta
	,[Oppilaitoksen seutukunta jarj] = d3.jarjestys_seutukunta
	,[Oppilaitoksen kuntaryhmä jarj] = d3.jarjestys_kuntaryhma
	,[Oppilaitoksen kielisuhde jarj] = d3.jarjestys_kielisuhde
	,[Oppilaitoksen opetuskieli jarj] = d2.jarjestys_opetuskieli
	,[Koulutuksen järjestäjän omistajatyyppi jarj] = d2.jarjestys_omistajatyyppi
	,[Koulutuksen järjestäjän suuralue jarj] = d24.jarjestys_suuralue
	,[Koulutuksen järjestäjän kunnan kielisuhde jarj] = d24.jarjestys_kielisuhde
	,[Koulutuksen järjestäjän AVI jarj] = d24.jarjestys_avi
	,[Koulutuksen järjestäjän ELY jarj] = d24.jarjestys_ely
	,[Koulutuksen järjestäjän maakunta jarj] = d24.jarjestys_maakunta
	,[Koulutuksen järjestäjän seutukunta jarj] = d24.jarjestys_seutukunta
	,[Koulutuksen järjestäjän sijaintikunnan kuntaryhmä jarj] = d24.jarjestys_kuntaryhma
	,[Toimiala jarj] = d28.jarjestys
	,[Työnantaja jarj] = d29.jarjestys
	,[Yrityksen koko jarj] = d30.jarjestys
	,[TUVA-opiskeluoikeus jarjestys] = d32.jarjestys
	--Historia
	,[Oppil. omistajatyyppi jarj] = d2b.jarjestys_omistajatyyppi
	,[Oppilaitoksen tyyppi jarj] = d2b.jarjestys_oppilaitostyyppi
	,[Oppil. maakunta jarj] = d3b.jarjestys_maakunta
	,[Oppil. opetuskieli jarj] = d2b.jarjestys_opetuskieli


from [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2 on d2.id=f.yht_oppilaitos_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d2b on d2b.id=f.oppilaitos_historia_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d2c on SUBSTRING(d2c.oppilaitos_avain, PATINDEX('%[^0]%', d2c.oppilaitos_avain), LEN(d2c.oppilaitos_avain))=d2b.oppilaitoksen_korvaavakoodi and tilastointivuosi between d2c.alkaa and d2c.paattyy
left join VipunenTK.dbo.d_alueluokitus d3 on d3.id=f.yht_oppilaitos_kunta_id
left join VipunenTK.dbo.d_alueluokitus_historia d3b on d3b.id=f.yht_oppilaitos_kunta_historia_id
left join VipunenTK.dbo.d_nuorten_aikuisten_koulutus d4 on d4.id=f.nuorten_aikuisten_koulutus_id
left join VipunenTK.dbo.d_aidinkieli_versio1 d5 on d5.id=f.aidinkieli_versio1_id
--left join VipunenTK.dbo.d_lukiokoulutuksen_koulutuslaji d6 on d6.id=f.lukiokoulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_hallinnonala2 d7 on d7.id=f.hallinnonala2_id
--left join VipunenTK.dbo.d_opetushallinnon_koulutus d7 on d7.id=f.opetushallinnon_koulutus_id
left join VipunenTK.dbo.d_tutkinnon_tavoite d8 on d8.id=f.tutkinnon_tavoite_id
left join VipunenTK.dbo.d_ika d9 on d9.id=f.ika_5v_id
left join VipunenTK.dbo.d_oppisopimus_purkautunut d10 on d10.id=f.oppisopimus_purkautunut_id
left join VipunenTK.dbo.d_todistus_oppisopimuskoulutuksen_suorittamisesta d11 on d11.id=f.todistus_oppisopimuskoulutuksen_suorittamisesta_id
left join VipunenTK.dbo.d_yrittajan_oppisopimuskoulutus d12 on d12.id=f.yrittajan_oppisopimuskoulutus_id
left join VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d13 on d13.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
left join VipunenTK.dbo.d_koulutuksen_jarjestamismuoto d14 on d14.id=f.koulutuksen_jarjestamismuoto_id
left join VipunenTK.dbo.d_amm_sopimusjaksot d14b on d14b.id=f.amm_sopimusjaksot_id
left join VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d15 on d15.id=f.ammatillisen_koulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_koulutusluokitus d16 on d16.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_koulutusohjelma_ammpk d17 on d17.id=f.koulutusohjelma_ammpk_id
left join VipunenTK.dbo.d_rahoituslahde_amm d18 on d18.id=f.rahoituslahde_amm_id
left join VipunenTK.dbo.d_tutkintonimike_ammpk d19 on d19.id=f.tutkintonimike_ammpk_id
left join VipunenTK.dbo.d_kieli d20 on d20.id=f.koulutuksen_kieli_id
left join VipunenTK.dbo.d_tyovoimapoliittinen_koulutus d21 on d21.id=f.tyovoimapoliittinen_id
left join VipunenTK.dbo.d_alueluokitus d22 on d22.id=f.yht_koulutuksen_kunta_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2d on d2d.id=f.yht_koulutuksen_jarjestaja_id
left join VipunenTK.dbo.d_alueluokitus d24 on d24.id=f.yht_koulutuksen_jarjestaja_kunta_id
left join VipunenTK.dbo.d_vayla_nayttotutkintoon d25 on d25.id=f.vayla_nayttotutkintoon_id
left join VipunenTK.dbo.d_koulutussektori d26 on d26.id=f.koulutussektori_id
left join VipunenTK.dbo.d_koulutuksen_tavoite_toteuma d27 on d27.id=f.koulutuksen_tavoite_toteuma_id
left join VipunenTK.dbo.d_toimiala_2008 d28 on d28.id=f.toimiala_2008_id
left join VipunenTK.dbo.d_tyonantajasektori d29 on d29.id=f.tyonantajasektori_id
left join VipunenTK.dbo.d_oppisopimus_yrityksen_koko d30 on d30.id=f.oppisopimus_yrityksen_koko_id
left join VipunenTK.dbo.d_tutkinnon_toteuma d31 on d31.id=f.tutkinnon_toteuma_id

left join VipunenTK.dbo.d_kylla_ei d32 on d32.id=f.tuva_opiskeluoikeus_amm_id

/*
UNION ALL


--Lukio tutkinnot 2010
Select 
		[Tilastovuosi] = f.tilastointivuosi
	
	,[Sukupuoli] = d1.sukupuoli
	,[Äidinkieli] = d5.aidinkieli_versio1
	,[Ikäryhmä] = d9.ika5v
	,[Nuorten/aikuisten koul.] = d4.nuorten_aikuisten_koulutus
	,[Oppisopimus purkautunut] = 'Tuntematon'--d10.oppisopimus_purkautunut
	,[Todistus oppisopimuskoulutuksen suorittamisesta] = 'Tuntematon'--d11.todistus_oppisopimuskoulutuksen_suorittamisesta
	,[Yrittäjän oppisopimuskoulutus] = 'Tuntematon'--d12.yrittajan_oppisopimuskoulutus

	,[Koulutuslaji] = null
	,[Hallinnonala] = d7.hallinnonala
	,[Koulutuksen tavoite] = 'Tuntematon'--d8.tutkinnon_tavoite
	,[Koko tutkinto / tutk. osa] = 'Tuntematon'--d27.koulutuksen_tavoite_toteuma
	,[Järjestämistapa] = d13.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	,[Järjestämismuoto] = d14.koulutuksen_jarjestamismuoto
	,[Tutkintotyyppi] = d15.ammatillisen_koulutuksen_koulutuslaji
	,[Koulutusala] = d16.koulutusala2002
	,[Opintoala] = d16.opintoala2002
	,[Koulutusnimike] = d16.koulutus
	,[Osaamisala] = 'Tuntematon'--d17.koulutusohjelma_ammpk
	,[Rahoituslähde] = 'Tuntematon'--d18.rahoituslahde_amm
	,[Tutkintonimike] = 'Tuntematon'--d19.tutkintonimike_ammpk
	,[Koulutuksen kieli] = 'Tuntematon'--d20.kieli
	,[Työvoimapoliittinen koulutus] = 'Tuntematon'--d21.tyovoimapoliittinen_koulutus
	,[Väylä näyttötutkintoon] = 'Tuntematon'--d25.vayla_nayttotutkintoon	
	,[Koulutuksen suuralue] = d22.suuralue
	,[Koulutuksen kunnan kielisuhde] = d22.kielisuhde
	,[Koulutuksen AVI] = d22.avi
	,[Koulutuksen ELY] = d22.ely
	,[Koulutuksen maakunta] = d22.maakunta
	,[Koulutuksen seutukunta] = d22.seutukunta
	,[Koulutuksen sijaintikunnan kuntaryhmä] = d22.kuntaryhma
	,[Koulutuksen kunta] = d22.kunta
	,[Koulutussektori] = d26.koulutussektori

	,[Oppilaitoksen omistajatyyppi] = d2.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d2.oppilaitostyyppi
	,[Oppilaitos] = d2.oppilaitos
	,[Oppilaitoksen suuralue] = d3.suuralue
	,[Oppilaitoksen kunnan kielisuhde] = d3.kielisuhde
	,[Oppilaitoksen AVI] = d3.avi
	,[Oppilaitoksen ELY] = d3.ely
	,[Oppilaitoksen maakunta] = d3.maakunta
	,[Oppilaitoksen seutukunta] = d3.seutukunta
	,[Oppilaitoksen sijaintikunnan kuntaryhmä] = d3.kuntaryhma
	,[Oppilaitoksen kunta] = d3.kunta
	,[Oppilaitoksen opetuskieli] = d2.opetuskieli
	--Historia
	,[Oppil. omistajatyyppi] = d2b.oppilaitoksen_omistajatyyppi
	,[Oppilaitoksen tyyppi] = d2b.oppilaitostyyppi
	,[Oppilaitos _] =  case when coalesce(nullif(d2b.oppilaitoksen_korvaavakoodi,''),'') = '' then d2b.oppilaitos else d2c.oppilaitos end --d2b.oppilaitos
	,[Oppilaitoskoodi] = case when coalesce(nullif(d2b.oppilaitoksen_korvaavakoodi,''),'') = '' then d2b.oppilaitoskoodi else right('0000'+d2b.[oppilaitoksen_korvaavakoodi],5) end --case when d2b.oppilaitoksen_korvaavakoodi is null then d2b.oppilaitoskoodi else d2c.oppilaitoskoodi end
	,[Oppil. suuralue] = d3b.suuralue
	,[Oppil. kunnan kielisuhde] = d3b.kielisuhde
	,[Oppil. AVI] = d3b.avi
	,[Oppil. ELY] = d3b.ely
	,[Oppil. maakunta] = d3b.maakunta
	,[Oppil. seutukunta] = d3b.seutukunta
	,[Oppil. sijaintikunnan kuntaryhmä] = d3b.kuntaryhma
	,[Oppil. kunta] = d3b.kunta
	,[Oppil. opetuskieli] = d2b.opetuskieli
	,[Koul. järjestäjä] = d2b.koulutuksen_jarjestaja

	,[Koulutuksen järjestäjä] = d2d.koulutuksen_jarjestaja
	,[Koulutuksen järjestäjän omistajatyyppi] = d2d.koulutuksen_jarjestajan_omistajatyyppi
	,[Koulutuksen järjestäjän suuralue] = d24.suuralue
	,[Koulutuksen järjestäjän kunnan kielisuhde] = d24.kielisuhde
	,[Koulutuksen järjestäjän AVI] = d24.avi
	,[Koulutuksen järjestäjän ELY] = d24.ely
	,[Koulutuksen järjestäjän maakunta] = d24.maakunta
	,[Koulutuksen järjestäjän seutukunta] = d24.seutukunta
	,[Koulutuksen järjestäjän sijaintikunnan kuntaryhmä] = d24.kuntaryhma
	,[Koulutuksen järjestäjän kunta] = d24.kunta

	,[Toimiala] = 'Tuntematon'--d28.toimiala_2008
	,[Työnantajasektori] = 'Tuntematon'--d29.tyonantajasektori
	,[Yrityksen koko] = 'Tuntematon'--d30.oppisopimus_yrityksen_koko

	--mittarit
	,[Aloittaneet2] = 0
	,[Opiskelijat2] = 0
	,[Tutkinnot2] = f.lukumaara
	,[Ammattiosaamisen näyttöjen lukumäärä] = 0
	,[Ennen koulutuksen alkua hyväksiluettujen opintoviikkojen määrä] = 0
	,[Koulutuksen aikana hyväksiluettujen opintoviikkojen määrä] = 0
	,[Koulutuksen aikana suoritettujen opintoviikkojen määrä] = 0
	,[Tutkinnon opintoviikot yhteensä] = 0
	,[Työssäoppimisen opintoviikkojen määrä] = 0
	,[Tutkintojen osien lukumäärä] = 0

	--Ruotsi
	,[Statistikår] = f.tilastointivuosi
	,[Kön] = d1.sukupuoli_SV
	,[Modersmål] = d5.aidinkieli_versio1_SV
	,[Åldersgrupp] = d9.ika5v_SV
	,[Ungdoms-/vuxenutbildning] = 'Okänd'--d4.nuorten_aikuisten_koulutus_SV
	,[Oppisopimus purkautunutSV] = 'Okänd'--d10.oppisopimus_purkautunut_SV
	,[Todistus oppisopimuskoulutuksen suorittamisestaSV] = 'Okänd'--d11.todistus_oppisopimuskoulutuksen_suorittamisesta_SV
	,[Yrittäjän oppisopimuskoulutusSV] = 'Okänd'--d12.yrittajan_oppisopimuskoulutus_SV
	,[Utbildningsslag] = null
	,[Förvaltningsområde] = d7.hallinnonala_SV
	,[Utbildningens mål (studerandens mål i utbildningen)] = 'Okänd'--d8.tutkinnon_tavoite_SV
	,[Hela examen/del av en examen] = 'Okänd'--d27.koulutuksen_tavoite_toteuma_SV
	,[Sättet på vilket utbildningen ordnas] = d13.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_SV
	,[Formen i vilken utbildningen ordnas] = d14.koulutuksen_jarjestamismuoto_SV
	,[Typ av examen] = d15.ammatillisen_koulutuksen_koulutuslaji_SV
	,[Utbildningsområde] = d16.koulutusala2002_SV
	,[Studieområde] = d16.opintoala2002_SV
	,[Utbildningsbenämning] = d16.koulutus_SV
	,[Kompetensområde] = 'Okänd'--d17.koulutusohjelma_ammpk_SV
	,[Finansieringskälla] = 'Okänd'--d18.rahoituslahde_amm_SV
	,[Examensbeteckning] = 'Okänd'--d19.tutkintonimike_ammpk_SV
	,[Utbildningens språk] = 'Okänd'--d20.kieli_SV
	,[Työvoimapoliittinen koulutusSV] = 'Okänd'--d21.tyovoimapoliittinen_koulutus_SV
	,[Väg till fristående examen] = 'Okänd'--d25.vayla_nayttotutkintoon_SV
	,[Utbildningens område] = d22.suuralue_SV
	,[Utbildningens kommunens språkliga indelning] = d22.kielisuhde_SV
	,[Utbildningens RFV-område] = d22.avi_SV
	,[Utbildningens NMT-område] = d22.ely_SV
	,[Utbildningens landskap] = d22.maakunta_SV
	,[Utbildningens ekonomisk region] = d22.seutukunta_SV
	,[Utbildningens kommungrupp] = d22.kuntaryhma_SV
	,[Utbildningens kommun] = d22.kunta_SV

	,[Läroanstaltens ägartyp] = d2.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d2.oppilaitostyyppi_SV
	,[Läroanstalt] = d2.oppilaitos_SV
	,[Läroanstaltens storområde] = d3.suuralue_SV
	,[Läroanstaltens kommunens språkliga indelning] = d3.kielisuhde_SV
	,[Läroanstaltens RFV-område] = d3.avi_SV
	,[Läroanstaltens NMT-område] = d3.ely_SV
	,[Läroanstaltens landskap] = d3.maakunta_SV
	,[Läroanstaltens ekonomisk region] = d3.seutukunta_SV
	,[Läroanstaltens kommungrupp] = d3.kuntaryhma_SV
	,[Läroanstaltens kommun] = d3.kunta_SV
	,[Läroanstaltens undervisningsspråk] = d2.opetuskieli_SV
	--Historia
	,[Läroanstaltens ägartyp _] = d2b.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp _] = d2b.oppilaitostyyppi_SV
	,[Läroanstalt _] = d2b.oppilaitos_SV
	,[Läroanstaltens storområde _] = d3b.suuralue_SV
	,[Läroanstaltens kommunens språkliga indelning _] = d3b.kielisuhde_SV
	,[Läroanstaltens RFV-område _] = d3b.avi_SV
	,[Läroanstaltens NMT-område _] = d3b.ely_SV
	,[Läroanstaltens landskap _] = d3b.maakunta_SV
	,[Läroanstaltens ekonomisk region _] = d3b.seutukunta_SV
	,[Läroanstaltens kommungrupp _] = d3b.kuntaryhma_SV
	,[Läroanstaltens kommun _] = d3b.kunta_SV
	,[Läroanstaltens undervisningsspråk _] = d2b.opetuskieli_SV
	,[Utbildningsanordnare _] = d2b.koulutuksen_jarjestaja_SV
	--
	,[Utbildningsordnare] = d2d.koulutuksen_jarjestaja_SV
	,[Utbildningsanordnarens ägartyp] = d2d.koulutuksen_jarjestajan_omistajatyyppi_SV
	,[Utbildningsordnarens storområde] = d24.suuralue_SV
	,[Utbildningsordnarens kommunens språkliga indelning] = d24.kielisuhde_SV
	,[Utbildningsordnarens RFV-område] = d24.avi_SV
	,[Utbildningsordnarens NMT-område] = d24.ely_SV
	,[Utbildningsordnarens landskap] = d24.maakunta_SV
	,[Utbildningsordnarens ekonomisk region] = d24.seutukunta_SV
	,[Utbildningsordnarens kommungrupp] = d24.kuntaryhma_SV
	,[Utbildningsordnarens kommun] = d24.kunta_SV

	,[Bransch] = 'Okänd'--d28.toimiala_2008_SV
	,[Arbetsgivarens sektor] = 'Okänd'--d29.tyonantajasektori_SV
	,[Företagets storlek] = 'Okänd'--d30.oppisopimus_yrityksen_koko_SV
	
	--Englanti
	,[Statistical year] = f.tilastointivuosi
	,[Gender] = d1.sukupuoli_EN
	,[Mother tongue] = d5.aidinkieli_versio1_EN
	,[Age group] = d9.ika5v_EN
	,[Youth/adult education] = d4.nuorten_aikuisten_koulutus_EN
	,[Oppisopimus purkautunutEN] = 'Unknown'--d10.oppisopimus_purkautunut_EN
	,[Todistus oppisopimuskoulutuksen suorittamisestaEN] = 'Unknown'--d11.todistus_oppisopimuskoulutuksen_suorittamisesta_EN
	,[Yrittäjän oppisopimuskoulutusEN] = 'Unknown'--d12.yrittajan_oppisopimuskoulutus_EN
	,[Form of education and training] = null
	,[Administrative sector] = d7.hallinnonala_EN
	,[Objective of education (the student's objective for attaining education)] = 'Unknown'--d8.tutkinnon_tavoite_EN
	,[Complete qualification/module] = 'Unknown'--d27.koulutuksen_tavoite_toteuma_EN
	,[Method of vocational education and training] = d13.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_EN
	,[Form of vocational education and training] = d14.koulutuksen_jarjestamismuoto_EN
	,[Qualification type] = d15.ammatillisen_koulutuksen_koulutuslaji_EN
	,[Field of education] = d16.koulutusala2002_EN
	,[Subfield of education] = d16.opintoala2002_EN
	,[Name of education] = d16.koulutus_EN
	,[OsaamisalaEN] = 'Unknown'--d17.koulutusohjelma_ammpk_EN
	,[Source of funding] = 'Unknown'--d18.rahoituslahde_amm_EN
	,[Qualification title] = 'Unknown'--d19.tutkintonimike_ammpk_EN
	,[Language of education] = 'Unknown'--d20.kieli_EN
	,[Työvoimapoliittinen koulutusEN] = 'Unknown'--d21.tyovoimapoliittinen_koulutus_EN
	,[Route to competence-based qualification] = 'Unknown'--d25.vayla_nayttotutkintoon_EN
	,[Major region of education] = d22.suuralue_EN
	,[Lang. distribution of municipality of education] = d22.kielisuhde_EN
	,[AVI area of education] = d22.avi_EN
	,[ELY area of education] = d22.ely_EN
	,[Region of education] = d22.maakunta_EN
	,[Subregion of education] = d22.seutukunta_EN
	,[Municipality group of education] = d22.kuntaryhma_EN
	,[Municipality of ecucation] = d22.kunta_EN

	,[Type of institution owner] = d2.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d2.oppilaitostyyppi_EN
	,[Educational institution] = d2.oppilaitos_EN
	,[Major region of the institution] = d3.suuralue_EN
	,[Lang. distribution of municipality of the institution] = d3.kielisuhde_EN
	,[AVI area of the institution] = d3.avi_EN
	,[ELY area of the institution] = d3.ely_EN
	,[Region of the institution] = d3.maakunta_EN
	,[Subregion of the institution] = d3.seutukunta_EN
	,[Municipality group of the institution] = d3.kuntaryhma_EN
	,[Municipality of the institution] = d3.kunta_EN
	,[Language of the institution] = d2.opetuskieli_EN
	--Historia
	,[Type of institution owner _] = d2b.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution _] = d2b.oppilaitostyyppi_EN
	,[Educational institution _] = d2b.oppilaitos_EN
	,[Major region of the institution _] = d3b.suuralue_EN
	,[Langb. distribution of municipality of the institution _] = d3b.kielisuhde_EN
	,[AVI area of the institution _] = d3b.avi_EN
	,[ELY area of the institution _] = d3b.ely_EN
	,[Region of the institution _] = d3b.maakunta_EN
	,[Subregion of the institution _] = d3b.seutukunta_EN
	,[Municipality group of the institution _] = d3b.kuntaryhma_EN
	,[Municipality of the institution _] = d3b.kunta_EN
	,[Language of the institution _] = d2b.opetuskieli_EN
	,[Education provider _] = d2b.koulutuksen_jarjestaja_EN
	--
	,[Education provider] = d2d.koulutuksen_jarjestaja_EN
	,[Type of education provider owner] = d2d.koulutuksen_jarjestajan_omistajatyyppi_EN
	,[Major region of the education provider] = d24.suuralue_EN
	,[Lang. distribution of municipality of the education provider] = d24.kielisuhde_EN
	,[AVI area of the education provider] = d24.avi_EN
	,[ELY area of the education provider] = d24.ely_EN
	,[Region of the education provider] = d24.maakunta_EN
	,[Subregion of the education provider] = d24.seutukunta_EN
	,[Municipality group of the education provider] = d24.kuntaryhma_EN
	,[Municipality of the education provider] = d24.kunta_EN

	,[Industry] = 'Unknown'--d28.toimiala_2008_EN
	,[Employer sector] = 'Unknown'--d29.tyonantajasektori_EN
	,[Employer size] = 'Unknown'--d30.oppisopimus_yrityksen_koko_EN

	--koodimuuttujat
	,[Koodit Oppilaitoksen maakunta] = d3.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d3.kunta_koodi
	,[Koodit Koulutuksen maakunta] = d22.maakunta_koodi
	,[Koodit Koulutuksen kunta] = d22.kunta_koodi
	,[Koodit Koulutuksen järjestäjän maakunta] = d24.maakunta_koodi
	,[Koodit Koulutuksen järjestäjän kunta] = d24.kunta_koodi
	,[Koodit Koulutusala] = d16.koulutusala2002_koodi
	,[Koodit Opintoala] = d16.opintoala2002_koodi
	,[Koodit Koulutusnimike] = d16.koulutus_koodi
	,[Koodit Osaamisala] = null--d17.koulutusohjelma_ammpk_koodi
	,[Koodit Koulutuksen järjestäjä] = d2d.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d2.oppilaitoskoodi
	,d16.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
	,d16.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
	,d16.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
	,d16.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
	,d16.iscfi2013_koodi as "Koodit Koulutusala, taso 3"

	--isced
	,d16.iscle2011 as "Koulutusaste, taso 1"
	,d16.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	,d16.iscfibroad2013 as "Koulutusala, taso 1"
	,d16.iscfinarrow2013 as "Koulutusala, taso 2"
	,d16.iscfi2013 as "Koulutusala, taso 3"
	,d16.iscle2011_SV as "Utbildn.nivå, nivå 1"
	,d16.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	,d16.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	,d16.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	,d16.iscfi2013_SV as "Utbildn.område, nivå 3"
	,d16.iscle2011_EN as "Level of education, tier 1"
	,d16.Koulutusaste_taso2_EN as "Level of education, tier 2"
	,d16.iscfibroad2013_EN as "Field of education, tier 1"
	,d16.iscfinarrow2013_EN as "Field of education, tier 2"
	,d16.iscfi2013_EN as "Field of education, tier 3"
	,d16.jarjestys_iscle2011 as jarj_isced_koulast1
	,d16.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
	,d16.jarjestys_iscfibroad2013 as jarj_isced_koulala1
	,d16.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
	,d16.jarjestys_iscfi2013 as jarj_isced_koulala3

	--järjestys
	,[Sukupuoli jarj] = d1.jarjestys
	,[Äidinkieli jarj] = d5.jarjestys
	,[Ikäryhmä jarj] = d9.jarjestys_ika5v
	,[Nuorten/aikuisten jarj] = d4.jarjestys
	,[Oppisopimus purkautunut jarj] = 99999--d10.jarjestys
	,[Todistus oppisopimuskoulutuksen suorittamisesta jarj] = 99999--d11.jarjestys
	,[Yrittäjän oppisopimuskoulutus jarj] = 99999--d12.jarjestys
	,[Koulutuslaji jarj] = 99
	,[Hallinnonala jarj] = d7.jarjestys
	,[Koulutuksen tavoite jarj] = 99999--d8.jarjestys
	,[Koko tutkinto / tutk. osa jarj] = 99999--d27.jarjestys
	,[Järjestämistapa jarj] = d13.jarjestys
	,[Järjestämismuoto jarj] = d14.jarjestys
	,[Tutkintotyyppi jarj] = d15.jarjestys
	,[Koulutusala jarj] = d16.jarjestys_koulutusala2002
	,[Opintoala jarj] = d16.jarjestys_opintoala2002
	,[Koulutusnimike jarj] = d16.jarjestys
	,[Osaamisala jarj] = 99999--d17.jarjestys
	,[Rahoituslähde jarj] = 99999--d18.jarjestys
	,[Tutkintonimike jarj] = 99999--d19.jarjestys
	,[Koulutuksen kieli jarj] = 99999--d20.jarjestys
	,[Työvoimapoliittinen koulutus jarj] = 99999--d21.jarjestys
	,[Väylä näyttötutkintoon jarj] = 99999--d25.jarjestys
	,[Koulutuksen suuralue jarj] = d22.jarjestys_suuralue
	,[Koulutuksen kunnan kielisuhde jarj] = d22.jarjestys_kielisuhde
	,[Koulutuksen AVI jarj] = d22.jarjestys_avi
	,[Koulutuksen ELY jarj] = d22.jarjestys_ely
	,[Koulutuksen maakunta jarj] = d22.jarjestys_maakunta
	,[Koulutuksen seutukunta jarj] = d22.jarjestys_seutukunta
	,[Koulutuksen sijaintikunnan kuntaryhmä jarj] = d22.jarjestys_kuntaryhma
	,[Oppilaitoksen omistajatyyppi jarj] = d2.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi jarj] = d2.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen suuralue jarj] = d3.jarjestys_suuralue
	,[Oppilaitoksen AVI jarj] = d3.jarjestys_avi
	,[Oppilaitoksen ELY jarj] = d3.jarjestys_ely
	,[Oppilaitoksen maakunta jarj] = d3.jarjestys_maakunta
	,[Oppilaitoksen seutukunta jarj] = d3.jarjestys_seutukunta
	,[Oppilaitoksen kuntaryhmä jarj] = d3.jarjestys_kuntaryhma
	,[Oppilaitoksen kielisuhde jarj] = d3.jarjestys_kielisuhde
	,[Oppilaitoksen opetuskieli jarj] = d2.jarjestys_opetuskieli
	,[Koulutuksen järjestäjän omistajatyyppi jarj] = d2.jarjestys_omistajatyyppi
	,[Koulutuksen järjestäjän suuralue jarj] = d24.jarjestys_suuralue
	,[Koulutuksen järjestäjän kunnan kielisuhde jarj] = d24.jarjestys_kielisuhde
	,[Koulutuksen järjestäjän AVI jarj] = d24.jarjestys_avi
	,[Koulutuksen järjestäjän ELY jarj] = d24.jarjestys_ely
	,[Koulutuksen järjestäjän maakunta jarj] = d24.jarjestys_maakunta
	,[Koulutuksen järjestäjän seutukunta jarj] = d24.jarjestys_seutukunta
	,[Koulutuksen järjestäjän sijaintikunnan kuntaryhmä jarj] = d24.jarjestys_kuntaryhma
	,[Toimiala jarj] = 99999--d28.jarjestys
	,[Työnantaja jarj] = 99999--d29.jarjestys
	,[Yrityksen koko jarj] = 99999--d30.jarjestys
	--Historia
	,[Oppil. omistajatyyppi jarj] = d2b.jarjestys_omistajatyyppi
	,[Oppilaitoksen tyyppi jarj] = d2b.jarjestys_oppilaitostyyppi
	,[Oppil. maakunta jarj] = d3b.jarjestys_maakunta
	,[Oppil. opetuskieli jarj] = d2b.jarjestys_opetuskieli


From [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2 on d2.id=f.oppilaitos_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d2b on d2b.id=f.oppilaitos_historia_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d2c on SUBSTRING(d2c.oppilaitos_avain, PATINDEX('%[^0]%', d2c.oppilaitos_avain), LEN(d2c.oppilaitos_avain))=d2b.oppilaitoksen_korvaavakoodi and tilastointivuosi between d2c.alkaa and d2c.paattyy
left join VipunenTK.dbo.d_alueluokitus d3 on d3.id=f.oppilaitos_kunta_id
left join VipunenTK.dbo.d_alueluokitus_historia d3b on d3b.id=f.oppilaitos_kunta_historia_id
left join VipunenTK.dbo.d_nuorten_aikuisten_koulutus d4 on d4.id=f.nuorten_aikuisten_koulutus_id
left join VipunenTK.dbo.d_aidinkieli_versio1 d5 on d5.id=f.aidinkieli_versio1_id
--left join VipunenTK.dbo.d_lukiokoulutuksen_koulutuslaji d6 on d6.id=f.lukiokoulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_hallinnonala2 d7 on d7.id=f.hallinnonala2_id
--left join VipunenTK.dbo.d_tutkinnon_tavoite d8 on d8.id=f.tutkinnon_tavoite_id
left join VipunenTK.dbo.d_ika d9 on d9.id=f.ika_1v_id
--left join VipunenTK.dbo.d_oppisopimus_purkautunut d10 on d10.id=f.oppisopimus_purkautunut_id
--left join VipunenTK.dbo.d_todistus_oppisopimuskoulutuksen_suorittamisesta d11 on d11.id=f.todistus_oppisopimuskoulutuksen_suorittamisesta_id
--left join VipunenTK.dbo.d_yrittajan_oppisopimuskoulutus d12 on d12.id=f.yrittajan_oppisopimuskoulutus_id
left join VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d13 on d13.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
left join VipunenTK.dbo.d_koulutuksen_jarjestamismuoto d14 on d14.id=f.koulutuksen_jarjestamismuoto_id
left join VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d15 on d15.id=f.ammatillisen_koulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_koulutusluokitus d16 on d16.id=f.koulutusluokitus_id
--left join VipunenTK.dbo.d_koulutusohjelma_ammpk d17 on d17.id=f.koulutusohjelma_ammpk_id
--left join VipunenTK.dbo.d_rahoituslahde_amm d18 on d18.id=f.rahoituslahde_amm_id
--left join VipunenTK.dbo.d_tutkintonimike_ammpk d19 on d19.id=f.tutkintonimike_ammpk_id
--left join VipunenTK.dbo.d_kieli d20 on d20.id=f.koulutuksen_kieli_id
--left join VipunenTK.dbo.d_tyovoimapoliittinen_koulutus d21 on d21.id=f.tyovoimapoliittinen_id
left join VipunenTK.dbo.d_alueluokitus d22 on d22.id=f.oppilaitos_kunta_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2d on d2d.id=f.koulutuksen_jarjestaja_id
left join VipunenTK.dbo.d_alueluokitus d24 on d24.id=f.koulutuksen_jarjestaja_kunta_id
--left join VipunenTK.dbo.d_vayla_nayttotutkintoon d25 on d25.id=f.vayla_nayttotutkintoon_id
left join VipunenTK.dbo.d_koulutussektori d26 on d26.id=f.koulutussektori_id
--left join VipunenTK.dbo.d_koulutuksen_tavoite_toteuma d27 on d27.id=f.koulutuksen_tavoite_toteuma_id
--left join VipunenTK.dbo.d_toimiala_2008 d28 on d28.id=f.toimiala_2008_id
--left join VipunenTK.dbo.d_tyonantajasektori d29 on d29.id=f.tyonantajasektori_id
--left join VipunenTK.dbo.d_oppisopimus_yrityksen_koko d30 on d30.id=f.oppisopimus_yrityksen_koko_id

where d2.oppilaitoksen_omistajatyyppi <> 'Ahvenanmaan maakunta' and f.tilastointivuosi = 2010 and f.koulutussektori = 2

*/


GO


