USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_otv_korkeakoulut_yliopisto]    Script Date: 17.11.2025 16.49.38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















ALTER VIEW [dbo].[v_f_tab_otv_korkeakoulut_yliopisto] AS

Select --top 100
[Tilastovuosi]
,tilv_jatko_opiskelijat = case when Tilastovuosi >= 2012 then 1 else 0 end
,d44.paatieteenala2010 as 'Päätieteenala'
,d44.tieteenala2010 as 'Tieteenala'
,Opiskeluvuosi = 
	CASE
		WHEN d23.kausi_id = -1 THEN d23.vuosiselite
		ELSE CAST(CAST(Tilastovuosi as int) - CAST(d23.vuosiselite as int) AS varchar(10))
	END
,jarj_opiskeluvuosi = 
	CASE
		WHEN d23.kausi_id = -1 THEN 999
		ELSE CAST(Tilastovuosi as int) - CAST(d23.vuosiselite as int)
	END
,d1.aineisto as Aineisto
,d1b.aineisto as Aineisto_OTV
,d1b.kaikkien_asteiden_koulutus as 'Kaikkien asteiden koulutus'
,d1b.tilastointivuosi as OTV_Tilv
,d2.aidinkieli_versio1 as Äidinkieli
,d2b.aidinkieli_versio2 as "Äidinkieli (väestörakenne)"
--luodaan yhdistetty äidinkieli-muuttuja, joka toimii aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d2.aidinkieli_versio1_koodi = 'fs' Or d2b.aidinkieli_versio2_koodi = 'fi' Or d2b.aidinkieli_versio2_koodi = 'se' THEN
'suomi (sis. saame)' When d2.aidinkieli_versio1_koodi = 'sv' Or d2b.aidinkieli_versio2_koodi = 'sv' THEN 'ruotsi'
 When d2.aidinkieli_versio1_koodi = '99' Or d2b.aidinkieli_versio2_koodi = '99' THEN 'muut kielet ja tuntematon' Else 'Tuntematon' End AS 'Äidinkieli (suomi/muu)'
--
,d3.avi as "Asuinalueen AVI"
,d3.ely as "Asuinalueen ELY"
,d3.kielisuhde as "Asuinkunnan kielisuhde"
,d3.maakunta as Asuinmaakunta
,d3.kunta as Asuinkunta
,d3b.avi as "Til.v:tta edeltävä AVI"
,d3b.ely as "Til.v:tta edeltävä ELY"
,d3b.kielisuhde as "Til.v:tta ed. asuinkunnan kielisuhde"
,d3b.maakunta as "Til.v:tta ed. asuinmaakunta"
,d3b.kunta as "Til.v:tta ed. asuinkunta"
,d3c.avi as "2v til.v:tta ed. AVI"
,d3c.ely as "2v til.v:tta ed. ELY"
,d3c.kielisuhde as "2v til.v:tta ed. asuinkunnan kielisuhde"
,d3c.maakunta as "2v til.v:tta ed. asuinmaakunta"
,d3c.kunta as "2v til.v:tta ed. asuinkunta"
,d4.sukupuoli as Sukupuoli
,d5.ika as Ikä
,d5.ika5v as Ikäryhmä
,d5b.vuosiselite as Syntymävuosi
,d5c.kuukausiselite as Syntymäkuukausi
,d6b.tutkinto_yo as "Tutkinto (yo)"
--,d7.koulutustyyppi as Koulutustyyppi
,d8.kansalaisuus_versio2 as Kansalaisuus
,d8b.kansalaisuus_versio1 as 'Kansalaisuus (väestörakenne)'
,d8c.kansalaisuus_versio2 as 'Kansalaisuus (ennakko)'
--luodaan yhdistetty kansalaisuus-muuttuja, joka toimii aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d8.kansalaisuus_versio2_koodi = '1' Or d8b.kansalaisuus_versio1_koodi = '1' THEN
'suomi' When d8.kansalaisuus_versio2_koodi = '2' Or d8.kansalaisuus_versio2_koodi = '9' Or d8b.kansalaisuus_versio1_koodi = '2' THEN 'muu'
 Else 'Tuntematon' End AS 'Kansalaisuus (suomi/muu)'
,d48.eu_etamaat as 'Toisen asteen tutkinnon suoritusmaa'
,d46.kvopiskelija as 'Kansainvälinen opiskelija'
,d47.liikkuvuuden_kesto as 'Liikkuvuuden kesto'
,d47.liikkuvuuden_kesto_sv as 'Mobilitetens längd'
,d47.liikkuvuuden_kesto_en as 'Duration of mobility'
,d47.jarjestys as jarjestys_liikkuvuuden_kesto
,d24l.vuosi as 'Tutkinto-oikeusvuosi'
--
,case f.oppilaitos
	when '10122' then 'Tampereen yliopisto' 
	else d9.oppilaitos end 
as Yliopisto
,d9.opetuskieli as Opetuskieli
,d9.oppilaitoksen_omistajatyyppi as "Oppil. omistajatyyppi"
,d9.oppilaitostyyppi as Oppilaitostyyppi
,d9b.koulutuksen_jarjestaja as "Koulutuksen järjestäjä"
,d9b.koulutuksen_jarjestajan_omistajatyyppi as "Koul. järj. omistajatyyppi"
,d9c.oppilaitos as 'Yliopisto (tilastovuosi)'
,d9d.koulutuksen_jarjestaja as 'Koulutuksen järjestäjä (tilastovuosi)'
,d10.lahde as Lähde
,d11.koulutusohjelma_amk as Koulutusohjelma
,d12.opiskelijan_olo as "Kirjoillaolo (syys)"
,d12b.opiskelijan_olo_tamm as "Kirjoillaolo (tammi)"
,d13.rahoituslahde as Rahoituslähde
,d15.suuntautumisvaihtoehto_amk as Suuntautumisvaihtoehto
,d16.kieli as "Koulutuksen kieli"
,d17.ensisijainen_opintooikeus as "Ensisijainen opinto-oikeus"
,d18.tilauskoulutuksen_sijaintimaa as "Tilauskoulutuksen sijaintimaa"
,d19.koulutussektori as Koulutussektori
,d20.opetushallinnon_koulutus as Hallinnonala
,d21a.koulutusaste2002_fi as "Koulutusaste (2002)"
,d21a.koulutusala2002_fi as "Koulutusala (2002)"
,d21a.opintoala1995_fi as "Koulutusala (1995)"
,d21a.opintoala2002_fi as "Opintoala (2002)"
,d21a.koulutusluokitus_fi as Koulutusnimike
,CASE WHEN d21.koulutus_koodi = '999999' THEN d45.erikoislaakarikoulutus ELSE d21.koulutus END as Koulutustyyppi
,d21b.koulutuslaji_okm as Koulutuslaji
,d21b.koulutuslaji_okm2 as Koulutuslaji2
,d22.avi as "Koulutuksen AVI"
,d22.ely as "Koulutuksen ELY"
,d22.maakunta as "Koulutuksen maakunta"
,d22.kielisuhde as "Koul. kunnan kielisuhde"
,d22.kunta as "Koulutuksen kunta"
--luodaan yhdistetyt kunta-muuttujat, jotka toimivat aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d1b.aineisto_koodi <> '4.9' And d1b.aineisto_koodi <> '3.4' THEN
d22.maakunta When d1b.aineisto_koodi = '4.9' THEN d3.maakunta
 Else 'Tuntematon' End AS 'Maakunta'
,CASE WHEN d1b.aineisto_koodi <> '4.9' And d1b.aineisto_koodi <> '3.4' THEN
d22.kunta When d1b.aineisto_koodi = '4.9' THEN d3.kunta
 Else 'Tuntematon' End AS 'Kunta'
--
,d22b.avi as "Koul. järjestäjän AVI"
,d22b.ely as "Koul. järjestäjän ELY"
,d22b.maakunta as "Koul. järjestäjän maakunta"
,d22b.kielisuhde as "Koul. järj. kunnan kielisuhde"
,d22b.kunta as "Koul. järjestäjän kunta"
,d22c.avi as "Oppilaitoksen AVI"
,d22c.ely as "Oppilaitoksen ELY"
,d22c.maakunta as "Oppilaitoksen maakunta"
,d22c.kielisuhde as "Oppil. kunnan kielisuhde"
,d22c.kunta as "Oppilaitoksen kunta"
,d23.vuosiselite as "Kirjoihintulovuosi"
,d23b.lukukausiselite as "Kirjoihintulokausi"
,d24b.vuosiselite as "Kirjoihintulovuosi (kk-sek.)"
,d24c.vuosiselite as "Kirjoihintulovuosi (kk-sek. läsna)"
,d24d.vuosiselite as "Kirjoihintulovuosi (sek.)"
,d24e.vuosiselite as "Kirjoihintulovuosi (sek. läsnä)"
,d24f.vuosiselite as "Kirjoihintulovuosi (kk)"
,d24f2.lukukausiselite as "Kirjoihintulokausi (kk)"
,d24g.vuosiselite as "Kirjoihintulovuosi (kk läsnä)"
,d24h.vuosiselite as "Kirjoihintulovuosi (op.ala)"
,d24i.vuosiselite as "Kirjoihintulovuosi (op.ala läsnä)"
,d24j.vuosiselite as "Kirjoihintulovuosi (tutk.)"
,d24k.lukukausiselite as "Kirjoihintulokausi (tutk.)"
,d24l.vuosiselite as "Kirjoihintulovuosi (TK määritelmä)"
,d28.vahintaan_55_op_suorittanut as "Suorittanut väh. 55 op"
,d29.opiskelijan_fte_tieto as "Opiskelijan FTE-tieto"
--,d30.opiskelumuoto as Opiskelumuoto
,d31.yliopisto as Yliopistotunnus
,d32.tiedekunta_yo as Tiedekunta
,d33.uusi_vanha_opiskelija as "Uusi/vanha opiskelija"
,d35.opettajankelpoisuus as Opettajankelpoisuus
,d36.avoinvayla as "Hyväksytty avoimen yliop. suoritusten kautta"
,d37.vuosiselite as "Tutkinnon suoritusvuosi"
,d38.lukukausiselite as "Tutk. suorituslukukausi"
,d39.kuukausiselite as "Tutk. suorituskuukausi"
,d40.maanosa as "Kansalaisuus (maanosa)"
,d41.eumaa as "EU-maan kansalainen"
,d42.etamaa as "ETA-maan kansalainen"
,d43.pohjoismaa as "Pohjoismaan kansalainen"
--jarjestysmuuttujat
,d1b.jarjestys as aineisto_otv_jarj
,d2.jarjestys as jarj_aidinkieli
,d2b.jarjestys as jarj_aidinkieli2
--yhdistetyn muuttujan järjestys
,CASE WHEN d2.aidinkieli_versio1_koodi = 'fs' Or d2b.aidinkieli_versio2_koodi = 'fi' Or d2b.aidinkieli_versio2_koodi = 'se' THEN
'1' When d2.aidinkieli_versio1_koodi = 'sv' Or d2b.aidinkieli_versio2_koodi = 'sv' THEN '2'
 When d2.aidinkieli_versio1_koodi = '99' Or d2b.aidinkieli_versio2_koodi = '99' THEN '3' Else '4' End AS 'jarj_aidinkieli3'
--
,d3.jarjestys_avi as jarj_as_avi
,d3.jarjestys_ely as jarj_as_ely
,d3.jarjestys_kielisuhde as jarj_as_kielisuhde
,d3.jarjestys_maakunta as jarj_as_maakunta
,d3.jarjestys as jarj_as_kunta
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
,d5.jarjestys_ika
,d5.jarjestys_ika5v as jarj_ika5v
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
,d44.jarjestys_paatieteenala2010
,d44.jarjestys_tieteenala2010
,d9.jarjestys_oppilaitos
,d9.jarjestys_opetuskieli
,d9.jarjestys_omistajatyyppi
,d9.jarjestys_oppilaitostyyppi
,d9c.jarjestys_oppilaitos as jarjestys_oppilaitos_tilv
,d11.jarjestys as jarj_koulohjelma_amk
,d12.jarjestys as jarj_kirjolosyys
,d12b.jarjestys as jarj_kirjolotammi
,d13.jarjestys as jarj_rahoitus
,d15.jarjestys as jarj_suunnvaiht
,d16.jarjestys as jarj_koulkiel
,d16.jarjestys_iso3kirjainta as jarj_koulkiel2
,d17.jarjestys as jarj_ensop
,d18.jarjestys as jarj_tilauskoul
,d19.jarjestys as jarj_koulsek
,d20.jarjestys as jarj_hallinnonala
,d21a.jarjestys_koulutusaste2002_koodi as jarjestys_koulutusaste2002
,d21a.jarjestys_koulutusala2002_koodi as jarjestys_koulutusala2002
,d21a.jarjestys_opintoala1995_koodi as jarjestys_opintoala1995
,d21a.jarjestys_opintoala2002_koodi as jarjestys_opintoala2002
,d21b.jarjestys as jarj_koulnimike
,d21b.jarjestys as jarj_koullaji
,d21b.jarjestys2 as jarj_koullaji2
,d22.jarjestys_avi
,d22.jarjestys_ely
,d22.jarjestys_maakunta
,d22.jarjestys_kielisuhde
,d22.jarjestys as jarj_kunta
--yhdistetyn muuttujan järjestys
,CASE WHEN d1b.aineisto_koodi <> '4.9' And d1b.aineisto_koodi <> '3.4' THEN
d22.jarjestys_maakunta When d1b.aineisto_koodi = '4.9' THEN d3.jarjestys_maakunta
 Else '99' End AS 'jarj_kmaakunta2'
,CASE WHEN d1b.aineisto_koodi <> '4.9' And d1b.aineisto_koodi <> '3.4' THEN
d22.jarjestys When d1b.aineisto_koodi = '4.9' THEN d3.jarjestys
 Else 'Tuntematon' End AS 'jarj_kkunta2'
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
,d40.jarjestys_maanosa as jarj_kans_maanosa
,d41.jarjestys_eumaa
,d42.jarjestys_etamaa
,d43.jarjestys as jarj_pohj_kans
,d46.jarjestys as jar_kvopiskelija
,d48.jarjestys as jar_suoritusmaa

--Koodimuuttujat
,d1.aineisto_koodi
,d1b.aineisto_koodi as ainesto_koodi_otv
,d2.aidinkieli_versio1_koodi as aidinkieli_koodi
,d2b.aidinkieli_versio2_koodi as aidinkieli2_koodi
--yhdistetyn muuttujan koodi
,CASE WHEN d2.aidinkieli_versio1_koodi = 'fs' Or d2b.aidinkieli_versio2_koodi = 'fi' Or d2b.aidinkieli_versio2_koodi = 'se' THEN
'fs' When d2.aidinkieli_versio1_koodi = 'sv' Or d2b.aidinkieli_versio2_koodi = 'sv' THEN 'sv'
 When d2.aidinkieli_versio1_koodi = '99' Or d2b.aidinkieli_versio2_koodi = '99' THEN '99' Else '999' End AS 'aidinkieli3_koodi'
--
,d3.maakunta_koodi as 'Koodit Asuinmaakunta'
,d3.kunta_koodi as 'Koodit Asuinkunta'
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
,coalesce(d9.oppilaitoksen_korvaavakoodi,d9.oppilaitoskoodi) as 'Koodit Oppilaitos'
,d9b.koulutuksen_jarjestajakoodi as 'Koodit Koulutuksen järjestäjä'
,d10.lahde_koodi
,d11.koulutusohjelma_amk_koodi as 'Koodit Koulutusohjelma'
,d12.opiskelijan_olo_koodi as kirjoillaolosyys_koodi
,d12b.opiskelijan_olo_tamm_koodi as kirjoillaolotammi_koodi
,d17.ensisijainen_opintooikeus_koodi as ensiop
,d21a.koulutusaste2002_koodi as 'Koodit Koulutusaste 2002'
,d21a.koulutusala2002_koodi as 'Koodit Koulutusala 2002'
,d21a.opintoala1995_koodi as 'Koodit Koulutusala 1995'
,d21a.opintoala2002_koodi as 'Koodit Opintoala 2002'
,d21a.koulutusluokitus_koodi as 'Koodit Koulutusnimike'
,d22.maakunta_koodi as 'Koodit Koulutuksen maakunta'
,d22.kunta_koodi as 'Koodit Koulutuksen kunta'
--yhdistetyn muuttujan koodi
,CASE WHEN d1b.aineisto_koodi <> '4.9' And d1b.aineisto_koodi <> '3.4' THEN
d22.maakunta_koodi When d1b.aineisto_koodi = '4.9' THEN d3.maakunta_koodi
 Else '99' End AS 'Koodit Maakunta'
,CASE WHEN d1b.aineisto_koodi <> '4.9' And d1b.aineisto_koodi <> '3.4' THEN
d22.kunta_koodi When d1b.aineisto_koodi = '4.9' THEN d3.kunta_koodi
 Else 'Tuntematon' End AS 'Koodit Kunta'
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



--ruotsi

,[Tilastovuosi] as Statistikår
,d44.paatieteenala2010_SV as 'Huvudsakligt vetenskapsområde'
,d44.tieteenala2010_SV as 'Vetenskapsområde'
,Studieår = 
	CASE
		WHEN d23.kausi_id = -1 THEN d23.vuosiselite_SV
		ELSE CAST(CAST(Tilastovuosi as int) - CAST(d23.vuosiselite as int) AS varchar(10))
	END
,d2.aidinkieli_versio1_SV as Modersmål
,d2b.aidinkieli_versio2_SV as "Modersmål (utbildningsstruktur)"
--luodaan yhdistetty äidinkieli-muuttuja, joka toimii aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d2.aidinkieli_versio1_koodi = 'fs' Or d2b.aidinkieli_versio2_koodi = 'fi' Or d2b.aidinkieli_versio2_koodi = 'se' THEN
'finska (inn. samiska)' When d2.aidinkieli_versio1_koodi = 'sv' Or d2b.aidinkieli_versio2_koodi = 'sv' THEN 'svenska'
 When d2.aidinkieli_versio1_koodi = '99' Or d2b.aidinkieli_versio2_koodi = '99' THEN 'andra språk och okänd' Else 'Okänd' End as 'Modersmål (finska/andra)SV'
--
--,d3.avi_SV as "Asuinalueen AVISV"
--,d3.ely_SV as "Asuinalueen ELYSV"
--,d3.kielisuhde_SV as "Asuinkunnan kielisuhdeSV"
,d3.maakunta_SV as Bostadslandskap
,d3.kunta_SV as Bostadskommun
--,d3b.avi_SV as "Til.v:tta edeltävä AVISV"
--,d3b.ely_SV as "Til.v:tta edeltävä ELYSV"
--,d3b.kielisuhde_SV as "Til.v:tta ed. asuinkunnan kielisuhdeSV"
--,d3b.maakunta_SV as "Til.v:tta ed. asuinmaakuntaSV"
--,d3b.kunta_SV as "Til.v:tta ed. asuinkuntaSV"
--,d3c.avi_SV as "2v til.v:tta ed. AVISV"
--,d3c.ely_SV as "2v til.v:tta ed. ELYSV"
--,d3c.kielisuhde_SV as "2v til.v:tta ed. asuinkunnan kielisuhdeSV"
--,d3c.maakunta_SV as "2v til.v:tta ed. asuinmaakuntaSV"
--,d3c.kunta_SV as "2v til.v:tta ed. asuinkuntaSV"
,d4.sukupuoli_SV as Kön
,d5.ika_SV as Ålder
,d5.ika5v_SV as Åldersgrupp
,d5b.vuosiselite_SV as Födelseår
--,d5c.kuukausiselite_SV as SyntymäkuukausiSV
,d6b.tutkinto_yo_SV as "Examen (universitet)"
,d7.koulutustyyppi_SV as "Typ av utbildning"
,d8.kansalaisuus_versio2_SV as Medborgarskap
,d8b.kansalaisuus_versio1_SV as "Medborgarskap (utbildningsstruktur)"
--luodaan yhdistetty kansalaisuus-muuttuja, joka toimii aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d8.kansalaisuus_versio2_koodi = '1' Or d8b.kansalaisuus_versio1_koodi = '1' THEN
'finländare' When d8.kansalaisuus_versio2_koodi = '2' Or d8.kansalaisuus_versio2_koodi = '9' Or d8b.kansalaisuus_versio1_koodi = '2' THEN 'andra'
 Else 'Okänd' End as 'Medborgarskap (finska/andra)'
--
,case f.oppilaitos
	when '10122' then 'Tammerfors universitet' 
	else d9.oppilaitos_SV end 
as Universitet
--,d9.opetuskieli_SV as OpetuskieliSV
--,d9.oppilaitoksen_omistajatyyppi_SV as "Oppil. omistajatyyppiSV"
--,d9.oppilaitostyyppi_SV as OppilaitostyyppiSV
--,d9b.koulutuksen_jarjestaja_SV as "Koulutuksen järjestäjäSV"
--,d9b.koulutuksen_jarjestajan_omistajatyyppi_SV as "Koul. järj. omistajatyyppiSV"
--,d10.lahde_SV as LähdeSV
,d11.koulutusohjelma_amk_SV as Utbildningsprogram
,d12.opiskelijan_olo_SV as "Inskrivning (september)"
,d12b.opiskelijan_olo_tamm_SV as "Inskrivning (januari)"
,d13.rahoituslahde_SV as Finansieringskälla
--,d15.suuntautumisvaihtoehto_amk_SV as SuuntautumisvaihtoehtoSV
--,d16.kieli_SV as "Koulutuksen kieliSV"
--,d17.ensisijainen_opintooikeus_SV as "Ensisijainen opinto-oikeusSV"
--,d18.tilauskoulutuksen_sijaintimaa_SV as "Tilauskoulutuksen sijaintimaaSV"
,d19.koulutussektori_SV as Utbildningssektor
--,d20.opetushallinnon_koulutus_SV as HallinnonalaSV
,d21a.koulutusaste2002_SV as "Utbildningsnivå (2002)"
,d21a.koulutusala2002_SV as "Utbildningsområde (2002)"
,d21a.opintoala1995_SV as "Utbildningsområde (1995)"
,d21a.opintoala2002_SV as "Studieområde (2002)"
,d21a.koulutusluokitus_SV as Utbildningsbenämning
,d21b.koulutuslaji_okm_SV as Utbildningsslag
,d21b.koulutuslaji_okm2_SV as Utbildningsslag2
--,d22.avi_SV as "Koulutuksen AVISV"
--,d22.ely_SV as "Koulutuksen ELYSV"
,d22.maakunta_SV as "Utbildningens landskap"
--,d22.kielisuhde_SV as "Koul. kunnan kielisuhdeSV"
,d22.kunta_SV as "Utbildningens kommun"
--luodaan yhdistetyt kunta-muuttujat, jotka toimivat aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d1b.aineisto_koodi <> '4.9' And d1b.aineisto_koodi <> '3.4' THEN
d22.maakunta When d1b.aineisto_koodi = '4.9' THEN d3.maakunta
 Else 'Tuntematon' End as 'Landskap'
,CASE WHEN d1b.aineisto_koodi <> '4.9' And d1b.aineisto_koodi <> '3.4' THEN
d22.kunta When d1b.aineisto_koodi = '4.9' THEN d3.kunta
 Else 'Tuntematon' End as 'Kommun'
--
--,d22b.avi_SV as "Koul. järjestäjän AVISV"
--,d22b.ely_SV as "Koul. järjestäjän ELYSV"
--,d22b.maakunta_SV as "Koul. järjestäjän maakuntaSV"
--,d22b.kielisuhde_SV as "Koul. järj. kunnan kielisuhdeSV"
--,d22b.kunta_SV as "Koul. järjestäjän kuntaSV"
--,d22c.avi_SV as "Oppilaitoksen AVISV"
--,d22c.ely_SV as "Oppilaitoksen ELYSV"
--,d22c.maakunta_SV as "Oppilaitoksen maakuntaSV"
--,d22c.kielisuhde_SV as "Oppil. kunnan kielisuhdeSV"
--,d22c.kunta_SV as "Oppilaitoksen kuntaSV"
--,d23.vuosiselite_SV as "KirjoihintulovuosiSV"
--,d23b.lukukausiselite_SV as "KirjoihintulokausiSV"
--,d24b.vuosiselite_SV as "Kirjoihintulovuosi (kk-sek.)SV"
--,d24c.vuosiselite_SV as "Kirjoihintulovuosi (kk-sek. läsna)SV"
--,d24d.vuosiselite_SV as "Kirjoihintulovuosi (sek.)SV"
--,d24e.vuosiselite_SV as "Kirjoihintulovuosi (sek. läsnä)SV"
--,d24f.vuosiselite_SV as "Kirjoihintulovuosi (kk)SV"
--,d24f2.lukukausiselite_SV as "Kirjoihintulokausi (kk)SV"
--,d24g.vuosiselite_SV as "Kirjoihintulovuosi (kk läsnä)SV"
--,d24h.vuosiselite_SV as "Kirjoihintulovuosi (op.ala)SV"
--,d24i.vuosiselite_SV as "Kirjoihintulovuosi (op.ala läsnä)SV"
--,d24j.vuosiselite_SV as "Kirjoihintulovuosi (tutk.)SV"
--,d24k.lukukausiselite_SV as "Kirjoihintulokausi (tutk.)SV"
--,d28.vahintaan_55_op_suorittanut_SV as "Suorittanut väh. 55 opSV"
--,d29.opiskelijan_fte_tieto_SV as "Opiskelijan FTE-tietoSV"
--,d30.opiskelumuoto_SV as OpiskelumuotoSV
--,d31.yliopisto_SV as YliopistotunnusSV
--,d32.tiedekunta_yo_SV as TiedekuntaSV
--,d33.uusi_vanha_opiskelija_SV as "Uusi/vanha opiskelijaSV"
--,d35.opettajankelpoisuus_SV as OpettajankelpoisuusSV
--,d36.avoinvayla_SV as "Hyväksytty avoimen yliop. suoritusten kauttaSV"
,d37.vuosiselite_SV as "År då utbildningen avlagts"
--,d38.lukukausiselite_SV as "Tutk. suorituslukukausiSV"
--,d39.kuukausiselite_SV as "Tutk. suorituskuukausiSV"
,d40.maanosa_SV as "Medborgarskap (världsdel)"
,d41.eumaa_SV as "Medborgare i ett EU-land"
,d42.etamaa_SV as "Medborgare i ett EES-land"
,d43.pohjoismaa_SV as "Medborgare i ett nordiskt land"


--englanti
,[Tilastovuosi] as "Statistical year"
,d44.paatieteenala2010_EN as 'Main discipline'
,d44.tieteenala2010_EN as 'Discipline'
,[Study year] = 
	CASE
		WHEN d23.kausi_id = -1 THEN d23.vuosiselite_EN
		ELSE CAST(CAST(Tilastovuosi as int) - CAST(d23.vuosiselite as int) AS varchar(10))
	END
,d2.aidinkieli_versio1_EN as "Mother tongue"
,d2b.aidinkieli_versio2_EN as "Mother tongue (ed. structure)"
--luodaan yhdistetty äidinkieli-muuttuja, joka toimii aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d2.aidinkieli_versio1_koodi = 'fs' Or d2b.aidinkieli_versio2_koodi = 'fi' Or d2b.aidinkieli_versio2_koodi = 'se' THEN
'Finnish (incl. Sami)' When d2.aidinkieli_versio1_koodi = 'sv' Or d2b.aidinkieli_versio2_koodi = 'sv' THEN 'Swedish'
 When d2.aidinkieli_versio1_koodi = '99' Or d2b.aidinkieli_versio2_koodi = '99' THEN 'Other languages and unknown' Else 'Unknown' End as 'Mother tongue (Finnish/Other)'
--
--,d3.avi_EN as "Asuinalueen AVIEN"
--,d3.ely_EN as "Asuinalueen ELYEN"
--,d3.kielisuhde_EN as "Asuinkunnan kielisuhdeEN"
,d3.maakunta_EN as "Region of residence"
,d3.kunta_EN as "Municipality of residence"
--,d3b.avi_EN as "Til.v:tta edeltävä AVIEN"
--,d3b.ely_EN as "Til.v:tta edeltävä ELYEN"
--,d3b.kielisuhde_EN as "Til.v:tta ed. asuinkunnan kielisuhdeEN"
--,d3b.maakunta_EN as "Til.v:tta ed. asuinmaakuntaEN"
--,d3b.kunta_EN as "Til.v:tta ed. asuinkuntaEN"
--,d3c.avi_EN as "2v til.v:tta ed. AVIEN"
--,d3c.ely_EN as "2v til.v:tta ed. ELYEN"
--,d3c.kielisuhde_EN as "2v til.v:tta ed. asuinkunnan kielisuhdeEN"
--,d3c.maakunta_EN as "2v til.v:tta ed. asuinmaakuntaEN"
--,d3c.kunta_EN as "2v til.v:tta ed. asuinkuntaEN"
,d4.sukupuoli_EN as Gender
,d5.ika_EN as Age
,d5.ika5v_EN as Agegroup
,d5b.vuosiselite_EN as "Year of birth"
--,d5c.kuukausiselite_EN as SyntymäkuukausiEN
,d6b.tutkinto_yo_EN as "Degree (university)"
,d7.koulutustyyppi_EN as "Type of education"
,d8.kansalaisuus_versio2_EN as Nationality
,d8b.kansalaisuus_versio1_EN as "Nationality (ed. structure)"
--luodaan yhdistetty kansalaisuus-muuttuja, joka toimii aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d8.kansalaisuus_versio2_koodi = '1' Or d8b.kansalaisuus_versio1_koodi = '1' THEN
'Finn' When d8.kansalaisuus_versio2_koodi = '2' Or d8.kansalaisuus_versio2_koodi = '9' Or d8b.kansalaisuus_versio1_koodi = '2' THEN 'Other'
 Else 'Unknown' End as 'Nationality (Finn/Other)'
--
,case f.oppilaitos
	when '10122' then 'University of Tampere' 
	else d9.oppilaitos_EN end 
as University
--,d9.opetuskieli_EN as OpetuskieliEN
--,d9.oppilaitoksen_omistajatyyppi_EN as "Oppil. omistajatyyppiEN"
--,d9.oppilaitostyyppi_EN as OppilaitostyyppiEN
--,d9b.koulutuksen_jarjestaja_EN as "Koulutuksen järjestäjäEN"
--,d9b.koulutuksen_jarjestajan_omistajatyyppi_EN as "Koul. järj. omistajatyyppiEN"
--,d10.lahde_EN as LähdeEN
,d11.koulutusohjelma_amk_EN as "Degree programme"
,d12.opiskelijan_olo_EN as "Enrollment status (sept.)"
,d12b.opiskelijan_olo_tamm_EN as "Enrollment status (jan.)"
,d13.rahoituslahde_EN as "Source of funding"
--,d15.suuntautumisvaihtoehto_amk_EN as SuuntautumisvaihtoehtoEN
--,d16.kieli_EN as "Koulutuksen kieliEN"
--,d17.ensisijainen_opintooikeus_EN as "Ensisijainen opinto-oikeusEN"
--,d18.tilauskoulutuksen_sijaintimaa_EN as "Tilauskoulutuksen sijaintimaaEN"
,d19.koulutussektori_EN as "Sector of education"
--,d20.opetushallinnon_koulutus_EN as HallinnonalaEN
,d21a.koulutusaste2002_EN as "Level of education (2002)"
,d21a.koulutusala2002_EN as "Field of education (2002)"
,d21a.opintoala1995_EN as "Field of education (1995)"
,d21a.opintoala2002_EN as "Subfield of ed. (2002)"
,d21a.koulutusluokitus_EN as "Name of education"
,d21b.koulutuslaji_okm_EN as "Form of education"
,d21b.koulutuslaji_okm2_EN as "Form of education2"
--,d22.avi_EN as "Koulutuksen AVIEN"
--,d22.ely_EN as "Koulutuksen ELYEN"
,d22.maakunta_EN as "Region of education"
--,d22.kielisuhde_EN as "Koul. kunnan kielisuhdeEN"
,d22.kunta_EN as "Municipality of education"
--luodaan yhdistetyt kunta-muuttujat, jotka toimivat aineistojen 2.8, 2.9, ja 4.9 välillä
,CASE WHEN d1b.aineisto_koodi <> '4.9' And d1b.aineisto_koodi <> '3.4' THEN
d22.maakunta When d1b.aineisto_koodi = '4.9' THEN d3.maakunta
 Else 'Tuntematon' End as 'Region'
,CASE WHEN d1b.aineisto_koodi <> '4.9' And d1b.aineisto_koodi <> '3.4' THEN
d22.kunta When d1b.aineisto_koodi = '4.9' THEN d3.kunta
 Else 'Tuntematon' End as 'Municipality'
--
--,d22b.avi_EN as "Koul. järjestäjän AVIEN"
--,d22b.ely_EN as "Koul. järjestäjän ELYEN"
--,d22b.maakunta_EN as "Koul. järjestäjän maakuntaEN"
--,d22b.kielisuhde_EN as "Koul. järj. kunnan kielisuhdeEN"
--,d22b.kunta_EN as "Koul. järjestäjän kuntaEN"
--,d22c.avi_EN as "Oppilaitoksen AVIEN"
--,d22c.ely_EN as "Oppilaitoksen ELYEN"
--,d22c.maakunta_EN as "Oppilaitoksen maakuntaEN"
--,d22c.kielisuhde_EN as "Oppil. kunnan kielisuhdeEN"
--,d22c.kunta_EN as "Oppilaitoksen kuntaEN"
,d23.vuosiselite_EN as "Year of enrollment"
,d23b.lukukausiselite_EN as "Term of enrollment"
,d24b.vuosiselite_EN as "Year of enrollment (HE sec.)"
,d24c.vuosiselite_EN as "Year of enrollment (HE sec. present)"
,d24d.vuosiselite_EN as "Year of enrollment (sec.)"
,d24e.vuosiselite_EN as "Year of enrollment (sec. present)"
,d24f.vuosiselite_EN as "Year of enrollment (ed. inst.)"
,d24f2.lukukausiselite_EN as "Term of enrollment (ed. inst.)"
,d24g.vuosiselite_EN as "Year of enrollment (ed. inst. present)"
,d24h.vuosiselite_EN as "Year of enrollment (subfield of ed.)"
,d24i.vuosiselite_EN as "Year of enrollment (subfield of ed. present)"
,d24j.vuosiselite_EN as "Year of enrollment (degree)"
,d24k.lukukausiselite_EN as "Term of enrollment (degree)"
,d24l.vuosiselite as "Year of enrollment (Statistic Finland's definition)"
--,d28.vahintaan_55_op_suorittanut_EN as "Suorittanut väh. 55 opEN"
--,d29.opiskelijan_fte_tieto_EN as "Opiskelijan FTE-tietoEN"
--,d30.opiskelumuoto_EN as OpiskelumuotoEN
--,d31.yliopisto_EN as YliopistotunnusEN
--,d32.tiedekunta_yo_EN as TiedekuntaEN
--,d33.uusi_vanha_opiskelija_EN as "Uusi/vanha opiskelijaEN"
--,d35.opettajankelpoisuus_EN as OpettajankelpoisuusEN
--,d36.avoinvayla_EN as "Hyväksytty avoimen yliop. suoritusten kauttaEN"
,d37.vuosiselite_EN as "Year of graduation"
,d38.lukukausiselite_EN as "Term of graduation"
,d39.kuukausiselite_EN as "Month of graduation"
,d40.maanosa_EN as "Nationality (continent)"
,d41.eumaa_EN as "Citizen of EU nation"
,d42.etamaa_EN as "Citizen of EEA nation"
,d43.pohjoismaa_EN as "Citizen of a nordic nation"
--isced
,d21a.koulutusastetaso1_fi as "Koulutusaste, taso 1"
,d21a.koulutusastetaso2_fi as "Koulutusaste, taso 2"
,d21a.koulutusalataso1_fi as "Koulutusala, taso 1"
,d21a.koulutusalataso2_fi as "Koulutusala, taso 2"
,d21a.koulutusalataso3_fi as "Koulutusala, taso 3"
,d21a.okmohjauksenala_fi as "OKM ohjauksen ala, korkeak."
,d21a.koulutusastetaso1_sv as "Utbildn.nivå, nivå 1"
,d21a.Koulutusastetaso2_SV as "Utbildn.nivå, nivå 2"
,d21a.koulutusalataso1_sv as "Utbildn.område, nivå 1"
,d21a.koulutusalataso2_sv as "Utbildn.område, nivå 2"
,d21a.koulutusalataso3_sv as "Utbildn.område, nivå 3"
,d21a.okmohjauksenala_sv as "UKM-styrningsområde, högskolor"
,d21a.koulutusastetaso1_en as "Level of ed., tier 1"
,d21a.Koulutusastetaso2_EN as "Level of ed., tier 2"
,d21a.koulutusalataso1_en as "Field of education, tier 1"
,d21a.koulutusalataso2_en as "Field of education, tier 2"
,d21a.koulutusalataso3_en as "Field of education, tier 3"
,d21a.okmohjauksenala_en as "Field of ed., HE steering"
,d21a.jarjestys_koulutusastetaso1_koodi as jarj_isced_koulast1
,d21a.jarjestys_koulutusastetaso2_koodi as jarj_isced_koulast2
,d21a.jarjestys_koulutusalataso1_koodi as jarj_isced_koulala1
,d21a.jarjestys_koulutusalataso2_koodi as jarj_isced_koulala2
,d21a.jarjestys_koulutusalataso3_koodi as jarj_isced_koulala3
,d21a.jarjestys_okmohjauksenala_koodi as jarj_isced_okmohjaus1
,d21.jarjestys_OKM_ohjauksen_ala_yo_tav as jarj_rahoitusala2016_yo
,d21.jarjestys_OKM_ohjauksen_ala_yo_tav2021 as jarj_rahoitusala2021_yo
,d21a.koulutusastetaso1_koodi as "Koodit Koulutusaste, taso 1"
,d21a.Koulutusastetaso2_koodi as "Koodit Koulutusaste, taso 2"
,d21a.koulutusalataso1_koodi as "Koodit Koulutusala, taso 1"
,d21a.koulutusalataso2_koodi as "Koodit Koulutusala, taso 2"
,d21a.koulutusalataso3_koodi as "Koodit Koulutusala, taso 3"
,d21a.okmohjauksenala_koodi as "Koodit OKM ohjauksen ala, korkeak."
--rahoitusmallialat
,d21.OKM_ohjauksen_ala_yo_tav as "Rahoitusmallialat yo 2017-2020"
,d21.OKM_ohjauksen_ala_yo_tav2021 as "Rahoitusmallialat yo 2021-2024"
--Lukumäärämuuttujat
,[Opisk2]
,[Aloit2] = case when d21a.Koulutusastetaso2_koodi in (63,72,73,81,82,91) then Aloit2 else 0 end
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

,[op_yo_ulkomailla_osuus]
,[op_yo_muualla_osuus]
,[op_yo_avoimessa_osuus]
,[op_yo_muu_yo_osuus]
,[op_yo_ammattikorkeakouluissa_osuus]
,[op_yo_ei_oma_yo_yht_osuus]

,[ika19_21_lkm]
,[ika20_24_lkm]
,[ika25_34_lkm]
,[ika25_64_lkm]

FROM (
SELECT [tilastointivuosi] as Tilastovuosi
	  ,aineisto_id
	  ,aineisto_OTV_id
	  ,aidinkieli_versio1_id
	  ,aidinkieli_versio2_id = '-1'
	  ,kotikunta_id
	  ,kotikunta1x_id
	  ,kotikunta2x_id
	  ,sukupuoli_id
	  ,ika_id
	  ,syntymavuosi_id
	  ,syntymakuukausi_id = '-1'
	  ,tutkinto_amk_id
	  ,tutkinto_yo_id
	  ,koulutustyyppi_id
	  ,kansalaisuus_versio2_id
	  ,kansalaisuus_versio1_id = -1
	  ,kvopisk_id
	  ,suormaa_id
	  ,oppilaitos_id
	  ,oppilaitos_historia_id
	  ,oppilaitos
	  ,koulutuksen_jarjestaja_id
	  ,koulutuksen_jarjestaja_historia_id
	  ,lahde_id
	  ,koulutusohjelma_amk_id
	  ,opiskelijan_olo_syys_id
	  ,opiskelijan_olo_tamm_id
	  ,rahoituslahde_id
	  ,suuntautumisvaihtoehto_amk_id
	  ,koulutuksen_kieli_id
	  ,ensisijainen_opintooikeus_id
	  ,tilauskoulutuksen_sijaintimaa_id
	  ,koulutussektori_id
	  ,opetushallinnon_koulutus_id
	  ,koulutusluokitus_id
	  ,koulutusluokitus
	  ,koulutuslaji_OKM_id
	  ,koulutuksen_kunta_id
	  ,koulutuksen_jarjestaja_kunta_id
	  ,oppilaitos_kunta_id
	  ,kirjoihintulovuosi_id
	  ,kirjoihintulokausi_id
	  ,kirjoihintulovuosi_korkeakoulusektori_id
	  ,kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id
	  ,kirjoihintulovuosi_sektori_id
	  ,kirjoihintulovuosi_sektori_lasnaoleva_id
	  ,kirjoihintulovuosi_korkeakoulu_id
	  ,kirjoihintulokausi_korkeakoulu_id = '-1'
	  ,kirjoihintulovuosi_korkeakoulu_lasnaoleva_id
	  ,kirjoihintulovuosi_opintoala_id
	  ,kirjoihintulovuosi_opintoala_lasnaoleva_id
	  ,kirjoihintulovuosi_tutkinto_id
	  ,kirjoihintulokausi_tutkinto_id
	  ,vahintaan_55_op_suorittanut_id
	  ,opiskelijan_fte_tieto_id
	  --,opiskelumuoto_id
	  ,yliopisto_id
	  ,tiedekunta_yo_id
	  ,uusi_vanha_opiskelija_id
	  ,opettajankelpoisuus_id
	  ,avoinvayla_id
	  ,tutkinnon_suoritusvuosi_id = '-1'
	  ,tutkinnon_suorituslukukausi_id = '-1'
	  ,tutkinnon_suorituskuukausi_id = '-1'
	  ,tutkintooikeusvuosi_id
	  ,maanosa_id = -1
	  ,pohjoismaa_id = -1
	  ,eumaa_id = -1
	  ,etamaa_id = -1
	  ,tieteenala_id
	  ,[opiskelijat] as Opisk2
	  ,[aloittaneet] as Aloit2
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
	  ,[Tutk2] = NULL
	  ,[op_amk_yhteensa] = NULL
	  ,[op_amk_yleissiv_amm_opplait] = NULL
	  ,[op_amk_muualla] = NULL
	  ,[op_amk_oma_amk] = NULL
	  ,[op_amk_muu_amk] = NULL
	  ,[op_amk_yliopistoissa] = NULL
	  ,[op_amk_ulkomailla] = NULL
	  ,[op_yo_yhteensa] = NULL
	  ,[op_yo_ulkomailla] = NULL
	  ,[op_yo_muualla] = NULL
	  ,[op_yo_oma_yo] = NULL
	  ,[op_yo_avoimessa] = NULL
	  ,[op_yo_muu_yo] = NULL
	  ,[op_yo_ammattikorkeakouluissa] = NULL

	  ,[op_yo_ulkomailla_osuus] = null
	  ,[op_yo_muualla_osuus] = null
	  ,[op_yo_avoimessa_osuus] = null
	  ,[op_yo_muu_yo_osuus] = null
	  ,[op_yo_ammattikorkeakouluissa_osuus] = null
      ,[op_yo_ei_oma_yo_yht_osuus] = null

	  ,[ika19_21_lkm] = NULL
	  ,[ika20_24_lkm] = NULL
	  ,[ika25_34_lkm] = NULL
	  ,[ika25_64_lkm] = NULL
	  ,[erikoislaakarikoulutus_id]
	  ,[liikkuvuuden_kesto_id] = -1
  FROM [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]

UNION ALL

SELECT [tilastointivuosi] as Tilastovuosi
	  ,aineisto_id
	  ,aineisto_OTV_id
	  ,aidinkieli_versio1_id
	  ,aidinkieli_versio2_id = '-1'
	  ,kotikunta_id
	  ,kotikunta1x_id
	  ,kotikunta2x_id = -1
	  ,sukupuoli_id
	  ,ika_id
	  ,syntymavuosi_id
	  ,syntymakuukausi_id = '-1'
	  ,tutkinto_amk_id
	  ,tutkinto_yo_id
	  ,koulutustyyppi_id
	  ,kansalaisuus_versio2_id
	  ,kansalaisuus_versio1_id = -1
	  ,kvopisk_id
	  ,suormaa_id
	  ,oppilaitos_id
	  ,oppilaitos_historia_id
	  ,oppilaitos
	  ,koulutuksen_jarjestaja_id
	  ,koulutuksen_jarjestaja_historia_id
	  ,lahde_id
	  ,koulutusohjelma_amk_id
	  ,opiskelijan_olo_syys_id = -1
	  ,opiskelijan_olo_tamm_id = -1
	  ,rahoituslahde_id
	  ,suuntautumisvaihtoehto_amk_id
	  ,koulutuksen_kieli_id
	  ,ensisijainen_opintooikeus_id = -1
	  ,tilauskoulutuksen_sijaintimaa_id
	  ,koulutussektori_id
	  ,opetushallinnon_koulutus_id
	  ,koulutusluokitus_id
	  ,koulutusluokitus
	  ,koulutuslaji_OKM_id
	  ,koulutuksen_kunta_id
	  ,koulutuksen_jarjestaja_kunta_id
	  ,oppilaitos_kunta_id
	  ,kirjoihintulovuosi_id
	  ,kirjoihintulokausi_id
	  ,kirjoihintulovuosi_korkeakoulusektori_id
	  ,kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id
	  ,kirjoihintulovuosi_sektori_id
	  ,kirjoihintulovuosi_sektori_lasnaoleva_id
	  ,kirjoihintulovuosi_korkeakoulu_id
	  ,kirjoihintulokausi_korkeakoulu_id = '-1'
	  ,kirjoihintulovuosi_korkeakoulu_lasnaoleva_id
	  ,kirjoihintulovuosi_opintoala_id
	  ,kirjoihintulovuosi_opintoala_lasnaoleva_id
	  ,kirjoihintulovuosi_tutkinto_id
	  ,kirjoihintulokausi_tutkinto_id
	  ,vahintaan_55_op_suorittanut_id = -1
	  ,opiskelijan_fte_tieto_id = -1
	  --,opiskelumuoto_id
	  ,yliopisto_id = -1
	  ,tiedekunta_yo_id
	  ,uusi_vanha_opiskelija_id = -1
	  ,opettajankelpoisuus_id
	  ,avoinvayla_id = -1
	  ,tutkinnon_suoritusvuosi_id
	  ,tutkinnon_suorituslukukausi_id
	  ,tutkinnon_suorituskuukausi_id = '-1'
	  ,tutkintooikeusvuosi_id = '-1'
	  ,maanosa_id = -1
	  ,pohjoismaa_id = -1
	  ,eumaa_id = -1
	  ,etamaa_id = -1
	  ,tieteenala_id
	  ,[Opisk2] = NULL
	  ,[Aloit2] = NULL
	  ,[lkm_op0] = NULL
	  ,[lkm_op1_14] = NULL
	  ,[lkm_op15_29] = NULL
	  ,[lkm_op30_44] = NULL
	  ,[lkm_op45_59] = NULL
	  ,[lkm_op60_74] = NULL
	  ,[lkm_op75_89] = NULL
	  ,[lkm_op90_104] = NULL
	  ,[lkm_op105_119] = NULL
	  ,[lkm_op120_] = NULL
	  ,[aloittaneet_kirjoihintulovuosi] = NULL
	  ,[aloittaneet_korkeakoulusektori] = NULL
	  ,[aloittaneet_korkeakoulusektori_lasnaoleva] = NULL
	  ,[aloittaneet_sektori] = NULL
	  ,[aloittaneet_sektori_lasnaoleva] = NULL
	  ,[aloittaneet_korkeakoulu] = NULL
	  ,[aloittaneet_korkeakoulu_lasnaoleva] = NULL
	  ,[aloittaneet_opintoala] = NULL
	  ,[aloittaneet_opintoala_lasnaoleva] = NULL
	  ,[opiskelijat_lasna] = NULL
	  ,[opiskelijat_fte] = NULL
	  ,[lkm_lasnalk]
	  ,[lkm_poissalk]
	  ,[op_suoritettavien_laajuus]
	  ,[op_edellinen_syksy] = NULL
	  ,[op_edellinen_kevat] = NULL
	  ,[op_kertyma_edel_lkv_loppu] = NULL
	  ,[lukumaara] as Tutk2
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

	  ,[op_yo_ulkomailla_osuus] = case when op_yo_yhteensa = 0 then 0.0 when op_yo_yhteensa is null then null else cast((cast(op_yo_ulkomailla as decimal) / cast(op_yo_yhteensa as decimal)) as decimal(10,7)) end
	  ,[op_yo_muualla_osuus] = case when op_yo_yhteensa = 0 then 0.0 when op_yo_yhteensa is null then null else cast((cast(op_yo_muualla as decimal) / cast(op_yo_yhteensa as decimal)) as decimal(10,7)) end
	  ,[op_yo_avoimessa_osuus] = case when op_yo_yhteensa = 0 then 0.0 when op_yo_yhteensa is null then null else cast((cast(op_yo_avoimessa as decimal) / cast(op_yo_yhteensa as decimal)) as decimal(10,7)) end
	  ,[op_yo_muu_yo_osuus] = case when op_yo_yhteensa = 0 then 0.0 when op_yo_yhteensa is null then null else cast((cast(op_yo_muu_yo as decimal) / cast(op_yo_yhteensa as decimal)) as decimal(10,7)) end
	  ,[op_yo_ammattikorkeakouluissa_osuus] = case when op_yo_yhteensa = 0 then 0.0 when op_yo_yhteensa is null then null else cast((cast(op_yo_ammattikorkeakouluissa as decimal) / cast(op_yo_yhteensa as decimal)) as decimal(10,7)) end
	  ,[op_yo_ei_oma_yo_yht_osuus] = case when op_yo_yhteensa = 0 then 0.0 when op_yo_yhteensa is null then null else cast((cast((op_yo_ulkomailla + op_yo_muualla + op_yo_avoimessa + op_yo_muu_yo + op_yo_ammattikorkeakouluissa) as decimal) / cast(op_yo_yhteensa as decimal)) as decimal(10,7)) end	 

	  ,[ika19_21_lkm] = NULL
	  ,[ika20_24_lkm] = NULL
	  ,[ika25_34_lkm] = NULL
	  ,[ika25_64_lkm] = NULL
	  ,[erikoislaakarikoulutus_id]
	  ,[liikkuvuuden_kesto_id]
  FROM [dbo].[f_OTV_2_9_Korkeakoulututkinnot]

UNION ALL

SELECT [tilastointivuosi] as Tilastovuosi
	  ,aineisto_id
	  ,aineisto_OTV_id
	  ,aidinkieli_versio1_id = -1
	  ,aidinkieli_versio2_id
	  ,kotikunta_id
	  ,kotikunta1x_id = -1
	  ,kotikunta2x_id = -1
	  ,sukupuoli_id
	  ,ika_id = '-1'
	  ,syntymavuosi_id = '-1'
	  ,syntymakuukausi_id = '-1'
	  ,tutkinto_amk_id = -1
	  ,tutkinto_yo_id = -1
	  ,koulutustyyppi_id = -1
	  ,kansalaisuus_versio2_id = -1
	  ,kansalaisuus_versio1_id
	  ,kvopisk_id = -1
	  ,suormaa_id = -1
	  ,oppilaitos_id = -1
	  ,oppilaitos_historia_id = -1
	  ,oppilaitos = -1
	  ,koulutuksen_jarjestaja_id = -1
	  ,koulutuksen_jarjestaja_historia_id = -1
	  ,lahde_id = -1
	  ,koulutusohjelma_amk_id = -1
	  ,opiskelijan_olo_syys_id = -1
	  ,opiskelijan_olo_tamm_id = -1
	  ,rahoituslahde_id = -1
	  ,suuntautumisvaihtoehto_amk_id = -1
	  ,koulutuksen_kieli_id = -1
	  ,ensisijainen_opintooikeus_id = -1
	  ,tilauskoulutuksen_sijaintimaa_id = -1
	  ,koulutussektori_id = -1
	  ,opetushallinnon_koulutus_id = -1
	  ,koulutusluokitus_id = -1
	  ,koulutusluokitus = -1
	  ,koulutuslaji_OKM_id = -1
	  ,koulutuksen_kunta_id = -1
	  ,koulutuksen_jarjestaja_kunta_id = -1
	  ,oppilaitos_kunta_id = -1
	  ,kirjoihintulovuosi_id = '-1'
	  ,kirjoihintulokausi_id = '-1'
	  ,kirjoihintulovuosi_korkeakoulusektori_id = '-1'
	  ,kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id = '-1'
	  ,kirjoihintulovuosi_sektori_id = '-1'
	  ,kirjoihintulovuosi_sektori_lasnaoleva_id = '-1'
	  ,kirjoihintulovuosi_korkeakoulu_id = '-1'
	  ,kirjoihintulokausi_korkeakoulu_id = '-1'
	  ,kirjoihintulovuosi_korkeakoulu_lasnaoleva_id = '-1'
	  ,kirjoihintulovuosi_opintoala_id = '-1'
	  ,kirjoihintulovuosi_opintoala_lasnaoleva_id = '-1'
	  ,kirjoihintulovuosi_tutkinto_id = '-1'
	  ,kirjoihintulokausi_tutkinto_id = '-1'
	  ,vahintaan_55_op_suorittanut_id = -1
	  ,opiskelijan_fte_tieto_id = -1
	  --,opiskelumuoto_id = -1
	  ,yliopisto_id = -1
	  ,tiedekunta_yo_id = -1
	  ,uusi_vanha_opiskelija_id = -1
	  ,opettajankelpoisuus_id = -1
	  ,avoinvayla_id = -1
	  ,tutkinnon_suoritusvuosi_id = '-1'
	  ,tutkinnon_suorituslukukausi_id = '-1'
	  ,tutkinnon_suorituskuukausi_id = '-1'
	  ,tutkintooikeusvuosi_id = '-1'
	  ,maanosa_id
	  ,pohjoismaa_id
	  ,eumaa_id
	  ,etamaa_id
	  ,tieteenala_id = -1
	  ,[Opisk2] = NULL
	  ,[Aloit2] = NULL
	  ,[lkm_op0] = NULL
	  ,[lkm_op1_14] = NULL
	  ,[lkm_op15_29] = NULL
	  ,[lkm_op30_44] = NULL
	  ,[lkm_op45_59] = NULL
	  ,[lkm_op60_74] = NULL
	  ,[lkm_op75_89] = NULL
	  ,[lkm_op90_104] = NULL
	  ,[lkm_op105_119] = NULL
	  ,[lkm_op120_] = NULL
	  ,[aloittaneet_kirjoihintulovuosi] = NULL
	  ,[aloittaneet_korkeakoulusektori] = NULL
	  ,[aloittaneet_korkeakoulusektori_lasnaoleva] = NULL
	  ,[aloittaneet_sektori] = NULL
	  ,[aloittaneet_sektori_lasnaoleva] = NULL
	  ,[aloittaneet_korkeakoulu] = NULL
	  ,[aloittaneet_korkeakoulu_lasnaoleva] = NULL
	  ,[aloittaneet_opintoala] = NULL
	  ,[aloittaneet_opintoala_lasnaoleva] = NULL
	  ,[opiskelijat_lasna] = NULL
	  ,[opiskelijat_fte] = NULL
	  ,[lkm_lasnalk] = NULL
	  ,[lkm_poissalk] = NULL
	  ,[op_suoritettavien_laajuus] = NULL
	  ,[op_edellinen_syksy] = NULL
	  ,[op_edellinen_kevat] = NULL
	  ,[op_kertyma_edel_lkv_loppu] = NULL
	  ,[Tutk2] = NULL
	  ,[op_amk_yhteensa] = NULL
	  ,[op_amk_yleissiv_amm_opplait] = NULL
	  ,[op_amk_muualla] = NULL
	  ,[op_amk_oma_amk] = NULL
	  ,[op_amk_muu_amk] = NULL
	  ,[op_amk_yliopistoissa] = NULL
	  ,[op_amk_ulkomailla] = NULL
	  ,[op_yo_yhteensa] = NULL
	  ,[op_yo_ulkomailla] = NULL
	  ,[op_yo_muualla] = NULL
	  ,[op_yo_oma_yo] = NULL
	  ,[op_yo_avoimessa] = NULL
	  ,[op_yo_muu_yo] = NULL
	  ,[op_yo_ammattikorkeakouluissa] = NULL

	  ,[op_yo_ulkomailla_osuus] = null
	  ,[op_yo_muualla_osuus] = null
	  ,[op_yo_avoimessa_osuus] = null
	  ,[op_yo_muu_yo_osuus] = null
	  ,[op_yo_ammattikorkeakouluissa_osuus] = null
      ,[op_yo_ei_oma_yo_yht_osuus] = null

	  ,[ika19_21_lkm]
	  ,[ika20_24_lkm]
	  ,[ika25_34_lkm]
	  ,[ika25_64_lkm]
	  ,[d_erikoislaakarikoulutus] = -1
	  ,[liikkuvuuden_kesto_id] = -1
  FROM [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]

  ) f
	LEFT JOIN [dbo].d_lahde d10 ON d10.id = f.lahde_id 
	LEFT JOIN [dbo].d_aineisto d1 ON d1.id = f.aineisto_id
	LEFT JOIN [dbo].d_aineisto_OTV d1b ON d1b.id = f.aineisto_OTV_id
	LEFT JOIN [dbo].d_aidinkieli_versio1 d2 ON d2.id = f.aidinkieli_versio1_id
	LEFT JOIN [dbo].d_aidinkieli_versio2 d2b ON d2b.id = f.aidinkieli_versio2_id
	LEFT JOIN [dbo].d_alueluokitus d3 ON d3.id = f.kotikunta_id
	LEFT JOIN [dbo].d_alueluokitus d3b ON d3b.id = f.kotikunta1x_id
	LEFT JOIN [dbo].d_alueluokitus d3c ON d3c.id = f.kotikunta2x_id
	LEFT JOIN [dbo].d_sukupuoli d4 ON d4.id = f.sukupuoli_id
	LEFT JOIN [dbo].d_ika d5 ON d5.id = f.ika_id
	LEFT JOIN [dbo].d_kausi d5b ON d5b.kausi_id = f.syntymavuosi_id
	LEFT JOIN [dbo].d_kausi d5c ON d5c.kausi_id = f.syntymakuukausi_id
	LEFT JOIN [dbo].d_tutkinto_amk d6a ON d6a.id = f.tutkinto_amk_id
	LEFT JOIN [dbo].d_tutkinto_yo d6b ON d6b.id = f.tutkinto_yo_id
	LEFT JOIN [dbo].d_koulutustyyppi d7 ON d7.id = f.koulutustyyppi_id
	-- Piilotetaan ennakkoaineiston kansalaisuus
	LEFT JOIN [dbo].d_kansalaisuus_versio2 d8 ON d8.id = case when d1.aineisto_koodi = 'E' then '-1' else f.kansalaisuus_versio2_id end
	LEFT JOIN [dbo].d_kansalaisuus_versio1 d8b ON d8b.id = f.kansalaisuus_versio1_id
	-- Näytetään ennakkoaineiston kansalaisuus
	LEFT JOIN [dbo].d_kansalaisuus_versio2 d8c ON d8c.id = f.kansalaisuus_versio2_id
	LEFT JOIN [dbo].d_oppilaitoksen_taustatiedot d9 ON d9.id = f.oppilaitos_id
	LEFT JOIN [dbo].d_oppilaitoksen_taustatiedot d9b ON d9b.id = f.koulutuksen_jarjestaja_id	
	LEFT JOIN [dbo].d_oppilaitoksen_taustatiedot_historia d9c ON d9c.id = f.oppilaitos_historia_id
	LEFT JOIN [dbo].d_oppilaitoksen_taustatiedot_historia d9d ON d9d.id = f.koulutuksen_jarjestaja_historia_id
	LEFT JOIN [dbo].d_koulutusohjelma_amk d11 ON d11.id = f.koulutusohjelma_amk_id
	LEFT JOIN [dbo].d_opiskelijan_olo d12 ON d12.id = f.opiskelijan_olo_syys_id
	LEFT JOIN [dbo].d_opiskelijan_olo_tamm d12b ON d12b.id = f.opiskelijan_olo_tamm_id
	LEFT JOIN [dbo].d_rahoituslahde d13 ON d13.id = f.rahoituslahde_id
	LEFT JOIN [dbo].d_suuntautumisvaihtoehto_amk d15 ON d15.id = f.suuntautumisvaihtoehto_amk_id
	LEFT JOIN [dbo].d_kieli d16 ON d16.id = f.koulutuksen_kieli_id
	LEFT JOIN [dbo].d_ensisijainen_opintooikeus d17 ON d17.id = f.ensisijainen_opintooikeus_id
	LEFT JOIN [dbo].d_tilauskoulutuksen_sijaintimaa d18 ON d18.id = f.tilauskoulutuksen_sijaintimaa_id
	LEFT JOIN [dbo].d_koulutussektori d19 ON d19.id = f.koulutussektori_id
	LEFT JOIN [dbo].d_opetushallinnon_koulutus d20 ON d20.id = f.opetushallinnon_koulutus_id
	LEFT JOIN [dbo].d_koulutusluokitus d21 ON d21.id = f.koulutusluokitus_id
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d21a on d21a.koulutusluokitus_koodi = f.koulutusluokitus
	LEFT JOIN [dbo].d_koulutuslaji_okm d21b ON d21b.id = f.koulutuslaji_OKM_id
	LEFT JOIN [dbo].d_alueluokitus d22 ON d22.id = f.koulutuksen_kunta_id
	LEFT JOIN [dbo].d_alueluokitus d22b ON d22b.id = f.koulutuksen_jarjestaja_kunta_id
	LEFT JOIN [dbo].d_alueluokitus d22c ON d22c.id = f.oppilaitos_kunta_id
	LEFT JOIN [dbo].d_kausi d23 ON d23.kausi_id = f.kirjoihintulovuosi_id
	LEFT JOIN [dbo].d_kausi d23b ON d23b.kausi_id = f.kirjoihintulokausi_id
	LEFT JOIN [dbo].d_kausi d24b ON d24b.kausi_id = f.kirjoihintulovuosi_korkeakoulusektori_id
	LEFT JOIN [dbo].d_kausi d24c ON d24c.kausi_id = f.kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id
	LEFT JOIN [dbo].d_kausi d24d ON d24d.kausi_id = f.kirjoihintulovuosi_sektori_id
	LEFT JOIN [dbo].d_kausi d24e ON d24e.kausi_id = f.kirjoihintulovuosi_sektori_lasnaoleva_id
	LEFT JOIN [dbo].d_kausi d24f ON d24f.kausi_id = f.kirjoihintulovuosi_korkeakoulu_id
	LEFT JOIN [dbo].d_kausi d24f2 ON d24f2.kausi_id = f.kirjoihintulokausi_korkeakoulu_id
	LEFT JOIN [dbo].d_kausi d24g ON d24g.kausi_id = f.kirjoihintulovuosi_korkeakoulu_lasnaoleva_id
	LEFT JOIN [dbo].d_kausi d24h ON d24h.kausi_id = f.kirjoihintulovuosi_opintoala_id
	LEFT JOIN [dbo].d_kausi d24i ON d24i.kausi_id = f.kirjoihintulovuosi_opintoala_lasnaoleva_id
	LEFT JOIN [dbo].d_kausi d24j ON d24j.kausi_id = f.kirjoihintulovuosi_tutkinto_id
	LEFT JOIN [dbo].d_kausi d24k ON d24k.kausi_id = f.kirjoihintulokausi_tutkinto_id
	LEFT JOIN [dbo].d_kausi d24l ON d24l.kausi_id = f.tutkintooikeusvuosi_id
	LEFT JOIN [dbo].d_vahintaan_55_op_suorittanut d28 ON d28.id = f.vahintaan_55_op_suorittanut_id
	LEFT JOIN [dbo].d_opiskelijan_fte_tieto d29 ON d29.id = f.opiskelijan_fte_tieto_id
	--LEFT JOIN [dbo].d_opiskelumuoto d30 ON d30.id = f.opiskelumuoto_id
	LEFT JOIN [dbo].d_yliopisto d31 ON d31.id = f.yliopisto_id
	LEFT JOIN [dbo].d_tiedekunta_yo d32 ON d32.id = f.tiedekunta_yo_id
	LEFT JOIN [dbo].d_uusi_vanha_opiskelija d33 ON d33.id = f.uusi_vanha_opiskelija_id
	--LEFT JOIN [dbo].d_kausi d34 ON d34.kausi_id = f.tutkintooikeusvuosi_id
	LEFT JOIN [dbo].d_opettajankelpoisuus d35 ON d35.id = f.opettajankelpoisuus_id
	LEFT JOIN [dbo].d_avoinvayla d36 ON d36.id = f.avoinvayla_id
	LEFT JOIN [dbo].d_kausi d37 ON d37.kausi_id = f.tutkinnon_suoritusvuosi_id
	LEFT JOIN [dbo].d_kausi d38 ON d38.kausi_id = f.tutkinnon_suorituslukukausi_id
	LEFT JOIN [dbo].d_kausi d39 ON d39.kausi_id = f.tutkinnon_suorituskuukausi_id
	LEFT JOIN [dbo].d_valtio d40 ON d40.id = f.maanosa_id
	LEFT JOIN [dbo].d_valtio d41 ON d41.id = f.eumaa_id
	LEFT JOIN [dbo].d_valtio d42 ON d42.id = f.etamaa_id
	LEFT JOIN [dbo].d_pohjoismaa d43 ON d43.id = f.pohjoismaa_id
	LEFT JOIN [dbo].d_tieteenala d44 ON d44.id = f.tieteenala_id
	LEFT JOIN [dbo].d_erikoislaakarikoulutus d45 ON d45.id = f.erikoislaakarikoulutus_id
	LEFT JOIN [dbo].d_kvopiskelija d46 ON d46.id = f.kvopisk_id
	LEFT JOIN [dbo].d_liikkuvuuden_kesto d47 ON d47.id = f.liikkuvuuden_kesto_id
	LEFT JOIN [dbo].d_eu_etamaat d48 ON d48.id = f.suormaa_id

WHERE 
/*
d1.aineisto_koodi=
(case
	when d1b.aineisto like '2.8%' then (case when NOT EXISTS (SELECT 1 FROM [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] o WHERE o.lahde = '51' and o.aineisto='L' and o.tilastointivuosi=f.Tilastovuosi) then 'E' else 'L' end)
	when d1b.aineisto like '2.9%' then (case when NOT EXISTS (SELECT 1 FROM [dbo].[f_OTV_2_9_Korkeakoulututkinnot] o WHERE o.lahde = '52' and o.aineisto='L' and o.tilastointivuosi=f.Tilastovuosi) then 'E' else 'L' end)
	else '-1'
end
)
--(d1.aineisto_koodi in ('L','-1') OR (d1.aineisto_koodi='E' and Tilastovuosi=2016))
AND */
d10.lahde_koodi in ('-1','51','52') AND d9.oppilaitoskoodi NOT IN ('02557','10031','02358')



GO


