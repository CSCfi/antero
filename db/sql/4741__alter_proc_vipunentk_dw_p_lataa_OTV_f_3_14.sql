USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_OTV_f_3_14]    Script Date: 9.8.2021 22:15:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_OTV_f_3_14] AS

TRUNCATE TABLE vipunentk.dbo.f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat;

INSERT INTO vipunentk.dbo.f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat

SELECT 
	 tilastointivuosi = f.tilastointivuosi
	,tilv_date = f.tilv_date
	,lahde = f.lahde
	,lahde_id = coalesce(d1.id,-1)
	,oppilaitos = f.oppilaitos
	,oppilaitos_id = coalesce(d2.id,-1)
	,oppilaitos_historia_id = coalesce(d2h.id,-1)
	,koulutuksen_jarjestaja = f.koulutuksen_jarjestaja
	,koulutuksen_jarjestaja_id = coalesce(d3.id,-1)
	,koulutuksen_jarjestaja_historia_id = coalesce(d3h.id,-1)
	,oppisopimuskoulutuksen_jarjestaja = f.oppisopimuskoulutuksen_jarjestaja
	,oppisopimuskoulutuksen_jarjestaja_id = coalesce(d4.id,-1)
	,oppisopimuskoulutuksen_jarjestaja_historia_id = coalesce(d4h.id,-1)
	,koulutusluokitus = f.koulutusluokitus
	,koulutusluokitus_id = coalesce(d5.id,-1)
	,koulutusluokitus_historia_id = coalesce(d5h.id,-1)
	,sukupuoli = f.sukupuoli
	,sukupuoli_id = coalesce(d6.id,-1)
	,aidinkieli_versio1 = f.aidinkieli_versio1
	,aidinkieli_versio1_id = coalesce(d7.id,-1)
	,syntymavuosi = f.syntymavuosi
	,syntymavuosi_id = coalesce(d8.kausi_id,'-1')
	,syntymakuukausi = f.syntymakuukausi
	,syntymakuukausi_id = coalesce(d9.kausi_id,'-1')
	,kirjoihintulovuosi = f.kirjoihintulovuosi
	,kirjoihintulovuosi_id = coalesce(d10.kausi_id,'-1')
	,kirjoihintulokausi = f.kirjoihintulokausi
	,kirjoihintulokausi_id = coalesce(d11.kausi_id,'-1')
	,lukumaara = f.lukumaara
	,nuosten_aikuisten_koulutus = f.nuorten_aikuisten_koulutus
	,nuorten_aikuisten_koulutus_id = coalesce(d12.id,-1)
	,ammatillisen_koulutuksen_koulutuslaji =f.ammatillisen_koulutuksen_koulutuslaji
	,ammatillisen_koulutuksen_koulutuslaji_id = coalesce(d13.id,-1)
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id = coalesce(d14.id,-1)
	,opetushallinnon_koulutus = f.opetushallinnon_koulutus
	,opetushallinnon_koulutus_id = coalesce(d15.id,-1)
	,tietolahde = f.tietolahde
	,rivinumero =f.rivinumero
	,aineistotunnus = f.aineistotunnus
	,koulutussektori = f.koulutussektori
	,koulutussektori_id = coalesce(d16.id,-1)
	,koulutuksen_jarjestamismuoto = f.koulutuksen_jarjestamismuoto
	,koulutuksen_jarjestamismuoto_id = coalesce(d17.id,-1)
	,f.amm_sopimusjaksot
	,amm_sopimusjaksot_id = coalesce(d17b.id,-1)
	,ammatillinen_peruskoulutus_lisakoulutus =f.ammatillinen_peruskoulutus_lisakoulutus
	,ammatillinen_peruskoulutus_lisakoulutus_id = coalesce(d18.id,-1)
	,ika_1v =f.ika_1v
	,ika_1v_id = coalesce(d19.id,-1)
	,aloittaneet = f.aloittaneet
	,opiskelijat = f.opiskelijat
	,aineisto_id = -1
	,aineisto_OTV_id = coalesce(d50.id,-1)
    ,koulutuksen_jarjestaja_kunta_id = coalesce(d51.id,-2)
    ,koulutuksen_jarjestaja_kunta_historia_id = coalesce(d51h.id,-2)
    ,oppilaitos_kunta_id = coalesce(d52.id,-2)
    ,oppilaitos_kunta_historia_id = coalesce(d52h.id,-2)
	,koulutuslaji_OKM_id = coalesce(d54.id, -2)
 
FROM VipunenTK_DW.dbo.f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat AS f
LEFT JOIN VipunenTK..d_lahde  AS d1 ON d1.lahde_koodi=f.lahde AND f.tilv_date between d1.alkaa and d1.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d2 ON d2.oppilaitos_avain= f.oppilaitos
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d3 ON d3.oppilaitos_avain=f.koulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d4 ON d4.oppilaitos_avain=f.oppisopimuskoulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d2h ON d2h.oppilaitos_avain=f.oppilaitos AND f.tilv_date between d2h.alkaa and d2h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d3h ON d3h.oppilaitos_avain=f.koulutuksen_jarjestaja AND f.tilv_date between d3h.alkaa and d3h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d4h ON d4h.oppilaitos_avain=f.oppisopimuskoulutuksen_jarjestaja AND f.tilv_date between d4h.alkaa and d4h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus AS d5 ON d5.koulutusluokitus_avain=f.koulutusluokitus 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d5h ON d5h.koulutusluokitus_avain =f.koulutusluokitus   AND f.tilv_date between d5h.alkaa and d5h.paattyy
LEFT JOIN VipunenTK..d_sukupuoli AS d6 ON d6.sukupuoli_koodi=f.sukupuoli AND f.tilv_date between d6.alkaa and d6.paattyy
LEFT JOIN VipunenTK..d_aidinkieli_versio1 AS d7 ON d7.aidinkieli_versio1_koodi=f.aidinkieli_versio1 AND f.tilv_date between d7.alkaa and d7.paattyy
LEFT JOIN VipunenTK..d_kausi AS d8 ON d8.kausi_id	=(case when isnull(f.syntymavuosi,'') in ('9999','XXXX','') then '-1' else f.syntymavuosi end)
LEFT JOIN VipunenTK..d_kausi AS d9 ON d9.kausi_id	=(case
	  when isnull(f.syntymavuosi,'') in ('9999','XXXX','') then '-1'
	  when isnull(f.syntymakuukausi,'') in ('99','XX','') then '-1'
	  else f.syntymavuosi+f.syntymakuukausi end)
LEFT JOIN VipunenTK..d_kausi AS d10 ON d10.kausi_id	=(case when isnull(f.kirjoihintulovuosi,'') in ('9999','XXXX','') then '-1' else f.kirjoihintulovuosi end)
LEFT JOIN VipunenTK..d_kausi AS d11 ON d11.kausi_id	=(case
	  when isnull(f.kirjoihintulovuosi,'') in ('9999','XXXX','') then '-1'
	  when isnull(f.kirjoihintulokausi,'') in ('9','X','') then '-1'
	  else f.kirjoihintulovuosi+f.kirjoihintulokausi end)
LEFT JOIN VipunenTK..d_nuorten_aikuisten_koulutus AS d12 ON d12.nuorten_aikuisten_koulutus_koodi=f.nuorten_aikuisten_koulutus AND f.tilv_date between d12.alkaa and d12.paattyy
LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji AS d13 ON d13.ammatillisen_koulutuksen_koulutuslaji_koodi=f.ammatillisen_koulutuksen_koulutuslaji AND f.tilv_date between d13.alkaa and d13.paattyy
LEFT JOIN VipunenTK..d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AS d14 ON d14.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AND f.tilv_date between d14.alkaa and d14.paattyy
LEFT JOIN VipunenTK..d_opetushallinnon_koulutus AS d15 ON d15.opetushallinnon_koulutus_koodi=f.opetushallinnon_koulutus AND f.tilv_date between d15.alkaa and d15.paattyy
LEFT JOIN VipunenTK..d_koulutussektori AS d16 ON d16.koulutussektori_koodi=f.koulutussektori and f.tilv_date between d16.alkaa and d16.paattyy
LEFT JOIN VipunenTK..d_koulutuksen_jarjestamismuoto AS d17 ON d17.koulutuksen_jarjestamismuoto_koodi=f.koulutuksen_jarjestamismuoto and f.tilv_date between d17.alkaa and d17.paattyy
LEFT JOIN VipunenTK..d_amm_sopimusjaksot AS d17b ON d17b.koodi=f.amm_sopimusjaksot AND f.tilv_date between d17b.alkaa and d17b.paattyy
LEFT JOIN VipunenTK..d_ammatillinen_peruskoulutus_lisakoulutus AS d18 ON d18.ammatillinen_peruskoulutus_lisakoulutus_koodi=f.ammatillinen_peruskoulutus_lisakoulutus and f.tilv_date between d18.alkaa and d18.paattyy
LEFT JOIN VipunenTK..d_ika AS d19 ON d19.ika =f.ika_1v

LEFT JOIN VipunenTK..d_aineisto_OTV AS d50 ON d50.aineisto_koodi=f.aineistotunnus AND f.tilv_date between d50.alkaa and d50.paattyy

/* koulutuksen järjestäjän sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d51 ON d51.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.oppilaitos)

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d51h ON d51h.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.oppilaitos AND f.tilv_date between d51h.alkaa and d51h.paattyy)
		AND f.tilv_date between d51h.alkaa and d51h.paattyy

/* oppilaitoksen sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d52 ON d52.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.oppilaitos)

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d52h ON d52h.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.oppilaitos AND f.tilv_date between d52h.alkaa and d52h.paattyy)
		AND f.tilv_date between d52h.alkaa and d52h.paattyy

LEFT JOIN VipunenTK..d_koulutuslaji_okm AS d54 ON d54.koulutuslaji_okm_avain = f.koulutuslaji_OKM_avain

