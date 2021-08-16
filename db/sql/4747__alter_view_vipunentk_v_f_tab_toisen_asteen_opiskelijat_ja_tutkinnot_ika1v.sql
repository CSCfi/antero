USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_toisen_asteen_opiskelijat_ja_tutkinnot_ika1v]    Script Date: 10.8.2021 19:46:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_tab_toisen_asteen_opiskelijat_ja_tutkinnot_ika1v] AS

--aloittaneet ja opiskelijat
select
	[Tilastovuosi] = f.tilastointivuosi
	
	,[Sukupuoli] = d1.sukupuoli
	,[Äidinkieli] = d5.aidinkieli_versio1
	,[Ikä kirjoihintulovuonna] = d9.ika
	,[Ikäryhmä I kirjoihintulovuonna] = d9.ika5v
	,[Ikäryhmä II kirjoihintulovuonna] = d10.ika
	,[Ikä] = d11.ika
	,[Ikäryhmä I] = d11.ika5v
	,[Ikäryhmä II] = d12.ika
	,[Nuorten/aikuisten koul.] = d4.nuorten_aikuisten_koulutus

	--,[Hallinnonala] = d7.opetushallinnon_koulutus
	,[Hallinnonala] = d7b.hallinnonala
	,[Koulutuksen tavoite] = d8.tutkinnon_tavoite
	,[Koko tutkinto / tutk. osa] = d27.koulutuksen_tavoite_toteuma
	,[Järjestämistapa] = d13.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	,[Järjestämismuoto] = d14.koulutuksen_jarjestamismuoto
	,[Koulutus- ja oppisopimusjaksot] = d14b.selite_fi
	,[Tutkintotyyppi] = d15.ammatillisen_koulutuksen_koulutuslaji
	,[Koulutuslaji] = d15b.koulutuslaji_okm
	,[Koulutusala] = d16.koulutusala2002
	,[Opintoala] = d16.opintoala2002
	,[Koulutusnimike] = d16.koulutus
	,[Osaamisala] = d17.koulutusohjelma_ammpk
	,[Rahoituslähde] = d18.rahoituslahde_amm
	,[Tutkintonimike] = d19.tutkintonimike_ammpk
	,[Koulutuksen kieli] = d20.kieli
	,[Väylä näyttötutkintoon] = 'Tuntematon'	
	,[Koulutuksen suuralue] = d22.suuralue
	,[Koulutuksen kunnan kielisuhde] = d22.kielisuhde
	,[Koulutuksen AVI] = d22.avi
	,[Koulutuksen ELY] = d22.ely
	,[Koulutuksen maakunta] = d22.maakunta
	,[Koulutuksen seutukunta] = d22.seutukunta
	,[Koulutuksen sijaintikunnan kuntaryhmä] = d22.kuntaryhma
	,[Koulutuksen kunta] = d22.kunta
	,[Koulutussektori] = d26.koulutussektori

	,[Koulutuksen järjestäjä] = coalesce(nullif(d23b.koulutuksen_jarjestaja,''),d23.koulutuksen_jarjestaja)
	,[Koulutuksen järjestäjän omistajatyyppi] = d23.koulutuksen_jarjestajan_omistajatyyppi
	,[Koulutuksen järjestäjän suuralue] = d24.suuralue
	,[Koulutuksen järjestäjän kunnan kielisuhde] = d24.kielisuhde
	,[Koulutuksen järjestäjän AVI] = d24.avi
	,[Koulutuksen järjestäjän ELY] = d24.ely
	,[Koulutuksen järjestäjän maakunta] = d24.maakunta
	,[Koulutuksen järjestäjän seutukunta] = d24.seutukunta
	,[Koulutuksen järjestäjän sijaintikunnan kuntaryhmä] = d24.kuntaryhma
	,[Koulutuksen järjestäjän kunta] = d24.kunta

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
	,[Statistikår] = f.tilastointivuosi
	,[Kön] = d1.sukupuoli_SV
	,[Modersmål] = d5.aidinkieli_versio1_SV
	,[Ålder (inskrivningsår)] = d9.ika_SV
	,[Åldersgrupp I (inskrivningsår)] = d9.ika5v_SV
	,[Åldersgrupp II (inskrivningsår)] = d10.ika_SV
	,[Ålder] = d11.ika_SV
	,[Åldersgrupp I] = d11.ika5v_SV
	,[Åldersgrupp II] = d12.ika_SV
	,[Ungdoms-/vuxenutbildning] = d4.nuorten_aikuisten_koulutus_SV
	--,[Förvaltningsområde] = d7.opetushallinnon_koulutus_SV
	,[Förvaltningsområde] = d7b.hallinnonala_SV
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
	,[Väg till fristående examen] = null
	,[Utbildningens storområde] = d22.suuralue_SV
	,[Utbildningens kommunens språkliga indelning] = d22.kielisuhde_SV
	,[Utbildningens RFV-område] = d22.avi_SV
	,[Utbildningens NMT-område] = d22.ely_SV
	,[Utbildningens landskap] = d22.maakunta_SV
	,[Utbildningens ekonomisk region] = d22.seutukunta_SV
	,[Utbildningens kommungrupp] = d22.kuntaryhma_SV
	,[Utbildningens kommun] = d22.kunta_SV

	,[Utbildningsanordnare] = coalesce(nullif(d23b.koulutuksen_jarjestaja_SV,''),d23.koulutuksen_jarjestaja_SV)
	,[Utbildningsanordnarens ägartyp] = d23.koulutuksen_jarjestajan_omistajatyyppi_SV
	,[Utbildningsanordnarens storområde] = d24.suuralue_SV
	,[Utbildningsanordnarens kommunens språkliga indelning] = d24.kielisuhde_SV
	,[Utbildningsanordnarens RFV-område] = d24.avi_SV
	,[Utbildningsanordnarens NMT-område] = d24.ely_SV
	,[Utbildningsanordnarens landskap] = d24.maakunta_SV
	,[Utbildningsanordnarens ekonomisk region] = d24.seutukunta_SV
	,[Utbildningsanordnarens kommungrupp] = d24.kuntaryhma_SV
	,[Utbildningsanordnarens kommun] = d24.kunta_SV

	--Englanti
	,[Statistical year] = f.tilastointivuosi
	,[Gender] = d1.sukupuoli_EN
	,[Mother tongue] = d5.aidinkieli_versio1_EN
	,[Age (year of entry)] = d9.ika_EN
	,[Age group I (year of entry)] = d9.ika5v_EN
	,[Age group II (year of entry)] = d10.ika_EN
	,[Age] = d11.ika_EN
	,[Age group I] = d11.ika5v_EN
	,[Age group II] = d12.ika_EN
	,[Youth/adult education] = d4.nuorten_aikuisten_koulutus_EN
	--,[Administrative sector] = d7.opetushallinnon_koulutus_EN
	,[Administrative sector] = d7b.hallinnonala_EN
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
	,[Route to competence-based qualification] = null
	,[Major region of education] = d22.suuralue_EN
	,[Lang. distribution of municipality of education] = d22.kielisuhde_EN
	,[AVI area of education] = d22.avi_EN
	,[ELY area of education] = d22.ely_EN
	,[Region of education] = d22.maakunta_EN
	,[Subregion of education] = d22.seutukunta_EN
	,[Municipality group of education] = d22.kuntaryhma_EN
	,[Municipality of education] = d22.kunta_EN

	,[Education provider] = coalesce(nullif(d23b.koulutuksen_jarjestaja_EN,''),d23.koulutuksen_jarjestaja_EN)
	,[Type of education provider owner] = d23.koulutuksen_jarjestajan_omistajatyyppi_EN
	,[Major region of the education provider] = d24.suuralue_EN
	,[Lang. distribution of municipality of the education provider] = d24.kielisuhde_EN
	,[AVI area of the education provider] = d24.avi_EN
	,[ELY area of the education provider] = d24.ely_EN
	,[Region of the education provider] = d24.maakunta_EN
	,[Subregion of the education provider] = d24.seutukunta_EN
	,[Municipality group of the education provider] = d24.kuntaryhma_EN
	,[Municipality of the education provider] = d24.kunta_EN

	--koodimuuttujat
	,[Koodit Koulutuksen maakunta] = d22.maakunta_koodi
	,[Koodit Koulutuksen kunta] = d22.kunta_koodi
	,[Koodit Koulutuksen järjestäjän maakunta] = d24.maakunta_koodi
	,[Koodit Koulutuksen järjestäjän kunta] = d24.kunta_koodi
	,[Koodit Koulutusala] = d16.koulutusala2002_koodi
	,[Koodit Opintoala] = d16.opintoala2002_koodi
	,[Koodit Koulutusnimike] = d16.koulutus_koodi
	,[Koodit Osaamisala] = d17.koulutusohjelma_ammpk_koodi
	,[Koodit Koulutuksen järjestäjä] = coalesce(nullif(d23b.koulutuksen_jarjestajakoodi,''),d23.koulutuksen_jarjestajakoodi)
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
	,[Ikä kirj jarj] = d9.jarjestys_ika
	,[Ikä5v kirj jarj] = d9.jarjestys_ika5v
	,[Ikäryhmä kirj jarj] = d10.jarjestys_ika
	,[Ikä jarj] = d11.jarjestys_ika
	,[Ikä5v jarj] = d11.jarjestys_ika5v
	,[Ikäryhmä jarj] = d12.jarjestys_ika
	,[Nuorten/aikuisten jarj] = d4.jarjestys
	,[Hallinnonala jarj] = d7b.jarjestys
	,[Koulutuksen tavoite jarj] = d8.jarjestys
	,[Koko tutkinto / tutk. osa jarj] = d27.jarjestys
	,[Järjestämistapa jarj] = d13.jarjestys
	,[Järjestämismuoto jarj] = d14.jarjestys
	,[Koulutus- ja oppisopimusjaksot jarj] = d14b.jarjestys_koodi
	,[Tutkintotyyppi jarj] = d15.jarjestys
	,[Koulutuslaji jarj] = d15b.jarjestys
	,[Koulutusala jarj] = d16.jarjestys_koulutusala2002
	,[Opintoala jarj] = d16.jarjestys_opintoala2002
	,[Koulutusnimike jarj] = d16.jarjestys
	,[Osaamisala jarj] = d17.jarjestys
	,[Rahoituslähde jarj] = d18.jarjestys
	,[Tutkintonimike jarj] = d19.jarjestys
	,[Koulutuksen kieli jarj] = d20.jarjestys
	,[Väylä näyttötutkintoon jarj] = null
	,[Koulutuksen suuralue jarj] = d22.jarjestys_suuralue
	,[Koulutuksen kunnan kielisuhde jarj] = d22.jarjestys_kielisuhde
	,[Koulutuksen AVI jarj] = d22.jarjestys_avi
	,[Koulutuksen ELY jarj] = d22.jarjestys_ely
	,[Koulutuksen maakunta jarj] = d22.jarjestys_maakunta
	,[Koulutuksen seutukunta jarj] = d22.jarjestys_seutukunta
	,[Koulutuksen sijaintikunnan kuntaryhmä jarj] = d22.jarjestys_kuntaryhma
	,[Koulutuksen järjestäjän omistajatyyppi jarj] = d23.jarjestys_omistajatyyppi
	,[Koulutuksen järjestäjän suuralue jarj] = d24.jarjestys_suuralue
	,[Koulutuksen järjestäjän kunnan kielisuhde jarj] = d24.jarjestys_kielisuhde
	,[Koulutuksen järjestäjän AVI jarj] = d24.jarjestys_avi
	,[Koulutuksen järjestäjän ELY jarj] = d24.jarjestys_ely
	,[Koulutuksen järjestäjän maakunta jarj] = d24.jarjestys_maakunta
	,[Koulutuksen järjestäjän seutukunta jarj] = d24.jarjestys_seutukunta
	,[Koulutuksen järjestäjän sijaintikunnan kuntaryhmä jarj] = d24.jarjestys_kuntaryhma

from [dbo].[f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id

left join VipunenTK.dbo.d_nuorten_aikuisten_koulutus d4 on d4.id=f.nuorten_aikuisten_koulutus_id
left join VipunenTK.dbo.d_aidinkieli_versio1 d5 on d5.id=f.aidinkieli_versio1_id

left join VipunenTK.dbo.d_opetushallinnon_koulutus d7 on d7.id=f.opetushallinnon_koulutus_id
left join VipunenTK.dbo.d_hallinnonala2 d7b on d7b.id=f.hallinnonala2_id
left join VipunenTK.dbo.d_tutkinnon_tavoite d8 on d8.id=f.tutkinnon_tavoite_id
left join VipunenTK.dbo.d_ika d9 on d9.id=f.ika_kirjoihintulovuonna_id
left join VipunenTK.dbo.d_ika d10 on d10.id=f.ikaryhma_kirjoihintulovuonna_id
left join VipunenTK.dbo.d_ika d11 on d11.id=f.ika_id
left join VipunenTK.dbo.d_ika d12 on d12.id=f.ikaryhma_id

left join VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d13 on d13.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
left join VipunenTK.dbo.d_koulutuksen_jarjestamismuoto d14 on d14.id=f.koulutuksen_jarjestamismuoto_id
left join VipunenTK.dbo.d_amm_sopimusjaksot d14b on d14b.id=f.amm_sopimusjaksot_id
left join VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d15 on d15.id=f.ammatillisen_koulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_koulutuslaji_okm d15b on d15b.id=f.koulutuslaji_OKM_id
left join VipunenTK.dbo.d_koulutusluokitus d16 on d16.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_koulutusohjelma_ammpk d17 on d17.id=f.koulutusohjelma_ammpk_id
left join VipunenTK.dbo.d_rahoituslahde_amm d18 on d18.id=f.rahoituslahde_amm_id
left join VipunenTK.dbo.d_tutkintonimike_ammpk d19 on d19.id=f.tutkintonimike_ammpk_id
left join VipunenTK.dbo.d_kieli d20 on d20.id=f.koulutuksen_kieli_id

left join VipunenTK.dbo.d_alueluokitus d22 on d22.id=f.koulutuksen_kunta_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d23 on d23.id=f.yht_koulutuksen_jarjestaja_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d23b on d23b.oppilaitos_avain=d23.koulutuksen_jarjestajan_korvaavakoodi
left join VipunenTK.dbo.d_alueluokitus d24 on d24.id=f.yht_koulutuksen_jarjestaja_kunta_id
left join VipunenTK.dbo.d_koulutussektori d26 on d26.id=f.koulutussektori_id
left join VipunenTK.dbo.d_koulutuksen_tavoite_toteuma d27 on d27.id=f.koulutuksen_tavoite_toteuma_id


UNION ALL

--tutkinnot
select
	[Tilastovuosi] = f.tilastointivuosi
	
	,[Sukupuoli] = d1.sukupuoli
	,[Äidinkieli] = d5.aidinkieli_versio1
	,[Ikä kirjoihintulovuonna] = d9.ika
	,[Ikäryhmä I kirjoihintulovuonna] = d9.ika5v
	,[Ikäryhmä II kirjoihintulovuonna] = d10.ika
	,[Ikä] = d11.ika
	,[Ikäryhmä I] = d11.ika5v
	,[Ikäryhmä II] = d12.ika
	,[Nuorten/aikuisten koul.] = d4.nuorten_aikuisten_koulutus

	--,[Hallinnonala] = d7.opetushallinnon_koulutus
	,[Hallinnonala] = d7b.hallinnonala
	,[Koulutuksen tavoite] = d8.tutkinnon_tavoite
	,[Koko tutkinto / tutk. osa] = d27.tutkinnon_toteuma
	,[Järjestämistapa] = d13.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	,[Järjestämismuoto] = d14.koulutuksen_jarjestamismuoto
	,[Koulutus- ja oppisopimusjaksot] = d14b.selite_fi
	,[Tutkintotyyppi] = d15.ammatillisen_koulutuksen_koulutuslaji
	,[Koulutuslaji] = d15b.koulutuslaji_okm
	,[Koulutusala] = d16.koulutusala2002
	,[Opintoala] = d16.opintoala2002
	,[Koulutusnimike] = d16.koulutus
	,[Osaamisala] = d17.koulutusohjelma_ammpk
	,[Rahoituslähde] = d18.rahoituslahde_amm
	,[Tutkintonimike] = d19.tutkintonimike_ammpk
	,[Koulutuksen kieli] = d20.kieli
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

	,[Koulutuksen järjestäjä] = coalesce(nullif(d23b.koulutuksen_jarjestaja,''),d23.koulutuksen_jarjestaja)
	,[Koulutuksen järjestäjän omistajatyyppi] = d23.koulutuksen_jarjestajan_omistajatyyppi
	,[Koulutuksen järjestäjän suuralue] = d24.suuralue
	,[Koulutuksen järjestäjän kunnan kielisuhde] = d24.kielisuhde
	,[Koulutuksen järjestäjän AVI] = d24.avi
	,[Koulutuksen järjestäjän ELY] = d24.ely
	,[Koulutuksen järjestäjän maakunta] = d24.maakunta
	,[Koulutuksen järjestäjän seutukunta] = d24.seutukunta
	,[Koulutuksen järjestäjän sijaintikunnan kuntaryhmä] = d24.kuntaryhma
	,[Koulutuksen järjestäjän kunta] = d24.kunta

	--mittarit
	,[Aloittaneet2] = null
	,[Opiskelijat2] = null
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
	,[Ålder (inskrivningsår)] = d9.ika_SV
	,[Åldersgrupp I (inskrivningsår)] = d9.ika5v_SV
	,[Åldersgrupp II (inskrivningsår)] = d10.ika_SV
	,[Ålder] = d11.ika_SV
	,[Åldersgrupp I] = d11.ika5v_SV
	,[Åldersgrupp II] = d12.ika_SV
	,[Ungdoms-/vuxenutbildning] = d4.nuorten_aikuisten_koulutus_SV
	--,[Förvaltningsområde] = d7.opetushallinnon_koulutus_SV
	,[Förvaltningsområde] = d7b.hallinnonala_SV
	,[Utbildningens mål (studerandens mål i utbildningen)] = d8.tutkinnon_tavoite_SV
	,[Hela examen/del av en examen] = d27.tutkinnon_toteuma_SV
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
	,[Väg till fristående examen] = d25.vayla_nayttotutkintoon_SV
	,[Utbildningens område] = d22.suuralue_SV
	,[Utbildningens kommunens språkliga indelning] = d22.kielisuhde_SV
	,[Utbildningens RFV-område] = d22.avi_SV
	,[Utbildningens NMT-område] = d22.ely_SV
	,[Utbildningens landskap] = d22.maakunta_SV
	,[Utbildningens ekonomisk region] = d22.seutukunta_SV
	,[Utbildningens kommungrupp] = d22.kuntaryhma_SV
	,[Utbildningens kommun] = d22.kunta_SV

	,[Utbildningsordnare] = coalesce(nullif(d23b.koulutuksen_jarjestaja_SV,''),d23.koulutuksen_jarjestaja_SV)
	,[Utbildningsanordnarens ägartyp] = d23.koulutuksen_jarjestajan_omistajatyyppi_SV
	,[Utbildningsordnarens storområde] = d24.suuralue_SV
	,[Utbildningsordnarens kommunens språkliga indelning] = d24.kielisuhde_SV
	,[Utbildningsordnarens RFV-område] = d24.avi_SV
	,[Utbildningsordnarens NMT-område] = d24.ely_SV
	,[Utbildningsordnarens landskap] = d24.maakunta_SV
	,[Utbildningsordnarens ekonomisk region] = d24.seutukunta_SV
	,[Utbildningsordnarens kommungrupp] = d24.kuntaryhma_SV
	,[Utbildningsordnarens kommun] = d24.kunta_SV
	
	--Englanti
	,[Statistical year] = f.tilastointivuosi
	,[Gender] = d1.sukupuoli_EN
	,[Mother tongue] = d5.aidinkieli_versio1_EN
	,[Age (year of entry)] = d9.ika_EN
	,[Age group I (year of entry)] = d9.ika5v_EN
	,[Age group II (year of entry)] = d10.ika_EN
	,[Age] = d11.ika_EN
	,[Age group I] = d11.ika5v_EN
	,[Age group II] = d12.ika_EN
	,[Youth/adult education] = d4.nuorten_aikuisten_koulutus_EN
	--,[Administrative sector] = d7.opetushallinnon_koulutus_EN
	,[Administrative sector] = d7b.hallinnonala_EN
	,[Objective of education (the student's objective for attaining education)] = d8.tutkinnon_tavoite_EN
	,[Complete qualification/module] = d27.tutkinnon_toteuma_EN
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
	,[Route to competence-based qualification] = d25.vayla_nayttotutkintoon_EN
	,[Major region of education] = d22.suuralue_EN
	,[Lang. distribution of municipality of education] = d22.kielisuhde_EN
	,[AVI area of education] = d22.avi_EN
	,[ELY area of education] = d22.ely_EN
	,[Region of education] = d22.maakunta_EN
	,[Subregion of education] = d22.seutukunta_EN
	,[Municipality group of education] = d22.kuntaryhma_EN
	,[Municipality of ecucation] = d22.kunta_EN

	,[Education provider] = coalesce(nullif(d23b.koulutuksen_jarjestaja_EN,''),d23.koulutuksen_jarjestaja_EN)
	,[Type of education provider owner] = d23.koulutuksen_jarjestajan_omistajatyyppi_EN
	,[Major region of the education provider] = d24.suuralue_EN
	,[Lang. distribution of municipality of the education provider] = d24.kielisuhde_EN
	,[AVI area of the education provider] = d24.avi_EN
	,[ELY area of the education provider] = d24.ely_EN
	,[Region of the education provider] = d24.maakunta_EN
	,[Subregion of the education provider] = d24.seutukunta_EN
	,[Municipality group of the education provider] = d24.kuntaryhma_EN
	,[Municipality of the education provider] = d24.kunta_EN


	--koodimuuttujat
	,[Koodit Koulutuksen maakunta] = d22.maakunta_koodi
	,[Koodit Koulutuksen kunta] = d22.kunta_koodi
	,[Koodit Koulutuksen järjestäjän maakunta] = d24.maakunta_koodi
	,[Koodit Koulutuksen järjestäjän kunta] = d24.kunta_koodi
	,[Koodit Koulutusala] = d16.koulutusala2002_koodi
	,[Koodit Opintoala] = d16.opintoala2002_koodi
	,[Koodit Koulutusnimike] = d16.koulutus_koodi
	,[Koodit Osaamisala] = d17.koulutusohjelma_ammpk_koodi
	,[Koodit Koulutuksen järjestäjä] = coalesce(nullif(d23b.koulutuksen_jarjestajakoodi,''),d23.koulutuksen_jarjestajakoodi)
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
	,[Ikä kirj jarj] = d9.jarjestys_ika
	,[Ikä5v kirj jarj] = d9.jarjestys_ika5v
	,[Ikäryhmä kirj jarj] = d10.jarjestys_ika
	,[Ikä jarj] = d11.jarjestys_ika
	,[Ikä5v jarj] = d11.jarjestys_ika5v
	,[Ikäryhmä jarj] = d12.jarjestys_ika
	,[Nuorten/aikuisten jarj] = d4.jarjestys
	,[Hallinnonala jarj] = d7b.jarjestys
	,[Koulutuksen tavoite jarj] = d8.jarjestys
	,[Koko tutkinto / tutk. osa jarj] = d27.jarjestys
	,[Järjestämistapa jarj] = d13.jarjestys
	,[Järjestämismuoto jarj] = d14.jarjestys
	,[Koulutus- ja oppisopimusjaksot jarj] = d14b.jarjestys_koodi
	,[Tutkintotyyppi jarj] = d15.jarjestys	
	,[Koulutuslaji jarj] = d15b.jarjestys
	,[Koulutusala jarj] = d16.jarjestys_koulutusala2002
	,[Opintoala jarj] = d16.jarjestys_opintoala2002
	,[Koulutusnimike jarj] = d16.jarjestys
	,[Osaamisala jarj] = d17.jarjestys
	,[Rahoituslähde jarj] = d18.jarjestys
	,[Tutkintonimike jarj] = d19.jarjestys
	,[Koulutuksen kieli jarj] = d20.jarjestys
	,[Väylä näyttötutkintoon jarj] = d25.jarjestys
	,[Koulutuksen suuralue jarj] = d22.jarjestys_suuralue
	,[Koulutuksen kunnan kielisuhde jarj] = d22.jarjestys_kielisuhde
	,[Koulutuksen AVI jarj] = d22.jarjestys_avi
	,[Koulutuksen ELY jarj] = d22.jarjestys_ely
	,[Koulutuksen maakunta jarj] = d22.jarjestys_maakunta
	,[Koulutuksen seutukunta jarj] = d22.jarjestys_seutukunta
	,[Koulutuksen sijaintikunnan kuntaryhmä jarj] = d22.jarjestys_kuntaryhma
	,[Koulutuksen järjestäjän omistajatyyppi jarj] = d23.jarjestys_omistajatyyppi
	,[Koulutuksen järjestäjän suuralue jarj] = d24.jarjestys_suuralue
	,[Koulutuksen järjestäjän kunnan kielisuhde jarj] = d24.jarjestys_kielisuhde
	,[Koulutuksen järjestäjän AVI jarj] = d24.jarjestys_avi
	,[Koulutuksen järjestäjän ELY jarj] = d24.jarjestys_ely
	,[Koulutuksen järjestäjän maakunta jarj] = d24.jarjestys_maakunta
	,[Koulutuksen järjestäjän seutukunta jarj] = d24.jarjestys_seutukunta
	,[Koulutuksen järjestäjän sijaintikunnan kuntaryhmä jarj] = d24.jarjestys_kuntaryhma

from [dbo].[f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_nuorten_aikuisten_koulutus d4 on d4.id=f.nuorten_aikuisten_koulutus_id
left join VipunenTK.dbo.d_aidinkieli_versio1 d5 on d5.id=f.aidinkieli_versio1_id
--left join VipunenTK.dbo.d_lukiokoulutuksen_koulutuslaji d6 on d6.id=f.lukiokoulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_opetushallinnon_koulutus d7 on d7.id=f.opetushallinnon_koulutus_id
left join VipunenTK.dbo.d_hallinnonala2 d7b on d7b.id=f.hallinnonala2_id
left join VipunenTK.dbo.d_tutkinnon_tavoite d8 on d8.id=f.tutkinnon_tavoite_id
left join VipunenTK.dbo.d_ika d9 on d9.id=f.ika_kirjoihintulovuonna_id
left join VipunenTK.dbo.d_ika d10 on d10.id=f.ikaryhma_kirjoihintulovuonna_id
left join VipunenTK.dbo.d_ika d11 on d11.id=f.ika_id
left join VipunenTK.dbo.d_ika d12 on d12.id=f.ikaryhma_id
left join VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d13 on d13.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
left join VipunenTK.dbo.d_koulutuksen_jarjestamismuoto d14 on d14.id=f.koulutuksen_jarjestamismuoto_id
left join VipunenTK.dbo.d_amm_sopimusjaksot d14b on d14b.id=f.amm_sopimusjaksot_id
left join VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d15 on d15.id=f.ammatillisen_koulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_koulutuslaji_okm d15b on d15b.id=f.koulutuslaji_OKM_id
left join VipunenTK.dbo.d_koulutusluokitus d16 on d16.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_koulutusohjelma_ammpk d17 on d17.id=f.koulutusohjelma_ammpk_id
left join VipunenTK.dbo.d_rahoituslahde_amm d18 on d18.id=f.rahoituslahde_amm_id
left join VipunenTK.dbo.d_tutkintonimike_ammpk d19 on d19.id=f.tutkintonimike_ammpk_id
left join VipunenTK.dbo.d_kieli d20 on d20.id=f.koulutuksen_kieli_id
left join VipunenTK.dbo.d_alueluokitus d22 on d22.id=f.yht_koulutuksen_kunta_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d23 on d23.id=f.yht_koulutuksen_jarjestaja_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d23b on d23b.oppilaitos_avain=d23.koulutuksen_jarjestajan_korvaavakoodi
left join VipunenTK.dbo.d_alueluokitus d24 on d24.id=f.yht_koulutuksen_jarjestaja_kunta_id
left join VipunenTK.dbo.d_vayla_nayttotutkintoon d25 on d25.id=f.vayla_nayttotutkintoon_id
left join VipunenTK.dbo.d_koulutussektori d26 on d26.id=f.koulutussektori_id
left join VipunenTK.dbo.d_tutkinnon_toteuma d27 on d27.id=f.tutkinnon_toteuma_id

GO


