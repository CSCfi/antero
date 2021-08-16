USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_2_4efg]    Script Date: 9.8.2021 22:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_f_2_4efg] AS

--execute VipunenTK_DW.dbo.p_lataa_OTV_f_2_4
TRUNCATE TABLE VipunenTK.dbo.f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot

INSERT INTO VipunenTK.dbo.f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot

SELECT 
	 f.tilastointivuosi
	,f.tilv_date
	,f.lahde,lahde_id = coalesce(d1.id,-1)
	
	,f.koulutuksen_jarjestaja
	,koulutuksen_jarjestaja_id = coalesce(d3.id,-1)
	,koulutuksen_jarjestaja_historia_id = coalesce(d3h.id,-1)
	,f.oppisopimuskoulutuksen_jarjestaja
	,oppisopimuskoulutuksen_jarjestaja_id = coalesce(d4.id,-1)
	,oppisopimuskoulutuksen_jarjestaja_historia_id = coalesce(d4h.id,-1)

	,f.koulutusluokitus
	,koulutusluokitus_id = coalesce(d5.id,-1)
	,koulutusluokitus_historia_id = coalesce(d5h.id,-1)	

	,f.tutkintonimike_ammpk
	,tutkintonimike_ammpk_id = coalesce(d6.id,-1)
	,f.koulutusohjelma_ammpk
	,koulutusohjelma_ammpk_id = coalesce(d7.id,-1)

	,f.ammatillisen_koulutuksen_koulutuslaji
	,ammatillisen_koulutuksen_koulutuslaji_id = coalesce(d8.id,-1)
	,f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id = coalesce(d9.id,-1)
	,f.koulutuksen_kieli
	,koulutuksen_kieli_id = coalesce(d10.id,-1)
	,f.koulutuksen_kunta
	,koulutuksen_kunta_id = coalesce(d11.id,-1)
	,koulutuksen_kunta_historia_id = coalesce(d11h.id,-1)	
	,f.opetushallinnon_koulutus
	,opetushallinnon_koulutus_id = coalesce(d12.id,-1)
	
	,f.sukupuoli
	,sukupuoli_id = coalesce(d13.id,-1)
	,f.aidinkieli_versio1
	,aidinkieli_versio1_id = coalesce(d14.id,-1)
	,f.aikuisopiskelija
	,aikuisopiskelija_id = coalesce(d17.id,-1)
	,f.nuorten_aikuisten_koulutus
	,nuorten_aikuisten_koulutus_id = coalesce(d18.id,-1)

	,f.ika_kirjoihintulovuonna
	,ika_kirjoihintulovuonna_id = coalesce(d19.id,-1)
	,ikaryhma_kirjoihintulovuonna_id = coalesce(d19_2.id,-1)
	,f.ika
	,ika_id = coalesce(d20.id,-1)
	,ikaryhma_id = coalesce(d20_2.id,-1)

	,f.lukumaara
	,f.koulutuksen_tutkinnon_aloitusvuosi
	,koulutuksen_tutkinnon_aloitusvuosi_id = coalesce(d21.kausi_id,'-1')
	,f.koulutuksen_tutkinnon_aloituskausi
	,koulutuksen_tutkinnon_aloituskausi_id = coalesce(d22.kausi_id,'-1')
	,f.ov_hyvaksiluettu_ennen
	,f.ov_hyvaksiluettu_aikana
	,f.ov_suoritettu_koulutuksen_aikana
	,f.ov_yhteensa
	,f.ov_tyossaoppiminen
	,f.lkm_ammattiosaaminen
	,f.lkm_opintokokonaisuus
	,f.lkm_tutkintojen_osat

	,f.rahoituslahde_amm
	,rahoituslahde_amm_id = coalesce(d24.id,-1)
	,f.vayla_nayttotutkintoon
	,vayla_nayttotutkintoon_id = coalesce(d25.id,-1)

	,f.tutkinnon_tavoite
	,tutkinnon_tavoite_id = coalesce(d28.id,-1)
	,f.tutkinnon_toteuma
	,tutkinnon_toteuma_id = coalesce(d29.id,-1)

	,f.tietolahde
	,f.rivinumero
	,f.aineistotunnus
	,f.koulutussektori
	,koulutussektori_id = coalesce(d36.id,-1)

	,f.koulutuksen_jarjestamismuoto
	,koulutuksen_jarjestamismuoto_id = coalesce(d38.id,-1)
	,f.amm_sopimusjaksot
	,amm_sopimusjaksot_id = coalesce(d38b.id,-1)
	,f.ammatillinen_peruskoulutus_lisakoulutus
	,ammatillinen_peruskoulutus_lisakoulutus_id = coalesce(d39.id,-1)
	,f.koulutuksen_tavoite_toteuma
	,koulutuksen_tavoite_toteuma_id = coalesce(d40.id,-1)

	,f.tutkinnot
	,aineisto_id = -1
	,aineisto_OTV_id = coalesce(d42.id,-1)

    ,koulutuksen_jarjestaja_kunta_id = coalesce(d51.id,-1)
    ,koulutuksen_jarjestaja_kunta_historia_id = coalesce(d51h.id,-1)

	,nuorten_aikuisten_koulutus_amm_id = coalesce(d53.id, -1)
	,koulutuslaji_OKM_id = coalesce(d54.id, -1)

	,yht_koulutuksen_jarjestaja_id = coalesce(d55.id, -1)
	,yht_koulutuksen_jarjestaja_historia_id = coalesce(d55h.id, -1)

    ,yht_koulutuksen_jarjestaja_kunta_id = coalesce(d57.id,-1)
    ,yht_koulutuksen_jarjestaja_kunta_historia_id = coalesce(d57h.id,-1)
	
    ,yht_koulutuksen_kunta_id = coalesce(d59.id,-1)
    ,yht_koulutuksen_kunta_historia_id = coalesce(d59h.id,-1)

	,hallinnonala2_id = coalesce(d12b.id,-1)
	
--into [VipunenTK].[dbo].[f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot]
 
FROM VipunenTK_DW.[dbo].[v_f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot] AS f
LEFT JOIN VipunenTK..d_lahde AS d1 ON d1.lahde_koodi=f.lahde AND f.tilv_date between d1.alkaa and d1.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d3 ON d3.oppilaitos_avain=f.koulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d4 ON d4.oppilaitos_avain=f.oppisopimuskoulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d3h ON d3h.oppilaitos_avain=f.koulutuksen_jarjestaja AND f.tilv_date between d3h.alkaa and d3h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d4h ON d4h.oppilaitos_avain=f.oppisopimuskoulutuksen_jarjestaja AND f.tilv_date between d4h.alkaa and d4h.paattyy

LEFT JOIN VipunenTK..d_koulutusluokitus AS d5 ON d5.koulutusluokitus_avain=f.koulutusluokitus
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d5h ON d5h.koulutusluokitus_avain=f.koulutusluokitus AND f.tilv_date between d5h.alkaa and d5h.paattyy

LEFT JOIN VipunenTK..d_tutkintonimike_ammpk AS d6 ON d6.tutkintonimike_ammpk_koodi=f.tutkintonimike_ammpk AND f.tilv_date between d6.alkaa and d6.paattyy
LEFT JOIN VipunenTK..d_koulutusohjelma_ammpk AS d7 ON d7.koulutusohjelma_ammpk_koodi=(case when f.koulutusohjelma_ammpk='9999' then '-1' else f.koulutusohjelma_ammpk end) AND f.tilv_date between d7.alkaa and d7.paattyy

LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji AS d8 ON d8.ammatillisen_koulutuksen_koulutuslaji_koodi=f.ammatillisen_koulutuksen_koulutuslaji AND f.tilv_date between d8.alkaa and d8.paattyy
LEFT JOIN VipunenTK..d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AS d9 ON d9.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AND f.tilv_date between d9.alkaa and d9.paattyy

LEFT JOIN VipunenTK..d_kieli AS d10 ON d10.kieli_koodi=f.koulutuksen_kieli AND f.tilv_date between d10.alkaa and d10.paattyy


LEFT JOIN VipunenTK..d_alueluokitus AS d11 ON d11.alueluokitus_avain=f.koulutuksen_kunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d11h ON d11h.alueluokitus_avain=f.koulutuksen_kunta AND f.tilv_date between d11h.alkaa and d11h.paattyy

LEFT JOIN VipunenTK..d_opetushallinnon_koulutus AS d12 ON d12.opetushallinnon_koulutus_koodi=f.opetushallinnon_koulutus AND f.tilv_date between d12.alkaa and d12.paattyy
LEFT JOIN VipunenTK..d_hallinnonala2 d12b ON d12b.hallinnonala_koodi=f.hallinnonala2 AND f.tilv_date between d12b.alkaa and d12b.paattyy
LEFT JOIN VipunenTK..d_sukupuoli AS d13 ON d13.sukupuoli_koodi=f.sukupuoli AND f.tilv_date between d13.alkaa and d13.paattyy
LEFT JOIN VipunenTK..d_aidinkieli_versio1 AS d14 ON d14.aidinkieli_versio1_koodi=f.aidinkieli_versio1 AND f.tilv_date between d14.alkaa and d14.paattyy


LEFT JOIN VipunenTK..d_aikuisopiskelija AS d17 ON d17.aikuisopiskelija_koodi=f.aikuisopiskelija AND f.tilv_date between d17.alkaa and d17.paattyy
LEFT JOIN VipunenTK..d_nuorten_aikuisten_koulutus AS d18 ON d18.nuorten_aikuisten_koulutus_koodi=f.nuorten_aikuisten_koulutus AND f.tilv_date between d18.alkaa and d18.paattyy
LEFT JOIN VipunenTK..d_ika AS d19 ON d19.ika_avain=f.ika_kirjoihintulovuonna
LEFT JOIN VipunenTK..d_ika AS d19_2 ON d19_2.ika_avain=f.ikaryhma_kirjoihintulovuonna
LEFT JOIN VipunenTK..d_ika AS d20 ON d20.ika_avain=f.ika
LEFT JOIN VipunenTK..d_ika AS d20_2 ON d20_2.ika_avain=f.ikaryhma

LEFT JOIN VipunenTK..d_kausi AS d21 ON d21.kausi_id	=(case when isnull(f.koulutuksen_tutkinnon_aloitusvuosi,'') in ('9999','XXXX','') then '-1' else f.koulutuksen_tutkinnon_aloitusvuosi end)
LEFT JOIN VipunenTK..d_kausi AS d22 ON d22.kausi_id	=(case
	  when isnull(f.koulutuksen_tutkinnon_aloitusvuosi,'') in ('9999','XXXX','') then '-1'
	  when isnull(f.koulutuksen_tutkinnon_aloituskausi,'') in ('9','X','') then '-1'
	  else f.koulutuksen_tutkinnon_aloitusvuosi+f.koulutuksen_tutkinnon_aloituskausi end)

LEFT JOIN VipunenTK..d_rahoituslahde_amm AS d24 ON d24.rahoituslahde_amm_koodi=f.rahoituslahde_amm AND f.tilv_date between d24.alkaa and d24.paattyy
LEFT JOIN VipunenTK..d_vayla_nayttotutkintoon AS d25 ON d25.vayla_nayttotutkintoon_koodi=f.vayla_nayttotutkintoon AND f.tilv_date between d25.alkaa and d25.paattyy


LEFT JOIN VipunenTK..d_tutkinnon_tavoite AS d28 ON d28.tutkinnon_tavoite_koodi=f.tutkinnon_tavoite AND f.tilv_date between d28.alkaa and d28.paattyy
LEFT JOIN VipunenTK..d_tutkinnon_toteuma AS d29 ON d29.tutkinnon_toteuma_koodi=f.tutkinnon_toteuma AND f.tilv_date between d29.alkaa and d29.paattyy

LEFT JOIN VipunenTK..d_koulutussektori AS d36 ON d36.koulutussektori_koodi=f.koulutussektori AND f.tilv_date between d36.alkaa and d36.paattyy

LEFT JOIN VipunenTK..d_koulutuksen_jarjestamismuoto AS d38 ON d38.koulutuksen_jarjestamismuoto_koodi=f.koulutuksen_jarjestamismuoto AND f.tilv_date between d38.alkaa and d38.paattyy
LEFT JOIN VipunenTK..d_amm_sopimusjaksot AS d38b ON d38b.koodi=f.amm_sopimusjaksot AND f.tilv_date between d38b.alkaa and d38b.paattyy
LEFT JOIN VipunenTK..d_ammatillinen_peruskoulutus_lisakoulutus AS d39 ON d39.ammatillinen_peruskoulutus_lisakoulutus_koodi=f.ammatillinen_peruskoulutus_lisakoulutus AND f.tilv_date between d39.alkaa and d39.paattyy
LEFT JOIN VipunenTK..d_koulutuksen_tavoite_toteuma AS d40 ON d40.koulutuksen_tavoite_toteuma_koodi=f.koulutuksen_tavoite_toteuma AND f.tilv_date between d40.alkaa and d40.paattyy


LEFT JOIN VipunenTK..d_aineisto_OTV AS d42 ON d42.aineisto_koodi=f.aineistotunnus AND f.tilv_date between d42.alkaa and d42.paattyy

/* koulutuksen järjestäjän sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d51 ON d51.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.koulutuksen_jarjestaja)

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d51h ON d51h.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.koulutuksen_jarjestaja AND f.tilv_date between d51h.alkaa and d51h.paattyy)
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




/* yhteisen koulutuksen sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d59 ON d59.alueluokitus_avain = f.yht_koulutuksen_kunta

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d59h ON d59h.alueluokitus_avain = f.yht_koulutuksen_kunta AND f.tilv_date between d59h.alkaa and d59h.paattyy

