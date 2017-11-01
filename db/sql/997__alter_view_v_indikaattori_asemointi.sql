
ALTER view [dw].[v_indikaattori_asemointi] as

/****** Korkeakoulututkinnot ******/
SELECT [tilastointivuosi] as 'Tilastovuosi'
	  ,Null as 'Aloituslukuvuosi (läpäisy)' 
      ,d50.organisaatio_fi as 'Oppilaitos'
	  ,[Sektori]=case  when d50.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , d2.koulutusaste2002 as 'Koulutusaste 2002'
	  , d2.OKM_ohjauksen_ala 'OKM ohjauksen ala'
	  , d2.iscle2011 as 'Koulutusaste, taso 1'
	  , d2.Koulutusaste_taso2 'Koulutusaste, taso 2'
	  , d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , d2.iscfi2013 as 'Koulutusala, taso 3'
      ,d20.kunta as 'Kunta'
      ,d3.[kansalaisuus_versio2] as 'Kansalaisuus'
      ,[tutkinnot]
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
	  ,NULL AS 'Ammattikorkeakoulun opetus- ja TKI henkilökunta'
	  ,NULL AS 'AMK Julkaisut (A-F, I)'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL AS 'kv_vaihtoopiskelijat_op_lkm'
	  ,NULL AS 'ulkom_hyv_luetut_op_lkm'
	  ,NULL AS 'erilopintooik_op_lkm'
	  ,NULL AS 'avoinamk_op_amk_lkm'
	  ,NULL AS 'mamu_op_lkm'
	  ,NULL AS 'erikoul_suor_op_lkm'
	  ,NULL AS 'sijoittuminen_1v_tutkinnon_jalkeen'
	  ,null as 'työlliset 1v tutkinnon jälkeen'
	  ,null AS 'Kandikyselyn pistemäärä'
	  ,null AS 'AVOP-AMK pistemäärä'
	  , d2.jarjestys_iscfi2013 as 'jarj. koulutusala, taso 3'
	  , d2.jarjestys_iscfibroad2013 as 'jarj. koulutusala, taso 1'
	  , d2.jarjestys_iscfinarrow2013 as 'jarj. koulutusala, taso 2'
  	  , d2.jarjestys_iscle2011 as 'jarj. koulutusaste, taso 1'
	  , d2.jarjestys_Koulutusaste_taso2 as 'jarj. koulutusaste, taso 2'
	  , d2.jarjestys_OKM_ohjauksen_ala as 'jarj. OKM ohjauksen ala'
 FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot]
 left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on oppilaitos_id = d1.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.oppilaitoskoodi 
 left join VipunenTK.dbo.d_koulutusluokitus as d2 on koulutusluokitus_id = d2.id
 left join VipunenTK.dbo.d_kansalaisuus_versio2 as d3 on kansalaisuus_versio2_id = d3.id
 left join VipunenTK.dbo.d_alueluokitus as d20 on [koulutuksen_kunta]=d20.kunta_koodi
 Where aineisto = 'L' and tilastointivuosi>2010 AND koulutusaste2002_koodi in ('62','71','63','72','82')

 union all
/****** Läpäisy ******/
 SELECT 
		case when tarkastelujakso='7,5' then d10.vuosiselite+7
			When  tarkastelujakso='5,5' then d10.vuosiselite+5
			end as 'Tilastovuosi'
	  ,d10.lukuvuosi as 'Aloituslukuvuosi (läpäisy)' 
      ,d50.organisaatio_fi
	  ,[Sektori]=case  when d50.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , d2.koulutusaste2002
	  , d2.OKM_ohjauksen_ala
	  , d2.iscle2011 as 'Koulutusaste, taso1'
	  , d2.Koulutusaste_taso2
	  , d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , d2.iscfi2013 as 'Koulutusala, taso 3'
      ,[koulutuksen_kunta] = NULL
      ,[kansalaisuus_versio2]=NULL
      ,[tutkinnot] = NULL
	  ,case when tarkastelujakso='7,5' and (koulutusaste2002_koodi=72 OR koulutus_koodi in (612101, 613101,613401) OR koulutus_koodi=672401) then 1 else 0 end AS 'YO_7v_aloittaneet_lkm'
	  ,case when tarkastelujakso='5,5' AND koulutusaste2002_koodi=62 then 1 else 0 end AS 'AMK_5v_Aloittaneet_lkm'
	  ,case when tarkastelujakso='7,5' and (koulutusaste2002_koodi=72 OR koulutus_koodi in (612101, 613101,613401) OR koulutus_koodi=672401) and [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]='Tutkinto alkuperäisessä tutkintolajissa' then 1 else 0 end AS '7v_suorittaneet_lkm'
	  ,case when tarkastelujakso='5,5' AND koulutusaste2002_koodi=62 and [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]='Tutkinto alkuperäisessä tutkintolajissa' then 1 else 0 end AS '5v_suorittaneet_lkm'
	  ,NULL --lasna
	  ,NULL --suorittanut55
	  ,NULL -- 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL --lkm_op1_14
	  ,NULL --opetus- tutkimushenkilökunta HTV
	  ,NULL --IV porras HTV
	  ,NULL --'Opetus- ja TKI henkilökunta'
	  ,NULL --'AMK Julkaisut (A-F, I)'
	  ,NULL --'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL --'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL --'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL --'Kilpailtu tutkimusrahoitus'
	  ,NULL --kv_vaihtoopiskelijat_op_lkm
	  ,NULL --ulkom_hyv_luetut_op_lkm
	  ,NULL --erilopintooik_op_lkm
	  ,NULL --avoinamk_op_amk_lkm
	  ,NULL --mamu_op_lkm
	  ,NULL --erikoul_suor_op_lkm
	  ,NULL --sijoittuminen_1v_tutkinnon_jalkeen
	  ,null --työlliset 1v tutkinnon jälkeen
	  ,null --'Kandikyselyn pistemäärä'
	  ,null --'AVOP-AMK pistemäärä'
	  , d2.jarjestys_iscfi2013
	  , d2.jarjestys_iscfibroad2013
	  , d2.jarjestys_iscfinarrow2013
  	  , d2.jarjestys_iscle2011
	  , d2.jarjestys_Koulutusaste_taso2
	  , d2.jarjestys_OKM_ohjauksen_ala
 FROM [VipunenTK].[dbo].[f_aloittaneiden_lapaisy]
 left join VipunenTK.dbo.d_kausi AS d10 ON d10.kausi_id = aloituskausikoodi
 left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on oppilaitoksen_taustatiedot_id = d1.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.oppilaitoskoodi 
 left join VipunenTK.dbo.d_koulutusluokitus as d2 on koulk_id= d2.id
 where 
[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne'
AND ((tarkastelujakso = '5,5' and koulutussektori= 'Ammattikorkeakoulukoulutus'AND koulutusaste2002_koodi=62) 
OR (tarkastelujakso= '7,5' and  koulutussektori= 'Yiopistokoulutus' and (koulutusaste2002_koodi=72 OR koulutus_koodi in (612101, 613101,613401) OR koulutus_koodi=672401))) 

union all
/****** 55op suorittaneet ******/
select 
      
      [Tilastovuosi] = f.[vuosi]
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
	  ,[Korkeakoulu] = d1.organisaatio_fi
	  ,[Sektori]=case  when d1.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  ,NULL
	  ,[OKM ohjauksen ala] = coalesce(d2.okmohjauksenala_fi,'Tuntematon')
	  ,[Koulutusaste, taso 1] = coalesce(d2.koulutusastetaso1_fi,'Tuntematon')
	  ,[Koulutusaste, taso 2] = coalesce(d2.Koulutusastetaso2_fi,'Tuntematon')
	  ,[Koulutusala, taso 1] = coalesce(d2.koulutusalataso1_fi,'Tuntematon')
	  ,[Koulutusala, taso 2] = coalesce(d2.koulutusalataso2_fi,'Tuntematon')
	  ,[Koulutusala, taso 3] = coalesce(d2.koulutusalataso3_fi,'Tuntematon')
	  ,NULL
	  ,NULL
	  ,NULL --tutkinnot
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,[Lasna] = case when f.edellinenSyysolo=1 or f.olok=1 then 1 else 0 end
	  ,[Suorittanut55] = case when f.[suorittanut27]=1 or f.[suorittanut55ilmanPankkia]=1 or f.[suorittanut55PankinAvulla]=1 then 1 else 0 end
	  ,NULL -- 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL --lkm_op1_14
	  ,NULL --opetus- tutkimushenkilökunta HTV
	  ,NULL --IV porras HTV
	  ,NULL --'Opetus- ja TKI henkilökunta'
	  ,NULL --'AMK Julkaisut (A-F, I)'
	  ,NULL --'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL --'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL --'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL --'Kilpailtu tutkimusrahoitus'
	  ,NULL --kv_vaihtoopiskelijat_op_lkm
	  ,NULL --ulkom_hyv_luetut_op_lkm
	  ,NULL --erilopintooik_op_lkm
	  ,NULL --avoinamk_op_amk_lkm
	  ,NULL --mamu_op_lkm
	  ,NULL --erikoul_suor_op_lkm
	  ,NULL --sijoittuminen_1v_tutkinnon_jalkeen
	  ,null --työlliset 1v tutkinnon jälkeen
	  ,null --'Kandikyselyn pistemäärä'
	  ,null --'AVOP-AMK pistemäärä'
	  ,[Koulutusala, taso 3 jarj] = d2.koulutusalataso3_koodi
	  ,[Koulutusala, taso 1 jarj] = d2.koulutusalataso1_koodi
	  ,[Koulutusala, taso 2 jarj] = d2.koulutusalataso2_koodi
	  ,[Koulutusaste, taso 1 jarj] = d2.koulutusastetaso1_koodi
	  ,[Koulutusaste, taso 2 jarj] = d2.koulutusastetaso2_koodi
	  ,[OKM ohjauksen ala jarj] = d60.jarjestys_OKM_ohjauksen_ala
  FROM [ANTERO].[sa].[sa_virta_otp_viisviis] f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=f.oppilaitostunnus
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi=f.tkoodi
left join VipunenTK.dbo.d_koulutusluokitus d60 on d2.koulutusluokitus_koodi=d60.koulutus_koodi
where vuosi>2010

union all
/****** 1-14op suorittaneet ******/
SELECT [tilastointivuosi]
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      ,d50.organisaatio_fi
	  ,[Sektori]=case  when d50.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , d2.koulutusaste2002
	  , d2.OKM_ohjauksen_ala
	  , d2.iscle2011 as 'Koulutusaste, taso1'
	  , d2.Koulutusaste_taso2
	  , d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , d2.iscfi2013 as 'Koulutusala, taso 3'
      ,d20.kunta as 'Kunta'
      ,d3.[kansalaisuus_versio2]
      ,NULL --tutkinnot
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,[1-14 lasna]= case when f_OTV_2_8_Korkeakouluopiskelijat.opiskelijan_olo_syys=1 then f_OTV_2_8_Korkeakouluopiskelijat.lukumaara else 0 END
	  ,lkm_op1_14
	  ,NULL --opetus- tutkimushenkilökunta HTV
	  ,NULL --IV porras HTV
	  ,NULL --'Opetus- ja TKI henkilökunta'
	  ,NULL --'AMK Julkaisut (A-F, I)'
	  ,NULL --'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL --'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL --'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL --'Kilpailtu tutkimusrahoitus'
	  ,NULL --kv_vaihtoopiskelijat_op_lkm
	  ,NULL --ulkom_hyv_luetut_op_lkm
	  ,NULL --erilopintooik_op_lkm
	  ,NULL --avoinamk_op_amk_lkm
	  ,NULL --mamu_op_lkm
	  ,NULL --erikoul_suor_op_lkm
	  ,NULL --sijoittuminen_1v_tutkinnon_jalkeen
	  ,null --työlliset 1v tutkinnon jälkeen
	  ,null --'Kandikyselyn pistemäärä'
	  ,null --'AVOP-AMK pistemäärä'
	  , d2.jarjestys_iscfi2013
	  , d2.jarjestys_iscfibroad2013
	  , d2.jarjestys_iscfinarrow2013
  	  , d2.jarjestys_iscle2011
	  , d2.jarjestys_Koulutusaste_taso2
	  , d2.jarjestys_OKM_ohjauksen_ala
 FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]
 left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on oppilaitos_id = d1.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.oppilaitoskoodi 
 left join VipunenTK.dbo.d_koulutusluokitus as d2 on koulutusluokitus_id = d2.id
 left join VipunenTK.dbo.d_kansalaisuus_versio2 as d3 on kansalaisuus_versio2_id = d3.id
 left join VipunenTK.dbo.d_alueluokitus as d20 on [koulutuksen_kunta]=d20.kunta_koodi 
 Where aineisto = 'L' and tilastointivuosi>2010 and d2.koulutusaste2002_koodi in ('62','71')

 union all
 /****** YO opetus- ja tutkimushenkilökunta sekä IV tutkijanuraporras ******/
SELECT [vuosi]
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d50.organisaatio_fi
	  ,[Sektori]=case  when d50.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , NULL --d2.koulutusaste2002
	  , d4.ohjauksenala_nimi_fi
	  , NULL --d2.iscle2011 as 'Koulutusaste, taso1'
	  , NULL --d2.Koulutusaste_taso2
	  , NULL --d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , NULL --d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , NULL --d2.iscfi2013 as 'Koulutusala, taso 3'
      ,NULL --[koulutuksen_kunta]
      ,case when d60.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') then 'Suomi' when d60.maatjavaltiot2_fi in ('Islanti', 'Liechtenstein', 'Norja') then 'EU/ETA' else 'Muu' end
      ,NULL --tutkinnot
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL -- 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL --lkm_op1_14
	  ,case when d_tehtavanjaottelu_id=0 then henkilotyovuosi else 0 end AS 'Opetus- ja tutkimushenkilökunta'
	  ,case when d_tutkijanuravaihe_id=3 then henkilotyovuosi else 0 end as 'IV tutkijanuraporras'
	  ,NULL --'Opetus- ja TKI henkilökunta'
	  ,NULL --'AMK Julkaisut (A-F, I)'
	  ,NULL --'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL --'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL --'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL --'Kilpailtu tutkimusrahoitus'
	  ,NULL --kv_vaihtoopiskelijat_op_lkm
	  ,NULL --ulkom_hyv_luetut_op_lkm
	  ,NULL --erilopintooik_op_lkm
	  ,NULL --avoinamk_op_amk_lkm
	  ,NULL --mamu_op_lkm
	  ,NULL --erikoul_suor_op_lkm
	  ,NULL --sijoittuminen_1v_tutkinnon_jalkeen
	  ,null --työlliset 1v tutkinnon jälkeen
	  ,null --'Kandikyselyn pistemäärä'
	  ,null --'AVOP-AMK pistemäärä'
	  , NULL --d2.jarjestys_iscfi2013
	  , NULL --d2.jarjestys_iscfibroad2013
	  , NULL --d2.jarjestys_iscfinarrow2013
  	  , NULL --d2.jarjestys_iscle2011
	  , NULL --d2.jarjestys_Koulutusaste_taso2
	  ,d4.jarjestys_ohjauksenala_koodi
 FROM [ANTERO].[dw].[f_yo_henkilon_tyo]
 left join ANTERO.dw.d_yo as d1 on d_yliopisto_id = d1.id
 left join ANTERO.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.yo_tunnus
 left join ANTERO.dw.d_koulutusala_2002 as d2 on d_koulutusala_id = d2.id
 left join ANTERO.dw.d_ohjauksenala as d4 on d_ohjauksenala_id = d4.id
 left join ANTERO.dw.d_maatjavaltiot2 d60 on d60.id=d_kansalaisuus_id
 where d_tehtavanjaottelu_id = 0 OR d_tutkijanuravaihe_id=3

  union all
  /****** AMK opetus- ja TKI henkilökunta ******/
SELECT [vuosi]
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d50.organisaatio_fi
	  , [Sektori]='Ammattikorkeakoulu'
	  , NULL --d2.koulutusaste2002
	  , d4.ohjauksenala_nimi_fi
	  , NULL --d2.iscle2011 as 'Koulutusaste, taso1'
	  , NULL --d2.Koulutusaste_taso2
	  , NULL --d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , NULL --d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , NULL --d2.iscfi2013 as 'Koulutusala, taso 3'
      ,NULL --[koulutuksen_kunta]
      ,case when d60.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') then 'Suomi' when d60.maatjavaltiot2_fi in 
	  ('Islanti', 'Liechtenstein', 'Norja', 'Alankomaat', 'Belgia', 'Bulgaria', 'Espanja', 'Irlanti', 'Italia', 'Itävalta', 'Kreikka', 'Kroatia','Kypros', 'Latvia', 'Liettua', 'Luxemburg', 'Malta', 'Portugali', 'Puola', 'Ranska', 'Romania', 'Ruotsi', 'Saksa', 'Slovakia', 'Slovenia', 'Tanska', 'Tšekki', 'Unkari', 'Viro', 'Britannia') 
	  then 'EU/ETA' else 'Muu' end as 'Kansalaisuus'
      ,NULL --tutkinnot
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL -- 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL --lkm_op1_14
	  ,NULL -- 'Opetus- ja tutkimushenkilökunta'
	  ,NULL -- 'IV tutkijanuraporras'
	  ,henkilotyovuosi AS 'Opetus- ja TKI henkilökunta'
	  ,NULL --'AMK Julkaisut (A-F, I)'
	  ,NULL --'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL --'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL --'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL --'Kilpailtu tutkimusrahoitus'
	  ,NULL --kv_vaihtoopiskelijat_op_lkm
	  ,NULL --ulkom_hyv_luetut_op_lkm
	  ,NULL --erilopintooik_op_lkm
	  ,NULL --avoinamk_op_amk_lkm
	  ,NULL --mamu_op_lkm
	  ,NULL --erikoul_suor_op_lkm
	  ,NULL --sijoittuminen_1v_tutkinnon_jalkeen
	  ,null --työlliset 1v tutkinnon jälkeen
	  ,null --'Kandikyselyn pistemäärä'
	  ,null --'AVOP-AMK pistemäärä'
	  , NULL --d2.jarjestys_iscfi2013
	  , NULL --d2.jarjestys_iscfibroad2013
	  , NULL --d2.jarjestys_iscfinarrow2013
  	  , NULL --d2.jarjestys_iscle2011
	  , NULL --d2.jarjestys_Koulutusaste_taso2
	  ,d4.jarjestys_ohjauksenala_koodi
 FROM [ANTERO].[dw].[f_amk_henkilon_tyo]
 left join ANTERO.dw.d_amk as d1 on d_amk_id = d1.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d1.amk_tunnus
 left join ANTERO.dw.d_koulutusala_2002 as d2 on d_koulutusala02_id = d2.id
 left join ANTERO.dw.d_ohjauksenala as d4 on d_ohjauksenala_id = d4.id
 left join ANTERO.dw.d_maatjavaltiot2 d60 on d60.id=d_maa_id
 
 where d_tehtavanjaottelu in (0, 1)

union all

  /****** Julkaisut ******/

SELECT tilastovuosi
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi
	  ,[Sektori]=case  when d3.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , NULL --d2.koulutusaste2002
	  , d4.ohjauksenala_nimi_fi
	  , NULL --d2.iscle2011 as 'Koulutusaste, taso1'
	  , NULL --d2.Koulutusaste_taso2
	  , NULL --d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , NULL --d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , NULL --d2.iscfi2013 as 'Koulutusala, taso 3'
      ,NULL --[koulutuksen_kunta]
      ,NULL --d3.[kansalaisuus_versio2]
      ,NULL --tutkinnot
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL -- 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL --lkm_op1_14
	  ,NULL -- 'Opetus- ja tutkimushenkilökunta'
	  ,NULL -- 'IV tutkijanuraporras'
	  ,NULL -- 'Opetus- ja TKI henkilökunta'
	  ,case when oppilaitostyyppi_koodi=41 then lukumaara else NULL end AS 'AMK Julkaisut (A-F, I)'
	  ,case when oppilaitostyyppi_koodi=42 AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d_julkaisufoorumitaso_id in (4,5) then lukumaara else NULL end AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,case when oppilaitostyyppi_koodi=42 AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d_julkaisufoorumitaso_id in (1,4,5) then lukumaara else NULL end AS 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,case when oppilaitostyyppi_koodi=42 AND julkaisutyyppi_koodi in ('A1','A2','A3','A4','C1','C2') AND d_julkaisufoorumitaso_id in (1,4,5) AND d_kansainvalinen_yhteisjulkaisu_id=2 then lukumaara else NULL end AS 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL --'Kilpailtu tutkimusrahoitus'
	  ,NULL --kv_vaihtoopiskelijat_op_lkm
	  ,NULL --ulkom_hyv_luetut_op_lkm
	  ,NULL --erilopintooik_op_lkm
	  ,NULL --avoinamk_op_amk_lkm
	  ,NULL --mamu_op_lkm
	  ,NULL --erikoul_suor_op_lkm
	  ,NULL --sijoittuminen_1v_tutkinnon_jalkeen
	  ,null --työlliset 1v tutkinnon jälkeen
	  ,null --'Kandikyselyn pistemäärä'
	  ,null --'AVOP-AMK pistemäärä'
	  , NULL --d2.jarjestys_iscfi2013
	  , NULL --d2.jarjestys_iscfibroad2013
	  , NULL --d2.jarjestys_iscfinarrow2013
  	  , NULL --d2.jarjestys_iscle2011
	  , NULL --d2.jarjestys_Koulutusaste_taso2
	  , d4.jarjestys_ohjauksenala_koodi
 FROM [ANTERO].[dw].[f_virta_jtp_tilasto]
 left join ANTERO.dw.d_julkaisutyyppi as d1 on d_julkaisutyyppi_id = d1.id
 left join ANTERO.dw.d_koulutusala_2002 as d2 on d_koulutusala02_id = d2.id
 left join ANTERO.dw.d_ohjauksenala as d4 on d_ohjauksenala_id = d4.id
 left join ANTERO.dw.d_organisaatioluokitus as d3 on d_organisaatio_id = d3.id

 where julkaisunpaaluokka_koodi in ('A', 'B', 'C', 'D', 'E', 'F', 'I') and oppilaitostyyppi_koodi in ('41','42')

 union all

   /****** YO talous ******/

SELECT tilikausi as 'Tilastointivuosi'
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d50.organisaatio_fi
	  ,[Sektori]='Yliopisto'
	  , NULL --d2.koulutusaste2002
	  , d4.ohjauksenala_nimi_fi
	  , NULL --d2.iscle2011 as 'Koulutusaste, taso1'
	  , NULL --d2.Koulutusaste_taso2
	  , NULL --d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , NULL --d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , NULL --d2.iscfi2013 as 'Koulutusala, taso 3'
      ,NULL --[koulutuksen_kunta]
      ,NULL --d3.[kansalaisuus_versio2]
      ,NULL --tutkinnot
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL -- 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL --lkm_op1_14
	  ,NULL -- 'Opetus- ja tutkimushenkilökunta'
	  ,NULL -- 'IV tutkijanuraporras'
	  ,NULL -- 'Opetus- ja TKI henkilökunta'
	  ,NULL -- 'AMK Julkaisut (A-F, I)'
	  ,NULL -- 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL -- 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL -- 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,case when tili_taso2_fi IN ('Suomen Akatemia','Tekes','Kotimaiset yritykset','Ulkomaiset yritykset','EU-puiteohjelmarahoitus ja muu laadullisesti kilpailtu EU-rahoitus','Ulkomaiset rahastot ja säätiöt','Kansainväliset järjestöt', 'Muu ulkomainen rahoitus') then arvo else 0 end AS 'Kilpailtu tutkimusrahoitus'
	  ,NULL --kv_vaihtoopiskelijat_op_lkm
	  ,NULL --ulkom_hyv_luetut_op_lkm
	  ,NULL --erilopintooik_op_lkm
	  ,NULL --avoinamk_op_amk_lkm
	  ,NULL --mamu_op_lkm
	  ,NULL --erikoul_suor_op_lkm
	  ,NULL --sijoittuminen_1v_tutkinnon_jalkeen
	  ,null --työlliset 1v tutkinnon jälkeen
	  ,null --'Kandikyselyn pistemäärä'
	  ,null --'AVOP-AMK pistemäärä'
	  , NULL --d2.jarjestys_iscfi2013
	  , NULL --d2.jarjestys_iscfibroad2013
	  , NULL --d2.jarjestys_iscfinarrow2013
  	  , NULL --d2.jarjestys_iscle2011
	  , NULL --d2.jarjestys_Koulutusaste_taso2
	  ,d4.jarjestys_ohjauksenala_koodi
 FROM [ANTERO].[dw].[f_yo_talous]
 LEFT JOIN ANTERO.DW.d_tili d5 ON d_tili_id = d5.id
 LEFT join antero.dw.d_yo d10 on d_yo_id=d10.id
 left join antero.dw.d_organisaatioluokitus as d50 on d50.organisaatio_koodi=d10.yo_tunnus 
 LEFT JOIN antero.dw.d_ohjauksenala d4 ON d_ohjauksenala_id = d4.id
 LEFT join antero.dw.d_opintoala95 d2 ON d_opintoala95_id = d2.id

 WHERE konserni='E' AND d_aineistotyyppi_id=1

 union all

   /****** YO Vaihto-opiskelijoiden (lähteneet ja saapuneet) opintopisteet ******/

SELECT vuosi
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi
	  ,[Sektori]='Yliopisto'
	  , NULL --d2.koulutusaste2002
	  , d4.ohjauksenala_nimi_fi
	  , NULL --d2.iscle2011 as 'Koulutusaste, taso1'
	  , NULL --d2.Koulutusaste_taso2
	  , NULL --d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , NULL --d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , NULL --d2.iscfi2013 as 'Koulutusala, taso 3'
      ,NULL --[koulutuksen_kunta]
      ,NULL --d3.[kansalaisuus_versio2]
      ,NULL --tutkinnot
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL -- 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL --lkm_op1_14
	  ,NULL -- 'Opetus- ja tutkimushenkilökunta'
	  ,NULL -- 'IV tutkijanuraporras'
	  ,NULL -- 'Opetus- ja TKI henkilökunta'
	  ,NULL -- 'AMK Julkaisut (A-F, I)'
	  ,NULL -- 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL -- 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL -- 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL -- 'Kilpailtu tutkimusrahoitus'
	  ,kv_vaihtoopiskelijat_op_lkm
	  ,ulkom_hyv_luetut_op_lkm
	  ,NULL --erilopintooik_op_lkm
	  ,NULL --avoinamk_op_amk_lkm
	  ,NULL --mamu_op_lkm
	  ,NULL --erikoul_suor_op_lkm
	  ,NULL --sijoittuminen_1v_tutkinnon_jalkeen
	  ,null --työlliset 1v tutkinnon jälkeen
	  ,null --'Kandikyselyn pistemäärä'
	  ,null --'AVOP-AMK pistemäärä'
	  , NULL --d2.jarjestys_iscfi2013
	  , NULL --d2.jarjestys_iscfibroad2013
	  , NULL --d2.jarjestys_iscfinarrow2013
  	  , NULL --d2.jarjestys_iscle2011
	  , NULL --d2.jarjestys_Koulutusaste_taso2
	  ,d4.jarjestys_ohjauksenala_koodi --jarjestys_OKM_ohjauksen_ala
 FROM [ANTERO].[dw].[f_yo_opintopisteet]
 LEFT join antero.dw.d_yo d10 on d_yo_id=d10.id
 LEFT join antero.dw.d_organisaatioluokitus d3 on d10.yo_tunnus=d3.organisaatio_koodi
 LEFT JOIN antero.dw.d_ohjauksenala d4 ON d_ohjauksenala_id = d4.id
 --LEFT join antero.dw.d_opintoala95 d2 ON d_opintoala95_id = d2.id


  union all

   /****** AMK Vaihto-opiskelijoiden (lähteneet ja saapuneet) opintopisteet ******/

SELECT vuosi
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi
	  ,[Sektori]='Ammattikorkeakoulu'
	  , NULL --d2.koulutusaste2002
	  , d4.ohjauksenala_nimi_fi
	  , NULL --d2.iscle2011 as 'Koulutusaste, taso1'
	  , NULL --d2.Koulutusaste_taso2
	  , NULL --d2.iscfibroad2013 as 'Koulutusala, taso 1'
	  , NULL --d2.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , NULL --d2.iscfi2013 as 'Koulutusala, taso 3'
      ,NULL --[koulutuksen_kunta]
      ,NULL --d3.[kansalaisuus_versio2]
      ,NULL --tutkinnot
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL -- 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL --lkm_op1_14
	  ,NULL -- 'Opetus- ja tutkimushenkilökunta'
	  ,NULL -- 'IV tutkijanuraporras'
	  ,NULL -- 'Opetus- ja TKI henkilökunta'
	  ,NULL -- 'AMK Julkaisut (A-F, I)'
	  ,NULL -- 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL -- 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL -- 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL -- 'Kilpailtu tutkimusrahoitus'
	  ,kv_vaihtoopiskelijat_op_lkm
	  ,ulkom_hyv_op_lkm
	  ,erilopintooik_op_lkm
	  ,avoinamk_op_amk_lkm
	  ,mamu_op_lkm
	  ,erikoul_suor_op_lkm
	  ,NULL --sijoittuminen_1v_tutkinnon_jalkeen
	  ,null --työlliset 1v tutkinnon jälkeen
	  ,null --'Kandikyselyn pistemäärä'
	  ,null --'AVOP-AMK pistemäärä'
	  , NULL --d2.jarjestys_iscfi2013
	  , NULL --d2.jarjestys_iscfibroad2013
	  , NULL --d2.jarjestys_iscfinarrow2013
  	  , NULL --d2.jarjestys_iscle2011
	  , NULL --d2.jarjestys_Koulutusaste_taso2
	  ,d4.jarjestys_ohjauksenala_koodi --jarjestys_OKM_ohjauksen_ala
 FROM [ANTERO].[dw].[f_amk_opintopisteet]
 LEFT join antero.dw.d_amk d10 on d_amk_id=d10.id
 LEFT join antero.dw.d_organisaatioluokitus d3 on d10.amk_tunnus=d3.organisaatio_koodi
 LEFT JOIN antero.dw.d_ohjauksenala d4 ON d_ohjauksenala_id = d4.id
 left join ANTERO.dw.d_koulutusala_2002 as d2 on d_koulutusala_2002_id = d2.id
 left join ANTERO.dw.d_amk_koulutustyyppi as d70 on d_amk_koulutustyyppi_id=d70.id
 

 UNION ALL

    /****** Työllistyneet 1v jälkeen ******/

SELECT tilastointivuosi
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi
	  ,[Sektori]=case  when d3.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  , D11.koulutusaste2002
	  , D11.OKM_ohjauksen_ala
	  , d11.iscle2011
	  , d11.Koulutusaste_taso2
	  , d11.iscfibroad2013 as 'Koulutusala, taso 1'
	  , d11.iscfinarrow2013 as 'Koulutusala, taso 2'
	  , d11.iscfi2013 as 'Koulutusala, taso 3'
      ,NULL --[koulutuksen_kunta]
      ,case when d60.maa in ('Suomi','Ahvenanmaa') then 'Suomi' when d60.maa in ('Islanti', 'Liechtenstein', 'Norja') or (d60.eumaa_koodi=1 or d60.etamaa_koodi=1) then 'EU/ETA' else 'Muu' end
      ,NULL --tutkinnot
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL -- 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL --lkm_op1_14
	  ,NULL -- 'Opetus- ja tutkimushenkilökunta'
	  ,NULL -- 'IV tutkijanuraporras'
	  ,NULL -- 'Opetus- ja TKI henkilökunta'
	  ,NULL -- 'AMK Julkaisut (A-F, I)'
	  ,NULL -- 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL -- 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL -- 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL -- 'Kilpailtu tutkimusrahoitus'
	  ,null --kv_vaihtoopiskelijat_op_lkm
	  ,null --ulkom_hyv_op_lkm
	  ,null --erilopintooik_op_lkm
	  ,null --avoinamk_op_amk_lkm
	  ,null --mamu_op_lkm
	  ,null --erikoul_suor_op_lkm
	  ,sijoittuminen_1v_tutkinnon_jalkeen
	  ,case when paaasiallinen_toiminta_okm_id=1 then sijoittuminen_1v_tutkinnon_jalkeen else null end as 'Työlliset 1v tutkinnon jälkeen'
	  ,null --'Kandikyselyn pistemäärä'
	  ,null --'AVOP-AMK pistemäärä'
	  , d11.jarjestys_iscfi2013
	  , d11.jarjestys_iscfibroad2013
	  , d11.jarjestys_iscfinarrow2013
  	  , d11.jarjestys_iscle2011
	  , d11.jarjestys_Koulutusaste_taso2
	  , d11.jarjestys_OKM_ohjauksen_ala
 FROM [VipunenTK].[dbo].f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta
 LEFT join antero.dw.d_organisaatioluokitus d3 on oppilaitos=d3.organisaatio_koodi
 LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d11 on koulutusluokitus_id=d11.id
 left join VipunenTK.dbo.d_valtio d60 on kansalaisuus_maanosa_id=d60.id
 Where aineisto='L' and tilastointivuosi>2010 and d11.koulutusaste2002_koodi in ('62','71','63','72','82') AND
 d3.organisaatio_koodi <> '02557' AND d3.organisaatio_koodi <> '10031'  AND NOT (sijoittuminen_1v_tutkinnon_jalkeen = 0 AND sijoittuminen_3v_tutkinnon_jalkeen = 0 AND sijoittuminen_5v_tutkinnon_jalkeen = 0)

 union all


     /****** ARVO ******/

SELECT vuosi
	  ,NULL as 'Aloituslukuvuosi (läpäisy)'
      , d3.organisaatio_fi
	  ,[Sektori]=case  when d3.organisaatio_fi in 
			('Aalto-yliopisto','Helsingin yliopisto','Itä-Suomen yliopisto','Jyväskylän yliopisto','Lapin yliopisto','Lappeenrannan tekn. yliopisto','Oulun yliopisto','Svenska handelshögskolan','Taideyliopisto','Tampereen tekn. yliopisto','Tampereen yliopisto','Turun yliopisto','Vaasan yliopisto','Åbo Akademi','Kuvataideakatemia','Sibelius-Akatemia','Teatterikorkeakoulu','Lappeenrannan teknillinen yliopisto', 'Tampereen teknillinen yliopisto') 
		then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  ,null -- D11.koulutusaste2002
	  ,d12.okmohjauksenala_fi
	  ,d12.koulutusastetaso1_fi
	  ,d12.koulutusastetaso2_fi
	  ,d12.koulutusalataso1_fi as 'Koulutusala, taso 1'
	  ,d12.koulutusalataso2_fi as 'Koulutusala, taso 2'
	  ,d12.koulutusalataso3_fi as 'Koulutusala, taso 3'
      ,NULL --[koulutuksen_kunta]
      ,NULL --d3.[kansalaisuus_versio2]
      ,NULL --tutkinnot
	  ,NULL AS '7v_aloittaneet_lkm'
	  ,NULL AS '5v_Aloittaneet_lkm'
	  ,NULL AS '7v_suorittaneet_lkm'
	  ,NULL AS '5v_suorittaneet_lkm'
	  ,NULL AS 'Läsnäolevat opiskelijat'--lasna
	  ,NULL AS '55op suorittaneet' --suorittanut55
	  ,NULL -- 'Läsnäolleet opiskelijat (1-14op)'
	  ,NULL --lkm_op1_14
	  ,NULL -- 'Opetus- ja tutkimushenkilökunta'
	  ,NULL -- 'IV tutkijanuraporras'
	  ,NULL -- 'Opetus- ja TKI henkilökunta'
	  ,NULL -- 'AMK Julkaisut (A-F, I)'
	  ,NULL -- 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 2 ja 3'
	  ,NULL -- 'YO Julkaisut (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL -- 'YO kansainvälinen yhteisjulkaisu (A1-A4, C1 ja C2) jufotaso 1-3'
	  ,NULL -- 'Kilpailtu tutkimusrahoitus'
	  ,null --kv_vaihtoopiskelijat_op_lkm
	  ,null --ulkom_hyv_op_lkm
	  ,null --erilopintooik_op_lkm
	  ,null --avoinamk_op_amk_lkm
	  ,null --mamu_op_lkm
	  ,null --erikoul_suor_op_lkm
	  ,null --sijoittuminen_1v_tutkinnon_jalkeen
	  ,NULL --'Työlliset 1v tutkinnon jälkeen'
	  ,case when (kyselypohja='KANDIPALAUTE') AND (d14.kysymysid in ('1150','1116','1168','1119','1147','1142','1139','1138','1117','1140','1120','1149','1136')) then numerovalinta else null end as 'Kandikyselyn pistemäärä'
	  ,case when kyselypohja='AVOP-AMK' and rahoitusmallikysymys=1 then numerovalinta else null end as 'AVOP-AMK pistemäärä'
	  , d12.koulutusalataso1_koodi
	  , d12.koulutusalataso2_koodi
	  , d12.koulutusalataso3_koodi
  	  , d12.koulutusastetaso1_koodi
	  , d12.koulutusalataso2_koodi
	  ,d12.jarjestys_okmohjauksenala_koodi
	  FROM [ANTERO].dw.f_arvo
LEFT join antero.dw.d_organisaatio d3 on d_organisaatio_id= d3.id
 LEFT JOIN ANTERO.dw.d_koulutusluokitus d12 on d_koulutusluokitus_id=d12.id
 left join antero.dw.d_arvokyselykerta d13 on d_arvokyselykerta_id=d13.id
 left join antero.dw.d_arvokysymys d14 on d_arvokysymys_id=d14.id
 where kyselypohja in ('KANDIPALAUTE','AVOP-AMK') and d3.oppilaitostyyppi_koodi in ('41','42')



