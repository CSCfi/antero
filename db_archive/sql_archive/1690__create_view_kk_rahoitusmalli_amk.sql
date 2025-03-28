USE [ANTERO]
GO


Create view [dw].[v_kk_rahoitusmalli_amk] as
  
/****** Korkeakoulututkinnot ******/
SELECT 
	[tilastointivuosi] as 'Tilastovuosi'
	  ,Null as 'Aloituslukuvuosi (läpäisy)' 
      ,d50.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]=case  when d50.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , d2.koulutus as 'Koulutusnimike'
	  , d2.koulutusaste2002 as 'Koulutusaste 2002'
	  , d2.OKM_ohjauksen_ala 'OKM ohjauksen ala'
	  , d2.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala, amk'
	  , d2.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala, yo'
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
	   --Läpäisy--
	  ,NULL as 'Aloituskausikoodi'
	  ,NULL as 'Valmistumiskausikoodi'
	  ,NULL AS 'Yo 7v aloittaneet lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat (55op)'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as [Suorittanut27] --suorittanu27
	  ,NULL as [suorittanut55ilmanPankkia] --suorittanut55ilmanpankkia
	  ,NULL as [suorittanut55pankinAvulla] --suorittanut55pankinavulla
	  ,NULL as 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS '1-14op suorittaneet' --lkm_op1_14
	  ,NULL as 'Kevät' --- UUSI
	  ,NULL as 'Syksy' --- UUSI
	  ,NULL AS 'Yliopiston opetus- ja tutkimushenkilötyövuodet'
	  ,NULL AS 'IV tutkijanuraportaan henkilötyövuodet'
	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'AMK Julkaisut (A-F ja I)'

	  --Kilpailtu rahoitus--
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
---  amk muut opintopisteet ---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'


	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,null as 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

-- Opiskelijapalaute --
	  ,NULL as 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-YAMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  

--Hakijat--
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'

	  , d2.OKM_ohjauksen_ala_koodi as 'Koodit OKM ohjauksen ala'
	  , d2.koulutus_koodi as 'Koodit Koulutusnimike'
	  , d50.organisaatio_koodi as 'Koodit organisaatio'
	  , d20.kunta_koodi as 'Koodit kunta'
  	  , case when d2.jarjestys_iscle2011='ööö' then null else d2.jarjestys_iscle2011 end as 'jarj. koulutusaste, taso 1'
  	  , case when d2.jarjestys_Koulutusaste_taso2='ööö' then null else d2.jarjestys_Koulutusaste_taso2 end as 'jarj. koulutusaste, taso 2'
	  , case 
			when d2.OKM_ohjauksen_ala_koodi='1' then 1 
			when d2.OKM_ohjauksen_ala_koodi='2' then 2 
			when d2.OKM_ohjauksen_ala_koodi='3' then 3 
			when d2.OKM_ohjauksen_ala_koodi='4' then 4
			when d2.OKM_ohjauksen_ala_koodi='5' then 5
			when d2.OKM_ohjauksen_ala_koodi='6' then 6
			when d2.OKM_ohjauksen_ala_koodi='7' then 7
			when d2.OKM_ohjauksen_ala_koodi='8' then 8  
			when d2.OKM_ohjauksen_ala_koodi='9' then 9
			when d2.OKM_ohjauksen_ala_koodi='10' then 10
			when d2.OKM_ohjauksen_ala_koodi='11' then 11
			when d2.OKM_ohjauksen_ala_koodi='12' then 12 
			when d2.OKM_ohjauksen_ala_koodi='-1' then 99999
		end as 'jarj. OKM ohjauksen ala'
	  , d2.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d2.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  ,NULL as 'aloituspaikat'
	  ,NULL as 'valintojen aloituspaikat'

	  
 -- Taloustiedot --
  ,NULL  AS 'Tilitaso 0'
  ,NULL  AS 'Tilitaso 1'
  ,NULL  AS 'Tilitaso 2'
  ,NULL  AS 'Tilitaso 3'
  ,NULL  AS 'Tilitaso 4'
  ,NULL  AS 'Tilitaso 5'
  ,NULL  AS 'Toiminto'
  ,NULL  AS 'Talousarvo'
  ,NULL as 'Talouserittely'

 FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
 left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on oppilaitos_id = d1.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.oppilaitoskoodi 
 left join VipunenTK.dbo.d_koulutusluokitus as d2 on koulutusluokitus_id = d2.id
 left join VipunenTK.dbo.d_kansalaisuus_versio2 as d3 on kansalaisuus_versio2_id = d3.id
 left join VipunenTK.dbo.d_alueluokitus as d20 on [koulutuksen_kunta]=d20.kunta_koodi
 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=f.koulutusluokitus
 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
 Where (aineisto = 'L' or (aineisto = 'E' and tilastointivuosi=YEAR(GETDATE())-1)) and tilastointivuosi>2010 and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d1.oppilaitostyyppikoodi='41'


 union all
/****** Läpäisy ******/
 SELECT 
		case when tarkastelujakso='7,5' and lukukausi='1' then d10.vuosiselite+7 When  tarkastelujakso='7,5' and lukukausi='2' then d10.vuosiselite+8
			When  tarkastelujakso='5,5' and lukukausi='1' then d10.vuosiselite+5 When  tarkastelujakso='5,5' and lukukausi='2' then d10.vuosiselite+6
			end as 'Tilastovuosi'
	  ,d10.lukuvuosi as 'Aloituslukuvuosi (läpäisy)' 
      ,d50.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]=case  when d50.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , d2.koulutus as 'Koulutusnimike'
	  , d2.koulutusaste2002
	  , d2.OKM_ohjauksen_ala
	  , d2.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala (AMK)'
	  , d2.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala (YO)'
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
	  --Läpäisy--
	  ,[aloituskausikoodi] as 'Aloituskausikoodi'
	  ,[saavutettu_kausikoodi] as 'Valmistumiskausikoodi'
	  ,case when tarkastelujakso='7,5' and (d6.koulutuslaji2_koodi='51b'  OR (d2.koulutus_koodi in (612101, 613101,613401,672401,634101))) then f.lkm_int else 0 end AS 'YO_7v_aloittaneet_lkm'
	  ,case when tarkastelujakso='5,5' AND d2.koulutusaste2002_koodi=62 then f.lkm_int else 0 end AS 'AMK_5v_Aloittaneet_lkm'
	  ,case when tarkastelujakso='7,5' and (d6.koulutuslaji2_koodi='51b'  OR (d2.koulutus_koodi in (612101, 613101,613401,672401,634101))) and [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]='Tutkinto alkuperäisessä tutkintolajissa' then f.lkm_int else 0 end AS '7v_suorittaneet_lkm'
	  ,case when tarkastelujakso='5,5' AND d2.koulutusaste2002_koodi=62 and [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]='Tutkinto alkuperäisessä tutkintolajissa' then f.lkm_int else 0 end AS '5v_suorittaneet_lkm'
	  ,NULL as 'lasna'
	  ,NULL as 'suorittanut55'
	  ,NULL as [Suorittanut27] --suorittanu27
	  ,NULL as [suorittanut55ilmanPankkia] --suorittanut55ilmanpankkia
	  ,NULL as [suorittanut55pankinAvulla] --suorittanut55pankinavulla
	  ,NULL as 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL as 'lkm_op1_14'
	  ,NULL as 'Kevät'
	  ,NULL as 'Syksy'
	  ,NULL as 'opetus- tutkimushenkilökunta HTV'
	  ,NULL as 'IV porras HTV'
	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'AMK Julkaisut (A-F ja I)'

	  --Kilpailtu rahoitus--
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ---  amk muut opintopisteet ---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,null AS 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

-- Opiskelijapalaute --
	  ,NULL as 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-YAMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  

--Hakijat--
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'

	  , d2.OKM_ohjauksen_ala_koodi as 'Koodit OKM ohjauksen ala'
	  , d2.koulutus_koodi as 'Koodit Koulutusnimike'
	  , d50.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  , case when d2.jarjestys_iscle2011='ööö' then null else d2.jarjestys_iscle2011 end as 'jarj. koulutusaste, taso 1'
  	  , case when d2.jarjestys_Koulutusaste_taso2='ööö' then null else d2.jarjestys_Koulutusaste_taso2 end as 'jarj. koulutusaste, taso 2'
	  , case 
			when d2.OKM_ohjauksen_ala_koodi='1' then 1 
			when d2.OKM_ohjauksen_ala_koodi='2' then 2 
			when d2.OKM_ohjauksen_ala_koodi='3' then 3 
			when d2.OKM_ohjauksen_ala_koodi='4' then 4
			when d2.OKM_ohjauksen_ala_koodi='5' then 5
			when d2.OKM_ohjauksen_ala_koodi='6' then 6
			when d2.OKM_ohjauksen_ala_koodi='7' then 7
			when d2.OKM_ohjauksen_ala_koodi='8' then 8  
			when d2.OKM_ohjauksen_ala_koodi='9' then 9
			when d2.OKM_ohjauksen_ala_koodi='10' then 10
			when d2.OKM_ohjauksen_ala_koodi='11' then 11
			when d2.OKM_ohjauksen_ala_koodi='12' then 12 
			when d2.OKM_ohjauksen_ala_koodi='-1' then 99999
		end as 'jarj. OKM ohjauksen ala'
	  , d2.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d2.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  	  ,NULL as 'aloituspaikat'
	  ,NULL as 'valintojen aloituspaikat'


 -- Taloustiedot --
  ,NULL  AS 'Tilitaso 0'
  ,NULL  AS 'Tilitaso 1'
  ,NULL  AS 'Tilitaso 2'
  ,NULL  AS 'Tilitaso 3'
  ,NULL  AS 'Tilitaso 4'
  ,NULL  AS 'Tilitaso 5'
  ,NULL  AS 'Toiminto'
  ,NULL  AS 'Talousarvo'
  ,NULL as 'Talouserittely'


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
AND ((tarkastelujakso = '5,5' and koulutussektori= 'Ammattikorkeakoulukoulutus')) 
OR (tarkastelujakso= '7,5' and  koulutussektori= 'Yiopistokoulutus' ) and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d1.oppilaitostyyppikoodi='41'

union all
/****** 55op suorittaneet ******/
SELECT 
      
      [Tilastovuosi] = f.[vuosi]

	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
	  ,d1.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]=case  when d1.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , d2.koulutusluokitus_fi as 'Koulutusnimike'
	  ,null As 'koulutusala2002'
	  ,[OKM ohjauksen ala] = coalesce(d2.okmohjauksenala_fi,'Tuntematon')
	  , d60.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala (AMK)'
	  , d60.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala (YO)'
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
	  --Läpäisy--
	  ,NULL as 'Aloituskausikoodi'
	  ,NULL as 'Valmistumiskausikoodi'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,[Lasna] = case when f.edellinenSyysolo=1 or f.olok=1 then 1 else 0 end
	  ,[Suorittanut55] = case when f.[suorittanut27]=1 or f.[suorittanut55ilmanPankkia]=1 or f.[suorittanut55PankinAvulla]=1 then 1 else 0 end
	  ,[Suorittanut27]
	  ,[suorittanut55ilmanPankkia]
	  ,[suorittanut55pankinAvulla]
	  ,NULL AS  'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
      ,[kevat] as 'Kevät'
	  ,[syys] as 'Syksy'
	  ,NULL AS 'opetus- tutkimushenkilökunta HTV'
	  ,NULL AS 'IV porras HTV'
	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'AMK Julkaisut (A-F ja I)'

	  --Kilpailtu rahoitus--
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ---  amk muut opintopisteet ---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

-- Opiskelijapalaute --
	  ,NULL as 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-YAMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  

--Hakijat--
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'

	  , d2.okmohjauksenala_koodi 'Koodit OKM ohjauksen ala'
	  , d2.koulutusluokitus_koodi as 'Koodit Koulutusnimike'
	  , d1.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  , case when d2.jarjestys_koulutusastetaso1_koodi ='ööö' then null else d2.jarjestys_koulutusastetaso1_koodi end as 'jarj. koulutusaste, taso 1'
  	  , case when d2.jarjestys_koulutusastetaso2_koodi ='ööö' then null else d2.jarjestys_koulutusastetaso2_koodi end as 'jarj. koulutusaste, taso 2'
	  , case 
			when d2.okmohjauksenala_koodi='1' then 1 
			when d2.okmohjauksenala_koodi='2' then 2 
			when d2.okmohjauksenala_koodi='3' then 3 
			when d2.okmohjauksenala_koodi='4' then 4
			when d2.okmohjauksenala_koodi='5' then 5
			when d2.okmohjauksenala_koodi='6' then 6
			when d2.okmohjauksenala_koodi='7' then 7
			when d2.okmohjauksenala_koodi='8' then 8  
			when d2.okmohjauksenala_koodi='9' then 9
			when d2.okmohjauksenala_koodi='10' then 10
			when d2.okmohjauksenala_koodi='11' then 11
			when d2.okmohjauksenala_koodi='12' then 12 
			when d2.okmohjauksenala_koodi='-1' then 99999
		end as 'jarj. OKM ohjauksen ala'
	  , d60.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d60.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  	  ,NULL as 'aloituspaikat'
	  ,NULL as 'valintojen aloituspaikat'

	  
 -- Taloustiedot --
  ,NULL  AS 'Tilitaso 0'
  ,NULL  AS 'Tilitaso 1'
  ,NULL  AS 'Tilitaso 2'
  ,NULL  AS 'Tilitaso 3'
  ,NULL  AS 'Tilitaso 4'
  ,NULL  AS 'Tilitaso 5'
  ,NULL  AS 'Toiminto'
  ,NULL  AS 'Talousarvo'
  ,NULL as 'Talouserittely'
  FROM [ANTERO].[sa].[sa_virta_otp_viisviis] f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=f.oppilaitostunnus
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi=f.tkoodi
left join VipunenTK.dbo.d_koulutusluokitus d60 on d2.koulutusluokitus_koodi=d60.koulutusluokitus_avain
 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=d60.koulutusluokitus_avain
 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
where vuosi>2010 and d1.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d1.oppilaitostyyppi_koodi='41'

union all
/****** 1-14op suorittaneet ******/
SELECT 
		[tilastointivuosi]
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      ,d50.organisaatio_fi as 'organisaatio'
	  ,[Sektori]=case  when d50.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , d2.koulutus as 'Koulutusnimike'
	  , d2.koulutusaste2002
	  , d2.OKM_ohjauksen_ala
	  , d2.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala (AMK)'
	  , d2.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala (YO)'
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
      ,d20.kunta as 'Kunta'
      ,d3.[kansalaisuus_versio2]
      ,NULL AS 'tutkinnot'
	  --Läpäisy--
	  ,NULL as 'Aloituskausikoodi'
	  ,NULL as 'Valmistumiskausikoodi'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as [Suorittanut27] --suorittanu27
	  ,NULL as [suorittanut55ilmanPankkia] --suorittanut55ilmanpankkia
	  ,NULL as [suorittanut55pankinAvulla] --suorittanut55pankinavulla
	  ,[1-14 lasna]= case when f.opiskelijan_olo_syys=1 then f.lukumaara else 0 END
	  ,lkm_op1_14
	  	  ,NULL as 'Kevät'
	  ,NULL as 'Syksy'
	  ,NULL AS 'opetus- tutkimushenkilökunta HTV'
	  ,NULL AS 'IV porras HTV'

	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'AMK Julkaisut (A-F ja I)'

	  --Kilpailtu rahoitus--
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ---  amk muut opintopisteet ---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

-- Opiskelijapalaute --
	  ,NULL as 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-YAMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  

--Hakijat--
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'

	  , d2.OKM_ohjauksen_ala_koodi as 'Koodit OKM ohjauksen ala'
	  , d2.koulutus_koodi as 'Koodit Koulutusnimike'
	  , d50.organisaatio_koodi as 'Koodit Organisaatio'
	  , d20.kunta_koodi as 'Koodit kunta'
  	  , case when d2.jarjestys_iscle2011='ööö' then null else d2.jarjestys_iscle2011 end as 'jarj. koulutusaste, taso 1'
	  , case when d2.jarjestys_Koulutusaste_taso2 ='ööö' then null else d2.jarjestys_Koulutusaste_taso2 end as 'jarj. koulutusaste, taso 2'
	  , case 
			when d2.OKM_ohjauksen_ala_koodi='1' then 1 
			when d2.OKM_ohjauksen_ala_koodi='2' then 2 
			when d2.OKM_ohjauksen_ala_koodi='3' then 3 
			when d2.OKM_ohjauksen_ala_koodi='4' then 4
			when d2.OKM_ohjauksen_ala_koodi='5' then 5
			when d2.OKM_ohjauksen_ala_koodi='6' then 6
			when d2.OKM_ohjauksen_ala_koodi='7' then 7
			when d2.OKM_ohjauksen_ala_koodi='8' then 8  
			when d2.OKM_ohjauksen_ala_koodi='9' then 9
			when d2.OKM_ohjauksen_ala_koodi='10' then 10
			when d2.OKM_ohjauksen_ala_koodi='11' then 11
			when d2.OKM_ohjauksen_ala_koodi='12' then 12 
			when d2.OKM_ohjauksen_ala_koodi='-1' then 99999
		end as 'jarj. OKM ohjauksen ala'
	  , d2.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d2.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  	  ,NULL as 'aloituspaikat'
	  ,NULL as 'valintojen aloituspaikat'

	  
 -- Taloustiedot --
  ,NULL  AS 'Tilitaso 0'
  ,NULL  AS 'Tilitaso 1'
  ,NULL  AS 'Tilitaso 2'
  ,NULL  AS 'Tilitaso 3'
  ,NULL  AS 'Tilitaso 4'
  ,NULL  AS 'Tilitaso 5'
  ,NULL  AS 'Toiminto'
  ,NULL  AS 'Talousarvo'
  ,NULL as 'Talouserittely'
 FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] f
 left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on oppilaitos_id = d1.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.oppilaitoskoodi 
 left join VipunenTK.dbo.d_koulutusluokitus as d2 on koulutusluokitus_id = d2.id
 left join VipunenTK.dbo.d_kansalaisuus_versio2 as d3 on kansalaisuus_versio2_id = d3.id
 left join VipunenTK.dbo.d_alueluokitus as d20 on [koulutuksen_kunta]=d20.kunta_koodi 
 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=koulutus_koodi
 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
 Where aineisto = 'L' and tilastointivuosi>2010 and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d1.oppilaitostyyppikoodi='41'

 union all
/****** YO opetus- ja tutkimushenkilökunta sekä IV tutkijanuraporras ******/
SELECT 
		[vuosi]
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d50.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]=case  when d50.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , NULL as 'Koulutusnimike'
	  , NULL AS 'koulutusaste2002'
	  , d4.ohjauksenala_nimi_fi
	  , NULL AS 'Rahoitusmalliala (AMK)'
	  , NULL AS 'Rahoitusmalliala (YO)'
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
      ,NULL AS 'tutkinnot'--Läpäisy--
	  ,NULL as 'Aloituskausikoodi'
	  ,NULL as 'Valmistumiskausikoodi'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as [Suorittanut27] --suorittanu27
	  ,NULL as [suorittanut55ilmanPankkia] --suorittanut55ilmanpankkia
	  ,NULL as [suorittanut55pankinAvulla] --suorittanut55pankinavulla
	  ,NULL AS  'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  	  ,NULL as 'Kevät'
	  ,NULL as 'Syksy'
	  ,case when d7.koodi=1 then henkilotyovuosi else 0 end AS 'Opetus- ja tutkimushenkilökunta'
	  ,case when d8.koodi=4 then henkilotyovuosi else 0 end as 'IV tutkijanuraporras'

	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'AMK Julkaisut (A-E)'

	  --Kilpailtu rahoitus--
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ---  amk muut opintopisteet ---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

-- Opiskelijapalaute --
	  ,NULL as 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-YAMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  

--Hakijat--
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'

	  , d4.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
	  , '-1' as 'Koodit Koulutusnimike'
	  , d50.organisaatio_koodi as 'Koodit Organisaatio'
	  , NULL as 'Koodit kunta'	  
  	  , NULL AS 'jarjestys_iscle2011'
	  , NULL AS 'jarjestys_Koulutusaste_taso2'
	  , case 
			when d4.ohjauksenala_koodi='1' then 1 
			when d4.ohjauksenala_koodi='2' then 2 
			when d4.ohjauksenala_koodi='3' then 3 
			when d4.ohjauksenala_koodi='4' then 4
			when d4.ohjauksenala_koodi='5' then 5
			when d4.ohjauksenala_koodi='6' then 6
			when d4.ohjauksenala_koodi='7' then 7
			when d4.ohjauksenala_koodi='8' then 8  
			when d4.ohjauksenala_koodi='9' then 9
			when d4.ohjauksenala_koodi='10' then 10
			when d4.ohjauksenala_koodi='11' then 11
			when d4.ohjauksenala_koodi='12' then 12 
			when d4.ohjauksenala_koodi='-1' then 99999
		end as 'jarj. OKM ohjauksen ala'
	  , '99999' as 'jarj. rahoitusmalliala amk'
	  , '99999' as 'jarj. rahoitusmalliala yo'
	  , d91.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d91.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  	  ,NULL as 'aloituspaikat'
	  ,NULL as 'valintojen aloituspaikat'

	  
 -- Taloustiedot --
  ,NULL  AS 'Tilitaso 0'
  ,NULL  AS 'Tilitaso 1'
  ,NULL  AS 'Tilitaso 2'
  ,NULL  AS 'Tilitaso 3'
  ,NULL  AS 'Tilitaso 4'
  ,NULL  AS 'Tilitaso 5'
  ,NULL  AS 'Toiminto'
  ,NULL  AS 'Talousarvo'
  ,NULL as 'Talouserittely'
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
 where d7.koodi in (1,3) and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717') 

  union all


  /****** Julkaisut AMK******/
 
SELECT 
		tilastovuosi
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]=case  when d3.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  ,Null as 'Koulutusnimike'--case when d92.koulutussektori_koodi='5' then d92.koulutusluokitus_fi else null end as 'Koulutusnimike'
	  , NULL AS 'koulutusaste2002'
	  , d4.ohjauksenala_nimi_fi
	  , NULL AS 'Rahoitusmalliala (AMK)'
	  , NULL AS 'Rahoitusmalliala (YO)'
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
	  --Läpäisy--
	  ,NULL as 'Aloituskausikoodi'
	  ,NULL as 'Valmistumiskausikoodi'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as [Suorittanut27] --suorittanu27
	  ,NULL as [suorittanut55ilmanPankkia] --suorittanut55ilmanpankkia
	  ,NULL as [suorittanut55pankinAvulla] --suorittanut55pankinavulla
	  ,NULL AS  'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  	  ,NULL as 'Kevät'
	  ,NULL as 'Syksy'
	  ,NULL AS  'Opetus- ja tutkimushenkilökunta'
	  ,NULL AS  'IV tutkijanuraporras'

	  ,case when d3.oppilaitostyyppi_koodi='41' AND d5.julkaisufoorumitaso_koodi in (0,1,2,3) then julkaisunTunnus end as 'JulkaisuID'
	  ,case when d3.oppilaitostyyppi_koodi='41' then cast(julkaisufoorumitaso_koodi as integer) end as 'Jufotaso'
	 ,[julkaisutyyppi_koodi] as 'Julkaisutyyppi'
	  ,case when d3.oppilaitostyyppi_koodi='41' then lukumaara else NULL end AS 'AMK Julkaisut (A-F ja I)'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ---  amk muut opintopisteet ---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

-- Opiskelijapalaute --
	  ,NULL as 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-YAMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	 
--Hakijat--
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'

	  , d4.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
	  , '-1' as 'Koodit Koulutusnimike'
	  , d3.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  , NULL AS 'jarjestys_iscle2011'
	  , NULL AS 'jarjestys_Koulutusaste_taso2'
	  , case 
			when d4.ohjauksenala_koodi='1' then 1 
			when d4.ohjauksenala_koodi='2' then 2 
			when d4.ohjauksenala_koodi='3' then 3 
			when d4.ohjauksenala_koodi='4' then 4
			when d4.ohjauksenala_koodi='5' then 5
			when d4.ohjauksenala_koodi='6' then 6
			when d4.ohjauksenala_koodi='7' then 7
			when d4.ohjauksenala_koodi='8' then 8  
			when d4.ohjauksenala_koodi='9' then 9
			when d4.ohjauksenala_koodi='10' then 10
			when d4.ohjauksenala_koodi='11' then 11
			when d4.ohjauksenala_koodi='12' then 12 
			when d4.ohjauksenala_koodi='-1' then 99999
		end as 'jarj. OKM ohjauksen ala'
	  , '99999' as 'jarj. rahoitusmalliala amk'
	  , '99999' as 'jarj. rahoitusmalliala yo'
	  , d90.jarjestys_paatieteenala_koodi as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala_koodi as 'jarj. tieteenala'
	  	  ,NULL as 'aloituspaikat'
	  ,NULL as 'valintojen aloituspaikat'

 -- Taloustiedot --
  ,NULL  AS 'Tilitaso 0'
  ,NULL  AS 'Tilitaso 1'
  ,NULL  AS 'Tilitaso 2'
  ,NULL  AS 'Tilitaso 3'
  ,NULL  AS 'Tilitaso 4'
  ,NULL  AS 'Tilitaso 5'
  ,NULL  AS 'Toiminto'
  ,NULL  AS 'Talousarvo'
  ,NULL as 'Talouserittely'
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
 where d1.julkaisunpaaluokka_koodi in ('A', 'B', 'C', 'D', 'E','F','I') and tilastovuosi>2010 and d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d3.oppilaitostyyppi_koodi='41'

UNION ALL



  /****** AMK talous - tk rahoitus ******/
SELECT 
	 tilastovuosi as 'Tilastointivuosi'
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi  as 'Organisaatio'
	  ,[Sektori]='Sektori'
	  , NULL as 'Koulutusnimike'
	  ,NULL AS 'koulutusaste2002'-- d4.koulutusaste2002_fi AS 'koulutusaste2002'
	  ,NULL as 'Ohjauksen ala'-- d4.okmohjauksenala_fi as 'Ohjauksen ala'
	  , null AS 'Rahoitusmalliala (AMK)'
	  , NULL AS 'Rahoitusmalliala (YO)'--d5.OKM_ohjauksen_ala_yo_tav AS 'Rahoitusmalliala (YO)'
	  ,NULL AS 'Koulutusaste, taso1'-- d4.koulutusastetaso1_fi AS 'Koulutusaste, taso1'
	  ,NULL AS'Koulutusaste_taso2'-- d4.koulutusastetaso2_fi AS'Koulutusaste_taso2'
	  , NULL as 'Koulutusala, taso1' --d4.koulutusalataso1_fi AS 'Koulutusala, taso 1'
	  , null AS 'Koulutusala, taso 2'--d4.koulutusalataso2_fi AS 'Koulutusala, taso 2'
	  , null AS 'Koulutusala, taso 3' -- d4.koulutusalataso3_fi AS 'Koulutusala, taso 3'
	  , NULL as 'Tutkinnon aloitussykli'
	  ,NULL as 'Päätieteenala'
	  ,NULL as 'Tieteenala'
	  ,NULL as 'Tieteenala_avain'
	  ,null as 'Tutkijanuravaihe'
      ,NULL AS 'koulutuksen_kunta'
      ,NULL AS 'kansalaisuus'
      ,NULL AS 'tutkinnot'
	  --Läpäisy--
	  ,NULL as 'Aloituskausikoodi'
	  ,NULL as 'Valmistumiskausikoodi'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as [Suorittanut27] --suorittanu27
	  ,NULL as [suorittanut55ilmanPankkia] --suorittanut55ilmanpankkia
	  ,NULL as [suorittanut55pankinAvulla] --suorittanut55pankinavulla
	  ,NULL AS  'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  	  ,NULL as 'Kevät'
	  ,NULL as 'Syksy'
	  ,NULL AS  'Opetus- ja tutkimushenkilökunta'
	  ,NULL AS  'IV tutkijanuraporras'

	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'AMK Julkaisut (A-F ja I)'

	  --Kilpailtu rahoitus--
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'
  	  ,f.tutkimusrahoitus*1000 AS 'Ulkopuolinen tk-rahoitus'
	  ---  amk muut opintopisteet ---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  --- Sijoittuminen ---
	  ,null AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'Työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

-- Opiskelijapalaute --
	  ,NULL as 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-YAMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  
--Hakijat--
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'

	  ,NULL as 'Koodit OKM ohjauksen ala'
	  ,NULL as 'Koodit koulutusnimike' -- d5.koulutus_koodi as 'Koodit Koulutusnimike'
	  ,d3.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  , NULL as 'jarjestys_iscle2011'
	  , NULL as 'jarjestys_Koulutusaste_taso2'
	  , NULL as 'jarj. OKM ohjauksen ala'/*case 
			when d4.okmohjauksenala_fi='1' then 1 
			when d4.okmohjauksenala_fi='2' then 2 
			when d4.okmohjauksenala_fi='3' then 3 
			when d4.okmohjauksenala_fi='4' then 4
			when d4.okmohjauksenala_fi='5' then 5
			when d4.okmohjauksenala_fi='6' then 6
			when d4.okmohjauksenala_fi='7' then 7
			when d4.okmohjauksenala_fi='8' then 8  
			when d4.okmohjauksenala_fi='9' then 9
			when d4.okmohjauksenala_fi='10' then 10
			when d4.okmohjauksenala_fi='11' then 11
			when d4.okmohjauksenala_fi='12' then 12 
			when d4.okmohjauksenala_fi='-1' then 99999
		end as 'jarj. OKM ohjauksen ala'*/
	  , '99999' as 'jarj. rahoitusmalliala amk'
	  , '99999' as 'jarj. rahoitusmalliala yo'
	  , NULL as 'jarj. paatieteenala'
	  , NULL as 'jarj. tieteenala'
	  	  ,NULL as 'aloituspaikat'
	  ,NULL as 'valintojen aloituspaikat'

	  
 -- Taloustiedot --
  ,NULL  AS 'Tilitaso 0'
  ,NULL  AS 'Tilitaso 1'
  ,NULL  AS 'Tilitaso 2'
  ,NULL  AS 'Tilitaso 3'
  ,NULL  AS 'Tilitaso 4'
  ,NULL  AS 'Tilitaso 5'
  ,NULL  AS 'Toiminto'
  ,NULL  AS 'Talousarvo'
  ,NULL as 'Talouserittely'
FROM [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus] as f
  left join vipunenTK.dbo.d_tutkimuksen_rahoituslahde d1 on rahoituslahde_id=d1.id
  left join ANTERO.dw.d_organisaatioluokitus d3 on f.oppilaitos_avain=d3.organisaatio_koodi
 where d1.rahoituslahteen_tyyppi='ulkopuolinen rahoitus'and d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d3.oppilaitostyyppi_koodi='41'

  union all

   /****** AMK muut opintopisteet ******/

SELECT 
vuosi
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi  as 'Organisaatio'
	  ,[Sektori]='Sektori'
	  , NULL as 'Koulutusnimike'
	  ,NULL AS 'd2.koulutusaste2002'
	  , d4.ohjauksenala_nimi_fi
	  ,NULL AS 'Rahoitusmalliala (AMK)'
	  ,NULL AS 'Rahoitusmalliala (YO)'
	  ,NULL AS 'Koulutusaste, taso1'
	  ,NULL AS 'Koulutusaste_taso2'
	  ,NULL AS 'Koulutusala, taso 1'
	  ,NULL AS 'Koulutusala, taso 2'
	  ,NULL AS 'Koulutusala, taso 3'
	  , NULL as 'Tutkinnon aloitussykli'
	  ,d91.paatieteenala2010 'Päätieteenala'
	  ,d91.tieteenala2010 as 'Tieteenala'
	  ,d91.tieteenala_avain as 'Tieteenala_avain'
	  ,NULL AS 'Tutkijanuravaihe'
      ,NULL AS '[koulutuksen_kunta'
      ,NULL AS 'kansalaisuus'
      ,NULL AS 'tutkinnot'
	  --Läpäisy--
	  ,NULL as 'Aloituskausikoodi'
	  ,NULL as 'Valmistumiskausikoodi'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as [Suorittanut27] --suorittanu27
	  ,NULL as [suorittanut55ilmanPankkia] --suorittanut55ilmanpankkia
	  ,NULL as [suorittanut55pankinAvulla] --suorittanut55pankinavulla
	  ,NULL AS 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  	  ,NULL as 'Kevät'
	  ,NULL as 'Syksy'
	  ,NULL AS 'Opetus- ja tutkimushenkilökunta'
	  ,NULL AS 'IV tutkijanuraporras'

	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'AMK Julkaisut (A-F ja I)'

	  --Kilpailtu rahoitus--
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ---  amk opintopisteet ---
	  ,[kv_vaihtoopiskelijat_op_lkm] as 'kv_vaihtoopiskelijat_op_lkm'
	  ,[ulkom_hyv_op_lkm] as 'ulkom_hyv_luetut_op_lkm'
	  ,[ulkom_harj_op_lkm] as 'ulkom_harj_op_lkm'
	  ,[avoinamk_op_amk_lkm] as 'avoin_op__lkm'
	  ,f.kk_yhteistyo_op_lkm as kk_yhteistyo_op_lkm
	  ,[erilopintooik_op_lkm] as 'erilopintooik_op_lkm'
      ,[erikoul_suor_op_lkm] as 'erikoul_suor_op_lkm'
	  ,f.mamu_op_lkm AS 'mamu_op_lkm'
	  
	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

-- Opiskelijapalaute --
	  ,NULL as 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-YAMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'

--Hakijat--
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'

	  , d4.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
	  , '-1' as 'Koodit Koulutusnimike'
	  , d3.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  ,NULL AS 'jarjestys_iscle2011'
	  ,NULL AS 'jarjestys_Koulutusaste_taso2'
	  , case 
			when d4.ohjauksenala_koodi='1' then 1 
			when d4.ohjauksenala_koodi='2' then 2 
			when d4.ohjauksenala_koodi='3' then 3 
			when d4.ohjauksenala_koodi='4' then 4
			when d4.ohjauksenala_koodi='5' then 5
			when d4.ohjauksenala_koodi='6' then 6
			when d4.ohjauksenala_koodi='7' then 7
			when d4.ohjauksenala_koodi='8' then 8  
			when d4.ohjauksenala_koodi='9' then 9
			when d4.ohjauksenala_koodi='10' then 10
			when d4.ohjauksenala_koodi='11' then 11
			when d4.ohjauksenala_koodi='12' then 12 
			when d4.ohjauksenala_koodi='-1' then 99999
		end as 'jarj. OKM ohjauksen ala'
	  , '99999' as 'jarj. rahoitusmalliala amk'
	  , '99999' as 'jarj. rahoitusmalliala yo'
	  , d90.jarjestys_paatieteenala_koodi as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala_koodi as 'jarj. tieteenala'
	  	  ,NULL as 'aloituspaikat'
	  ,NULL as 'valintojen aloituspaikat'

	  
 -- Taloustiedot --
  ,NULL  AS 'Tilitaso 0'
  ,NULL  AS 'Tilitaso 1'
  ,NULL  AS 'Tilitaso 2'
  ,NULL  AS 'Tilitaso 3'
  ,NULL  AS 'Tilitaso 4'
  ,NULL  AS 'Tilitaso 5'
  ,NULL  AS 'Toiminto'
  ,NULL  AS 'Talousarvo'
  ,NULL as 'Talouserittely'
 FROM [ANTERO].[dw].[f_amk_opintopisteet] f
 LEFT join antero.dw.d_amk d10 on d_amk_id=d10.id
 LEFT join antero.dw.d_organisaatioluokitus d3 on d10.amk_tunnus=d3.organisaatio_koodi
 LEFT JOIN antero.dw.d_ohjauksenala d4 ON d_ohjauksenala_id = d4.id
 left join ANTERO.dw.d_tieteenala d90 on d90.id='-1'
   left join VipunenTK.dbo.d_tieteenala d91 on 'TTHV_'+d90.tieteenala_koodi=d91.tieteenala_avain
   where d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717') 

  union all


 /****** Työllistyminen ******/

SELECT 
	tilastointivuosi
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi  as 'Organisaatio'
	  ,[Sektori]=case  when d3.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , D11.koulutus as 'Koulutusnimike'
	  , D11.koulutusaste2002
	  , D11.OKM_ohjauksen_ala
	  , d11.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala (AMK)'
	  , d11.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala (YO)'
	  , d11.iscle2011
	  , d11.Koulutusaste_taso2
	  , d11.iscfibroad2013 as 'Koulutusala, taso 1'
	  , d11.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , d11.iscfi2013 as 'Koulutusala, taso 3'
	  , NULL as 'Tutkinnon aloitussykli'
	  , RIGHT(d90.paatieteenala2010,LEN(d90.paatieteenala2010)-CHARINDEX(' ',d90.paatieteenala2010)) as 'Päätieteenala'
	  , RIGHT(d90.tieteenala2010,LEN(d90.tieteenala2010)-CHARINDEX(' ',d90.tieteenala2010)) as 'Tieteenala'
	  , d90.tieteenala_avain as 'Tieteenala_avain'
	  , null as 'Tutkijanuravaihe'
      ,null as 'koulutuksen_kunta'
      ,case when d60.maa in ('Suomi','Ahvenanmaa') then 'Suomi' when d60.maa in ('Islanti', 'Liechtenstein', 'Norja') or (d60.eumaa_koodi=1 or d60.etamaa_koodi=1) then 'EU/ETA' else 'Muu' end
      ,NULL AS 'tutkinnot'
	  --Läpäisy--
	  ,NULL as 'Aloituskausikoodi'
	  ,NULL as 'Valmistumiskausikoodi'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as [Suorittanut27] --suorittanu27
	  ,NULL as [suorittanut55ilmanPankkia] --suorittanut55ilmanpankkia
	  ,NULL as [suorittanut55pankinAvulla] --suorittanut55pankinavulla
	  ,NULL AS 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  	  ,NULL as 'Kevät'
	  ,NULL as 'Syksy'
	  ,NULL AS 'Opetus- ja tutkimushenkilökunta'
	  ,NULL AS 'IV tutkijanuraporras'

	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'AMK Julkaisut (A-F ja I)'

	  --Kilpailtu rahoitus--
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ---  amk muut opintopisteet ---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  --- Sijoittuminen ---
	  ,sijoittuminen_1v_tutkinnon_jalkeen
	  ,case when d4.paaasiallinen_toiminta_okm_koodi=1 then sijoittuminen_1v_tutkinnon_jalkeen else null end as 'Työlliset 1v tutkinnon jälkeen'
	  ,sijoittuminen_3v_tutkinnon_jalkeen
	  ,case when d4.paaasiallinen_toiminta_okm_koodi=1 then sijoittuminen_3v_tutkinnon_jalkeen else null end as 'Työlliset 3v tutkinnon jälkeen'
	  ,case when d5.paaasiallinen_toiminta_versio2_koodi in (10,13) then sijoittuminen_3v_tutkinnon_jalkeen else null end as 'Työlliset 3v (ver2 10,13)'
	  ,case when d5.paaasiallinen_toiminta_versio2_koodi=12 then sijoittuminen_3v_tutkinnon_jalkeen else null end as 'Työttömät 3v (ver2, 12)'

-- Opiskelijapalaute --
	  ,NULL as 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-YAMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'
	  

--Hakijat--
	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet'

	  , d11.OKM_ohjauksen_ala_koodi as 'Koodit OKM ohjauksen ala'
	  , d11.koulutus_koodi as 'Koodit Koulutusnimike'
	  , d3.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  , case when d11.jarjestys_iscle2011 ='ööö' then null else d11.jarjestys_iscle2011 end as 'jarj. koulutusaste, taso 1'
	  , case when d11.jarjestys_Koulutusaste_taso2 ='ööö' then null else d11.jarjestys_Koulutusaste_taso2 end as 'jarj. koulutusaste, taso 2'
	  , case 
			when d11.OKM_ohjauksen_ala_koodi='1' then 1 
			when d11.OKM_ohjauksen_ala_koodi='2' then 2 
			when d11.OKM_ohjauksen_ala_koodi='3' then 3 
			when d11.OKM_ohjauksen_ala_koodi='4' then 4
			when d11.OKM_ohjauksen_ala_koodi='5' then 5
			when d11.OKM_ohjauksen_ala_koodi='6' then 6
			when d11.OKM_ohjauksen_ala_koodi='7' then 7
			when d11.OKM_ohjauksen_ala_koodi='8' then 8  
			when d11.OKM_ohjauksen_ala_koodi='9' then 9
			when d11.OKM_ohjauksen_ala_koodi='10' then 10
			when d11.OKM_ohjauksen_ala_koodi='11' then 11
			when d11.OKM_ohjauksen_ala_koodi='12' then 12 
			when d11.OKM_ohjauksen_ala_koodi='-1' then 99999
		end as 'jarj. OKM ohjauksen ala'
	  , d11.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d11.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  ,NULL as 'aloituspaikat'
	  ,NULL as 'valintojen aloituspaikat'

	  
 -- Taloustiedot --
  ,NULL  AS 'Tilitaso 0'
  ,NULL  AS 'Tilitaso 1'
  ,NULL  AS 'Tilitaso 2'
  ,NULL  AS 'Tilitaso 3'
  ,NULL  AS 'Tilitaso 4'
  ,NULL  AS 'Tilitaso 5'
  ,NULL  AS 'Toiminto'
  ,NULL  AS 'Talousarvo'
  ,NULL as 'Talouserittely'
 FROM [VipunenTK].[dbo].f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta f
 LEFT join antero.dw.d_organisaatioluokitus d3 on oppilaitos=d3.organisaatio_koodi
 LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d11 on koulutusluokitus_id=d11.id
 left join VipunenTK.dbo.d_valtio d60 on kansalaisuus_maanosa_id=d60.id
 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=f.koulutusluokitus
 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
 left join VipunenTK.dbo.d_paaasiallinen_toiminta_okm as d4 on paaasiallinen_toiminta_okm_id=d4.id
 left join vipunentk.dbo.d_paaasiallinen_toiminta_versio2 as d5 on f.paaasiallinen_toiminta_versio2_id=d5.id
 Where aineisto='L' and 
 tilastointivuosi>2010 and 
 d11.koulutusaste2002_koodi in ('62','71','63','72','82') AND 
 d3.oppilaitostyyppi_koodi='41' and 
 d3.organisaatio_koodi <> '02557' AND 
 d3.organisaatio_koodi <> '10031'  AND 
 NOT (sijoittuminen_1v_tutkinnon_jalkeen = 0 AND sijoittuminen_3v_tutkinnon_jalkeen = 0 AND sijoittuminen_5v_tutkinnon_jalkeen = 0) and 
 d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717') 

 union all


     /****** ARVO ******/

SELECT
	 d13.vuosi AS 'Tilastovuosi'
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi  as 'Organisaatio'
	  ,[Sektori]=case  when d3.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  ,d2.koulutus as 'Koulutusnimike'
	  ,NULL AS  'koulutusaste2002'
	  ,d12.okmohjauksenala_fi
	  , d2.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala (AMK)'
	  , d2.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala (YO)'
	  ,d12.koulutusastetaso1_fi
	  ,d12.koulutusastetaso2_fi
	  ,d12.koulutusalataso1_fi as 'Koulutusala, taso 1'
	  ,d12.koulutusalataso2_fi as 'Koulutusala, taso 2'
	  ,d12.koulutusalataso3_fi as 'Koulutusala, taso 3'
	  ,NULL as 'Tutkinnon aloitussykli'
	  , RIGHT(d90.paatieteenala2010,LEN(d90.paatieteenala2010)-CHARINDEX(' ',d90.paatieteenala2010)) as 'Päätieteenala'
	  , RIGHT(d90.tieteenala2010,LEN(d90.tieteenala2010)-CHARINDEX(' ',d90.tieteenala2010)) as 'Tieteenala'
	  , d90.tieteenala_avain as 'Tieteenala_avain'
	  ,null as 'Tutkijanuravaihe'
      ,NULL AS 'koulutuksen_kunta'
      ,NULL AS 'kansalaisuus'
      ,NULL AS 'tutkinnot'
	  --Läpäisy--
	  ,NULL as 'Aloituskausikoodi'
	  ,NULL as 'Valmistumiskausikoodi'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as [Suorittanut27] --suorittanu27
	  ,NULL as [suorittanut55ilmanPankkia] --suorittanut55ilmanpankkia
	  ,NULL as [suorittanut55pankinAvulla] --suorittanut55pankinavulla
	  ,NULL AS 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  	  ,NULL as 'Kevät'
	  ,NULL as 'Syksy'
	  ,NULL AS 'Opetus- ja tutkimushenkilökunta'
	  ,NULL AS 'IV tutkijanuraporras'
	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'AMK Julkaisut (A-F ja I)'

	  --Kilpailtu rahoitus--'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ---  amk muut opintopisteet ---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  --- Sijoittuminen ---
	  ,null AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'Työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

	  -- Opiskelijapalaute --

	  ,case when kyselypohja='AVOP-AMK' and rahoitusmallikysymys='1' then 
		 case when d14.kysymysid in ('1477','73') and numerovalinta='0' then cast(7 as integer)
			when  d14.kysymysid in ('1477','73') and numerovalinta='1' then cast(5.5 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='2' then cast(4 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='3' then cast(2.5 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='4' then cast(1 as integer)
			when d14.vastaustyyppi='arvosana7' then cast(numerovalinta as integer) else null
			end
		end as 'AVOP-AMK pistemäärä'
	   ,case when kyselypohja='AVOP-YAMK' and rahoitusmallikysymys='1' then 
		 case when d14.kysymysid in ('1477','73') and numerovalinta='0' then cast(7 as integer)
			when  d14.kysymysid in ('1477','73') and numerovalinta='1' then cast(5.5 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='2' then cast(4 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='3' then cast(2.5 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='4' then cast(1 as integer)
			when d14.vastaustyyppi='arvosana7' then cast(numerovalinta as integer) else null
			end
		end as 'AVOP-YAMK pistemäärä'
	  ,case when d14.kysymysryhmaid in ('10','11','12') and d13.kyselypohja='AVOP-AMK' then 
		 case when d14.kysymysid in ('1477','73') and numerovalinta='0' then cast(7 as integer)
			when  d14.kysymysid in ('1477','73') and numerovalinta='1' then cast(5.5 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='2' then cast(4 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='3' then cast(2.5 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='4' then cast(1 as integer)
			when d14.vastaustyyppi='arvosana7' then cast(numerovalinta as integer) else null
			end
		end as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,case when d14.kysymysryhmaid in ('10','11') and d13.kyselypohja='AVOP-YAMK' then 
		 case when d14.kysymysid in ('1477','73') and numerovalinta='0' then cast(7 as integer)
			when  d14.kysymysid in ('1477','73') and numerovalinta='1' then cast(5.5 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='2' then cast(4 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='3' then cast(2.5 as integer)
			when d14.kysymysid in ('1477','73') and numerovalinta='4' then cast(1 as integer)
			when d14.vastaustyyppi='arvosana7' then cast(numerovalinta as integer) else null
			end
		end as 'AVOP-YAMK Opiskelijapalaute_työelämä'

	  --Hakijat--

	  ,NULL as 'Ensisijainen hakija'
	  ,NULL as 'Paikan vastaanottaneet' 

	  , d12.okmohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
	  , d2.koulutus_koodi as 'Koodit Koulutusnimike'
	  , d3.organisaatio_koodi as 'Koodit organisaatio'
	  ,NULL as 'Koodit kunta'
	  , case when d12.jarjestys_koulutusastetaso1_koodi ='ööö' then null else d12.jarjestys_koulutusastetaso1_koodi end as 'jarj. koulutusaste, taso 1'
	  , case when d12.jarjestys_koulutusastetaso2_koodi ='ööö' then null else d12.jarjestys_koulutusastetaso2_koodi end as 'jarj. koulutusaste, taso 2'
	  , case 
			when d12.okmohjauksenala_koodi='1' then 1 
			when d12.okmohjauksenala_koodi='2' then 2 
			when d12.okmohjauksenala_koodi='3' then 3 
			when d12.okmohjauksenala_koodi='4' then 4
			when d12.okmohjauksenala_koodi='5' then 5
			when d12.okmohjauksenala_koodi='6' then 6
			when d12.okmohjauksenala_koodi='7' then 7
			when d12.okmohjauksenala_koodi='8' then 8  
			when d12.okmohjauksenala_koodi='9' then 9
			when d12.okmohjauksenala_koodi='10' then 10
			when d12.okmohjauksenala_koodi='11' then 11
			when d12.okmohjauksenala_koodi='12' then 12 
			when d12.okmohjauksenala_koodi='-1' then 99999
		end as 'jarj. OKM ohjauksen ala'
	  , d2.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d2.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  	  ,NULL as 'aloituspaikat'
	  ,NULL as 'valintojen aloituspaikat'


	  
 -- Taloustiedot --
  ,NULL  AS 'Tilitaso 0'
  ,NULL  AS 'Tilitaso 1'
  ,NULL  AS 'Tilitaso 2'
  ,NULL  AS 'Tilitaso 3'
  ,NULL  AS 'Tilitaso 4'
  ,NULL  AS 'Tilitaso 5'
  ,NULL  AS 'Toiminto'
  ,NULL  AS 'Talousarvo'
  ,NULL as 'Talouserittely'
	  FROM [ANTERO].dw.f_arvo f
 left join antero.dw.d_organisaatioluokitus d3 on d_organisaatio_id= d3.id
 left JOIN ANTERO.dw.d_koulutusluokitus d12 on d_koulutusluokitus_id=d12.id
 left join antero.dw.d_arvokyselykerta d13 on d_arvokyselykerta_id=d13.id
 left join antero.dw.d_arvokysymys d14 on d_arvokysymys_id=d14.id
 left join VipunenTK.dbo.d_koulutusluokitus d2 on d2.koulutusluokitus_avain=d12.koulutusluokitus_koodi
 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=d2.koulutusluokitus_avain
 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
 LEFT JOIN dw.d_kalenteri d22 ON f.d_kalenteri_id=d22.id
 where d3.oppilaitostyyppi_koodi='41' and d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717') AND
 (d14.kysymysryhmaid  <('14') or d14.kysymysryhmaid between 117 and 124 and  kyselypohja in ('KANDIPALAUTE','AVOP-AMK'))

 union all


 /****** HAKU ja valinta ******/

SELECT
		koulutuksen_alkamisvuosi
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi  as 'Organisaatio'
	  ,[Sektori]=case  when d3.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  ,case when (d6.koodi=1 and d7.koulutus_koodi=d10.I_sykli_kandi) then d7a.koulutus else d7.koulutus end as 'Koulutusnimike'
	  ,d12.koulutusaste2002_fi AS  'koulutusaste2002'
	  ,d12.okmohjauksenala_fi
	  ,d7.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala (AMK)'
	  ,d7.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala (YO)'
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
	  --Läpäisy--
	  ,NULL as 'Aloituskausikoodi'
	  ,NULL as 'Valmistumiskausikoodi'
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as [Suorittanut27] --suorittanu27
	  ,NULL as [suorittanut55ilmanPankkia] --suorittanut55ilmanpankkia
	  ,NULL as [suorittanut55pankinAvulla] --suorittanut55pankinavulla
	  ,NULL AS 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
	  	  ,NULL as 'Kevät'
	  ,NULL as 'Syksy'
	  ,NULL AS 'Opetus- ja tutkimushenkilökunta'
	  ,NULL AS 'IV tutkijanuraporras'

	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'AMK Julkaisut (A-F ja I)'

	  --Kilpailtu rahoitus--
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus (SA,Tekes, EU-puiteohjelma)'
	  ---  amk muut opintopisteet ---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  --- Sijoittuminen ---
	  ,null AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'Työlliset 1v tutkinnon jälkeen'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

-- Opiskelijapalaute --
	  ,NULL as 'AVOP-AMK pistemäärä'
	  ,NULL as 'AVOP-YAMK pistemäärä'
	  ,NULL as 'AVOP-AMK Opiskelijapalaute_työelämä'
	  ,NULL as 'AVOP-YAMK Opiskelijapalaute_työelämä'

--Hakijat--
	  ,case when f.hakutoive =1 then f.henkilo_oid else null end as 'Ensisijainen hakija'
	  ,case when f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then f.henkilo_oid else null end as 'Paikan vastaanottaneet'

	  , d12.okmohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
	  , d7.koulutus_koodi as 'Koodit Koulutusnimike'
	  , d3.organisaatio_koodi as 'Koodit organisaatio'
	  ,NULL as 'Koodit kunta'
	  , case when d12.jarjestys_koulutusastetaso1_koodi ='ööö' then null else d12.jarjestys_koulutusastetaso1_koodi end as 'jarj. koulutusaste, taso 1'
	  , case when d12.jarjestys_koulutusastetaso2_koodi ='ööö' then null else d12.jarjestys_koulutusastetaso2_koodi end as 'jarj. koulutusaste, taso 2'
	  , case 
			when d12.okmohjauksenala_koodi='1' then 1 
			when d12.okmohjauksenala_koodi='2' then 2 
			when d12.okmohjauksenala_koodi='3' then 3 
			when d12.okmohjauksenala_koodi='4' then 4
			when d12.okmohjauksenala_koodi='5' then 5
			when d12.okmohjauksenala_koodi='6' then 6
			when d12.okmohjauksenala_koodi='7' then 7
			when d12.okmohjauksenala_koodi='8' then 8  
			when d12.okmohjauksenala_koodi='9' then 9
			when d12.okmohjauksenala_koodi='10' then 10
			when d12.okmohjauksenala_koodi='11' then 11
			when d12.okmohjauksenala_koodi='12' then 12 
			when d12.okmohjauksenala_koodi='-1' then 99999
		end as 'jarj. OKM ohjauksen ala'
	  , d7.jarjestys_OKM_ohjauksen_ala_amk_tav as 'jarj. rahoitusmalliala amk'
	  , d7.jarjestys_OKM_ohjauksen_ala_yo_tav as 'jarj. rahoitusmalliala yo'
	  , d90.jarjestys_paatieteenala2010 as 'jarj. paatieteenala'
	  , d90.jarjestys_tieteenala2010 as 'jarj. tieteenala'
	  ,NULL as 'aloituspaikat'
	  ,NULL as 'valintojen aloituspaikat'


  -- Taloustiedot --
  ,NULL  AS 'Tilitaso 0'
  ,NULL  AS 'Tilitaso 1'
  ,NULL  AS 'Tilitaso 2'
  ,NULL  AS 'Tilitaso 3'
  ,NULL  AS 'Tilitaso 4'
  ,NULL  AS 'Tilitaso 5'
  ,NULL  AS 'Toiminto'
  ,NULL  AS 'Talousarvo'
  ,NULL as 'Talouserittely'
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
	where d12.koulutussektori_koodi=5  and d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d3.oppilaitostyyppi_koodi='41'




GO
USE [ANTERO]