USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.3.2018 8:49:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/

ALTER PROCEDURE [dbo].[p_lataa_f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] as

-- CSC Jarmo 8.6.2015
-- Opiskelijan_olo_avain arvo 9 muutettu arvoon -1 dimension haussa
-- Kotikunta_avain arvo 999 muutettu arvoon -1 dimension haussa
-- Jos valtiota ei löydy dimensiosta, käytetään arvoa -1 tuntematon
--  syynä ovat poistuneet valtiot (Neuvostoliitto, Jugoslavia, Tsekkoslovakia)

-- Execute VipunenTK_DW.dbo.p_lataa_f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk

TRUNCATE TABLE [VipunenTK].[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk];

INSERT INTO [VipunenTK].[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]

SELECT
	   f.[tilastovuosi]
      ,sukupuoli_id = coalesce(d1.id,-2)  --f.[sukupuoli_avain]
      ,f.[syntymavuosi]
	  ,f.jarjestys_syntymavuosi
      ,kotikunta_id = coalesce(d2.id,-2) -- f.[kotikunta_avain]
	  ,kotikunta_historia_id = coalesce(d2h.id, -2) -- f.[kotikunta_avain]
      ,asuinkunta_sama_vai_eri_kuin_aiemmin_id = coalesce(d3.id, -2)   --f.[kotikunta_sama_kuin_edeltavana_vuonna_avain]
      ,edeltavan_vuoden_asuinpaikka = coalesce(d4.id, -2) -- f.[edeltavan_vuoden_asuinpaikka_avain]
      ,f.[suomeen_muuttamisvuosi]
	  ,f.jarjestys_suomeen_muuttamisvuosi
      ,aidinkieli_versio4_id = coalesce(d5.id, -2) -- f.[aidinkieli_versio4_avain]
      ,kansalaisuus_id = coalesce(d6.id, -2) --f.[kansalaisuus_avain]
      ,syntymamaa_id = coalesce(d7.id, -1) --f.[syntymamaa_avain]
      ,aidin_syntymamaa_id = coalesce(d8.id, -1) --f.[aidin_syntymamaa_avain]
      ,isan_syntymamaa_id = coalesce(d9.id, -1) --f.[isan_syntymamaa_avain]
      ,henkilotunnuksen_oikeellisuus_id = coalesce(d10.id, -2) --f.[henkilotunnuksen_oikeellisuus_avain]
      ,koulutusryhma_id = coalesce(d11.id, -2) --f.[koulutusryhma_avain]
      ,opetushallinnon_koulutus_id = coalesce(d12.id, -2) --f.[opetushallinnon_koulutus_avain]
      ,koulutusluokitus_id = coalesce(d13.id, -1) --f.[koulutusluokitus_avain]
      ,koulutusluokitus_historia_id = coalesce(d13h.id, -1) --f.[koulutusluokitus_avain]
	  ,koulutusala_taso2_id = coalesce(d13b.id,-1)
      ,koulutuksen_opetuskieli_id = coalesce(d14.id, -2) --f.[koulutuksen_opetuskieli_avain]
      ,koulutuksen_sijaintikunta_id = coalesce(d15.id, -2) --f.[koulutuksen_sijaintikunta_koodi]
      ,koulutuksen_sijaintikunta_historia_id = coalesce(d15h.id, -2) --f.[koulutuksen_sijaintikunta_koodi]
      ,f.[tutkinnon_aloittamisvuosi]
	  ,f.jarjestys_tutkinnon_aloittamisvuosi
      ,opiskelijan_olo_id = coalesce(d16.id, -2) --f.[opiskelijan_olo_avain]
      ,maassaolo_id = coalesce(d17.id, -2) --f.[maassaolo_avain]
--      ,f.[osatutkinto_koodi]
      ,tutkinnon_toteuma_id = coalesce(d18.id, -2) --f.[tutkinnon_toteuma_avain]
      ,aineisto_id = coalesce(d19.id, -2) --f.[aineisto_avain]
      ,koulutussektori_id = coalesce(d20.id, -2) --f.[koulutussektori_avain]
      ,ika1v_id = coalesce(d21.id, -2) --f.[ika1v_avain]
      ,ikaryhma1_id = coalesce(d21b.id, -2) --f.[ika1v_avain]
      ,ikaryhma2_id = coalesce(d21c.id, -2) --f.[ika1v_avain]
      ,f.[suoritusaika]
	  ,f.jarjestys_suoritusaika
      ,aidinkieli_versio1_id = coalesce(d22.id, -2) --f.[aidinkieli_versio1_avain]
      ,aidinkieli_versio2_id = coalesce(d23.id, -2) --f.[aidinkieli_versio2_avain]
      ,maahantulo_ja_toisen_asteen_koul_aloittaminen_id = coalesce(d24.id,-2) --f.[maahantulo_ja_toisen_asteen_koul_aloittaminen_avain]
      ,maahantulo_ja_korkeakoulutuksen_aloittaminen_id = coalesce(d25.id, -2) --f.[maahantulo_ja_korkeakoulutuksen_aloittaminen_avain]
	  ,koulutuksen_jarjestamismuoto_id = coalesce(d26.id, -2)

/** mittarit **/

      ,f.[aloittaneet]
      ,f.[opiskelijat]
      ,f.[tutkinnot]
      ,f.[aloittaneet_ulkomaalaistausta_kielen_mukaan]
      ,f.[opiskelijat_ulkomaalaistausta_kielen_mukaan]
      ,f.[tutkinnot_ulkomaalaistausta_kielen_mukaan]
      ,f.[aloittaneet_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,f.[opiskelijat_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,f.[tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
      ,f.[aloittaneet_ulkomaalaiset]
      ,f.[opiskelijat_ulkomaalaiset]
      ,f.[tutkinnot_ulkomaalaiset]
      ,f.[aloittaneet_ulkomailla_syntyneet]
      ,f.[opiskelijat_ulkomailla_syntyneet]
      ,f.[tutkinnot_ulkomailla_syntyneet]
	  ,hallinnonala2_id = coalesce(d12b.id,-2)
  --into [VipunenTK].[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]
  FROM [VipunenTK_DW].[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] f

  LEFT OUTER JOIN VipunenTK.dbo.d_sukupuoli d1 ON d1.sukupuoli_koodi = f.sukupuoli_avain 
  LEFT OUTER JOIN VipunenTK.dbo.d_alueluokitus d2 ON d2.alueluokitus_avain = Case when f.kotikunta_avain='999' then '-1' else f.kotikunta_avain end
  LEFT OUTER JOIN VipunenTK.dbo.d_alueluokitus_historia d2h ON d2h.alueluokitus_avain = Case when f.kotikunta_avain='999' then '-1' else f.kotikunta_avain end and f.tilastovuosi between d2h.alkaa and d2h.paattyy
  LEFT OUTER JOIN VipunenTK.dbo.d_asuinkunta_sama_vai_eri_kuin_aiemmin d3 ON d3.asuinkunta_sama_vai_eri_kuin_aiemmin_koodi = f.kotikunta_sama_kuin_edeltavana_vuonna_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_edeltavan_vuoden_asuinpaikka d4 ON d4.edeltavan_vuoden_asuinpaikka_koodi = f.edeltavan_vuoden_asuinpaikka_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_kieli d5 ON d5.kieli_avain = f.aidinkieli_versio4_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_valtio d6 ON d6.valtio_avain = f.kansalaisuus_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_valtio d7 ON d7.valtio_avain = f.syntymamaa_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_valtio d8 ON d8.valtio_avain = f.aidin_syntymamaa_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_valtio d9 ON d9.valtio_avain = f.isan_syntymamaa_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_hetu_ok d10 ON d10.hetu_ok_avain = f.henkilotunnuksen_oikeellisuus_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_koulutusryhma d11 ON d11.koulutusryhma_koodi = f.koulutusryhma_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_opetushallinnon_koulutus d12 ON d12.opetushallinnon_koulutus_koodi = f.opetushallinnon_koulutus_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_hallinnonala2 d12b ON d12b.hallinnonala_koodi=f.hallinnonala2
  LEFT OUTER JOIN VipunenTK.dbo.d_koulutusluokitus d13 ON d13.koulutusluokitus_avain = f.koulutusluokitus_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_koulutusluokitus_historia d13h ON d13h.koulutusluokitus_avain = f.koulutusluokitus_avain and f.tilastovuosi between d13h.alkaa and d13h.paattyy
  LEFT OUTER JOIN VipunenTK.dbo.d_koulutusluokitus d13b on d13b.koulutusluokitus_avain=f.koulutusala_taso2_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_kieli d14 ON d14.kieli_avain = f.koulutuksen_opetuskieli_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_alueluokitus d15 ON d15.alueluokitus_avain = f.koulutuksen_sijaintikunta_koodi
  LEFT OUTER JOIN VipunenTK.dbo.d_alueluokitus_historia d15h ON d15h.alueluokitus_avain = f.koulutuksen_sijaintikunta_koodi and f.tilastovuosi between d15h.alkaa and d15h.paattyy
  LEFT OUTER JOIN VipunenTK.dbo.d_opiskelijan_olo d16 ON d16.opiskelijan_olo_koodi = Case when f.opiskelijan_olo_avain='9' then '-1' else f.opiskelijan_olo_avain end
  LEFT OUTER JOIN VipunenTK.dbo.d_maassaolo d17 ON d17.maassaolo_koodi = f.maassaolo_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_tutkinnon_toteuma d18 ON d18.tutkinnon_toteuma_koodi = f.tutkinnon_toteuma_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_aineisto d19 ON d19.aineisto_koodi = f.aineisto_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_koulutussektori d20 ON d20.koulutussektori_koodi = f.koulutussektori_avain

  LEFT OUTER JOIN VipunenTK.dbo.d_ika d21 ON d21.ika_avain = f.ika1v_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_ika d21b ON d21b.ika_avain = f.ikaryhma1_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_ika d21c ON d21c.ika_avain = f.ikaryhma2_avain

  LEFT OUTER JOIN VipunenTK.dbo.d_aidinkieli_versio1 d22 ON d22.aidinkieli_versio1_koodi = f.aidinkieli_versio1_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_aidinkieli_versio2 d23 ON d23.aidinkieli_versio2_koodi = f.aidinkieli_versio2_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_maahantulo_ja_opiskelun_aloittaminen d24 ON d24.maahantulo_ja_opiskelun_aloittaminen_koodi = f.maahantulo_ja_toisen_asteen_koul_aloittaminen_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_maahantulo_ja_opiskelun_aloittaminen d25 ON d25.maahantulo_ja_opiskelun_aloittaminen_koodi = f.maahantulo_ja_korkeakoulutuksen_aloittaminen_avain
  LEFT OUTER JOIN VipunenTK.dbo.d_koulutuksen_jarjestamismuoto d26 ON d26.koulutuksen_jarjestamismuoto_koodi = f.koulutuksen_jarjestamismuoto_avain


GO

USE [ANTERO]