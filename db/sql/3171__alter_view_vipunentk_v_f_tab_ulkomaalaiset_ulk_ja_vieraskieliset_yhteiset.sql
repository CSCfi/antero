USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_ulkomaalaiset_ulk_ja_vieraskieliset_yhteiset]    Script Date: 17.7.2020 15:29:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_f_tab_ulkomaalaiset_ulk_ja_vieraskieliset_yhteiset] AS

Select
[Tilastovuosi]
,d4.sukupuoli as 'Sukupuoli'
,CASE 
	WHEN f.Aineisto = '2.3' THEN d3b.avi
	ELSE d3.avi 
END as 'Asuinalueen AVI'
,CASE 
	WHEN f.Aineisto = '2.3' THEN d3b.ely
	ELSE d3.ely
END as 'Asuinalueen ELY'
,CASE 
	WHEN f.Aineisto = '2.3' THEN d3b.maakunta
	ELSE d3.maakunta
END as Asuinmaakunta
,d3.kielisuhde as 'Asuinkunnan kielisuhde'
,d3.kunta as Asuinkunta
,d20b.hallinnonala as 'Hallinnonala'
,d21.koulutusala2002 as 'Koulutusala (2002)'
,d21.opintoala2002 as 'Opintoala (2002)'
,d21.iscfinarrow2013 as 'Koulutusala, taso 2'
,d21.iscfibroad2013 as 'Koulutusala, taso 1'
,d16.kieli as 'Koulutuksen kieli'
,d22.avi as 'Koulutuksen AVI'
,d22.ely as 'Koulutuksen ELY'
,d22.maakunta as 'Koulutuksen maakunta'
,d22.kielisuhde as 'Koul. kunnan kielisuhde'
,d22.kunta as 'Koulutuksen kunta'
,d12.opiskelijan_olo as 'Kirjoillaolo (syys)'
,d19.koulutussektori as 'Koulutussektori'
,d5b.ika5v as 'Ikäryhmä I'
,d5c.ika as 'Ikäryhmä II'
,d2.aidinkieli_versio1 as 'Äidinkieli I' --muutettu
--,d2b.aidinkieli_versio2 as 'Äidinkieli (versio 2)'
,d50.asuinkunta_sama_vai_eri_kuin_aiemmin AS 'Asuinkunta sama/eri ed. tilv'  --muutettu
,d51.edeltavan_vuoden_asuinpaikka AS 'Edeltävän vuoden asuinpaikka'
,[suomeen_muuttamisvuosi] AS 'Suomeen muuttamisvuosi'
,d52.kieli AS 'Äidinkieli II' --muutettu
,d53.maa as 'Kansalaisuus'
,d53.maanosa as 'Kansalaisuus (maanosa)'
,d53.eumaa as 'EU-maan kansalainen'
,d53.etamaa as 'ETA-maan kansalainen'


/* ei kieliversioita vielä */
,d53b.maa as 'Syntymämaa'
,d53b.maanosa as 'Syntymämaa (maanosa)'
,d53c.maa as 'Äidin syntymämaa'
,d53c.maanosa as 'Äidin syntymämaa (maanosa)'
,d53d.maa as 'Isän syntymämaa'
,d53d.maanosa as 'Isän syntymämaa (maanosa)'
,d54.hetu_ok as 'Henkilötunnuksen oikeellisuus'
,d55.koulutusryhma as 'Koulutusryhmä II'
,d55.koulutusryhma2 as 'Koulutusryhmä'
,d56.maassaolo AS 'Maassaolo'
,d57.tutkinnon_toteuma AS 'Koko tutkinto/tutkinnon osa'
,[suoritusaika] -- miten tuntemattoman käännökset hoidetaan?
,d58.maahantulo_ja_opiskelun_aloittaminen as 'Maahantulo ja II asteen koul. aloittaminen' --muutettu
,d59.maahantulo_ja_opiskelun_aloittaminen as 'Maahantulo ja korkeakoul. aloittaminen'  --muutettu
,d60.koulutuksen_jarjestamismuoto AS 'Koulutuksen järjestämismuoto'

,CASE
	WHEN d19.koulutussektori_koodi IN ('1', '2', '3') THEN 'Toisen asteen koulutus'
	WHEN d19.koulutussektori_koodi IN ('4', '5') THEN 'Korkeakoulutus'
	ELSE 'Tuntematon'
END AS 'Toinen aste / Korkea-aste'


/*** JÄRJESTYSMUUTTUJAT ***/

,CASE 
	WHEN f.Aineisto = '2.3' THEN d3b.jarjestys_avi
	ELSE d3.jarjestys_avi
END as jarj_as_avi
,CASE 
	WHEN f.Aineisto = '2.3' THEN d3b.jarjestys_ely
	ELSE d3.jarjestys_ely
END as jarj_as_ely
,CASE 
	WHEN f.Aineisto = '2.3' THEN d3b.jarjestys_maakunta
	ELSE d3.jarjestys_maakunta
END as jarj_as_maakunta
,d3.jarjestys_kielisuhde as jarj_as_kielisuhde
,d3.jarjestys as jarj_as_kunta
,d20b.jarjestys as jarj_hallinnonala
,d21.jarjestys_koulutusala2002
,d21.jarjestys_opintoala2002
,d21.jarjestys_iscfinarrow2013
,d21.jarjestys_iscfibroad2013
,d16.jarjestys as jarj_koulkiel
,d16.jarjestys_iso3kirjainta as jarj_koulkiel2
,d22.jarjestys_avi
,d22.jarjestys_ely
,d22.jarjestys_maakunta
,d22.jarjestys_kielisuhde
,d22.jarjestys as jarj_kunta
,d12.jarjestys as jarj_kirjolosyys
,d19.jarjestys as jarj_koulsek
,d5.jarjestys_ika
,d5.jarjestys_ika5v as jarj_ika5v
,d5b.jarjestys_ika5v as jarj_ikaryhma1
,d5c.jarjestys_ika as jarj_ikaryhma2
,d2.jarjestys as jarj_aidinkieli1
--,d2b.jarjestys as jarj_aidinkieli2
,CASE
		WHEN d52.kieli_avain IN ('90', '99') THEN 'ZZY'
	    WHEN d52.kieli_avain IN ('-1', '-2') THEN 'ZZZ'
		ELSE left(d52.kieli,3) 
END AS jarj_aidinkieli
,d53.jarjestys as jarj_kansallisuus
,d53.jarjestys_maanosa as jarj_kans_maanosa
,d53.jarjestys_etamaa as jarj_kans_etamaa
,d53.jarjestys_eumaa as jarj_kans_eumaa
,d53b.jarjestys as jarj_syntmaa
,d53b.jarjestys_maanosa as jarj_syntmaa_maanosa
,d53c.jarjestys as jarj_syntmaa_aiti
,d53c.jarjestys_maanosa as jarj_syntmaa_aiti_maanosa
,d53d.jarjestys as jarj_syntmaa_isa
,d53d.jarjestys_maanosa as jarj_syntmaa_isa_maanosa
,d55.jarjestys as jarj_koulutusryhma
,jarjestys_suoritusaika 
,jarjestys_syntymavuosi
,[jarjestys_suomeen_muuttamisvuosi]

/*** KOODIMUUTTUJAT ***/

,f.Aineisto as 'Koodit Aineisto'
,d3.maakunta_koodi as 'Koodit Asuinmaakunta'
,d3.kunta_koodi as 'Koodit Asuinkunta'
,d21.koulutusaste2002_koodi as 'Koodit Koulutusaste 2002'
,d21.koulutusala2002_koodi as 'Koodit Koulutusala 2002'
,d21.opintoala1995_koodi as 'Koodit Koulutusala 1995'
,d21.opintoala2002_koodi as 'Koodit Opintoala 2002'
,d21.iscfinarrow2013_koodi as 'Koodit Koulutusala, taso 2'
,d21.iscfibroad2013_koodi as 'Koodit Koulutusala, taso 1'
,d21.koulutus_koodi as 'Koodit Koulutusnimike'
,d22.maakunta_koodi as 'Koodit Koulutuksen maakunta'
,d22.kunta_koodi as 'Koodit Koulutuksen kunta'
,d12.opiskelijan_olo_koodi as 'Koodit Kirjoillaolo'
,d1.aineisto_koodi as 'Koodit Aineisto Ennakko / Lopullinen'
,d2.aidinkieli_versio1_koodi as 'Koodit Äidinkieli1'
,d52.kieli_koodi AS 'Koodit Äidinkieli'
,d53.maa_koodi AS 'Koodit Kansalaisuus (maa)'
,d53b.maa_koodi AS 'Koodit Syntymämaa'
,d53c.maa_koodi AS 'Koodit Syntymämaa (äiti)'
,d53d.maa_koodi AS 'Koodit Syntymämaa (isä)'

/*** Lukumäärämuuttujat ***/

,[aloittaneet]
,[opiskelijat]
,[tutkinnot]
,[aloittaneet2_17]
,[opiskelijat2_17]
,[tutkinnot2_17]= 
CASE 
		WHEN tilastovuosi = 2010 AND d55.koulutusryhma_koodi IN ('21','22') AND f.aineisto = 'K2.17' THEN NULL
		ELSE [tutkinnot2_17]
 END
,[aloittaneet_ulkomaalaistausta_kielen_mukaan]
,[opiskelijat_ulkomaalaistausta_kielen_mukaan]
,[tutkinnot_ulkomaalaistausta_kielen_mukaan] = 
CASE 
		WHEN tilastovuosi = 2010 AND d55.koulutusryhma_koodi IN ('21','22') AND f.aineisto = 'K2.17' THEN NULL
		ELSE [tutkinnot_ulkomaalaistausta_kielen_mukaan]
 END
,[aloittaneet_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
,[opiskelijat_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
,[tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan] = 
CASE 
		WHEN tilastovuosi = 2010 AND d55.koulutusryhma_koodi IN ('21','22') AND f.aineisto = 'K2.17' THEN NULL
		ELSE [tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
 END
,[aloittaneet_ulkomaalaiset]
,[opiskelijat_ulkomaalaiset]
,[tutkinnot_ulkomaalaiset] =
CASE 
		WHEN tilastovuosi = 2010 AND d55.koulutusryhma_koodi IN ('21','22') AND f.aineisto = 'K2.17' THEN NULL
		ELSE [tutkinnot_ulkomaalaiset]
 END
,[aloittaneet_ulkomailla_syntyneet]
,[opiskelijat_ulkomailla_syntyneet]
,[tutkinnot_ulkomailla_syntyneet] =
CASE 
		WHEN tilastovuosi = 2010 AND d55.koulutusryhma_koodi IN ('21','22') AND f.aineisto = 'K2.17' THEN NULL
		ELSE [tutkinnot_ulkomailla_syntyneet]
 END


/*** RUOTSI - tehdään kieliversiot vasta lopuksi ***/

,tilastovuosi as Statistikår
--,d20.opetushallinnon_koulutus_SV as Förvaltningsområde
,d20b.hallinnonala_SV as Förvaltningsområde
,d4.sukupuoli_SV as Kön
,d5b.ika5v_SV as 'Åldersgrupp'
,d55.koulutusryhma2_SV as 'Utbildningsgrupp'
,d21.koulutusala2002_SV as 'Utbildningsområde (2002)'
,d21.iscfinarrow2013_SV as 'Utbildningsområde, nivå 2'
,d21.iscfibroad2013_SV as 'Utbildningsområde, nivå 1'
,d22.maakunta_SV as 'Utbildningens landskap'
,CASE
	WHEN d19.koulutussektori_koodi IN ('1', '2', '3') THEN 'Andra stadiets utbildning'
	WHEN d19.koulutussektori_koodi IN ('4', '5') THEN 'Högskoleutbildning'
	ELSE 'Okänd'
END AS 'Andra stadiet / Hög nivå'
,d19.koulutussektori_SV as Utbildningssektor

/*
,d3.avi_SV as 'Asuinalueen AVISV'
,d3.ely_SV as 'Asuinalueen ELYSV'
,d3.kielisuhde_SV as 'Asuinkunnan kielisuhdeSV'
,d3.maakunta_SV as Bostadslandskap
,d3.kunta_SV as Bostadskommun

,d21.koulutusaste2002_SV as 'Utbildningsnivå (2002)'

,d21.opintoala1995_SV as 'Utbildningsområde (1995)'
,d21.opintoala2002_SV as 'Studieområde (2002)'
,d21.koulutus_SV as Utbildningsbenämning

,d16.kieli_SV as 'Koulutuksen kieliSV'

,d22.avi_SV as 'Koulutuksen AVISV'
,d22.ely_SV as 'Koulutuksen ELYSV'

,d22.kielisuhde_SV as 'Koul. kunnan kielisuhdeSV'
,d22.kunta_SV as 'Utbildningens kommun'

,d12.opiskelijan_olo_SV as 'Inskrivning (september)'

,d1.aineisto_SV as AineistoSV



,d2.aidinkieli_versio1_SV as Modersmål
,d2b.aidinkieli_versio2_SV as 'Modersmål (utbildningsstruktur)'


,d50.asuinkunta_sama_vai_eri_kuin_aiemmin_SV AS 'Asuinkunta sama vai eri kuin aiemmin SV'

,d51.edeltavan_vuoden_asuinpaikka_SV AS 'Edeltävän vuoden asuinpaikka SV'

,[suomeen_muuttamisvuosi] AS 'Suomeen muuttamisvuosi SV'

,d52.kieli_SV AS 'Äidinkieli SV'

,d53.maa_sv as kansalaisuus_sv
,d53.maanosa_SV as 'Medborgarskap (världsdel)'
,d53.eumaa_sv as eumaa_sv
,d53.etamaa_sv as etamaa_sv
*/



/*** ENGLANTI ***/

,tilastovuosi as 'Statistical year'
--,d20.opetushallinnon_koulutus_EN as 'Administrative sector'
,d20b.hallinnonala_EN as 'Administrative sector'
,d4.sukupuoli_EN as Gender
,d5b.ika5v_EN as 'Age group'
,d55.koulutusryhma2_EN as 'Education group'
,d21.koulutusala2002_EN as 'Field of education (2002)'
,d21.iscfinarrow2013_EN as 'Field of education, tier 2'
,d21.iscfibroad2013_EN as 'Field of education, tier 1'
,d22.maakunta_EN as 'Region of education'
,CASE
	WHEN d19.koulutussektori_koodi IN ('1', '2', '3') THEN 'Upper secondary education'
	WHEN d19.koulutussektori_koodi IN ('4', '5') THEN 'Higher education'
	ELSE 'Tuntematon'
END AS 'Upper secondary / Tertiary'
,d19.koulutussektori_EN as 'Sector of education'

/*

,d20.opetushallinnon_koulutus_EN as HallinnonalaEN
,d3.avi_EN as 'Asuinalueen AVIEN'
,d3.ely_EN as 'Asuinalueen ELYEN'
,d3.kielisuhde_EN as 'Asuinkunnan kielisuhdeEN'
,d3.maakunta_EN as 'Region of residence'
,d3.kunta_EN as 'Municipality of residence'
,d21.koulutusaste2002_EN as 'Level of education (2002)'
,d21.koulutusala2002_EN as 'Field of education (2002)'
,d21.opintoala1995_EN as 'Field of education (1995)'
,d21.opintoala2002_EN as 'Subfield of ed. (2002)'
,d21.koulutus_EN as 'Name of education'

,d16.kieli_EN as 'Koulutuksen kieliEN'

,d22.avi_EN as 'Koulutuksen AVIEN'
,d22.ely_EN as 'Koulutuksen ELYEN'
,d22.maakunta_EN as 'Region of education'
,d22.kielisuhde_EN as 'Koul. kunnan kielisuhdeEN'
,d22.kunta_EN as 'Municipality of education'


,d12.opiskelijan_olo_EN as 'Enrollment status (sept.)'

,d1.aineisto_EN as AineistoEN



,d2.aidinkieli_versio1_EN as 'Mother tongue'
,d2b.aidinkieli_versio2_EN as 'Mother tongue (ed. structure)'


,d50.asuinkunta_sama_vai_eri_kuin_aiemmin_EN AS 'Asuinkunta sama vai eri kuin aiemmin EN'

,d51.edeltavan_vuoden_asuinpaikka_EN AS 'Edeltävän vuoden asuinpaikka EN'

,[suomeen_muuttamisvuosi] AS 'Suomeen muuttamisvuosi EN'

,d52.kieli_EN AS 'Äidinkieli EN'

,d53.maa_en as kansalaisuus_en
,d53.maanosa_EN as 'Nationality (continent)'
,d53.eumaa_en as eumaa_en
,d53.etamaa_en as etamaa_en
*/

/*** käyttämättömät

,d1b.aineisto as Aineisto_OTV
,d1b.kaikkien_asteiden_koulutus as 'Kaikkien asteiden koulutus'
,d1b.tilastointivuosi as OTV_Tilv

,d3b.avi as 'Til.v:tta edeltävä AVI'
,d3b.ely as 'Til.v:tta edeltävä ELY'
,d3b.kielisuhde as 'Til.v:tta ed. asuinkunnan kielisuhde'
,d3b.maakunta as 'Til.v:tta ed. asuinmaakunta'
,d3b.kunta as 'Til.v:tta ed. asuinkunta'
,d3c.avi as '2v til.v:tta ed. AVI'
,d3c.ely as '2v til.v:tta ed. ELY'
,d3c.kielisuhde as '2v til.v:tta ed. asuinkunnan kielisuhde'
,d3c.maakunta as '2v til.v:tta ed. asuinmaakunta'
,d3c.kunta as '2v til.v:tta ed. asuinkunta'


,d5b.vuosiselite as Syntymävuosi
,d5c.kuukausiselite as Syntymäkuukausi
,d6a.tutkinto_amk as 'Tutkinto (amk)'
,d6b.tutkinto_yo as 'Tutkinto (yo)'
,d7.koulutustyyppi as Koulutustyyppi
,d8.kansalaisuus_versio2 as Kansalaisuus
,d8b.kansalaisuus_versio1 as 'Kansalaisuus (väestörakenne)'
--luodaan yhdistetty kansalaisuus-muuttuja, joka toimii aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d8.kansalaisuus_versio2_koodi = '1' Or d8b.kansalaisuus_versio1_koodi = '1' THEN
'suomi' When d8.kansalaisuus_versio2_koodi = '2' Or d8.kansalaisuus_versio2_koodi = '9' Or d8b.kansalaisuus_versio1_koodi = '2' THEN 'muu'
 Else 'Tuntematon' End AS 'Kansalaisuus (suomi/muu)'
--
,d9.oppilaitos as Oppilaitos
,d9.oppilaitos as Yliopisto
,d9.oppilaitos as Ammattikorkeakoulu
,d9.opetuskieli as Opetuskieli
,d9.oppilaitoksen_omistajatyyppi as 'Oppil. omistajatyyppi'
,d9.oppilaitostyyppi as Oppilaitostyyppi
,d9b.koulutuksen_jarjestaja as 'Koulutuksen järjestäjä'
,d9b.koulutuksen_jarjestajan_omistajatyyppi as 'Koul. järj. omistajatyyppi'
,d10.lahde as Lähde
,d11.koulutusohjelma_amk as Koulutusohjelma

,d12b.opiskelijan_olo_tamm as 'Kirjoillaolo (tammi)'
,d13.rahoituslahde as Rahoituslähde
,d15.suuntautumisvaihtoehto_amk as Suuntautumisvaihtoehto

,d17.ensisijainen_opintooikeus as 'Ensisijainen opinto-oikeus'
,d18.tilauskoulutuksen_sijaintimaa as 'Tilauskoulutuksen sijaintimaa'



,d21b.koulutuslaji_okm as Koulutuslaji
,d21b.koulutuslaji_okm2 as Koulutuslaji2

--
,d22b.avi as 'Koul. järjestäjän AVI'
,d22b.ely as 'Koul. järjestäjän ELY'
,d22b.maakunta as 'Koul. järjestäjän maakunta'
,d22b.kielisuhde as 'Koul. järj. kunnan kielisuhde'
,d22b.kunta as 'Koul. järjestäjän kunta'
,d22c.avi as 'Oppilaitoksen AVI'
,d22c.ely as 'Oppilaitoksen ELY'
,d22c.maakunta as 'Oppilaitoksen maakunta'
,d22c.kielisuhde as 'Oppil. kunnan kielisuhde'
,d22c.kunta as 'Oppilaitoksen kunta'
,d23.vuosiselite as 'Kirjoihintulovuosi'
,d23b.lukukausiselite as 'Kirjoihintulokausi'
,d24b.vuosiselite as 'Kirjoihintulovuosi (kk-sek.)'
,d24c.vuosiselite as 'Kirjoihintulovuosi (kk-sek. läsna)'
,d24d.vuosiselite as 'Kirjoihintulovuosi (sek.)'
,d24e.vuosiselite as 'Kirjoihintulovuosi (sek. läsnä)'
,d24f.vuosiselite as 'Kirjoihintulovuosi (kk)'
,d24f2.lukukausiselite as 'Kirjoihintulokausi (kk)'
,d24g.vuosiselite as 'Kirjoihintulovuosi (kk läsnä)'
,d24h.vuosiselite as 'Kirjoihintulovuosi (op.ala)'
,d24i.vuosiselite as 'Kirjoihintulovuosi (op.ala läsnä)'
,d24j.vuosiselite as 'Kirjoihintulovuosi (tutk.)'
,d24k.lukukausiselite as 'Kirjoihintulokausi (tutk.)'
,d28.vahintaan_55_op_suorittanut as 'Suorittanut väh. 55 op'
,d29.opiskelijan_fte_tieto as 'Opiskelijan FTE-tieto'
--,d30.opiskelumuoto as Opiskelumuoto
,d31.yliopisto as Yliopistotunnus
,d32.tiedekunta_yo as Tiedekunta
,d33.uusi_vanha_opiskelija as 'Uusi/vanha opiskelija'
,d35.opettajankelpoisuus as Opettajankelpoisuus
,d36.avoinvayla as 'Hyväksytty avoimen yliop. suoritusten kautta'
,d37.vuosiselite as 'Tutkinnon suoritusvuosi'
,d38.lukukausiselite as 'Tutk. suorituslukukausi'
,d39.kuukausiselite as 'Tutk. suorituskuukausi'
,d40.maanosa as 'Kansalaisuus (maanosa)'
,d41.eumaa as 'EU-maan kansalainen'
,d42.etamaa as 'ETA-maan kansalainen'
,d43.pohjoismaa as 'Pohjoismaan kansalainen'



/*** JÄRJESTYSMUUTTUJAT ***/

,d1b.jarjestys as aineisto_otv_jarj


,d3b.jarjestys_avi as jarj_as_avi1x
,d3b.jarjestys_ely as jarj_as_ely1x
,d3b.jarjestys_kielisuhde as jarj_as_kielisuhde1x
,d3b.jarjestys_maakunta as jarj_as_maakunta1x
,d3b.jarjestys as jarj_as_kunta1x
,d3c.jarjestys_avi as jarj_as_avi2x
,d3c.jarjestys_ely as jarj_as_ely2x
,d3c.jarjestys_kielisuhde as jarj_as_kielisuhde2x
,d3c.jarjestys_maakunta as jarj_as_maakunta2x
,d3c.jarjestys as jarj_as_kunta2x

,d5b.jarjestys as jarj_syntv
,d6a.jarjestys as jarj_tutk_amk
,d6b.jarjestys as jarj_tutk_yo
,d7.jarjestys as jarj_koultyyppi
,d8.jarjestys as jarj_kansalaisuus
,d8b.jarjestys as jarj_kansalaisuus2
--yhdistetyn muuttujan järjestys
,CASE WHEN d8.kansalaisuus_versio2_koodi = '1' Or d8b.kansalaisuus_versio1_koodi = '1' THEN
'1' When d8.kansalaisuus_versio2_koodi = '2' Or d8.kansalaisuus_versio2_koodi = '9' Or d8b.kansalaisuus_versio1_koodi = '2' THEN '2'
 Else '99' End AS 'jarj_kansalaisuus3'
--
,d9.jarjestys_oppilaitos
,d9.jarjestys_opetuskieli
,d9.jarjestys_omistajatyyppi
,d9.jarjestys_oppilaitostyyppi
,d11.jarjestys as jarj_koulohjelma_amk

,d12b.jarjestys as jarj_kirjolotammi
,d13.jarjestys as jarj_rahoitus
,d15.jarjestys as jarj_suunnvaiht

,d17.jarjestys as jarj_ensop
,d18.jarjestys as jarj_tilauskoul



,d21b.jarjestys as jarj_koullaji
,d21b.jarjestys2 as jarj_koullaji2

--
,d22b.jarjestys_avi as jarjestys_avi2
,d22b.jarjestys_ely as jarjestys_ely2
,d22b.jarjestys_maakunta as jarjestys_maakunta2
,d22b.jarjestys_kielisuhde as jarjestys_kielisuhde2
,d22b.jarjestys as jarj_kunta2
,d22c.jarjestys_avi as jarjestys_avi3
,d22c.jarjestys_ely as jarjestys_ely3
,d22c.jarjestys_maakunta as jarjestys_maakunta3
,d22c.jarjestys_kielisuhde as jarjestys_kielisuhde3
,d22c.jarjestys as jarj_kunta3
,d23b.jarjestys as jarj_lukukausi
,d24f2.jarjestys as jarj_lukukausi_kk
,d28.jarjestys as jarj_vah55
,d29.jarjestys as jarj_op_fte
--,d30.jarjestys as jarj_opmuoto
,d32.jarjestys as jarj_tiedekunta
,d33.jarjestys as jarj_uusivanha
,d35.jarjestys as jarj_opettajankelpoisuus
,d36.jarjestys as jarj_avoinvayla
,d39.jarjestys as jarj_suor_kk

,d41.jarjestys_eumaa
,d42.jarjestys_etamaa
,d43.jarjestys as jarj_pohj_kans




/*** KOODIMUUTTUJAT ***/


,d1b.aineisto_koodi as ainesto_koodi_otv


,d3b.maakunta_koodi as asmaak1xmk
,d3b.kunta_koodi as asmaak1xk
,d5c.kuukausi as syntk
,d6a.tutkinto_amk_koodi as 'Koodit Tutkinto (amk)'
,d6b.tutkinto_yo_koodi as 'Koodit Tutkinto (yo)'
,d7.koulutustyyppi_koodi as 'Koodit Koulutustyyppi'
,d8.kansalaisuus_versio2_koodi as kansalaisuus_koodi
,d8b.kansalaisuus_versio1_koodi as kansalaisuus2_koodi
--yhdistetyn muuttujan koodi
,CASE WHEN d8.kansalaisuus_versio2_koodi = '1' Or d8b.kansalaisuus_versio1_koodi = '1' THEN
'1' When d8.kansalaisuus_versio2_koodi = '2' Or d8.kansalaisuus_versio2_koodi = '9' Or d8b.kansalaisuus_versio1_koodi = '2' THEN '2'
 Else '-1' End AS 'kansalaisuus3_koodi'
--
,d9.oppilaitoskoodi as 'Koodit Oppilaitos'
,d9b.koulutuksen_jarjestajakoodi as 'Koodit Koulutuksen järjestäjä'
,d10.lahde_koodi
,d11.koulutusohjelma_amk_koodi as 'Koodit Koulutusohjelma'

,d12b.opiskelijan_olo_tamm_koodi as kirjoillaolotammi_koodi
,d17.ensisijainen_opintooikeus_koodi as ensiop


--
,d22b.maakunta_koodi as 'Koodit Koul. järj. maakunta'
,d22b.kunta_koodi as 'Koodit Koul. järj. kunta'
,d22c.maakunta_koodi as 'Koodit Oppil. maakunta'
,d22c.kunta_koodi as 'Koodit Oppil. kunta'
,d23.vuosi as alvv
,d23b.lukukausi as alkk
,d24b.vuosi as alvv_kksek
,d24c.vuosi as alvv_kksek_lasna
,d24d.vuosi as alvv_sek
,d24e.vuosi as alvv_sek_lasna
,d24f.vuosi as alvv_kk
,d24f2.lukukausi as alkk_kk
,d24g.vuosi as alvv_kk_lasna
,d24h.vuosi as alvv_opa
,d24i.vuosi as alvv_opa_lasna
,d24j.vuosi as kirtu1v
,d24k.lukukausi as kirtu1k
,d28.vahintaan_55_op_suorittanut_koodi as op55_koodi
,d37.vuosi as suorv
,d38.lukukausi as suor_lk
,d39.kuukausi as suor_kk






/***  RUOTSI ***/
,[Tilastovuosi] as Statistikår

--,d3.avi_SV as 'Asuinalueen AVISV'
--,d3.ely_SV as 'Asuinalueen ELYSV'
--,d3.kielisuhde_SV as 'Asuinkunnan kielisuhdeSV'
,d3.maakunta_SV as Bostadslandskap
,d3.kunta_SV as Bostadskommun
--,d3b.avi_SV as 'Til.v:tta edeltävä AVISV'
--,d3b.ely_SV as 'Til.v:tta edeltävä ELYSV'
--,d3b.kielisuhde_SV as 'Til.v:tta ed. asuinkunnan kielisuhdeSV'
--,d3b.maakunta_SV as 'Til.v:tta ed. asuinmaakuntaSV'
--,d3b.kunta_SV as 'Til.v:tta ed. asuinkuntaSV'
--,d3c.avi_SV as '2v til.v:tta ed. AVISV'
--,d3c.ely_SV as '2v til.v:tta ed. ELYSV'
--,d3c.kielisuhde_SV as '2v til.v:tta ed. asuinkunnan kielisuhdeSV'
--,d3c.maakunta_SV as '2v til.v:tta ed. asuinmaakuntaSV'
--,d3c.kunta_SV as '2v til.v:tta ed. asuinkuntaSV'

,d5.ika_SV as Ålder
,d5.ika5v_SV as Åldersgrupp
,d5b.vuosiselite_SV as Födelseår
--,d5c.kuukausiselite_SV as SyntymäkuukausiSV
,d6a.tutkinto_amk_SV as 'Examen (yrkehögskola)'
,d6b.tutkinto_yo_SV as 'Examen (universitet)'
,d7.koulutustyyppi_SV as 'Typ av utbildning'
,d8.kansalaisuus_versio2_SV as Medborgarskap
,d8b.kansalaisuus_versio1_SV as 'Medborgarskap (utbildningsstruktur)'
--luodaan yhdistetty kansalaisuus-muuttuja, joka toimii aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d8.kansalaisuus_versio2_koodi = '1' Or d8b.kansalaisuus_versio1_koodi = '1' THEN
'finländare' When d8.kansalaisuus_versio2_koodi = '2' Or d8.kansalaisuus_versio2_koodi = '9' Or d8b.kansalaisuus_versio1_koodi = '2' THEN 'andra'
 Else 'Okänd' End as 'Medborgarskap (finska/andra)'
--
,d9.oppilaitos_SV as Läroanstalt
,d9.oppilaitos_SV as Universitet
,d9.oppilaitos_SV as Yrkeshögskola
--,d9.opetuskieli_SV as OpetuskieliSV
--,d9.oppilaitoksen_omistajatyyppi_SV as 'Oppil. omistajatyyppiSV'
--,d9.oppilaitostyyppi_SV as OppilaitostyyppiSV
--,d9b.koulutuksen_jarjestaja_SV as 'Koulutuksen järjestäjäSV'
--,d9b.koulutuksen_jarjestajan_omistajatyyppi_SV as 'Koul. järj. omistajatyyppiSV'
--,d10.lahde_SV as LähdeSV
,d11.koulutusohjelma_amk_SV as Utbildningsprogram

,d12b.opiskelijan_olo_tamm_SV as 'Inskrivning (januari)'
,d13.rahoituslahde_SV as Finansieringskälla
--,d15.suuntautumisvaihtoehto_amk_SV as SuuntautumisvaihtoehtoSV

--,d17.ensisijainen_opintooikeus_SV as 'Ensisijainen opinto-oikeusSV'
--,d18.tilauskoulutuksen_sijaintimaa_SV as 'Tilauskoulutuksen sijaintimaaSV'



,d21b.koulutuslaji_okm_SV as Utbildningsslag
,d21b.koulutuslaji_okm2_SV as Utbildningsslag2

--
--,d22b.avi_SV as 'Koul. järjestäjän AVISV'
--,d22b.ely_SV as 'Koul. järjestäjän ELYSV'
--,d22b.maakunta_SV as 'Koul. järjestäjän maakuntaSV'
--,d22b.kielisuhde_SV as 'Koul. järj. kunnan kielisuhdeSV'
--,d22b.kunta_SV as 'Koul. järjestäjän kuntaSV'
--,d22c.avi_SV as 'Oppilaitoksen AVISV'
--,d22c.ely_SV as 'Oppilaitoksen ELYSV'
--,d22c.maakunta_SV as 'Oppilaitoksen maakuntaSV'
--,d22c.kielisuhde_SV as 'Oppil. kunnan kielisuhdeSV'
--,d22c.kunta_SV as 'Oppilaitoksen kuntaSV'
--,d23.vuosiselite_SV as 'KirjoihintulovuosiSV'
--,d23b.lukukausiselite_SV as 'KirjoihintulokausiSV'
--,d24b.vuosiselite_SV as 'Kirjoihintulovuosi (kk-sek.)SV'
--,d24c.vuosiselite_SV as 'Kirjoihintulovuosi (kk-sek. läsna)SV'
--,d24d.vuosiselite_SV as 'Kirjoihintulovuosi (sek.)SV'
--,d24e.vuosiselite_SV as 'Kirjoihintulovuosi (sek. läsnä)SV'
--,d24f.vuosiselite_SV as 'Kirjoihintulovuosi (kk)SV'
--,d24f2.lukukausiselite_SV as 'Kirjoihintulokausi (kk)SV'
--,d24g.vuosiselite_SV as 'Kirjoihintulovuosi (kk läsnä)SV'
--,d24h.vuosiselite_SV as 'Kirjoihintulovuosi (op.ala)SV'
--,d24i.vuosiselite_SV as 'Kirjoihintulovuosi (op.ala läsnä)SV'
--,d24j.vuosiselite_SV as 'Kirjoihintulovuosi (tutk.)SV'
--,d24k.lukukausiselite_SV as 'Kirjoihintulokausi (tutk.)SV'
--,d28.vahintaan_55_op_suorittanut_SV as 'Suorittanut väh. 55 opSV'
--,d29.opiskelijan_fte_tieto_SV as 'Opiskelijan FTE-tietoSV'
--,d30.opiskelumuoto_SV as OpiskelumuotoSV
--,d31.yliopisto_SV as YliopistotunnusSV
--,d32.tiedekunta_yo_SV as TiedekuntaSV
--,d33.uusi_vanha_opiskelija_SV as 'Uusi/vanha opiskelijaSV'
--,d35.opettajankelpoisuus_SV as OpettajankelpoisuusSV
--,d36.avoinvayla_SV as 'Hyväksytty avoimen yliop. suoritusten kauttaSV'
,d37.vuosiselite_SV as 'År då utbildningen avlagts'
--,d38.lukukausiselite_SV as 'Tutk. suorituslukukausiSV'
--,d39.kuukausiselite_SV as 'Tutk. suorituskuukausiSV'

,d41.eumaa_SV as 'Medborgare i ett EU-land'
,d42.etamaa_SV as 'Medborgare i ett EES-land'
,d43.pohjoismaa_SV as 'Medborgare i ett nordiskt land'



/*** ENGLANTI ***/
,[Tilastovuosi] as 'Statistical year'


--,d3b.avi_EN as 'Til.v:tta edeltävä AVIEN'
--,d3b.ely_EN as 'Til.v:tta edeltävä ELYEN'
--,d3b.kielisuhde_EN as 'Til.v:tta ed. asuinkunnan kielisuhdeEN'
--,d3b.maakunta_EN as 'Til.v:tta ed. asuinmaakuntaEN'
--,d3b.kunta_EN as 'Til.v:tta ed. asuinkuntaEN'
--,d3c.avi_EN as '2v til.v:tta ed. AVIEN'
--,d3c.ely_EN as '2v til.v:tta ed. ELYEN'
--,d3c.kielisuhde_EN as '2v til.v:tta ed. asuinkunnan kielisuhdeEN'
--,d3c.maakunta_EN as '2v til.v:tta ed. asuinmaakuntaEN'
--,d3c.kunta_EN as '2v til.v:tta ed. asuinkuntaEN'

,d5.ika_EN as Age
,d5.ika5v_EN as Agegroup
,d5b.vuosiselite_EN as 'Year of birth'
--,d5c.kuukausiselite_EN as SyntymäkuukausiEN
,d6a.tutkinto_amk_EN as 'Degree (polytechnic)'
,d6b.tutkinto_yo_EN as 'Degree (university)'
,d7.koulutustyyppi_EN as 'Type of education'
,d8.kansalaisuus_versio2_EN as Nationality
,d8b.kansalaisuus_versio1_EN as 'Nationality (ed. structure)'
--luodaan yhdistetty kansalaisuus-muuttuja, joka toimii aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d8.kansalaisuus_versio2_koodi = '1' Or d8b.kansalaisuus_versio1_koodi = '1' THEN
'Finn' When d8.kansalaisuus_versio2_koodi = '2' Or d8.kansalaisuus_versio2_koodi = '9' Or d8b.kansalaisuus_versio1_koodi = '2' THEN 'Other'
 Else 'Unknown' End as 'Nationality (Finn/Other)'
--
,d9.oppilaitos_EN as 'Educational institution'
,d9.oppilaitos_EN as University
,d9.oppilaitos_EN as Polytechnic
--,d9.opetuskieli_EN as OpetuskieliEN
--,d9.oppilaitoksen_omistajatyyppi_EN as 'Oppil. omistajatyyppiEN'
--,d9.oppilaitostyyppi_EN as OppilaitostyyppiEN
--,d9b.koulutuksen_jarjestaja_EN as 'Koulutuksen järjestäjäEN'
--,d9b.koulutuksen_jarjestajan_omistajatyyppi_EN as 'Koul. järj. omistajatyyppiEN'
--,d10.lahde_EN as LähdeEN
,d11.koulutusohjelma_amk_EN as 'Degree programme'

,d12b.opiskelijan_olo_tamm_EN as 'Enrollment status (jan.)'
,d13.rahoituslahde_EN as 'Source of funding'
--,d15.suuntautumisvaihtoehto_amk_EN as SuuntautumisvaihtoehtoEN

--,d17.ensisijainen_opintooikeus_EN as 'Ensisijainen opinto-oikeusEN'
--,d18.tilauskoulutuksen_sijaintimaa_EN as 'Tilauskoulutuksen sijaintimaaEN'



,d21b.koulutuslaji_okm_EN as 'Form of education'
,d21b.koulutuslaji_okm2_EN as 'Form of education2'
--,d22.avi_EN as 'Koulutuksen AVIEN'

--
--,d22b.avi_EN as 'Koul. järjestäjän AVIEN'
--,d22b.ely_EN as 'Koul. järjestäjän ELYEN'
--,d22b.maakunta_EN as 'Koul. järjestäjän maakuntaEN'
--,d22b.kielisuhde_EN as 'Koul. järj. kunnan kielisuhdeEN'
--,d22b.kunta_EN as 'Koul. järjestäjän kuntaEN'
--,d22c.avi_EN as 'Oppilaitoksen AVIEN'
--,d22c.ely_EN as 'Oppilaitoksen ELYEN'
--,d22c.maakunta_EN as 'Oppilaitoksen maakuntaEN'
--,d22c.kielisuhde_EN as 'Oppil. kunnan kielisuhdeEN'
--,d22c.kunta_EN as 'Oppilaitoksen kuntaEN'
,d23.vuosiselite_EN as 'Year of enrollment'
,d23b.lukukausiselite_EN as 'Term of enrollment'
,d24b.vuosiselite_EN as 'Year of enrollment (HE sec.)'
,d24c.vuosiselite_EN as 'Year of enrollment (HE sec. present)'
,d24d.vuosiselite_EN as 'Year of enrollment (sec.)'
,d24e.vuosiselite_EN as 'Year of enrollment (sec. present)'
,d24f.vuosiselite_EN as 'Year of enrollment (ed. inst.)'
,d24f2.lukukausiselite_EN as 'Term of enrollment (ed. inst.)'
,d24g.vuosiselite_EN as 'Year of enrollment (ed. inst. present)'
,d24h.vuosiselite_EN as 'Year of enrollment (subfield of ed.)'
,d24i.vuosiselite_EN as 'Year of enrollment (subfield of ed. present)'
,d24j.vuosiselite_EN as 'Year of enrollment (degree)'
,d24k.lukukausiselite_EN as 'Term of enrollment (degree)'
--,d28.vahintaan_55_op_suorittanut_EN as 'Suorittanut väh. 55 opEN'
--,d29.opiskelijan_fte_tieto_EN as 'Opiskelijan FTE-tietoEN'
--,d30.opiskelumuoto_EN as OpiskelumuotoEN
--,d31.yliopisto_EN as YliopistotunnusEN
--,d32.tiedekunta_yo_EN as TiedekuntaEN
--,d33.uusi_vanha_opiskelija_EN as 'Uusi/vanha opiskelijaEN'
--,d35.opettajankelpoisuus_EN as OpettajankelpoisuusEN
--,d36.avoinvayla_EN as 'Hyväksytty avoimen yliop. suoritusten kauttaEN'
,d37.vuosiselite_EN as 'Year of graduation'
,d38.lukukausiselite_EN as 'Term of graduation'
,d39.kuukausiselite_EN as 'Month of graduation'

,d41.eumaa_EN as 'Citizen of EU nation'
,d42.etamaa_EN as 'Citizen of EEA nation'
,d43.pohjoismaa_EN as 'Citizen of a nordic nation'
--isced
,d21.iscle2011 as 'Koulutusaste, taso 1'
,d21.Koulutusaste_taso2 as 'Koulutusaste, taso 2'
,d21.iscfibroad2013 as 'Koulutusala, taso 1'
,d21.iscfinarrow2013 as 'Koulutusala, taso 2'
,d21.iscfi2013 as 'Koulutusala, taso 3'
,d21.OKM_ohjauksen_ala as 'OKM ohjauksen ala, korkeak.'
,d21.iscle2011_SV as 'Utbildn.nivå, nivå 1'
,d21.Koulutusaste_taso2_SV as 'Utbildn.nivå, nivå 2'
,d21.iscfibroad2013_SV as 'Utbildn.område, nivå 1'
,d21.iscfinarrow2013_SV as 'Utbildn.område, nivå 2'
,d21.iscfi2013_SV as 'Utbildn.område, nivå 3'
,d21.OKM_ohjauksen_ala_SV as 'UKM-styrningsområde, högskolor'
,d21.iscle2011_EN as 'Level of ed., tier 1'
,d21.Koulutusaste_taso2_EN as 'Level of ed., tier 2'
,d21.iscfibroad2013_EN as 'Field of education, tier 1'
,d21.iscfinarrow2013_EN as 'Field of education, tier 2'
,d21.iscfi2013_EN as 'Field of education, tier 3'
,d21.OKM_ohjauksen_ala_EN as 'Field of ed., HE steering'
,d21.jarjestys_iscle2011 as jarj_isced_koulast1
,d21.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
,d21.jarjestys_iscfibroad2013 as jarj_isced_koulala1
,d21.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
,d21.jarjestys_iscfi2013 as jarj_isced_koulala3
,d21.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1
,d21.iscle2011_koodi as 'Koodit Koulutusaste, taso 1'
,d21.Koulutusaste_taso2_koodi as 'Koodit Koulutusaste, taso 2'
,d21.iscfibroad2013_koodi as 'Koodit Koulutusala, taso 1'
,d21.iscfinarrow2013_koodi as 'Koodit Koulutusala, taso 2'
,d21.iscfi2013_koodi as 'Koodit Koulutusala, taso 3'
,d21.OKM_ohjauksen_ala_koodi as 'Koodit OKM ohjauksen ala, korkeak.'



/*** Lukumäärämuuttujat ***/
,[Opisk2]
,[Aloit2]
,[lkm_op55] = CAST((case when d28.vahintaan_55_op_suorittanut_koodi = 1 then [Opisk2] end) as int)
,[lkm_op0]
,[lkm_op1_14]
,[lkm_op15_29]
,[lkm_op30_44]
,[lkm_op45_59]
,[lkm_op60_74]
,[lkm_op75_89]
,[lkm_op90_104]
,[lkm_op105_119]
,[lkm_op120_]
,[aloittaneet_kirjoihintulovuosi]
,[aloittaneet_korkeakoulusektori]
,[aloittaneet_korkeakoulusektori_lasnaoleva]
,[aloittaneet_sektori]
,[aloittaneet_sektori_lasnaoleva]
,[aloittaneet_korkeakoulu]
,[aloittaneet_korkeakoulu_lasnaoleva]
,[aloittaneet_opintoala]
,[aloittaneet_opintoala_lasnaoleva]
,[opiskelijat_lasna]
,[opiskelijat_fte]
,[lkm_lasnalk]
,[lkm_poissalk]
,[op_suoritettavien_laajuus]
,[op_edellinen_syksy]
,[op_edellinen_kevat]
,[op_kertyma_edel_lkv_loppu]
,[Tutk2]
,[op_amk_yhteensa]
,[op_amk_yleissiv_amm_opplait]
,[op_amk_muualla]
,[op_amk_oma_amk]
,[op_amk_muu_amk]
,[op_amk_yliopistoissa]
,[op_amk_ulkomailla]
,[op_yo_yhteensa]
,[op_yo_ulkomailla]
,[op_yo_muualla]
,[op_yo_oma_yo]
,[op_yo_avoimessa]
,[op_yo_muu_yo]
,[op_yo_ammattikorkeakouluissa]
,[ika19_21_lkm]
,[ika20_24_lkm]
,[ika25_34_lkm]
,[ika25_64_lkm]


*/

FROM (

/* K2.17 */
SELECT 

/* kaikille yhteiset dimensiot */
	   [tilastovuosi]
	  ,'K2.17' AS Aineisto
      ,[sukupuoli_id]
      ,[kotikunta_id]

	  ,CASE 
			WHEN tilastovuosi between 2009 AND 2012 AND koulutussektori_id = 3 THEN -1
			WHEN koulutussektori_id <> 3 THEN 1
			ELSE [opetushallinnon_koulutus_id]
	   END AS [opetushallinnon_koulutus_id]
	  ,hallinnonala2_id
      ,[opiskelijan_olo_id]
      ,[koulutusala_taso2_id] as koulutusluokitus_id
      ,[koulutuksen_opetuskieli_id]
      ,[koulutuksen_sijaintikunta_id]
      ,[ika_id]
	  ,ikaryhma1_id

      ,[aidinkieli_versio1_id]
	  ,tutkinnon_aloittamisvuosi
	  ,jarjestys_tutkinnon_aloittamisvuosi
      ,[koulutussektori_id]
      ,[koulutusryhma_id]

/* osittain yhteiset dimensiot */
      ,[aineisto_id]
      ,[tutkinnon_toteuma_id] 
      ,[koulutuksen_jarjestamismuoto_id]
	  ,ikaryhma2_id
	  ,-1 as asuinmaakunta_id

/* K2.17 dimensiot */

      ,[asuinkunta_sama_vai_eri_kuin_aiemmin_id]	
      ,[edeltavan_vuoden_asuinpaikka_id]	 
      ,[suomeen_muuttamisvuosi]	  
      ,[aidinkieli_versio4_id]	
      ,[kansalaisuus_id]	 
      ,[syntymamaa_id]	 
      ,[aidin_syntymamaa_id]	 
      ,[isan_syntymamaa_id]	 
      ,[henkilotunnuksen_oikeellisuus_id]	
      ,[maassaolo_id] 
      ,[suoritusaika] 
	  ,[jarjestys_suoritusaika]
      ,[aidinkieli_versio2_id]
      ,[maahantulo_ja_toisen_asteen_koul_aloittaminen_id]
      ,[maahantulo_ja_korkeakoulutuksen_aloittaminen_id]
	  ,jarjestys_syntymavuosi
      ,[jarjestys_suomeen_muuttamisvuosi]

/*** yhteiset mittarit ***/

      ,NULL AS [aloittaneet]
      ,NULL AS [opiskelijat]
      ,NULL AS [tutkinnot]

/*** K2.17 mittarit ***/
	  ,aloittaneet AS aloittaneet2_17
	  ,opiskelijat AS opiskelijat2_17
	  ,tutkinnot AS tutkinnot2_17

      ,[aloittaneet_ulkomaalaistausta_kielen_mukaan]
      ,[opiskelijat_ulkomaalaistausta_kielen_mukaan]

      ,[tutkinnot_ulkomaalaistausta_kielen_mukaan]
      ,[aloittaneet_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,[opiskelijat_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]

      ,[tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,[aloittaneet_ulkomaalaiset]
      ,[opiskelijat_ulkomaalaiset]

      ,[tutkinnot_ulkomaalaiset]
      ,[aloittaneet_ulkomailla_syntyneet]
      ,[opiskelijat_ulkomailla_syntyneet]

      ,[tutkinnot_ulkomailla_syntyneet]

  FROM [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]

UNION ALL

/* 2.3 */

SELECT

/* kaikille yhteiset dimensiot */
	   [tilv] AS Tilastovuosi
	  ,'2.3' AS Aineisto
      ,[sukupuoli_id]
      ,'-1' AS [kotikunta_id] --      ,[asuinmaakunta_id] 2.3

	  ,CASE 
			WHEN tilv between 2009 AND 2012 AND koulutussektori_id = 3 THEN -1
			WHEN tilv between 2009 AND 2012 AND koulutussektori_id <> 3 THEN 1
			ELSE [opetushallinnon_koulutus_id]
	   END AS [opetushallinnon_koulutus_id]


	  ,hallinnonala2_id
      ,[opiskelijan_olo_syys_id]
      ,[koulutusluokitus_id]
      ,[koulutuksen_kieli_id]
      ,[yht_koulutuksen_kunta_id]
      ,[ika_id]
	  ,ika_id as ikaryhma1_id

      ,[aidinkieli_versio1_id]
      ,[kirjoihintulovuosi]
	  ,jarjestys_kirjoihintulovuosi
      ,[koulutussektori_id]
      ,[koulutusryhma_id]

/* osittain yhteiset dimensiot */
      ,[aineisto_id]
      ,'-1' AS [tutkinnon_toteuma_id] 
      ,'-1' AS [koulutuksen_jarjestamismuoto_id]
	  ,-1 AS ikaryhma2_id
	  ,asuinmaakunta_id

/* K2.17 dimensiot */

      ,'-1' AS [asuinkunta_sama_vai_eri_kuin_aiemmin_id]	
      ,'-1' AS [edeltavan_vuoden_asuinpaikka_id]	 
      ,'Tuntematon' AS [suomeen_muuttamisvuosi]
      ,'-1' AS [aidinkieli_versio4_id]	
      ,'-1' AS [kansalaisuus_id]	 
      ,'-1' AS [syntymamaa_id]	 
      ,'-1' AS [aidin_syntymamaa_id]	 
      ,'-1' AS [isan_syntymamaa_id]	 
      ,'-1' AS [henkilotunnuksen_oikeellisuus_id]	
      ,'-1' AS [maassaolo_id] 
      ,'Tuntematon' AS [suoritusaika] 
      ,9999 AS [jarjestys_suoritusaika] 
      ,'-1' AS [aidinkieli_versio2_id]
      ,'-1' AS [maahantulo_ja_toisen_asteen_koul_aloittaminen_id]
      ,'-1' AS [maahantulo_ja_korkeakoulutuksen_aloittaminen_id]
	  ,9999 AS jarjestys_syntymavuosi
      ,9999 AS [jarjestys_suomeen_muuttamisvuosi]

/*** yhteiset mittarit ***/

      ,[aloittaneet]
      ,[opiskelijat]
      ,NULL AS [tutkinnot]

/*** K2.17 mittarit ***/
	  ,NULL AS aloittaneet2_17
	  ,NULL AS opiskelijat2_17
	  ,NULL AS tutkinnot2_17
      ,NULL AS [aloittaneet_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [opiskelijat_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [tutkinnot_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [aloittaneet_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [opiskelijat_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [aloittaneet_ulkomaalaiset]
      ,NULL AS [opiskelijat_ulkomaalaiset]
      ,NULL AS [tutkinnot_ulkomaalaiset]
      ,NULL AS [aloittaneet_ulkomailla_syntyneet]
      ,NULL AS [opiskelijat_ulkomailla_syntyneet]
      ,NULL AS [tutkinnot_ulkomailla_syntyneet]

/* 2.3
SELECT 

	   [tilv]

      ,[oppilaitos]
      ,[oppilaitos_id]
      ,[oppilaitos_historia_id]
      ,[koulutuksen_jarjestaja]
      ,[koulutuksen_jarjestaja_id]
      ,[koulutuksen_jarjestaja_historia_id]
      ,[oppisopimuskoulutuksen_jarjestaja]
      ,[oppisopimuskoulutuksen_jarjestaja_id]
      ,[oppisopimuskoulutuksen_jarjestaja_historia_id]
      ,[koulutusluokitus]
      ,[koulutusluokitus_id]
      ,[koulutusluokitus_historia_id]
      ,[koulutuksen_kieli]
      ,[koulutuksen_kieli_id]
      ,[koulutuksen_kunta]
      ,[koulutuksen_kunta_id]
      ,[koulutuksen_kunta_historia_id]
      ,[opetushallinnon_koulutus]
      ,[opetushallinnon_koulutus_id]

      ,[aidinkieli_versio1]
      ,[aidinkieli_versio1_id]
      ,[kirjoihintulovuosi]
      ,[kirjoihintulovuosi_id]
      ,[kirjoihintulokausi]
      ,[kirjoihintulokausi_id]
      ,[opiskelijan_olo_tamm]
      ,[opiskelijan_olo_tamm_id]
      ,[opiskelijan_olo_syys]
      ,[opiskelijan_olo_syys_id]
      ,[aikuisopiskelija]
      ,[aikuisopiskelija_id]
      ,[ika_5v]
      ,[ika_id]
      ,[lukumaara]
      ,[lukiokoulutuksen_koulutuslaji]
      ,[lukiokoulutuksen_koulutuslaji_id]
      ,[nuorten_aikuisten_koulutus]
      ,[nuorten_aikuisten_koulutus_id]
      ,[koulutuksen_tutkinnon_aloitusvuosi]
      ,[koulutuksen_tutkinnon_aloitusvuosi_id]
      ,[koulutuksen_tutkinnon_aloituskausi]
      ,[koulutuksen_tutkinnon_aloituskausi_id]
      ,[ammatillisen_koulutuksen_koulutuslaji]
      ,[ammatillisen_koulutuksen_koulutuslaji_id]
      ,[tutkintonimike_ammpk]
      ,[tutkintonimike_ammpk_id]
      ,[koulutusohjelma_ammpk]
      ,[koulutusohjelma_ammpk_id]
      ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
      ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id]
      ,[tyovoimapoliittinen_koulutus]
      ,[tyovoimapoliittinen_koulutus_id]
      ,[rahoituslahde_amm]
      ,[rahoituslahde_amm_id]
      ,[alkamispaivamaara]
      ,[alkamispaivamaara_id]
      ,[paattymispaivamaara]
      ,[paattymispaivamaara_id]
      ,[tutkinnon_tavoite]
      ,[tutkinnon_tavoite_id]
      ,[yrittajan_oppisopimuskoulutus]
      ,[yrittajan_oppisopimuskoulutus_id]
      ,[oppisopimus_purkautunut]
      ,[oppisopimus_purkautunut_id]
      ,[todistus_oppisopimuskoulutuksen_suorittamisesta]
      ,[todistus_oppisopimuskoulutuksen_suorittamisesta_id]
      ,[toimiala_2008]
      ,[toimiala_2008_id]
      ,[oppisopimus_yrityksen_koko]
      ,[oppisopimus_yrityksen_koko_id]
      ,[tyonantajasektori]
      ,[tyonantajasektori_id]
      ,[asuinmaakunta]
      ,[asuinmaakunta_id]
      ,[asuinmaakunta_historia_id]
      ,[tietolahde]
      ,[rivinumero]
      ,[aineistotunnus]
      ,[koulutussektori]
      ,[koulutussektori_id]
      ,[hallinnonala]
      ,[hallinnonala_id]
      ,[koulutuksen_jarjestamismuoto]
      ,[koulutuksen_jarjestamismuoto_id]
      ,[ammatillinen_peruskoulutus_lisakoulutus]
      ,[ammatillinen_peruskoulutus_lisakoulutus_id]
      ,[koulutuksen_tavoite_toteuma]
      ,[koulutuksen_tavoite_toteuma_id]
      ,[tyovoimapoliittinen]
      ,[tyovoimapoliittinen_id]
      ,[aloittaneet]
      ,[opiskelijat]
      ,[opiskelijat_lasna]
      ,[aineisto_id]
      ,[aineisto_OTV_id]
      ,[koulutuksen_jarjestaja_kunta_id]
      ,[koulutuksen_jarjestaja_kunta_historia_id]
      ,[oppilaitos_kunta_id]
      ,[oppilaitos_kunta_historia_id]
      ,[nuorten_aikuisten_koulutus_amm_id]
      ,[koulutuslaji_OKM_id]
      ,[yht_koulutuksen_jarjestaja_id]
      ,[yht_koulutuksen_jarjestaja_historia_id]
      ,[yht_oppilaitos_id]
      ,[yht_oppilaitos_historia_id]
      ,[yht_koulutuksen_jarjestaja_kunta_id]
      ,[yht_koulutuksen_jarjestaja_kunta_historia_id]
      ,[yht_oppilaitos_kunta_id]
      ,[yht_oppilaitos_kunta_historia_id]
      ,[yht_koulutuksen_kunta_id]
      ,[yht_koulutuksen_kunta_historia_id]

*/

   FROM [VipunenTK].[dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]

UNION ALL

/* 2.4 */

SELECT

/* kaikille yhteiset dimensiot */
	   [tilastointivuosi] AS Tilastovuosi
	  ,'2.4' AS Aineisto
      ,[sukupuoli_id]
      ,'-1' AS [kotikunta_id] --      ,[asuinmaakunta_id] 2.3

	  ,CASE 
			WHEN tilastointivuosi between 2009 AND 2012 AND koulutussektori_id = 3 THEN -1
			WHEN tilastointivuosi between 2009 AND 2012 AND koulutussektori_id <> 3 THEN 1
			ELSE [opetushallinnon_koulutus_id]
	   END AS [opetushallinnon_koulutus_id]
	  ,hallinnonala2_id
      ,'-1' AS [opiskelijan_olo_syys_id]
      ,[koulutusluokitus_id]
      ,[koulutuksen_kieli_id]
      ,[yht_koulutuksen_kunta_id]
      ,[ika_id]
	  ,ika_id as ikaryhma1_id
      ,[aidinkieli_versio1_id]
      ,[kirjoihintulovuosi]
	  ,jarjestys_kirjoihintulovuosi
      ,[koulutussektori_id]
      ,[koulutusryhma_id]	 

/* osittain yhteiset dimensiot */
      ,[aineisto_id]
      ,[tutkinnon_toteuma_id] 
      ,[koulutuksen_jarjestamismuoto_id]
	  ,-1 AS ikaryhma2_id
	  ,-1 AS asuinmaakunta_id

/* K2.17 dimensiot */

      ,'-1' AS [asuinkunta_sama_vai_eri_kuin_aiemmin_id]	
      ,'-1' AS [edeltavan_vuoden_asuinpaikka_id]	 
      ,'Tuntematon' AS [suomeen_muuttamisvuosi]	  
      ,'-1' AS [aidinkieli_versio4_id]	
      ,'-1' AS [kansalaisuus_id]	 
      ,'-1' AS [syntymamaa_id]	 
      ,'-1' AS [aidin_syntymamaa_id]	 
      ,'-1' AS [isan_syntymamaa_id]	 
      ,'-1' AS [henkilotunnuksen_oikeellisuus_id]	
      ,'-1' AS [maassaolo_id] 
      ,'Tuntematon' AS [suoritusaika] 
      ,9999 AS [jarjestys_suoritusaika] 
      ,'-1' AS [aidinkieli_versio2_id]
      ,'-1' AS [maahantulo_ja_toisen_asteen_koul_aloittaminen_id]
      ,'-1' AS [maahantulo_ja_korkeakoulutuksen_aloittaminen_id]
	  ,9999 AS jarjestys_syntymavuosi
      ,9999 AS [jarjestys_suomeen_muuttamisvuosi]

/*** yhteiset mittarit ***/

      ,NULL AS [aloittaneet]
      ,NULL AS [opiskelijat]
      ,[tutkinnot]

/*** K2.17 mittarit ***/
	  ,NULL AS aloittaneet2_17
	  ,NULL AS opiskelijat2_17
	  ,NULL AS tutkinnot2_17
      ,NULL AS [aloittaneet_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [opiskelijat_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [tutkinnot_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [aloittaneet_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [opiskelijat_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [aloittaneet_ulkomaalaiset]
      ,NULL AS [opiskelijat_ulkomaalaiset]
      ,NULL AS [tutkinnot_ulkomaalaiset]
      ,NULL AS [aloittaneet_ulkomailla_syntyneet]
      ,NULL AS [opiskelijat_ulkomailla_syntyneet]
      ,NULL AS [tutkinnot_ulkomailla_syntyneet]


   FROM [VipunenTK].[dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot]

UNION ALL

/* 2.8 */

SELECT 

/* kaikille yhteiset dimensiot */
	   [tilastointivuosi] AS Tilastovuosi
	  ,'2.8' AS Aineisto
      ,[sukupuoli_id]
      ,[kotikunta_id] --      ,[asuinmaakunta_id] 2.3
      ,[opetushallinnon_koulutus_id]
	  ,'-1' AS hallinnonala2_id
      ,[opiskelijan_olo_syys_id]
      ,[koulutusluokitus_id]
      ,[koulutuksen_kieli_id]
      ,[koulutuksen_kunta_id]
      ,[ika_id]
	  ,ikaryhma1_id
      ,[aidinkieli_versio1_id]
      ,[kirjoihintulovuosi]
	  ,jarjestys_kirjoihintulovuosi
      ,[koulutussektori_id]
      ,[koulutusryhma_id]	

/* osittain yhteiset dimensiot */
      ,[aineisto_id]
      ,'-1' AS [tutkinnon_toteuma_id] 
      ,'-1' AS [koulutuksen_jarjestamismuoto_id]
	  ,ikaryhma2_id
	  ,-1 AS asuinmaakunta_id

/* K2.17 dimensiot */

      ,'-1' AS [asuinkunta_sama_vai_eri_kuin_aiemmin_id]	
      ,'-1' AS [edeltavan_vuoden_asuinpaikka_id]	 
      ,'Tuntematon' AS [suomeen_muuttamisvuosi]	  
      ,'-1' AS [aidinkieli_versio4_id]	
      ,'-1' AS [kansalaisuus_id]	 
      ,'-1' AS [syntymamaa_id]	 
      ,'-1' AS [aidin_syntymamaa_id]	 
      ,'-1' AS [isan_syntymamaa_id]	 
      ,'-1' AS [henkilotunnuksen_oikeellisuus_id]	
      ,'-1' AS [maassaolo_id] 
      ,'Tuntematon' AS [suoritusaika] 
      ,9999 AS [jarjestys_suoritusaika] 
      ,'-1' AS [aidinkieli_versio2_id]
      ,'-1' AS [maahantulo_ja_toisen_asteen_koul_aloittaminen_id]
      ,'-1' AS [maahantulo_ja_korkeakoulutuksen_aloittaminen_id]
	  ,9999 AS jarjestys_syntymavuosi
      ,9999 AS [jarjestys_suomeen_muuttamisvuosi]

/*** yhteiset mittarit ***/

      ,[aloittaneet]
      ,[opiskelijat]
      ,NULL AS [tutkinnot]

/*** K2.17 mittarit ***/
	  ,NULL AS aloittaneet2_17
	  ,NULL AS opiskelijat2_17
	  ,NULL AS tutkinnot2_17
      ,NULL AS [aloittaneet_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [opiskelijat_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [tutkinnot_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [aloittaneet_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [opiskelijat_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [aloittaneet_ulkomaalaiset]
      ,NULL AS [opiskelijat_ulkomaalaiset]
      ,NULL AS [tutkinnot_ulkomaalaiset]
      ,NULL AS [aloittaneet_ulkomailla_syntyneet]
      ,NULL AS [opiskelijat_ulkomailla_syntyneet]
      ,NULL AS [tutkinnot_ulkomailla_syntyneet]

  FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]

UNION ALL

/* 2.9 */

SELECT 

/* kaikille yhteiset dimensiot */
	   [tilastointivuosi] AS Tilastovuosi
	  ,'2.9' AS Aineisto
      ,[sukupuoli_id]
      , [kotikunta_id] --      ,[asuinmaakunta_id] 2.3
      ,[opetushallinnon_koulutus_id]
	  ,'-1' AS hallinnonala2_id
      ,'-1' AS [opiskelijan_olo_syys_id]
      ,[koulutusluokitus_id]
      ,[koulutuksen_kieli_id]
      ,[koulutuksen_kunta_id]
      ,[ika_id]
	  ,ikaryhma1_id
      ,[aidinkieli_versio1_id]
      ,[kirjoihintulovuosi]
	  ,jarjestys_kirjoihintulovuosi
      ,[koulutussektori_id]
      ,[koulutusryhma_id]	 

/* osittain yhteiset dimensiot */
      ,[aineisto_id]
      ,'-1' AS [tutkinnon_toteuma_id] 
      ,'-1' AS [koulutuksen_jarjestamismuoto_id]
	  ,ikaryhma2_id
	  ,-1 AS asuinmaakunta_id

/* K2.17 dimensiot */

      ,'-1' AS [asuinkunta_sama_vai_eri_kuin_aiemmin_id]	
      ,'-1' AS [edeltavan_vuoden_asuinpaikka_id]	 
      ,'Tuntematon' AS [suomeen_muuttamisvuosi]	  
      ,'-1' AS [aidinkieli_versio4_id]	
      ,'-1' AS [kansalaisuus_id]	 
      ,'-1' AS [syntymamaa_id]	 
      ,'-1' AS [aidin_syntymamaa_id]	 
      ,'-1' AS [isan_syntymamaa_id]	 
      ,'-1' AS [henkilotunnuksen_oikeellisuus_id]	
      ,'-1' AS [maassaolo_id] 
      ,'Tuntematon' AS [suoritusaika] 
      ,9999 AS [jarjestys_suoritusaika] 
      ,'-1' AS [aidinkieli_versio2_id]
      ,'-1' AS [maahantulo_ja_toisen_asteen_koul_aloittaminen_id]
      ,'-1' AS [maahantulo_ja_korkeakoulutuksen_aloittaminen_id]
	  ,9999 AS jarjestys_syntymavuosi
      ,9999 AS [jarjestys_suomeen_muuttamisvuosi]

/*** yhteiset mittarit ***/

      ,NULL AS [aloittaneet]
      ,NULL AS [opiskelijat]
      ,[tutkinnot]

/*** K2.17 mittarit ***/
	  ,NULL AS aloittaneet2_17
	  ,NULL AS opiskelijat2_17
	  ,NULL AS tutkinnot2_17
      ,NULL AS [aloittaneet_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [opiskelijat_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [tutkinnot_ulkomaalaistausta_kielen_mukaan]
      ,NULL AS [aloittaneet_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [opiskelijat_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,NULL AS [aloittaneet_ulkomaalaiset]
      ,NULL AS [opiskelijat_ulkomaalaiset]
      ,NULL AS [tutkinnot_ulkomaalaiset]
      ,NULL AS [aloittaneet_ulkomailla_syntyneet]
      ,NULL AS [opiskelijat_ulkomailla_syntyneet]
      ,NULL AS [tutkinnot_ulkomailla_syntyneet]


   FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot]

  ) f

	LEFT JOIN [dbo].d_sukupuoli d4 ON d4.id = f.sukupuoli_id
	LEFT JOIN [dbo].d_alueluokitus d3 ON d3.id = f.kotikunta_id
	LEFT JOIN [dbo].d_alueluokitus d3b ON d3b.id = f.asuinmaakunta_id
	LEFT JOIN [dbo].d_opetushallinnon_koulutus d20 ON d20.id = f.opetushallinnon_koulutus_id
	LEFT JOIN [dbo].d_hallinnonala2 d20b ON d20b.id = f.hallinnonala2_id
	LEFT JOIN [dbo].d_koulutusluokitus d21 ON d21.id = f.koulutusluokitus_id
	LEFT JOIN [dbo].d_kieli d16 ON d16.id = f.koulutuksen_opetuskieli_id
	LEFT JOIN [dbo].d_alueluokitus d22 ON d22.id = f.koulutuksen_sijaintikunta_id
	LEFT JOIN [dbo].d_opiskelijan_olo d12 ON d12.id = f.opiskelijan_olo_id
	LEFT JOIN [dbo].d_aineisto d1 ON d1.id = f.aineisto_id
	LEFT JOIN [dbo].d_koulutussektori d19 ON d19.id = f.koulutussektori_id
	LEFT JOIN [dbo].d_ika d5 ON d5.id = f.ika_id
	LEFT JOIN [dbo].d_ika d5b ON d5b.id = f.ikaryhma1_id
	LEFT JOIN [dbo].d_ika d5c ON d5c.id = f.ikaryhma2_id
	LEFT JOIN [dbo].d_aidinkieli_versio1 d2 ON d2.id = f.aidinkieli_versio1_id
	LEFT JOIN [dbo].d_asuinkunta_sama_vai_eri_kuin_aiemmin d50 ON d50.id = f.asuinkunta_sama_vai_eri_kuin_aiemmin_id
	LEFT JOIN [dbo].d_edeltavan_vuoden_asuinpaikka d51 ON d51.id = f.edeltavan_vuoden_asuinpaikka_id
	LEFT JOIN [dbo].d_kieli d52 ON d52.id = f.aidinkieli_versio4_id
	LEFT JOIN [dbo].d_valtio d53 ON d53.id = f.kansalaisuus_id
	LEFT JOIN [dbo].d_valtio d53b ON d53b.id = f.syntymamaa_id
	LEFT JOIN [dbo].d_valtio d53c ON d53c.id = f.aidin_syntymamaa_id
	LEFT JOIN [dbo].d_valtio d53d ON d53d.id = f.isan_syntymamaa_id
	LEFT JOIN [dbo].d_hetu_ok d54 ON d54.id = f.henkilotunnuksen_oikeellisuus_id
	LEFT JOIN [dbo].d_koulutusryhma d55 ON d55.id = f.koulutusryhma_id
	LEFT JOIN [dbo].d_maassaolo d56 ON d56.id = f.maassaolo_id
	LEFT JOIN [dbo].d_tutkinnon_toteuma d57 ON d57.id = f.tutkinnon_toteuma_id
	LEFT JOIN [dbo].d_maahantulo_ja_opiskelun_aloittaminen d58 ON d58.id = f.maahantulo_ja_toisen_asteen_koul_aloittaminen_id
	LEFT JOIN [dbo].d_maahantulo_ja_opiskelun_aloittaminen d59 ON d59.id = f.maahantulo_ja_korkeakoulutuksen_aloittaminen_id
	LEFT JOIN [dbo].d_koulutuksen_jarjestamismuoto d60 ON d60.id = f.[koulutuksen_jarjestamismuoto_id]


WHERE tilastovuosi > 2009
AND d1.aineisto_koodi in ('L','-1') -- lisätään ennakot myöhemmin
AND d57.tutkinnon_toteuma_koodi in ('1', '-1') -- koko tutkinnot, tuntemattomat

AND NOT (d5c.ika_avain in ('-1','ikaryh2_12', 'ikaryh2_15', 'ikaryh2_18') AND d19.koulutussektori_koodi IN ('4', '5') )-- rajataan korkeakoulupuolelta nuoremmat ikäryhmä2:t pois pois, koska muuttujaa käytetään vain korkeakouluraportoinnissa

AND NOT (d21.koulutusala2002_koodi = 9 AND d19.koulutussektori_koodi IN ('4', '5'))     -- rajataan muu koulutus pois kk-puolelta



  /*

 

	INNER JOIN [dbo].d_aineisto_OTV d1b ON d1b.id = f.aineisto_OTV_id


	INNER JOIN [dbo].d_alueluokitus d3b ON d3b.id = f.kotikunta1x_id



	INNER JOIN [dbo].d_alueluokitus d3c ON d3c.id = f.kotikunta2x_id


	INNER JOIN [dbo].d_kausi d5b ON d5b.kausi_id = f.syntymavuosi_id
	INNER JOIN [dbo].d_kausi d5c ON d5c.kausi_id = f.syntymakuukausi_id
	INNER JOIN [dbo].d_tutkinto_amk d6a ON d6a.id = f.tutkinto_amk_id
	INNER JOIN [dbo].d_tutkinto_yo d6b ON d6b.id = f.tutkinto_yo_id
	INNER JOIN [dbo].d_koulutustyyppi d7 ON d7.id = f.koulutustyyppi_id
	INNER JOIN [dbo].d_kansalaisuus_versio2 d8 ON d8.id = f.kansalaisuus_versio2_id
	INNER JOIN [dbo].d_kansalaisuus_versio1 d8b ON d8b.id = f.kansalaisuus_versio1_id
	INNER JOIN [dbo].d_oppilaitoksen_taustatiedot d9 ON d9.id = f.oppilaitos_id
	INNER JOIN [dbo].d_oppilaitoksen_taustatiedot d9b ON d9b.id = f.koulutuksen_jarjestaja_id
	INNER JOIN [dbo].d_lahde d10 ON d10.id = f.lahde_id
	INNER JOIN [dbo].d_koulutusohjelma_amk d11 ON d11.id = f.koulutusohjelma_amk_id

	INNER JOIN [dbo].d_opiskelijan_olo_tamm d12b ON d12b.id = f.opiskelijan_olo_tamm_id
	INNER JOIN [dbo].d_rahoituslahde d13 ON d13.id = f.rahoituslahde_id
	INNER JOIN [dbo].d_suuntautumisvaihtoehto_amk d15 ON d15.id = f.suuntautumisvaihtoehto_amk_id

	INNER JOIN [dbo].d_ensisijainen_opintooikeus d17 ON d17.id = f.ensisijainen_opintooikeus_id
	INNER JOIN [dbo].d_tilauskoulutuksen_sijaintimaa d18 ON d18.id = f.tilauskoulutuksen_sijaintimaa_id


	INNER JOIN [dbo].d_koulutusluokitus d21 ON d21.id = f.koulutusluokitus_id
	INNER JOIN [dbo].d_koulutuslaji_okm d21b ON d21b.id = f.koulutuslaji_OKM_id

	INNER JOIN [dbo].d_alueluokitus d22b ON d22b.id = f.koulutuksen_jarjestaja_kunta_id
	INNER JOIN [dbo].d_alueluokitus d22c ON d22c.id = f.oppilaitos_kunta_id
	INNER JOIN [dbo].d_kausi d23 ON d23.kausi_id = f.kirjoihintulovuosi_id
	INNER JOIN [dbo].d_kausi d23b ON d23b.kausi_id = f.kirjoihintulokausi_id
	INNER JOIN [dbo].d_kausi d24b ON d24b.kausi_id = f.kirjoihintulovuosi_korkeakoulusektori_id
	INNER JOIN [dbo].d_kausi d24c ON d24c.kausi_id = f.kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id
	INNER JOIN [dbo].d_kausi d24d ON d24d.kausi_id = f.kirjoihintulovuosi_sektori_id
	INNER JOIN [dbo].d_kausi d24e ON d24e.kausi_id = f.kirjoihintulovuosi_sektori_lasnaoleva_id
	INNER JOIN [dbo].d_kausi d24f ON d24f.kausi_id = f.kirjoihintulovuosi_korkeakoulu_id
	INNER JOIN [dbo].d_kausi d24f2 ON d24f2.kausi_id = f.kirjoihintulokausi_korkeakoulu_id
	INNER JOIN [dbo].d_kausi d24g ON d24g.kausi_id = f.kirjoihintulovuosi_korkeakoulu_lasnaoleva_id
	INNER JOIN [dbo].d_kausi d24h ON d24h.kausi_id = f.kirjoihintulovuosi_opintoala_id
	INNER JOIN [dbo].d_kausi d24i ON d24i.kausi_id = f.kirjoihintulovuosi_opintoala_lasnaoleva_id
	INNER JOIN [dbo].d_kausi d24j ON d24j.kausi_id = f.kirjoihintulovuosi_tutkinto_id
	INNER JOIN [dbo].d_kausi d24k ON d24k.kausi_id = f.kirjoihintulokausi_tutkinto_id
	INNER JOIN [dbo].d_vahintaan_55_op_suorittanut d28 ON d28.id = f.vahintaan_55_op_suorittanut_id
	INNER JOIN [dbo].d_opiskelijan_fte_tieto d29 ON d29.id = f.opiskelijan_fte_tieto_id
	--INNER JOIN [dbo].d_opiskelumuoto d30 ON d30.id = f.opiskelumuoto_id
	INNER JOIN [dbo].d_yliopisto d31 ON d31.id = f.yliopisto_id
	INNER JOIN [dbo].d_tiedekunta_yo d32 ON d32.id = f.tiedekunta_yo_id
	INNER JOIN [dbo].d_uusi_vanha_opiskelija d33 ON d33.id = f.uusi_vanha_opiskelija_id
	--INNER JOIN [dbo].d_kausi d34 ON d34.kausi_id = f.tutkintooikeusvuosi_id
	INNER JOIN [dbo].d_opettajankelpoisuus d35 ON d35.id = f.opettajankelpoisuus_id
	INNER JOIN [dbo].d_avoinvayla d36 ON d36.id = f.avoinvayla_id
	INNER JOIN [dbo].d_kausi d37 ON d37.kausi_id = f.tutkinnon_suoritusvuosi_id
	INNER JOIN [dbo].d_kausi d38 ON d38.kausi_id = f.tutkinnon_suorituslukukausi_id
	INNER JOIN [dbo].d_kausi d39 ON d39.kausi_id = f.tutkinnon_suorituskuukausi_id
	INNER JOIN [dbo].d_valtio_historia d40 ON d40.id = f.maanosa_id
	INNER JOIN [dbo].d_valtio_historia d41 ON d41.id = f.eumaa_id
	INNER JOIN [dbo].d_valtio_historia d42 ON d42.id = f.etamaa_id
	INNER JOIN [dbo].d_pohjoismaa d43 ON d43.id = f.pohjoismaa_id


WHERE d1.aineisto_koodi in ('L','-1') AND d9.oppilaitoskoodi <> '02557' AND d9.oppilaitoskoodi <> '10031' AND d9.oppilaitoskoodi <> '02358'

	*/




GO


USE [ANTERO]