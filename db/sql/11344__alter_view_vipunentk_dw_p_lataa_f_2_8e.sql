USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_2_8e]    Script Date: 31.10.2025 10.54.36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dbo].[p_lataa_f_2_8e] AS

truncate table vipunentk.dbo.f_2_8e_Korkeakoulun_aloittaneiden_mediaani_iat;

insert into vipunentk.dbo.f_2_8e_Korkeakoulun_aloittaneiden_mediaani_iat

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
	,opiskelijan_olo_tamm = f.opiskelijan_olo_tamm
	,opiskelijan_olo_tamm_id = coalesce(d13.id,'-1')
	,opiskelijan_olo_syys = f.opiskelijan_olo_syys
	,opiskelijan_olo_syys_id = coalesce(d14.id,'-1')
	,koulutuksen_kieli = f.koulutuksen_kieli
	,koulutuksen_kieli_id = coalesce(d15.id,'-1')
	,patevyyteen_tahtaavat_opinnot_amk = f.patevyys_amk
	,patevyyteen_tahtaavat_opinnot_amk_id = coalesce(d18.id,'-1')
	,erikoislaakarikoulutus = f.erikoislaakari
	,erikoislaakarikoulutus_id = coalesce(d19.id,'-1')
	,kansalaisuus_versio2 = f.kansalaisuus_versio2
	,kansalaisuus_versio2_id = coalesce(d20.id,'-1')
	,kvopisk = f.kvopisk
	,kvopisk_id = coalesce(d21.id,'-1')
	,suormaa = f.suormaa
	,suormaa_id = coalesce(d22.id,'-1')
	,opoikv
	,lukumaara = f.lukumaara
	,tietolahde = f.tietolahde
	,rivinumero = f.rivinumero
	,aineistotunnus = f.aineistotunnus
	,koulutussektori = f.koulutussektori
	,koulutussektori_id = coalesce(d16.id,-1)
	,ika_1v = f.ika_1v
	,ika_1v_id = coalesce(d17.id,-1)
	,aloitusika = f.aloitusika
	,jarjestys_aloitusika = f.jarjestys_aloitusika
	,aloittaneet = f.aloittaneet
	,aloittaneet_korkeakoulusektori = f.aloittaneet_korkeakoulusektori
	,koulutuslaji_OKM_id = coalesce(d53.id, -2)
--INTO vipunentk.dbo.f_2_8e_Korkeakoulun_aloittaneiden_mediaani_iat
FROM VipunenTK_DW.dbo.f_2_8e_Korkeakouluopiskelijat AS f
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
LEFT JOIN VipunenTK..d_opiskelijan_olo_tamm d13 on d13.opiskelijan_olo_tamm_koodi=f.opiskelijan_olo_tamm
LEFT JOIN VipunenTK..d_opiskelijan_olo d14 on d14.opiskelijan_olo_koodi=f.opiskelijan_olo_syys
LEFT JOIN VipunenTK..d_kieli d15 on d15.kieli_avain=f.koulutuksen_kieli
LEFT JOIN VipunenTK..d_koulutussektori AS d16 ON d16.koulutussektori_koodi=f.koulutussektori and f.tilv_date between d16.alkaa and d16.paattyy
LEFT JOIN VipunenTK..d_ika AS d17 ON d17.ika_avain = f.ika_1v
LEFT JOIN VipunenTK..d_patevyyteen_tahtaavat_opinnot_amk d18 on d18.patevyyteen_tahtaavat_opinnot_koodi=f.patevyys_amk
LEFT JOIN VipunenTK..d_erikoislaakarikoulutus d19 on d19.erikoislaakarikoulutus_koodi=f.erikoislaakari
LEFT JOIN VipunenTK..d_kansalaisuus_versio2 d20 on d20.kansalaisuus_versio2_koodi=f.kansalaisuus_versio2
LEFT JOIN VipunenTK..d_kylla_ei d21 on d21.kylla_ei_koodi=f.kvopisk
LEFT JOIN VipunenTK..d_eu_etamaat d22 on d22.eu_etamaat_avain = f.suormaa

LEFT JOIN VipunenTK..d_aineisto_OTV AS d50 ON d50.aineisto_koodi=f.aineistotunnus AND f.tilv_date between d50.alkaa and d50.paattyy

/* koulutuslaji okm */

LEFT JOIN VipunenTK..d_koulutuslaji_okm AS d53 ON d53.koulutuslaji_okm_avain = f.koulutuslaji_OKM_avain

GO


