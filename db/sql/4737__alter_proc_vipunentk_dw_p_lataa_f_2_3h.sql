USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_2_3h]    Script Date: 9.8.2021 21:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_f_2_3h] AS

--execute VipunenTK_DW.dbo.p_lataa_f_2_3h

TRUNCATE TABLE VipunenTK.[dbo].f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat;

INSERT INTO [VipunenTK].[dbo].[f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]

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
	,f.koulk 
	,koulk_id = coalesce(d5.id,-1)
	,f.koulutusala
	,koulutusala_id = coalesce(d9.id,-1)
	,f.koulutusala_taso1
	,koulutusala_taso1_id = coalesce(d9b.id,-1)
	,f.koulutusaste
	,koulutusaste_id = coalesce(d10.id,-1)
	,f.koulutusaste_taso2
	,koulutusaste_taso2_id = coalesce(d10b.id,-1)
	,f.koulutuksen_kieli
	,koulutuksen_kieli_id = coalesce(d6.id,-1)
	,f.koulutuksen_kunta
	,koulutuksen_kunta_id = coalesce(d7.id,-1)
	,koulutuksen_kunta_historia_id = coalesce(d7h.id,-1)
	,f.opetushallinnon_koulutus
	,opetushallinnon_koulutus_id = coalesce(d8.id,-1)
	,f.kirjoihintulovuosi
	,kirjoihintulovuosi_id = coalesce(d11.kausi_id,'-1')
	,f.opiskelijan_olo_syys
	,opiskelijan_olo_syys_id = coalesce(d14.id,-1)
	,f.ika_1v
	,ika_1v_id = coalesce(d15.id,-1)
	,f.ika_5v
	,ika_5v_id = coalesce(d16.id,-1)
	,f.lukumaara
	,f.lukiokoulutuksen_koulutuslaji
	,lukiokoulutuksen_koulutuslaji_id = coalesce(d17.id,-1)
	,f.nuorten_aikuisten_koulutus
	,nuorten_aikuisten_koulutus_id = coalesce(d18.id,-1)
	,f.ammatillisen_koulutuksen_koulutuslaji
	,ammatillisen_koulutuksen_koulutuslaji_id = coalesce(d21.id,-1)
	,f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id = coalesce(d24.id,-1)
	,f.tyovoimapoliittinen_koulutus
	,tyovoimapoliittinen_koulutus_id = coalesce(d25.id,-1)
	,f.rahoituslahde_amm
	,rahoituslahde_amm_id = coalesce(d26.id,-1)
	,f.tutkinnon_tavoite
	,tutkinnon_tavoite_id = coalesce(d29.id,-1)
	,f.yrittajan_oppisopimuskoulutus
	,yrittajan_oppisopimuskoulutus_id = coalesce(d30.id,-1)
	,f.tietolahde
	,f.rivinumero
	,f.aineistotunnus
	,f.koulutussektori
	,koulutussektori_id = coalesce(d37.id,-1)
	,f.hallinnonala
	,hallinnonala_id = coalesce(d38.id,-1)
	,f.hallinnonala2
	,hallinnonala2_id = coalesce(d38b.id,-1)
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

	,kotikunta_id=coalesce(d60.id,-1)
	,f.kotikunta
	,kotikunta_ed_id=coalesce(d61.id,-1)
	,f.kotikunta_ed

	,kotikunta_sama_kuin_koulutuksen_kunta_id = coalesce(d62.id,-1)
	,kotimaakunta_sama_kuin_koulutuksen_maakunta_id = coalesce(d63.id,-1)
	,kotikunta_sama_kuin_ed_vuonna_id = coalesce(d64.id,-1)
	,kotimaakunta_sama_kuin_ed_vuonna_id = coalesce(d65.id,-1)
	,ed_vuoden_kotimaakunta_sama_kuin_koulutuksen_maakunta_id = coalesce(d66.id,-1)
	,ed_vuoden_kotikunta_sama_kuin_koulutuksen_kunta_id = coalesce(d67.id,-1)

	
	
--INTO [VipunenTK].[dbo].[f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]
 
FROM VipunenTK_DW.dbo.v_f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat AS f
LEFT JOIN VipunenTK..d_lahde AS d1 ON d1.lahde_koodi=f.lahde AND f.tilv_date between d1.alkaa and d1.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d2 ON d2.oppilaitos_avain=f.oppilaitos
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d3 ON d3.oppilaitos_avain=f.koulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d4 ON d4.oppilaitos_avain=f.oppisopimuskoulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d2h ON d2h.oppilaitos_avain=f.oppilaitos AND f.tilv_date between d2h.alkaa and d2h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d3h ON d3h.oppilaitos_avain=f.koulutuksen_jarjestaja AND f.tilv_date between d3h.alkaa and d3h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d4h ON d4h.oppilaitos_avain=f.oppisopimuskoulutuksen_jarjestaja AND f.tilv_date between d4h.alkaa and d4h.paattyy
LEFT JOIN VipunenTK..d_kieli AS d6 ON d6.kieli_koodi=f.koulutuksen_kieli AND f.tilv_date between d6.alkaa and d6.paattyy
LEFT JOIN VipunenTK..d_alueluokitus AS d7 ON d7.alueluokitus_avain=f.koulutuksen_kunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d7h ON d7h.alueluokitus_avain=f.koulutuksen_kunta AND f.tilv_date between d7h.alkaa and d7h.paattyy
LEFT JOIN VipunenTK..d_opetushallinnon_koulutus AS d8 ON d8.opetushallinnon_koulutus_koodi=f.opetushallinnon_koulutus AND f.tilv_date between d8.alkaa and d8.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus d5 on d5.koulutusluokitus_avain=f.koulk
LEFT JOIN VipunenTK..d_koulutusluokitus d9 on d9.koulutusluokitus_avain='OPMALA'+f.koulutusala
LEFT JOIN VipunenTK..d_koulutusluokitus d9b on d9b.koulutusluokitus_avain='ISCFIBROAD'+f.koulutusala_taso1
LEFT JOIN VipunenTK..d_koulutusaste_2002 d10 on d10.koulutusaste_2002koodi=f.koulutusaste
LEFT JOIN VipunenTK..d_koulutusluokitus d10b on d10b.koulutusluokitus_avain='KASTET2'+f.koulutusaste_taso2
LEFT JOIN VipunenTK..d_kausi AS d11 ON d11.kausi_id	=(case when isnull(f.kirjoihintulovuosi,'') in ('9999','XXXX','') then '-1' else f.kirjoihintulovuosi end)
LEFT JOIN VipunenTK..d_opiskelijan_olo AS d14 ON d14.opiskelijan_olo_koodi=f.opiskelijan_olo_syys AND f.tilv_date between d14.alkaa and d14.paattyy
LEFT JOIN VipunenTK..d_ika AS d15 ON d15.ika_avain=f.ika_1v
LEFT JOIN VipunenTK..d_ika AS d16 ON d16.ika_avain='kirikar1'+coalesce(f.ika_5v,'')
LEFT JOIN VipunenTK..d_lukiokoulutuksen_koulutuslaji AS d17 ON d17.lukiokoulutuksen_koulutuslaji_koodi=f.lukiokoulutuksen_koulutuslaji AND f.tilv_date between d17.alkaa and d17.paattyy
LEFT JOIN VipunenTK..d_nuorten_aikuisten_koulutus AS d18 ON d18.nuorten_aikuisten_koulutus_koodi=f.nuorten_aikuisten_koulutus AND f.tilv_date between d18.alkaa and d18.paattyy
LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji AS d21 ON d21.ammatillisen_koulutuksen_koulutuslaji_koodi=f.ammatillisen_koulutuksen_koulutuslaji AND f.tilv_date between d21.alkaa and d21.paattyy
LEFT JOIN VipunenTK..d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AS d24 ON d24.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AND f.tilv_date between d24.alkaa and d24.paattyy
LEFT JOIN VipunenTK..d_tyovoimapoliittinen_koulutus AS d25 ON d25.tyovoimapoliittinen_koulutus_koodi=f.tyovoimapoliittinen_koulutus AND f.tilv_date between d25.alkaa and d25.paattyy
LEFT JOIN VipunenTK..d_rahoituslahde_amm AS d26 ON d26.rahoituslahde_amm_koodi=f.rahoituslahde_amm AND f.tilv_date between d26.alkaa and d26.paattyy
LEFT JOIN VipunenTK..d_tutkinnon_tavoite AS d29 ON d29.tutkinnon_tavoite_koodi=f.tutkinnon_tavoite AND f.tilv_date between d29.alkaa and d29.paattyy
LEFT JOIN VipunenTK..d_yrittajan_oppisopimuskoulutus AS d30 ON d30.yrittajan_oppisopimuskoulutus_koodi=f.yrittajan_oppisopimuskoulutus AND f.tilv_date between d30.alkaa and d30.paattyy
LEFT JOIN VipunenTK..d_koulutussektori AS d37 ON d37.koulutussektori_koodi=f.koulutussektori AND f.tilv_date between d37.alkaa and d37.paattyy
LEFT JOIN VipunenTK..d_hallinnonala AS d38 ON d38.hallinnonala_koodi=f.hallinnonala AND f.tilv_date between d38.alkaa and d38.paattyy
LEFT JOIN VipunenTK..d_hallinnonala2 AS d38b ON d38b.hallinnonala_koodi=f.hallinnonala2 AND f.tilv_date between d38b.alkaa and d38b.paattyy
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



LEFT JOIN VipunenTK..d_alueluokitus d60 on d60.alueluokitus_avain=f.kotikunta
LEFT JOIN VipunenTK..d_alueluokitus d61 on d61.alueluokitus_avain=f.kotikunta_ed

LEFT JOIN VipunenTK..d_kylla_ei d62 on d62.kylla_ei_koodi=f.kotikunta_sama_kuin_koulutuksen_kunta
LEFT JOIN VipunenTK..d_kylla_ei d63 on d63.kylla_ei_koodi=f.kotimaakunta_sama_kuin_koulutuksen_maakunta
LEFT JOIN VipunenTK..d_kylla_ei d64 on d64.kylla_ei_koodi=f.kotikunta_sama_kuin_ed_vuonna
LEFT JOIN VipunenTK..d_kylla_ei d65 on d65.kylla_ei_koodi=f.kotimaakunta_sama_kuin_ed_vuonna
LEFT JOIN VipunenTK..d_kylla_ei d66 on d66.kylla_ei_koodi=f.ed_vuoden_kotimaakunta_sama_kuin_koulutuksen_maakunta
LEFT JOIN VipunenTK..d_kylla_ei d67 on d67.kylla_ei_koodi=f.ed_vuoden_kotikunta_sama_kuin_koulutuksen_kunta

