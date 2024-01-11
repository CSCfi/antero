USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_OTV_f_2_3]    Script Date: 10.1.2024 14:23:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_OTV_f_2_3] AS

TRUNCATE TABLE VipunenTK.[dbo].f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat;

INSERT INTO [VipunenTK].[dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]

SELECT 
	 f.tilastointivuosi
	,f.tilv_date
	,f.lahde
	,lahde_id = coalesce(d1.id,-1)
	,f.oppilaitos
	,oppilaitos_id = coalesce(d2.id,-1)
	,oppilaitos_historia_id = coalesce(d2h.id,-1)
	,f.koulutuksen_jarjestaja
	,koulutuksen_jarjestaja_id = coalesce(d3.id,-1)
	,koulutuksen_jarjestaja_historia_id = coalesce(d3h.id,-1)
	,f.oppisopimuskoulutuksen_jarjestaja
	,oppisopimuskoulutuksen_jarjestaja_id = coalesce(d4.id,-1)
	,oppisopimuskoulutuksen_jarjestaja_historia_id = coalesce(d4h.id,-1)
	,f.koulutusluokitus
	,koulutusluokitus_id = coalesce(d5.id,-1)
	,koulutusluokitus_historia_id = coalesce(d5h.id,-1)
	,f.koulutuksen_kieli
	,koulutuksen_kieli_id = coalesce(d6.id,-1)
	,f.koulutuksen_kunta
	,koulutuksen_kunta_id = coalesce(d7.id,-1)
	,koulutuksen_kunta_historia_id = coalesce(d7h.id,-1)
	,f.opetushallinnon_koulutus
	,opetushallinnon_koulutus_id = coalesce(d8.id,-1)
	,f.sukupuoli
	,sukupuoli_id = coalesce(d9.id,-1)
	,f.aidinkieli_versio1
	,aidinkieli_versio1_id = coalesce(d10.id,-1)
	,f.kirjoihintulovuosi
	,f.jarjestys_kirjoihintulovuosi
	,kirjoihintulovuosi_id = coalesce(d11.kausi_id,'-1')
	,f.kirjoihintulokausi
	,kirjoihintulokausi_id = coalesce(d12.kausi_id,'-1')
	,f.opiskelijan_olo_tamm
	,opiskelijan_olo_tamm_id = coalesce(d13.id,-1)
	,f.opiskelijan_olo_syys
	,opiskelijan_olo_syys_id = coalesce(d14.id,-1)
	,f.aikuisopiskelija
	,aikuisopiskelija_id = coalesce(d15.id,-1)
	,f.ika_tilv_1v as ika_1v
	,ika_1v_id = coalesce(d16.id,-1)
	,f.ika_tilv_5v as ika_5v
	,ika_5v_id = coalesce(d16b.id,-1)
	,f.ika_kirjv_1v as ika_kirjoihintulovuosi_1v
	,ika_kirjoihintulovuosi_1v_id = coalesce(d16c.id,-1)
	,f.ika_kirjv_5v as ika_kirjoihintulovuosi_5v
	,ika_kirjoihintulovuosi_5v_id = coalesce(d16d.id,-1)
	,f.lukumaara
	,f.lukiokoulutuksen_koulutuslaji
	,lukiokoulutuksen_koulutuslaji_id = coalesce(d17.id,-1)
	,f.nuorten_aikuisten_koulutus
	,nuorten_aikuisten_koulutus_id = coalesce(d18.id,-1)
	,f.koulutuksen_tutkinnon_aloitusvuosi
	,koulutuksen_tutkinnon_aloitusvuosi_id = coalesce(d19.kausi_id,'-1')
	,f.koulutuksen_tutkinnon_aloituskausi
	,koulutuksen_tutkinnon_aloituskausi_id = coalesce(d20.kausi_id,'-1')
	,f.ammatillisen_koulutuksen_koulutuslaji
	,ammatillisen_koulutuksen_koulutuslaji_id = coalesce(d21.id,-1)
	,f.tutkintonimike_ammpk
	,tutkintonimike_ammpk_id = coalesce(d22.id,-1)
	,f.koulutusohjelma_ammpk
	,koulutusohjelma_ammpk_id = coalesce(d23.id,-1)
	,f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id = coalesce(d24.id,-1)
	,f.tyovoimapoliittinen_koulutus
	,tyovoimapoliittinen_koulutus_id = coalesce(d25.id,-1)
	,f.rahoituslahde_amm
	,rahoituslahde_amm_id = coalesce(d26.id,-1)
	,f.alkamispaivamaara
	,alkamispaivamaara_id = coalesce(d27.kausi_id,'-1')
	,f.paattymispaivamaara
	,paattymispaivamaara_id = coalesce(d28.kausi_id,'-1')
	,f.tutkinnon_tavoite
	,tutkinnon_tavoite_id = coalesce(d29.id,-1)
	,f.yrittajan_oppisopimuskoulutus
	,yrittajan_oppisopimuskoulutus_id = coalesce(d30.id,-1)
	,f.oppisopimus_purkautunut
	,oppisopimus_purkautunut_id = coalesce(d31.id,-1)
	,f.todistus_oppisopimuskoulutuksen_suorittamisesta
	,todistus_oppisopimuskoulutuksen_suorittamisesta_id = coalesce(d32.id,-1)
	,f.toimiala_2008
	,toimiala_2008_id = coalesce(d33.id,-1)
	,f.oppisopimus_yrityksen_koko
	,oppisopimus_yrityksen_koko_id = coalesce(d34.id,-1)
	,f.tyonantajasektori
	,tyonantajasektori_id = coalesce(d35.id,-1)
	,f.asuinmaakunta
	,asuinmaakunta_id = coalesce(d36.id,-1)
	,asuinmaakunta_historia_id = coalesce(d36h.id,-1)
	,f.tietolahde
	,f.rivinumero
	,f.aineistotunnus
	,f.koulutussektori
	,koulutussektori_id = coalesce(d37.id,-1)
	,f.hallinnonala
	,hallinnonala_id = coalesce(d38.id,-1)
	,hallinnonala2_id = coalesce(d61.id,-1)
	,f.koulutuksen_jarjestamismuoto
	,koulutuksen_jarjestamismuoto_id = coalesce(d39.id,-1)
	,f.amm_sopimusjaksot
	,amm_sopimusjaksot_id = coalesce(d39b.id,-1)
	,f.ammatillinen_peruskoulutus_lisakoulutus
	,ammatillinen_peruskoulutus_lisakoulutus_id = coalesce(d40.id,-1)
	,f.koulutuksen_tavoite_toteuma
	,koulutuksen_tavoite_toteuma_id = coalesce(d41.id,-1)
	,f.tyovoimapoliittinen
	,tyovoimapoliittinen_id = coalesce(d42.id,-1)
	,f.aloittaneet
	,f.opiskelijat
	,f.opiskelijat_lasna
	,aineisto_id = -1
	,aineisto_OTV_id = coalesce(d43.id,-1)	
    ,koulutuksen_jarjestaja_kunta_id = coalesce(d51.id,-1)
    ,koulutuksen_jarjestaja_kunta_historia_id = coalesce(d51h.id,-1)
    ,oppilaitos_kunta_id = coalesce(d52.id,-1)
    ,oppilaitos_kunta_historia_id = coalesce(d52h.id,-1)
	,nuorten_aikuisten_koulutus_amm_id = coalesce(d53.id, -1)
	,koulutuslaji_OKM_id = coalesce(d54.id, -1)

	,yht_koulutuksen_jarjestaja_id = coalesce(d55.id, -1)
	,yht_koulutuksen_jarjestaja_historia_id = coalesce(d55h.id, -1)
	,yht_oppilaitos_id  = coalesce(d56.id, -1)
	,yht_oppilaitos_historia_id  = coalesce(d56h.id, -1)

    ,yht_koulutuksen_jarjestaja_kunta_id = coalesce(d57.id,-1)
    ,yht_koulutuksen_jarjestaja_kunta_historia_id = coalesce(d57h.id,-1)

    ,yht_oppilaitos_kunta_id = coalesce(d58.id,-1)
    ,yht_oppilaitos_kunta_historia_id = coalesce(d58h.id,-1)

    ,yht_koulutuksen_kunta_id = coalesce(d59.id,-1)
    ,yht_koulutuksen_kunta_historia_id = coalesce(d59h.id,-1)

    ,koulutusryhma_id = coalesce(d60.id, -1)	
--frm
 
FROM VipunenTK_DW.dbo.f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat AS f
LEFT JOIN VipunenTK..d_lahde AS d1 ON d1.lahde_koodi=f.lahde AND f.tilv_date between d1.alkaa and d1.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d2 ON d2.oppilaitos_avain=f.oppilaitos
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d3 ON d3.oppilaitos_avain=f.koulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d4 ON d4.oppilaitos_avain=f.oppisopimuskoulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d2h ON d2h.oppilaitos_avain=f.oppilaitos AND f.tilv_date between d2h.alkaa and d2h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d3h ON d3h.oppilaitos_avain=f.koulutuksen_jarjestaja AND f.tilv_date between d3h.alkaa and d3h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d4h ON d4h.oppilaitos_avain=f.oppisopimuskoulutuksen_jarjestaja AND f.tilv_date between d4h.alkaa and d4h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus AS d5 ON d5.koulutusluokitus_avain=f.koulutusluokitus 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d5h ON d5h.koulutusluokitus_avain=f.koulutusluokitus AND f.tilv_date between d5h.alkaa and d5h.paattyy
LEFT JOIN VipunenTK..d_kieli AS d6 ON d6.kieli_koodi=f.koulutuksen_kieli AND f.tilv_date between d6.alkaa and d6.paattyy

LEFT JOIN VipunenTK..d_alueluokitus AS d7 ON d7.alueluokitus_avain=f.koulutuksen_kunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d7h ON d7h.alueluokitus_avain=f.koulutuksen_kunta AND f.tilv_date between d7h.alkaa and d7h.paattyy

LEFT JOIN VipunenTK..d_opetushallinnon_koulutus AS d8 ON d8.opetushallinnon_koulutus_koodi=f.opetushallinnon_koulutus AND f.tilv_date between d8.alkaa and d8.paattyy
LEFT JOIN VipunenTK..d_sukupuoli AS d9 ON d9.sukupuoli_koodi=f.sukupuoli AND f.tilv_date between d9.alkaa and d9.paattyy
LEFT JOIN VipunenTK..d_aidinkieli_versio1 AS d10 ON d10.aidinkieli_versio1_koodi=f.aidinkieli_versio1 AND f.tilv_date between d10.alkaa and d10.paattyy
LEFT JOIN VipunenTK..d_kausi AS d11 ON d11.kausi_id	=(case when isnull(f.kirjoihintulovuosi,'') in ('9999','XXXX','') then '-1' else f.kirjoihintulovuosi end)
LEFT JOIN VipunenTK..d_kausi AS d12 ON d12.kausi_id	=(case
	  when isnull(f.kirjoihintulovuosi,'') in ('9999','XXXX','') then '-1'
	  when isnull(f.kirjoihintulokausi,'') in ('9','X','') then '-1'
	  else f.kirjoihintulovuosi+f.kirjoihintulokausi end)
LEFT JOIN VipunenTK..d_opiskelijan_olo_tamm AS d13 ON d13.opiskelijan_olo_tamm_koodi=f.opiskelijan_olo_tamm AND f.tilv_date between d13.alkaa and d13.paattyy
LEFT JOIN VipunenTK..d_opiskelijan_olo AS d14 ON d14.opiskelijan_olo_koodi=f.opiskelijan_olo_syys AND f.tilv_date between d14.alkaa and d14.paattyy
LEFT JOIN VipunenTK..d_aikuisopiskelija AS d15 ON d15.aikuisopiskelija_koodi=f.aikuisopiskelija AND f.tilv_date between d15.alkaa and d15.paattyy
LEFT JOIN VipunenTK..d_ika AS d16 ON d16.ika_avain=f.ika_tilv_1v
LEFT JOIN VipunenTK..d_ika AS d16b ON d16b.ika_avain='kirikar1'+coalesce(f.ika_tilv_5v,'')
LEFT JOIN VipunenTK..d_ika AS d16c ON d16c.ika_avain=f.ika_kirjv_1v
LEFT JOIN VipunenTK..d_ika AS d16d ON d16d.ika_avain='kirikar1'+coalesce(f.ika_kirjv_5v,'')
LEFT JOIN VipunenTK..d_lukiokoulutuksen_koulutuslaji AS d17 ON d17.lukiokoulutuksen_koulutuslaji_koodi=f.lukiokoulutuksen_koulutuslaji AND f.tilv_date between d17.alkaa and d17.paattyy
LEFT JOIN VipunenTK..d_nuorten_aikuisten_koulutus AS d18 ON d18.nuorten_aikuisten_koulutus_koodi=f.nuorten_aikuisten_koulutus AND f.tilv_date between d18.alkaa and d18.paattyy
LEFT JOIN VipunenTK..d_kausi AS d19 ON d19.kausi_id	=(case when isnull(f.koulutuksen_tutkinnon_aloitusvuosi,'') in ('9999','XXXX','') then '-1' else f.koulutuksen_tutkinnon_aloitusvuosi end)
LEFT JOIN VipunenTK..d_kausi AS d20 ON d20.kausi_id	=(case
	  when isnull(f.koulutuksen_tutkinnon_aloitusvuosi,'') in ('9999','XXXX','') then '-1'
	  when isnull(f.koulutuksen_tutkinnon_aloituskausi,'') in ('9','X','') then '-1'
	  else f.koulutuksen_tutkinnon_aloitusvuosi+f.koulutuksen_tutkinnon_aloituskausi end)
LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji AS d21 ON d21.ammatillisen_koulutuksen_koulutuslaji_koodi=f.ammatillisen_koulutuksen_koulutuslaji AND f.tilv_date between d21.alkaa and d21.paattyy
LEFT JOIN VipunenTK..d_tutkintonimike_ammpk AS d22 ON d22.tutkintonimike_ammpk_koodi=f.tutkintonimike_ammpk AND f.tilv_date between d22.alkaa and d22.paattyy
LEFT JOIN VipunenTK..d_koulutusohjelma_ammpk AS d23 ON d23.koulutusohjelma_ammpk_koodi=(case when f.koulutusohjelma_ammpk='9999' then '-1' else f.koulutusohjelma_ammpk end) AND f.tilv_date between d23.alkaa and d23.paattyy
LEFT JOIN VipunenTK..d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AS d24 ON d24.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AND f.tilv_date between d24.alkaa and d24.paattyy
LEFT JOIN VipunenTK..d_tyovoimapoliittinen_koulutus AS d25 ON d25.tyovoimapoliittinen_koulutus_koodi=f.tyovoimapoliittinen_koulutus AND f.tilv_date between d25.alkaa and d25.paattyy
LEFT JOIN VipunenTK..d_rahoituslahde_amm AS d26 ON d26.rahoituslahde_amm_koodi=f.rahoituslahde_amm AND f.tilv_date between d26.alkaa and d26.paattyy
LEFT JOIN VipunenTK..d_kausi AS d27 ON d27.kausi_id	=(case when isnull(f.alkamispaivamaara,'') in ('') then '-1' else f.alkamispaivamaara end)
LEFT JOIN VipunenTK..d_kausi AS d28 ON d28.kausi_id	=(case when isnull(f.paattymispaivamaara,'') in ('') then '-1' else f.paattymispaivamaara end)
LEFT JOIN VipunenTK..d_tutkinnon_tavoite AS d29 ON d29.tutkinnon_tavoite_koodi=f.tutkinnon_tavoite AND f.tilv_date between d29.alkaa and d29.paattyy
LEFT JOIN VipunenTK..d_yrittajan_oppisopimuskoulutus AS d30 ON d30.yrittajan_oppisopimuskoulutus_koodi=f.yrittajan_oppisopimuskoulutus AND f.tilv_date between d30.alkaa and d30.paattyy
LEFT JOIN VipunenTK..d_oppisopimus_purkautunut AS d31 ON d31.oppisopimus_purkautunut_koodi=f.oppisopimus_purkautunut AND f.tilv_date between d31.alkaa and d31.paattyy
LEFT JOIN VipunenTK..d_todistus_oppisopimuskoulutuksen_suorittamisesta AS d32 ON d32.todistus_oppisopimuskoulutuksen_suorittamisesta_koodi=f.todistus_oppisopimuskoulutuksen_suorittamisesta AND f.tilv_date between d32.alkaa and d32.paattyy
LEFT JOIN VipunenTK..d_toimiala_2008 AS d33 ON d33.toimiala_2008_avain=f.toimiala_2008 AND f.tilv_date between d33.alkaa and d33.paattyy
LEFT JOIN VipunenTK..d_oppisopimus_yrityksen_koko AS d34 ON d34.oppisopimus_yrityksen_koko_koodi=f.oppisopimus_yrityksen_koko AND f.tilv_date between d34.alkaa and d34.paattyy
LEFT JOIN VipunenTK..d_tyonantajasektori AS d35 ON d35.tyonantajasektori_koodi=f.tyonantajasektori AND f.tilv_date between d35.alkaa and d35.paattyy

LEFT JOIN VipunenTK..d_alueluokitus AS d36 ON d36.alueluokitus_avain='MAAK'+f.asuinmaakunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d36h ON d36h.alueluokitus_avain='MAAK'+f.asuinmaakunta AND f.tilv_date between d36h.alkaa and d36h.paattyy

LEFT JOIN VipunenTK..d_koulutussektori AS d37 ON d37.koulutussektori_koodi=f.koulutussektori AND f.tilv_date between d37.alkaa and d37.paattyy
LEFT JOIN VipunenTK..d_hallinnonala AS d38 ON d38.hallinnonala_koodi=f.hallinnonala AND f.tilv_date between d38.alkaa and d38.paattyy
LEFT JOIN VipunenTK..d_koulutuksen_jarjestamismuoto AS d39 ON d39.koulutuksen_jarjestamismuoto_koodi=f.koulutuksen_jarjestamismuoto AND f.tilv_date between d39.alkaa and d39.paattyy
LEFT JOIN VipunenTK..d_amm_sopimusjaksot AS d39b ON d39b.koodi=f.amm_sopimusjaksot AND f.tilv_date between d39b.alkaa and d39b.paattyy
LEFT JOIN VipunenTK..d_ammatillinen_peruskoulutus_lisakoulutus AS d40 ON d40.ammatillinen_peruskoulutus_lisakoulutus_koodi=f.ammatillinen_peruskoulutus_lisakoulutus AND f.tilv_date between d40.alkaa and d40.paattyy
LEFT JOIN VipunenTK..d_koulutuksen_tavoite_toteuma AS d41 ON d41.koulutuksen_tavoite_toteuma_koodi=f.koulutuksen_tavoite_toteuma AND f.tilv_date between d41.alkaa and d41.paattyy
LEFT JOIN VipunenTK..d_tyovoimapoliittinen AS d42 ON d42.tyovoimapoliittinen_koodi=f.tyovoimapoliittinen AND f.tilv_date between d42.alkaa and d42.paattyy

LEFT JOIN VipunenTK..d_aineisto_OTV AS d43 ON d43.aineisto_koodi=f.aineistotunnus AND f.tilv_date between d43.alkaa and d43.paattyy

/* koulutuksen järjestäjän sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d51 ON d51.alueluokitus_avain = 
		(select koulutuksen_jarjestajan_ksijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.koulutuksen_jarjestaja)

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d51h ON d51h.alueluokitus_avain = 
		(select koulutuksen_jarjestajan_ksijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.koulutuksen_jarjestaja AND f.tilv_date between d51h.alkaa and d51h.paattyy)
		AND f.tilv_date between d51h.alkaa and d51h.paattyy

/* oppilaitoksen sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d52 ON d52.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.oppilaitos)

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d52h ON d52h.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.oppilaitos AND f.tilv_date between d52h.alkaa and d52h.paattyy)
		AND f.tilv_date between d52h.alkaa and d52h.paattyy

/*

     (select a.id from vipunentk..d_alueluokitus as a where a.kunta_koodi =
		(select b.sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot as b where b.id =
			(select id from vipunentk..d_oppilaitoksen_taustatiedot where	koulutuksen_jarjestajakoodi =
				(case when isnull(f.koulutuksen_jarjestaja,'')='' then '-1' 
				when f.koulutuksen_jarjestaja<>'' and f.koulutuksen_jarjestaja not in (select koulutuksen_jarjestajakoodi from vipunentk..d_oppilaitoksen_taustatiedot) then '-1' 
				else f.koulutuksen_jarjestaja end) )
		)
	)

*/

LEFT JOIN VipunenTK..d_nuorten_aikuisten_koulutus_amm as d53 on d53.nuorten_aikuisten_koulutus_amm_koodi = f.nuorten_aikuisten_koulutus_amm

LEFT JOIN VipunenTK..d_koulutuslaji_okm AS d54 ON d54.koulutuslaji_okm_avain = f.koulutuslaji_OKM_avain

/*********** yhteinen koulutuksen järjestäjä, oppilaitos & niihin liittyvät aluetiedot -- Lasse 3.9.2015 ***********/

LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d55 ON d55.oppilaitos_avain=f.yhtjarj
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d55h ON d55h.oppilaitos_avain=f.yhtjarj AND f.tilv_date between d55h.alkaa and d55h.paattyy

LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d56 ON d56.oppilaitos_avain=f.yhtoppilaitos
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d56h ON d56h.oppilaitos_avain=f.yhtoppilaitos AND f.tilv_date between d56h.alkaa and d56h.paattyy

/* yhteisen koulutuksen järjestäjän sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d57 ON d57.alueluokitus_avain = 
		(select koulutuksen_jarjestajan_ksijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.yhtjarj)

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d57h ON d57h.alueluokitus_avain = 
		(select koulutuksen_jarjestajan_ksijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.yhtjarj AND f.tilv_date between d57h.alkaa and d57h.paattyy)
		AND f.tilv_date between d57h.alkaa and d57h.paattyy


/* yhteisen oppilaitoksen sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d58 ON d58.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.yhtoppilaitos)

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d58h ON d58h.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.yhtoppilaitos AND f.tilv_date between d58h.alkaa and d58h.paattyy)
		AND f.tilv_date between d58h.alkaa and d58h.paattyy


/* yhteisen koulutuksen sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d59 ON d59.alueluokitus_avain = f.yht_koulutuksen_kunta

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d59h ON d59h.alueluokitus_avain = f.yht_koulutuksen_kunta AND f.tilv_date between d59h.alkaa and d59h.paattyy
		


LEFT JOIN VipunenTK..d_koulutusryhma AS d60 ON d60.koulutusryhma_koodi = f.koulutusryhma_avain

LEFT JOIN VipunenTK..d_hallinnonala2 d61 ON d61.hallinnonala_koodi = f.hallinnonala2


GO

USE [ANTERO]