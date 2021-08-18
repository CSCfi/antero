USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_ulkomaalaiset_ulk_ja_vieraskieliset_yhteiset]    Script Date: 10.8.2021 16:10:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_tab_ulkomaalaiset_ulk_ja_vieraskieliset_yhteiset] AS

SELECT
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
,d55.koulutusryhma as 'Koulutusryhmä'
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
,d21.Koulutusaste_taso2_koodi as 'Koodit Koulutusaste, taso 2'
,d21.iscle2011_koodi as 'Koodit Koulutusaste, taso 1'
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
,d55.koulutusryhma_SV as 'Utbildningsgrupp'
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


/*** ENGLANTI ***/

,tilastovuosi as 'Statistical year'
--,d20.opetushallinnon_koulutus_EN as 'Administrative sector'
,d20b.hallinnonala_EN as 'Administrative sector'
,d4.sukupuoli_EN as Gender
,d5b.ika5v_EN as 'Age group'
,d55.koulutusryhma_EN as 'Education group'
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
      ,[ika_5v_id]
	  ,ika_5v_id as ikaryhma1_id

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
      ,[ika_5v_id]
	  ,ika_5v_id as ikaryhma1_id
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

	--lääkärien erikoistumiskoulutus 2015- poistetaan rajausehdossa
      ,[aloittaneet] = 
		case 
			when koulutusluokitus not like '8%' and koulutusluokitus not in ('775101','775201') 
			then aloittaneet 
			else 0 
		end 
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
  WHERE NOT erikoislaakarikoulutus_id IN (1, 2) --2015- otv

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

	--lääkärien erikoistumiskoulutus 2015- poistetaan rajausehdossa
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
   WHERE NOT erikoislaakarikoulutus_id IN (1, 2) --2015- otv

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
AND NOT (d5c.ika_avain in ('-1','ikaryh2_12', 'ikaryh2_15', 'ikaryh2_18') AND d19.koulutussektori_koodi IN ('4', '5') ) -- rajataan korkeakoulupuolelta nuoremmat ikäryhmä2:t pois pois, koska muuttujaa käytetään vain korkeakouluraportoinnissa
AND NOT (d21.iscfibroad2013_koodi = '99' AND d19.koulutussektori_koodi IN ('4', '5')) -- rajataan muu koulutus pois kk-puolelta

GO


