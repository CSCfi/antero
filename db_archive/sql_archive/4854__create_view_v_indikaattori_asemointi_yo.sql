USE [ANTERO]
GO

/****** Object:  View [dw].[v_indikaattori_asemointi_yo]    Script Date: 15.9.2021 9:24:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dw].[v_indikaattori_asemointi_yo] as

/****** Korkeakoulututkinnot ******/
SELECT
	[tilastointivuosi] as 'Tilastovuosi'
	  ,Null as 'Aloituslukuvuosi (läpäisy)' 
      ,d50.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]= case when d50.oppilaitostyyppi_koodi = '42' then 'Yliopisto' when d50.oppilaitostyyppi_koodi = '41' then 'Ammattikorkeakoulu' end 
	  --d50.organisaatio_fi in ('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto', 'Lappeenrannan-Lahden teknillinen yliopisto') 
	  , d2.koulutus as 'Koulutusnimike'
	  , d2.koulutusaste2002 as 'Koulutusaste 2002'
	  , d2.OKM_ohjauksen_ala 'OKM ohjauksen ala'
	  , d2.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala, yo 2017-2020'
	  , d2.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala, amk'
	  , d2.OKM_ohjauksen_ala_yo_tav2021 as 'Rahoitusmalliala, yo 2021-2024'
	  , d2.iscle2011 as 'Koulutusaste, taso 1'
	  , d2.Koulutusaste_taso2 'Koulutusaste, taso 2'
	  , d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , d2.iscfi2013 as 'Koulutusala, taso 3'
	  , NULL as 'Tutkinnon aloitussykli'
	  , RIGHT(d90.paatieteenala2010,LEN(d90.paatieteenala2010)-CHARINDEX(' ',d90.paatieteenala2010)) as 'Päätieteenala'
	  , RIGHT(d90.tieteenala2010,LEN(d90.tieteenala2010)-CHARINDEX(' ',d90.tieteenala2010)) as 'Tieteenala'
	  , d90.tieteenala_avain as 'Tieteenala_avain'
	  , null as 'Tutkijanuravaihe'
      ,d20.kunta as 'Kunta'
      ,d3.[kansalaisuus_versio2] as 'Kansalaisuus'
      ,[tutkinnot]
	  ,NULL as 'Opiskelijat'
	  ,NULL as 'Opiskelijat_fte'
	  ,NULL as 'Opiskelijat_lasna'
	  ,NULL AS 'Yo 7v aloittaneet lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat (55op)'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS '1-14op suorittaneet' --lkm_op1_14
	  ,NULL AS 'Yliopiston opetus- ja tutkimushenkilötyövuodet'
	  ,NULL AS 'IV tutkijanuraportaan henkilötyövuodet'
	  ,NULL AS 'Ammattikorkeakoulun opetushenkilökunta'
	  ,NULL AS 'Ammattikorkeakoulun TKI-henkilökunta'
	  ,null as 'JulkaisuID'
	  ,null as 'Jufotaso'
	  ,NULL AS 'AMK Julkaisut (A-E)'
	  ,NULL AS 'AMK julkaisut (F ja I)'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,NULL AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ,NULL AS 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL AS 'ulkom_hyv_luetut_op_lkm'
	  ,NULL AS 'erilopintooik_op_lkm'
	  ,NULL AS 'avoinamk_op_amk_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL AS 'erikoul_suor_op_lkm'
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,null as 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'
	  ,null AS 'Kandikyselyn pistemäärä'
	  ,null AS 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'
	  ,NULL as 'Osallistuminen huippuyksik.'
	  ,NULL as 'Akatemia profesuurit'
	  ,NULL as 'erc,stg,cog ja adg'
	  , d2.OKM_ohjauksen_ala_koodi as 'Koodit OKM ohjauksen ala'
	  , d2.koulutus_koodi as 'Koodit Koulutusnimike'
	  , d50.organisaatio_koodi as 'Koodit organisaatio'
	  , d20.kunta_koodi as 'Koodit kunta'
  	  , case when d2.jarjestys_iscle2011='ööö' then null else d2.jarjestys_iscle2011 end as 'jarj. koulutusaste, taso 1'
  	  , case when d2.jarjestys_Koulutusaste_taso2='ööö' then null else d2.jarjestys_Koulutusaste_taso2 end as 'jarj. koulutusaste, taso 2'
	  , d2.jarjestys_OKM_ohjauksen_ala as 'jarj. OKM ohjauksen ala'
	  , d2.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d2.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo 2017-2020'
	  , d2.jarjestys_OKM_ohjauksen_ala_yo_tav2021 as 'jarj. rahoitusmalliala yo 2021-2024'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  , NULL as 'toimipiste_id'
	  , NULL as 'hakukohde_id'
	  , NULL as 'alpa'
 FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
 left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on oppilaitos_id = d1.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.oppilaitoskoodi 
 left join VipunenTK.dbo.d_koulutusluokitus as d2 on koulutusluokitus_id = d2.id
 left join VipunenTK.dbo.d_kansalaisuus_versio2 as d3 on kansalaisuus_versio2_id = d3.id
 left join VipunenTK.dbo.d_alueluokitus as d20 on [koulutuksen_kunta]=d20.kunta_koodi
 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=f.koulutusluokitus
 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
 Where (aineisto = 'L' or (aineisto = 'E' and tilastointivuosi=YEAR(GETDATE())-1)) and tilastointivuosi>2010 AND koulutusaste2002_koodi in ('62','71','63','72','82') and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717', '02557') and d50.oppilaitostyyppi_koodi = '42'


 union all
/****** Läpäisy ******/
 SELECT  
		case when tarkastelujakso='7,5' and lukukausi='1' then d10.vuosiselite+7 When  tarkastelujakso='7,5' and lukukausi='2' then d10.vuosiselite+8
			When  tarkastelujakso='5,5' and lukukausi='1' then d10.vuosiselite+5 When  tarkastelujakso='5,5' and lukukausi='2' then d10.vuosiselite+6
			end as 'Tilastovuosi'
	  ,d10.lukuvuosi as 'Aloituslukuvuosi (läpäisy)' 
      ,d50.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]= case when d50.oppilaitostyyppi_koodi = '42' then 'Yliopisto' when d50.oppilaitostyyppi_koodi = '41' then 'Ammattikorkeakoulu' end 
	  --d50.organisaatio_fi in ('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto', 'Lappeenrannan-Lahden teknillinen yliopisto') 
	  , d2.koulutus as 'Koulutusnimike'
	  , d2.koulutusaste2002
	  , d2.OKM_ohjauksen_ala
	  , d2.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala, yo 2017-2020'
	  , d2.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala, amk'
	  , d2.OKM_ohjauksen_ala_yo_tav2021 as 'Rahoitusmalliala, yo 2021-2024'
	  , d2.iscle2011 as 'Koulutusaste, taso1'
	  , d2.Koulutusaste_taso2
	  , d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , d2.iscfi2013 as 'Koulutusala, taso 3'
	  , NULL as 'Tutkinnon aloitussykli'
	  , RIGHT(d90.paatieteenala2010,LEN(d90.paatieteenala2010)-CHARINDEX(' ',d90.paatieteenala2010)) as 'Päätieteenala'
	  , RIGHT(d90.tieteenala2010,LEN(d90.tieteenala2010)-CHARINDEX(' ',d90.tieteenala2010)) as 'Tieteenala'
	  , d90.tieteenala_avain as 'Tieteenala_avain'
	  , null as 'Tutkijanuravaihe'
      ,NULL as 'koulutuksen_kunta'
      ,NULL as 'kansalaisuus_versio2'
      ,NULL as 'tutkinnot'
	  ,NULL as 'Opiskelijat'
	  ,NULL as 'Opiskelijat_fte'
	  ,NULL as 'Opiskelijat_lasna'
	  ,case when tarkastelujakso='7,5' and (d6.koulutuslaji2_koodi='51b'  OR (d2.koulutus_koodi in (612101, 613101,613401,672401,634101))) then f.lkm_int else 0 end AS 'YO_7v_aloittaneet_lkm'
	  ,case when tarkastelujakso='5,5' AND d2.koulutusaste2002_koodi=62 then f.lkm_int else 0 end AS 'AMK_5v_Aloittaneet_lkm'
	  ,case when tarkastelujakso='7,5' and (d6.koulutuslaji2_koodi='51b'  OR (d2.koulutus_koodi in (612101, 613101,613401,672401,634101))) and [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]='Tutkinto alkuperäisessä tutkintolajissa' then f.lkm_int else 0 end AS '7v_suorittaneet_lkm'
	  ,case when tarkastelujakso='5,5' AND d2.koulutusaste2002_koodi=62 and [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]='Tutkinto alkuperäisessä tutkintolajissa' then f.lkm_int else 0 end AS '5v_suorittaneet_lkm'
	  ,NULL as 'lasna'
	  ,NULL as 'suorittanut55'
	  ,NULL as 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL as 'lkm_op1_14'
	  ,NULL as 'opetus- tutkimushenkilökunta HTV'
	  ,NULL as 'IV porras HTV'
	  ,NULL as 'Opetus- ja TKI henkilökunta'
	  ,NULL AS 'Ammattikorkeakoulun TKI-henkilökunta'
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'AMK Julkaisut (A-E)'
	  ,NULL as 'AMK julkaisut (F ja I)'
	  ,NULL as 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,NULL AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ,NULL AS 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL AS 'ulkom_hyv_luetut_op_lkm'
	  ,NULL AS 'erilopintooik_op_lkm'
	  ,NULL AS 'avoinamk_op_amk_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL AS 'erikoul_suor_op_lkm'
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,null AS 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'
	  ,null AS 'Kandikyselyn pistemäärä'
	  ,null AS 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'
	  ,NULL as 'Osallistuminen huippuyksik.'
	  ,NULL as 'Akatemia profesuurit'
	  ,NULL as 'erc,stg,cog ja adg'
	  , d2.OKM_ohjauksen_ala_koodi as 'Koodit OKM ohjauksen ala'
	  , d2.koulutus_koodi as 'Koodit Koulutusnimike'
	  , d50.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  , case when d2.jarjestys_iscle2011='ööö' then null else d2.jarjestys_iscle2011 end as 'jarj. koulutusaste, taso 1'
  	  , case when d2.jarjestys_Koulutusaste_taso2='ööö' then null else d2.jarjestys_Koulutusaste_taso2 end as 'jarj. koulutusaste, taso 2'
	  , d2.jarjestys_OKM_ohjauksen_ala as 'jarj. OKM ohjauksen ala'
	  , d2.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d2.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo 2017-2020'
	  , d2.jarjestys_OKM_ohjauksen_ala_yo_tav2021 as 'jarj. rahoitusmalliala yo 2021-2024'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  , NULL as 'toimipiste_id'
	  , NULL as 'hakukohde_id'
	  , NULL as 'alpa'
 FROM [VipunenTK].[dbo].[f_aloittaneiden_lapaisy] f
 left join VipunenTK.dbo.d_kausi AS d10 ON d10.kausi_id = aloituskausikoodi
 left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on oppilaitoksen_taustatiedot_id = d1.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.oppilaitoskoodi 
 left join VipunenTK.dbo.d_koulutusluokitus as d2 on koulk_id= d2.id
 left join VipunenTK.dbo.d_koulutuslaji2 AS d6 ON d6.id = koulutuslaji2_id
 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=f.koulk
 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
 where 
[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne'
AND (tarkastelujakso= '7,5' and  koulutussektori= 'Yiopistokoulutus' ) and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717', '02557') and d50.oppilaitostyyppi_koodi = '42'

union all
/****** 55op suorittaneet ******/
SELECT  
      
      [Tilastovuosi] = f.[vuosi]
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
	  ,d1.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]= case when d1.oppilaitostyyppi_koodi = '42' then 'Yliopisto' when d1.oppilaitostyyppi_koodi = '41' then 'Ammattikorkeakoulu' end 
	  --d1.organisaatio_fi in ('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto', 'Lappeenrannan-Lahden teknillinen yliopisto') 
	  , d2.koulutusluokitus_fi as 'Koulutusnimike'
	  ,null As 'koulutusala2002'
	  ,[OKM ohjauksen ala] = coalesce(d2.okmohjauksenala_fi,'Tuntematon')
	  , d60.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala, yo 2017-2020'
	  , d60.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala, amk'
	  , d60.OKM_ohjauksen_ala_yo_tav2021 as 'Rahoitusmalliala, yo 2021-2024'
	  ,[Koulutusaste, taso 1] = coalesce(d2.koulutusastetaso1_fi,'Tuntematon')
	  ,[Koulutusaste, taso 2] = coalesce(d2.Koulutusastetaso2_fi,'Tuntematon')
	  ,[Koulutusala, taso 1] = coalesce(d2.koulutusalataso1_fi,'Tuntematon')
	  ,[Koulutusala, taso 2] = coalesce(d2.koulutusalataso2_fi,'Tuntematon')
	  ,[Koulutusala, taso 3] = coalesce(d2.koulutusalataso3_fi,'Tuntematon')
	  , NULL as 'Tutkinnon aloitussykli'
	  , RIGHT(d90.paatieteenala2010,LEN(d90.paatieteenala2010)-CHARINDEX(' ',d90.paatieteenala2010)) as 'Päätieteenala'
	  , RIGHT(d90.tieteenala2010,LEN(d90.tieteenala2010)-CHARINDEX(' ',d90.tieteenala2010)) as 'Tieteenala'
	  , d90.tieteenala_avain as 'Tieteenala_avain'
	  ,null as 'Tutkijanuravaihe'
	  ,null as 'kunta'
	  ,NULL as 'kansalaisuus'
	  ,NULL AS 'tutkinnot'
	  ,NULL as 'Opiskelijat'
	  ,NULL as 'Opiskelijat_fte'
	  ,NULL as 'Opiskelijat_lasna'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,[Lasna] = case when f.edellinenSyysolo=1 or f.olok=1 then 1 else 0 end
	  ,[Suorittanut55] = case when f.[suorittanut27]=1 or f.[suorittanut55ilmanPankkia]=1 or f.[suorittanut55PankinAvulla]=1 then 1 else 0 end
	  ,NULL AS  'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  ,NULL AS 'opetus- tutkimushenkilökunta HTV'
	  ,NULL AS 'IV porras HTV'
	  ,NULL AS 'Opetus- ja TKI henkilökunta'
	  ,NULL AS 'Ammattikorkeakoulun TKI-henkilökunta'
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL AS  'AMK Julkaisut (A-E)'
	  ,NULL AS 'AMK julkaisut (F ja I)'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,NULL AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ,NULL AS 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL AS 'ulkom_hyv_luetut_op_lkm'
	  ,NULL AS 'erilopintooik_op_lkm'
	  ,NULL AS 'avoinamk_op_amk_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL AS 'erikoul_suor_op_lkm'
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'
	  ,NULL AS 'Kandikyselyn pistemäärä'
	  ,NULL AS 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'
	  ,NULL as 'Osallistuminen huippuyksik.'
	  ,NULL as 'Akatemia profesuurit'
	  ,NULL as 'erc,stg,cog ja adg'
	  , d2.okmohjauksenala_koodi 'Koodit OKM ohjauksen ala'
	  , d2.koulutusluokitus_koodi as 'Koodit Koulutusnimike'
	  , d1.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  , case when d2.jarjestys_koulutusastetaso1_koodi ='ööö' then null else d2.jarjestys_koulutusastetaso1_koodi end as 'jarj. koulutusaste, taso 1'
  	  , case when d2.jarjestys_koulutusastetaso2_koodi ='ööö' then null else d2.jarjestys_koulutusastetaso2_koodi end as 'jarj. koulutusaste, taso 2'
	  , d60.jarjestys_OKM_ohjauksen_ala as 'jarj. OKM ohjauksen ala'
	  , d60.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d60.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo 2017-2020'
	  , d60.jarjestys_OKM_ohjauksen_ala_yo_tav2021 as 'jarj. rahoitusmalliala yo 2021-2024'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  , NULL as 'toimipiste_id'
	  , NULL as 'hakukohde_id'
	  , NULL as 'alpa'
  FROM [ANTERO].[sa].[sa_virta_otp_viisviis] f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=f.oppilaitostunnus
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi=f.tkoodi
left join VipunenTK.dbo.d_koulutusluokitus d60 on d2.koulutusluokitus_koodi=d60.koulutusluokitus_avain
 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=d60.koulutusluokitus_avain
 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
where f.vuosi>2010 and d1.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d1.oppilaitostyyppi_koodi = '42'

 union all
/****** YO opetus- ja tutkimushenkilökunta sekä IV tutkijanuraporras ******/
SELECT   [vuosi]
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d50.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]= case when d50.oppilaitostyyppi_koodi = '42' then 'Yliopisto' when d50.oppilaitostyyppi_koodi = '41' then 'Ammattikorkeakoulu' end 
	  --d50.organisaatio_fi in ('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto', 'Lappeenrannan-Lahden teknillinen yliopisto') 
	  , NULL as 'Koulutusnimike'
	  , NULL AS 'koulutusaste2002'
	  , d4.ohjauksenala_nimi_fi
	  , NULL as 'Rahoitusmalliala, yo 2017-2020'
	  , NULL as 'Rahoitusmalliala, amk'
	  , NULL as 'Rahoitusmalliala, yo 2021-2024'
	  , NULL AS 'Koulutusaste, taso1'
	  , NULL AS 'Koulutusaste_taso2'
	  , NULL AS 'Koulutusala, taso 1'
	  , NULL AS 'Koulutusala, taso 2'
	  , NULL AS 'Koulutusala, taso 3'
	  , NULL as 'Tutkinnon aloitussykli'
	  , RIGHT(d91.paatieteenala2010,LEN(d91.paatieteenala2010)-CHARINDEX(' ',d91.paatieteenala2010)) as 'Päätieteenala'
	  , RIGHT(d91.tieteenala2010,LEN(d91.tieteenala2010)-CHARINDEX(' ',d91.tieteenala2010)) as 'Tieteenala'
	  , d91.tieteenala_avain as 'Tieteenala_avain'
	  ,d8.selite_fi as 'Tutkijanuravaihe'
      ,NULL AS 'koulutuksen_kunta'
      ,case when d60.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') then 'Suomi' when d60.maatjavaltiot2_fi in ('Islanti', 'Liechtenstein', 'Norja') then 'EU/ETA' else 'Muu' end
      ,NULL AS 'tutkinnot'
	  ,NULL as 'Opiskelijat'
	  ,NULL as 'Opiskelijat_fte'
	  ,NULL as 'Opiskelijat_lasna'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL AS  'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  ,case when d7.koodi=1 then henkilotyovuosi else 0 end AS 'Opetus- ja tutkimushenkilökunta'
	  ,case when d8.koodi=4 then henkilotyovuosi else 0 end as 'IV tutkijanuraporras'
	  ,NULL AS 'Opetus- ja TKI henkilökunta'
	  ,NULL AS 'Ammattikorkeakoulun TKI-henkilökunta'
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL AS  'AMK Julkaisut (A-E)'
	  ,NULL AS  'AMK julkaisut (F ja I)'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,NULL AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ,NULL AS 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL AS 'ulkom_hyv_luetut_op_lkm'
	  ,NULL AS 'erilopintooik_op_lkm'
	  ,NULL AS 'avoinamk_op_amk_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL AS 'erikoul_suor_op_lkm'
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'
	  ,NULL AS 'Kandikyselyn pistemäärä'
	  ,NULL AS 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'
	  ,NULL as 'Osallistuminen huippuyksik.'
	  ,NULL as 'Akatemia profesuurit'
	  ,NULL as 'erc,stg,cog ja adg'
	  , d4.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
	  , '-1' as 'Koodit Koulutusnimike'
	  , d50.organisaatio_koodi as 'Koodit Organisaatio'
	  , NULL as 'Koodit kunta'	  
  	  , NULL AS 'jarjestys_iscle2011'
	  , NULL AS 'jarjestys_Koulutusaste_taso2'
	  , d4.jarjestys_ohjauksenala_koodi as 'jarj. OKM ohjauksen ala'
	  , '99999' as 'jarj. rahoitusmalliala amk'
	  , '99999' as 'jarj. rahoitusmalliala yo 2017-2020'
	  , '99999' as 'jarj. rahoitusmalliala yo 2021-2024'
	  , d91.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d91.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  , NULL as 'toimipiste_id'
	  , NULL as 'hakukohde_id'
	  , NULL as 'alpa'
 FROM [ANTERO].[dw].[f_yo_henkilon_tyo] f
 left join ANTERO.dw.d_yo as d1 on d_yliopisto_id = d1.id
 left join ANTERO.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.yo_tunnus
 left join ANTERO.dw.d_koulutusala_2002 as d2 on d_koulutusala_id = d2.id
 left join ANTERO.dw.d_ohjauksenala as d4 on d_ohjauksenala_id = d4.id
 left join ANTERO.dw.d_maatjavaltiot2 d60 on d60.id=d_kansalaisuus_id
 left join antero.dw.d_yo_tehtavanjaottelu as d7 on d7.id=d_tehtavanjaottelu_id
 left join ANTERO.dw.d_yo_tutkijanuravaihe as d8 on d8.id=d_tutkijanuravaihe_id
 left join ANTERO.dw.d_tieteenala d90 on d90.id=f.d_tieteenala_id
 left join VipunenTK_lisatiedot.dbo.tieteenalan_TTHV d90a on 'TA10_'+d90.tieteenala_koodi=d90a.Tieteenala2010
 left join VipunenTK.dbo.d_tieteenala d91 on d90a.TTHV=d91.tieteenala_avain
 where d7.koodi in (1,3) and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717', '02557') and d50.oppilaitostyyppi_koodi = '42' 

union all

  /****** Julkaisut YO******/

SELECT   tilastovuosi
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]= case when d3.oppilaitostyyppi_koodi = '42' then 'Yliopisto' when d3.oppilaitostyyppi_koodi = '41' then 'Ammattikorkeakoulu' end 
	  --d3.organisaatio_fi in ('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto', 'Lappeenrannan-Lahden teknillinen yliopisto') 
	  ,Null as 'Koulutusnimike'--case when d92.koulutussektori_koodi='5' then d92.koulutusluokitus_fi else null end as 'Koulutusnimike'
	  , NULL AS 'koulutusaste2002'
	  , d4.ohjauksenala_nimi_fi
	  , NULL as 'Rahoitusmalliala, yo 2017-2020'
	  , NULL as 'Rahoitusmalliala, amk'
	  , NULL as 'Rahoitusmalliala, yo 2021-2024'
	  , NULL AS 'Koulutusaste, taso1'
	  , NULL AS 'Koulutusaste_taso2'
	  , NULL AS 'Koulutusala, taso 1'
	  , NULL AS 'Koulutusala, taso 2'
	  , NULL AS 'Koulutusala, taso 3'
	  , NULL as 'Tutkinnon aloitussykli'
	  , RIGHT(d91.paatieteenala2010,LEN(d91.paatieteenala2010)-CHARINDEX(' ',d91.paatieteenala2010)) as 'Päätieteenala'
	  , RIGHT(d91.tieteenala2010,LEN(d91.tieteenala2010)-CHARINDEX(' ',d91.tieteenala2010)) as 'Tieteenala'
	  , d91.tieteenala_avain as 'Tieteenala_avain'
	  , null as 'Tutkijanuravaihe'
      ,NULL AS 'koulutuksen_kunta'
      ,NULL AS'kansalaisuus_versio2'
      ,NULL AS 'tutkinnot'
	  ,NULL as 'Opiskelijat'
	  ,NULL as 'Opiskelijat_fte'
	  ,NULL as 'Opiskelijat_lasna'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL AS  'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  ,NULL AS  'Opetus- ja tutkimushenkilökunta'
	  ,NULL AS  'IV tutkijanuraporras'
	  ,NULL AS  'Opetus- ja TKI henkilökunta'
	  ,NULL AS 'Ammattikorkeakoulun TKI-henkilökunta'
	  ,case when d3.oppilaitostyyppi_koodi='41' OR (d3.oppilaitostyyppi_koodi='42' AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d5.julkaisufoorumitaso_koodi in (1,2,3)) then julkaisunTunnus end as 'JulkaisuID'
	  ,case when d3.oppilaitostyyppi_koodi='41' OR (d3.oppilaitostyyppi_koodi='42' AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d5.julkaisufoorumitaso_koodi in (1,2,3)) then cast(julkaisufoorumitaso_koodi as integer) end as 'Jufotaso'
	  ,case when d3.oppilaitostyyppi_koodi='41' then lukumaara else NULL end AS 'AMK Julkaisut (A-E)'
	  ,NULL as 'AMK julkaisut (F ja I)'
	  ,case when d3.oppilaitostyyppi_koodi='42' AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d5.julkaisufoorumitaso_koodi in (2,3) then lukumaara else NULL end AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,case when d3.oppilaitostyyppi_koodi='42' AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d5.julkaisufoorumitaso_koodi in (1,2,3) then lukumaara else NULL end AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,case when d3.oppilaitostyyppi_koodi='42' AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1') AND d5.julkaisufoorumitaso_koodi in (1,2,3) then lukumaara else NULL end AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,case when d3.oppilaitostyyppi_koodi='42' AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d5.julkaisufoorumitaso_koodi in (1,2,3) AND d_kansainvalinen_yhteisjulkaisu_id=2 then lukumaara else NULL end AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ,NULL AS 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL AS 'ulkom_hyv_luetut_op_lkm'
	  ,NULL AS 'erilopintooik_op_lkm'
	  ,NULL AS 'avoinamk_op_amk_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL AS 'erikoul_suor_op_lkm'
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'
	  ,NULL AS 'Kandikyselyn pistemäärä'
	  ,NULL AS 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'
	  ,NULL as 'Osallistuminen huippuyksik.'
	  ,NULL as 'Akatemia profesuurit'
	  ,NULL as 'erc,stg,cog ja adg'
	  , d4.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
	  , '-1' as 'Koodit Koulutusnimike'
	  , d3.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  , NULL AS 'jarjestys_iscle2011'
	  , NULL AS 'jarjestys_Koulutusaste_taso2'
	  , d4.jarjestys_ohjauksenala_koodi as 'jarj. OKM ohjauksen ala'
	  , '99999' as 'jarj. rahoitusmalliala amk'
	  , '99999' as 'jarj. rahoitusmalliala yo 2017-2020'
	  , '99999' as 'jarj. rahoitusmalliala yo 2021-2024'
	  , d90.jarjestys_paatieteenala_koodi as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala_koodi as 'jarj. tieteenala'
	  , NULL as 'toimipiste_id'
	  , NULL as 'hakukohde_id'
	  , NULL as 'alpa'
 FROM [ANTERO].[dw].[f_virta_jtp_tilasto] f
 left join ANTERO.dw.d_julkaisutyyppi as d1 on d_julkaisutyyppi_id = d1.id
 left join ANTERO.dw.d_koulutusala_2002 as d2 on d_koulutusala02_id = d2.id
 left join ANTERO.dw.d_ohjauksenala as d4 on d_ohjauksenala_id = d4.id
 left join ANTERO.dw.d_organisaatioluokitus as d3 on d_organisaatio_id = d3.id
 left join ANTERO.dw.d_tieteenala d90 on d90.id=f.d_tieteenala_id
 left join VipunenTK_lisatiedot.dbo.tieteenalan_TTHV d90a on 'TA10_'+d90.tieteenala_koodi=d90a.Tieteenala2010
 left join VipunenTK.dbo.d_tieteenala d91 on d90a.TTHV=d91.tieteenala_avain
 --left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala as d91 on 'TTHV_'+d90.tieteenala_koodi=d91.tieteenala_avain
 --left join antero.dw.d_koulutusluokitus as d92 on d91.koulutuskoodi=d92.koulutusluokitus_koodi
 left join antero.dw.d_julkaisufoorumitaso as d5 on d_julkaisufoorumitaso_id=d5.id
 where d1.julkaisunpaaluokka_koodi in ('A', 'B', 'C', 'D', 'E', 'F', 'I') and d3.oppilaitostyyppi_koodi='42' and tilastovuosi>2010 and d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717', '02557')  

 
  union all

      /****** YO talous ******/

SELECT   tilikausi as 'Tilastointivuosi'
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d50.organisaatio_fi  as 'Organisaatio'
	  ,[Sektori]='Yliopisto'
	  , NULL as 'Koulutusnimike'
	  , NULL AS 'koulutusaste2002'
	  , d4.ohjauksenala_nimi_fi
	  , NULL as 'Rahoitusmalliala, yo 2017-2020'
	  , NULL as 'Rahoitusmalliala, amk'
	  , NULL as 'Rahoitusmalliala, yo 2021-2024'
	  , NULL AS 'Koulutusaste, taso1'
	  , NULL AS'Koulutusaste_taso2'
	  , NULL AS 'Koulutusala, taso 1'
	  , NULL AS 'Koulutusala, taso 2'
	  , NULL AS 'Koulutusala, taso 3'
	  , NULL as 'Tutkinnon aloitussykli'
	  , d90.paatieteenala_nimi_fi as 'Päätieteenala'
	  , d90.tieteenala_nimi_fi as 'Tieteenala'
	  , NULL as 'Tieteenala_avain'
	  , null as 'Tutkijanuravaihe'
      ,NULL AS 'koulutuksen_kunta'
      ,NULL AS 'kansalaisuus'
      ,NULL AS 'tutkinnot'
	  ,NULL as 'Opiskelijat'
	  ,NULL as 'Opiskelijat_fte'
	  ,NULL as 'Opiskelijat_lasna'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL AS  'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  ,NULL AS  'Opetus- ja tutkimushenkilökunta'
	  ,NULL AS  'IV tutkijanuraporras'
	  ,NULL AS 'Opetus- ja TKI henkilökunta'
	  ,NULL AS 'Ammattikorkeakoulun TKI-henkilökunta'
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL AS 'AMK Julkaisut (A-E)'
	  ,NULL AS 'AMK julkaisut (F ja I)'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,NULL AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,case when tili_taso2_fi IN ('Suomen Akatemia','Tekes','Kotimaiset yritykset','Ulkomaiset yritykset','EU-puiteohjelmarahoitus ja muu laadullisesti kilpailtu EU-rahoitus','Ulkomaiset rahastot ja säätiöt','Kansainväliset järjestöt', 'Muu ulkomainen rahoitus', 'Business Finland') then arvo else 0 end AS 'Kilpailtu tutkimusrahoitus'
  	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ,null AS 'kv_vaihtoopiskelijat_op_lkm'
	  ,null AS 'ulkom_hyv_op_lkm'
	  ,null AS 'erilopintooik_op_lkm'
	  ,null AS 'avoinamk_op_amk_lkm'
	  ,null AS 'mamu_op_lkm'
	  ,null AS 'erikoul_suor_op_lkm'
	  ,null AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'Työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'
	  ,NULL AS 'Kandikyselyn pistemäärä'
	  ,NULL AS 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'
	  ,NULL as 'Osallistuminen huippuyksik.'
	  ,NULL as 'Akatemia profesuurit'
	  ,NULL as 'erc,stg,cog ja adg'
	  , d4.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
	  , '-1' as 'Koodit Koulutusnimike'
	  , d50.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  , NULL as 'jarjestys_iscle2011'
	  , NULL as 'jarjestys_Koulutusaste_taso2'
	  , d4.jarjestys_ohjauksenala_koodi as 'jarj. OKM ohjauksen ala'
	  , '99999' as 'jarj. rahoitusmalliala amk'
	  , '99999' as 'jarj. rahoitusmalliala yo 2017-2020'
	  , '99999' as 'jarj. rahoitusmalliala yo 2021-2024'
	  , d90.jarjestys_paatieteenala_koodi as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala_koodi as 'jarj. tieteenala'
	  , NULL as 'toimipiste_id'
	  , NULL as 'hakukohde_id'
	  , NULL as 'alpa'
 FROM [ANTERO].[dw].[f_yo_talous] f
 LEFT JOIN ANTERO.DW.d_tili d5 ON d_tili_id = d5.id
 LEFT join antero.dw.d_yo d10 on d_yo_id=d10.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d10.yo_tunnus 
 LEFT JOIN antero.dw.d_ohjauksenala d4 ON d_ohjauksenala_id = d4.id
 LEFT join antero.dw.d_opintoala95 d2 ON d_opintoala95_id = d2.id
 left join ANTERO.dw.d_tieteenala d90 on d90.id='-1'
 left join antero.dw.d_aineistotyyppi d1 on f.d_aineistotyyppi_id=d1.id
 WHERE konserni='E' AND d1.aineistotyyppi_koodi='L' and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717', '02557')

 union all

  /****** YO talous - kilpailtu rahoitus ******/
SELECT   tilastovuosi as 'Tilastointivuosi'
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi  as 'Organisaatio'
	  ,[Sektori]='Yliopisto'
	  , NULL as 'Koulutusnimike'
	  ,NULL AS 'koulutusaste2002'-- d4.koulutusaste2002_fi AS 'koulutusaste2002'
	  ,NULL as 'Ohjauksen ala'-- d4.okmohjauksenala_fi as 'Ohjauksen ala'
	  , NULL as 'Rahoitusmalliala, yo 2017-2020'
	  , NULL as 'Rahoitusmalliala, amk'
	  , NULL as 'Rahoitusmalliala, yo 2021-2024'
	  ,NULL AS 'Koulutusaste, taso1'-- d4.koulutusastetaso1_fi AS 'Koulutusaste, taso1'
	  ,NULL AS'Koulutusaste_taso2'-- d4.koulutusastetaso2_fi AS'Koulutusaste_taso2'
	  , NULL as 'Koulutusala, taso1' --d4.koulutusalataso1_fi AS 'Koulutusala, taso 1'
	  , null AS 'Koulutusala, taso 2'--d4.koulutusalataso2_fi AS 'Koulutusala, taso 2'
	  , null AS 'Koulutusala, taso 3' -- d4.koulutusalataso3_fi AS 'Koulutusala, taso 3'
	  , NULL as 'Tutkinnon aloitussykli'
	  , ltrim(substring(d91.paatieteenala2010,CHARINDEX(' ',d91.paatieteenala2010),LEN(d91.paatieteenala2010))) as 'Päätieteenala'
	  , ltrim(substring(d91.tieteenala2010,CHARINDEX(' ',d91.tieteenala2010),LEN(d91.tieteenala2010))) as 'Tieteenala'
	  , d91.tieteenala_avain as 'Tieteenala_avain'
	  ,null as 'Tutkijanuravaihe'
      ,NULL AS 'koulutuksen_kunta'
      ,NULL AS 'kansalaisuus'
      ,NULL AS 'tutkinnot'
	  ,NULL as 'Opiskelijat'
	  ,NULL as 'Opiskelijat_fte'
	  ,NULL as 'Opiskelijat_lasna'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL AS  'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  ,NULL AS  'Opetus- ja tutkimushenkilökunta'
	  ,NULL AS  'IV tutkijanuraporras'
	  ,NULL AS 'Opetus- ja TKI henkilökunta'
	  ,NULL AS 'Ammattikorkeakoulun TKI-henkilökunta'
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL AS 'AMK Julkaisut (A-E)'
	  ,NULL AS 'AMK julkaisut (F ja I)'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,NULL AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
  	  ,f.tutkimusrahoitus*1000 AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ,null AS 'kv_vaihtoopiskelijat_op_lkm'
	  ,null AS 'ulkom_hyv_op_lkm'
	  ,null AS 'erilopintooik_op_lkm'
	  ,null AS 'avoinamk_op_amk_lkm'
	  ,null AS 'mamu_op_lkm'
	  ,null AS 'erikoul_suor_op_lkm'
	  ,null AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'Työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'
	  ,NULL AS 'Kandikyselyn pistemäärä'
	  ,NULL AS 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'
	  ,NULL as 'Osallistuminen huippuyksik.'
	  ,NULL as 'Akatemia profesuurit'
	  ,NULL as 'erc,stg,cog ja adg'
	  ,NULL as 'Koodit OKM ohjauksen ala'
	  ,NULL as 'Koodit koulutusnimike' -- d5.koulutus_koodi as 'Koodit Koulutusnimike'
	  ,d3.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  , NULL as 'jarjestys_iscle2011'
	  , NULL as 'jarjestys_Koulutusaste_taso2'
	  , NULL as 'jarj. OKM ohjauksen ala'
	  , '99999' as 'jarj. rahoitusmalliala amk'
	  , '99999' as 'jarj. rahoitusmalliala yo 2017-2020'
	  , '99999' as 'jarj. rahoitusmalliala yo 2021-2024'
	  , d91.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d91.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  , NULL as 'toimipiste_id'
	  , NULL as 'hakukohde_id'
	  , NULL as 'alpa'
  FROM [VipunenTK].[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus] f
  left join vipunenTK.dbo.d_tutkimuksen_rahoituslahde d1 on rahoituslahde_id=d1.id
  left join VipunenTK.dbo.d_tieteenala d90 on f.tieteenala_id=d90.id
  left join VipunenTK_lisatiedot.dbo.tieteenalan_TTHV d90a on d90.tieteenala_avain=d90a.Tieteenala2010
  left join VipunenTK.dbo.d_tieteenala d91 on d90a.TTHV=d91.tieteenala_avain
  left join ANTERO.dw.d_organisaatioluokitus d3 on f.oppilaitos_avain=d3.organisaatio_koodi
 where (d1.rahoituslahde in ('Suomen Akatemia', 'Tekes', 'EU-puiteohjelmarahoitus','Business Finland') OR d1.rahoituslahde_avain='TEKES') and d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717', '02557') 

  union all

 /****** HAKU ja valinta ******/

SELECT   f.koulutuksen_alkamisvuosi
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi  as 'Organisaatio'
	  ,[Sektori]= case when d3.oppilaitostyyppi_koodi = '42' then 'Yliopisto' when d3.oppilaitostyyppi_koodi = '41' then 'Ammattikorkeakoulu' end 
	  --d3.organisaatio_fi in ('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto', 'Lappeenrannan-Lahden teknillinen yliopisto') 
	  ,case when (d6.koodi=1 and d7.koulutus_koodi=d10.I_sykli_kandi) then d7a.koulutus else d7.koulutus end as 'Koulutusnimike'
	  ,d12.koulutusaste2002_fi AS  'koulutusaste2002'
	  ,d12.okmohjauksenala_fi
	  ,d7.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala, yo 2017-2020'
	  ,d7.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala, amk'
	  ,d7.OKM_ohjauksen_ala_yo_tav2021 as 'Rahoitusmalliala, yo 2021-2024'
	  ,d12.koulutusastetaso1_fi
	  ,d12.koulutusastetaso2_fi
	  ,d12.koulutusalataso1_fi as 'Koulutusala, taso 1'
	  ,d12.koulutusalataso2_fi as 'Koulutusala, taso 2'
	  ,d12.koulutusalataso3_fi as 'Koulutusala, taso 3'
	  ,d6.selite_fi as 'Tutkinnon aloitussykli'
	  , RIGHT(d90.paatieteenala2010,LEN(d90.paatieteenala2010)-CHARINDEX(' ',d90.paatieteenala2010)) as 'Päätieteenala'
	  , RIGHT(d90.tieteenala2010,LEN(d90.tieteenala2010)-CHARINDEX(' ',d90.tieteenala2010)) as 'Tieteenala'
	  , d90.tieteenala_avain as 'Tieteenala_avain'
	  ,null as 'Tutkijanuravaihe'
      ,NULL AS 'koulutuksen_kunta'
      ,NULL AS 'kansalaisuus'
      ,NULL AS 'tutkinnot'
	  ,NULL as 'Opiskelijat'
	  ,NULL as 'Opiskelijat_fte'
	  ,NULL as 'Opiskelijat_lasna'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL AS 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  ,NULL AS 'Opetus- ja tutkimushenkilökunta'
	  ,NULL AS 'IV tutkijanuraporras'
	  ,NULL AS 'Opetus- ja TKI henkilökunta'
	  ,NULL AS 'Ammattikorkeakoulun TKI-henkilökunta'
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL AS 'AMK Julkaisut (A-E)'
	  ,NULL AS 'AMK julkaisut (F ja I)'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,NULL AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ,null AS 'kv_vaihtoopiskelijat_op_lkm'
	  ,null AS 'ulkom_hyv_op_lkm'
	  ,null AS 'erilopintooik_op_lkm'
	  ,null AS 'avoinamk_op_amk_lkm'
	  ,null AS 'mamu_op_lkm'
	  ,null AS 'erikoul_suor_op_lkm'
	  ,null AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'Työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'
	  ,NULL as 'Kandikyselyn pistemäärä'
	  ,NULL as 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä' 
	  ,case when hakutoive=1 then f.henkilo_oid else null end as 'Ensisijainen hakija'
	  ,case when f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then f.henkilo_oid else null end as 'Paikan vastaanottaneet'
	  ,NULL as 'Osallistuminen huippuyksik.'
	  ,NULL as 'Akatemia profesuurit'
	  ,NULL as 'erc,stg,cog ja adg'
	  , d12.okmohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
	  , d7.koulutus_koodi as 'Koodit Koulutusnimike'
	  , d3.organisaatio_koodi as 'Koodit organisaatio'
	  ,NULL as 'Koodit kunta'
	  , case when d12.jarjestys_koulutusastetaso1_koodi ='ööö' then null else d12.jarjestys_koulutusastetaso1_koodi end as 'jarj. koulutusaste, taso 1'
	  , case when d12.jarjestys_koulutusastetaso2_koodi ='ööö' then null else d12.jarjestys_koulutusastetaso2_koodi end as 'jarj. koulutusaste, taso 2'
	  , d7.jarjestys_OKM_ohjauksen_ala as 'jarj. OKM ohjauksen ala'
	  , d7.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d7.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo 2017-2020'
	  , d7.jarjestys_OKM_ohjauksen_ala_yo_tav2021 as 'jarj. rahoitusmalliala yo 2021-2024'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  , f2.d_organisaatio_toimipiste_id as 'toimipiste_id'
	  , f2.d_hakukohde_id as 'hakukohde_id'
	  , f2.aloituspaikat as 'alpa'
	  FROM [ANTERO].dw.f_haku_ja_valinta_hakeneet_korkea_aste as f
	LEFT JOIN ANTERO.dw.d_haku d25 ON d25.id = f.d_haku_id
	 LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
    INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on ((d1.haku_oid=d25.haku_oid and d1.haku_oid is not null) OR (d1.koulutuksen_alkamiskausi=cast(f.koulutuksen_alkamisvuosi as varchar)+cast(d2.jarjestys as varchar) and d25.hakutapa_koodi <> '01' and d1.haku_oid is null)) and f.loadtime >= d1.hakijat	
	left join antero.dw.d_organisaatioluokitus d3 on f.d_organisaatio_oppilaitos_id = d3.id
	left JOIN ANTERO.dw.d_koulutusluokitus d12 on d_koulutusluokitus_hakukohde_id=d12.id
	left join VipunenTK.dbo.d_koulutusluokitus d7 on d7.koulutusluokitus_avain=d12.koulutusluokitus_koodi
	left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=d7.koulutusluokitus_avain
    left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
	left join antero.dw.d_hakukohde as d5 on f.d_hakukohde_id=d5.id
	left join antero.dw.d_tutkinnon_aloitussykli_kk as d6 on f.d_tutkinnon_aloitussykli_kk_id=d6.id
	left join VipunenTK_lisatiedot.dbo.Haku_valinta_kandi_maisteri d10 on d7.koulutus_koodi=d10.I_sykli_kandi
	left join VipunenTK.dbo.d_koulutusluokitus d7a on d10.I_sykli_maisteri=d7a.koulutus_koodi
	left join [ANTERO].[dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat] f2
		on f2.koulutuksen_alkamisvuosi = f.koulutuksen_alkamisvuosi
			and f2.d_tutkinnon_aloitussykli_kk_id = f.d_tutkinnon_aloitussykli_kk_id
			and f2.d_hakukohde_id = f.d_hakukohde_id
			and f2.d_organisaatio_oppilaitos_id = f.d_organisaatio_oppilaitos_id

	where d12.koulutussektori_koodi in (5,4) and d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717', '02557') and d3.oppilaitostyyppi_koodi = '42'

Union all
	
/****** Korkeakouluopiskelijat ******/
SELECT  
	[tilastointivuosi] as 'Tilastovuosi'
	  ,Null as 'Aloituslukuvuosi (läpäisy)' 
      ,d50.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]= case when d50.oppilaitostyyppi_koodi = '42' then 'Yliopisto' when d50.oppilaitostyyppi_koodi = '41' then 'Ammattikorkeakoulu' end 
	  --d50.organisaatio_fi in ('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto', 'Lappeenrannan-Lahden teknillinen yliopisto') 
	  , d2.koulutus as 'Koulutusnimike'
	  , d2.koulutusaste2002 as 'Koulutusaste 2002'
	  , d2.OKM_ohjauksen_ala 'OKM ohjauksen ala'
	  , d2.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala, yo 2017-2020'
	  , d2.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala, amk'
	  , d2.OKM_ohjauksen_ala_yo_tav2021 as 'Rahoitusmalliala, yo 2021-2024'
	  , d2.iscle2011 as 'Koulutusaste, taso 1'
	  , d2.Koulutusaste_taso2 'Koulutusaste, taso 2'
	  , d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , d2.iscfi2013 as 'Koulutusala, taso 3'
	  , NULL as 'Tutkinnon aloitussykli'
	  , RIGHT(d90.paatieteenala2010,LEN(d90.paatieteenala2010)-CHARINDEX(' ',d90.paatieteenala2010)) as 'Päätieteenala'
	  , RIGHT(d90.tieteenala2010,LEN(d90.tieteenala2010)-CHARINDEX(' ',d90.tieteenala2010)) as 'Tieteenala'
	  , d90.tieteenala_avain as 'Tieteenala_avain'
	  , null as 'Tutkijanuravaihe'
      ,d20.kunta as 'Kunta'
      ,d3.[kansalaisuus_versio2] as 'Kansalaisuus'
      ,NULL as 'Tutkinnot'
	  ,f.opiskelijat as 'Opiskelijat'
	  ,f.opiskelijat_fte as 'Opiskelijat_fte'
	  ,f.opiskelijat_lasna as 'Opiskelijat_lasna'
	  ,NULL AS 'Yo 7v aloittaneet lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat (55op)'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS '1-14op suorittaneet' --lkm_op1_14
	  ,NULL AS 'Yliopiston opetus- ja tutkimushenkilötyövuodet'
	  ,NULL AS 'IV tutkijanuraportaan henkilötyövuodet'
	  ,NULL AS 'Ammattikorkeakoulun opetushenkilökunta'
	  ,NULL AS 'Ammattikorkeakoulun TKI-henkilökunta'
	  ,null as 'JulkaisuID'
	  ,null as 'Jufotaso'
	  ,NULL AS 'AMK Julkaisut (A-E)'
	  ,NULL AS 'AMK julkaisut (F ja I)'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,NULL AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ,NULL AS 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL AS 'ulkom_hyv_luetut_op_lkm'
	  ,NULL AS 'erilopintooik_op_lkm'
	  ,NULL AS 'avoinamk_op_amk_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL AS 'erikoul_suor_op_lkm'
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,null as 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'
	  ,null AS 'Kandikyselyn pistemäärä'
	  ,null AS 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'
	  ,NULL as 'Osallistuminen huippuyksik.'
	  ,NULL as 'Akatemia profesuurit'
	  ,NULL as 'erc,stg,cog ja adg'
	  , d2.OKM_ohjauksen_ala_koodi as 'Koodit OKM ohjauksen ala'
	  , d2.koulutus_koodi as 'Koodit Koulutusnimike'
	  , d50.organisaatio_koodi as 'Koodit organisaatio'
	  , d20.kunta_koodi as 'Koodit kunta'
  	  , case when d2.jarjestys_iscle2011='ööö' then null else d2.jarjestys_iscle2011 end as 'jarj. koulutusaste, taso 1'
  	  , case when d2.jarjestys_Koulutusaste_taso2='ööö' then null else d2.jarjestys_Koulutusaste_taso2 end as 'jarj. koulutusaste, taso 2'
	  , d2.jarjestys_OKM_ohjauksen_ala as 'jarj. OKM ohjauksen ala'
	  , d2.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d2.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo 2017-2020'
	  , d2.jarjestys_OKM_ohjauksen_ala_yo_tav2021 as 'jarj. rahoitusmalliala yo 2021-2024'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  , NULL as 'toimipiste_id'
	  , NULL as 'hakukohde_id'
	  , NULL as 'alpa'
 FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] f
 left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on oppilaitos_id = d1.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.oppilaitoskoodi 
 left join VipunenTK.dbo.d_koulutusluokitus as d2 on koulutusluokitus_id = d2.id
 left join VipunenTK.dbo.d_kansalaisuus_versio2 as d3 on kansalaisuus_versio2_id = d3.id
 left join VipunenTK.dbo.d_alueluokitus as d20 on [koulutuksen_kunta]=d20.kunta_koodi
 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=f.koulutusluokitus
 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
 Where (aineisto = 'L' or (aineisto = 'E' and tilastointivuosi=YEAR(GETDATE())-1)) and tilastointivuosi>2010 AND koulutusaste2002_koodi in ('62','71','63','72','82') and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717', '02557') and d50.oppilaitostyyppi_koodi = '42' 


GO


