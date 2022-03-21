USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_VKP_f_4_2]    Script Date: 20.1.2020 16:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[p_lataa_VKP_f_4_2] AS


DECLARE @maxTilastovuosiL nvarchar(6);

SET @maxTilastovuosiL = (select max(tilastointivuosi) from VipunenTK_DW.dbo.f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta WHERE aineisto = 'L')


truncate table vipunentk.dbo.f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta;

insert into vipunentk.dbo.f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta



SELECT
	 tilastointivuosi =f.tilastointivuosi
	,tilv_date = f.tilv_date
	,aineisto = f.aineisto
	,aineisto_id = coalesce(d1.id,-1)
	,sukupuoli = f.sukupuoli
	,sukupuoli_id = coalesce(d2.id,-1)
	,aidinkieli_versio1= f.aidinkieli_versio1
	,aidinkieli_versio1_id = coalesce(d3.id,-1)
	,syntymavuosi = f.syntymavuosi
	,syntymavuosi_id = coalesce(d4.kausi_id,'-1')
	,asuinmaakunta = f.asuinmaakunta
	,asuinmaakunta_id = coalesce(d5.id,-1)
	,asuinmaakunta_historia_id = coalesce(d5h.id,-1)
	,kansalaisuus_versio1 = f.kansalaisuus_versio1
	,kansalaisuus_versio1_id = coalesce(d6.id,-1)
	,pohjoismaa = f.pohjoismaa
	,pohjoismaa_id = coalesce(d7.id,-1)
	,eumaa = f.eumaa
	,eumaa_id = coalesce(d8.id,-1)
	,etamaa = f.etamaa
	,etamaa_id = coalesce(d9.id,-1)
	,tutkinnon_suoritusvuosi = f.tutkinnon_suoritusvuosi
	,tutkinnon_suoritusvuosi_id = coalesce(d10.kausi_id,'-1')
	,tutkinnon_suoritusmaakunta = f.tutkinnon_suoritusmaakunta
	,tutkinnon_suoritusmaakunta_id = coalesce(d11.id,-1)
	,tutkinnon_suoritusmaakunta_historia_id = coalesce(d11h.id,-1)
	,koulutusluokitus = f.koulutusluokitus
	,koulutusluokitus_id = coalesce(d12.id,-1)
	,koulutusluokitus_historia_id = coalesce(d12h.id,-1)
	,koulutusmuoto = f.koulutusmuoto
	,koulutusmuoto_id = coalesce(d13.id,-1)
	,oppisopimuskoulutus = f.oppisopimuskoulutus
	,oppisopimuskoulutus_id = coalesce(d14.id,-1)
	,ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa = f.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa
	,ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_id = coalesce(d15.id,-1)
	,paaasiallinen_toiminta_versio6 = f.paaasiallinen_toiminta_versio6
	,paaasiallinen_toiminta_versio6_id = coalesce(d16.id,-1)
	,ammattiluokitus_2001 = f.ammattiluokitus_2001
	,ammattiluokitus_2001_id = coalesce(d17.id,-1)
	,ammattiluokitus_2010 = f.ammattiluokitus_2010
	,ammattiluokitus_2010_id = coalesce(d18.id,-1)
	,tyossakayntitilaston_tyonantajasektori = f.tyossakayntitilaston_tyonantajasektori
	,tyossakayntitilaston_tyonantajasektori_id =  coalesce(d19.id,-1)
	,lukumaara = f.lukumaara
	,tietolahde = f.tietolahde
	,rivinumero = f.rivinumero
	,vaeston_ika_1v = f.vaeston_ika_1v 
	,vaeston_ika_1v_id = coalesce(d20.id,-1)
	,vaeston_ika_5v = f.vaeston_ika_5v
	,vaeston_ika_5v_id = coalesce(d21.id,-1)
	,tutkinnon_suoritusika_1v = f.tutkinnon_suoritusika_1v
	,tutkinnon_suoritusika_1v_id = coalesce(d22.id,-1)
	,tutkinnon_ika_1v = f.tutkinnon_ika_1v 
	,tutkinnon_ika_1v_id = coalesce(d23.id,-1)
FROM VipunenTK_DW.dbo.f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta AS f
LEFT JOIN VipunenTK..d_aineisto AS d1 ON d1.aineisto_koodi =f.aineisto AND f.tilv_date between d1.alkaa and d1.paattyy
LEFT JOIN VipunenTK..d_sukupuoli AS d2 ON d2.sukupuoli_koodi = f.sukupuoli and f.tilv_date between d2.alkaa and d2.paattyy
LEFT JOIN VipunenTK..d_aidinkieli_versio1   AS d3 ON d3.aidinkieli_versio1_koodi  =f.aidinkieli_versio1   AND f.tilv_date between d3.alkaa and d3.paattyy
LEFT JOIN VipunenTK..d_kausi AS d4 ON d4.kausi_id =f.syntymavuosi 
LEFT JOIN VipunenTK..d_alueluokitus  AS d5 ON d5.alueluokitus_avain ='MAAK'+f.asuinmaakunta 
LEFT JOIN VipunenTK..d_alueluokitus_historia  AS d5h ON d5h.alueluokitus_avain ='MAAK'+f.asuinmaakunta AND f.tilv_date between d5h.alkaa and d5h.paattyy
LEFT JOIN VipunenTK..d_kansalaisuus_versio1  AS d6 ON d6.kansalaisuus_versio1_koodi  =f.kansalaisuus_versio1  AND f.tilv_date between d6.alkaa and d6.paattyy
LEFT JOIN VipunenTK..d_pohjoismaa AS d7 ON d7.pohjoismaa_koodi  =f.pohjoismaa AND f.tilv_date between d7.alkaa and d7.paattyy
--LEFT JOIN VipunenTK..d_valtio AS d8 ON d8.valtio_avain   ='EU'+f.eumaa  AND f.tilv_date between d8.alkaa and d8.paattyy
LEFT JOIN VipunenTK..d_valtio AS d8 ON d8.valtio_avain   ='EU'+f.eumaa
--LEFT JOIN VipunenTK..d_valtio AS d9 ON d9.valtio_avain   ='ETA'+f.etamaa  AND f.tilv_date between d9.alkaa and d9.paattyy
LEFT JOIN VipunenTK..d_valtio AS d9 ON d9.valtio_avain   ='ETA'+f.etamaa
LEFT JOIN VipunenTK..d_kausi AS d10 ON d10.kausi_id  =f.tutkinnon_suoritusvuosi 
LEFT JOIN VipunenTK..d_alueluokitus AS d11 ON d11.alueluokitus_avain ='MAAK'+f.tutkinnon_suoritusmaakunta 
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d11h ON d11h.alueluokitus_avain ='MAAK'+f.tutkinnon_suoritusmaakunta AND f.tilv_date between d11h.alkaa and d11h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus AS d12 ON d12.koulutusluokitus_avain=f.koulutusluokitus 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d12h ON d12h.koulutusluokitus_avain =f.koulutusluokitus AND f.tilv_date between d12h.alkaa and d12h.paattyy
LEFT JOIN VipunenTK..d_koulutusmuoto AS d13 ON d13.koulutusmuoto_koodi =f.koulutusmuoto AND f.tilv_date between d13.alkaa and d13.paattyy
LEFT JOIN VipunenTK..d_oppisopimuskoulutus AS d14 ON d14.oppisopimuskoulutus_koodi  =f.oppisopimuskoulutus  AND f.tilv_date between d14.alkaa and d14.paattyy
LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa  AS d15 ON d15.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_koodi  =f.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa  AND f.tilv_date between d15.alkaa and d15.paattyy
LEFT JOIN VipunenTK..d_paaasiallinen_toiminta AS d16 ON d16.paaasiallinen_toiminta_koodi   =f.paaasiallinen_toiminta_versio6   AND f.tilv_date between d16.alkaa and d16.paattyy
LEFT JOIN VipunenTK..d_ammattiluokitus_2001  AS d17 ON d17.ammattiluokitus_2001_avain    =f.ammattiluokitus_2001    AND f.tilv_date between d17.alkaa and d17.paattyy
LEFT JOIN VipunenTK..d_ammattiluokitus_2010  AS d18 ON d18.ammattiluokitus_2010_avain   =f.ammattiluokitus_2010    AND f.tilv_date between d18.alkaa and d18.paattyy
LEFT JOIN VipunenTK..d_tyossakayntitilaston_tyonantajasektori    AS d19 ON d19.tyossakayntitilaston_tyonantajasektori_koodi    =f.tyossakayntitilaston_tyonantajasektori     AND f.tilv_date between d19.alkaa and d19.paattyy
LEFT JOIN VipunenTK..d_ika  AS d20 ON d20.ika_avain    =f.vaeston_ika_1v  
LEFT JOIN VipunenTK..d_ika  AS d21 ON d21.ika_avain    =f.vaeston_ika_5v  
LEFT JOIN VipunenTK..d_ika  AS d22 ON d22.ika_avain    =f.tutkinnon_suoritusika_1v  
LEFT JOIN VipunenTK..d_ika  AS d23 ON d23.ika_avain    =f.tutkinnon_ika_1v

WHERE
f.aineisto <>
(case 
	when f.tilastointivuosi <= @maxTilastovuosiL then 'P'
	else 'L'
end)

GO

USE [ANTERO]