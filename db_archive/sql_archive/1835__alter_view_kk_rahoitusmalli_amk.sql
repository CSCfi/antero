USE [ANTERO]
GO

/****** Object:  View [dw].[v_kk_rahoitusmalli_yo]    Script Date: 12.9.2018 14:08:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Alter view [dw].[v_kk_rahoitusmalli_yo] as

  
/****** Korkeakoulututkinnot ******/
SELECT 
	[tilastointivuosi] as 'Tilastovuosi'
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

	  ,NULL AS 'Läsnäolevat opiskelijat (55op)'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL as [Suorittanut27] --suorittanu27
	  ,NULL as [suorittanut55ilmanPankkia] --suorittanut55ilmanpankkia
	  ,NULL as [suorittanut55pankinAvulla] --suorittanut55pankinavulla
	  ,NULL as 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS '1-14op suorittaneet' --lkm_op1_14
	  ,NULL as 'Läsnä kevät' --- UUSI
	  ,NULL as 'Läsnä syksy' --- UUSI
	  ,NULL AS 'Yliopiston opetus- ja tutkimushenkilötyövuodet'
	  ,NULL AS 'IV tutkijanuraportaan henkilötyövuodet'
	 
	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,null AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  --Kilpailtu rahoitus--
	  ,NULL AS 'Ulk. kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'

	  
	  --- Muut Opintopisteet---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
      ,NULL as 'erillisilla_oik_opkoul_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL as 'kaikki_tutk_lkm'
	  ,NULL as 'tki_pisteet_lkm'
	  ,NULL as 'tki_harj_pisteet_lkm'
	  ,NULL as 'tki_muu_pisteet_lkm'
	  ,NULL as 'vierkiel_pisteet_lkm'


	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,null as 'työlliset 1v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 1v (ver2 10,13)'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

	-- Opiskelijapalaute --
		,NULL as 'Kandikyselyn pistemäärä'
		,NULL as 'Kysymysryhmä_id'
		,NULL as 'Kysymysryhmä'
		,NULL as 'Rahoitusmallikysymys'

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
	  
	

 FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	 left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on oppilaitos_id = d1.id
	 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.oppilaitoskoodi 
	 left join VipunenTK.dbo.d_koulutusluokitus as d2 on koulutusluokitus_id = d2.id
	 left join VipunenTK.dbo.d_kansalaisuus_versio2 as d3 on kansalaisuus_versio2_id = d3.id
	 left join VipunenTK.dbo.d_alueluokitus as d20 on [koulutuksen_kunta]=d20.kunta_koodi
	 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=f.koulutusluokitus
	 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
 Where (aineisto = 'L' or (aineisto = 'E' and tilastointivuosi=YEAR(GETDATE())-1)) and tilastointivuosi>2010 and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d1.oppilaitostyyppikoodi='42'

union all
/****** 55op suorittaneet ******/
SELECT 
      
      [Tilastovuosi] = f.[vuosi]
	  ,d1.organisaatio_fi as 'Organisaatio'
	  ,[Sektori]=case  when d1.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  ,d2.koulutusluokitus_fi as 'Koulutusnimike'
	  ,null As 'koulutusala2002'
	  ,[OKM ohjauksen ala] = coalesce(d2.okmohjauksenala_fi,'Tuntematon')
	  ,d60.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala (AMK)'
	  ,d60.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala (YO)'
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
	  
	  ,[Lasna] = case when f.lasna_syksy_edellinen=1 or f.lasna_kevat=1 then 1 else 0 end
	  ,[Suorittanut55] = case when f.[suorittanut27]=1 or f.[suorittanut55ilmanPankkia]=1 or f.[suorittanut55PankinAvulla]=1 then 1 else 0 end
	  ,[Suorittanut27]
	  ,[suorittanut55ilmanPankkia]
	  ,[suorittanut55pankinAvulla]
	  ,NULL AS  'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL AS 'lkm_op1_14'
      ,f.lasna_kevat as 'Läsnä kevät'
	  ,f.lasna_syksy_edellinen as 'Läsnä syksy'
	  ,NULL AS 'opetus- tutkimushenkilökunta HTV'
	  ,NULL AS 'IV porras HTV'
	  
	  --Julkaisut--
	  ,NULL as 'JulkaisuID'
	  ,NULL as 'Jufotaso'
	  ,NULL as 'Julkaisutyyppi'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,null AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  
	  --Kilpailtu rahoitus--
	  ,NULL AS 'Ulk. kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'

	  
	  --- Muut Opintopisteet---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
      ,NULL as 'erillisilla_oik_opkoul_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL as 'kaikki_tutk_lkm'
	  ,NULL as 'tki_pisteet_lkm'
	  ,NULL as 'tki_harj_pisteet_lkm'
	  ,NULL as 'tki_muu_pisteet_lkm'
	  ,NULL as 'vierkiel_pisteet_lkm'
	 
	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 1v (ver2 10,13)'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

	-- Opiskelijapalaute --
	,NULL as 'Kandikyselyn pistemäärä'
	,NULL as 'Kysymysryhmä_id'
	,NULL as 'Kysymysryhmä'
	,NULL as 'Rahoitusmallikysymys'


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
	  

  FROM [ANTERO].[dw].[f_virta_otp_55_tilasto] f
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatio_id
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.id=f.d_koulutusluokitus_id
	left join VipunenTK.dbo.d_koulutusluokitus d60 on d2.koulutusluokitus_koodi=d60.koulutusluokitus_avain
	left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=d60.koulutusluokitus_avain
	left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
where (vuosi>2010 and vuosi<YEAR(getdate())) and d1.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d1.oppilaitostyyppi_koodi='42'

union all
/****** 1-14op suorittaneet ******/
SELECT 
		[tilastointivuosi]
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
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,null AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	 
	  --Kilpailtu rahoitus--
	  ,NULL AS 'Ulk. kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'

	  
	  --- Muut Opintopisteet---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
      ,NULL as 'erillisilla_oik_opkoul_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL as 'kaikki_tutk_lkm'
	  ,NULL as 'tki_pisteet_lkm'
	  ,NULL as 'tki_harj_pisteet_lkm'
	  ,NULL as 'tki_muu_pisteet_lkm'
	  ,NULL as 'vierkiel_pisteet_lkm'
	  
	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 1v (ver2 10,13)'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

	-- Opiskelijapalaute --
	  ,NULL as 'Kandikyselyn pistemäärä'
	  ,NULL as 'Kysymysryhmä_id'
	  ,NULL as 'Kysymysryhmä'
	  ,NULL as 'Rahoitusmallikysymys'


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


 FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] f
 left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on oppilaitos_id = d1.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.oppilaitoskoodi 
 left join VipunenTK.dbo.d_koulutusluokitus as d2 on koulutusluokitus_id = d2.id
 left join VipunenTK.dbo.d_kansalaisuus_versio2 as d3 on kansalaisuus_versio2_id = d3.id
 left join VipunenTK.dbo.d_alueluokitus as d20 on [koulutuksen_kunta]=d20.kunta_koodi 
 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=koulutus_koodi
 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
 Where aineisto = 'L' and tilastointivuosi>2010 and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d1.oppilaitostyyppikoodi='42'

 union all
/****** YO opetus- ja tutkimushenkilökunta sekä IV tutkijanuraporras ******/
SELECT 
		[vuosi]
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
      ,NULL AS 'tutkinnot'

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
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,null AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  
	  --Kilpailtu rahoitus--
	  ,NULL AS 'Ulk. kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'

	  
	  --- Muut Opintopisteet---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
      ,NULL as 'erillisilla_oik_opkoul_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL as 'kaikki_tutk_lkm'
	  ,NULL as 'tki_pisteet_lkm'
	  ,NULL as 'tki_harj_pisteet_lkm'
	  ,NULL as 'tki_muu_pisteet_lkm'
	  ,NULL as 'vierkiel_pisteet_lkm'
	  
	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 1v (ver2 10,13)'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

	-- Opiskelijapalaute --
	  ,NULL as 'Kandikyselyn pistemäärä'
	  ,NULL as 'Kysymysryhmä_id'
	  ,NULL as 'Kysymysryhmä'
	  ,NULL as 'Rahoitusmallikysymys'

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


  /****** Julkaisut YO******/
 
SELECT 
		tilastovuosi
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

	  ,case when d3.oppilaitostyyppi_koodi='41' OR (d3.oppilaitostyyppi_koodi='42' AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d5.julkaisufoorumitaso_koodi in (1,2,3)) then julkaisunTunnus end as 'JulkaisuID'
	  ,case when (d3.oppilaitostyyppi_koodi='41' OR d3.oppilaitostyyppi_koodi='42') then cast(julkaisufoorumitaso_koodi as integer) end as 'Jufotaso'
	 ,[julkaisutyyppi_koodi] as 'Julkaisutyyppi'
	  ,case when d3.oppilaitostyyppi_koodi='42' AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d5.julkaisufoorumitaso_koodi in (2,3) then lukumaara else NULL end AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,case when d3.oppilaitostyyppi_koodi='42' AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d5.julkaisufoorumitaso_koodi in (1,2,3) then lukumaara else NULL end AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,case when d3.oppilaitostyyppi_koodi='42' AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1') AND d5.julkaisufoorumitaso_koodi in (1,2,3) then lukumaara else NULL end AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,case when d3.oppilaitostyyppi_koodi='42' AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d5.julkaisufoorumitaso_koodi in (1,2,3) AND d_kansainvalinen_yhteisjulkaisu_id=2 then lukumaara else NULL end AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'Ulk. kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'

	  
	  --- Muut Opintopisteet---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
      ,NULL as 'erillisilla_oik_opkoul_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL as 'kaikki_tutk_lkm'
	  ,NULL as 'tki_pisteet_lkm'
	  ,NULL as 'tki_harj_pisteet_lkm'
	  ,NULL as 'tki_muu_pisteet_lkm'
	  ,NULL as 'vierkiel_pisteet_lkm'
	  
	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 1v (ver2 10,13)'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

		-- Opiskelijapalaute --
	  ,NULL as 'Kandikyselyn pistemäärä'
	  ,NULL as 'Kysymysryhmä_id'
	  ,NULL as 'Kysymysryhmä'
	  ,NULL as 'Rahoitusmallikysymys'


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
 FROM [ANTERO].[dw].[f_virta_jtp_tilasto] f
	 left join ANTERO.dw.d_julkaisutyyppi as d1 on d_julkaisutyyppi_id = d1.id
	 left join ANTERO.dw.d_koulutusala_2002 as d2 on d_koulutusala02_id = d2.id
	 left join ANTERO.dw.d_ohjauksenala as d4 on d_ohjauksenala_id = d4.id
	 left join ANTERO.dw.d_organisaatioluokitus as d3 on d_organisaatio_id = d3.id
	 left join ANTERO.dw.d_tieteenala d90 on d90.id=f.d_tieteenala_id
	 left join VipunenTK_lisatiedot.dbo.tieteenalan_TTHV d90a on 'TA10_'+d90.tieteenala_koodi=d90a.Tieteenala2010
	 left join VipunenTK.dbo.d_tieteenala d91 on d90a.TTHV=d91.tieteenala_avain
	 left join antero.dw.d_julkaisufoorumitaso as d5 on d_julkaisufoorumitaso_id=d5.id
 where d1.julkaisunpaaluokka_koodi in ('A', 'B', 'C', 'D', 'E') and tilastovuosi>2010 and d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717') and d3.oppilaitostyyppi_koodi='42'

UNION ALL
    /****** YO talous ******/

SELECT
		tilikausi as 'Tilastointivuosi'
      , d50.organisaatio_fi  as 'Organisaatio'
	  ,[Sektori]='Yliopisto'
	  , NULL as 'Koulutusnimike'
	  , NULL AS 'koulutusaste2002'
	  , d4.ohjauksenala_nimi_fi
	  , NULL AS 'Rahoitusmalliala (AMK)'
	  , NULL AS 'Rahoitusmalliala (YO)'
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
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,null AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  
	  --Kilpailtu rahoitus--
	  ,case when tili_taso2_fi IN ('EU-puiteohjelmarahoitus ja muu laadullisesti kilpailtu EU-rahoitus','Ulkomaiset rahastot ja säätiöt','Kansainväliset järjestöt', 'Muu ulkomainen rahoitus') then arvo else 0 end AS 'Ulk. kilpailtu tutkimusrahoitus'
	  ,case when tili_taso2_fi IN ('Suomen Akatemia','Tekes','Kotimaiset yritykset','Ulkomaiset yritykset') then arvo else 0 end AS 'Kilpailtu tutkimusrahoitus rah_malli'
  	  
	  
	  --- Muut Opintopisteet---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
      ,NULL as 'erillisilla_oik_opkoul_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL as 'kaikki_tutk_lkm'
	  ,NULL as 'tki_pisteet_lkm'
	  ,NULL as 'tki_harj_pisteet_lkm'
	  ,NULL as 'tki_muu_pisteet_lkm'
	  ,NULL as 'vierkiel_pisteet_lkm'
	  
	  --- Sijoittuminen ---
	  ,null AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'Työlliset 1v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 1v (ver2 10,13)'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

		-- Opiskelijapalaute --
	  ,NULL as 'Kandikyselyn pistemäärä'
	  ,NULL as 'Kysymysryhmä_id'
	  ,NULL as 'Kysymysryhmä'
	  ,NULL as 'Rahoitusmallikysymys'

	  , d4.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
	  , '-1' as 'Koodit Koulutusnimike'
	  , d50.organisaatio_koodi as 'Koodit organisaatio'
	  , NULL as 'Koodit kunta'
  	  , NULL as 'jarjestys_iscle2011'
	  , NULL as 'jarjestys_Koulutusaste_taso2'
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
	  

 FROM [ANTERO].[dw].[f_yo_talous] f
 LEFT JOIN ANTERO.DW.d_tili d5 ON d_tili_id = d5.id
 LEFT join antero.dw.d_yo d10 on d_yo_id=d10.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d10.yo_tunnus 
 LEFT JOIN antero.dw.d_ohjauksenala d4 ON d_ohjauksenala_id = d4.id
 LEFT join antero.dw.d_opintoala95 d2 ON d_opintoala95_id = d2.id
 left join ANTERO.dw.d_tieteenala d90 on d90.id='-1'
 left join antero.dw.d_aineistotyyppi d1 on f.d_aineistotyyppi_id=d1.id
 Left JOIN antero.dw.d_toiminto d6 ON f.d_toiminto_id = d6.id
 WHERE konserni='E' AND d1.aineistotyyppi_koodi='L' and d50.organisaatio_koodi not in ('02358', '01740', '01742', '01717')

 union all


   /****** YO Vaihto-opiskelijoiden (lähteneet ja saapuneet) opintopisteet ******/

SELECT 
	vuosi
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
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,null AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  
	  --Kilpailtu rahoitus--
	  ,NULL AS 'Ulk. kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'

	  
	  ---  Yliopisto opintopisteet ---
	,kv_vaihtoopiskelijat_op_lkm as 'kv_vaihtoopiskelijat_op_lkm'
	,ulkom_hyv_luetut_op_lkm as 'ulkom_hyv_luetut_op_lkm'
	,[ulkom_harj_op_lkm] as 'ulkom_harj_op_lkm'
	,[avoinop_lkm] as 'avoin_op__lkm'
	,[joo_op_lkm] as 'kk_yhteistyo_op_lkm'
	,[erillisilla_oik_op_lkm] as 'erilopintooik_op_lkm'
	,NULL as 'erillisilla_oik_opkoul_op_lkm'
	,[erikoul_suor_op_lkm] as 'erikoul_suor_op_lkm'
	,NULL AS 'mamu_op_lkm'
	,[kaikki_tutk_op_lkm]  as 'kaikki_tutk_lkm'
	,[tki_pisteet_lkm] = null
	,[tki_harj_pisteet_lkm] = null
	,[tki_muu_pisteet_lkm] = null
	,[vierkielper_op_lkm] as 'vierkiel_pisteet_lkm'

	  --- Sijoittuminen ---
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'työlliset 1v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 1v (ver2 10,13)'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

	-- Opiskelijapalaute --
	  ,NULL as 'Kandikyselyn pistemäärä'
	  ,NULL as 'Kysymysryhmä_id'
	  ,NULL as 'Kysymysryhmä'
	  ,NULL as 'Rahoitusmallikysymys'

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
	  
	  

FROM [ANTERO].[dw].[f_yo_opintopisteet] f
 LEFT join antero.dw.d_yo d10 on d_yo_id=d10.id
 LEFT join antero.dw.d_organisaatioluokitus d3 on d10.yo_tunnus=d3.organisaatio_koodi
 LEFT JOIN antero.dw.d_ohjauksenala d4 ON d_ohjauksenala_id = d4.id

 left join ANTERO.dw.d_tieteenala d90 on d90.id='-1'
   left join VipunenTK.dbo.d_tieteenala d91 on 'TTHV_'+d90.tieteenala_koodi=d91.tieteenala_avain
   where d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717') 

  union all


 /****** Työllistyminen ******/

SELECT 
	tilastointivuosi
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
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,null AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  
	  --Kilpailtu rahoitus--
	  ,NULL AS 'Ulk. kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'

	  
	  --- Muut Opintopisteet---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
      ,NULL as 'erillisilla_oik_opkoul_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL as 'kaikki_tutk_lkm'
	  ,NULL as 'tki_pisteet_lkm'
	  ,NULL as 'tki_harj_pisteet_lkm'
	  ,NULL as 'tki_muu_pisteet_lkm'
	  ,NULL as 'vierkiel_pisteet_lkm'
	  
	  --- Sijoittuminen ---
	  ,sijoittuminen_1v_tutkinnon_jalkeen
	  ,case when d4.paaasiallinen_toiminta_okm_koodi=1 then sijoittuminen_1v_tutkinnon_jalkeen else null end as 'Työlliset 1v tutkinnon jälkeen'
	  ,case when d5.paaasiallinen_toiminta_versio2_koodi in (10,13) then sijoittuminen_1v_tutkinnon_jalkeen else null end as 'Työlliset 1v (ver2 10,13)'
	  ,sijoittuminen_3v_tutkinnon_jalkeen
	  ,case when d4.paaasiallinen_toiminta_okm_koodi=1 then sijoittuminen_3v_tutkinnon_jalkeen else null end as 'Työlliset 3v tutkinnon jälkeen'
	  ,case when d5.paaasiallinen_toiminta_versio2_koodi in (10,13) then sijoittuminen_3v_tutkinnon_jalkeen else null end as 'Työlliset 3v (ver2 10,13)'
	  ,case when d5.paaasiallinen_toiminta_versio2_koodi=12 then sijoittuminen_3v_tutkinnon_jalkeen else null end as 'Työttömät 3v (ver2, 12)'

	-- Opiskelijapalaute --
	  ,NULL as 'Kandikyselyn pistemäärä'
	  ,NULL as 'Kysymysryhmä_id'
	  ,NULL as 'Kysymysryhmä'
	  ,NULL as 'Rahoitusmallikysymys'


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
 d3.oppilaitostyyppi_koodi='42' and 
 d3.organisaatio_koodi <> '02557' AND 
 d3.organisaatio_koodi <> '10031'  AND 
 NOT (sijoittuminen_1v_tutkinnon_jalkeen = 0 AND sijoittuminen_3v_tutkinnon_jalkeen = 0 AND sijoittuminen_5v_tutkinnon_jalkeen = 0) and 
 d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717') 

 union all


     /****** ARVO ******/

SELECT
	 d13.vuosi AS 'Tilastovuosi'
      , d3.organisaatio_fi  as 'Organisaatio'
	  ,[Sektori]=case  when d3.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  ,d2.koulutus as 'Koulutusnimike'
	  ,NULL AS  'koulutusaste2002'
	  ,d12.okmohjauksenala_fi
	  ,d2.OKM_ohjauksen_ala_amk_tav as 'Rahoitusmalliala (AMK)'
	  ,d2.OKM_ohjauksen_ala_yo_tav as 'Rahoitusmalliala (YO)'
	  ,d12.koulutusastetaso1_fi
	  ,d12.koulutusastetaso2_fi
	  ,d12.koulutusalataso1_fi as 'Koulutusala, taso 1'
	  ,d12.koulutusalataso2_fi as 'Koulutusala, taso 2'
	  ,d12.koulutusalataso3_fi as 'Koulutusala, taso 3'
	  ,NULL as 'Tutkinnon aloitussykli'
	  ,RIGHT(d90.paatieteenala2010,LEN(d90.paatieteenala2010)-CHARINDEX(' ',d90.paatieteenala2010)) as 'Päätieteenala'
	  ,RIGHT(d90.tieteenala2010,LEN(d90.tieteenala2010)-CHARINDEX(' ',d90.tieteenala2010)) as 'Tieteenala'
	  ,d90.tieteenala_avain as 'Tieteenala_avain'
	  ,null as 'Tutkijanuravaihe'
      ,NULL AS 'koulutuksen_kunta'
      ,NULL AS 'kansalaisuus'
      ,NULL AS 'tutkinnot'
	  
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
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1) jufotaso 1-3'
	  ,null AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  
	  --Kilpailtu rahoitus--'
	  ,NULL AS 'Ulk. kilpailtu tutkimusrahoitus'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus rah_malli'

	  
	  --- Muut Opintopisteet---
	  ,NULL as 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL as 'ulkom_hyv_luetut_op_lkm'
	  ,NULL as 'ulkom_harj_op_lkm'
	  ,NULL as 'avoin_op__lkm'
	  ,NULL as 'kk_yhteistyo_op_lkm'
	  ,NULL as 'erilopintooik_op_lkm'
      ,NULL as 'erillisilla_oik_opkoul_op_lkm'
	  ,NULL as 'erikoul_suor_op_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL as 'kaikki_tutk_lkm'
	  ,NULL as 'tki_pisteet_lkm'
	  ,NULL as 'tki_harj_pisteet_lkm'
	  ,NULL as 'tki_muu_pisteet_lkm'
	  ,NULL as 'vierkiel_pisteet_lkm'
	  
	  --- Sijoittuminen ---
	  ,null AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,NULL AS 'Työlliset 1v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 1v (ver2 10,13)'
	  ,null AS 'sijoittuminen_3v_tutkinnon_jalkeen'
	  ,NULL as 'Työlliset 3v tutkinnon jälkeen'
	  ,NULL as 'Työlliset 3v (ver2 10,13)'
	  ,NULL as 'Työttömät 3v (ver2, 12)'

	  -- Opiskelijapalaute --
	  ,case 
		when (kyselypohja='KANDIPALAUTE') AND (d14.kysymysid in ('1150','1116','1168','1119','1147','1142','1139','1138','1117','1140','1120','1149','1136')) then numerovalinta 
		else null 
	   end as 'Kandikyselyn pistemäärä'
	  ,d14.kysymysryhmaid as 'Kysymysryhmä_id'
	  ,d14.kysymysryhma_fi as 'Kysymysryhmä'
	  ,case when d14.rahoitusmallikysymys = 1 then 'Kyllä' 
				when d14.rahoitusmallikysymys = 0 then 'Ei' 
		else 'Tieto puuttuu' end as 'Rahoitusmallikysymys'


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
	  


	  FROM [ANTERO].dw.f_arvo f
	 left join antero.dw.d_organisaatioluokitus d3 on d_organisaatio_id= d3.id
	 left JOIN ANTERO.dw.d_koulutusluokitus d12 on d_koulutusluokitus_id=d12.id
	 left join antero.dw.d_arvokyselykerta d13 on d_arvokyselykerta_id=d13.id
	 left join antero.dw.d_arvokysymys d14 on d_arvokysymys_id=d14.id
	 left join VipunenTK.dbo.d_koulutusluokitus d2 on d2.koulutusluokitus_avain=d12.koulutusluokitus_koodi
	 left join VipunenTK_lisatiedot.dbo.koulutuskoodin_tieteenala d59 on d59.koulutuskoodi=d2.koulutusluokitus_avain
	 left join VipunenTK.dbo.d_tieteenala d90 on d90.tieteenala_avain=d59.tieteenala_avain
	 LEFT JOIN dw.d_kalenteri d22 ON f.d_kalenteri_id=d22.id
 where d3.oppilaitostyyppi_koodi='42' and d3.organisaatio_koodi not in ('02358', '01740', '01742', '01717') AND kyselypohja='KANDIPALAUTE' and rahoitusmallikysymys='1' and d13.vuosi<YEAR(getdate())




 


	





GO


USE [ANTERO]