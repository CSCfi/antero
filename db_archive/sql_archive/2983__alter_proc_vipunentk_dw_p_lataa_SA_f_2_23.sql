USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_SA_f_2_23]    Script Date: 8.4.2020 13:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[p_lataa_SA_f_2_23] AS

truncate table  [VipunenTK].[dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]

insert into [VipunenTK].[dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]

--sel
SELECT
	 tilastointivuosi = f.tilastointivuosi
	,tilv_date = f.tilv_date
	,sukupuoli = f.sukupuoli
	,sukupuoli_id = coalesce(d1.id,-1)
	,syntymavuosi = f.syntymavuosi
	,syntymavuosi_id = coalesce(d2.kausi_id,'-1')
	,aidinkieli_versio1x = f.aidinkieli_versio1x
	,aidinkieli_versio1x_id = coalesce(d3.id,-1)
	,kotikunta= f.kotikunta
	,kotikunta_id = coalesce(d4.id,-1)
	,kotikunta_historia_id = coalesce(d4h.id,-1)
	,kotikunta1x= f.kotikunta1x
	,kotikunta1x_id = coalesce(d5.id,-1)
	,kotikunta1x_historia_id = coalesce(d5h.id,-1)
	,sosioekonominen_asema_1_isa= f.sosioekonominen_asema_1_isa
	,sosioekonominen_asema_1_isa_id = coalesce(d6.id,-1)
	,sosioekonominen_asema_1_aiti= f.sosioekonominen_asema_1_aiti
	,sosioekonominen_asema_1_aiti_id = coalesce(d7.id,-1)
	,sosioekonominen_asema_2_isa= f.sosioekonominen_asema_2_isa
	,sosioekonominen_asema_2_isa_id = coalesce(d8.id,-1)
	,sosioekonominen_asema_2_aiti= f.sosioekonominen_asema_2_aiti
	,sosioekonominen_asema_2_aiti_id = coalesce(d9.id,-1)
	,koulutusluokitus_isa= f.koulutusluokitus_isa
	,koulutusluokitus_isa_id = coalesce(d10.id,-1)
	,koulutusluokitus_isa_historia_id = coalesce(d10h.id,-1)
	,koulutusluokitus_aiti = f.koulutusluokitus_aiti
	,koulutusluokitus_aiti_id = coalesce(d11.id,-1)
	,koulutusluokitus_aiti_historia_id = coalesce(d11h.id,-1)
	,tulodesiili_isa = f.tulodesiili_isa
    ,tulodesiili_isa_id = coalesce(d12.id,-1)
	,tulodesiili_aiti = f.tulodesiili_aiti
    ,tulodesiili_aiti_id = coalesce(d13.id,-1)
	,f.sosioekonominen_tausta
	,koulutuslaji = f.koulutuslaji
	,koulutuslaji_id = coalesce(d14.id,-1)
	,opetushallinnon_koulutus = f.opetushallinnon_koulutus
	,opetushallinnon_koulutus_id = coalesce(d15.id,-1)
	,koulutusluokitus = f.koulutusluokitus
	,koulutusluokitus_id = coalesce(d16.id,-1)
	,koulutusluokitus_historia_id = coalesce(d16h.id,-1)
	,koulutuksen_kieli = f.koulutuksen_kieli
	,koulutuksen_kieli_id = coalesce(d17.id,-1)
	,koulutuksen_maakunta = f.koulutuksen_maakunta
	,koulutuksen_maakunta_id = coalesce(d18.id,-1)
	,koulutuksen_maakunta_historia_id = coalesce(d18h.id,-1)
	,kirjoihintulovuosi = f.kirjoihintulovuosi
	,kirjoihintulovuosi_id = coalesce(d19.kausi_id,'-1')
	,opiskelijan_olo_syys = f.kirjoillaolo_olosyys
	,opiskelijan_olo_syys_id = coalesce(d20.id,-1)
	,opetushallinnon_koulutus2=f.opetushallinnon_koulutus2
	,opetushallinnon_koulutus2_id= coalesce(d21.id,-1)
    ,uudet_opiskelijat = f.uudet_opiskelijat
    ,opiskelijat = f.opiskelijat
    ,tutkinnot = f.tutkinnot
    ,tietolahde = f.tietolahde
    ,rivinumero = f.rivinumero
    ,ika_1v = f.ika_1v 
    ,ika_1v_id = coalesce(d22.id,-1)
    ,ika_5v = f.ika_5v
    ,ika_5v_id = coalesce(d23.id,-1)
    
    --frm
FROM [VipunenTK_DW].[dbo].[f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] f
LEFT JOIN VipunenTK..d_sukupuoli  AS d1 ON d1.sukupuoli_koodi=f.sukupuoli AND f.tilv_date between d1.alkaa and d1.paattyy
LEFT JOIN VipunenTK..d_kausi AS d2 ON d2.kausi_id  = f.syntymavuosi
LEFT JOIN VipunenTK..d_aidinkieli_versio1  AS d3 ON d3.aidinkieli_versio1_koodi =f.aidinkieli_versio1x AND f.tilv_date between d3.alkaa and d3.paattyy
LEFT JOIN VipunenTK..d_alueluokitus AS d4 ON d4.alueluokitus_avain =f.kotikunta 
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d4h ON d4h.alueluokitus_avain =f.kotikunta AND f.tilv_date between d4h.alkaa and d4h.paattyy
LEFT JOIN VipunenTK..d_alueluokitus AS d5 ON d5.alueluokitus_avain =f.kotikunta1x 
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d5h ON d5h.alueluokitus_avain =f.kotikunta1x AND f.tilv_date between d5h.alkaa and d5h.paattyy
LEFT JOIN VipunenTK..d_sosioekonominen_asema  AS d6 ON d6.sosioekonominen_asema_koodi  =f.sosioekonominen_asema_1_isa AND f.tilv_date between d6.alkaa and d6.paattyy
LEFT JOIN VipunenTK..d_sosioekonominen_asema  AS d7 ON d7.sosioekonominen_asema_koodi  =f.sosioekonominen_asema_1_aiti AND f.tilv_date between d7.alkaa and d7.paattyy
LEFT JOIN VipunenTK..d_sosioekonominen_asema  AS d8 ON d8.sosioekonominen_asema_koodi  =f.sosioekonominen_asema_2_isa AND f.tilv_date between d8.alkaa and d8.paattyy
LEFT JOIN VipunenTK..d_sosioekonominen_asema  AS d9 ON d9.sosioekonominen_asema_koodi  =f.sosioekonominen_asema_2_aiti AND f.tilv_date between d9.alkaa and d9.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus  AS d10 ON d10.koulutusluokitus_avain   =f.koulutusluokitus_isa
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d10h ON d10h.koulutusluokitus_avain   =f.koulutusluokitus_isa AND f.tilv_date between d10h.alkaa and d10h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus  AS d11 ON d11.koulutusluokitus_avain   =f.koulutusluokitus_aiti
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d11h ON d11h.koulutusluokitus_avain   =f.koulutusluokitus_aiti AND f.tilv_date between d11h.alkaa and d11h.paattyy
LEFT JOIN VipunenTK..d_tulodesiili  AS d12 ON d12.tulodesiili_koodi   =f.tulodesiili_isa  AND f.tilv_date between d12.alkaa and d12.paattyy
LEFT JOIN VipunenTK..d_tulodesiili  AS d13 ON d13.tulodesiili_koodi   =f.tulodesiili_aiti AND f.tilv_date between d13.alkaa and d13.paattyy
LEFT JOIN VipunenTK..d_koulutuslaji  AS d14 ON d14.koulutuslaji_koodi=f.koulutuslaji AND f.tilv_date between d14.alkaa and d14.paattyy
LEFT JOIN VipunenTK..d_opetushallinnon_koulutus   AS d15 ON d15.opetushallinnon_koulutus_koodi =f.opetushallinnon_koulutus AND f.tilv_date between d15.alkaa and d15.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus  AS d16 ON d16.koulutus_koodi =f.koulutusluokitus 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d16h ON d16h.koulutus_koodi =f.koulutusluokitus AND f.tilv_date between d16h.alkaa and d16h.paattyy
LEFT JOIN VipunenTK..d_kieli   AS d17 ON d17.kieli_avain =f.koulutuksen_kieli AND f.tilv_date between d17.alkaa and d17.paattyy
LEFT JOIN VipunenTK..d_alueluokitus   AS d18 ON d18.alueluokitus_avain ='MAAK'+f.koulutuksen_maakunta
LEFT JOIN VipunenTK..d_alueluokitus_historia   AS d18h ON d18h.alueluokitus_avain ='MAAK'+f.koulutuksen_maakunta AND f.tilv_date between d18h.alkaa and d18h.paattyy
LEFT JOIN VipunenTK..d_kausi   AS d19 ON d19.kausi_id  = f.kirjoihintulovuosi
LEFT JOIN VipunenTK..d_opiskelijan_olo    AS d20 ON d20.opiskelijan_olo_koodi   = f.kirjoillaolo_olosyys
LEFT JOIN VipunenTK..d_opetushallinnon_koulutus    AS d21 ON d21.opetushallinnon_koulutus_koodi   = f.opetushallinnon_koulutus2
LEFT JOIN VipunenTK..d_ika    AS d22 ON d22.ika_avain    = f.ika_1v
LEFT JOIN VipunenTK..d_ika    AS d23 ON d23.ika_avain   = f.ika_5v


GO
USE [ANTERO]