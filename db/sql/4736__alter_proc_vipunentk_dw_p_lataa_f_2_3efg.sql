USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_2_3efg]    Script Date: 9.8.2021 21:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_f_2_3efg] AS

--execute VipunenTK_DW.dbo.p_lataa_OTV_f_2_3

TRUNCATE TABLE VipunenTK.[dbo].f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat;

INSERT INTO [VipunenTK].[dbo].[f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]

SELECT 

	 f.tilastointivuosi
	,f.tilv_date
	,f.lahde
	,lahde_id = coalesce(d1.id,-1)
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
	,f.aidinkieli
	,aidinkieli_versio1_id = coalesce(d10.id,-1)
	,f.kirjoihintulovuosi
	,kirjoihintulovuosi_id = coalesce(d11.kausi_id,'-1')
	,f.opiskelijan_olo_syys
	,opiskelijan_olo_syys_id = coalesce(d14.id,-1)
	,f.aikuisopiskelija
	,aikuisopiskelija_id = coalesce(d15.id,-1)

	,f.ika_kirjoihintulovuonna
	,ika_kirjoihintulovuonna_id = coalesce(d16.id,-1)
	,ikaryhma_kirjoihintulovuonna_id = coalesce(d16_2.id,-1)
	,f.ika
	,ika_id = coalesce(d17.id,-1)
	,ikaryhma_id = coalesce(d17_2.id,-1)

	,f.lukumaara
	,f.nuorten_aikuisten_koulutus
	,nuorten_aikuisten_koulutus_id = coalesce(d18.id,-1)
	,f.koulutuksen_tutkinnon_aloitusvuosi
	,koulutuksen_tutkinnon_aloitusvuosi_id = coalesce(d19.kausi_id,'-1')
	,f.ammatillisen_koulutuksen_koulutuslaji
	,ammatillisen_koulutuksen_koulutuslaji_id = coalesce(d21.id,-1)
	,f.tutkintonimike_ammpk
	,tutkintonimike_ammpk_id = coalesce(d22.id,-1)
	,f.koulutusohjelma_ammpk
	,koulutusohjelma_ammpk_id = coalesce(d23.id,-1)
	,f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id = coalesce(d24.id,-1)
	,f.rahoituslahde_amm
	,rahoituslahde_amm_id = coalesce(d26.id,-1)
	,f.tutkinnon_tavoite
	,tutkinnon_tavoite_id = coalesce(d29.id,-1)
	,f.asuinmaakunta
	,asuinmaakunta_id = coalesce(d36.id,-1)
	,asuinmaakunta_historia_id = coalesce(d36h.id,-1)
	,f.tietolahde
	,f.rivinumero
	,f.aineistotunnus
	,f.koulutussektori
	,koulutussektori_id = coalesce(d37.id,-1)
	,f.koulutuksen_jarjestamismuoto
	,koulutuksen_jarjestamismuoto_id = coalesce(d39.id,-1)
	,f.amm_sopimusjaksot
	,amm_sopimusjaksot_id = coalesce(d39b.id,-1)
	,f.ammatillinen_peruskoulutus_lisakoulutus
	,ammatillinen_peruskoulutus_lisakoulutus_id = coalesce(d40.id,-1)
	,f.koulutuksen_tavoite_toteuma
	,koulutuksen_tavoite_toteuma_id = coalesce(d41.id,-1)

	,f.aloittaneet
	,f.opiskelijat
	,f.opiskelijat_lasna
	,aineisto_id = -1
	,aineisto_OTV_id = coalesce(d43.id,-1)	
    ,koulutuksen_jarjestaja_kunta_id = coalesce(d51.id,-1)
    ,koulutuksen_jarjestaja_kunta_historia_id = coalesce(d51h.id,-1)

	,nuorten_aikuisten_koulutus_amm_id = coalesce(d53.id, -1)
	,koulutuslaji_OKM_id = coalesce(d54.id, -1)

	,yht_koulutuksen_jarjestaja_id = coalesce(d55.id, -1)
	,yht_koulutuksen_jarjestaja_historia_id = coalesce(d55h.id, -1)

    ,yht_koulutuksen_jarjestaja_kunta_id = coalesce(d57.id,-1)
    ,yht_koulutuksen_jarjestaja_kunta_historia_id = coalesce(d57h.id,-1)

	,hallinnonala2_id = coalesce(d8b.id,-1)


--into [VipunenTK].[dbo].[f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]
 
FROM VipunenTK_DW.dbo.v_f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat AS f
LEFT JOIN VipunenTK..d_lahde AS d1 ON d1.lahde_koodi=f.lahde AND f.tilv_date between d1.alkaa and d1.paattyy

LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d3 ON d3.oppilaitos_avain=f.koulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d4 ON d4.oppilaitos_avain=f.oppisopimuskoulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d3h ON d3h.oppilaitos_avain=f.koulutuksen_jarjestaja AND f.tilv_date between d3h.alkaa and d3h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d4h ON d4h.oppilaitos_avain=f.oppisopimuskoulutuksen_jarjestaja AND f.tilv_date between d4h.alkaa and d4h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus AS d5 ON d5.koulutusluokitus_avain=f.koulutusluokitus 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d5h ON d5h.koulutusluokitus_avain=f.koulutusluokitus AND f.tilv_date between d5h.alkaa and d5h.paattyy
LEFT JOIN VipunenTK..d_kieli AS d6 ON d6.kieli_koodi=f.koulutuksen_kieli AND f.tilv_date between d6.alkaa and d6.paattyy

LEFT JOIN VipunenTK..d_alueluokitus AS d7 ON d7.alueluokitus_avain=f.koulutuksen_kunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d7h ON d7h.alueluokitus_avain=f.koulutuksen_kunta AND f.tilv_date between d7h.alkaa and d7h.paattyy

LEFT JOIN VipunenTK..d_opetushallinnon_koulutus AS d8 ON d8.opetushallinnon_koulutus_koodi=f.opetushallinnon_koulutus AND f.tilv_date between d8.alkaa and d8.paattyy
LEFT JOIN VipunenTK..d_hallinnonala2 d8b ON d8b.hallinnonala_koodi=f.hallinnonala2 AND f.tilv_date between d8b.alkaa and d8b.paattyy
LEFT JOIN VipunenTK..d_sukupuoli AS d9 ON d9.sukupuoli_koodi=f.sukupuoli AND f.tilv_date between d9.alkaa and d9.paattyy
LEFT JOIN VipunenTK..d_aidinkieli_versio1 AS d10 ON d10.aidinkieli_versio1_koodi=f.aidinkieli AND f.tilv_date between d10.alkaa and d10.paattyy
LEFT JOIN VipunenTK..d_kausi AS d11 ON d11.kausi_id	=(case when isnull(f.kirjoihintulovuosi,'') in ('9999','XXXX','') then '-1' else f.kirjoihintulovuosi end)

LEFT JOIN VipunenTK..d_opiskelijan_olo AS d14 ON d14.opiskelijan_olo_koodi=f.opiskelijan_olo_syys AND f.tilv_date between d14.alkaa and d14.paattyy
LEFT JOIN VipunenTK..d_aikuisopiskelija AS d15 ON d15.aikuisopiskelija_koodi=f.aikuisopiskelija AND f.tilv_date between d15.alkaa and d15.paattyy
LEFT JOIN VipunenTK..d_ika AS d16 ON d16.ika_avain=f.ika_kirjoihintulovuonna
LEFT JOIN VipunenTK..d_ika AS d16_2 ON d16_2.ika_avain=f.ikaryhma_kirjoihintulovuonna
LEFT JOIN VipunenTK..d_ika AS d17 ON d17.ika_avain=f.ika
LEFT JOIN VipunenTK..d_ika AS d17_2 ON d17_2.ika_avain=f.ikaryhma

LEFT JOIN VipunenTK..d_nuorten_aikuisten_koulutus AS d18 ON d18.nuorten_aikuisten_koulutus_koodi=f.nuorten_aikuisten_koulutus AND f.tilv_date between d18.alkaa and d18.paattyy
LEFT JOIN VipunenTK..d_kausi AS d19 ON d19.kausi_id	=(case when isnull(f.koulutuksen_tutkinnon_aloitusvuosi,'') in ('9999','XXXX','') then '-1' else f.koulutuksen_tutkinnon_aloitusvuosi end)

LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji AS d21 ON d21.ammatillisen_koulutuksen_koulutuslaji_koodi=f.ammatillisen_koulutuksen_koulutuslaji AND f.tilv_date between d21.alkaa and d21.paattyy
LEFT JOIN VipunenTK..d_tutkintonimike_ammpk AS d22 ON d22.tutkintonimike_ammpk_koodi=f.tutkintonimike_ammpk AND f.tilv_date between d22.alkaa and d22.paattyy
LEFT JOIN VipunenTK..d_koulutusohjelma_ammpk AS d23 ON d23.koulutusohjelma_ammpk_koodi=(case when f.koulutusohjelma_ammpk='9999' then '-1' else f.koulutusohjelma_ammpk end) AND f.tilv_date between d23.alkaa and d23.paattyy
LEFT JOIN VipunenTK..d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AS d24 ON d24.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AND f.tilv_date between d24.alkaa and d24.paattyy

LEFT JOIN VipunenTK..d_rahoituslahde_amm AS d26 ON d26.rahoituslahde_amm_koodi=f.rahoituslahde_amm AND f.tilv_date between d26.alkaa and d26.paattyy

LEFT JOIN VipunenTK..d_tutkinnon_tavoite AS d29 ON d29.tutkinnon_tavoite_koodi=f.tutkinnon_tavoite AND f.tilv_date between d29.alkaa and d29.paattyy


LEFT JOIN VipunenTK..d_alueluokitus AS d36 ON d36.alueluokitus_avain='MAAK'+f.asuinmaakunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d36h ON d36h.alueluokitus_avain='MAAK'+f.asuinmaakunta AND f.tilv_date between d36h.alkaa and d36h.paattyy

LEFT JOIN VipunenTK..d_koulutussektori AS d37 ON d37.koulutussektori_koodi=f.koulutussektori AND f.tilv_date between d37.alkaa and d37.paattyy
LEFT JOIN VipunenTK..d_koulutuksen_jarjestamismuoto AS d39 ON d39.koulutuksen_jarjestamismuoto_koodi=f.koulutuksen_jarjestamismuoto AND f.tilv_date between d39.alkaa and d39.paattyy
LEFT JOIN VipunenTK..d_amm_sopimusjaksot AS d39b ON d39b.koodi=f.amm_sopimusjaksot AND f.tilv_date between d39b.alkaa and d39b.paattyy
LEFT JOIN VipunenTK..d_ammatillinen_peruskoulutus_lisakoulutus AS d40 ON d40.ammatillinen_peruskoulutus_lisakoulutus_koodi=f.ammatillinen_peruskoulutus_lisakoulutus AND f.tilv_date between d40.alkaa and d40.paattyy
LEFT JOIN VipunenTK..d_koulutuksen_tavoite_toteuma AS d41 ON d41.koulutuksen_tavoite_toteuma_koodi=f.koulutuksen_tavoite_toteuma AND f.tilv_date between d41.alkaa and d41.paattyy

LEFT JOIN VipunenTK..d_aineisto_OTV AS d43 ON d43.aineisto_koodi=f.aineistotunnus AND f.tilv_date between d43.alkaa and d43.paattyy

/* koulutuksen järjestäjän sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d51 ON d51.alueluokitus_avain = 
		(select koulutuksen_jarjestajan_ksijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.koulutuksen_jarjestaja)

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d51h ON d51h.alueluokitus_avain = 
		(select koulutuksen_jarjestajan_ksijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.koulutuksen_jarjestaja AND f.tilv_date between d51h.alkaa and d51h.paattyy)
		AND f.tilv_date between d51h.alkaa and d51h.paattyy

LEFT JOIN VipunenTK..d_nuorten_aikuisten_koulutus_amm as d53 on d53.nuorten_aikuisten_koulutus_amm_koodi = f.nuorten_aikuisten_koulutus_amm

LEFT JOIN VipunenTK..d_koulutuslaji_okm AS d54 ON d54.koulutuslaji_okm_avain = f.koulutuslaji_OKM_avain

/*********** yhteinen koulutuksen järjestäjä, oppilaitos & niihin liittyvät aluetiedot -- Lasse 3.9.2015 ***********/

LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d55 ON d55.oppilaitos_avain=f.yhtjarj
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d55h ON d55h.oppilaitos_avain=f.yhtjarj AND f.tilv_date between d55h.alkaa and d55h.paattyy


/* yhteisen koulutuksen järjestäjän sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d57 ON d57.alueluokitus_avain = 
		(select koulutuksen_jarjestajan_ksijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.yhtjarj)

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d57h ON d57h.alueluokitus_avain = 
		(select koulutuksen_jarjestajan_ksijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.yhtjarj AND f.tilv_date between d57h.alkaa and d57h.paattyy)
		AND f.tilv_date between d57h.alkaa and d57h.paattyy
