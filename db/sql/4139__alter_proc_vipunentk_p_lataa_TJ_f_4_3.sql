USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TJ_f_4_3]    Script Date: 20.11.2020 9:05:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_TJ_f_4_3] AS

truncate table vipunentk.dbo.f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta;

insert into vipunentk.dbo.f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta

 
--sel
SELECT
	 tilastointivuosi =f.tilastointivuosi
	,tilv_date = f.tilv_date
	,aineisto = f.aineisto
	,aineisto_id = coalesce(d1.id,-1)
	,asuinmaakunta = f.asuinmaakunta
	,asuinmaakunta_id = coalesce(d2.id,-1)
	,asuinmaakunta_historia_id = coalesce(d2h.id,-1)
	,aikuisopiskelija = f.aikuisopiskelija
	,aikuisopiskelija_id = coalesce(d3.id,-1)
	,tutkinnon_suoritusvuosi_id = f.tutkinnon_suoritusvuosi
	,tutkinnon_suoritusvuosi_id = coalesce(d4.kausi_id,'-1')
	,tutkinnon_suorittamismaakunta = f.tutkinnon_suorittamismaakunta
	,tutkinnon_suorittamismaakunta_id = coalesce(d5.id,-1)
	,tutkinnon_suorittamismaakunta_historia_id = coalesce(d5h.id,-1)
	,koulutuksen_jarjestaja = f.koulutuksen_jarjestaja
	,koulutuksen_jarjestaja_id = coalesce(d6.id,-1)
	,koulutuksen_jarjestaja_historia_id = coalesce(d6h.id,-1)
	,oppilaitos = f.oppilaitos
	,oppilaitos_id = coalesce(d7.id,-1)
	,oppilaitos_historia_id = coalesce(d7h.id,-1)
	,valiaikainen_amk = f.valiaikainen_amk
	,valiaikainen_amk_id = coalesce(d8.id,-1)
	,koulutusluokitus = f.koulutusluokitus
	,koulutusluokitus_id = coalesce(d9.id,-1)
	,koulutusluokitus_historia_id = coalesce(d9h.id,-1)
	,koulutusmuoto = f.koulutusmuoto
	,koulutusmuoto_id = coalesce(d10.id,-1)
	,oppisopimuskoulutus = f.oppisopimuskoulutus
	,oppisopimuskoulutus_id = coalesce(d11.id,-1)
	,ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa = f.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa
	,ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_id = coalesce(d12.id,-1)
	,paaasiallinen_toiminta_versio2 = f.paaasiallinen_toiminta_versio2
	,paaasiallinen_toiminta_versio2_id = coalesce(d13.id,-1)
	,maassaolo = f.maassaolo
	,maassaolo_id = coalesce(d14.id,-1)
	,ammattiasema = f.ammattiasema
	,ammattiasema_id = coalesce(d15.id,-1)
	,ammattiluokitus = f.ammattiluokitus_2010
	,ammattiluokitus_2010_id = coalesce(d16.id,-1)
	,lukumaara = f.lukumaara
	,tietolahde = f.tietolahde
	,rivinumero = f.rivinumero
	,aineistotunnus = f.aineistotunnus
	,tutkintolaji_tyollistymiseen = f.tutkintolaji_tyollistymiseen
	,tutkintolaji_tyollistymiseen_id = coalesce(d17.id,-1)
	,sijoittuminen_1v_tutkinnon_jalkeen = f.sijoittuminen_1v_tutkinnon_jalkeen
	,sijoittuminen_3v_tutkinnon_jalkeen = f.sijoittuminen_3v_tutkinnon_jalkeen
	,sijoittuminen_5v_tutkinnon_jalkeen = f.sijoittuminen_5v_tutkinnon_jalkeen
	,paaasiallinen_toiminta_ja_maasta_muuttaneet = f.paaasiallinen_toiminta_ja_maasta_muuttaneet
	,paaasiallinen_toiminta_ja_maasta_muuttaneet = coalesce(d18.id,-1)
	,paaasiallinen_toiminta_okm_id = coalesce(d19.id,-1)
	,eu_etamaat_id = coalesce(d20.id, -1)
	,aidinkieli_versio1_id = coalesce(d21.id, -1)
	,kansalaisuus_maanosa_id = coalesce(d22.id, -1)
	,sektori_id = coalesce(d23.id, -1)

 
FROM VipunenTK_DW.dbo.f_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta AS f
LEFT JOIN VipunenTK..d_aineisto AS d1 ON d1.aineisto_koodi=f.aineisto AND f.tilv_date between d1.alkaa and d1.paattyy
LEFT JOIN VipunenTK..d_alueluokitus AS d2 ON d2.alueluokitus_avain='MAAK'+f.asuinmaakunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d2h ON d2h.alueluokitus_avain='MAAK'+f.asuinmaakunta AND f.tilv_date between d2h.alkaa and d2h.paattyy
LEFT JOIN VipunenTK..d_aikuisopiskelija AS d3 ON d3.aikuisopiskelija_koodi=f.aikuisopiskelija AND f.tilv_date between d3.alkaa and d3.paattyy
LEFT JOIN VipunenTK..d_kausi AS d4 ON d4.kausi_id=f.tutkinnon_suoritusvuosi
LEFT JOIN VipunenTK..d_alueluokitus AS d5 ON d5.alueluokitus_avain='MAAK'+f.tutkinnon_suorittamismaakunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d5h ON d5h.alueluokitus_avain='MAAK'+f.tutkinnon_suorittamismaakunta AND f.tilv_date between d5h.alkaa and d5h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d6 ON d6.oppilaitos_avain=f.koulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d7 ON d7.oppilaitos_avain=f.oppilaitos
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d6h ON d6h.oppilaitos_avain=f.koulutuksen_jarjestaja AND f.tilv_date between d6h.alkaa and d6h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d7h ON d7h.oppilaitos_avain=f.oppilaitos AND f.tilv_date between d7h.alkaa and d7h.paattyy
LEFT JOIN VipunenTK..d_valiaikainen_amk AS d8 ON d8.valiaikainen_amk_koodi=f.valiaikainen_amk AND f.tilv_date between d8.alkaa and d8.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus AS d9 ON d9.koulutusluokitus_avain=f.koulutusluokitus
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d9h ON d9h.koulutusluokitus_avain=f.koulutusluokitus AND f.tilv_date between d9h.alkaa and d9h.paattyy
LEFT JOIN VipunenTK..d_koulutusmuoto AS d10 ON d10.koulutusmuoto_koodi=f.koulutusmuoto AND f.tilv_date between d10.alkaa and d10.paattyy
LEFT JOIN VipunenTK..d_oppisopimuskoulutus AS d11 ON d11.oppisopimuskoulutus_koodi=f.oppisopimuskoulutus AND f.tilv_date between d11.alkaa and d11.paattyy
LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa AS d12 ON d12.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_koodi=f.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa AND f.tilv_date between d12.alkaa and d12.paattyy
LEFT JOIN VipunenTK..d_paaasiallinen_toiminta_versio2 AS d13 ON d13.paaasiallinen_toiminta_versio2_koodi=f.paaasiallinen_toiminta_versio2 AND f.tilv_date between d13.alkaa and d13.paattyy
LEFT JOIN VipunenTK..d_maassaolo AS d14 ON d14.maassaolo_koodi=f.maassaolo AND f.tilv_date between d14.alkaa and d14.paattyy
LEFT JOIN VipunenTK..d_ammattiasema AS d15 ON d15.ammattiasema_koodi=f.ammattiasema AND f.tilv_date between d15.alkaa and d15.paattyy
LEFT JOIN VipunenTK..d_ammattiluokitus_2010 AS d16 ON d16.ammattiluokitus_2010_avain=f.ammattiluokitus_2010 AND f.tilv_date between d16.alkaa and d16.paattyy
LEFT JOIN VipunenTK..d_tutkintolaji_tyollistymiseen AS d17 ON d17.tutkintolaji_tyollistymiseen_koodi=f.tutkintolaji_tyollistymiseen  AND f.tilv_date between d17.alkaa and d17.paattyy
LEFT JOIN VipunenTK..d_paaasiallinen_toiminta_ja_maasta_muuttaneet AS d18 ON d18.paaasiallinen_toiminta_ja_maasta_muuttaneet_koodi=f.paaasiallinen_toiminta_ja_maasta_muuttaneet  AND f.tilv_date between d18.alkaa and d18.paattyy
LEFT JOIN VipunenTK..d_paaasiallinen_toiminta_okm AS d19 ON d19.paaasiallinen_toiminta_okm_koodi=f.paaasiallinen_toiminta_okm  AND f.tilv_date between d19.alkaa and d19.paattyy

LEFT JOIN VipunenTK..d_eu_etamaat d20 ON d20.eu_etamaat_avain = f.eu_etamaat_avain
LEFT JOIN VipunenTK..d_aidinkieli_versio1 d21 ON d21.aidinkieli_versio1_koodi = f.aikielir1_avain
LEFT JOIN VipunenTK..d_valtio d22 ON d22.valtio_avain = f.kansalaisuus_maanosa_avain
LEFT JOIN VipunenTK..d_koulutussektori d23 ON d23.koulutussektori_koodi = f.sektori




GO


USE [ANTERO]