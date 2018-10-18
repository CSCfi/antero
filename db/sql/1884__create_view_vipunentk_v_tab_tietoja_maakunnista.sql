USE [VipunenTK]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_tab_tietoja_maakunnista]'))
EXEC dbo.sp_executesql @statement = N'[dbo].[v_tab_tietoja_maakunnista] AS select 1 AS a'

ALTER VIEW [dbo].[v_tab_tietoja_maakunnista] as

------------------ 2. aste Opiskelijat -----------------
select
 [Tilastovuosi]=f.tilv
,[Ennustevuosi]=NULL
,[Hallinnonala]=d7.hallinnonala
,[Koulutuksen tavoite]=d9.tutkinnon_tavoite
,[Koulutusaste 2002]=d1.koulutusaste2002
,[Koulutusala 2002]=d1.koulutusala2002
,[Koulutusaste, taso 2]=d1.Koulutusaste_taso2
,[Koulutusala, taso 1]=d1.iscfibroad2013
,[Asuinmaakunta]=NULL
,[Koulutuksen maakunta]=d2.maakunta
,[Oppilaitoksen maakunta]=NULL
,[Oppilaitoksen omistajatyyppi]=d3.oppilaitoksen_omistajatyyppi
,[Koulutuksen järjestäjän omistajatyyppi]=d3.koulutuksen_jarjestajan_omistajatyyppi
,[Oppilaitostyyppi]=d3.oppilaitostyyppi
,[Nuorten/aikuisten koulutus]=d8.nuorten_aikuisten_koulutus
,[Järjestämistapa]=d4.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
,[Järjestämismuoto]=d5.koulutuksen_jarjestamismuoto
,[Tutkintotyyppi]=d6.ammatillisen_koulutuksen_koulutuslaji
,[Kansalaisuus]=NULL
,[Pohjoismaa]=NULL
,[Äidinkieli]=Null
,[Väestön ikä]=NULL
,[Väestön ikä 5v]=NULL
,[Väestön maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL


/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijat]=f.opiskelijat
,[Aloittaneet]=f.aloittaneet
,[Tutkinto]=NULL
,[Opetustunnit]=NULL
,[Koulutukset]=NULL
,[Osallistuneet]=NULL
,[Esiopetuksen oppilaat] = NULL
,[1. luokan oppilaat] = NULL
,[1.-6. luokkien oppilaat] = NULL
,[7.-9. luokkien oppilaat] = NULL
,[Perusopetuksen suorittaneet] = NULL
,[Lisäopetuksen oppilaat] = NULL
,[15v täyttäneet, koulutusrakenne]=NULL
,[1v tutkinnon jälkeen]=NULL
,[Väestö lkm]=NULL
,[Väestöennuste]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=d9.tutkinnon_tavoite_koodi
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen maakunta koodi]=NULL
,[Oppilaitoksen omistajatyyppi koodi]=d3.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi koodi]=d3.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi koodi]=d3.oppilaitostyyppikoodi
,[Nuorten/aikuisten koulutus koodi]=d8.nuorten_aikuisten_koulutus_koodi
,[Järjestämistapa koodi]=d4.jarjestys
,[Järjestämismuoto koodi]=d5.jarjestys
,[Tutkintotyyppi koodi]=d6.jarjestys
,[Kansalaisuus koodi]=NULL
,[Pohjoismaa koodi]=NULL
,[Äidinkieli koodi]=NULL
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=NULL
,[Pääasiallinen toiminta koodi]=NULL
,[Pääasiallinen toiminta okm koodi]=NULL
,[Tutkintolaji työllistymiseen koodi]=NULL

/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=d9.jarjestys
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen maakunta jarj]=NULL
,[Oppilaitoksen omistajatyyppi jarj]=d3.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi jarj]=d3.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi jarj]=d3.jarjestys_oppilaitostyyppi
,[Nuorten/aikuisten koulutus jarj]=d8.jarjestys
,[Järjestämistapa jarj]=d4.jarjestys
,[Järjestämismuoto jarj]=d5.jarjestys
,[Tutkintotyyppi jarj]=d6.jarjestys
,[Kansalaisuus jarj]=NULL
,[Pohjoismaa jarj]=NULL
,[Äidinkieli jarj]=NULL
,[Väestön ikä jarj]=NULL
,[Väestön ikä 5v jarj]=NULL
,[Väestöennusteen maakunta jarj]=NULL
,[Pääasiallinen toiminta jarj]=NULL
,[Pääasiallinen toiminta okm jarj]=NULL
,[Tutkintolaji työllistymiseen jarj]=NULL

from VipunenTK.dbo.f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat as f
left join VipunenTK.dbo.d_koulutusluokitus as d1 on d1.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_alueluokitus as d2 on d2.id=f.yht_koulutuksen_kunta_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d3 on d3.id=f.oppilaitos_id
left join VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d4 on d4.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
left join VipunenTK.dbo.d_koulutuksen_jarjestamismuoto as d5 on d5.id=f.koulutuksen_jarjestamismuoto_id
left join VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d6 on d6.id=f.ammatillisen_koulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_hallinnonala d7 on d7.id=f.hallinnonala_id
left join VipunenTK.dbo.d_nuorten_aikuisten_koulutus d8 on d8.id=f.nuorten_aikuisten_koulutus_id
left join VipunenTK.dbo.d_tutkinnon_tavoite d9 on d9.id=f.tutkinnon_tavoite_id

UNION ALL

------------------ 2. aste tutkinnot -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=d7.hallinnonala
,[Koulutuksen tavoite]=d9.jarjestys
,[Koulutusaste 2002]=d1.koulutusaste2002
,[Koulutusala 2002]=d1.koulutusala2002
,[Koulutusaste, taso 2]=d1.Koulutusaste_taso2
,[Koulutusala, taso 1]=d1.iscfibroad2013
,[Asuinmaakunta]=NULL
,[Koulutuksen maakunta]=d2.maakunta
,[Oppilaitoksen maakunta]=NULL
,[Oppilaitoksen omistajatyyppi]=d3.oppilaitoksen_omistajatyyppi
,[Koulutuksen järjestäjän omistajatyyppi]=d3.koulutuksen_jarjestajan_omistajatyyppi
,[Oppilaitostyyppi]=d3.oppilaitostyyppi
,[Nuorten/aikuisten koulutus]=d8.nuorten_aikuisten_koulutus
,[Järjestämistapa]=d4.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
,[Järjestämismuoto]=d5.koulutuksen_jarjestamismuoto
,[Tutkintotyyppi]=d6.ammatillisen_koulutuksen_koulutuslaji
,[Kansalaisuus]=NULL
,[Pohjoismaa]=NULL
,[Äidinkieli]=NULL
,[Väestön ikä]=NULL
,[Väestön ikä 5v]=NULL
,[Väestön maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL


/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijatt]=NULL
,[Aloittaneet]=NULL
,[Tutkinto]=f.lukumaara
,[Opetustunnit]=NULL
,[Koulutukset]=NULL
,[Osallistuneet]=NULL
,[Esiopetuksen oppilaat] = NULL
,[1. luokan oppilaat] = NULL
,[1.-6. luokkien oppilaat] = NULL
,[7.-9. luokkien oppilaat] = NULL
,[Perusopetuksen suorittaneet] = NULL
,[Lisäopetuksen oppilaat] = NULL
,[15v täyttäneet, koulutusrakenne]=NULL
,[1v tutkinnon jälkeen]=NULL
,[Väestö lkm]=NULL
,[Väestöennuste]=NULL

/* Koodit */
,[Hallinnonala koodi]=d7.hallinnonala_koodi
,[Koulutuksen tavoite koodi]=d9.tutkinnon_tavoite_koodi
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen maakunta koodi]=NULL
,[Oppilaitoksen omistajatyyppi koodi]=d3.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi koodi]=d3.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi koodi]=d3.oppilaitostyyppikoodi
,[Nuorten/aikuisten koulutus koodi]=d8.nuorten_aikuisten_koulutus_koodi
,[Järjestämistapa koodi]=d4.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi
,[Järjestämismuoto koodi]=d5.koulutuksen_jarjestamismuoto_koodi
,[Tutkintotyyppi koodi]=d6.ammatillisen_koulutuksen_koulutuslaji_koodi
,[Kansalaisuus koodi]=NULL
,[Pohjoismaa koodi]=NULL
,[Äidinkieli koodi]=NULL
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=NULL
,[Pääasiallinen toiminta koodi]=NULL
,[Pääasiallinen toiminta okm koodi]=NULL
,[Tutkintolaji työllistymiseen koodi]=NULL

/* järjestykset */
,[Hallinnonala jarj]=d7.jarjestys
,[Koulutuksen tavoite jarj]=d9.jarjestys
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen maakunta jarj]=NULL
,[Oppilaitoksen omistajatyyppi jarj]=d3.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi jarj]=d3.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi jarj]=d3.jarjestys_oppilaitostyyppi
,[Nuorten/aikuisten koulutus jarj]=d8.jarjestys
,[Järjestämistapa jarj]=d4.jarjestys
,[Järjestämismuoto jarj]=d5.jarjestys
,[Tutkintotyyppi jarj]=d6.jarjestys
,[Kansalaisuus jarj]=NULL
,[Pohjoismaa jarj]=NULL
,[Äidinkieli jarj]=NULL
,[Väestön ikä jarj]=NULL
,[Väestön ikä 5v jarj]=NULL
,[Väestöennusteen maakunta jarj]=NULL
,[Pääasiallinen toiminta jarj]=NULL
,[Pääasiallinen toiminta okm jarj]=NULL
,[Tutkintolaji työllistymiseen jarj]=NULL

from [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] f
left join VipunenTK.dbo.d_koulutusluokitus as d1 on d1.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_alueluokitus as d2 on d2.id=f.yht_koulutuksen_kunta_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d3 on d3.id=f.oppilaitos_id
left join VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d4 on d4.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
left join VipunenTK.dbo.d_koulutuksen_jarjestamismuoto as d5 on d5.id=f.koulutuksen_jarjestamismuoto_id
left join VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d6 on d6.id=f.ammatillisen_koulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_hallinnonala d7 on d7.id=f.hallinnonala_id
left join VipunenTK.dbo.d_nuorten_aikuisten_koulutus d8 on d8.id=f.nuorten_aikuisten_koulutus_id
left join VipunenTK.dbo.d_tutkinnon_tavoite d9 on d9.id=f.tutkinnon_tavoite_id

UNION ALL

------------------ Korkeakoulujen Opiskelijat -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=d1.koulutusaste2002
,[Koulutusala 2002]=d1.koulutusala2002
,[Koulutusaste, taso 2]=d1.Koulutusaste_taso2
,[Koulutusala, taso 1]=d1.iscfibroad2013
,[Asuinmaakunta]=NULL
,[Koulutuksen maakunta]=d2.maakunta
,[Oppilaitoksen maakunta]=NULL
,[Oppilaitoksen omistajatyyppi]=d3.oppilaitoksen_omistajatyyppi
,[Koulutuksen järjestäjän omistajatyyppi]=d3.koulutuksen_jarjestajan_omistajatyyppi
,[Oppilaitostyyppi]=d3.oppilaitostyyppi
,[Nuorten/aikuisten koulutus]=NULL
,[Järjestämistapa]=NULL
,[Järjestämismuoto]=NULL
,[Tutkintotyyppi]=NULL
,[Kansalaisuus]=NULL
,[Pohjoismaa]=NULL
,[Äidinkieli]=Null
,[Väestön ikä]=NULL
,[Väestön ikä 5v]=NULL
,[Väestön maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL



/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijat]=f.opiskelijat
,[Aloittaneet]=f.aloittaneet
,[Tutkinto]=NULL
,[Opetustunnit]=NULL
,[Koulutukset]=NULL
,[Osallistuneet]=NULL
,[Esiopetuksen oppilaat] = NULL
,[1. luokan oppilaat] = NULL
,[1.-6. luokkien oppilaat] = NULL
,[7.-9. luokkien oppilaat] = NULL
,[Perusopetuksen suorittaneet] = NULL
,[Lisäopetuksen oppilaat] = NULL
,[15v täyttäneet, koulutusrakenne]=NULL
,[1v tutkinnon jälkeen]=NULL
,[Väestö lkm]=NULL
,[Väestöennuste]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen maakunta koodi]=NULL
,[Oppilaitoksen omistajatyyppi koodi]=d3.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi koodi]=d3.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi koodi]=d3.oppilaitostyyppikoodi
,[Nuorten/aikuisten koulutus koodi]=NULL
,[Järjestämistapa koodi]=NULL
,[Järjestämismuoto koodi]=NULL
,[Tutkintotyyppi koodi]=NULL
,[Kansalaisuus koodi]=NULL
,[Pohjoismaa koodi]=NULL
,[Äidinkieli koodi]=NULL
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=NULL
,[Pääasiallinen toiminta koodi]=NULL
,[Pääasiallinen toiminta okm koodi]=NULL
,[Tutkintolaji työllistymiseen koodi]=NULL

/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen maakunta jarj]=NULL
,[Oppilaitoksen omistajatyyppi jarj]=d3.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi jarj]=d3.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi jarj]=d3.jarjestys_oppilaitostyyppi
,[Nuorten/aikuisten koulutus jarj]=NULL
,[Järjestämistapa jarj]=NULL
,[Järjestämismuoto jarj]=NULL
,[Tutkintotyyppi jarj]=NULL
,[Kansalaisuus jarj]=NULL
,[Pohjoismaa jarj]=NULL
,[Äidinkieli jarj]=NULL
,[Väestön ikä jarj]=NULL
,[Väestön ikä 5v jarj]=NULL
,[Väestöennusteen maakunta jarj]=NULL
,[Pääasiallinen toiminta jarj]=NULL
,[Pääasiallinen toiminta okm jarj]=NULL
,[Tutkintolaji työllistymiseen jarj]=NULL


from VipunenTK.dbo.f_OTV_2_8_Korkeakouluopiskelijat as f
left join VipunenTK.dbo.d_koulutusluokitus as d1 on d1.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_alueluokitus as d2 on d2.id=f.koulutuksen_kunta_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d3 on d3.id=f.oppilaitos_id
where d1.Koulutusaste_taso2 in (''62'',''63'',''71'',''72'',''82'') AND
	(d3.oppilaitoskoodi NOT IN (''02557'',''10031'',''02358'') AND coalesce(d3.oppilaitoksen_korvaavakoodi,d3.oppilaitoskoodi) not in (''01029'',''01569'',''10102''))


UNION ALL
 
------------------ Korkeakoulujen tutkinnot -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=d1.koulutusaste2002
,[Koulutusala 2002]=d1.koulutusala2002
,[Koulutusaste, taso 2]=d1.Koulutusaste_taso2
,[Koulutusala, taso 1]=d1.iscfibroad2013
,[Asuinmaakunta]=NULL
,[Koulutuksen maakunta]=d2.maakunta
,[Oppilaitoksen maakunta]=NULL
,[Oppilaitoksen omistajatyyppi]=d3.oppilaitoksen_omistajatyyppi
,[Koulutuksen järjestäjän omistajatyyppi]=d3.koulutuksen_jarjestajan_omistajatyyppi
,[Oppilaitostyyppi]=d3.oppilaitostyyppi
,[Nuorten/aikuisten koulutus]=NULL
,[Järjestämistapa]=NULL
,[Järjestämismuoto]=NULL
,[Tutkintotyyppi]=NULL
,[Kansalaisuus]=NULL
,[Pohjoismaa]=NULL
,[Äidinkieli]=NULL
,[Väestön ikä]=NULL
,[Väestön ikä 5v]=NULL
,[Väestön maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL



/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijatt]=NULL
,[Aloittaneet]=NULL
,[Tutkinto]=f.lukumaara
,[Opetustunnit]=NULL
,[Koulutukset]=NULL
,[Osallistuneet]=NULL
,[Esiopetuksen oppilaat] = NULL
,[1. luokan oppilaat] = NULL
,[1.-6. luokkien oppilaat] = NULL
,[7.-9. luokkien oppilaat] = NULL
,[Perusopetuksen suorittaneet] = NULL
,[Lisäopetuksen oppilaat] = NULL
,[15v täyttäneet, koulutusrakenne]=NULL
,[1v tutkinnon jälkeen]=NULL
,[Väestö lkm]=NULL
,[Väestöennuste]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen maakunta koodi]=NULL
,[Oppilaitoksen omistajatyyppi koodi]=d3.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi koodi]=d3.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi koodi]=d3.oppilaitostyyppikoodi
,[Nuorten/aikuisten koulutus koodi]=NULL
,[Järjestämistapa koodi]=NULL
,[Järjestämismuoto koodi]=NULL
,[Tutkintotyyppi koodi]=NULL
,[Kansalaisuus koodi]=NULL
,[Pohjoismaa koodi]=NULL
,[Äidinkieli koodi]=NULL
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=NULL
,[Pääasiallinen toiminta koodi]=NULL
,[Pääasiallinen toiminta okm koodi]=NULL
,[Tutkintolaji työllistymiseen koodi]=NULL

/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen maakunta jarj]=NULL
,[Oppilaitoksen omistajatyyppi jarj]=d3.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi jarj]=d3.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi jarj]=d3.jarjestys_oppilaitostyyppi
,[Nuorten/aikuisten koulutus jarj]=NULL
,[Järjestämistapa jarj]=NULL
,[Järjestämismuoto jarj]=NULL
,[Tutkintotyyppi jarj]=NULL
,[Kansalaisuus jarj]=NULL
,[Pohjoismaa jarj]=NULL
,[Äidinkieli jarj]=NULL
,[Väestön ikä jarj]=NULL
,[Väestön ikä 5v jarj]=NULL
,[Väestöennusteen maakunta jarj]=NULL
,[Pääasiallinen toiminta jarj]=NULL
,[Pääasiallinen toiminta okm jarj]=NULL
,[Tutkintolaji työllistymiseen jarj]=NULL


from VipunenTK.dbo.f_OTV_2_9_Korkeakoulututkinnot f
left join VipunenTK.dbo.d_koulutusluokitus as d1 on d1.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_alueluokitus as d2 on d2.id=f.koulutuksen_kunta_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d3 on d3.id=f.oppilaitos_id
where d1.Koulutusaste_taso2 in (''62'',''63'',''71'',''72'',''82'') AND
	(d3.oppilaitoskoodi NOT IN (''02557'',''10031'',''02358'') AND coalesce(d3.oppilaitoksen_korvaavakoodi,d3.oppilaitoskoodi) not in (''01029'',''01569'',''10102''))


UNION ALL


------------------ Tutkintoon johtamaton koulutus -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=NULL
,[Koulutusala 2002]=NULL
,[Koulutusaste, taso 2]=NULL
,[Koulutusala, taso 1]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen maakunta]=NULL
,[Oppilaitoksen maakunta]=d2.maakunta
,[Oppilaitoksen omistajatyyppi]=d4.oppilaitoksen_omistajatyyppi
,[Koulutuksen järjestäjän omistajatyyppi]=d4.koulutuksen_jarjestajan_omistajatyyppi
,[Oppilaitostyyppi]=d4.oppilaitostyyppi
,[Nuorten/aikuisten koulutus]=NULL
,[Järjestämistapa]=NULL
,[Järjestämismuoto]=NULL
,[Tutkintotyyppi]=NULL
,[Kansalaisuus]=NULL
,[Pohjoismaa]=NULL
,[Äidinkieli]=NULL
,[Väestön ikä]=NULL
,[Väestön ikä 5v]=NULL
,[Väestön maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL



/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijatt]=NULL
,[Aloittaneet]=NULL
,[Tutkinto]=NULL
,[Opetustunnit]=case when d3.Koulutusala!=''Muut mittarit'' then f.[Opetustuntien lukumäärä] else NULL end
,[Koulutukset]=case when d3.Opintoala=''Oppilaitosten tutkintoon johtamaton koulutus koulutustyypeittäin'' then f.[Koulutusten lukumäärä] else NULL end
,[Osallistuneet]=case when d3.Opintoala=''Oppilaitosten tutkintoon johtamaton koulutus koulutustyypeittäin'' then f.[Osallistuneiden lukumäärä] else NULL end
,[Esiopetuksen oppilaat] = NULL
,[1. luokan oppilaat] = NULL
,[1.-6. luokkien oppilaat] = NULL
,[7.-9. luokkien oppilaat] = NULL
,[Perusopetuksen suorittaneet] = NULL
,[Lisäopetuksen oppilaat] = NULL
,[15v täyttäneet, koulutusrakenne]=NULL
,[1v tutkinnon jälkeen]=NULL
,[Väestö lkm]=NULL
,[Väestöennuste]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=NULL
,[Koulutusala 2002 koodi]=NULL
,[Koulutusaste, taso 2 koodi]=NULL
,[Koulutusala, taso 1 koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen maakunta koodi]=NULL
,[Oppilaitoksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen omistajatyyppi koodi]=d4.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi koodi]=d4.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi koodi]=d4.oppilaitostyyppikoodi
,[Nuorten/aikuisten koulutus koodi]=NULL
,[Järjestämistapa koodi]=NULL
,[Järjestämismuoto koodi]=NULL
,[Tutkintotyyppi koodi]=NULL
,[Kansalaisuus koodi]=NULL
,[Pohjoismaa koodi]=NULL
,[Äidinkieli koodi]=NULL
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=NULL
,[Pääasiallinen toiminta koodi]=NULL
,[Pääasiallinen toiminta okm koodi]=NULL
,[Tutkintolaji työllistymiseen koodi]=NULL

/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=NULL
,[Koulutusala 2002 jarj]=NULL
,[Koulutusaste, taso 2 jarj]=NULL
,[Koulutusala, taso 1 jarj]=NULL
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta jarj]=NULL
,[Oppilaitoksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen omistajatyyppi jarj]=d4.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi jarj]=d4.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi jarj]=d4.jarjestys_oppilaitostyyppi
,[Nuorten/aikuisten koulutus jarj]=NULL
,[Järjestämistapa jarj]=NULL
,[Järjestämismuoto jarj]=NULL
,[Tutkintotyyppi jarj]=NULL
,[Kansalaisuus jarj]=NULL
,[Pohjoismaa jarj]=NULL
,[Äidinkieli jarj]=NULL
,[Väestön ikä jarj]=NULL
,[Väestön ikä 5v jarj]=NULL
,[Väestöennusteen maakunta jarj]=NULL
,[Pääasiallinen toiminta jarj]=NULL
,[Pääasiallinen toiminta okm jarj]=NULL
,[Tutkintolaji työllistymiseen jarj]=NULL


FROM VipunenTK.dbo.f_TJK_2_11_tutkintoon_johtamaton_koulutus f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijaintikunta_id
left join VipunenTK.dbo.d_opetustuntien_sisalto_ja_tavoiteluokitus d3 on d3.id=f.opetustunti_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d4 on d4.id=f.oppilaitos_id
where d4.oppilaitostyyppi in (''Liikunnan koulutuskeskukset'',''Kansanopistot'',''Kansalaisopistot'',''Opintokeskukset'',''Kesäyliopistot'')

UNION ALL

------------------ Esi- ja perusopetuksen oppilaat ja tutkinnon suorittaneet -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=NULL
,[Koulutusala 2002]=NULL
,[Koulutusaste, taso 2]=NULL
,[Koulutusala, taso 1]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen maakunta]=NULL
,[Oppilaitoksen maakunta]=d2.maakunta
,[Oppilaitoksen omistajatyyppi]=d4.oppilaitoksen_omistajatyyppi
,[Koulutuksen järjestäjän omistajatyyppi]=d4.koulutuksen_jarjestajan_omistajatyyppi
,[Oppilaitostyyppi]=d4.oppilaitostyyppi
,[Nuorten/aikuisten koulutus]=NULL
,[Järjestämistapa]=NULL
,[Järjestämismuoto]=NULL
,[Tutkintotyyppi]=NULL
,[Kansalaisuus]=NULL
,[Pohjoismaa]=NULL
,[Äidinkieli]=NULL
,[Väestön ikä]=NULL
,[Väestön ikä 5v]=NULL
,[Väestön maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL



/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijatt]=NULL
,[Aloittaneet]=NULL
,[Tutkinto]=NULL
,[Opetustunnit]=NULL
,[Koulutukset]=NULL
,[Osallistuneet]=NULL
,[Esiopetuksen oppilaat] = sum(f.ove)
,[1. luokan oppilaat] = sum(f.ov1)
,[1.-6. luokkien oppilaat] = sum(isnull(f.ov1,0))+sum(isnull(f.ov2,0))+sum(isnull(f.ov3,0))+sum(isnull(f.ov4,0))+sum(isnull(f.ov5,0))+sum(isnull(f.ov6,0))
,[7.-9. luokkien oppilaat] = sum(isnull(f.ov7,0))+sum(isnull(f.ov8,0))+sum(isnull(f.ov9,0))
,[Perusopetuksen suorittaneet] = sum(isnull(f.tod,0))+sum(isnull(f.tutkt,0))
,[Lisäopetuksen oppilaat] = sum(f.ov10)
,[15v täyttäneet, koulutusrakenne]=NULL
,[1v tutkinnon jälkeen]=NULL
,[Väestö lkm]=NULL
,[Väestöennuste]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=NULL
,[Koulutusala 2002 koodi]=NULL
,[Koulutusaste, taso 2 koodi]=NULL
,[Koulutusala, taso 1 koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen maakunta koodi]=NULL
,[Oppilaitoksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen omistajatyyppi koodi]=d4.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi koodi]=d4.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi koodi]=d4.oppilaitostyyppikoodi
,[Nuorten/aikuisten koulutus koodi]=NULL
,[Järjestämistapa koodi]=NULL
,[Järjestämismuoto koodi]=NULL
,[Tutkintotyyppi koodi]=NULL
,[Kansalaisuus koodi]=NULL
,[Pohjoismaa koodi]=NULL
,[Äidinkieli koodi]=NULL
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=NULL
,[Pääasiallinen toiminta koodi]=NULL
,[Pääasiallinen toiminta okm koodi]=NULL
,[Tutkintolaji työllistymiseen koodi]=NULL

/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=NULL
,[Koulutusala 2002 jarj]=NULL
,[Koulutusaste, taso 2 jarj]=NULL
,[Koulutusala, taso 1 jarj]=NULL
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta jarj]=NULL
,[Oppilaitoksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen omistajatyyppi jarj]=d4.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi jarj]=d4.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi jarj]=d4.jarjestys_oppilaitostyyppi
,[Nuorten/aikuisten koulutus jarj]=NULL
,[Järjestämistapa jarj]=NULL
,[Järjestämismuoto jarj]=NULL
,[Tutkintotyyppi jarj]=NULL
,[Kansalaisuus jarj]=NULL
,[Pohjoismaa jarj]=NULL
,[Äidinkieli jarj]=NULL
,[Väestön ikä jarj]=NULL
,[Väestön ikä 5v jarj]=NULL
,[Väestöennusteen maakunta jarj]=NULL
,[Pääasiallinen toiminta jarj]=NULL
,[Pääasiallinen toiminta okm jarj]=NULL
,[Tutkintolaji työllistymiseen jarj]=NULL

FROM VipunenTK.dbo.f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijaintikunta_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d4 on d4.id=f.oppilaitos_id
where f.oppilaitoksen_sijaintikunta<>200 and d1.sukupuoli<>''Tuntematon''
Group by 
	 f.tilastointivuosi
	,d2.maakunta
	,d2.maakunta_koodi
	,d2.jarjestys_maakunta
	,d4.oppilaitoksen_omistajatyyppi
	,d4.oppilaitoksen_omistajatyyppikoodi
	,d4.koulutuksen_jarjestajan_omistajatyyppi
	,d4.koulutuksen_jarjestajan_omistajatyyppikoodi
	,d4.oppilaitostyyppi
	,d4.oppilaitostyyppikoodi
	,d4.jarjestys_oppilaitostyyppi

having sum(f.ove)>0 
	or sum(f.ov1)>0
	or sum(f.ov2)>0
	or sum(f.ov3)>0
	or sum(f.ov4)>0
	or sum(f.ov5)>0
	or sum(f.ov6)>0
	or sum(f.ov7)>0
	or sum(f.ov8)>0
	or sum(f.ov9)>0
	or sum(f.ov10)>0
	or sum(f.tod)>0
	or sum(f.tutkt)>0
	or sum(f.luok1)>0
	or sum(f.luok2)>0
	or sum(f.luok3)>0
	or sum(f.luok4)>0
	or sum(f.luok5)>0
	or sum(f.luok6)>0
	or sum(f.luok7)>0
	or sum(f.luok8)>0
	or sum(f.luok9)>0

UNION ALL

------------------ Väestön koulutusrakenne -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=d1.koulutusaste2002
,[Koulutusala 2002]=d1.koulutusala2002
,[Koulutusaste, taso 2]=d1.Koulutusaste_taso2
,[Koulutusala, taso 1]=d1.iscfibroad2013
,[Asuinmaakunta]=d12.maakunta
,[Koulutuksen maakunta]=d11.maakunta
,[Oppilaitoksen maakunta]=NULL
,[Oppilaitoksen omistajatyyppi]=NULL
,[Koulutuksen järjestäjän omistajatyyppi]=NULL
,[Oppilaitostyyppi]=NULL
,[Nuorten/aikuisten koulutus]=NULL
,[Järjestämistapa]=NULL
,[Järjestämismuoto]=NULL
,[Tutkintotyyppi]=NULL
,[Kansalaisuus]=NULL
,[Pohjoismaa]=NULL
,[Äidinkieli]=NULL
,[Väestön ikä]=d18.ika
,[Väestön ikä 5v]=d6.ika5v
,[Väestön maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL



/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijatt]=NULL
,[Aloittaneet]=NULL
,[Tutkinto]=NULL
,[Opetustunnit]=NULL
,[Koulutukset]=NULL
,[Osallistuneet]=NULL
,[Esiopetuksen oppilaat] = NULL
,[1. luokan oppilaat] = NULL
,[1.-6. luokkien oppilaat] = NULL
,[7.-9. luokkien oppilaat] = NULL
,[Perusopetuksen suorittaneet] = NULL
,[Lisäopetuksen oppilaat] = NULL
,[15v täyttäneet, koulutusrakenne]=f.lukumaara
,[1v tutkinnon jälkeen]=NULL
,[Väestö lkm]=NULL
,[Väestöennuste]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinmaakunta koodi]=d12.maakunta_koodi
,[Koulutuksen maakunta koodi]=NULL
,[Oppilaitoksen maakunta koodi]=NULL
,[Oppilaitoksen omistajatyyppi koodi]=NULL
,[Koulutuksen järjestäjän omistajatyyppi koodi]=NULL
,[Oppilaitostyyppi koodi]=NULL
,[Nuorten/aikuisten koulutus koodi]=NULL
,[Järjestämistapa koodi]=NULL
,[Järjestämismuoto koodi]=NULL
,[Tutkintotyyppi koodi]=NULL
,[Kansalaisuus koodi]=NULL
,[Pohjoismaa koodi]=NULL
,[Äidinkieli koodi]=NULL
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=NULL
,[Pääasiallinen toiminta koodi]=NULL
,[Pääasiallinen toiminta okm koodi]=NULL
,[Tutkintolaji työllistymiseen koodi]=NULL

/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=d12.jarjestys_maakunta
,[Koulutuksen maakunta jarj]=NULL
,[Oppilaitoksen maakunta jarj]=NULL
,[Oppilaitoksen omistajatyyppi jarj]=NULL
,[Koulutuksen järjestäjän omistajatyyppi jarj]=NULL
,[Oppilaitostyyppi jarj]=NULL
,[Nuorten/aikuisten koulutus jarj]=NULL
,[Järjestämistapa jarj]=NULL
,[Järjestämismuoto jarj]=NULL
,[Tutkintotyyppi jarj]=NULL
,[Kansalaisuus jarj]=NULL
,[Pohjoismaa jarj]=NULL
,[Äidinkieli jarj]=NULL
,[Väestön ikä jarj]=d18.jarjestys_ika
,[Väestön ikä 5v jarj]=d6.jarjestys_ika5v
,[Väestöennusteen maakunta jarj]=NULL
,[Pääasiallinen toiminta jarj]=NULL
,[Pääasiallinen toiminta okm jarj]=NULL
,[Tutkintolaji työllistymiseen jarj]=NULL


FROM dbo.f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta f
	  JOIN d_koulutusluokitus d1 on d1.id = koulutusluokitus_id
	  JOIN d_kausi d2 on d2.kausi_id = tutkinnon_suoritusvuosi_id
	  JOIN d_kausi d3 on d3.kausi_id = syntymavuosi_id
	  JOIN d_oppisopimuskoulutus d4 on d4.id = oppisopimuskoulutus_id
	  JOIN d_sukupuoli d5 on d5.id = sukupuoli_id
	  JOIN d_ika d6 on d6.id = vaeston_ika_5v_id
	  JOIN d_aidinkieli_versio1 d7 on d7.id = aidinkieli_versio1_id
	  JOIN d_valtio d8 on d8.id = eumaa_id
	  JOIN d_valtio d9 on d9.id = etamaa_id
	  JOIN d_pohjoismaa d10 on d10.id = pohjoismaa_id
	  JOIN d_alueluokitus d11 on d11.id = tutkinnon_suoritusmaakunta_id
	  JOIN d_alueluokitus d12 on d12.id = asuinmaakunta_id
	  JOIN d_kansalaisuus_versio1 d13 on d13.id = kansalaisuus_versio1_id
	  JOIN d_ika d18 on d18.id = vaeston_ika_1v_id
	  JOIN d_ika d19 on d19.id = tutkinnon_suoritusika_1v_id
	  JOIN d_ika d20 on d20.id = tutkinnon_ika_1v_id
	  JOIN d_koulutusmuoto d21 on d21.id = koulutusmuoto_id
	  JOIN d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d22 on d22.id = ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_id
	  WHERE aineisto = ''R''

UNION ALL

------------------ Tutkinnon suorittaneiden pääasiallinen toiminta -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=d1.koulutusaste2002
,[Koulutusala 2002]=d1.koulutusala2002
,[Koulutusaste, taso 2]=d1.Koulutusaste_taso2
,[Koulutusala, taso 1]=d1.iscfibroad2013
,[Asuinmaakunta]=d12.maakunta
,[Koulutuksen maakunta]=NULL
,[Oppilaitoksen maakunta]=NULL
,[Oppilaitoksen omistajatyyppi]=NULL
,[Koulutuksen järjestäjän omistajatyyppi]=NULL
,[Oppilaitostyyppi]=NULL
,[Nuorten/aikuisten koulutus]=NULL
,[Järjestämistapa]=NULL
,[Järjestämismuoto]=NULL
,[Tutkintotyyppi]=NULL
,[Kansalaisuus]=NULL
,[Pohjoismaa]=NULL
,[Äidinkieli]=NULL
,[Väestön ikä]=NULL
,[Väestön ikä 5v]=NULL
,[Väestön maakunta]=NULL
,[Pääasiallinen toiminta]=d2.paaasiallinen_toiminta_ja_maasta_muuttaneet
,[Pääasiallinen toiminta okm]=d25.paaasiallinen_toiminta_okm
,[Tutkintolaji työllistymiseen]=d3.tutkintolaji_tyollistymiseen



/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijatt]=NULL
,[Aloittaneet]=NULL
,[Tutkinto]=NULL
,[Opetustunnit]=NULL
,[Koulutukset]=NULL
,[Osallistuneet]=NULL
,[Esiopetuksen oppilaat] = NULL
,[1. luokan oppilaat] = NULL
,[1.-6. luokkien oppilaat] = NULL
,[7.-9. luokkien oppilaat] = NULL
,[Perusopetuksen suorittaneet] = NULL
,[Lisäopetuksen oppilaat] = NULL
,[15v täyttäneet, koulutusrakenne]=NULL
,[1v tutkinnon jälkeen]=f.sijoittuminen_1v_tutkinnon_jalkeen
,[Väestö lkm]=NULL
,[Väestöennuste]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinmaakunta koodi]=d12.maakunta_koodi
,[Koulutuksen maakunta koodi]=NULL
,[Oppilaitoksen maakunta koodi]=NULL
,[Oppilaitoksen omistajatyyppi koodi]=NULL
,[Koulutuksen järjestäjän omistajatyyppi koodi]=NULL
,[Oppilaitostyyppi koodi]=NULL
,[Nuorten/aikuisten koulutus koodi]=NULL
,[Järjestämistapa koodi]=NULL
,[Järjestämismuoto koodi]=NULL
,[Tutkintotyyppi koodi]=NULL
,[Kansalaisuus koodi]=NULL
,[Pohjoismaa koodi]=NULL
,[Äidinkieli koodi]=NULL
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=NULL
,[Pääasiallinen toiminta koodi]=d2.paaasiallinen_toiminta_ja_maasta_muuttaneet_koodi
,[Pääasiallinen toiminta okm koodi]=d25.paaasiallinen_toiminta_okm_koodi
,[Tutkintolaji työllistymiseen koodi]=d3.tutkintolaji_tyollistymiseen_koodi

/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=d12.jarjestys_maakunta
,[Koulutuksen maakunta jarj]=NULL
,[Oppilaitoksen maakunta jarj]=NULL
,[Oppilaitoksen omistajatyyppi jarj]=NULL
,[Koulutuksen järjestäjän omistajatyyppi jarj]=NULL
,[Oppilaitostyyppi jarj]=NULL
,[Nuorten/aikuisten koulutus jarj]=NULL
,[Järjestämistapa jarj]=NULL
,[Järjestämismuoto jarj]=NULL
,[Tutkintotyyppi jarj]=NULL
,[Kansalaisuus jarj]=NULL
,[Pohjoismaa jarj]=NULL
,[Äidinkieli jarj]=NULL
,[Väestön ikä jarj]=NULL
,[Väestön ikä 5v jarj]=NULL
,[Väestöennusteen maakunta jarj]=NULL
,[Pääasiallinen toiminta jarj]=d2.jarjestys
,[Pääasiallinen toiminta okm jarj]=d25.jarjestys
,[Tutkintolaji työllistymiseen jarj]=d3.jarjestys



FROM dbo.f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta f
	  JOIN d_koulutusluokitus d1 on d1.id = koulutusluokitus_id
	  JOIN d_paaasiallinen_toiminta_ja_maasta_muuttaneet d2 on d2.id = paaasiallinen_toiminta_ja_maasta_muuttaneet_id
	  JOIN d_tutkintolaji_tyollistymiseen d3 on d3.id = tutkintolaji_tyollistymiseen_id
	  JOIN d_ammattiluokitus_2010 d4 on d4.id = ammattiluokitus_2010_id
	  JOIN d_ammattiasema d5 on d5.id = ammattiasema_id
	  JOIN d_maassaolo d6 on d6.id = maassaolo_id
	  JOIN d_oppisopimuskoulutus d7 on d7.id = oppisopimuskoulutus_id
	  JOIN d_aikuisopiskelija d8 on d8.id = aikuisopiskelija_id
	  JOIN d_oppilaitoksen_taustatiedot d9 on d9.id = oppilaitos_id
	  JOIN d_oppilaitoksen_taustatiedot d10 on d10.id = koulutuksen_jarjestaja_id
	  JOIN d_alueluokitus d11 on d11.id = tutkinnon_suorittamismaakunta_id
	  JOIN d_alueluokitus d12 on d12.id = asuinmaakunta_id
	  JOIN d_valiaikainen_amk d13 on d13.id = valiaikainen_amk_id
	  JOIN d_koulutusmuoto d21 on d21.id = koulutusmuoto_id
	  JOIN d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d22 on d22.id = ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_id
	  JOIN d_paaasiallinen_toiminta_okm d25 on d25.id = paaasiallinen_toiminta_okm_id
Where d1.koulutusaste2002 in (''31'',''32'',''62'',''63'',''71'',''72'',''82'')

UNION ALL

------------------ Väestö -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=NULL
,[Koulutusala 2002]=NULL
,[Koulutusaste, taso 2]=NULL
,[Koulutusala, taso 1]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen maakunta]=NULL
,[Oppilaitoksen maakunta]=NULL
,[Oppilaitoksen omistajatyyppi]=NULL
,[Koulutuksen järjestäjän omistajatyyppi]=NULL
,[Oppilaitostyyppi]=NULL
,[Nuorten/aikuisten koulutus]=NULL
,[Järjestämistapa]=NULL
,[Järjestämismuoto]=NULL
,[Tutkintotyyppi]=NULL
,[Kansalaisuus]=d5.kansalaisuus_versio1
,[Pohjoismaa]=d6.pohjoismaa
,[Äidinkieli]=d4.aidinkieli_versio2
,[Väestön ikä]=d3.ika
,[Väestön ikä 5v]=d3.ika5v
,[Väestön maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL



/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijatt]=NULL
,[Aloittaneet]=NULL
,[Tutkinto]=NULL
,[Opetustunnit]=NULL
,[Koulutukset]=NULL
,[Osallistuneet]=NULL
,[Esiopetuksen oppilaat] = NULL
,[1. luokan oppilaat] = NULL
,[1.-6. luokkien oppilaat] = NULL
,[7.-9. luokkien oppilaat] = NULL
,[Perusopetuksen suorittaneet] = NULL
,[Lisäopetuksen oppilaat] = NULL
,[15v täyttäneet, koulutusrakenne]=NULL
,[1v tutkinnon jälkeen]=NULL
,[Väestö lkm]=f.lukumaara
,[Väestöennuste]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=NULL
,[Koulutusala 2002 koodi]=NULL
,[Koulutusaste, taso 2 koodi]=NULL
,[Koulutusala, taso 1 koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen maakunta koodi]=NULL
,[Oppilaitoksen maakunta koodi]=NULL
,[Oppilaitoksen omistajatyyppi koodi]=NULL
,[Koulutuksen järjestäjän omistajatyyppi koodi]=NULL
,[Oppilaitostyyppi koodi]=NULL
,[Nuorten/aikuisten koulutus koodi]=NULL
,[Järjestämistapa koodi]=NULL
,[Järjestämismuoto koodi]=NULL
,[Tutkintotyyppi koodi]=NULL
,[Kansalaisuus koodi]=d5.kansalaisuus_versio1_koodi
,[Pohjoismaa koodi]=d6.pohjoismaa_koodi
,[Äidinkieli koodi]=d4.aidinkieli_versio2_koodi
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=NULL
,[Pääasiallinen toiminta koodi]=NULL
,[Pääasiallinen toiminta okm koodi]=NULL
,[Tutkintolaji työllistymiseen koodi]=NULL

/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=NULL
,[Koulutusala 2002 jarj]=NULL
,[Koulutusaste, taso 2 jarj]=NULL
,[Koulutusala, taso 1 jarj]=NULL
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta jarj]=NULL
,[Oppilaitoksen maakunta jarj]=NULL
,[Oppilaitoksen omistajatyyppi jarj]=NULL
,[Koulutuksen järjestäjän omistajatyyppi jarj]=NULL
,[Oppilaitostyyppi jarj]=NULL
,[Nuorten/aikuisten koulutus jarj]=NULL
,[Järjestämistapa jarj]=NULL
,[Järjestämismuoto jarj]=NULL
,[Tutkintotyyppi jarj]=NULL
,[Kansalaisuus jarj]=d5.jarjestys
,[Pohjoismaa jarj]=d6.jarjestys
,[Äidinkieli jarj]=d4.jarjestys
,[Väestön ikä jarj]=d3.jarjestys_ika
,[Väestön ikä 5v jarj]=d3.jarjestys_ika5v
,[Väestöennusteen maakunta jarj]=NULL
,[Pääasiallinen toiminta jarj]=NULL
,[Pääasiallinen toiminta okm jarj]=NULL
,[Tutkintolaji työllistymiseen jarj]=NULL

FROM vipunentk.dbo.f_4_9_Vaestorakenne_kunnittain f
LEFT JOIN VipunenTK.dbo.d_alueluokitus d1 on d1.id=f.kotikunta_id
LEFT JOIN VipunenTK.dbo.d_sukupuoli d2 on d2.id=f.sukupuoli_id
LEFT JOIN VipunenTK.dbo.d_ika d3 on d3.id=f.ika_id
LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio2 d4 on d4.id=f.aidinkieli_versio2_id
LEFT JOIN VipunenTK.dbo.d_kansalaisuus_versio1 d5 on d5.id=f.kansalaisuus_versio1_id
LEFT JOIN VipunenTK.dbo.d_pohjoismaa d6 on d6.id=f.pohjoismaa_id
LEFT JOIN VipunenTK.dbo.d_valtio d7 on d7.id=f.eumaa_id
LEFT JOIN VipunenTK.dbo.d_valtio d8 on d8.id=f.etamaa_id
LEFT JOIN VipunenTK.dbo.d_valtio d9 on d9.id=f.maanosa_id

UNION ALL

------------------ Väestöennuste -----------------
select
 [Tilastovuosi]=NULL
,[Ennustevuosi]=f.ennv
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=NULL
,[Koulutusala 2002]=NULL
,[Koulutusaste, taso 2]=NULL
,[Koulutusala, taso 1]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen maakunta]=NULL
,[Oppilaitoksen maakunta]=NULL
,[Oppilaitoksen omistajatyyppi]=NULL
,[Koulutuksen järjestäjän omistajatyyppi]=NULL
,[Oppilaitostyyppi]=NULL
,[Nuorten/aikuisten koulutus]=NULL
,[Järjestämistapa]=NULL
,[Järjestämismuoto]=NULL
,[Tutkintotyyppi]=NULL
,[Kansalaisuus]=NULL
,[Pohjoismaa]=NULL
,[Äidinkieli]=NULL
,[Väestön ikä]=d3.ika
,[Väestön ikä 5v]=d3.ika5v
,[Väestöennusteen maakunta]=d1.maakunta
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL



/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijatt]=NULL
,[Aloittaneet]=NULL
,[Tutkinto]=NULL
,[Opetustunnit]=NULL
,[Koulutukset]=NULL
,[Osallistuneet]=NULL
,[Esiopetuksen oppilaat] = NULL
,[1. luokan oppilaat] = NULL
,[1.-6. luokkien oppilaat] = NULL
,[7.-9. luokkien oppilaat] = NULL
,[Perusopetuksen suorittaneet] = NULL
,[Lisäopetuksen oppilaat] = NULL
,[15v täyttäneet, koulutusrakenne]=NULL
,[1v tutkinnon jälkeen]=NULL
,[Väestö lkm]=NULL
,[Väestöennuste]=f.lkm

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=NULL
,[Koulutusala 2002 koodi]=NULL
,[Koulutusaste, taso 2 koodi]=NULL
,[Koulutusala, taso 1 koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen maakunta koodi]=NULL
,[Oppilaitoksen maakunta koodi]=NULL
,[Oppilaitoksen omistajatyyppi koodi]=NULL
,[Koulutuksen järjestäjän omistajatyyppi koodi]=NULL
,[Oppilaitostyyppi koodi]=NULL
,[Nuorten/aikuisten koulutus koodi]=NULL
,[Järjestämistapa koodi]=NULL
,[Järjestämismuoto koodi]=NULL
,[Tutkintotyyppi koodi]=NULL
,[Kansalaisuus koodi]=NULL
,[Pohjoismaa koodi]=NULL
,[Äidinkieli koodi]=NULL
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=d1.maakunta_koodi
,[Pääasiallinen toiminta koodi]=NULL
,[Pääasiallinen toiminta okm koodi]=NULL
,[Tutkintolaji työllistymiseen koodi]=NULL


/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=NULL
,[Koulutusala 2002 jarj]=NULL
,[Koulutusaste, taso 2 jarj]=NULL
,[Koulutusala, taso 1 jarj]=NULL
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta jarj]=NULL
,[Oppilaitoksen maakunta jarj]=NULL
,[Oppilaitoksen omistajatyyppi jarj]=NULL
,[Koulutuksen järjestäjän omistajatyyppi jarj]=NULL
,[Oppilaitostyyppi jarj]=NULL
,[Nuorten/aikuisten koulutus jarj]=NULL
,[Järjestämistapa jarj]=NULL
,[Järjestämismuoto jarj]=NULL
,[Tutkintotyyppi jarj]=NULL
,[Kansalaisuus jarj]=NULL
,[Pohjoismaa jarj]=NULL
,[Äidinkieli jarj]=NULL
,[Väestön ikä jarj]=d3.jarjestys_ika
,[Väestön ikä 5v jarj]=d3.jarjestys_ika5v
,[Väestöennusteen maakunta jarj]=d1.jarjestys_maakunta
,[Pääasiallinen toiminta jarj]=NULL
,[Pääasiallinen toiminta okm jarj]=NULL
,[Tutkintolaji työllistymiseen jarj]=NULL


FROM vipunentk.dbo.f_Vaestoennuste f
LEFT JOIN VipunenTK.dbo.d_alueluokitus d1 on d1.id=f.tilvaskun_id
LEFT JOIN VipunenTK.dbo.d_sukupuoli d2 on d2.id=f.sp_id
LEFT JOIN VipunenTK.dbo.d_ika d3 on d3.id=f.ika_id
where lkm>0
'
GO

USE [ANTERO]