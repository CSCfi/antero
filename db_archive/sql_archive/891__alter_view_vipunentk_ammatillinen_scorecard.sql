USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_ammatillinen_scorecard]    Script Date: 20.10.2017 11:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_f_tab_ammatillinen_scorecard] AS

SELECT 
--Aikamuuttujat
			
		  -- Aloittaneiden läpäisyä tarkastellaan aloituslukuvuoden ja tarkastelujakson mukaan. Alla on tuotettu tämän perusteella tilastovuositieto
		  -- läpäisystä. Tällölin läpäisyä voi tarkastella ajallisesti yhteismitallisesti muiden aineistojen kanssa.
		  -- Esimerkki logiikasta: "Jos opiskelija on aloittanut keväällä 2007 [d_kausi.vuosiselite = '2007' And d_kausi.lukuvuosi = '2006/2007'], 
		  -- ja aikaa on kulunut 3 vuotta [And d_tarkastelujakso.tarkastelujakso = '3 vuotta'], tilastovuosi on 2009. Tarkasteltava aikajakso on siis
		  -- 1.1.2007 - 31.12.2009"

		  'Tilastovuosi' = Case When d_kausi.vuosiselite = '2006' And d_kausi.lukuvuosi = '2005/2006' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2009'

							When d_kausi.vuosiselite = '2006' And d_kausi.lukuvuosi = '2006/2007'
							Then '2009'
							When d_kausi.vuosiselite = '2007' And d_kausi.lukuvuosi = '2006/2007' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2009'
							When d_kausi.vuosiselite = '2007' And d_kausi.lukuvuosi = '2006/2007' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2010'

							When d_kausi.vuosiselite = '2007' And d_kausi.lukuvuosi = '2007/2008'
							Then '2010'
							When d_kausi.vuosiselite = '2008' And d_kausi.lukuvuosi = '2007/2008' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2010'
							When d_kausi.vuosiselite = '2008' And d_kausi.lukuvuosi = '2007/2008' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2011'
							
							When d_kausi.vuosiselite = '2008' And d_kausi.lukuvuosi = '2008/2009'
							Then '2011'
							When d_kausi.vuosiselite = '2009' And d_kausi.lukuvuosi = '2008/2009' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2011'
							When d_kausi.vuosiselite = '2009' And d_kausi.lukuvuosi = '2008/2009' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2012'
							
							When d_kausi.vuosiselite = '2009' And d_kausi.lukuvuosi = '2009/2010'
							Then '2012'
							When d_kausi.vuosiselite = '2010' And d_kausi.lukuvuosi = '2009/2010' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2012'
							When d_kausi.vuosiselite = '2010' And d_kausi.lukuvuosi = '2009/2010' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2013'
							
							When d_kausi.vuosiselite = '2010' And d_kausi.lukuvuosi = '2010/2011'
							Then '2013'
							When d_kausi.vuosiselite = '2011' And d_kausi.lukuvuosi = '2010/2011' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2013'
							When d_kausi.vuosiselite = '2011' And d_kausi.lukuvuosi = '2010/2011' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2014'
							
							When d_kausi.vuosiselite = '2011' And d_kausi.lukuvuosi = '2011/2012'
							Then '2014'
							When d_kausi.vuosiselite = '2012' And d_kausi.lukuvuosi = '2011/2012' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2014'
							When d_kausi.vuosiselite = '2012' And d_kausi.lukuvuosi = '2011/2012' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2015'
							
							When d_kausi.vuosiselite = '2012' And d_kausi.lukuvuosi = '2012/2013'
							Then '2015'
							When d_kausi.vuosiselite = '2013' And d_kausi.lukuvuosi = '2012/2013' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2015'
							When d_kausi.vuosiselite = '2013' And d_kausi.lukuvuosi = '2012/2013' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2016'
							
							When d_kausi.vuosiselite = '2013' And d_kausi.lukuvuosi = '2013/2014'
							Then '2016'
							When d_kausi.vuosiselite = '2014' And d_kausi.lukuvuosi = '2013/2014' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2016'
							When d_kausi.vuosiselite = '2014' And d_kausi.lukuvuosi = '2013/2014' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2017'
							
							When d_kausi.vuosiselite = '2014' And d_kausi.lukuvuosi = '2014/2015'
							Then '2017'
							When d_kausi.vuosiselite = '2015' And d_kausi.lukuvuosi = '2014/2015' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2017'
							When d_kausi.vuosiselite = '2015' And d_kausi.lukuvuosi = '2014/2015' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2018'
							
							When d_kausi.vuosiselite = '2015' And d_kausi.lukuvuosi = '2015/2016'
							Then '2018'
							When d_kausi.vuosiselite = '2016' And d_kausi.lukuvuosi = '2015/2016' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2018'
							When d_kausi.vuosiselite = '2016' And d_kausi.lukuvuosi = '2015/2016' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2019'
							
							When d_kausi.vuosiselite = '2016' And d_kausi.lukuvuosi = '2016/2017'
							Then '2019'
							When d_kausi.vuosiselite = '2017' And d_kausi.lukuvuosi = '2016/2017' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2019'
							When d_kausi.vuosiselite = '2017' And d_kausi.lukuvuosi = '2016/2017' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2020'
							
							When d_kausi.vuosiselite = '2017' And d_kausi.lukuvuosi = '2017/2018'
							Then '2020'
							When d_kausi.vuosiselite = '2018' And d_kausi.lukuvuosi = '2017/2018' And d_tarkastelujakso.tarkastelujakso = '3 vuotta'
							Then '2020'
							When d_kausi.vuosiselite = '2018' And d_kausi.lukuvuosi = '2017/2018' And d_tarkastelujakso.tarkastelujakso = '3,5 vuotta'
							Then '2021'

							When d_tutkintolaji_tyollistymiseen.tutkintolaji_tyollistymiseen_koodi in ('04','05','06','07') OR [aineistotunnus] = '2.4a-c'
							Then tilastointivuosi

							When [aineistotunnus] = '2.3a-d'
							Then tilv

							Else tilastointivuosi

							End

		  ,'Aloituslukuvuosi' = ISNULL(d_kausi.lukuvuosi, Case When d_kausi.lukuvuosi = '-1' Then 'Tuntematon' Else 'Virhetilanne' End)
		  ,'Aloitusvuosi' = ISNULL(d_kausi.vuosiselite, Case When d_kausi.vuosiselite = '-1' Then 'Tuntematon' Else 'Virhetilanne' End)
		  ,'Aloituslukukausi' = ISNULL(d_kausi.lukukausiselite, Case When d_kausi.lukukausiselite = '-1' Then 'Tuntematon' Else 'Virhetilanne' End)
		  ,'Tarkastelujakso' = ISNULL(d_tarkastelujakso.tarkastelujakso, Case When d_tarkastelujakso.tarkastelujakso = '-1' Then 'Tuntematon' Else 'Virhetilanne' End)
--Henkilömuuttujat
		  ,'Pääasiallinen toiminta' = ISNULL(d_paaasiallinen_toiminta_ja_maasta_muuttaneet.paaasiallinen_toiminta_ja_maasta_muuttaneet, Case When d_paaasiallinen_toiminta_ja_maasta_muuttaneet.paaasiallinen_toiminta_ja_maasta_muuttaneet = -1 Then 'Tuntematon' Else 'Virhetilanne' End)
--Koulutusmuuttujat
		  ,'Hallinnonala' = ISNULL(d_opetushallinnon_koulutus.opetushallinnon_koulutus, Case When d_opetushallinnon_koulutus.opetushallinnon_koulutus = -1 Then 'Tuntematon' Else 'Virhetilanne' End)
		  ,'Koko tutkinto/tutkinnon osa' = ISNULL(d_koulutuksen_tavoite_toteuma.koulutuksen_tavoite_toteuma, Case When d_koulutuksen_tavoite_toteuma.koulutuksen_tavoite_toteuma = -1 Then 'Tuntematon' Else 'Virhetilanne' End)
		  ,'Opintojen kulku' = ISNULL([1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto], Case When [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = -1 Then 'Tuntematon' Else 'Virhetilanne' End)
		  ,'Suoritettu tutkinto' = ISNULL([1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan], Case When [1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] = -1 Then 'Tuntematon' Else 'Virhetilanne' End)
		  ,'Koulutusala (2002)' = d_koulutusluokitus.koulutusala2002
		  ,'Koulutusala, taso 1' = d_koulutusluokitus.iscfibroad2013

		  -- Tieto järjestämistavasta, järjestämismuodosta ja tutkintotyypistä on kaikissa aineistossa kerätty eri tavoin. Alla kootaan näistä yhteiset
		  -- muuttujat, jotka toimivat kaikkien aineistojen kanssa.

		  ,'Järjestämistapa' = Case When d_tutkintolaji_tyollistymiseen.tutkintolaji_tyollistymiseen_koodi = '04' OR d_koulutuslaji2.jarjestys_jarjestamistapa = '1' OR d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi = '1'
								Then 'opetussuunnitelmaperusteinen koulutus/tutkinto'
								When d_tutkintolaji_tyollistymiseen.tutkintolaji_tyollistymiseen_koodi in ('05','06','07') OR d_koulutuslaji2.jarjestys_jarjestamistapa = '2' OR d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi = '2'
								Then 'näyttötutkintoon valmistava koulutus/tutkinto'
								Else 'Tuntematon'
								End
		  ,'Järjestämismuoto' = Case When d_oppisopimuskoulutus.oppisopimuskoulutus_koodi = '2' OR d_koulutuslaji2.jarjestys_jarjestamismuoto = '1' OR d_koulutuksen_jarjestamismuoto.koulutuksen_jarjestamismuoto_koodi = '1'
								Then 'Oppilaitosmuotoinen koulutus'
								When d_oppisopimuskoulutus.oppisopimuskoulutus_koodi = '1' OR d_koulutuslaji2.jarjestys_jarjestamismuoto = '2' OR d_koulutuksen_jarjestamismuoto.koulutuksen_jarjestamismuoto_koodi = '2'
								Then 'Oppisopimuskoulutus'
								Else 'Tuntematon'
								End
		  ,'Tutkintotyyppi' = Case When d_tutkintolaji_tyollistymiseen.tutkintolaji_tyollistymiseen_koodi in ('04','05') OR d_koulutuslaji2.jarjestys_tutkintotyyppi = '1' OR d_ammatillisen_koulutuksen_koulutuslaji.ammatillisen_koulutuksen_koulutuslaji_koodi = '1'
								Then 'ammatillinen perustutkinto'
								When d_tutkintolaji_tyollistymiseen.tutkintolaji_tyollistymiseen_koodi = '06' OR d_koulutuslaji2.jarjestys_tutkintotyyppi = '2' OR d_ammatillisen_koulutuksen_koulutuslaji.ammatillisen_koulutuksen_koulutuslaji_koodi = '2'
								Then 'ammattitutkinto'
								When d_tutkintolaji_tyollistymiseen.tutkintolaji_tyollistymiseen_koodi = '07' OR d_koulutuslaji2.jarjestys_tutkintotyyppi = '3' OR d_ammatillisen_koulutuksen_koulutuslaji.ammatillisen_koulutuksen_koulutuslaji_koodi = '3'
								Then 'erikoisammattitutkinto'
								Else 'Tuntematon'
								End

		  ,'Koulutuksen maakunta' = d_alueluokitus.maakunta
--Organisaatiomuuttujat
          ,'Koulutuksen järjestäjä' = ISNULL(d_oppilaitoksen_taustatiedot.koulutuksen_jarjestaja,'Tuntematon')
--Järjestykset
		  ,'jarj_tarkastelujakso' = ISNULL(d_tarkastelujakso.jarjestys, Case When d_tarkastelujakso.jarjestys = -1 Then '98' Else '99' End)
		  ,'jarj_paas' = ISNULL(d_paaasiallinen_toiminta_ja_maasta_muuttaneet.jarjestys, Case When d_paaasiallinen_toiminta_ja_maasta_muuttaneet.jarjestys = -1 Then '99' Else '98' End)
		  ,'paaskoodi' = ISNULL(d_paaasiallinen_toiminta_ja_maasta_muuttaneet.paaasiallinen_toiminta_ja_maasta_muuttaneet_koodi, Case When d_paaasiallinen_toiminta_ja_maasta_muuttaneet.paaasiallinen_toiminta_ja_maasta_muuttaneet_koodi = -1 Then '-1' Else '-2' End)
		  ,'jarj_hallinnonala' = ISNULL(d_opetushallinnon_koulutus.jarjestys, Case When d_opetushallinnon_koulutus.jarjestys = -1 Then '1980' Else '1990' End)
		  ,'jarj_kokoosa' = ISNULL(d_koulutuksen_tavoite_toteuma.jarjestys, Case When d_koulutuksen_tavoite_toteuma.jarjestys = -1 Then '98' Else '99' End)
		  ,'jarj_1a' = ISNULL([1a_jarjestys], Case When [1a_jarjestys] = -1 Then '99998' Else '99999' End)
		  ,'jarj_1c' = ISNULL([1c_jarjestys], Case When [1c_jarjestys] = -1 Then '99998' Else '99999' End)
		  ,'jarj_koulala2002' = d_koulutusluokitus.koulutusala2002_koodi
		  ,'jarj_koulalataso1' = d_koulutusluokitus.jarjestys_iscfibroad2013
		  ,'jarj_jarjestamistapa' = Case When d_tutkintolaji_tyollistymiseen.tutkintolaji_tyollistymiseen_koodi = '04' OR d_koulutuslaji2.jarjestys_jarjestamistapa = '1' OR d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi = '1'
								Then '1'
								When d_tutkintolaji_tyollistymiseen.tutkintolaji_tyollistymiseen_koodi in ('05','06','07') OR d_koulutuslaji2.jarjestys_jarjestamistapa = '2' OR d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi = '2'
								Then '2'
								Else '3'
								End
		  ,'jarj_maakunta' = d_alueluokitus.jarjestys_maakunta
		  ,'kouljarjkoodi' = d_oppilaitoksen_taustatiedot.koulutuksen_jarjestajakoodi
--Lukumäärämuuttujat
		 ,'lkm_1vr2' = [sijoittuminen_1v_tutkinnon_jalkeen]
		 ,'lkm_int2' = [lkm_int]
		 ,'aloit2' = [aloittaneet]
		 ,'opisk2' = [opiskelijat]
		 ,'tutk2' = [tutkinnot]
		 ,'aloitp2' = [aloituspaikat]
		 ,'ensisij2' = [ensisijaiset_hakijat]

FROM (
SELECT cast([tilastointivuosi] as varchar) as Tilastointivuosi
	  ,[tilv] = 'Tuntematon'
	  ,[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = 'Tuntematon'
	  ,[1a_jarjestys] ='99998'
	  ,[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] = 'Tuntematon'
	  ,[1c_jarjestys] ='99998'
	  ,[aineistotunnus] = 'Tuntematon'
	  ,oppilaitoksen_taustatiedot_id ='-1'
	  ,koulutuksen_jarjestaja_id
	  ,yht_koulutuksen_jarjestaja_id ='-1'
	  ,lahde_id = '-1'
	  ,aloituskausikoodi = '-1'
	  ,tarkastelujakso_id = '-1'
	  ,paaasiallinen_toiminta_ja_maasta_muuttaneet_id
	  ,ophal_id = '-1'
	  ,opetushallinnon_koulutus_id = '-1'
	  ,koulutuksen_tavoite_toteuma_id = '-1'
	  ,koulutusluokitus_id
	  ,koulk_id = '-1'
	  ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id = '-1'
	  ,koulutuksen_jarjestamismuoto_id = '-1'
	  ,ammatillisen_koulutuksen_koulutuslaji_id = '-1'
	  ,tutkintolaji_tyollistymiseen_id
	  ,oppisopimuskoulutus_id
	  ,koulutuslaji2_id = '-1'
	  ,tutkinnon_suorittamismaakunta_id
	  ,alueluokitus_id = '-1'
	  ,yht_koulutuksen_kunta_id = '-1'
	  ,sijoittuminen_1v_tutkinnon_jalkeen
	  ,lkm_int = NULL
	  ,aloittaneet = NULL
	  ,opiskelijat = NULL
	  ,tutkinnot = NULL
	  ,aloituspaikat = NULL
	  ,ensisijaiset_hakijat = NULL
  FROM VipunenTK.[dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]

UNION ALL
SELECT [tilastointivuosi] = 'Tuntematon'
	  ,[tilv] = 'Tuntematon'
	  ,[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]
	  ,[1a_jarjestys]
	  ,[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan]
	  ,[1c_jarjestys]
	  ,[aineistotunnus] = 'Tuntematon'
	  ,oppilaitoksen_taustatiedot_id
	  ,koulutuksen_jarjestaja_id ='-1'
	  ,yht_koulutuksen_jarjestaja_id = '-1'
	  ,lahde_id
	  ,aloituskausikoodi
	  ,tarkastelujakso_id
	  ,paaasiallinen_toiminta_ja_maasta_muuttaneet_id = '-1'
	  ,ophal_id
	  ,opetushallinnon_koulutus_id = '-1'
	  ,koulutuksen_tavoite_toteuma_id = '-1'
	  ,koulutusluokitus_id = '-1'
	  ,koulk_id
	  ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id = '-1'
	  ,koulutuksen_jarjestamismuoto_id = '-1'
	  ,ammatillisen_koulutuksen_koulutuslaji_id = '-1'
	  ,tutkintolaji_tyollistymiseen_id = '-1'
	  ,oppisopimuskoulutus_id = '-1'
	  ,koulutuslaji2_id
	  ,tutkinnon_suorittamismaakunta_id = '-1'
	  ,alueluokitus_id
	  ,yht_koulutuksen_kunta_id = '-1'
	  ,sijoittuminen_1v_tutkinnon_jalkeen = NULL
	  ,lkm_int
	  ,aloittaneet = NULL
	  ,opiskelijat = NULL
	  ,tutkinnot = NULL
	  ,aloituspaikat = NULL
	  ,ensisijaiset_hakijat = NULL
  FROM [dbo].[f_aloittaneiden_lapaisy]

UNION ALL
SELECT [tilastointivuosi] = 'Tuntematon'
	  ,cast([tilv] as varchar)
	  ,[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = 'Tuntematon'
	  ,[1a_jarjestys] ='99998'
	  ,[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] = 'Tuntematon'
	  ,[1c_jarjestys] ='99998'
	  ,[aineistotunnus]
	  ,oppilaitoksen_taustatiedot_id ='-1'
	  ,koulutuksen_jarjestaja_id ='-1'
	  ,yht_koulutuksen_jarjestaja_id
	  ,lahde_id = '-1'
	  ,aloituskausikoodi = '-1'
	  ,tarkastelujakso_id = '-1'
	  ,paaasiallinen_toiminta_ja_maasta_muuttaneet_id = '-1'
	  ,ophal_id = '-1'
	  ,opetushallinnon_koulutus_id
	  ,koulutuksen_tavoite_toteuma_id
	  ,koulutusluokitus_id
	  ,koulk_id = '-1'
	  ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
	  ,koulutuksen_jarjestamismuoto_id
	  ,ammatillisen_koulutuksen_koulutuslaji_id
	  ,tutkintolaji_tyollistymiseen_id = '-1'
	  ,oppisopimuskoulutus_id = '-1'
	  ,koulutuslaji2_id = '-1'
	  ,tutkinnon_suorittamismaakunta_id = '-1'
	  ,alueluokitus_id = '-1'
	  ,yht_koulutuksen_kunta_id
	  ,sijoittuminen_1v_tutkinnon_jalkeen = NULL
	  ,lkm_int = NULL
	  ,aloittaneet
	  ,opiskelijat
	  ,tutkinnot = NULL
	  ,aloituspaikat = NULL
	  ,ensisijaiset_hakijat = NULL
  FROM [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]

UNION ALL
SELECT cast([tilastointivuosi] as varchar)
	  ,[tilv] = 'Tuntematon'
	  ,[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = 'Tuntematon'
	  ,[1a_jarjestys] ='99998'
	  ,[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] = 'Tuntematon'
	  ,[1c_jarjestys] ='99998'
	  ,[aineistotunnus]
	  ,oppilaitoksen_taustatiedot_id ='-1'
	  ,koulutuksen_jarjestaja_id ='-1'
	  ,yht_koulutuksen_jarjestaja_id
	  ,lahde_id = '-1'
	  ,aloituskausikoodi = '-1'
	  ,tarkastelujakso_id = '-1'
	  ,paaasiallinen_toiminta_ja_maasta_muuttaneet_id = '-1'
	  ,ophal_id = '-1'
	  ,opetushallinnon_koulutus_id
	  ,koulutuksen_tavoite_toteuma_id
	  ,koulutusluokitus_id
	  ,koulk_id = '-1'
	  ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
	  ,koulutuksen_jarjestamismuoto_id
	  ,ammatillisen_koulutuksen_koulutuslaji_id
	  ,tutkintolaji_tyollistymiseen_id = '-1'
	  ,oppisopimuskoulutus_id = '-1'
	  ,koulutuslaji2_id = '-1'
	  ,tutkinnon_suorittamismaakunta_id = '-1'
	  ,alueluokitus_id = '-1'
	  ,yht_koulutuksen_kunta_id
	  ,sijoittuminen_1v_tutkinnon_jalkeen = NULL
	  ,lkm_int = NULL
	  ,aloittaneet = NULL
	  ,opiskelijat = NULL
	  ,tutkinnot
	  ,aloituspaikat = NULL
	  ,ensisijaiset_hakijat = NULL
  FROM [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot]
/*
  UNION ALL

SELECT [tilastointivuosi] = cast(d1.vuosi as varchar)
	  ,[tilv] = 'Tuntematon'
	  ,[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = 'Tuntematon'
	  ,[1a_jarjestys] ='99998'
	  ,[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] = 'Tuntematon'
	  ,[1c_jarjestys] ='99998'
	  ,[aineistotunnus] = '-1'
	  ,oppilaitoksen_taustatiedot_id = d3.id
	  ,koulutuksen_jarjestaja_id ='-1'
	  ,yht_koulutuksen_jarjestaja_id = '-1'
	  ,lahde_id = '-1'
	  ,aloituskausikoodi = '-1'
	  ,tarkastelujakso_id = '-1'
	  ,paaasiallinen_toiminta_ja_maasta_muuttaneet_id = '-1'
	  ,ophal_id = '-1'
	  ,opetushallinnon_koulutus_id = '-1'
	  ,koulutuksen_tavoite_toteuma_id = '-1'
	  ,koulutusluokitus_id = d4.id
	  ,koulk_id = '-1'
	  ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id = '56'
	  ,koulutuksen_jarjestamismuoto_id = '1'
	  ,ammatillisen_koulutuksen_koulutuslaji_id = '61'
	  ,tutkintolaji_tyollistymiseen_id = '-1'
	  ,oppisopimuskoulutus_id = '-1'
	  ,koulutuslaji2_id = '-1'
	  ,tutkinnon_suorittamismaakunta_id = '-1'
	  ,alueluokitus_id = '-1'
	  ,yht_koulutuksen_kunta_id = ophv.hakukohteen_kunta_id
	  ,sijoittuminen_1v_tutkinnon_jalkeen = NULL
	  ,lkm_int = NULL
	  ,aloittaneet = NULL
	  ,opiskelijat = NULL
	  ,tutkinnot = NULL
	  ,aloituspaikat = NULL
	  ,ensisijaiset_hakijat = count(distinct henkilo_oid)
  FROM OPHV.[dbo].[f_hakeneet] ophv
  left join OPHV.dbo.d_kausi d1 on d1.kausi_id=koulutuksen_alkamiskausi_id
  left join OPHV.dbo.d_organisaatio d2 on d2.id=ophv.hakukohteen_organisaatio_id
  left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d3 on d3.oppilaitos_avain=coalesce(d2.oppilaitos_koodi,d2.organisaatio_koodi)
  left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.koulutus_koodi=ophv.hakukohteen_koulutus_koodi
  left join OPHV.dbo.d_koulutusluokitus d4b ON d4b.koulutus_koodi=ophv.hakukohteen_koulutus_koodi
  left join OPHV.dbo.d_haku d25 on d25.id=ophv.haku_id
  where 
coalesce(d4.Koulutusaste2002,d4b.Koulutusaste2002) = 'Ammatillinen koulutus'
--d4.Koulutusaste2002 = 'Ammatillinen koulutus'
AND hakemuksen_tila IN ('Aktiivinen','Keskeneräinen')
AND hakukohteen_tila = 'JULKAISTU'
--AND ophv.hakukohteen_koulutustyyppi_id = '1' 
AND hakutoive_id = '1' 
AND (
(tilannepvm ='2015-11-01' AND d25.haku='Yhteishaku ammatilliseen ja lukioon, kevät 2015') OR 
(tilannepvm ='2016-02-01' AND d25.haku='Ammatillisen koulutuksen ja lukiokoulutuksen syksyn 2015 yhteishaku') OR 
(tilannepvm ='2016-10-03' AND d25.haku='Yhteishaku ammatilliseen ja lukioon, kevät 2016') OR 
(tilannepvm ='2017-04-01' AND d25.haku='Yhteishaku ammatilliseen ja lukioon, kevät 2017')
)
and d1.vuosi<2017
group by d1.vuosi,d3.id,d4.id,ophv.hakukohteen_kunta_id

UNION ALL

SELECT [tilastointivuosi] = cast(d1.vuosi as varchar)
	  ,[tilv] = 'Tuntematon'
	  ,[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = 'Tuntematon'
	  ,[1a_jarjestys] ='99998'
	  ,[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan] = 'Tuntematon'
	  ,[1c_jarjestys] ='99998'
	  ,[aineistotunnus] = '-1'
	  ,oppilaitoksen_taustatiedot_id = d3.id
	  ,koulutuksen_jarjestaja_id ='-1'
	  ,yht_koulutuksen_jarjestaja_id = '-1'
	  ,lahde_id = '-1'
	  ,aloituskausikoodi = '-1'
	  ,tarkastelujakso_id = '-1'
	  ,paaasiallinen_toiminta_ja_maasta_muuttaneet_id = '-1'
	  ,ophal_id = '-1'
	  ,opetushallinnon_koulutus_id = '-1'
	  ,koulutuksen_tavoite_toteuma_id = '-1'
	  ,koulutusluokitus_id = d4.id
	  ,koulk_id = '-1'
	  ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id = '56'
	  ,koulutuksen_jarjestamismuoto_id = '1'
	  ,ammatillisen_koulutuksen_koulutuslaji_id = '61'
	  ,tutkintolaji_tyollistymiseen_id = '-1'
	  ,oppisopimuskoulutus_id = '-1'
	  ,koulutuslaji2_id = '-1'
	  ,tutkinnon_suorittamismaakunta_id = '-1'
	  ,alueluokitus_id = '-1'
	  ,yht_koulutuksen_kunta_id = ophv2.Hakukohteen_aluetiedot_id
	  ,sijoittuminen_1v_tutkinnon_jalkeen = NULL
	  ,lkm_int = NULL
	  ,aloittaneet = NULL
	  ,opiskelijat = NULL
	  ,tutkinnot = NULL
	  ,aloituspaikat = case 
							when d5.haku='Yhteishaku ammatilliseen ja lukioon, kevät 2015' and tilannepvm='2015-11-01' then aloituspaikat 
							--when d5.haku='Lisähaku kevään 2015 ammatillisen ja lukiokoulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille' and tilannepvm='2015-11-01' then aloituspaikat 
							when d5.haku='Ammatillisen koulutuksen ja lukiokoulutuksen syksyn 2015 yhteishaku' and tilannepvm='2016-02-01' then aloituspaikat
							--when d5.haku='Lisähaku syksyn 2015 ammatillisen koulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille' and tilannepvm='2016-02-01' then aloituspaikat
							when d5.haku='Yhteishaku ammatilliseen ja lukioon, kevät 2016' and tilannepvm='2016-10-03' then aloituspaikat
							--when d5.haku='Lisähaku kevään 2016 ammatillisen ja lukiokoulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille' and tilannepvm='2016-10-03' then aloituspaikat
							when d5.haku='Yhteishaku ammatilliseen ja lukioon, kevät 2017' and tilannepvm='2017-04-01' then aloituspaikat
							else null 
						  end
	  ,ensisijaiset_hakijat = NULL
  FROM OPHV.[dbo].[f_aloituspaikat_ja_pistemaarat] ophv2
  left join OPHV.dbo.d_kausi d1 on d1.kausi_id=koulutuksen_alkamiskausi_id
  left join OPHV.dbo.d_organisaatio d2 on d2.id=ophv2.hakukohteen_organisaatio_id
  left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d3 on d3.oppilaitos_avain=coalesce(d2.oppilaitos_koodi,d2.organisaatio_koodi)
  left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.koulutus_koodi=ophv2.hakukohteen_koulutus_koodi
  left join OPHV.dbo.d_koulutusluokitus d4b ON d4b.koulutus_koodi=ophv2.hakukohteen_koulutus_koodi
  left join OPHV.dbo.d_haku d5 on d5.id=ophv2.Haku_id
  where --ophv2.Koulutustyyppi_id='1'
  coalesce(d4.Koulutusaste2002,d4b.Koulutusaste2002) = 'Ammatillinen koulutus'
  and tilannepvm in ('2015-11-01','2016-02-01','2016-10-03','2017-04-01')
  and haku_koodi in ('1.2.246.562.29.90697286251'	--Yhteishaku ammatilliseen ja lukioon, kevät 2015
				--,'1.2.246.562.29.13657766393'	--Lisähaku kevään 2015 ammatillisen ja lukiokoulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille
				,'1.2.246.562.29.80306203979'	--Ammatillisen koulutuksen ja lukiokoulutuksen syksyn 2015 yhteishaku
				--,'1.2.246.562.29.94278815611'	--Lisähaku syksyn 2015 ammatillisen koulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille
				,'1.2.246.562.29.14662042044'	--Yhteishaku ammatilliseen ja lukioon, kevät 2016
				--,'1.2.246.562.29.98929669087'	--Lisähaku kevään 2016 ammatillisen ja lukiokoulutuksen yhteishaussa vapaaksi jääneille opiskelupaikoille
				,'1.2.246.562.29.10108985853'	--Yhteishaku ammatilliseen ja lukioon, kevät 2017
				)
	and d1.vuosi<2017
*/
  ) f
  LEFT JOIN VipunenTK.[dbo].d_oppilaitoksen_taustatiedot
	ON d_oppilaitoksen_taustatiedot.id = f.oppilaitoksen_taustatiedot_id & f.koulutuksen_jarjestaja_id & f.yht_koulutuksen_jarjestaja_id
  LEFT JOIN VipunenTK.[dbo].d_lahde
    ON d_lahde.id = f.lahde_id
  LEFT JOIN VipunenTK.[dbo].d_kausi
    ON d_kausi.kausi_id = f.aloituskausikoodi
  LEFT JOIN VipunenTK.[dbo].d_tarkastelujakso
    ON d_tarkastelujakso.id = f.tarkastelujakso_id
  LEFT JOIN VipunenTK.[dbo].d_paaasiallinen_toiminta_ja_maasta_muuttaneet
    ON d_paaasiallinen_toiminta_ja_maasta_muuttaneet.id = f.paaasiallinen_toiminta_ja_maasta_muuttaneet_id
  LEFT JOIN VipunenTK.[dbo].d_opetushallinnon_koulutus
    ON d_opetushallinnon_koulutus.id = f.ophal_id & f.opetushallinnon_koulutus_id
  LEFT JOIN VipunenTK.[dbo].d_koulutuksen_tavoite_toteuma
    ON d_koulutuksen_tavoite_toteuma.id = f.koulutuksen_tavoite_toteuma_id
  LEFT JOIN VipunenTK.[dbo].d_koulutusluokitus
    ON d_koulutusluokitus.id = f.koulutusluokitus_id & f.koulk_id
  LEFT JOIN VipunenTK.[dbo].d_tutkintolaji_tyollistymiseen
    ON d_tutkintolaji_tyollistymiseen.id = f.tutkintolaji_tyollistymiseen_id
  LEFT JOIN VipunenTK.[dbo].d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
    ON d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus.id = f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
  LEFT JOIN VipunenTK.[dbo].d_koulutuksen_jarjestamismuoto
    ON d_koulutuksen_jarjestamismuoto.id = f.koulutuksen_jarjestamismuoto_id
  LEFT JOIN VipunenTK.[dbo].d_ammatillisen_koulutuksen_koulutuslaji
    ON d_ammatillisen_koulutuksen_koulutuslaji.id = f.ammatillisen_koulutuksen_koulutuslaji_id
  LEFT JOIN VipunenTK.[dbo].d_oppisopimuskoulutus
    ON d_oppisopimuskoulutus.id = f.oppisopimuskoulutus_id
  LEFT JOIN VipunenTK.[dbo].d_koulutuslaji2
    ON d_koulutuslaji2.id = f.koulutuslaji2_id
  LEFT JOIN VipunenTK.[dbo].d_alueluokitus
    ON d_alueluokitus.id = f.tutkinnon_suorittamismaakunta_id & f.alueluokitus_id & f.yht_koulutuksen_kunta_id

	--Rajataan mukaan kaikista aineistosta koulutusaste 32 (Ammatillinen koulutus) AND Poistetaan aloittaneiden läpäisyssä ylimääräiset tarkastelujaksot AND Poistetaan aloittaneiden läpäisyssä ylimääräisiä aloitusvuosia/kausia (sis. 2 x AND NOT komentoa) AND Poistetaan työllistymisessä ja opiskelijoissa ja tutkinnoissa ylimääräisiä tilastovuosia AND Poistetaan Virhetilanne läpäisyssä AND Poistetaan turhat nollarivit työllistymisessä

WHERE 
(koulutusaste2002_koodi = 32) 
AND (tarkastelujakso NOT in ('0,5 vuotta', '1 vuosi', '1,5 vuotta', '2 vuotta', '2,5 vuotta', '4 vuotta', '4,5 vuotta', '5 vuotta', '5,5 vuotta','6 vuotta','6,5 vuotta','7 vuotta','7,5 vuotta','8 vuotta','8,5 vuotta','9 vuotta','9,5 vuotta','10 vuotta','10,5 vuotta','11 vuotta','11,5 vuotta','12 vuotta','12,5 vuotta')) 
AND (lukuvuosi NOT in ('2003/2004', '2004/2005')) 
AND NOT (lukuvuosi = '2005/2006' AND vuosiselite = '2005') 
AND NOT (lukuvuosi = '2005/2006' AND vuosiselite = '2006' AND tarkastelujakso = '3 vuotta') 
AND (tilv NOT in ('1999','2000','2001','2002','2003','2004','2005','2006','2007','2008')) 
AND (tilastointivuosi NOT in ('1999','2000','2001','2002','2003','2004','2005','2006','2007','2008')) 
AND ([1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne') 
AND (((tutkintolaji_tyollistymiseen_koodi in ('04','05','06','07') AND NOT (sijoittuminen_1v_tutkinnon_jalkeen = 0)) OR tutkintolaji_tyollistymiseen_koodi = -1))






GO


USE [ANTERO]