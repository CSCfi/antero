USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15]    Script Date: 13.1.2023 0:22:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [dbo].[v_f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15] AS
/*
Drop table VipunenTK.dbo.f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15
Select * into VipunenTK.dbo.f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15 from VipunenTK_DW.dbo.v_f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15

Delete from VipunenTK.dbo.f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15 
Insert into VipunenTK.dbo.f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15 Select * from VipunenTK_DW.dbo.v_f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15 
*/

SELECT [tilastovuosi] = tilastointivuosi
      ,[tilv_date]
	  ,Nakokulma
      ,lahde_avain = f.[lahde]
	  ,lahde_id = ISNULL(d_la.id, -2)
      ,koulutusluokitus_avain = [koulutusluokitus]
	  ,koulutusluokitus_id = ISNULL(d_kl.id, -2)
      ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_avain = f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	  ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id = ISNULL(d_osp.id, -2)
      ,ammatillisen_koulutuksen_koulutuslaji_avain = f.ammatillisen_koulutuksen_koulutuslaji
	  ,ammatillisen_koulutuksen_koulutuslaji_id = ISNULL(d_am.id, -2)
      ,opetushallinnon_koulutus_avain = f.opetushallinnon_koulutus
	  ,opetushallinnon_koulutus_id = ISNULL(d_ohk.id, -2)
	  ,koulutuksen_opetuskieli_avain = f.koulutuksen_opetuskieli
	  ,koulutuksen_opetuskieli_id = ISNULL(d_ki.id, -2)
      ,nuorten_aikuisten_koulutus_amm_avain = f.nuorten_aikuisten_koulutus_amm
	  ,nuorten_aikuisten_koulutus_amm_id = ISNULL(d_na.id, -2)
      ,koulutuksen_sijaintimaakunta_avain = Case when f.koulutuksen_sijaintimaakunta='-1' then '' else 'MAAK' end + f.koulutuksen_sijaintimaakunta
	  ,koulutuksen_sijaintimaakunta_id = ISNULL(d_ksm.id, -2)
      ,sukupuoli_avain = f.sukupuoli
	  ,sukupuoli_id = ISNULL(d_sp.id, -2)
      ,aikuisopiskelija_avain = f.aikuisopiskelija
	  ,aikuisopiskelija_id = ISNULL(d_ao.id, -2)
	  ,koulutuksen_aloittamislukuvuosi
	  ,koulutuksen_aloittamislukukausi
      ,koulutuksen_aloittamislukukausi_avain = f.koulutuksen_aloittamislukuvuosi + koulutuksen_aloittamislukukausi
	  ,koulutuksen_aloittamislukukausi_id = ISNULL(d_ka.kausi_id, -2)
      ,kirjoillaolo_tammikuu_avain = f.kirjoillaolo_tammikuu
	  ,kirjoillaolo_tammikuu_id = ISNULL(d_ot.id, -2)
      ,kirjoillaolo_syyskuu_avain = f.kirjoillaolo_syyskuu
	  ,kirjoillaolo_syyskuu_id = ISNULL(d_os.id, -2)
      ,kotikunnan_kuntaryhma_avain = f.kotikunnan_kuntaryhma
	  ,kotikunnan_kuntaryhma_id = ISNULL(d_kr.id, -2)
      ,koulutusryhma_koulutuslaji3_avain = f.koulutusryhma_koulutuslaji3
	  ,koulutusryhma_koulutuslaji3_id = ISNULL(d_kl3.id, -2)
      ,kansalaisuus_maa_avain = f.kansalaisuus_maa
	  ,kansalaisuus_maa_id = ISNULL(d_kva.id, -1)
      ,kansalaisuus_versio1_avain = f.kansalaisuus_versio1
	  ,kansalaisuus_versio1_id = ISNULL(d_kka1.id, -2)
      ,syntymavaltio_maa_avain = f.syntymavaltio_maa
	  ,syntymavaltio_maa_id = ISNULL(d_sva.id, -1)
      ,syntymavaltio_kansalaisuus_versio1_avain = f.syntymavaltio_kansalaisuus_versio1
	  ,syntymavaltio_kansalaisuus_versio1_id = ISNULL(d_ska1.id, -2)
      ,aidinkieli_kieli_avain = f.aidinkieli_kieli
	  ,aidinkieli_kieli_id = ISNULL(d_ak.id, -2)
      ,aidinkieli_versio3_avain = f.aidinkieli_versio3
	  ,aidinkieli_versio3_id = ISNULL(d_a3.id, -2)
      ,koulutussektori_avain = f.koulutussektori
	  ,koulutussektori_id = ISNULL(d_ks.id, -2)
      ,[opiskelijoiden_lkm]
      ,f.[tietolahde]
      ,[rivinumero]
	  ,hallinnonala2_id = ISNULL(d_ha.id, -2)
  FROM ( --f
Select   
	   [tilastointivuosi]
      ,[tilv_date]
      ,[lahde]
      ,[koulutusluokitus]
      ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
      ,[ammatillisen_koulutuksen_koulutuslaji]
      ,[opetushallinnon_koulutus]
      ,[koulutuksen_opetuskieli]
      ,[nuorten_aikuisten_koulutus_amm]
      ,[koulutuksen_sijaintimaakunta]
      ,[sukupuoli]
      ,[aikuisopiskelija]
      ,[koulutuksen_aloittamislukuvuosi]
      ,[koulutuksen_aloittamislukukausi]
      ,[kirjoillaolo_tammikuu]
      ,[kirjoillaolo_syyskuu]
      ,[kotikunnan_kuntaryhma]
      ,[koulutusryhma_koulutuslaji3]
      ,[kansalaisuus_maa]
      ,[kansalaisuus_versio1]
      ,[syntymavaltio_maa] = Cast('-1' as nvarchar(3))
      ,[syntymavaltio_kansalaisuus_versio1] = Cast('-1' as nvarchar(2))
      ,[aidinkieli_kieli] = Cast('-1' as nvarchar(10))
      ,[aidinkieli_versio3] = Cast('-1' as nvarchar(2))
      ,[koulutussektori]
      ,[opiskelijoiden_lkm]
      ,[tietolahde]
      ,[rivinumero]
	  ,Nakokulma = Cast('Kansalaisuuden mukaan' as nvarchar(50))
from [dbo].[f_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan]

Union all
Select   
	   [tilastointivuosi]
      ,[tilv_date]
      ,[lahde]
      ,[koulutusluokitus]
      ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
      ,[ammatillisen_koulutuksen_koulutuslaji]
      ,[opetushallinnon_koulutus]
      ,[koulutuksen_opetuskieli]
      ,[nuorten_aikuisten_koulutus_amm]
      ,[koulutuksen_sijaintimaakunta]
      ,[sukupuoli]
      ,[aikuisopiskelija]
      ,[koulutuksen_aloittamislukuvuosi]
      ,[koulutuksen_aloittamislukukausi]
      ,[kirjoillaolo_tammikuu]
      ,[kirjoillaolo_syyskuu]
      ,[kotikunnan_kuntaryhma]
      ,[koulutusryhma_koulutuslaji3]
      ,[kansalaisuus_maa] = Cast('-1' as nvarchar(3))
      ,[kansalaisuus_versio1] = Cast('-1' as nvarchar(2))
      ,[syntymavaltio_maa]
      ,[syntymavaltio_kansalaisuus_versio1]
      ,[aidinkieli_kieli] = Cast('-1' as nvarchar(10))
      ,[aidinkieli_versio3] = Cast('-1' as nvarchar(2))
      ,[koulutussektori]
      ,[opiskelijoiden_lkm]
      ,[tietolahde]
      ,[rivinumero]
	  ,Nakokulma = Cast('Syntymämaan mukaan' as nvarchar(50))
from [dbo].[f_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]

Union all
Select   
	   [tilastointivuosi]
      ,[tilv_date]
      ,[lahde]
      ,[koulutusluokitus]
      ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
      ,[ammatillisen_koulutuksen_koulutuslaji]
      ,[opetushallinnon_koulutus]
      ,[koulutuksen_opetuskieli]
      ,[nuorten_aikuisten_koulutus_amm]
      ,[koulutuksen_sijaintimaakunta]
      ,[sukupuoli]
      ,[aikuisopiskelija]
      ,[koulutuksen_aloittamislukuvuosi]
      ,[koulutuksen_aloittamislukukausi]
      ,[kirjoillaolo_tammikuu]
      ,[kirjoillaolo_syyskuu]
      ,[kotikunnan_kuntaryhma]
      ,[koulutusryhma_koulutuslaji3]
      ,[kansalaisuus_maa] = Cast('-1' as nvarchar(3))
      ,[kansalaisuus_versio1] = Cast('-1' as nvarchar(2))
      ,[syntymavaltio_maa] = Cast('-1' as nvarchar(3))
      ,[syntymavaltio_kansalaisuus_versio1] = Cast('-1' as nvarchar(2))
      ,[aidinkieli_kieli]
      ,[aidinkieli_versio3]
      ,[koulutussektori]
      ,[opiskelijoiden_lkm]
      ,[tietolahde]
      ,[rivinumero]
	  ,Nakokulma = Cast('Äidinkielen mukaan' as nvarchar(50))
from [dbo].[f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]

  ) f
LEFT JOIN VipunenTK.dbo.d_lahde d_la
	ON d_la.lahde_koodi = f.lahde
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_kl
	ON d_kl.koulutusluokitus_avain = f.koulutusluokitus
LEFT JOIN VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d_osp
	ON d_osp.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi = f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
LEFT JOIN VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d_am
	ON d_am.ammatillisen_koulutuksen_koulutuslaji_koodi = f.ammatillisen_koulutuksen_koulutuslaji
LEFT JOIN VipunenTK.dbo.d_opetushallinnon_koulutus d_ohk
	ON d_ohk.opetushallinnon_koulutus_koodi = f.opetushallinnon_koulutus
LEFT JOIN VipunenTK.dbo.d_kieli d_ki
	ON d_ki.kieli_avain = f.koulutuksen_opetuskieli
LEFT JOIN VipunenTK.dbo.d_nuorten_aikuisten_koulutus_amm d_na
	ON d_na.nuorten_aikuisten_koulutus_amm_koodi = f.nuorten_aikuisten_koulutus_amm
LEFT JOIN VipunenTK.dbo.d_alueluokitus d_ksm
	ON d_ksm.alueluokitus_avain = Case when f.koulutuksen_sijaintimaakunta='-1' then '' else 'MAAK' end + f.koulutuksen_sijaintimaakunta
LEFT JOIN VipunenTK.dbo.d_sukupuoli d_sp
	ON d_sp.sukupuoli_koodi = f.sukupuoli
LEFT JOIN VipunenTK.dbo.d_aikuisopiskelija d_ao
	ON d_ao.aikuisopiskelija_koodi = f.aikuisopiskelija
LEFT JOIN VipunenTK.dbo.d_kausi d_ka
	ON d_ka.kausi_id = f.koulutuksen_aloittamislukuvuosi + f.koulutuksen_aloittamislukukausi
LEFT JOIN VipunenTK.dbo.d_opiskelijan_olo d_ot
	ON d_ot.opiskelijan_olo_koodi = f.kirjoillaolo_tammikuu
LEFT JOIN VipunenTK.dbo.d_opiskelijan_olo d_os
	ON d_os.opiskelijan_olo_koodi = f.kirjoillaolo_syyskuu
LEFT JOIN VipunenTK.dbo.d_kuntaryhma d_kr
	ON d_kr.kuntaryhma_koodi = f.kotikunnan_kuntaryhma
LEFT JOIN VipunenTK.dbo.d_koulutuslaji3 d_kl3
	ON d_kl3.koulutuslaji3_koodi = f.koulutusryhma_koulutuslaji3
LEFT JOIN VipunenTK.dbo.d_valtio d_kva
	ON d_kva.valtio_avain = f.kansalaisuus_maa
LEFT JOIN VipunenTK.dbo.d_kansalaisuus_versio1 d_kka1
	ON d_kka1.kansalaisuus_versio1_koodi = f.kansalaisuus_versio1
LEFT JOIN VipunenTK.dbo.d_valtio d_sva
	ON d_sva.valtio_avain = f.syntymavaltio_maa
LEFT JOIN VipunenTK.dbo.d_kansalaisuus_versio1 d_ska1
	ON d_ska1.kansalaisuus_versio1_koodi = f.syntymavaltio_kansalaisuus_versio1
LEFT JOIN VipunenTK.dbo.d_kieli d_ak
	ON d_ak.kieli_avain = f.aidinkieli_kieli
LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio3 d_a3
	ON d_a3.aidinkieli_versio3_koodi = f.aidinkieli_versio3
LEFT JOIN VipunenTK.dbo.d_koulutussektori d_ks
	ON d_ks.koulutussektori_koodi = f.koulutussektori
LEFT JOIN VipunenTK.dbo.d_hallinnonala2 d_ha 
	ON d_ha.hallinnonala_koodi=
	(case
		when tilastointivuosi > 2020 then (case f.opetushallinnon_koulutus when '2' then '3' when '3' then '2' else f.opetushallinnon_koulutus end) --tilv 2021 lähtien kolmiportainen (amm.) jo aineistossa
		when f.opetushallinnon_koulutus = '1' then '1' --Opetushallinto, pl. työvoimakoulutus
		when f.opetushallinnon_koulutus = '2' and d_ksm.maakunta_koodi <> '21' and d_kl.opintoala2002_koodi not in ('902','903','904')  
			/*'Ålands Landskapsregering','Poliisiammattikorkeakoulu','Rikosseuraamusalan Koulutuskeskus','Pelastusopisto'*/ 
			then '2' --Opetushallinto, työvoimakoulutus
		when f.opetushallinnon_koulutus = '2' then '3' --Muiden hallinnonalojen alainen koulutus
		else '-1'
	 end
	)

GO
