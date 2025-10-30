USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_OTV_f_3_4]    Script Date: 30.10.2025 9.56.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dbo].[p_lataa_OTV_f_3_4] AS

truncate table vipunentk.dbo.f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat;

insert into vipunentk.dbo.f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat
 

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
	,koulutusluokitus = f.koulutusluokitus
	,koulutusluokitus_id = coalesce(d4.id,-1)
	,koulutusluokitus_historia_id = coalesce(d4h.id,-1)
	,koulutustyyppi = f.koulutustyyppi
	,koulutustyyppi_id = coalesce(d5.id,-1)
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
	,kirjoihintulovuosi_korkeakoulu = f.kirjoihintulovuosi_korkeakoulu
	,kirjoihintulovuosi_korkeakoulu_id = coalesce(d12.kausi_id,'-1')
	,kirjoihintulokausi_korkeakoulu = f.kirjoihintulokausi_korkeakoulu
	,kirjoihintulokausi_korkeakoulu_id = coalesce(d13.kausi_id,'-1')
	,tutkinnon_suoritusvuosi = f.tutkinnon_suoritusvuosi
	,tutkinnon_suoritusvuosi_id = coalesce(d14.kausi_id,'-1')
	,tutkinnon_suorituskuukausi = f.tutkinnon_suorituskuukausi
	,tutkinnon_suorituskuukausi_id = coalesce(d15.kausi_id,'-1')
	,lukumaara = f.lukumaara
	,tietolahde = f.tietolahde
	,rivinumero = f.rivinumero
	,aineistotunnus = f.aineistotunnus
	,koulutussektori = f.koulutussektori
	,koulutussektori_id = coalesce(d16.id,-1)
	,ika_1v = f.ika_1v
	,ika_1v_id = coalesce(d17.id,-1)
	,suoritusika = f.suoritusika
	,jarjestys_suoritusika = f.jarjestys_suoritusika
	,suoritusaika = f.suoritusaika
	,jarjestys_suoritusaika = f.jarjestys_suoritusaika
	,suoritusaika_kk = f.suoritusaika_kk
	,jarjestys_suoritusaika_kk = f.jarjestys_suoritusaika_kk
	,tutkinnot =f.tutkinnot
	,aineisto_id = -1
	,aineisto_OTV_id = coalesce(d50.id,-1)
    ,koulutuksen_jarjestaja_kunta_id = coalesce(d51.id,-2)
    ,koulutuksen_jarjestaja_kunta_historia_id = coalesce(d51h.id,-2)
    ,oppilaitos_kunta_id = coalesce(d52.id,-2)
    ,oppilaitos_kunta_historia_id = coalesce(d52h.id,-2)
    ,opetushallinnon_koulutus_id = 1    
	,koulutuslaji_OKM_id = coalesce(d53.id, -2)
	
    ,rahoituslahde = f.rahoituslahde
	,rahoituslahde_id = coalesce(d54.id, -1)
	,kv_opiskelija = f.kv_opiskelija
	,kv_opiskelija = coalesce(d55.id, -1)

FROM VipunenTK_DW.dbo.f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat AS f
LEFT JOIN VipunenTK..d_lahde AS d1 ON d1.lahde_koodi=f.lahde AND f.tilv_date between d1.alkaa and d1.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d2 ON d2.oppilaitos_avain=f.oppilaitos
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d3 ON d3.oppilaitos_avain=f.koulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d2h ON d2h.oppilaitos_avain=f.oppilaitos AND f.tilv_date between d2h.alkaa and d2h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d3h ON d3h.oppilaitos_avain=f.koulutuksen_jarjestaja AND f.tilv_date between d3h.alkaa and d3h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus AS d4 ON d4.koulutusluokitus_avain=f.koulutusluokitus
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d4h ON d4h.koulutusluokitus_avain=f.koulutusluokitus AND f.tilv_date between d4h.alkaa and d4h.paattyy
LEFT JOIN VipunenTK..d_koulutustyyppi AS d5 ON d5.koulutustyyppi_koodi=f.koulutustyyppi AND f.tilv_date between d5.alkaa and d5.paattyy
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
LEFT JOIN VipunenTK..d_kausi AS d12 ON d12.kausi_id	=(case when isnull(f.kirjoihintulovuosi_korkeakoulu,'') in ('9999','XXXX','') then '-1' else f.kirjoihintulovuosi_korkeakoulu end)
LEFT JOIN VipunenTK..d_kausi AS d13 ON d13.kausi_id	=(case
	when isnull(f.kirjoihintulovuosi_korkeakoulu,'') in ('9999','XXXX','') then '-1'
	when isnull(f.kirjoihintulokausi_korkeakoulu,'') in ('9','X','') then '-1'
	else f.kirjoihintulovuosi_korkeakoulu+f.kirjoihintulokausi_korkeakoulu end)
LEFT JOIN VipunenTK..d_kausi AS d14 ON d14.kausi_id	=(case when isnull(f.tutkinnon_suoritusvuosi,'') in ('9999','XXXX','') then '-1' else f.tutkinnon_suoritusvuosi end)
LEFT JOIN VipunenTK..d_kausi AS d15 ON d15.kausi_id	=(case
	when isnull(f.tutkinnon_suoritusvuosi,'') in ('9999','XXXX','') then '-1'
	when isnull(f.tutkinnon_suorituskuukausi,'') in ('99','XX','') then '-1'
	else f.tutkinnon_suoritusvuosi+f.tutkinnon_suorituskuukausi end)
LEFT JOIN VipunenTK..d_koulutussektori AS d16 ON d16.koulutussektori_koodi=f.koulutussektori and f.tilv_date between d16.alkaa and d16.paattyy
LEFT JOIN VipunenTK..d_ika AS d17 ON d17.ika_avain =f.ika_1v

LEFT JOIN VipunenTK..d_aineisto_OTV AS d50 ON d50.aineisto_koodi=f.aineistotunnus AND f.tilv_date between d50.alkaa and d50.paattyy

/* koulutuksen järjestäjän sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d51 ON d51.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.koulutuksen_jarjestaja)

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d51h ON d51h.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.koulutuksen_jarjestaja AND f.tilv_date between d51h.alkaa and d51h.paattyy)
		AND f.tilv_date between d51h.alkaa and d51h.paattyy

/* oppilaitoksen sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d52 ON d52.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.oppilaitos)

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d52h ON d52h.alueluokitus_avain = 
		(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.oppilaitos AND f.tilv_date between d52h.alkaa and d52h.paattyy)
		AND f.tilv_date between d52h.alkaa and d52h.paattyy

/* koulutuslaji okm */

LEFT JOIN VipunenTK..d_koulutuslaji_okm AS d53 ON d53.koulutuslaji_okm_avain = f.koulutuslaji_OKM_avain

LEFT JOIN VipunenTK..d_rahoituslahde d54 ON d54.rahoituslahde_koodi = f.rahoituslahde
LEFT JOIN VipunenTK..d_kvopiskelija d55 on d55.kvopiskelija_koodi = f.kv_opiskelija

		

GO


