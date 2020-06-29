USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_tab_tietoja_maakunnista]    Script Date: 29.6.2020 12:36:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [dbo].[v_tab_tietoja_maakunnista] as 
/*------------------ 2. aste Opiskelijat (K 2019) -----------------*/
select 
 [Tilastovuosi]=f.tilv
,[Ennustevuosi]=NULL
,[Hallinnonala]=d7.hallinnonala
,[Koulutuksen tavoite]=d9.koulutuksen_tavoite_toteuma
,[Koulutusaste 2002]=d1.koulutusaste2002
,[Koulutusala 2002]=d1.koulutusala2002
,[Koulutusaste, taso 2]=d1.Koulutusaste_taso2
,[Koulutusala, taso 1]=d1.iscfibroad2013
,[Asuinkunta]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen kunta historia]=d2b.kunta
,[Koulutuksen kunta]=d2.kunta
,[Oppilaitoksen kunta historia]=d22b.kunta
,[Oppilaitoksen kunta]=d22.kunta
,[Koulutuksen maakunta historia]=d2b.maakunta
,[Koulutuksen maakunta]=d2.maakunta
,[Oppilaitoksen maakunta historia]=d22b.maakunta
,[Oppilaitoksen maakunta]=d22.maakunta
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
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] = NULL
,[Tutkinnon suoritusvuosi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= NULL
,[Tutkinnon suoritusmaakunta]=NULL
,[Oppilaitos]=d3.oppilaitos
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d2.maakunta

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
,[Koulut lkm]=NULL
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=d9.koulutuksen_tavoite_toteuma_koodi
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinkunta koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen kunta koodi historia]=d2b.kunta_koodi
,[Koulutuksen kunta koodi]=d2.kunta_koodi
,[Oppilaitoksen kunta koodi historia]=d22b.kunta_koodi
,[Oppilaitoksen kunta koodi]=d22.kunta_koodi
,[Koulutuksen maakunta koodi historia]=d2b.maakunta_koodi
,[Koulutuksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen maakunta koodi historia]=d22b.maakunta_koodi
,[Oppilaitoksen maakunta koodi]=d22.maakunta_koodi
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
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= NULL
,[Tutkinnon suoritusmaakunta koodi]=NULL
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]=d3.oppilaitoskoodi
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL


/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=d9.jarjestys
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta historia jarj]=d2b.jarjestys_maakunta
,[Koulutuksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen maakunta historia jarj]=d22b.jarjestys_maakunta
,[Oppilaitoksen maakunta jarj]=d22.jarjestys_maakunta
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
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=NULL
,[tutksuor_al_jarjestys_maakunta]=NULL
,[koul_paattaneiden_toiminta_jarjestys]=NULL
,[haku_koulutuksiin_jarjestys]=NULL
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d2.jarjestys_maakunta

from VipunenTK.dbo.f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat as f
left join VipunenTK.dbo.d_koulutusluokitus as d1 on d1.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_alueluokitus as d2 on d2.id=f.koulutuksen_kunta_id
left join VipunenTK.dbo.d_alueluokitus_historia as d2b on d2b.id=f.koulutuksen_kunta_historia_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d3 on d3.id=f.oppilaitos_id
left join VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d4 on d4.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
left join VipunenTK.dbo.d_koulutuksen_jarjestamismuoto as d5 on d5.id=f.koulutuksen_jarjestamismuoto_id
left join VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d6 on d6.id=f.ammatillisen_koulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_hallinnonala d7 on d7.id=f.hallinnonala_id
left join VipunenTK.dbo.d_nuorten_aikuisten_koulutus d8 on d8.id=f.nuorten_aikuisten_koulutus_id
left join VipunenTK.dbo.d_koulutuksen_tavoite_toteuma d9 on d9.id=f.koulutuksen_tavoite_toteuma_id
left join VipunenTK.dbo.d_alueluokitus d22 on d22.id=f.oppilaitos_kunta_id
left join VipunenTK.dbo.d_alueluokitus_historia d22b on d22b.id=f.oppilaitos_kunta_historia_id

UNION ALL

------------------ 2. aste tutkinnot (K 2019)-----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=d7.hallinnonala
,[Koulutuksen tavoite]=d9.koulutuksen_tavoite_toteuma
,[Koulutusaste 2002]=d1.koulutusaste2002
,[Koulutusala 2002]=d1.koulutusala2002
,[Koulutusaste, taso 2]=d1.Koulutusaste_taso2
,[Koulutusala, taso 1]=d1.iscfibroad2013
,[Asuinkunta]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen kunta historia]=d2b.kunta
,[Koulutuksen kunta]=d2.kunta
,[Oppilaitoksen kunta historia]=d22b.kunta
,[Oppilaitoksen kunta]=d22.kunta
,[Koulutuksen maakunta historia]=d2b.maakunta
,[Koulutuksen maakunta]=d2.maakunta
,[Oppilaitoksen maakunta historia]=d22b.maakunta
,[Oppilaitoksen maakunta]=d22.maakunta
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
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] = NULL
,[Tutkinnon suoritusvuosi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= NULL
,[Tutkinnon suoritusmaakunta]=NULL
,[Oppilaitos]=d3.oppilaitos
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d2.maakunta


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
,[Koulut lkm]=NULL
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=NULL

/* Koodit */
,[Hallinnonala koodi]=d7.hallinnonala_koodi
,[Koulutuksen tavoite koodi]=d9.koulutuksen_tavoite_toteuma_koodi
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinkunta koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen kunta koodi historia]=d2b.kunta_koodi
,[Koulutuksen kunta koodi]=d2.kunta_koodi
,[Oppilaitoksen kunta koodi historia]=d22b.kunta_koodi
,[Oppilaitoksen kunta koodi]=d22.kunta_koodi
,[Koulutuksen maakunta koodi historia]=d2b.maakunta_koodi
,[Koulutuksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen maakunta koodi historia]=d22b.maakunta_koodi
,[Oppilaitoksen maakunta koodi]=d22.maakunta_koodi
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
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= NULL
,[Tutkinnon suoritusmaakunta koodi]=NULL
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]=d3.oppilaitoskoodi
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL


/* järjestykset */
,[Hallinnonala jarj]=d7.jarjestys
,[Koulutuksen tavoite jarj]=d9.jarjestys
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta historia jarj]=d2b.jarjestys_maakunta
,[Koulutuksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen maakunta historia jarj]=d22b.jarjestys_maakunta
,[Oppilaitoksen maakunta jarj]=d22.jarjestys_maakunta
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
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=NULL
,[tutksuor_al_jarjestys_maakunta]=NULL
,[koul_paattaneiden_toiminta_jarjestys]=NULL
,[haku_koulutuksiin_jarjestys]=NULL
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d2.jarjestys_maakunta

from [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] f
left join VipunenTK.dbo.d_koulutusluokitus as d1 on d1.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_alueluokitus as d2 on d2.id=f.koulutuksen_kunta_id
left join VipunenTK.dbo.d_alueluokitus_historia as d2b on d2b.id=f.koulutuksen_kunta_historia_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d3 on d3.id=f.oppilaitos_id
left join VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d4 on d4.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
left join VipunenTK.dbo.d_koulutuksen_jarjestamismuoto as d5 on d5.id=f.koulutuksen_jarjestamismuoto_id
left join VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d6 on d6.id=f.ammatillisen_koulutuksen_koulutuslaji_id
left join VipunenTK.dbo.d_hallinnonala d7 on d7.id=f.hallinnonala_id
left join VipunenTK.dbo.d_nuorten_aikuisten_koulutus d8 on d8.id=f.nuorten_aikuisten_koulutus_id
left join VipunenTK.dbo.d_koulutuksen_tavoite_toteuma d9 on d9.id=f.koulutuksen_tavoite_toteuma_id
left join vipunenTk.dbo.d_alueluokitus d22 on d22.id=f.oppilaitos_kunta_id
left join vipunenTk.dbo.d_alueluokitus_historia d22b on d22b.id=f.oppilaitos_kunta_historia_id

UNION ALL

------------------ Korkeakoulujen Opiskelijat (K 2019) -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=d1.koulutusaste2002
,[Koulutusala 2002]=d1.koulutusala2002
,[Koulutusaste, taso 2]=d1.Koulutusaste_taso2
,[Koulutusala, taso 1]=d1.iscfibroad2013
,[Asuinkunta]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen kunta historia]=d2b.kunta
,[Koulutuksen kunta]=d2.kunta
,[Oppilaitoksen kunta historia]=d4b.kunta
,[Oppilaitoksen kunta]=d4.kunta
,[Koulutuksen maakunta historia]=d2b.maakunta
,[Koulutuksen maakunta]=d2.maakunta
,[Oppilaitoksen maakunta historia]=d4b.maakunta
,[Oppilaitoksen maakunta]=d4.maakunta
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
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] = NULL
,[Tutkinnon suoritusvuosi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= NULL
,[Tutkinnon suoritusmaakunta]=NULL
,[Oppilaitos]=d3.oppilaitos
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d2.maakunta

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
,[Koulut lkm]=NULL
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinkunta koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen kunta koodi historia]=d2b.kunta_koodi
,[Koulutuksen kunta koodi]=d2.kunta_koodi
,[Oppilaitoksen kunta koodi historia]=d4b.kunta_koodi
,[Oppilaitoksen kunta koodi]=d4.kunta_koodi
,[Koulutuksen maakunta koodi historia]=d2b.maakunta_koodi
,[Koulutuksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen maakunta koodi historia]=d4b.maakunta_koodi
,[Oppilaitoksen maakunta koodi]=d4.maakunta_koodi
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
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= NULL
,[Tutkinnon suoritusmaakunta koodi]=NULL
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]=d3.oppilaitoskoodi
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL


/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta historia jarj]=d2b.jarjestys_maakunta
,[Koulutuksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen maakunta historia jarj]=d4b.jarjestys_maakunta
,[Oppilaitoksen maakunta jarj]=d4.jarjestys_maakunta
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
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=NULL
,[tutksuor_al_jarjestys_maakunta]=NULL
,[koul_paattaneiden_toiminta_jarjestys]=NULL
,[haku_koulutuksiin_jarjestys]=NULL
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d2.jarjestys_maakunta

from VipunenTK.dbo.f_OTV_2_8_Korkeakouluopiskelijat as f
left join VipunenTK.dbo.d_koulutusluokitus as d1 on d1.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_alueluokitus as d2 on d2.id=f.koulutuksen_kunta_id
left join vipunenTK.dbo.d_alueluokitus_historia as d2b on d2b.id=f.koulutuksen_kunta_historia_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d3 on d3.id=f.oppilaitos_id
left join VipunenTK.dbo.d_alueluokitus as d4 on d4.id=f.oppilaitos_kunta_id
left join VipunenTK.dbo.d_alueluokitus_historia as d4b on d4b.id=f.oppilaitos_kunta_historia_id
where d1.Koulutusaste_taso2_koodi in ('62','63','71','72','82') AND
	(d3.oppilaitoskoodi NOT IN ('02557','10031','02358') AND coalesce(d3.oppilaitoksen_korvaavakoodi,d3.oppilaitoskoodi) not in ('01029','01569','10102'))


UNION ALL
 
------------------ Korkeakoulujen tutkinnot (K 2019) -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=d1.koulutusaste2002
,[Koulutusala 2002]=d1.koulutusala2002
,[Koulutusaste, taso 2]=d1.Koulutusaste_taso2
,[Koulutusala, taso 1]=d1.iscfibroad2013
,[Asuinkunta]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen kunta historia]=d2b.kunta
,[Koulutuksen kunta]=d2.kunta
,[Oppilaitoksen kunta historia]=d4b.kunta
,[Oppilaitoksen kunta]=d4.kunta
,[Koulutuksen maakunta historia]=d2b.maakunta
,[Koulutuksen maakunta]=d2.maakunta
,[Oppilaitoksen maakunta historia]=d4b.maakunta
,[Oppilaitoksen maakunta]=d4.maakunta
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
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] = NULL
,[Tutkinnon suoritusvuosi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= NULL
,[Tutkinnon suoritusmaakunta]=NULL
,[Oppilaitos]=d3.oppilaitos
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d2.maakunta

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
,[Koulut lkm]=NULL
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinkunta koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen kunta koodi historia]=d4b.kunta_koodi
,[Koulutuksen kunta koodi]=d2.kunta_koodi
,[Oppilaitoksen kunta koodi historia]=d4b.kunta_koodi
,[Oppilaitoksen kunta koodi]=d4.kunta_koodi
,[Koulutuksen maakunta koodi historia]=d2b.maakunta_koodi
,[Koulutuksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen maakunta koodi historia]=d4b.maakunta_koodi
,[Oppilaitoksen maakunta koodi]=d4.maakunta_koodi
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
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= NULL
,[Tutkinnon suoritusmaakunta koodi]=NULL
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]=d3.oppilaitoskoodi
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL


/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta historia jarj]=d2b.jarjestys_maakunta
,[Koulutuksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen maakunta historia jarj]=d4b.jarjestys_maakunta
,[Oppilaitoksen maakunta jarj]=d4.jarjestys_maakunta
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
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=NULL
,[tutksuor_al_jarjestys_maakunta]=NULL
,[koul_paattaneiden_toiminta_jarjestys]=NULL
,[haku_koulutuksiin_jarjestys]=NULL
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d2.jarjestys_maakunta

from VipunenTK.dbo.f_OTV_2_9_Korkeakoulututkinnot f
left join VipunenTK.dbo.d_koulutusluokitus as d1 on d1.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_alueluokitus as d2 on d2.id=f.koulutuksen_kunta_id
left join VipunenTK.dbo.d_alueluokitus_historia as d2b on d2b.id=f.koulutuksen_kunta_historia_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d3 on d3.id=f.oppilaitos_id
left join VipunenTK.dbo.d_alueluokitus as d4 on d4.id=f.oppilaitos_kunta_id
left join VipunenTK.dbo.d_alueluokitus_historia as d4b on d4b.id=f.oppilaitos_kunta_historia_id
where d1.Koulutusaste_taso2_koodi in ('62','63','71','72','82') AND
	(d3.oppilaitoskoodi NOT IN ('02557','10031','02358') AND coalesce(d3.oppilaitoksen_korvaavakoodi,d3.oppilaitoskoodi) not in ('01029','01569','10102'))


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
,[Asuinkunta]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen kunta historia]=NULL
,[Koulutuksen kunta]=d2.kunta
,[Oppilaitoksen kunta historia]=NULL
,[Oppilaitoksen kunta]=d2.kunta
,[Koulutuksen maakunta historia]=NULL
,[Koulutuksen maakunta]=d2.maakunta
,[Oppilaitoksen maakunta historia]=NULL
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
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] = NULL
,[Tutkinnon suoritusvuosi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= NULL
,[Tutkinnon suoritusmaakunta]=NULL
,[Oppilaitos]=d4.oppilaitos
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d2.maakunta

/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijatt]=NULL
,[Aloittaneet]=NULL
,[Tutkinto]=NULL
,[Opetustunnit]=case when d3.Koulutusala!='Muut mittarit' then f.[Opetustuntien lukumäärä] else NULL end
,[Koulutukset]=case when d3.Opintoala='Oppilaitosten tutkintoon johtamaton koulutus koulutustyypeittäin' then f.[Koulutusten lukumäärä] else NULL end
,[Osallistuneet]=case when d3.Opintoala='Oppilaitosten tutkintoon johtamaton koulutus koulutustyypeittäin' then f.[Osallistuneiden lukumäärä] else NULL end
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
,[Koulut lkm]=NULL
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=NULL
,[Koulutusala 2002 koodi]=NULL
,[Koulutusaste, taso 2 koodi]=NULL
,[Koulutusala, taso 1 koodi]=NULL
,[Asuinkunta koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen kunta koodi historia]=NULL
,[Koulutuksen kunta koodi]=d2.kunta_koodi
,[Oppilaitoksen kunta koodi historia]=NULL
,[Oppilaitoksen kunta koodi]=d2.kunta_koodi
,[Koulutuksen maakunta koodi historia]=NULL
,[Koulutuksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen maakunta koodi historia]=NULL
,[Oppilaitoksen maakunta koodi]=NULL
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
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= NULL
,[Tutkinnon suoritusmaakunta koodi]=NULL
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]=d4.oppilaitoskoodi
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL


/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=NULL
,[Koulutusala 2002 jarj]=NULL
,[Koulutusaste, taso 2 jarj]=NULL
,[Koulutusala, taso 1 jarj]=NULL
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta historia jarj]=NULL
,[Koulutuksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen maakunta historia jarj]=NULL
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
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=NULL
,[tutksuor_al_jarjestys_maakunta]=NULL
,[koul_paattaneiden_toiminta_jarjestys]=NULL
,[haku_koulutuksiin_jarjestys]=NULL
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d2.jarjestys_maakunta

FROM VipunenTK.dbo.f_TJK_2_11_tutkintoon_johtamaton_koulutus f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijaintikunta_id
left join VipunenTK.dbo.d_opetustuntien_sisalto_ja_tavoiteluokitus d3 on d3.id=f.opetustunti_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d4 on d4.id=f.oppilaitos_id
where d4.oppilaitostyyppi in ('Liikunnan koulutuskeskukset','Kansanopistot','Kansalaisopistot','Opintokeskukset','Kesäyliopistot')

UNION ALL

------------------ Esi- ja perusopetuksen oppilaat ja tutkinnot (R) -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=d5.koulutusaste2002
,[Koulutusala 2002]=d5.koulutusala2002
,[Koulutusaste, taso 2]= case when d5.koulutus_koodi='201101' then 'Perusopetus' else case when d5.koulutus_koodi='001101' then 'Esiopetus' else null end end
,[Koulutusala, taso 1]=d5.iscfibroad2013
,[Asuinkunta]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen kunta historia]=d2b.kunta
,[Koulutuksen kunta]=d2.kunta
,[Oppilaitoksen kunta historia]=d2b.kunta
,[Oppilaitoksen kunta]=d2.kunta
,[Koulutuksen maakunta historia]=d2b.maakunta
,[Koulutuksen maakunta]=d2.maakunta
,[Oppilaitoksen maakunta historia]=d2b.maakunta
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
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] = NULL
,[Tutkinnon suoritusvuosi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= NULL
,[Tutkinnon suoritusmaakunta]=NULL
,[Oppilaitos]=d4.oppilaitos
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d2.maakunta

/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijatt]=sum(f.opiskelijat)
,[Aloittaneet]=sum(f.aloittaneet)
,[Tutkinto]=sum(isnull(f.tod,0))+sum(isnull(f.tutkt,0))
,[Opetustunnit]=NULL
,[Koulutukset]=NULL
,[Osallistuneet]=NULL
,[Esiopetuksen oppilaat] = sum(isnull(f.ove,0))
,[1. luokan oppilaat] = sum(isnull(f.ov1,0))
,[1.-6. luokkien oppilaat] = sum(isnull(f.ov1,0))+sum(isnull(f.ov2,0))+sum(isnull(f.ov3,0))+sum(isnull(f.ov4,0))+sum(isnull(f.ov5,0))+sum(isnull(f.ov6,0))
,[7.-9. luokkien oppilaat] = sum(isnull(f.ov7,0))+sum(isnull(f.ov8,0))+sum(isnull(f.ov9,0))
,[Perusopetuksen suorittaneet] = sum(isnull(f.tod,0))+sum(isnull(f.tutkt,0))
,[Lisäopetuksen oppilaat] = sum(isnull(f.ov10,0))
,[15v täyttäneet, koulutusrakenne]=NULL
,[1v tutkinnon jälkeen]=NULL
,[Väestö lkm]=NULL
,[Väestöennuste]=NULL
,[Koulut lkm]=NULL
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=d5.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d5.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]= case when d5.koulutus_koodi='201101' then '21' else case when d5.koulutus_koodi='001101' then '00' else null end end
,[Koulutusala, taso 1 koodi]=d5.iscfibroad2013_koodi
,[Asuinkunta koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen kunta koodi historia]=d2b.kunta_koodi
,[Koulutuksen kunta koodi]=d2.kunta_koodi
,[Oppilaitoksen kunta koodi historia]=d2b.kunta_koodi
,[Oppilaitoksen kunta koodi]=d2.kunta_koodi
,[Koulutuksen maakunta koodi historia]=d2b.maakunta_koodi
,[Koulutuksen maakunta koodi]=d2.maakunta_koodi
,[Oppilaitoksen maakunta koodi historia]=d2b.maakunta_koodi
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
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= NULL
,[Tutkinnon suoritusmaakunta koodi]=NULL
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]=d4.oppilaitoskoodi
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL



/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=d5.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d5.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]= case when d5.koulutus_koodi='201101' then '21' else case when d5.koulutus_koodi='001101' then '00' else null end end
,[Koulutusala, taso 1 jarj]=d5.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta historia jarj]=d2b.jarjestys_maakunta
,[Koulutuksen maakunta jarj]=d2.jarjestys_maakunta
,[Oppilaitoksen maakunta historia jarj]=d2b.jarjestys_maakunta
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
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=NULL
,[tutksuor_al_jarjestys_maakunta]=NULL
,[koul_paattaneiden_toiminta_jarjestys]=NULL
,[haku_koulutuksiin_jarjestys]=NULL
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d2.jarjestys_maakunta

FROM VipunenTK.dbo.f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijaintikunta_id
left join VipunenTK.dbo.d_alueluokitus_historia d2b on d2b.id=f.oppilaitoksen_sijaintikunta_historia_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d4 on d4.id=f.oppilaitos_id
left join Vipunentk.dbo.d_koulutusluokitus d5 on d5.id=f.koulutusluokitus_id

where f.oppilaitoksen_sijaintikunta<>200 and d1.sukupuoli<>'Tuntematon'
Group by 
	 f.tilastointivuosi
	,d2.kunta
	,d2.kunta_koodi
	,d2b.kunta
	,d2b.kunta_koodi
	,d2.maakunta
	,d2.maakunta_koodi
	,d2b.maakunta
	,d2b.maakunta_koodi
	,d2.jarjestys_maakunta
	,d2b.jarjestys_maakunta
	,d4.oppilaitoksen_omistajatyyppi
	,d4.oppilaitoksen_omistajatyyppikoodi
	,d4.koulutuksen_jarjestajan_omistajatyyppi
	,d4.koulutuksen_jarjestajan_omistajatyyppikoodi
	,d4.oppilaitostyyppi
	,d4.oppilaitostyyppikoodi
	,d4.jarjestys_oppilaitostyyppi
	,d5.koulutusaste2002
	,d5.koulutusala2002
	,d5.koulutus_koodi
	,d5.iscfibroad2013
	,d5.koulutusaste2002_koodi
	,d5.koulutusala2002_koodi
	,d5.Koulutusaste_taso2_koodi
	,d5.iscfibroad2013_koodi
	,d4.oppilaitoskoodi
	,d4.oppilaitos
	,d5.jarjestys_koulutusaste2002
	,d5.jarjestys_koulutusala2002
	,d5.jarjestys_iscfibroad2013


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
,[Asuinkunta]=d12.kunta
,[Asuinmaakunta]=d12.maakunta
,[Koulutuksen kunta historia]=NULL
,[Koulutuksen kunta]=NULL
,[Oppilaitoksen kunta historia]=NULL
,[Oppilaitoksen kunta]=NULL
,[Koulutuksen maakunta historia]=d31.maakunta
,[Koulutuksen maakunta]=d11.maakunta
,[Oppilaitoksen maakunta historia]=NULL
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
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] = NULL
,[Tutkinnon suoritusvuosi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= NULL
,[Tutkinnon suoritusmaakunta]=NULL
,[Oppilaitos]=NULL
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d12.maakunta

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
,[Koulut lkm]=NULL
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinkunta koodi]=d12.kunta_koodi
,[Asuinmaakunta koodi]=d12.maakunta_koodi
,[Koulutuksen kunta koodi historia]=NULL
,[Koulutuksen kunta koodi]=NULL
,[Oppilaitoksen kunta koodi historia]=NULL
,[Oppilaitoksen kunta koodi]=NULL
,[Koulutuksen maakunta koodi historia]=d31.maakunta_koodi
,[Koulutuksen maakunta koodi]=d11.maakunta_koodi
,[Oppilaitoksen maakunta koodi historia]=NULL
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
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= NULL
,[Tutkinnon suoritusmaakunta koodi]=NULL
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]=NULL
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL


/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=d12.jarjestys_maakunta
,[Koulutuksen maakunta historia jarj]=d31.jarjestys_maakunta
,[Koulutuksen maakunta jarj]=d11.jarjestys_maakunta
,[Oppilaitoksen maakunta historia jarj]=NULL
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
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=NULL
,[tutksuor_al_jarjestys_maakunta]=NULL
,[koul_paattaneiden_toiminta_jarjestys]=NULL
,[haku_koulutuksiin_jarjestys]=NULL
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d12.jarjestys_maakunta

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
	  JOIN d_alueluokitus d12 on d12.id = f.asuinmaakunta_id
	  JOIN d_kansalaisuus_versio1 d13 on d13.id = kansalaisuus_versio1_id
	  JOIN d_ika d18 on d18.id = vaeston_ika_1v_id
	  JOIN d_ika d19 on d19.id = tutkinnon_suoritusika_1v_id
	  JOIN d_ika d20 on d20.id = tutkinnon_ika_1v_id
	  JOIN d_koulutusmuoto d21 on d21.id = koulutusmuoto_id
	  JOIN d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d22 on d22.id = ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_id
	  join d_alueluokitus_historia d31 on d31.id=f.tutkinnon_suoritusmaakunta_historia_id
	  WHERE aineisto = 'R'

UNION ALL

------------------ Tutkinnon suorittaneiden pääasiallinen toiminta (K) -----------------
select
 [Tilastovuosi]=f.tilastointivuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=d1.koulutusaste2002
,[Koulutusala 2002]=d1.koulutusala2002
,[Koulutusaste, taso 2]=d1.Koulutusaste_taso2
,[Koulutusala, taso 1]=d1.iscfibroad2013
,[Asuinkunta]=d12.kunta
,[Asuinmaakunta]=d12.maakunta
,[Koulutuksen kunta historia]=NULL
,[Koulutuksen kunta]=NULL
,[Oppilaitoksen kunta historia]=NULL
,[Oppilaitoksen kunta]=NULL
,[Koulutuksen maakunta historia]=NULL
,[Koulutuksen maakunta]=NULL
,[Oppilaitoksen maakunta historia]=NULL
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
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=d2.paaasiallinen_toiminta_ja_maasta_muuttaneet
,[Pääasiallinen toiminta okm]=d25.paaasiallinen_toiminta_okm
,[Tutkintolaji työllistymiseen]=d3.tutkintolaji_tyollistymiseen
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] = NULL
,[Tutkinnon suoritusvuosi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= NULL
,[Tutkinnon suoritusmaakunta]=NULL
,[Oppilaitos]=d9.oppilaitos
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d12.maakunta

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
,[Koulut lkm]=NULL
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=d1.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d1.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d1.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d1.iscfibroad2013_koodi
,[Asuinkunta koodi]=d12.kunta_koodi
,[Asuinmaakunta koodi]=d12.maakunta_koodi
,[Koulutuksen kunta koodi historia]=NULL
,[Koulutuksen kunta koodi]=NULL
,[Oppilaitoksen kunta koodi historia]=NULL
,[Oppilaitoksen kunta koodi]=NULL
,[Koulutuksen maakunta koodi historia]=NULL
,[Koulutuksen maakunta koodi]=NULL
,[Oppilaitoksen maakunta koodi historia]=NULL
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
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= NULL
,[Tutkinnon suoritusmaakunta koodi]=NULL
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]=d9.oppilaitoskoodi
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL


/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=d1.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d1.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d1.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d1.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=d12.jarjestys_maakunta
,[Koulutuksen maakunta historia jarj]=NULL
,[Koulutuksen maakunta jarj]=NULL
,[Oppilaitoksen maakunta historia jarj]=NULL
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
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=NULL
,[tutksuor_al_jarjestys_maakunta]=NULL
,[koul_paattaneiden_toiminta_jarjestys]=NULL
,[haku_koulutuksiin_jarjestys]=NULL
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d12.jarjestys_maakunta


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
Where d1.koulutusaste2002_koodi in ('31','32','62','63','71','72','82')

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
,[Asuinkunta]=d1.kunta
,[Asuinmaakunta]=d1.maakunta
,[Koulutuksen kunta historia]=NULL
,[Koulutuksen kunta]=NULL
,[Oppilaitoksen kunta historia]=NULL
,[Oppilaitoksen kunta]=NULL
,[Koulutuksen maakunta historia]=NULL
,[Koulutuksen maakunta]=NULL
,[Oppilaitoksen maakunta historia]=NULL
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
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] = NULL
,[Tutkinnon suoritusvuosi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= NULL
,[Tutkinnon suoritusmaakunta]=NULL
,[Oppilaitos]=NULL
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d1.maakunta


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
,[Koulut lkm]=NULL
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=NULL
,[Koulutusala 2002 koodi]=NULL
,[Koulutusaste, taso 2 koodi]=NULL
,[Koulutusala, taso 1 koodi]=NULL
,[Asuinkunta koodi]=d1.kunta_koodi
,[Asuinmaakunta koodi]=d1.maakunta_koodi
,[Koulutuksen kunta koodi historia]=NULL
,[Koulutuksen kunta koodi]=NULL
,[Oppilaitoksen kunta koodi historia]=NULL
,[Oppilaitoksen kunta koodi]=NULL
,[Koulutuksen maakunta koodi historia]=NULL
,[Koulutuksen maakunta koodi]=NULL
,[Oppilaitoksen maakunta koodi historia]=NULL
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
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= NULL
,[Tutkinnon suoritusmaakunta koodi]=NULL
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]=NULL
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL


/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=NULL
,[Koulutusala 2002 jarj]=NULL
,[Koulutusaste, taso 2 jarj]=NULL
,[Koulutusala, taso 1 jarj]=NULL
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta historia jarj]=NULL
,[Koulutuksen maakunta jarj]=NULL
,[Oppilaitoksen maakunta historia jarj]=NULL
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
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=NULL
,[tutksuor_al_jarjestys_maakunta]=NULL
,[koul_paattaneiden_toiminta_jarjestys]=NULL
,[haku_koulutuksiin_jarjestys]=NULL
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d1.jarjestys_maakunta

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
,[Asuinkunta]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen kunta historia]=NULL
,[Koulutuksen kunta]=NULL
,[Oppilaitoksen kunta historia]=NULL
,[Oppilaitoksen kunta]=NULL
,[Koulutuksen maakunta historia]=NULL
,[Koulutuksen maakunta]=NULL
,[Oppilaitoksen maakunta historia]=NULL
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
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] = NULL
,[Tutkinnon suoritusvuosi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= NULL
,[Tutkinnon suoritusmaakunta]=NULL
,[Oppilaitos]=NULL
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=f.ennustemalli
,[Maakunta (yhdistetty)] = d1.maakunta


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
,[Koulut lkm]=NULL
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=NULL
,[Koulutusala 2002 koodi]=NULL
,[Koulutusaste, taso 2 koodi]=NULL
,[Koulutusala, taso 1 koodi]=NULL
,[Asuinkunta koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen kunta koodi historia]=NULL
,[Koulutuksen kunta koodi]=NULL
,[Oppilaitoksen kunta koodi historia]=NULL
,[Oppilaitoksen kunta koodi]=NULL
,[Koulutuksen maakunta koodi historia]=NULL
,[Koulutuksen maakunta koodi]=NULL
,[Oppilaitoksen maakunta koodi historia]=NULL
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
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= NULL
,[Tutkinnon suoritusmaakunta koodi]=NULL
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]=NULL
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL



/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=NULL
,[Koulutusala 2002 jarj]=NULL
,[Koulutusaste, taso 2 jarj]=NULL
,[Koulutusala, taso 1 jarj]=NULL
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta historia jarj]=NULL
,[Koulutuksen maakunta jarj]=NULL
,[Oppilaitoksen maakunta historia jarj]=NULL
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
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=NULL
,[tutksuor_al_jarjestys_maakunta]=NULL
,[koul_paattaneiden_toiminta_jarjestys]=NULL
,[haku_koulutuksiin_jarjestys]=NULL
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d1.jarjestys_maakunta


FROM vipunentk.dbo.f_Vaestoennuste f
LEFT JOIN VipunenTK.dbo.d_alueluokitus d1 on d1.id=f.tilvaskun_id
LEFT JOIN VipunenTK.dbo.d_sukupuoli d2 on d2.id=f.sp_id
LEFT JOIN VipunenTK.dbo.d_ika d3 on d3.id=f.ika_id
where lkm>0

Union all

----------------- Koulujen lkm ----------------
select
 [Tilastovuosi]=f.tilastovuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=NULL
,[Koulutusala 2002]=NULL
,[Koulutusaste, taso 2]=NULL
,[Koulutusala, taso 1]=NULL
,[Asuinkunta]=NULL
,[Asuinmaakunta]=NULL
,[Koulutuksen kunta historia]=f.[oppilaitoksen kunta]
,[Koulutuksen kunta]=d1.kunta
,[Oppilaitoksen kunta historia]=f.[oppilaitoksen kunta]
,[Oppilaitoksen kunta]=d1.kunta
,[Koulutuksen maakunta historia]=case when f.[oppilaitoksen kunta koodi]='200' then 'Ulkomaat' else f.[Oppilaitoksen maakunta] end
,[Koulutuksen maakunta]=d1.maakunta
,[Oppilaitoksen maakunta historia]=case when f.[oppilaitoksen kunta koodi]='200' then 'Ulkomaat' else f.[Oppilaitoksen maakunta] end
,[Oppilaitoksen maakunta]=d1.maakunta
,[Oppilaitoksen omistajatyyppi]=f.[Oppilaitoksen omistajatyyppi]
,[Koulutuksen järjestäjän omistajatyyppi]=f.[Oppilaitoksen järjestäjän omistajatyyppi]
,[Oppilaitostyyppi]=f.[Oppilaitostyyppi]
,[Nuorten/aikuisten koulutus]=NULL
,[Järjestämistapa]=NULL
,[Järjestämismuoto]=NULL
,[Tutkintotyyppi]=NULL
,[Kansalaisuus]=NULL
,[Pohjoismaa]=NULL
,[Äidinkieli]=NULL
,[Väestön ikä]=NULL
,[Väestön ikä 5v]=NULL
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] = NULL
,[Tutkinnon suoritusvuosi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= NULL
,[Tutkinnon suoritusmaakunta]=NULL
,[Oppilaitos]=f.oppilaitos
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d1.maakunta


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
,[Väestöennuste]=NULL
,[Koulut lkm]=case when f.[Oppilaitoskoodi] is not null then 1 else NULL end
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=NULL


/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=NULL
,[Koulutusala 2002 koodi]=NULL
,[Koulutusaste, taso 2 koodi]=NULL
,[Koulutusala, taso 1 koodi]=NULL
,[Asuinkunta koodi]=NULL
,[Asuinmaakunta koodi]=NULL
,[Koulutuksen kunta koodi historia]=f.[oppilaitoksen kunta koodi]
,[Koulutuksen kunta koodi]=d1.kunta_koodi
,[Oppilaitoksen kunta koodi historia]=f.[oppilaitoksen kunta koodi]
,[Oppilaitoksen kunta koodi]=d1.kunta_koodi
,[Koulutuksen maakunta koodi historia]=case when f.[oppilaitoksen maakunta koodi]='' then '-1' else f.[Oppilaitoksen maakunta koodi] end
,[Koulutuksen maakunta koodi]=d1.maakunta_koodi
,[Oppilaitoksen maakunta koodi historia]=case when f.[oppilaitoksen maakunta koodi]='' then '-1' else f.[Oppilaitoksen maakunta koodi] end
,[Oppilaitoksen maakunta koodi]=d1.maakunta_koodi
,[Oppilaitoksen omistajatyyppi koodi]=f.[Oppilaitoksen omistajatyyppikoodi]
,[Koulutuksen järjestäjän omistajatyyppi koodi]=f.[Oppilaitoksen järjestäjän omistajatyyppikoodi]
,[Oppilaitostyyppi koodi]=f.[Oppilaitostyyppi koodi]
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
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= NULL
,[Tutkinnon suoritusmaakunta koodi]=NULL
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]=f.oppilaitoskoodi
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL



/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=NULL
,[Koulutusala 2002 jarj]=NULL
,[Koulutusaste, taso 2 jarj]=NULL
,[Koulutusala, taso 1 jarj]=NULL
,[Asuinmaakunta jarj]=NULL
,[Koulutuksen maakunta historia jarj]=case when f.[oppilaitoksen maakunta koodi]='' then '999' else f.[Oppilaitoksen maakunta koodi] end
,[Koulutuksen maakunta jarj]=case when f.[oppilaitoksen maakunta koodi]='' then '999' else f.[Oppilaitoksen maakunta koodi] end
,[Oppilaitoksen maakunta historia jarj]=case when f.[oppilaitoksen maakunta koodi]='' then '999' else f.[Oppilaitoksen maakunta koodi] end
,[Oppilaitoksen maakunta jarj]=case when f.[oppilaitoksen maakunta koodi]='' then '999' else f.[Oppilaitoksen maakunta koodi] end
,[Oppilaitoksen omistajatyyppi jarj]=case when f.[Oppilaitoksen omistajatyyppikoodi]='-1' then 'öö' else f.[Oppilaitoksen omistajatyyppikoodi] end
,[Koulutuksen järjestäjän omistajatyyppi jarj]=case when f.[Oppilaitoksen järjestäjän omistajatyyppikoodi]='-1' then 'öö' else f.[Oppilaitoksen järjestäjän omistajatyyppikoodi] end
,[Oppilaitostyyppi jarj]=CASE WHEN f.[oppilaitostyyppi koodi]='-1' then 'öö' else f.[oppilaitostyyppi koodi] end
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
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=NULL
,[tutksuor_al_jarjestys_maakunta]=NULL
,[koul_paattaneiden_toiminta_jarjestys]=NULL
,[haku_koulutuksiin_jarjestys]=NULL
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d1.jarjestys_maakunta
  
FROM VipunenTK_lisatiedot.dbo.v_oppilaitosrekisteri f
left join VipunenTK.dbo.d_alueluokitus d1 on f.[Oppilaitoksen kunta koodi]=d1.kunta_koodi
where f.[Oppilaitoksen olotila_koodi]=0

UNION ALL

----------------- Koulutukseen sijoittuneet 2v (K-aineisto) ----------------
select
 [Tilastovuosi]=f.tilastovuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=d7.koulutusaste2002
,[Koulutusala 2002]=d7.koulutusala2002
,[Koulutusaste, taso 2]=d7.Koulutusaste_taso2
,[Koulutusala, taso 1]=d7.iscfibroad2013
,[Asuinkunta]=d3.kunta
,[Asuinmaakunta]=d3.maakunta
,[Koulutuksen kunta historia]= NULL
,[Koulutuksen kunta]= NULL
,[Oppilaitoksen kunta historia]= NULL
,[Oppilaitoksen kunta]= d13.oppilaitoksen_sijaintikunta
,[Koulutuksen maakunta historia]= NULL
,[Koulutuksen maakunta]= NULL
,[Oppilaitoksen maakunta historia]= NULL
,[Oppilaitoksen maakunta]=NULL
,[Oppilaitoksen omistajatyyppi]= d13.oppilaitoksen_omistajatyyppi
,[Koulutuksen järjestäjän omistajatyyppi]= d13.koulutuksen_jarjestajan_omistajatyyppi
,[Oppilaitostyyppi]= d13.oppilaitostyyppi
,[Nuorten/aikuisten koulutus]=NULL
,[Järjestämistapa]=NULL
,[Järjestämismuoto]=NULL
,[Tutkintotyyppi]=NULL
,[Kansalaisuus]=d21.kansalaisuus_versio1
,[Pohjoismaa]=NULL
,[Äidinkieli]=d2.aidinkieli_versio1
,[Väestön ikä]=NULL
,[Väestön ikä 5v]=NULL
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL
,[Tarkastelujakso] = d17.tarkastelujakso
,[Tarkastelujakso II] = d17.tarkastelujakso2
,[Tutkinnon suoritusvuosi]=d15.vuosiselite
,[Koul. sijoittuneen koulutusaste, taso 2]=d8.Koulutusaste_taso2
,[Koul. sijoittuneen koulutusala, taso 1]=d8.iscfibroad2013
,[Koul. sijoittuneen koulutusaste 2002]=d8.koulutusaste2002
,[Koul. sijoittuneen koulutusala 2002]=d8.koulutusala2002
,[Koul. sijoittuneen oppilaitoksen maakunta]=d4.maakunta
,[Koul. sijoittuneen oppilaitoksen kunta]=d4.kunta
,[Koul. päättäneiden toiminta]=d29.koulutuksen_paattaneiden_toiminta
,[Tutkintoryhmä]=d6.tutkintoryhma
,[Haut koulutuksiin]=d26.moninkertainen_haku
,[Tutkinnon suorituskunta]= d4b.kunta
,[Tutkinnon suoritusmaakunta]=d4b.maakunta
,[Oppilaitos]=NULL
,[Tiede ja teknologia - työpaikan maakunta]= NULL
,[Tiede ja teknologia - toimiala, taso 2] = NULL
,[Tiede ja teknologia - toimiala, taso 1] = NULL
,[Tiede ja teknologia - työnantajasektori] = NULL
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d4b.maakunta

/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijat]=NULL
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
,[Väestöennuste]=NULL
,[Koulut lkm]= NULL
,[haku_sij_henkilö lkm] = f.lkm
,[TT_htv]=NULL

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=d7.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d7.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d7.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d7.iscfibroad2013_koodi
,[Asuinkunta koodi]=d3.kunta_koodi
,[Asuinmaakunta koodi]=d3.maakunta_koodi
,[Koulutuksen kunta koodi historia]= NULL
,[Koulutuksen kunta koodi]= NULL
,[Oppilaitoksen kunta koodi historia]= NULL
,[Oppilaitoksen kunta koodi]= d13.sijaintikuntakoodi
,[Koulutuksen maakunta koodi historia]= NULL
,[Koulutuksen maakunta koodi]= NULL
,[Oppilaitoksen maakunta koodi historia]= NULL
,[Oppilaitoksen maakunta koodi]= NULL
,[Oppilaitoksen omistajatyyppi koodi]= d13.oppilaitoksen_omistajatyyppikoodi
,[Koulutuksen järjestäjän omistajatyyppi koodi]= d13.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi koodi]= d13.oppilaitostyyppikoodi
,[Nuorten/aikuisten koulutus koodi]=NULL
,[Järjestämistapa koodi]=NULL
,[Järjestämismuoto koodi]=NULL
,[Tutkintotyyppi koodi]=NULL
,[Kansalaisuus koodi]=d21.kansalaisuus_versio1_koodi
,[Pohjoismaa koodi]=NULL
,[Äidinkieli koodi]=d2.aidinkieli_versio1_koodi
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=NULL
,[Pääasiallinen toiminta koodi]=NULL
,[Pääasiallinen toiminta okm koodi]=NULL
,[Tutkintolaji työllistymiseen koodi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=d8.Koulutusaste_taso2_koodi
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=d8.iscfibroad2013_koodi
,[Koul. sijoittuneen koulutusaste 2002 koodi]=d8.koulutusaste2002_koodi
,[Koul. sijoittuneen koulutusala 2002 koodi]=d8.koulutusala2002_koodi
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=d4.maakunta_koodi
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=d4.kunta_koodi
,[Tutkinnon suorituskunta koodi]= d4b.kunta_koodi
,[Tutkinnon suoritusmaakunta koodi]=d4b.maakunta_koodi
,[Tutkintoryhma koodi]=d6.tutkintoryhma_koodi
,[Koulutuksen päättäneiden toiminta koodi]=d29.koulutuksen_paattaneiden_toiminta_koodi
,[Oppilaitoskoodi]= NULL
,[Tiede ja teknologia - työpaikan maakunta koodi]= NULL
,[Tiede ja teknologia - toimiala, taso 2 koodi] = NULL
,[Tiede ja teknologia - työnantajasektori koodi] = NULL


/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=d7.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d7.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d7.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d7.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=d3.jarjestys_maakunta
,[Koulutuksen maakunta historia jarj]= NULL
,[Koulutuksen maakunta jarj]= null
,[Oppilaitoksen maakunta historia jarj]= NULL
,[Oppilaitoksen maakunta jarj]= NULL
,[Oppilaitoksen omistajatyyppi jarj]= d13.jarjestys_omistajatyyppi
,[Koulutuksen järjestäjän omistajatyyppi jarj]= d13.koulutuksen_jarjestajan_omistajatyyppikoodi
,[Oppilaitostyyppi jarj]= d13.jarjestys_oppilaitostyyppi
,[Nuorten/aikuisten koulutus jarj]=NULL
,[Järjestämistapa jarj]=NULL
,[Järjestämismuoto jarj]=NULL
,[Tutkintotyyppi jarj]=NULL
,[Kansalaisuus jarj]=d21.jarjestys
,[Pohjoismaa jarj]=NULL
,[Äidinkieli jarj]=d2.jarjestys
,[Väestön ikä jarj]=NULL
,[Väestön ikä 5v jarj]=NULL
,[Väestöennusteen maakunta jarj]=NULL
,[Pääasiallinen toiminta jarj]=NULL
,[Pääasiallinen toiminta okm jarj]=NULL
,[Tutkintolaji työllistymiseen jarj]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=d8.jarjestys_Koulutusaste_taso2
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=d8.jarjestys_iscfibroad2013
,[Koul. sijoittuneen koulutusaste 2002 jarj]=d8.jarjestys_koulutusaste2002
,[Koul. sijoittuneen koulutusala 2002 jarj]=d8.jarjestys_koulutusala2002
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=d4.jarjestys_maakunta
,[Tutkintoryhma_jarjestys]=d6.jarjestys
,[tutksuor_al_jarjestys_maakunta]=d4b.jarjestys_maakunta
,[koul_paattaneiden_toiminta_jarjestys]=d29.jarjestys
,[haku_koulutuksiin_jarjestys]=d26.jarjestys
,[Tiede ja teknologia - työpaikan maakunta jarj]= NULL
,[Tiede ja teknologia - toimiala, taso 2 jarj] = NULL
,[Tiede ja teknologia - toimiala, taso 1 jarj] = NULL
,[Tiede ja teknologia - työnantajasektori jarj] = NULL
,[Maakunta (yhdistetty) jarj] = d4b.jarjestys_maakunta

FROM            VipunenTK.dbo.f_koulutukseen_sijoittuneet_2v as f
	LEFT JOIN d_aidinkieli_versio1 d2 ON d2.id = aidinkieli_versio_1_id
	LEFT JOIN d_sukupuoli d16 ON d16.id = sukupuoli_id
	LEFT JOIN d_tarkastelujakso d17 ON d17.id = tarkastelujakso_id
	LEFT JOIN d_alueluokitus d3 ON d3.id = asuinkunta_id
	LEFT JOIN d_alueluokitus d4 ON d4.id = koulutukseen_sijoittuneen_maakunta_id
	LEFT JOIN d_alueluokitus d4b ON d4b.id = pohjakoulutuksen_tutkinnon_suoritusmaakunta_id
	LEFT JOIN d_ika d5 ON d5.id = ika_1v_id
	LEFT JOIN d_ika d5b ON d5b.id = ika_5v_id
	LEFT JOIN d_ika d5c ON d5c.id = ika_1v_suorv_id
	LEFT JOIN d_tutkintoryhma d6 ON d6.id = tutkintoryhma_id
	LEFT JOIN d_koulutusluokitus d7 ON d7.id = pohjakoulutus_id
	LEFT JOIN d_koulutusluokitus d8 ON d8.id = koulutukseen_sijoittuneen_koulutus_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d13 ON d13.id = pohjakoulutuksen_oppilaitos_id
	LEFT JOIN d_oppilaitoksen_taustatiedot d14 ON d14.id = koulutukseen_sijoittuneen_oppilaitos_id
	LEFT JOIN d_kausi d15 on d15.kausi_id = suoritusvuosi_id
	LEFT JOIN d_kausi d18 on d18.kausi_id = suorituslukukausi_id
	LEFT JOIN d_kausi d19 on d19.kausi_id = syntymavuosi_id
	LEFT JOIN d_pohjoismaa d20 on d20.id = pohjoismaa_id
	LEFT JOIN d_kansalaisuus_versio1 d21 on d21.id = kansalaisuus_id
	LEFT JOIN d_opetuskieli d22 on d22.id = pohjakoulutuksen_opetuskieli_id
	LEFT JOIN d_ammatillisen_koulutuksen_koulutuslaji d23 on d23.id = pohjakoulutuksen_koulutuslaji_id
	LEFT JOIN d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d24 on d24.id = pohjakoulutuksen_tutktav_id
	LEFT JOIN d_nuorten_aikuisten_koulutus d25 on d25.id = pohjakoulutuksen_aikoul_id
	LEFT JOIN d_moninkertainen_haku d26 on d26.id = moninkertainen_haku_id
	LEFT JOIN d_paaasiallinen_toiminta d27 on d27.id = paaasiallinen_toiminta_id
	LEFT JOIN d_ammattiasema d28 on d28.id = ammattiasema_id
	LEFT JOIN d_koulutuksen_paattaneiden_toiminta d29 on d29.id = koulutuksen_paattaneiden_toiminta_id
	LEFT JOIN d_valtio d30 on d30.id = eumaa_id
	LEFT JOIN d_valtio d31 on d31.id = etamaa_id
	LEFT JOIN d_kylla_ei d32a on d32a.id = opisk_lu_kyllaei_id
	LEFT JOIN d_kylla_ei d32b on d32b.id = opisk_amm_pk_kyllaei_id
	LEFT JOIN d_kylla_ei d32c on d32c.id = opisk_amm_at_kyllaei_id
	LEFT JOIN d_kylla_ei d32d on d32d.id = opisk_amm_eat_kyllaei_id
	LEFT JOIN d_kylla_ei d32e on d32e.id = opisk_amm_kyllaei_id
    LEFT JOIN d_kylla_ei d33 on d33.id = opisk_amk_kyllaei_id
    LEFT JOIN d_kylla_ei d34 on d34.id = opisk_yo_kyllaei_id
    LEFT JOIN d_kylla_ei d35 on d35.id = opisk_amk_koulala1_kyllaei_id
    LEFT JOIN d_kylla_ei d36 on d36.id = opisk_amk_koulala2_kyllaei_id
    LEFT JOIN d_kylla_ei d37 on d37.id = opisk_amk_koulala3_kyllaei_id
    LEFT JOIN d_kylla_ei d38 on d38.id = opisk_amk_koulala4_kyllaei_id
    LEFT JOIN d_kylla_ei d39 on d39.id = opisk_amk_koulala5_kyllaei_id
    LEFT JOIN d_kylla_ei d40 on d40.id = opisk_amk_koulala6_kyllaei_id
    LEFT JOIN d_kylla_ei d41 on d41.id = opisk_amk_koulala7_kyllaei_id
    LEFT JOIN d_kylla_ei d42 on d42.id = opisk_amk_koulala8_kyllaei_id
    LEFT JOIN d_kylla_ei d43 on d43.id = opisk_amk_koulala9_kyllaei_id
    LEFT JOIN d_kylla_ei d44 on d44.id = opisk_amk_koulala10_kyllaei_id
    LEFT JOIN d_kylla_ei d45 on d45.id = opisk_yo_koulala1_kyllaei_id
    LEFT JOIN d_kylla_ei d46 on d46.id = opisk_yo_koulala2_kyllaei_id
    LEFT JOIN d_kylla_ei d47 on d47.id = opisk_yo_koulala3_kyllaei_id
    LEFT JOIN d_kylla_ei d48 on d48.id = opisk_yo_koulala4_kyllaei_id
    LEFT JOIN d_kylla_ei d49 on d49.id = opisk_yo_koulala5_kyllaei_id
    LEFT JOIN d_kylla_ei d50 on d50.id = opisk_yo_koulala6_kyllaei_id
    LEFT JOIN d_kylla_ei d51 on d51.id = opisk_yo_koulala7_kyllaei_id
    LEFT JOIN d_kylla_ei d52 on d52.id = opisk_yo_koulala8_kyllaei_id
    LEFT JOIN d_kylla_ei d53 on d53.id = opisk_yo_koulala9_kyllaei_id
    LEFT JOIN d_kylla_ei d54 on d54.id = opisk_yo_koulala10_kyllaei_id
    LEFT JOIN d_kylla_ei d55 on d55.id = opisk_vah2_koulala_kyllaei_id
    LEFT JOIN d_kylla_ei d56 on d56.id = haku_amm_kyllaei_id
    LEFT JOIN d_kylla_ei d57 on d57.id = haku_amk_kyllaei_id
    LEFT JOIN d_kylla_ei d58 on d58.id = haku_yo_kyllaei_id
WHERE tutkintoryhma_koodi in (1,2,3,31,32,33) AND d15.vuosiselite > '2008'

Union all

----------------- Tutkimuksen henkilövoimavarat (K) ----------------
select
 [Tilastovuosi]=f.tilastovuosi
,[Ennustevuosi]=NULL
,[Hallinnonala]=NULL
,[Koulutuksen tavoite]=NULL
,[Koulutusaste 2002]=d6.koulutusaste2002
,[Koulutusala 2002]=d6.koulutusala2002
,[Koulutusaste, taso 2]=d6.Koulutusaste_taso2
,[Koulutusala, taso 1]=d6.iscfibroad2013
,[Asuinkunta]=d5.kunta
,[Asuinmaakunta]=d5.maakunta
,[Koulutuksen kunta historia]= NULL
,[Koulutuksen kunta]= NULL
,[Oppilaitoksen kunta historia]= NULL
,[Oppilaitoksen kunta]= NULL
,[Koulutuksen maakunta historia]= NULL
,[Koulutuksen maakunta]= NULL
,[Oppilaitoksen maakunta historia]= NULL
,[Oppilaitoksen maakunta]=NULL
,[Oppilaitoksen omistajatyyppi]=NULL
,[Koulutuksen järjestäjän omistajatyyppi]=NULL
,[Oppilaitostyyppi]= NULL
,[Nuorten/aikuisten koulutus]=NULL
,[Järjestämistapa]=NULL
,[Järjestämismuoto]=NULL
,[Tutkintotyyppi]=NULL
,[Kansalaisuus]=d2.maa
,[Pohjoismaa]=NULL
,[Äidinkieli]=NULL
,[Väestön ikä]=NULL
,[Väestön ikä 5v]=NULL
,[Väestöennusteen maakunta]=NULL
,[Pääasiallinen toiminta]=NULL
,[Pääasiallinen toiminta okm]=NULL
,[Tutkintolaji työllistymiseen]=NULL
,[Tarkastelujakso] = NULL
,[Tarkastelujakso II] =NULL
,[Tutkinnon suoritusvuosi]= NULL
,[Koul. sijoittuneen koulutusaste, taso 2]=NULL
,[Koul. sijoittuneen koulutusala, taso 1]=NULL
,[Koul. sijoittuneen koulutusaste 2002]=NULL
,[Koul. sijoittuneen koulutusala 2002]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta]=NULL
,[Koul. päättäneiden toiminta]=NULL
,[Tutkintoryhmä]=NULL
,[Haut koulutuksiin]=NULL
,[Tutkinnon suorituskunta]= d7.kunta
,[Tutkinnon suoritusmaakunta]=d7.maakunta
,[Oppilaitos]=NULL
,[Tiede ja teknologia - työpaikan maakunta]= d9.maakunta
,[Tiede ja teknologia - toimiala, taso 2] = d10.toimiala_tthv
,[Tiede ja teknologia - toimiala, taso 1] = d10.paatoimiala_tthv
,[Tiede ja teknologia - työnantajasektori] = d18.tyonantajasektori2
,[Väestöennusteen ennustemalli]=NULL
,[Maakunta (yhdistetty)] = d5.maakunta


/* Kieliversiot lisätään kun rakenne ok */


--Mittarit
,[Opiskelijat]=NULL
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
,[Väestöennuste]=NULL
,[Koulut lkm]= NULL
,[haku_sij_henkilö lkm] = NULL
,[TT_htv]=f.lkm

/* Koodit */
,[Hallinnonala koodi]=NULL
,[Koulutuksen tavoite koodi]=NULL
,[Koulutusaste 2002 koodi]=d6.koulutusaste2002_koodi
,[Koulutusala 2002 koodi]=d6.koulutusala2002_koodi
,[Koulutusaste, taso 2 koodi]=d6.Koulutusaste_taso2_koodi
,[Koulutusala, taso 1 koodi]=d6.iscfibroad2013_koodi
,[Asuinkunta koodi]=d5.kunta_koodi
,[Asuinmaakunta koodi]=d5.maakunta_koodi
,[Koulutuksen kunta koodi historia]= NULL
,[Koulutuksen kunta koodi]= NULL
,[Oppilaitoksen kunta koodi historia]= NULL
,[Oppilaitoksen kunta koodi]= NULL
,[Koulutuksen maakunta koodi historia]= NULL
,[Koulutuksen maakunta koodi]= NULL
,[Oppilaitoksen maakunta koodi historia]= NULL
,[Oppilaitoksen maakunta koodi]= NULL
,[Oppilaitoksen omistajatyyppi koodi]= NULL
,[Koulutuksen järjestäjän omistajatyyppi koodi]= NULL
,[Oppilaitostyyppi koodi]= NULL
,[Nuorten/aikuisten koulutus koodi]=NULL
,[Järjestämistapa koodi]=NULL
,[Järjestämismuoto koodi]=NULL
,[Tutkintotyyppi koodi]=NULL
,[Kansalaisuus koodi]=d2.maa_koodi
,[Pohjoismaa koodi]=NULL
,[Äidinkieli koodi]=NULL
,[Väestön ikä koodi]=NULL
,[Väestön ikä 5v koodi]=NULL
,[Väestöennusteen maakunta koodi]=NULL
,[Pääasiallinen toiminta koodi]=NULL
,[Pääasiallinen toiminta okm koodi]=NULL
,[Tutkintolaji työllistymiseen koodi]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2 koodi]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 koodi]=NULL
,[Koul. sijoittuneen koulutusaste 2002 koodi]=NULL
,[Koul. sijoittuneen koulutusala 2002 koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta koodi]=NULL
,[Koul. sijoittuneen oppilaitoksen kunta koodi]=NULL
,[Tutkinnon suorituskunta koodi]= d7.kunta_koodi
,[Tutkinnon suoritusmaakunta koodi]=d7.maakunta_koodi
,[Tutkintoryhma koodi]=NULL
,[Koulutuksen päättäneiden toiminta koodi]=NULL
,[Oppilaitoskoodi]= NULL
,[Tiede ja teknologia - työpaikan maakunta koodi]= d9.maakunta_koodi
,[Tiede ja teknologia - toimiala, taso 2 koodi] = d10.toimiala_tthv_avain
,[Tiede ja teknologia - työnantajasektori koodi] = d18.tyonantajasektori2_avain


/* järjestykset */
,[Hallinnonala jarj]=NULL
,[Koulutuksen tavoite jarj]=NULL
,[Koulutusaste 2002 jarj]=d6.jarjestys_koulutusaste2002
,[Koulutusala 2002 jarj]=d6.jarjestys_koulutusala2002
,[Koulutusaste, taso 2 jarj]=d6.jarjestys_Koulutusaste_taso2
,[Koulutusala, taso 1 jarj]=d6.jarjestys_iscfibroad2013
,[Asuinmaakunta jarj]=d5.jarjestys_maakunta
,[Koulutuksen maakunta historia jarj]= NULL
,[Koulutuksen maakunta jarj]= null
,[Oppilaitoksen maakunta historia jarj]= NULL
,[Oppilaitoksen maakunta jarj]= NULL
,[Oppilaitoksen omistajatyyppi jarj]= NULL
,[Koulutuksen järjestäjän omistajatyyppi jarj]= NULL
,[Oppilaitostyyppi jarj]= NULL
,[Nuorten/aikuisten koulutus jarj]=NULL
,[Järjestämistapa jarj]=NULL
,[Järjestämismuoto jarj]=NULL
,[Tutkintotyyppi jarj]=NULL
,[Kansalaisuus jarj]=null
,[Pohjoismaa jarj]=NULL
,[Äidinkieli jarj]=null
,[Väestön ikä jarj]=NULL
,[Väestön ikä 5v jarj]=NULL
,[Väestöennusteen maakunta jarj]=NULL
,[Pääasiallinen toiminta jarj]=NULL
,[Pääasiallinen toiminta okm jarj]=NULL
,[Tutkintolaji työllistymiseen jarj]=NULL
,[Koul. sijoittuneen koulutusaste, taso 2 jarj]=NULL
,[Koul. sijoittuneen koulutusala, taso 1 jarj]=NULL
,[Koul. sijoittuneen koulutusaste 2002 jarj]=NULL
,[Koul. sijoittuneen koulutusala 2002 jarj]=NULL
,[Koul. sijoittuneen oppilaitoksen maakunta jarj]=NULL
,[Tutkintoryhma_jarjestys]=d6.jarjestys
,[tutksuor_al_jarjestys_maakunta]=null
,[koul_paattaneiden_toiminta_jarjestys]=null
,[haku_koulutuksiin_jarjestys]=null
,[Tiede ja teknologia - työpaikan maakunta jarj]= d9.jarjestys_maakunta
,[Tiede ja teknologia - toimiala, taso 2 jarj] = d10.jarjestys_toimiala_tthv
,[Tiede ja teknologia - toimiala, taso 1 jarj] = d10.jarjestys_paatoimiala_tthv
,[Tiede ja teknologia - työnantajasektori jarj] = d18.tyonantajasektori2_avain
,[Maakunta (yhdistetty) jarj] = d5.jarjestys_maakunta

  FROM [VipunenTK].[dbo].[f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat] f
  inner join [VipunenTK].[dbo].d_valtio d1 on d1.id = f.syntymamaa_id
  inner join [VipunenTK].[dbo].d_valtio d2 on d2.id = f.kansalaisuus_valtio_id
  inner join [VipunenTK].[dbo].d_sukupuoli d3 on d3.id = f.sukupuoli_id
  inner join [VipunenTK].[dbo].d_ika d4 on d4.id = f.ika_id
  inner join [VipunenTK].[dbo].d_alueluokitus d5 on d5.id = f.asuinmaakunta_id
  inner join [VipunenTK].[dbo].d_koulutusluokitus d6 on d6.id = f.koulutusluokitus_id
  inner join [VipunenTK].[dbo].d_alueluokitus d7 on d7.id = f.tutkinnon_suoritusmaakunta_id
  inner join [VipunenTK].[dbo].d_alueluokitus d9 on d9.id = f.tyopaikan_sijaintimaakunta_id
  inner join [VipunenTK].[dbo].d_toimiala_tthv d10 on d10.id = f.toimialaluokitus_tthv_id
  inner join VipunenTK.dbo.d_tyonantajasektori2 d18 on d18.id=f.tyonantajasektori2_tthv_id


GO

[USE ANTERO]


