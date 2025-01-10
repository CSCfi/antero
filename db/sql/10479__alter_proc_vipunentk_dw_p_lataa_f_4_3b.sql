USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_4_3b]    Script Date: 9.1.2025 16.31.01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






--drop table VipunenTK.dbo.f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan
--select * into VipunenTK.dbo.f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan from ( ... ) q

ALTER   PROCEDURE [dbo].[p_lataa_f_4_3b] AS

TRUNCATE TABLE VipunenTK.dbo.f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan;

INSERT VipunenTK.dbo.f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan

SELECT
	 tilv
	,tilv_date
	,suorv
	,sp
	,sp_id = coalesce(d1.id,-1)
	,kansalr1
    ,kansalr1_id = coalesce(d2.id,-1)
	,syntyp2
    ,syntyp2_id = coalesce(d3.id,-1)
	,tilvasmaak
	,tilvasmaak_id = coalesce(d4.id,-1)
	,tilvasmaak_historia_id = coalesce(d4h.id,-1)
	,tutkmaak
	,tutkmaak_id = coalesce(d5.id,-1)
	,tutkmaak_historia_id = coalesce(d5h.id,-1)
	,f.iscfi2013
	,iscfi2013_id = coalesce(d8.id,-1)
	,iscfi2013_historia_id = coalesce(d8h.id,-1)
	,kaste_t2
	,kaste_t2_id = coalesce(d9.id,-1)
	,kaste_t2_historia_id = coalesce(d9h.id,-1)
	,kouljat
	,kouljat_id = coalesce(d10.id,-1)
	,oppis
	,oppis_id = coalesce(d11.id,-1)
	,tutklaja_tr
	,tutklaja_tr_id = coalesce(d12.id,-1)
	,ptoim1r6
	,ptoim1r6_id = coalesce(d13.id,-1)
	,f.maassaolo
	,maassaolo_id = coalesce(d14.id,-1)
	,amas
	,amas_id = coalesce(d15.id,-1)

	,lkm

	,f.tietolahde
	,rivinumero

	,f.tutkintolaji_tyollistymiseen
	,tutkintolaji_tyollistymiseen_id = coalesce(d17.id,-1)
	,sijoittuminen_1v_tutkinnon_jalkeen = sijoittuminen_1v_tutkinnon_jalkeen
	,sijoittuminen_3v_tutkinnon_jalkeen = sijoittuminen_3v_tutkinnon_jalkeen
	,sijoittuminen_5v_tutkinnon_jalkeen = sijoittuminen_5v_tutkinnon_jalkeen
	,f.paaasiallinen_toiminta_ja_maasta_muuttaneet
	,paaasiallinen_toiminta_ja_maasta_muuttaneet_id = coalesce(d18.id,-1)
	,paaasiallinen_toiminta_okm_id = coalesce(d19.id,-1)
	,sektori
	,sektori_id = coalesce(d23.id, -1)
	,rahlahde_v2
	,rahlahde_v2_id = coalesce(d24.id,-1)
	,kvopisk
	,kvopisk_id = coalesce(d25.id,-1)

FROM VipunenTK_DW.dbo.f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan f
LEFT JOIN VipunenTK..d_sukupuoli AS d1 ON d1.sukupuoli_koodi = f.sp
LEFT JOIN VipunenTK..d_kansalaisuus_versio1 AS d2 ON d2.kansalaisuus_versio1_koodi = f.kansalr1
LEFT JOIN VipunenTK..d_syntypera AS d3 ON d3.syntypera_koodi = f.syntyp2
LEFT JOIN VipunenTK..d_alueluokitus AS d4 ON d4.alueluokitus_avain = 'MAAK'+f.tilvasmaak
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d4h ON d4h.alueluokitus_avain = 'MAAK'+f.tilvasmaak AND f.tilv_date between d4h.alkaa and d4h.paattyy
LEFT JOIN VipunenTK..d_alueluokitus AS d5 ON d5.alueluokitus_avain = 'MAAK'+f.tutkmaak
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d5h ON d5h.alueluokitus_avain = 'MAAK'+f.tutkmaak AND f.tilv_date between d5h.alkaa and d5h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus AS d8 ON d8.koulutusluokitus_avain = 'ISCFI'+f.iscfi2013
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d8h ON d8h.koulutusluokitus_avain = 'ISCFI'+f.iscfi2013 AND f.tilv_date between d8h.alkaa and d8h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus AS d9 ON d9.koulutusluokitus_avain = 'KASTET2'+f.kaste_t2
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d9h ON d9h.koulutusluokitus_avain = 'KASTET2'+f.kaste_t2 AND f.tilv_date between d9h.alkaa and d9h.paattyy
LEFT JOIN VipunenTK..d_koulutusmuoto AS d10 ON d10.koulutusmuoto_koodi = f.kouljat AND f.tilv_date between d10.alkaa and d10.paattyy
LEFT JOIN VipunenTK..d_oppisopimuskoulutus AS d11 ON d11.oppisopimuskoulutus_koodi = f.oppis AND f.tilv_date between d11.alkaa and d11.paattyy
LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa AS d12 ON d12.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_koodi = f.tutklaja_tr AND f.tilv_date between d12.alkaa and d12.paattyy
LEFT JOIN VipunenTK..d_paaasiallinen_toiminta_versio2 AS d13 ON d13.paaasiallinen_toiminta_versio2_koodi = f.ptoim1r6 AND f.tilv_date between d13.alkaa and d13.paattyy
LEFT JOIN VipunenTK..d_maassaolo AS d14 ON d14.maassaolo_koodi = f.maassaolo AND f.tilv_date between d14.alkaa and d14.paattyy
LEFT JOIN VipunenTK..d_ammattiasema AS d15 ON d15.ammattiasema_koodi = f.amas AND f.tilv_date between d15.alkaa and d15.paattyy
LEFT JOIN VipunenTK..d_tutkintolaji_tyollistymiseen AS d17 ON d17.tutkintolaji_tyollistymiseen_koodi = f.tutkintolaji_tyollistymiseen  AND f.tilv_date between d17.alkaa and d17.paattyy
LEFT JOIN VipunenTK..d_paaasiallinen_toiminta_ja_maasta_muuttaneet AS d18 ON d18.paaasiallinen_toiminta_ja_maasta_muuttaneet_koodi = f.paaasiallinen_toiminta_ja_maasta_muuttaneet  AND f.tilv_date between d18.alkaa and d18.paattyy
LEFT JOIN VipunenTK..d_paaasiallinen_toiminta_okm AS d19 ON d19.paaasiallinen_toiminta_okm_koodi = f.paaasiallinen_toiminta_okm  AND f.tilv_date between d19.alkaa and d19.paattyy
LEFT JOIN VipunenTK..d_koulutussektori d23 ON d23.koulutussektori_koodi = f.sektori
LEFT JOIN VipunenTK..d_rahoituslahde_versio2 d24 ON d24.[rahoituslahde_koodi] = f.rahlahde_v2
LEFT JOIN VipunenTK..d_kylla_ei d25 on d25.kylla_ei_koodi = f.kvopisk

GO


