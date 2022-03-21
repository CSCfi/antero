USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 13.2.2019 13:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [dbo].[p_lataa_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] AS
--
--CSC Jarmo 9.10.2015
-- Tehty kopiona ja muokkauksena 4.7-proseduurista
--  4_7 -> 4_8
--  aiempi -> myohempi
--  AIK_ -> MYOH_
--  aiemman -> myohemman
--  aikaisempi -> myohempi

--Päivittää VipunenTK-kantaan tähtimallin
--Heti sen jälkeen täyttää tabular-mallisen taulun

--Execute VipunenTK_DW.dbo.p_lataa_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8

--Drop table VipunenTK.dbo.f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8

Truncate table [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
Insert into [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]

Truncate table VipunenTK_DW.dbo.f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus
Insert into VipunenTK_DW.dbo.f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus
  Select * from VipunenTK_DW.dbo.v_f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus

Truncate table VipunenTK_DW.dbo.f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8 
Insert into VipunenTK_DW.dbo.f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8
  Select * from VipunenTK_DW.dbo.v_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8 

Truncate table VipunenTK_DW.dbo._f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8

Insert into VipunenTK_DW.dbo._f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8
SELECT --TOP 0
	   [tilastovuosi]
      ,[tilv_date]
      ,[sukupuoli_koodi]
      ,[aidinkieli_versio1_koodi]
      ,[suorv]
      ,[suorlk]
      ,[suorituskausikoodi]
      ,f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.[koulutusluokitus_avain]
      ,[alvv]
      ,[allk]
      ,[aloituskausikoodi]
      ,[oppisopimuskoulutus_koodi]
      ,[ammatillisen_koulutuksen_koulutuslaji_koodi]
      ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi]
      ,[ammatillinen_koulutus_ryhma]
      ,[ammatillinen_koulutus_ryhma_avain]
      ,[nuorten_aikuisten_koulutus_amm_koodi]
      ,[syntv]
      ,[ika_avain]
      ,[henkiloiden_lkm]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[lu_ika]
      ,[lu_myohempi_tutkinto_suoritettu]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[amm_ika]
      ,[amm_myohempi_tutkinto_suoritettu]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[opist_ika]
      ,[opist_myohempi_tutkinto_suoritettu]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[ammka_ika]
      ,[ammka_myohempi_tutkinto_suoritettu]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[amk_ika]
      ,[amk_myohempi_tutkinto_suoritettu]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[akk_ika]
      ,[akk_myohempi_tutkinto_suoritettu]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ylamk_ika]
      ,[ylamk_myohempi_tutkinto_suoritettu]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[ykk_ika]
      ,[ykk_myohempi_tutkinto_suoritettu]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[laaker_ika]
      ,[laaker_myohempi_tutkinto_suoritettu]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[lis_ika]
      ,[lis_myohempi_tutkinto_suoritettu]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[toht_ika]
      ,[toht_myohempi_tutkinto_suoritettu]
      ,f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.[tietolahde]
      ,[rivinumero]
      ,[tarkastelujakso_koodi]

	  ,tutkintojen_maara_amm_avain = 'MYOH_AMM_' + Cast(Case when ammlkm > 9 then 9 else ammlkm end as nvarchar(2))
	  ,tutkintojen_maara_amk_avain = 'MYOH_AMK_' + Cast(Case when amklkm > 9 then 9 else amklkm end as nvarchar(2))
	  ,tutkintojen_maara_akk_avain = 'MYOH_AKK_' + Cast(Case when akklkm > 9 then 9 else akklkm end as nvarchar(2))
	  ,tutkintojen_maara_ykk_avain = 'MYOH_YKK_' + Cast(Case when ykklkm > 9 then 9 else ykklkm end as nvarchar(2))
	  ,tutkinto_suoritettu_lu_avain =  'MYOH_LU_' + lu_myohempi_tutkinto_suoritettu
	  ,tutkinto_suoritettu_amm_avain =  'MYOH_AMM_' + amm_myohempi_tutkinto_suoritettu
	  ,tutkinto_suoritettu_opisto_avain =  'MYOH_OPISTO_' + opist_myohempi_tutkinto_suoritettu
	  ,tutkinto_suoritettu_ammka_avain =  'MYOH_AMMKA_' + ammka_myohempi_tutkinto_suoritettu
	  ,tutkinto_suoritettu_amk_avain =  'MYOH_AMK_' + amk_myohempi_tutkinto_suoritettu
	  ,tutkinto_suoritettu_akk_avain =  'MYOH_AKK_' + akk_myohempi_tutkinto_suoritettu
	  ,tutkinto_suoritettu_ylamk_avain =  'MYOH_YAMK_' + ylamk_myohempi_tutkinto_suoritettu
	  ,tutkinto_suoritettu_ykk_avain =  'MYOH_YKK_' + ykk_myohempi_tutkinto_suoritettu
	  ,tutkinto_suoritettu_laaker_avain =  'MYOH_LAAKER_' + laaker_myohempi_tutkinto_suoritettu
	  ,tutkinto_suoritettu_lis_avain =  'MYOH_LIS_' + lis_myohempi_tutkinto_suoritettu
	  ,tutkinto_suoritettu_toht_avain =  'MYOH_TOHT_' + toht_myohempi_tutkinto_suoritettu

	  ,yliopistotutkinto_myohempi_suoritettu = Coalesce( -- akklkm, ykklkm, laakerlkm --63, 72, 73
		Nullif(akk_myohempi_tutkinto_suoritettu, 'E'),
		Nullif(ykk_myohempi_tutkinto_suoritettu, 'E'),
		Nullif(laaker_myohempi_tutkinto_suoritettu, 'E'),
		'E')
	  ,yo_jatkotutkinto_myohempi_suoritettu = Coalesce(--81, 82
		Nullif(lis_myohempi_tutkinto_suoritettu, 'E'),
		Nullif(toht_myohempi_tutkinto_suoritettu, 'E'),
		'E')
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_myohempi_suoritettu = Coalesce( --50, 61
		Nullif(opist_myohempi_tutkinto_suoritettu, 'E'),
		Nullif(ammka_myohempi_tutkinto_suoritettu, 'E'),
		'E')
	  ,korkeakoulututkinto_myohempi_suoritettu = Coalesce( --62, 63, 71, 72, 73
		Nullif(amk_myohempi_tutkinto_suoritettu, 'E'),
		Nullif(akk_myohempi_tutkinto_suoritettu, 'E'),
		Nullif(ylamk_myohempi_tutkinto_suoritettu, 'E'),
		Nullif(ykk_myohempi_tutkinto_suoritettu, 'E'),
		Nullif(laaker_myohempi_tutkinto_suoritettu, 'E'),
		'E')
	  ,toisen_asteen_tutkinto_myohempi_suoritettu = Coalesce( --31, 32	  ,
		Nullif(lu_myohempi_tutkinto_suoritettu, 'E'),
		Nullif(amm_myohempi_tutkinto_suoritettu, 'E'),
		'E')
		
		--,ammatillinen_koulutus_ryhma
	  ,ammatillisen_tutkinto_myohempi_suoritettu_ryhma1 = --32, ryhmä 1
		Case when ammatillinen_koulutus_ryhma = 'R1' then [amm_myohempi_tutkinto_suoritettu] else 'E' end
	  ,ammatillisen_tutkinto_myohempi_suoritettu_ryhma2 = --32, ryhmä 2
		Case when ammatillinen_koulutus_ryhma = 'R2' then [amm_myohempi_tutkinto_suoritettu] else 'E' end
	  ,ammatillisen_tutkinto_myohempi_suoritettu_ryhma3 = --32, ryhmä 3
		Case when ammatillinen_koulutus_ryhma = 'R3' then [amm_myohempi_tutkinto_suoritettu] else 'E' end

	  ,lu_sama_myohempi_koulutusala2002_avain = Case when lu_myohempi_tutkinto_suoritettu = 'K' then 'lu_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi = d_lu_kl_ala.koulutusala2002_koodi then 'K' else 'E' end else '-1' end
	  ,amm_sama_myohempi_koulutusala2002_avain = Case when amm_myohempi_tutkinto_suoritettu = 'K' then 'amm_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi = d_amm_kl_ala.koulutusala2002_koodi then 'K' else 'E' end else '-1' end
	  ,opist_sama_myohempi_koulutusala2002_avain = Case when opist_myohempi_tutkinto_suoritettu = 'K' then 'opist_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi = d_opist_kl_ala.koulutusala2002_koodi then 'K' else 'E' end else '-1' end
	  ,ammka_sama_myohempi_koulutusala2002_avain = Case when ammka_myohempi_tutkinto_suoritettu = 'K' then 'ammka_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi = d_ammka_kl_ala.koulutusala2002_koodi then 'K' else 'E' end else '-1' end
	  ,akk_sama_myohempi_koulutusala2002_avain = Case when akk_myohempi_tutkinto_suoritettu = 'K' then 'akk_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi = d_akk_kl_ala.koulutusala2002_koodi then 'K' else 'E' end else '-1' end
	  ,amk_sama_myohempi_koulutusala2002_avain = Case when amk_myohempi_tutkinto_suoritettu = 'K' then 'amk_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi = d_amk_kl_ala.koulutusala2002_koodi then 'K' else 'E' end else '-1' end
	  ,ylamk_sama_myohempi_koulutusala2002_avain = Case when ylamk_myohempi_tutkinto_suoritettu = 'K' then 'ylamk_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi = d_ylamk_kl_ala.koulutusala2002_koodi then 'K' else 'E' end else '-1' end
	  ,ykk_sama_myohempi_koulutusala2002_avain = Case when ykk_myohempi_tutkinto_suoritettu = 'K' then 'ykk_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi = d_ykk_kl_ala.koulutusala2002_koodi then 'K' else 'E' end else '-1' end
	  ,laaker_sama_myohempi_koulutusala2002_avain = Case when laaker_myohempi_tutkinto_suoritettu = 'K' then 'laaker_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi = d_laaker_kl_ala.koulutusala2002_koodi then 'K' else 'E' end else '-1' end
	  ,lis_sama_myohempi_koulutusala2002_avain = Case when lis_myohempi_tutkinto_suoritettu = 'K' then 'lis_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi = d_lis_kl_ala.koulutusala2002_koodi then 'K' else 'E' end else '-1' end
	  ,toht_sama_myohempi_koulutusala2002_avain = Case when toht_myohempi_tutkinto_suoritettu = 'K' then 'toht_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi = d_toht_kl_ala.koulutusala2002_koodi then 'K' else 'E' end else '-1' end
	  ,yliopistotutkinto_sama_myohempi_koulutusala2002_avain = Case when 'K' in
			(akk_myohempi_tutkinto_suoritettu,
			ykk_myohempi_tutkinto_suoritettu,
			laaker_myohempi_tutkinto_suoritettu)
			then 'yliopistotutkinto_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi in (
				d_akk_kl_ala.koulutusala2002_koodi,
				d_ykk_kl_ala.koulutusala2002_koodi,
				d_laaker_kl_ala.koulutusala2002_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,yo_jatkotutkinto_sama_myohempi_koulutusala2002_avain = Case when 'K' in
			(lis_myohempi_tutkinto_suoritettu,
			toht_myohempi_tutkinto_suoritettu)
			then 'yo_jatkotutkinto_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi in (
				d_lis_kl_ala.koulutusala2002_koodi,
				d_toht_kl_ala.koulutusala2002_koodi)
				then 'K' else 'E' end else '-1' end
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_avain = Case when 'K' in
			(opist_myohempi_tutkinto_suoritettu,
			ammka_myohempi_tutkinto_suoritettu)
			then 'opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi in (
				d_opist_kl_ala.koulutusala2002_koodi,
				d_ammka_kl_ala.koulutusala2002_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,korkeakoulututkinto_sama_myohempi_koulutusala2002_avain = Case when 'K' in
			(amk_myohempi_tutkinto_suoritettu,
			ylamk_myohempi_tutkinto_suoritettu,
			akk_myohempi_tutkinto_suoritettu,
			ykk_myohempi_tutkinto_suoritettu,
			laaker_myohempi_tutkinto_suoritettu)
			then 'korkeakoulututkinto_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi in (
				d_amk_kl_ala.koulutusala2002_koodi,
				d_ylamk_kl_ala.koulutusala2002_koodi,
				d_akk_kl_ala.koulutusala2002_koodi,
				d_ykk_kl_ala.koulutusala2002_koodi,
				d_laaker_kl_ala.koulutusala2002_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_avain = Case when 'K' in
			(lu_myohempi_tutkinto_suoritettu,
			amm_myohempi_tutkinto_suoritettu)
			then 'toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_' + Case when d_kl_ala.koulutusala2002_koodi in (
				d_lu_kl_ala.koulutusala2002_koodi,
				d_amm_kl_ala.koulutusala2002_koodi)
				  then 'K' else 'E' end else '-1' end

	  ,lu_sama_myohempi_opintoala2002_avain = Case when lu_myohempi_tutkinto_suoritettu = 'K' then 'lu_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi = d_lu_kl_ala.opintoala2002_koodi then 'K' else 'E' end else '-1' end
	  ,amm_sama_myohempi_opintoala2002_avain = Case when amm_myohempi_tutkinto_suoritettu = 'K' then 'amm_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi = d_amm_kl_ala.opintoala2002_koodi then 'K' else 'E' end else '-1' end
	  ,opist_sama_myohempi_opintoala2002_avain = Case when opist_myohempi_tutkinto_suoritettu = 'K' then 'opist_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi = d_opist_kl_ala.opintoala2002_koodi then 'K' else 'E' end else '-1' end
	  ,ammka_sama_myohempi_opintoala2002_avain = Case when ammka_myohempi_tutkinto_suoritettu = 'K' then 'ammka_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi = d_ammka_kl_ala.opintoala2002_koodi then 'K' else 'E' end else '-1' end
	  ,akk_sama_myohempi_opintoala2002_avain = Case when akk_myohempi_tutkinto_suoritettu = 'K' then 'akk_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi = d_akk_kl_ala.opintoala2002_koodi then 'K' else 'E' end else '-1' end
	  ,amk_sama_myohempi_opintoala2002_avain = Case when amk_myohempi_tutkinto_suoritettu = 'K' then 'amk_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi = d_amk_kl_ala.opintoala2002_koodi then 'K' else 'E' end else '-1' end
	  ,ylamk_sama_myohempi_opintoala2002_avain = Case when ylamk_myohempi_tutkinto_suoritettu = 'K' then 'ylamk_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi = d_ylamk_kl_ala.opintoala2002_koodi then 'K' else 'E' end else '-1' end
	  ,ykk_sama_myohempi_opintoala2002_avain = Case when ykk_myohempi_tutkinto_suoritettu = 'K' then 'ykk_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi = d_ykk_kl_ala.opintoala2002_koodi then 'K' else 'E' end else '-1' end
	  ,laaker_sama_myohempi_opintoala2002_avain = Case when laaker_myohempi_tutkinto_suoritettu = 'K' then 'laaker_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi = d_laaker_kl_ala.opintoala2002_koodi then 'K' else 'E' end else '-1' end
	  ,lis_sama_myohempi_opintoala2002_avain = Case when lis_myohempi_tutkinto_suoritettu = 'K' then 'lis_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi = d_lis_kl_ala.opintoala2002_koodi then 'K' else 'E' end else '-1' end
	  ,toht_sama_myohempi_opintoala2002_avain = Case when toht_myohempi_tutkinto_suoritettu = 'K' then 'toht_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi = d_toht_kl_ala.opintoala2002_koodi then 'K' else 'E' end else '-1' end
	  ,yliopistotutkinto_sama_myohempi_opintoala2002_avain = Case when 'K' in
			(akk_myohempi_tutkinto_suoritettu,
			ykk_myohempi_tutkinto_suoritettu,
			laaker_myohempi_tutkinto_suoritettu)
			then 'yliopistotutkinto_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi in (
				d_akk_kl_ala.opintoala2002_koodi,
				d_ykk_kl_ala.opintoala2002_koodi,
				d_laaker_kl_ala.opintoala2002_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,yo_jatkotutkinto_sama_myohempi_opintoala2002_avain = Case when 'K' in
			(lis_myohempi_tutkinto_suoritettu,
			toht_myohempi_tutkinto_suoritettu)
			then 'yo_jatkotutkinto_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi in (
				d_lis_kl_ala.opintoala2002_koodi,
				d_toht_kl_ala.opintoala2002_koodi)
				then 'K' else 'E' end else '-1' end
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_avain = Case when 'K' in
			(opist_myohempi_tutkinto_suoritettu,
			ammka_myohempi_tutkinto_suoritettu)
			then 'opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi in (
				d_opist_kl_ala.opintoala2002_koodi,
				d_ammka_kl_ala.opintoala2002_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,korkeakoulututkinto_sama_myohempi_opintoala2002_avain = Case when 'K' in
			(amk_myohempi_tutkinto_suoritettu,
			ylamk_myohempi_tutkinto_suoritettu,
			akk_myohempi_tutkinto_suoritettu,
			ykk_myohempi_tutkinto_suoritettu,
			laaker_myohempi_tutkinto_suoritettu)
			then 'korkeakoulututkinto_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi in (
				d_amk_kl_ala.opintoala2002_koodi,
				d_ylamk_kl_ala.opintoala2002_koodi,
				d_akk_kl_ala.opintoala2002_koodi,
				d_ykk_kl_ala.opintoala2002_koodi,
				d_laaker_kl_ala.opintoala2002_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,toisen_asteen_tutkinto_sama_myohempi_opintoala2002_avain = Case when 'K' in
			(lu_myohempi_tutkinto_suoritettu,
			amm_myohempi_tutkinto_suoritettu)
			then 'toisen_asteen_tutkinto_sama_myohempi_opintoala2002_' + Case when d_kl_ala.opintoala2002_koodi in (
				d_lu_kl_ala.opintoala2002_koodi,
				d_amm_kl_ala.opintoala2002_koodi)
				  then 'K' else 'E' end else '-1' end

	  ,lu_sama_myohempi_opintoala1995_avain = Case when lu_myohempi_tutkinto_suoritettu = 'K' then 'lu_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi = d_lu_kl_ala.opintoala1995_koodi then 'K' else 'E' end else '-1' end
	  ,amm_sama_myohempi_opintoala1995_avain = Case when amm_myohempi_tutkinto_suoritettu = 'K' then 'amm_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi = d_amm_kl_ala.opintoala1995_koodi then 'K' else 'E' end else '-1' end
	  ,opist_sama_myohempi_opintoala1995_avain = Case when opist_myohempi_tutkinto_suoritettu = 'K' then 'opist_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi = d_opist_kl_ala.opintoala1995_koodi then 'K' else 'E' end else '-1' end
	  ,ammka_sama_myohempi_opintoala1995_avain = Case when ammka_myohempi_tutkinto_suoritettu = 'K' then 'ammka_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi = d_ammka_kl_ala.opintoala1995_koodi then 'K' else 'E' end else '-1' end
	  ,akk_sama_myohempi_opintoala1995_avain = Case when akk_myohempi_tutkinto_suoritettu = 'K' then 'akk_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi = d_akk_kl_ala.opintoala1995_koodi then 'K' else 'E' end else '-1' end
	  ,amk_sama_myohempi_opintoala1995_avain = Case when amk_myohempi_tutkinto_suoritettu = 'K' then 'amk_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi = d_amk_kl_ala.opintoala1995_koodi then 'K' else 'E' end else '-1' end
	  ,ylamk_sama_myohempi_opintoala1995_avain = Case when ylamk_myohempi_tutkinto_suoritettu = 'K' then 'ylamk_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi = d_ylamk_kl_ala.opintoala1995_koodi then 'K' else 'E' end else '-1' end
	  ,ykk_sama_myohempi_opintoala1995_avain = Case when ykk_myohempi_tutkinto_suoritettu = 'K' then 'ykk_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi = d_ykk_kl_ala.opintoala1995_koodi then 'K' else 'E' end else '-1' end
	  ,laaker_sama_myohempi_opintoala1995_avain = Case when laaker_myohempi_tutkinto_suoritettu = 'K' then 'laaker_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi = d_laaker_kl_ala.opintoala1995_koodi then 'K' else 'E' end else '-1' end
	  ,lis_sama_myohempi_opintoala1995_avain = Case when lis_myohempi_tutkinto_suoritettu = 'K' then 'lis_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi = d_lis_kl_ala.opintoala1995_koodi then 'K' else 'E' end else '-1' end
	  ,toht_sama_myohempi_opintoala1995_avain = Case when toht_myohempi_tutkinto_suoritettu = 'K' then 'toht_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi = d_toht_kl_ala.opintoala1995_koodi then 'K' else 'E' end else '-1' end
	  ,yliopistotutkinto_sama_myohempi_opintoala1995_avain = Case when 'K' in
			(akk_myohempi_tutkinto_suoritettu,
			ykk_myohempi_tutkinto_suoritettu,
			laaker_myohempi_tutkinto_suoritettu)
			then 'yliopistotutkinto_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi in (
				d_akk_kl_ala.opintoala1995_koodi,
				d_ykk_kl_ala.opintoala1995_koodi,
				d_laaker_kl_ala.opintoala1995_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,yo_jatkotutkinto_sama_myohempi_opintoala1995_avain = Case when 'K' in
			(lis_myohempi_tutkinto_suoritettu,
			toht_myohempi_tutkinto_suoritettu)
			then 'yo_jatkotutkinto_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi in (
				d_lis_kl_ala.opintoala1995_koodi,
				d_toht_kl_ala.opintoala1995_koodi)
				then 'K' else 'E' end else '-1' end
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_avain = Case when 'K' in
			(opist_myohempi_tutkinto_suoritettu,
			ammka_myohempi_tutkinto_suoritettu)
			then 'opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi in (
				d_opist_kl_ala.opintoala1995_koodi,
				d_ammka_kl_ala.opintoala1995_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,korkeakoulututkinto_sama_myohempi_opintoala1995_avain = Case when 'K' in
			(amk_myohempi_tutkinto_suoritettu,
			ylamk_myohempi_tutkinto_suoritettu,
			akk_myohempi_tutkinto_suoritettu,
			ykk_myohempi_tutkinto_suoritettu,
			laaker_myohempi_tutkinto_suoritettu)
			then 'korkeakoulututkinto_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi in (
				d_amk_kl_ala.opintoala1995_koodi,
				d_ylamk_kl_ala.opintoala1995_koodi,
				d_akk_kl_ala.opintoala1995_koodi,
				d_ykk_kl_ala.opintoala1995_koodi,
				d_laaker_kl_ala.opintoala1995_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,toisen_asteen_tutkinto_sama_myohempi_opintoala1995_avain = Case when 'K' in
			(lu_myohempi_tutkinto_suoritettu,
			amm_myohempi_tutkinto_suoritettu)
			then 'toisen_asteen_tutkinto_sama_myohempi_opintoala1995_' + Case when d_kl_ala.opintoala1995_koodi in (
				d_lu_kl_ala.opintoala1995_koodi,
				d_amm_kl_ala.opintoala1995_koodi)
				  then 'K' else 'E' end else '-1' end

	  ,lu_sama_myohempi_iscfibroad2013_avain = Case when lu_myohempi_tutkinto_suoritettu = 'K' then 'lu_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi = d_lu_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end else '-1' end
	  ,amm_sama_myohempi_iscfibroad2013_avain = Case when amm_myohempi_tutkinto_suoritettu = 'K' then 'amm_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi = d_amm_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end else '-1' end
	  ,opist_sama_myohempi_iscfibroad2013_avain = Case when opist_myohempi_tutkinto_suoritettu = 'K' then 'opist_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi = d_opist_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end else '-1' end
	  ,ammka_sama_myohempi_iscfibroad2013_avain = Case when ammka_myohempi_tutkinto_suoritettu = 'K' then 'ammka_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi = d_ammka_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end else '-1' end
	  ,akk_sama_myohempi_iscfibroad2013_avain = Case when akk_myohempi_tutkinto_suoritettu = 'K' then 'akk_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi = d_akk_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end else '-1' end
	  ,amk_sama_myohempi_iscfibroad2013_avain = Case when amk_myohempi_tutkinto_suoritettu = 'K' then 'amk_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi = d_amk_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end else '-1' end
	  ,ylamk_sama_myohempi_iscfibroad2013_avain = Case when ylamk_myohempi_tutkinto_suoritettu = 'K' then 'ylamk_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi = d_ylamk_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end else '-1' end
	  ,ykk_sama_myohempi_iscfibroad2013_avain = Case when ykk_myohempi_tutkinto_suoritettu = 'K' then 'ykk_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi = d_ykk_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end else '-1' end
	  ,laaker_sama_myohempi_iscfibroad2013_avain = Case when laaker_myohempi_tutkinto_suoritettu = 'K' then 'laaker_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi = d_laaker_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end else '-1' end
	  ,lis_sama_myohempi_iscfibroad2013_avain = Case when lis_myohempi_tutkinto_suoritettu = 'K' then 'lis_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi = d_lis_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end else '-1' end
	  ,toht_sama_myohempi_iscfibroad2013_avain = Case when toht_myohempi_tutkinto_suoritettu = 'K' then 'toht_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi = d_toht_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end else '-1' end
	  ,yliopistotutkinto_sama_myohempi_iscfibroad2013_avain = Case when 'K' in
			(akk_myohempi_tutkinto_suoritettu,
			ykk_myohempi_tutkinto_suoritettu,
			laaker_myohempi_tutkinto_suoritettu)
			then 'yliopistotutkinto_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi in (
				d_akk_kl_ala.iscfibroad2013_koodi,
				d_ykk_kl_ala.iscfibroad2013_koodi,
				d_laaker_kl_ala.iscfibroad2013_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,yo_jatkotutkinto_sama_myohempi_iscfibroad2013_avain = Case when 'K' in
			(lis_myohempi_tutkinto_suoritettu,
			toht_myohempi_tutkinto_suoritettu)
			then 'yo_jatkotutkinto_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi in (
				d_lis_kl_ala.iscfibroad2013_koodi,
				d_toht_kl_ala.iscfibroad2013_koodi)
				then 'K' else 'E' end else '-1' end
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain = Case when 'K' in
			(opist_myohempi_tutkinto_suoritettu,
			ammka_myohempi_tutkinto_suoritettu)
			then 'opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi in (
				d_opist_kl_ala.iscfibroad2013_koodi,
				d_ammka_kl_ala.iscfibroad2013_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,korkeakoulututkinto_sama_myohempi_iscfibroad2013_avain = Case when 'K' in
			(amk_myohempi_tutkinto_suoritettu,
			ylamk_myohempi_tutkinto_suoritettu,
			akk_myohempi_tutkinto_suoritettu,
			ykk_myohempi_tutkinto_suoritettu,
			laaker_myohempi_tutkinto_suoritettu)
			then 'korkeakoulututkinto_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi in (
				d_amk_kl_ala.iscfibroad2013_koodi,
				d_ylamk_kl_ala.iscfibroad2013_koodi,
				d_akk_kl_ala.iscfibroad2013_koodi,
				d_ykk_kl_ala.iscfibroad2013_koodi,
				d_laaker_kl_ala.iscfibroad2013_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain = Case when 'K' in
			(lu_myohempi_tutkinto_suoritettu,
			amm_myohempi_tutkinto_suoritettu)
			then 'toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_' + Case when d_kl_ala.iscfibroad2013_koodi in (
				d_lu_kl_ala.iscfibroad2013_koodi,
				d_amm_kl_ala.iscfibroad2013_koodi)
				  then 'K' else 'E' end else '-1' end

	  ,lu_sama_myohempi_iscfinarrow2013_avain = Case when lu_myohempi_tutkinto_suoritettu = 'K' then 'lu_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi = d_lu_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end else '-1' end
	  ,amm_sama_myohempi_iscfinarrow2013_avain = Case when amm_myohempi_tutkinto_suoritettu = 'K' then 'amm_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi = d_amm_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end else '-1' end
	  ,opist_sama_myohempi_iscfinarrow2013_avain = Case when opist_myohempi_tutkinto_suoritettu = 'K' then 'opist_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi = d_opist_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end else '-1' end
	  ,ammka_sama_myohempi_iscfinarrow2013_avain = Case when ammka_myohempi_tutkinto_suoritettu = 'K' then 'ammka_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi = d_ammka_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end else '-1' end
	  ,akk_sama_myohempi_iscfinarrow2013_avain = Case when akk_myohempi_tutkinto_suoritettu = 'K' then 'akk_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi = d_akk_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end else '-1' end
	  ,amk_sama_myohempi_iscfinarrow2013_avain = Case when amk_myohempi_tutkinto_suoritettu = 'K' then 'amk_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi = d_amk_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end else '-1' end
	  ,ylamk_sama_myohempi_iscfinarrow2013_avain = Case when ylamk_myohempi_tutkinto_suoritettu = 'K' then 'ylamk_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi = d_ylamk_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end else '-1' end
	  ,ykk_sama_myohempi_iscfinarrow2013_avain = Case when ykk_myohempi_tutkinto_suoritettu = 'K' then 'ykk_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi = d_ykk_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end else '-1' end
	  ,laaker_sama_myohempi_iscfinarrow2013_avain = Case when laaker_myohempi_tutkinto_suoritettu = 'K' then 'laaker_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi = d_laaker_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end else '-1' end
	  ,lis_sama_myohempi_iscfinarrow2013_avain = Case when lis_myohempi_tutkinto_suoritettu = 'K' then 'lis_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi = d_lis_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end else '-1' end
	  ,toht_sama_myohempi_iscfinarrow2013_avain = Case when toht_myohempi_tutkinto_suoritettu = 'K' then 'toht_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi = d_toht_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end else '-1' end
	  ,yliopistotutkinto_sama_myohempi_iscfinarrow2013_avain = Case when 'K' in
			(akk_myohempi_tutkinto_suoritettu,
			ykk_myohempi_tutkinto_suoritettu,
			laaker_myohempi_tutkinto_suoritettu)
			then 'yliopistotutkinto_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi in (
				d_akk_kl_ala.iscfinarrow2013_koodi,
				d_ykk_kl_ala.iscfinarrow2013_koodi,
				d_laaker_kl_ala.iscfinarrow2013_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_avain = Case when 'K' in
			(lis_myohempi_tutkinto_suoritettu,
			toht_myohempi_tutkinto_suoritettu)
			then 'yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi in (
				d_lis_kl_ala.iscfinarrow2013_koodi,
				d_toht_kl_ala.iscfinarrow2013_koodi)
				then 'K' else 'E' end else '-1' end
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain = Case when 'K' in
			(opist_myohempi_tutkinto_suoritettu,
			ammka_myohempi_tutkinto_suoritettu)
			then 'opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi in (
				d_opist_kl_ala.iscfinarrow2013_koodi,
				d_ammka_kl_ala.iscfinarrow2013_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,korkeakoulututkinto_sama_myohempi_iscfinarrow2013_avain = Case when 'K' in
			(amk_myohempi_tutkinto_suoritettu,
			ylamk_myohempi_tutkinto_suoritettu,
			akk_myohempi_tutkinto_suoritettu,
			ykk_myohempi_tutkinto_suoritettu,
			laaker_myohempi_tutkinto_suoritettu)
			then 'korkeakoulututkinto_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi in (
				d_amk_kl_ala.iscfinarrow2013_koodi,
				d_ylamk_kl_ala.iscfinarrow2013_koodi,
				d_akk_kl_ala.iscfinarrow2013_koodi,
				d_ykk_kl_ala.iscfinarrow2013_koodi,
				d_laaker_kl_ala.iscfinarrow2013_koodi)
				  then 'K' else 'E' end else '-1' end
	  ,toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain = Case when 'K' in
			(lu_myohempi_tutkinto_suoritettu,
			amm_myohempi_tutkinto_suoritettu)
			then 'toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_' + Case when d_kl_ala.iscfinarrow2013_koodi in (
				d_lu_kl_ala.iscfinarrow2013_koodi,
				d_amm_kl_ala.iscfinarrow2013_koodi)
				  then 'K' else 'E' end else '-1' end

/*
	  ,lu_sama_myohempi_koulutusala2002 =  Case when d_kl_ala.koulutusala2002_koodi = d_lu_kl_ala.koulutusala2002_koodi then 'K' else 'E' end
	  ,amm_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi = d_amm_kl_ala.koulutusala2002_koodi then 'K' else 'E' end
	  ,opist_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi = d_opist_kl_ala.koulutusala2002_koodi then 'K' else 'E' end
	  ,ammka_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi = d_ammka_kl_ala.koulutusala2002_koodi then 'K' else 'E' end
	  ,akk_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi = d_akk_kl_ala.koulutusala2002_koodi then 'K' else 'E' end
	  ,amk_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi = d_amk_kl_ala.koulutusala2002_koodi then 'K' else 'E' end
	  ,ylamk_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi = d_ylamk_kl_ala.koulutusala2002_koodi then 'K' else 'E' end
	  ,ykk_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi = d_ykk_kl_ala.koulutusala2002_koodi then 'K' else 'E' end
	  ,laaker_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi = d_laaker_kl_ala.koulutusala2002_koodi then 'K' else 'E' end
	  ,lis_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi = d_lis_kl_ala.koulutusala2002_koodi then 'K' else 'E' end
	  ,toht_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi = d_toht_kl_ala.koulutusala2002_koodi then 'K' else 'E' end
	  ,yliopistotutkinto_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi in (
			d_akk_kl_ala.koulutusala2002_koodi,
			d_ykk_kl_ala.koulutusala2002_koodi,
			d_laaker_kl_ala.koulutusala2002_koodi)
			  then 'K' else 'E' end
	  ,yo_jatkotutkinto_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi in (
			d_lis_kl_ala.koulutusala2002_koodi,
			d_toht_kl_ala.koulutusala2002_koodi)
			  then 'K' else 'E' end
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi in (
			d_opist_kl_ala.koulutusala2002_koodi,
			d_ammka_kl_ala.koulutusala2002_koodi)
			  then 'K' else 'E' end
	  ,korkeakoulututkinto_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi in (
			d_amk_kl_ala.koulutusala2002_koodi,
			d_ylamk_kl_ala.koulutusala2002_koodi,
			d_akk_kl_ala.koulutusala2002_koodi,
			d_ykk_kl_ala.koulutusala2002_koodi,
			d_laaker_kl_ala.koulutusala2002_koodi)
			  then 'K' else 'E' end
	  ,toisen_asteen_tutkinto_sama_myohempi_koulutusala2002 = Case when d_kl_ala.koulutusala2002_koodi in (
			d_lu_kl_ala.koulutusala2002_koodi,
			d_amm_kl_ala.koulutusala2002_koodi)
			  then 'K' else 'E' end


	  ,lu_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi = d_lu_kl_ala.opintoala2002_koodi then 'K' else 'E' end
	  ,amm_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi = d_amm_kl_ala.opintoala2002_koodi then 'K' else 'E' end
	  ,opist_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi = d_opist_kl_ala.opintoala2002_koodi then 'K' else 'E' end
	  ,ammka_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi = d_ammka_kl_ala.opintoala2002_koodi then 'K' else 'E' end
	  ,akk_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi = d_akk_kl_ala.opintoala2002_koodi then 'K' else 'E' end
	  ,amk_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi = d_amk_kl_ala.opintoala2002_koodi then 'K' else 'E' end
	  ,ylamk_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi = d_ylamk_kl_ala.opintoala2002_koodi then 'K' else 'E' end
	  ,ykk_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi = d_ykk_kl_ala.opintoala2002_koodi then 'K' else 'E' end
	  ,laaker_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi = d_laaker_kl_ala.opintoala2002_koodi then 'K' else 'E' end
	  ,lis_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi = d_lis_kl_ala.opintoala2002_koodi then 'K' else 'E' end
	  ,toht_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi = d_toht_kl_ala.opintoala2002_koodi then 'K' else 'E' end
	  ,yliopistotutkinto_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi in (
			d_akk_kl_ala.opintoala2002_koodi,
			d_ykk_kl_ala.opintoala2002_koodi,
			d_laaker_kl_ala.opintoala2002_koodi)
			  then 'K' else 'E' end
	  ,yo_jatkotutkinto_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi in (
			d_lis_kl_ala.opintoala2002_koodi,
			d_toht_kl_ala.opintoala2002_koodi)
			  then 'K' else 'E' end
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi in (
			d_opist_kl_ala.opintoala2002_koodi,
			d_ammka_kl_ala.opintoala2002_koodi)
			  then 'K' else 'E' end
	  ,korkeakoulututkinto_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi in (
			d_amk_kl_ala.opintoala2002_koodi,
			d_ylamk_kl_ala.opintoala2002_koodi,
			d_akk_kl_ala.opintoala2002_koodi,
			d_ykk_kl_ala.opintoala2002_koodi,
			d_laaker_kl_ala.opintoala2002_koodi)
			  then 'K' else 'E' end
	  ,toisen_asteen_tutkinto_sama_myohempi_opintoala2002 = Case when d_kl_ala.opintoala2002_koodi in (
			d_lu_kl_ala.opintoala2002_koodi,
			d_amm_kl_ala.opintoala2002_koodi)
			  then 'K' else 'E' end

	  ,lu_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi = d_lu_kl_ala.opintoala1995_koodi then 'K' else 'E' end
	  ,amm_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi = d_amm_kl_ala.opintoala1995_koodi then 'K' else 'E' end
	  ,opist_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi = d_opist_kl_ala.opintoala1995_koodi then 'K' else 'E' end
	  ,ammka_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi = d_ammka_kl_ala.opintoala1995_koodi then 'K' else 'E' end
	  ,akk_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi = d_akk_kl_ala.opintoala1995_koodi then 'K' else 'E' end
	  ,amk_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi = d_amk_kl_ala.opintoala1995_koodi then 'K' else 'E' end
	  ,ylamk_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi = d_ylamk_kl_ala.opintoala1995_koodi then 'K' else 'E' end
	  ,ykk_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi = d_ykk_kl_ala.opintoala1995_koodi then 'K' else 'E' end
	  ,laaker_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi = d_laaker_kl_ala.opintoala1995_koodi then 'K' else 'E' end
	  ,lis_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi = d_lis_kl_ala.opintoala1995_koodi then 'K' else 'E' end
	  ,toht_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi = d_toht_kl_ala.opintoala1995_koodi then 'K' else 'E' end
	  ,yliopistotutkinto_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi in (
			d_akk_kl_ala.opintoala1995_koodi,
			d_ykk_kl_ala.opintoala1995_koodi,
			d_laaker_kl_ala.opintoala1995_koodi)
			  then 'K' else 'E' end
	  ,yo_jatkotutkinto_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi in (
			d_lis_kl_ala.opintoala1995_koodi,
			d_toht_kl_ala.opintoala1995_koodi)
			  then 'K' else 'E' end
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi in (
			d_opist_kl_ala.opintoala1995_koodi,
			d_ammka_kl_ala.opintoala1995_koodi)
			  then 'K' else 'E' end
	  ,korkeakoulututkinto_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi in (
			d_amk_kl_ala.opintoala1995_koodi,
			d_ylamk_kl_ala.opintoala1995_koodi,
			d_akk_kl_ala.opintoala1995_koodi,
			d_ykk_kl_ala.opintoala1995_koodi,
			d_laaker_kl_ala.opintoala1995_koodi)
			  then 'K' else 'E' end
	  ,toisen_asteen_tutkinto_sama_myohempi_opintoala1995 = Case when d_kl_ala.opintoala1995_koodi in (
			d_lu_kl_ala.opintoala1995_koodi,
			d_amm_kl_ala.opintoala1995_koodi)
			  then 'K' else 'E' end

--lisätään vielä iscfibroad2013

	  ,lu_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi = d_lu_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end
	  ,amm_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi = d_amm_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end
	  ,opist_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi = d_opist_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end
	  ,ammka_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi = d_ammka_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end
	  ,akk_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi = d_akk_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end
	  ,amk_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi = d_amk_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end
	  ,ylamk_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi = d_ylamk_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end
	  ,ykk_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi = d_ykk_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end
	  ,laaker_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi = d_laaker_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end
	  ,lis_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi = d_lis_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end
	  ,toht_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi = d_toht_kl_ala.iscfibroad2013_koodi then 'K' else 'E' end
	  ,yliopistotutkinto_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi in (
			d_akk_kl_ala.iscfibroad2013_koodi,
			d_ykk_kl_ala.iscfibroad2013_koodi,
			d_laaker_kl_ala.iscfibroad2013_koodi)
			  then 'K' else 'E' end
	  ,yo_jatkotutkinto_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi in (
			d_lis_kl_ala.iscfibroad2013_koodi,
			d_toht_kl_ala.iscfibroad2013_koodi)
			  then 'K' else 'E' end
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi in (
			d_opist_kl_ala.iscfibroad2013_koodi,
			d_ammka_kl_ala.iscfibroad2013_koodi)
			  then 'K' else 'E' end
	  ,korkeakoulututkinto_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi in (
			d_amk_kl_ala.iscfibroad2013_koodi,
			d_ylamk_kl_ala.iscfibroad2013_koodi,
			d_akk_kl_ala.iscfibroad2013_koodi,
			d_ykk_kl_ala.iscfibroad2013_koodi,
			d_laaker_kl_ala.iscfibroad2013_koodi)
			  then 'K' else 'E' end
	  ,toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013 = Case when d_kl_ala.iscfibroad2013_koodi in (
			d_lu_kl_ala.iscfibroad2013_koodi,
			d_amm_kl_ala.iscfibroad2013_koodi)
			  then 'K' else 'E' end

--lisätään vielä iscfinarrow2013

	  ,lu_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi = d_lu_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end
	  ,amm_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi = d_amm_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end
	  ,opist_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi = d_opist_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end
	  ,ammka_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi = d_ammka_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end
	  ,akk_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi = d_akk_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end
	  ,amk_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi = d_amk_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end
	  ,ylamk_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi = d_ylamk_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end
	  ,ykk_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi = d_ykk_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end
	  ,laaker_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi = d_laaker_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end
	  ,lis_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi = d_lis_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end
	  ,toht_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi = d_toht_kl_ala.iscfinarrow2013_koodi then 'K' else 'E' end
	  ,yliopistotutkinto_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi in (
			d_akk_kl_ala.iscfinarrow2013_koodi,
			d_ykk_kl_ala.iscfinarrow2013_koodi,
			d_laaker_kl_ala.iscfinarrow2013_koodi)
			  then 'K' else 'E' end
	  ,yo_jatkotutkinto_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi in (
			d_lis_kl_ala.iscfinarrow2013_koodi,
			d_toht_kl_ala.iscfinarrow2013_koodi)
			  then 'K' else 'E' end
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi in (
			d_opist_kl_ala.iscfinarrow2013_koodi,
			d_ammka_kl_ala.iscfinarrow2013_koodi)
			  then 'K' else 'E' end
	  ,korkeakoulututkinto_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi in (
			d_amk_kl_ala.iscfinarrow2013_koodi,
			d_ylamk_kl_ala.iscfinarrow2013_koodi,
			d_akk_kl_ala.iscfinarrow2013_koodi,
			d_ykk_kl_ala.iscfinarrow2013_koodi,
			d_laaker_kl_ala.iscfinarrow2013_koodi)
			  then 'K' else 'E' end
	  ,toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013 = Case when d_kl_ala.iscfinarrow2013_koodi in (
			d_lu_kl_ala.iscfinarrow2013_koodi,
			d_amm_kl_ala.iscfinarrow2013_koodi)
			  then 'K' else 'E' end
*/
--into VipunenTK_DW.dbo._f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8
  FROM [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_kl_ala
		ON d_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.koulutusluokitus_avain
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_lu_kl_ala
		ON d_lu_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.lukoulk
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_amm_kl_ala
		ON d_amm_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.ammkoulk
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_opist_kl_ala
		ON d_opist_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.opistkoulk
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_ammka_kl_ala
		ON d_ammka_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.ammkakoulk
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_akk_kl_ala
		ON d_akk_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.akkkoulk
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_amk_kl_ala
		ON d_amk_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.amkkoulk
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_ylamk_kl_ala
		ON d_ylamk_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.ylamkkoulk
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_ykk_kl_ala
		ON d_ykk_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.ykkkoulk
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_laaker_kl_ala
		ON d_laaker_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.laakerkoulk
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_lis_kl_ala
		ON d_lis_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.liskoulk
	LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_toht_kl_ala
		ON d_toht_kl_ala.koulutusluokitus_avain = f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8.tohtkoulk



Truncate table VipunenTK_DW.dbo._VipunenTK_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8

INSERT INTO VipunenTK_DW.dbo._VipunenTK_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8
SELECT --top 0
	   [tilastovuosi]
      ,[tilv_date]
	  ,f.tarkastelujakso_koodi
	  ,[tarkastelujakso_id] = ISNULL(d_tj.id, -2)
      ,f.[sukupuoli_koodi]
      ,[sukupuoli_id] = ISNULL(d_sp.id, -1)
      ,f.[aidinkieli_versio1_koodi]
      ,[aidinkieli_id] = ISNULL(d_ak1.id, -1)
      ,[suorv]
      ,[suorlk]
      ,[suorituskausikoodi]
      ,[suorituskausi_id] = ISNULL(d_suo.kausi_id, -1)
      ,f.[koulutusluokitus_avain]
      ,[koulutusluokitus_id] = ISNULL(d_kl.id, -1)
      ,[alvv]
      ,[allk]
      ,[aloituskausikoodi]
      ,[aloituskausi_id] = ISNULL(d_alo.kausi_id, -1)
      ,f.[oppisopimuskoulutus_koodi]
      ,[oppisopimuskoulutus_id] = ISNULL(d_osk.id, -1)
      ,f.[ammatillisen_koulutuksen_koulutuslaji_koodi]
      ,[ammatillisen_koulutuksen_koulutuslaji_id] = ISNULL(d_akk.id, -1)
      ,f.[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi]
      ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id] = ISNULL(d_on.id, -1)
      ,f.[nuorten_aikuisten_koulutus_amm_koodi]
      ,[nuorten_aikuisten_koulutus_amm_id] = ISNULL(d_na.id, -1)
      ,[syntv]
      ,f.[ika_avain]
      ,[ika_id] = ISNULL(d_ika.id, -1)
      ,[henkiloiden_lkm]
      --,[lulkm]
      ,[lu_henkiloiden_lkm] = Case when lulkm > 0 then henkiloiden_lkm else 0 end
      ,[lukoulk]
      ,[lu_myohempi_koulutusluokitus_id] = isnull(d_lu_kl.id, -1)
      ,[lusuorv]
      ,[luaikoul]
      ,[lu_nuorten_aikuisten_koulutus_amm_id] = ISNULL(d_lu_na.id, -1)
      ,[lu_ika]
	  ,lu_ika_id = isnull(d_lu_ika.id, -1)
      ,[lu_myohempi_tutkinto_suoritettu]
      ,[lu_myohempi_tutkinto_suoritettu_id] = isnull(d_lu_ts.id, -2)
      --,[ammlkm]
      ,[ammlkm_id] = isnull(d_amm_tm.id, -2)
      ,[amm_henkiloiden_lkm] = Case when ammlkm > 0 then henkiloiden_lkm else 0 end
      ,[ammkoulk]
      ,[amm_myohempi_koulutusluokitus_id] = isnull(d_amm_kl.id, -1)
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammoppis_id] = isnull(d_amm_osk.id, -1)
      ,[ammtutklaja]
      ,[ammtutklaja_id] = isnull(d_amm_akk.id, -1)
      ,[ammtutktav]
      ,[ammtutktav_id] = isnull(d_amm_on.id, -1)
      ,[ammatillinen_koulutus_ryhma]
      ,[ammatillinen_koulutus_ryhma_id] = isnull(d_ammkl.id, -1)
      ,[amm_ika]
	  ,amm_ika_id = isnull(d_amm_ika.id, -1)
      ,[amm_myohempi_tutkinto_suoritettu]
      ,[amm_myohempi_tutkinto_suoritettu_id] = isnull(d_amm_ts.id, -2)
      --,[opistlkm]
      ,[opist_henkiloiden_lkm] = Case when opistlkm > 0 then henkiloiden_lkm else 0 end
      ,[opistkoulk]
      ,[opist_myohempi_koulutusluokitus_id] = isnull(d_opist_kl.id, -1)
      ,[opistsuorv]
      ,[opist_ika]
	  ,opist_ika_id = isnull(d_opist_ika.id, -1)
      ,[opist_myohempi_tutkinto_suoritettu]
      ,[opist_myohempi_tutkinto_suoritettu_id] = isnull(d_opist_ts.id, -2)
      --,[ammkalkm]
      ,[ammka_henkiloiden_lkm] = Case when ammkalkm > 0 then henkiloiden_lkm else 0 end
      ,[ammkakoulk]
      ,[ammka_myohempi_koulutusluokitus_id] = isnull(d_ammka_kl.id, -1)
      ,[ammkasuorv]
      ,[ammka_ika]
	  ,ammka_ika_id = isnull(d_ammka_ika.id, -1)
      ,[ammka_myohempi_tutkinto_suoritettu]
      ,[ammka_myohempi_tutkinto_suoritettu_id] = isnull(d_ammka_ts.id, -2)
      --,[amklkm]
      ,[amklkm_id] = isnull(d_amk_tm.id, -2)
      ,[amk_henkiloiden_lkm] = Case when amklkm > 0 then henkiloiden_lkm else 0 end
      ,[amkkoulk]
      ,[amk_myohempi_koulutusluokitus_id] = isnull(d_amk_kl.id, -1)
      ,[amksuorv]
      ,[amkaikoul]
      ,[amkaikoul_id] = isnull(d_amk_na.id, -1)
      ,[amk_ika]
	  ,amk_ika_id = isnull(d_amk_ika.id, -1)
      ,[amk_myohempi_tutkinto_suoritettu]
      ,[amk_myohempi_tutkinto_suoritettu_id] = isnull(d_amk_ts.id, -2)
      --,[akklkm]
      ,[akklkm_id] = isnull(d_akk_tm.id, -2)
      ,[akk_henkiloiden_lkm] = Case when akklkm > 0 then henkiloiden_lkm else 0 end
      ,[akkkoulk]
      ,[akk_myohempi_koulutusluokitus_id] = isnull(d_akk_kl.id, -1)
      ,[akksuorv]
      ,[akk_ika]
	  ,akk_ika_id = isnull(d_akk_ika.id, -1)
      ,[akk_myohempi_tutkinto_suoritettu]
      ,[akk_myohempi_tutkinto_suoritettu_id] = isnull(d_akk_ts.id, -2)
      --,[ylamklkm]
      ,[ylamklkm_henkiloiden_lkm] = Case when ylamklkm > 0 then henkiloiden_lkm else 0 end
      ,[ylamkkoulk]
      ,[ylamk_myohempi_koulutusluokitus_id] = isnull(d_ylamk_kl.id, -1)
      ,[ylamksuorv]
      ,[ylamk_ika]
	  ,ylamk_ika_id = isnull(d_ylamk_ika.id, -1)
      ,[ylamk_myohempi_tutkinto_suoritettu]
      ,[ylamk_myohempi_tutkinto_suoritettu_id] = isnull(d_ylamk_ts.id, -2)
      --,[ykklkm]
      ,[ykklkm_id] = isnull(d_ykk_tm.id, -2)
      ,[ykk_henkiloiden_lkm] = Case when ykklkm > 0 then henkiloiden_lkm else 0 end
      ,[ykkkoulk]
      ,[ykk_myohempi_koulutusluokitus_id] = isnull(d_ykk_kl.id, -1)
      ,[ykksuorv]
      ,[ykk_ika]
	  ,ykk_ika_id = isnull(d_ykk_ika.id, -1)
      ,[ykk_myohempi_tutkinto_suoritettu]
      ,[ykk_myohempi_tutkinto_suoritettu_id] = isnull(d_ykk_ts.id, -2)
      --,[laakerlkm]
      ,[laaker_henkiloiden_lkm] = Case when laakerlkm > 0 then henkiloiden_lkm else 0 end
      ,[laakerkoulk]
      ,[laaker_myohempi_koulutusluokitus_id] = isnull(d_laaker_kl.id, -1)
      ,[laakersuorv]
      ,[laaker_ika]
	  ,laaker_ika_id = isnull(d_laaker_ika.id, -1)
      ,[laaker_myohempi_tutkinto_suoritettu]
      ,[laaker_myohempi_tutkinto_suoritettu_id] = isnull(d_laaker_ts.id, -2)
      --,[lislkm]
      ,[lis_henkiloiden_lkm] = Case when lislkm > 0 then henkiloiden_lkm else 0 end
      ,[liskoulk]
      ,[lis_myohempi_koulutusluokitus_id] = isnull(d_lis_kl.id, -1)
      ,[lissuorv]
      ,[lis_ika]
	  ,lis_ika_id = isnull(d_lis_ika.id, -1)
      ,[lis_myohempi_tutkinto_suoritettu]
      ,[lis_myohempi_tutkinto_suoritettu_id] = isnull(d_lis_ts.id, -2)
      --,[tohtlkm]
      ,[toht_henkiloiden_lkm] = Case when tohtlkm > 0 then henkiloiden_lkm else 0 end
      ,[tohtkoulk]
      ,[toht_myohempi_koulutusluokitus_id] = isnull(d_toht_kl.id, -1)
      ,[tohtsuorv]
      ,[toht_ika]
	  ,toht_ika_id = isnull(d_toht_ika.id, -1)
      ,[toht_myohempi_tutkinto_suoritettu]
      ,[toht_myohempi_tutkinto_suoritettu_id] = isnull(d_toht_ts.id, -2)

	  ,yliopistotutkinto_myohempi_suoritettu_id = isnull(d_yo_ts.id, -2)
	  ,yo_jatkotutkinto_myohempi_suoritettu_id = isnull(d_yojatko_ts.id, -2)
	  ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_myohempi_suoritettu_id = isnull(d_opammka_ts.id, -2)
	  ,korkeakoulututkinto_myohempi_suoritettu_id = isnull(d_kk_ts.id, -2)
	  ,toisen_asteen_tutkinto_myohempi_suoritettu_id = isnull(d_aste2_ts.id, -2)
		
	  ,ammatillisen_tutkinto_myohempi_suoritettu_ryhma1_id = isnull(d_amm_r1_ts.id, -2)
	  ,ammatillisen_tutkinto_myohempi_suoritettu_ryhma2_id = isnull(d_amm_r2_ts.id, -2)
	  ,ammatillisen_tutkinto_myohempi_suoritettu_ryhma3_id = isnull(d_amm_r3_ts.id, -2)

		-- koulutusasteiden yhteenlasketut (netotut) henkilöiden lukumäärät
	  ,myohemman_yliopistotutkinnon_suorittaneiden_lkm = Case 
		when yliopistotutkinto_myohempi_suoritettu = 'K' then henkiloiden_lkm else 0 end
	  ,myohemman_yo_jatkotutkinnon_suorittaneiden_lkm = Case  
		when yo_jatkotutkinto_myohempi_suoritettu = 'K' then henkiloiden_lkm else 0 end
	  ,myohemman_opisto_tai_ammatillisen_korkea_asteen_tutkinnon_suorittaneiden_lkm = Case 
		when opisto_tai_ammatillisen_korkea_asteen_tutkinto_myohempi_suoritettu = 'K' then henkiloiden_lkm else 0 end
	  ,myohemman_korkeakoulututkinnon_suorittaneiden_lkm = Case 
		when korkeakoulututkinto_myohempi_suoritettu = 'K' then henkiloiden_lkm else 0 end
	  ,myohemman_toisen_asteen_tutkinnon_suorittaneiden_lkm = Case 
		when toisen_asteen_tutkinto_myohempi_suoritettu = 'K' then henkiloiden_lkm else 0 end

	  ,myohemman_ammatillisen_tutkinnon_ryhma1_suorittaneiden_lkm = --32, ryhmä 1
		Case when ammatillisen_tutkinto_myohempi_suoritettu_ryhma1 = 'K' then henkiloiden_lkm else 0 end
	  ,myohemman_ammatillisen_tutkinnon_ryhma2_suorittaneiden_lkm = --32, ryhmä 1
		Case when ammatillisen_tutkinto_myohempi_suoritettu_ryhma2 = 'K' then henkiloiden_lkm else 0 end
	  ,myohemman_ammatillisen_tutkinnon_ryhma3_suorittaneiden_lkm = --32, ryhmä 1
		Case when ammatillisen_tutkinto_myohempi_suoritettu_ryhma3 = 'K' then henkiloiden_lkm else 0 end

		--Haetaan surrogaatit koulutusalan pysyvyydelle 
		/* Alla avaimet */
    ,lu_sama_myohempi_koulutusala2002_avain
    ,amm_sama_myohempi_koulutusala2002_avain
    ,opist_sama_myohempi_koulutusala2002_avain
    ,ammka_sama_myohempi_koulutusala2002_avain
    ,akk_sama_myohempi_koulutusala2002_avain
    ,amk_sama_myohempi_koulutusala2002_avain
    ,ylamk_sama_myohempi_koulutusala2002_avain
    ,ykk_sama_myohempi_koulutusala2002_avain
    ,laaker_sama_myohempi_koulutusala2002_avain
    ,lis_sama_myohempi_koulutusala2002_avain
    ,toht_sama_myohempi_koulutusala2002_avain
    ,yliopistotutkinto_sama_myohempi_koulutusala2002_avain
    ,yo_jatkotutkinto_sama_myohempi_koulutusala2002_avain
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_avain
    ,korkeakoulututkinto_sama_myohempi_koulutusala2002_avain
    ,toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_avain
    ,lu_sama_myohempi_opintoala2002_avain
    ,amm_sama_myohempi_opintoala2002_avain
    ,opist_sama_myohempi_opintoala2002_avain
    ,ammka_sama_myohempi_opintoala2002_avain
    ,akk_sama_myohempi_opintoala2002_avain
    ,amk_sama_myohempi_opintoala2002_avain
    ,ylamk_sama_myohempi_opintoala2002_avain
    ,ykk_sama_myohempi_opintoala2002_avain
    ,laaker_sama_myohempi_opintoala2002_avain
    ,lis_sama_myohempi_opintoala2002_avain
    ,toht_sama_myohempi_opintoala2002_avain
    ,yliopistotutkinto_sama_myohempi_opintoala2002_avain
    ,yo_jatkotutkinto_sama_myohempi_opintoala2002_avain
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_avain
    ,korkeakoulututkinto_sama_myohempi_opintoala2002_avain
    ,toisen_asteen_tutkinto_sama_myohempi_opintoala2002_avain
    ,lu_sama_myohempi_opintoala1995_avain
    ,amm_sama_myohempi_opintoala1995_avain
    ,opist_sama_myohempi_opintoala1995_avain
    ,ammka_sama_myohempi_opintoala1995_avain
    ,akk_sama_myohempi_opintoala1995_avain
    ,amk_sama_myohempi_opintoala1995_avain
    ,ylamk_sama_myohempi_opintoala1995_avain
    ,ykk_sama_myohempi_opintoala1995_avain
    ,laaker_sama_myohempi_opintoala1995_avain
    ,lis_sama_myohempi_opintoala1995_avain
    ,toht_sama_myohempi_opintoala1995_avain
    ,yliopistotutkinto_sama_myohempi_opintoala1995_avain
    ,yo_jatkotutkinto_sama_myohempi_opintoala1995_avain
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_avain
    ,korkeakoulututkinto_sama_myohempi_opintoala1995_avain
    ,toisen_asteen_tutkinto_sama_myohempi_opintoala1995_avain
    ,lu_sama_myohempi_iscfibroad2013_avain
    ,amm_sama_myohempi_iscfibroad2013_avain
    ,opist_sama_myohempi_iscfibroad2013_avain
    ,ammka_sama_myohempi_iscfibroad2013_avain
    ,akk_sama_myohempi_iscfibroad2013_avain
    ,amk_sama_myohempi_iscfibroad2013_avain
    ,ylamk_sama_myohempi_iscfibroad2013_avain
    ,ykk_sama_myohempi_iscfibroad2013_avain
    ,laaker_sama_myohempi_iscfibroad2013_avain
    ,lis_sama_myohempi_iscfibroad2013_avain
    ,toht_sama_myohempi_iscfibroad2013_avain
    ,yliopistotutkinto_sama_myohempi_iscfibroad2013_avain
    ,yo_jatkotutkinto_sama_myohempi_iscfibroad2013_avain
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain
    ,korkeakoulututkinto_sama_myohempi_iscfibroad2013_avain
    ,toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain
    ,lu_sama_myohempi_iscfinarrow2013_avain
    ,amm_sama_myohempi_iscfinarrow2013_avain
    ,opist_sama_myohempi_iscfinarrow2013_avain
    ,ammka_sama_myohempi_iscfinarrow2013_avain
    ,akk_sama_myohempi_iscfinarrow2013_avain
    ,amk_sama_myohempi_iscfinarrow2013_avain
    ,ylamk_sama_myohempi_iscfinarrow2013_avain
    ,ykk_sama_myohempi_iscfinarrow2013_avain
    ,laaker_sama_myohempi_iscfinarrow2013_avain
    ,lis_sama_myohempi_iscfinarrow2013_avain
    ,toht_sama_myohempi_iscfinarrow2013_avain
    ,yliopistotutkinto_sama_myohempi_iscfinarrow2013_avain
    ,yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_avain
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain
    ,korkeakoulututkinto_sama_myohempi_iscfinarrow2013_avain
    ,toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain
	/* */
	--selitteet

/* Korvataan ensin vakioilla, että joineja ei tule kerralla liikaa / Jarmo CSC 25.11.2015

	,lu_sama_myohempi_koulutusala2002_id = ISNULL(lu_sama_myohempi_koulutusala2002.id, -2)
    ,amm_sama_myohempi_koulutusala2002_id = ISNULL(amm_sama_myohempi_koulutusala2002.id, -2)
    ,opist_sama_myohempi_koulutusala2002_id = ISNULL(opist_sama_myohempi_koulutusala2002.id, -2)
    ,ammka_sama_myohempi_koulutusala2002_id = ISNULL(ammka_sama_myohempi_koulutusala2002.id, -2)
    ,akk_sama_myohempi_koulutusala2002_id = ISNULL(akk_sama_myohempi_koulutusala2002.id, -2)
    ,amk_sama_myohempi_koulutusala2002_id = ISNULL(amk_sama_myohempi_koulutusala2002.id, -2)
    ,ylamk_sama_myohempi_koulutusala2002_id = ISNULL(ylamk_sama_myohempi_koulutusala2002.id, -2)
    ,ykk_sama_myohempi_koulutusala2002_id = ISNULL(ykk_sama_myohempi_koulutusala2002.id, -2)
    ,laaker_sama_myohempi_koulutusala2002_id = ISNULL(laaker_sama_myohempi_koulutusala2002.id, -2)
    ,lis_sama_myohempi_koulutusala2002_id = ISNULL(lis_sama_myohempi_koulutusala2002.id, -2)
    ,toht_sama_myohempi_koulutusala2002_id = ISNULL(toht_sama_myohempi_koulutusala2002.id, -2)
    ,yliopistotutkinto_sama_myohempi_koulutusala2002_id = ISNULL(yliopistotutkinto_sama_myohempi_koulutusala2002.id, -2)
    ,yo_jatkotutkinto_sama_myohempi_koulutusala2002_id = ISNULL(yo_jatkotutkinto_sama_myohempi_koulutusala2002.id, -2)
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_id = ISNULL(opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002.id, -2)
    ,korkeakoulututkinto_sama_myohempi_koulutusala2002_id = ISNULL(korkeakoulututkinto_sama_myohempi_koulutusala2002.id, -2)
    ,toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_id = ISNULL(toisen_asteen_tutkinto_sama_myohempi_koulutusala2002.id, -2)
    ,lu_sama_myohempi_opintoala2002_id = ISNULL(lu_sama_myohempi_opintoala2002.id, -2)
    ,amm_sama_myohempi_opintoala2002_id = ISNULL(amm_sama_myohempi_opintoala2002.id, -2)
    ,opist_sama_myohempi_opintoala2002_id = ISNULL(opist_sama_myohempi_opintoala2002.id, -2)
    ,ammka_sama_myohempi_opintoala2002_id = ISNULL(ammka_sama_myohempi_opintoala2002.id, -2)
    ,akk_sama_myohempi_opintoala2002_id = ISNULL(akk_sama_myohempi_opintoala2002.id, -2)
    ,amk_sama_myohempi_opintoala2002_id = ISNULL(amk_sama_myohempi_opintoala2002.id, -2)
    ,ylamk_sama_myohempi_opintoala2002_id = ISNULL(ylamk_sama_myohempi_opintoala2002.id, -2)
    ,ykk_sama_myohempi_opintoala2002_id = ISNULL(ykk_sama_myohempi_opintoala2002.id, -2)
    ,laaker_sama_myohempi_opintoala2002_id = ISNULL(laaker_sama_myohempi_opintoala2002.id, -2)
    ,lis_sama_myohempi_opintoala2002_id = ISNULL(lis_sama_myohempi_opintoala2002.id, -2)
    ,toht_sama_myohempi_opintoala2002_id = ISNULL(toht_sama_myohempi_opintoala2002.id, -2)
    ,yliopistotutkinto_sama_myohempi_opintoala2002_id = ISNULL(yliopistotutkinto_sama_myohempi_opintoala2002.id, -2)
    ,yo_jatkotutkinto_sama_myohempi_opintoala2002_id = ISNULL(yo_jatkotutkinto_sama_myohempi_opintoala2002.id, -2)
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_id = ISNULL(opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002.id, -2)
    ,korkeakoulututkinto_sama_myohempi_opintoala2002_id = ISNULL(korkeakoulututkinto_sama_myohempi_opintoala2002.id, -2)
    ,toisen_asteen_tutkinto_sama_myohempi_opintoala2002_id = ISNULL(toisen_asteen_tutkinto_sama_myohempi_opintoala2002.id, -2)
    ,lu_sama_myohempi_opintoala1995_id = ISNULL(lu_sama_myohempi_opintoala1995.id, -2)
    ,amm_sama_myohempi_opintoala1995_id = ISNULL(amm_sama_myohempi_opintoala1995.id, -2)
    ,opist_sama_myohempi_opintoala1995_id = ISNULL(opist_sama_myohempi_opintoala1995.id, -2)
    ,ammka_sama_myohempi_opintoala1995_id = ISNULL(ammka_sama_myohempi_opintoala1995.id, -2)
    ,akk_sama_myohempi_opintoala1995_id = ISNULL(akk_sama_myohempi_opintoala1995.id, -2)
    ,amk_sama_myohempi_opintoala1995_id = ISNULL(amk_sama_myohempi_opintoala1995.id, -2)
    ,ylamk_sama_myohempi_opintoala1995_id = ISNULL(ylamk_sama_myohempi_opintoala1995.id, -2)
    ,ykk_sama_myohempi_opintoala1995_id = ISNULL(ykk_sama_myohempi_opintoala1995.id, -2)
    ,laaker_sama_myohempi_opintoala1995_id = ISNULL(laaker_sama_myohempi_opintoala1995.id, -2)
    ,lis_sama_myohempi_opintoala1995_id = ISNULL(lis_sama_myohempi_opintoala1995.id, -2)
    ,toht_sama_myohempi_opintoala1995_id = ISNULL(toht_sama_myohempi_opintoala1995.id, -2)
    ,yliopistotutkinto_sama_myohempi_opintoala1995_id = ISNULL(yliopistotutkinto_sama_myohempi_opintoala1995.id, -2)
    ,yo_jatkotutkinto_sama_myohempi_opintoala1995_id = ISNULL(yo_jatkotutkinto_sama_myohempi_opintoala1995.id, -2)
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_id = ISNULL(opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995.id, -2)
    ,korkeakoulututkinto_sama_myohempi_opintoala1995_id = ISNULL(korkeakoulututkinto_sama_myohempi_opintoala1995.id, -2)
    ,toisen_asteen_tutkinto_sama_myohempi_opintoala1995_id = ISNULL(toisen_asteen_tutkinto_sama_myohempi_opintoala1995.id, -2)
    ,lu_sama_myohempi_iscfibroad2013_id = ISNULL(lu_sama_myohempi_iscfibroad2013.id, -2)
    ,amm_sama_myohempi_iscfibroad2013_id = ISNULL(amm_sama_myohempi_iscfibroad2013.id, -2)
    ,opist_sama_myohempi_iscfibroad2013_id = ISNULL(opist_sama_myohempi_iscfibroad2013.id, -2)
    ,ammka_sama_myohempi_iscfibroad2013_id = ISNULL(ammka_sama_myohempi_iscfibroad2013.id, -2)
    ,akk_sama_myohempi_iscfibroad2013_id = ISNULL(akk_sama_myohempi_iscfibroad2013.id, -2)
    ,amk_sama_myohempi_iscfibroad2013_id = ISNULL(amk_sama_myohempi_iscfibroad2013.id, -2)
    ,ylamk_sama_myohempi_iscfibroad2013_id = ISNULL(ylamk_sama_myohempi_iscfibroad2013.id, -2)
    ,ykk_sama_myohempi_iscfibroad2013_id = ISNULL(ykk_sama_myohempi_iscfibroad2013.id, -2)
    ,laaker_sama_myohempi_iscfibroad2013_id = ISNULL(laaker_sama_myohempi_iscfibroad2013.id, -2)
    ,lis_sama_myohempi_iscfibroad2013_id = ISNULL(lis_sama_myohempi_iscfibroad2013.id, -2)
    ,toht_sama_myohempi_iscfibroad2013_id = ISNULL(toht_sama_myohempi_iscfibroad2013.id, -2)
    ,yliopistotutkinto_sama_myohempi_iscfibroad2013_id = ISNULL(yliopistotutkinto_sama_myohempi_iscfibroad2013.id, -2)
    ,yo_jatkotutkinto_sama_myohempi_iscfibroad2013_id = ISNULL(yo_jatkotutkinto_sama_myohempi_iscfibroad2013.id, -2)
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_id = ISNULL(opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013.id, -2)
    ,korkeakoulututkinto_sama_myohempi_iscfibroad2013_id = ISNULL(korkeakoulututkinto_sama_myohempi_iscfibroad2013.id, -2)
    ,toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_id = ISNULL(toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013.id, -2)
    ,lu_sama_myohempi_iscfinarrow2013_id = ISNULL(lu_sama_myohempi_iscfinarrow2013.id, -2)
    ,amm_sama_myohempi_iscfinarrow2013_id = ISNULL(amm_sama_myohempi_iscfinarrow2013.id, -2)
    ,opist_sama_myohempi_iscfinarrow2013_id = ISNULL(opist_sama_myohempi_iscfinarrow2013.id, -2)
    ,ammka_sama_myohempi_iscfinarrow2013_id = ISNULL(ammka_sama_myohempi_iscfinarrow2013.id, -2)
    ,akk_sama_myohempi_iscfinarrow2013_id = ISNULL(akk_sama_myohempi_iscfinarrow2013.id, -2)
    ,amk_sama_myohempi_iscfinarrow2013_id = ISNULL(amk_sama_myohempi_iscfinarrow2013.id, -2)
    ,ylamk_sama_myohempi_iscfinarrow2013_id = ISNULL(ylamk_sama_myohempi_iscfinarrow2013.id, -2)
    ,ykk_sama_myohempi_iscfinarrow2013_id = ISNULL(ykk_sama_myohempi_iscfinarrow2013.id, -2)
    ,laaker_sama_myohempi_iscfinarrow2013_id = ISNULL(laaker_sama_myohempi_iscfinarrow2013.id, -2)
    ,lis_sama_myohempi_iscfinarrow2013_id = ISNULL(lis_sama_myohempi_iscfinarrow2013.id, -2)
    ,toht_sama_myohempi_iscfinarrow2013_id = ISNULL(toht_sama_myohempi_iscfinarrow2013.id, -2)
    ,yliopistotutkinto_sama_myohempi_iscfinarrow2013_id = ISNULL(yliopistotutkinto_sama_myohempi_iscfinarrow2013.id, -2)
    ,yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_id = ISNULL(yo_jatkotutkinto_sama_myohempi_iscfinarrow2013.id, -2)
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id = ISNULL(opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013.id, -2)
    ,korkeakoulututkinto_sama_myohempi_iscfinarrow2013_id = ISNULL(korkeakoulututkinto_sama_myohempi_iscfinarrow2013.id, -2)
    ,toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id = ISNULL(toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013.id, -2)
*/
/*
,lu_sama_myohempi_koulutusala2002_id = -2
,amm_sama_myohempi_koulutusala2002_id = -2
,opist_sama_myohempi_koulutusala2002_id = -2
,ammka_sama_myohempi_koulutusala2002_id = -2
,akk_sama_myohempi_koulutusala2002_id = -2
,amk_sama_myohempi_koulutusala2002_id = -2
,ylamk_sama_myohempi_koulutusala2002_id = -2
,ykk_sama_myohempi_koulutusala2002_id = -2
,laaker_sama_myohempi_koulutusala2002_id = -2
,lis_sama_myohempi_koulutusala2002_id = -2
,toht_sama_myohempi_koulutusala2002_id = -2
,yliopistotutkinto_sama_myohempi_koulutusala2002_id = -2
,yo_jatkotutkinto_sama_myohempi_koulutusala2002_id = -2
,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_id = -2
,korkeakoulututkinto_sama_myohempi_koulutusala2002_id = -2
,toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_id = -2
,lu_sama_myohempi_opintoala2002_id = -2
,amm_sama_myohempi_opintoala2002_id = -2
,opist_sama_myohempi_opintoala2002_id = -2
,ammka_sama_myohempi_opintoala2002_id = -2
,akk_sama_myohempi_opintoala2002_id = -2
,amk_sama_myohempi_opintoala2002_id = -2
,ylamk_sama_myohempi_opintoala2002_id = -2
,ykk_sama_myohempi_opintoala2002_id = -2
,laaker_sama_myohempi_opintoala2002_id = -2
,lis_sama_myohempi_opintoala2002_id = -2
,toht_sama_myohempi_opintoala2002_id = -2
,yliopistotutkinto_sama_myohempi_opintoala2002_id = -2
,yo_jatkotutkinto_sama_myohempi_opintoala2002_id = -2
,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_id = -2
,korkeakoulututkinto_sama_myohempi_opintoala2002_id = -2
,toisen_asteen_tutkinto_sama_myohempi_opintoala2002_id = -2
,lu_sama_myohempi_opintoala1995_id = -2
,amm_sama_myohempi_opintoala1995_id = -2
,opist_sama_myohempi_opintoala1995_id = -2
,ammka_sama_myohempi_opintoala1995_id = -2
,akk_sama_myohempi_opintoala1995_id = -2
,amk_sama_myohempi_opintoala1995_id = -2
,ylamk_sama_myohempi_opintoala1995_id = -2
,ykk_sama_myohempi_opintoala1995_id = -2
,laaker_sama_myohempi_opintoala1995_id = -2
,lis_sama_myohempi_opintoala1995_id = -2
,toht_sama_myohempi_opintoala1995_id = -2
,yliopistotutkinto_sama_myohempi_opintoala1995_id = -2
,yo_jatkotutkinto_sama_myohempi_opintoala1995_id = -2
,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_id = -2
,korkeakoulututkinto_sama_myohempi_opintoala1995_id = -2
,toisen_asteen_tutkinto_sama_myohempi_opintoala1995_id = -2
,lu_sama_myohempi_iscfibroad2013_id = -2
,amm_sama_myohempi_iscfibroad2013_id = -2
,opist_sama_myohempi_iscfibroad2013_id = -2
,ammka_sama_myohempi_iscfibroad2013_id = -2
,akk_sama_myohempi_iscfibroad2013_id = -2
,amk_sama_myohempi_iscfibroad2013_id = -2
,ylamk_sama_myohempi_iscfibroad2013_id = -2
,ykk_sama_myohempi_iscfibroad2013_id = -2
,laaker_sama_myohempi_iscfibroad2013_id = -2
,lis_sama_myohempi_iscfibroad2013_id = -2
,toht_sama_myohempi_iscfibroad2013_id = -2
,yliopistotutkinto_sama_myohempi_iscfibroad2013_id = -2
,yo_jatkotutkinto_sama_myohempi_iscfibroad2013_id = -2
,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_id = -2
,korkeakoulututkinto_sama_myohempi_iscfibroad2013_id = -2
,toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_id = -2
,lu_sama_myohempi_iscfinarrow2013_id = -2
,amm_sama_myohempi_iscfinarrow2013_id = -2
,opist_sama_myohempi_iscfinarrow2013_id = -2
,ammka_sama_myohempi_iscfinarrow2013_id = -2
,akk_sama_myohempi_iscfinarrow2013_id = -2
,amk_sama_myohempi_iscfinarrow2013_id = -2
,ylamk_sama_myohempi_iscfinarrow2013_id = -2
,ykk_sama_myohempi_iscfinarrow2013_id = -2
,laaker_sama_myohempi_iscfinarrow2013_id = -2
,lis_sama_myohempi_iscfinarrow2013_id = -2
,toht_sama_myohempi_iscfinarrow2013_id = -2
,yliopistotutkinto_sama_myohempi_iscfinarrow2013_id = -2
,yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_id = -2
,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id = -2
,korkeakoulututkinto_sama_myohempi_iscfinarrow2013_id = -2
,toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id = -2
*/


      ,f.[tietolahde]
      ,[rivinumero]
--INTO VipunenTK_DW.dbo._VipunenTK_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8
FROM VipunenTK_DW.dbo._f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8 f
  
LEFT JOIN VipunenTK.dbo.d_tarkastelujakso d_tj
	ON d_tj.tarkastelujakso_koodi = f.tarkastelujakso_koodi
LEFT JOIN VipunenTK.dbo.d_sukupuoli d_sp
	ON d_sp.sukupuoli_koodi = f.sukupuoli_koodi
LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio1 d_ak1
	ON d_ak1.aidinkieli_versio1_koodi = f.aidinkieli_versio1_koodi
LEFT JOIN VipunenTK.dbo.d_ika 
	ON d_ika.ika_avain = f.ika_avain
LEFT JOIN VipunenTK.dbo.d_kausi d_alo
	ON d_alo.kausi_id = f.aloituskausikoodi
LEFT JOIN VipunenTK.dbo.d_kausi d_suo
	ON d_suo.kausi_id = f.suorituskausikoodi
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_kl
	ON d_kl.koulutusluokitus_avain = f.koulutusluokitus_avain
LEFT JOIN VipunenTK.dbo.d_oppisopimuskoulutus d_osk
	ON d_osk.oppisopimuskoulutus_koodi = f.oppisopimuskoulutus_koodi
LEFT JOIN VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d_akk
	ON d_akk.ammatillisen_koulutuksen_koulutuslaji_koodi = f.ammatillisen_koulutuksen_koulutuslaji_koodi
LEFT JOIN VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d_on
	ON d_on.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi = f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi
LEFT JOIN VipunenTK.dbo.d_nuorten_aikuisten_koulutus_amm d_na
	ON d_na.nuorten_aikuisten_koulutus_amm_koodi = f.nuorten_aikuisten_koulutus_amm_koodi

LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_lu_kl
	ON d_lu_kl.koulutusluokitus_avain = f.lukoulk
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_amm_kl
	ON d_amm_kl.koulutusluokitus_avain = f.ammkoulk
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_opist_kl
	ON d_opist_kl.koulutusluokitus_avain = f.opistkoulk
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_ammka_kl
	ON d_ammka_kl.koulutusluokitus_avain = f.ammkakoulk
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_akk_kl
	ON d_akk_kl.koulutusluokitus_avain = f.akkkoulk
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_amk_kl
	ON d_amk_kl.koulutusluokitus_avain = f.amkkoulk
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_ylamk_kl
	ON d_ylamk_kl.koulutusluokitus_avain = f.ylamkkoulk
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_ykk_kl
	ON d_ykk_kl.koulutusluokitus_avain = f.ykkkoulk
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_laaker_kl
	ON d_laaker_kl.koulutusluokitus_avain = f.laakerkoulk
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_lis_kl
	ON d_lis_kl.koulutusluokitus_avain = f.liskoulk
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_toht_kl
	ON d_toht_kl.koulutusluokitus_avain = f.tohtkoulk

LEFT JOIN VipunenTK.dbo.d_nuorten_aikuisten_koulutus_amm d_lu_na
	ON d_lu_na.nuorten_aikuisten_koulutus_amm_koodi = f.luaikoul
LEFT JOIN VipunenTK.dbo.d_oppisopimuskoulutus d_amm_osk
	ON d_amm_osk.oppisopimuskoulutus_koodi = f.ammoppis
LEFT JOIN VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d_amm_akk
	ON d_amm_akk.ammatillisen_koulutuksen_koulutuslaji_koodi = f.ammtutklaja
LEFT JOIN VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d_amm_on
	ON d_amm_on.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi = f.ammtutktav
LEFT JOIN VipunenTK.dbo.d_nuorten_aikuisten_koulutus_amm d_amk_na
	ON d_amk_na.nuorten_aikuisten_koulutus_amm_koodi = f.amkaikoul
LEFT JOIN VipunenTK.dbo.d_ammatillinen_koulutus_luokittelu d_ammkl
	ON d_ammkl.ammatillisen_koulutuksen_luokittelu_avain = f.ammatillinen_koulutus_ryhma_avain

LEFT JOIN VipunenTK.dbo.d_tutkintojen_maara d_amm_tm
	ON d_amm_tm.[tutkintojen_maara_avain] = f.tutkintojen_maara_amm_avain
LEFT JOIN VipunenTK.dbo.d_tutkintojen_maara d_amk_tm
	ON d_amk_tm.[tutkintojen_maara_avain] = f.tutkintojen_maara_amk_avain
LEFT JOIN VipunenTK.dbo.d_tutkintojen_maara d_akk_tm
	ON d_akk_tm.[tutkintojen_maara_avain] = f.tutkintojen_maara_akk_avain
LEFT JOIN VipunenTK.dbo.d_tutkintojen_maara d_ykk_tm
	ON d_ykk_tm.[tutkintojen_maara_avain] = f.tutkintojen_maara_ykk_avain

LEFT JOIN VipunenTK.dbo.d_koulutuksesta_kulunut_aika d_lu_ika
	ON d_lu_ika.koulutuksesta_kulunut_aika_koodi =  cast(f.lu_ika as nvarchar(20))
LEFT JOIN VipunenTK.dbo.d_koulutuksesta_kulunut_aika d_amm_ika
	ON d_amm_ika.koulutuksesta_kulunut_aika_koodi =  cast(f.amm_ika as nvarchar(20))
LEFT JOIN VipunenTK.dbo.d_koulutuksesta_kulunut_aika d_opist_ika
	ON d_opist_ika.koulutuksesta_kulunut_aika_koodi =  cast(f.opist_ika as nvarchar(20))
LEFT JOIN VipunenTK.dbo.d_koulutuksesta_kulunut_aika d_ammka_ika
	ON d_ammka_ika.koulutuksesta_kulunut_aika_koodi =  cast(f.ammka_ika as nvarchar(20))
LEFT JOIN VipunenTK.dbo.d_koulutuksesta_kulunut_aika d_amk_ika
	ON d_amk_ika.koulutuksesta_kulunut_aika_koodi =  cast(f.amk_ika as nvarchar(20))
LEFT JOIN VipunenTK.dbo.d_koulutuksesta_kulunut_aika d_akk_ika
	ON d_akk_ika.koulutuksesta_kulunut_aika_koodi =  cast(f.akk_ika as nvarchar(20))
LEFT JOIN VipunenTK.dbo.d_koulutuksesta_kulunut_aika d_ylamk_ika
	ON d_ylamk_ika.koulutuksesta_kulunut_aika_koodi =  cast(f.ylamk_ika as nvarchar(20))
LEFT JOIN VipunenTK.dbo.d_koulutuksesta_kulunut_aika d_ykk_ika
	ON d_ykk_ika.koulutuksesta_kulunut_aika_koodi =  cast(f.ykk_ika as nvarchar(20))
LEFT JOIN VipunenTK.dbo.d_koulutuksesta_kulunut_aika d_laaker_ika
	ON d_laaker_ika.koulutuksesta_kulunut_aika_koodi =  cast(f.laaker_ika as nvarchar(20))
LEFT JOIN VipunenTK.dbo.d_koulutuksesta_kulunut_aika d_lis_ika
	ON d_lis_ika.koulutuksesta_kulunut_aika_koodi =  cast(f.lis_ika as nvarchar(20))
LEFT JOIN VipunenTK.dbo.d_koulutuksesta_kulunut_aika d_toht_ika
	ON d_toht_ika.koulutuksesta_kulunut_aika_koodi =  cast(f.toht_ika as nvarchar(20))

LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_lu_ts
	ON d_lu_ts.[tutkinto_suoritettu_avain] =  f.tutkinto_suoritettu_lu_avain
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_amm_ts
	ON d_amm_ts.[tutkinto_suoritettu_avain] =  f.tutkinto_suoritettu_amm_avain
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_opist_ts
	ON d_opist_ts.[tutkinto_suoritettu_avain] =  f.tutkinto_suoritettu_opisto_avain
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_ammka_ts
	ON d_ammka_ts.[tutkinto_suoritettu_avain] =  f.tutkinto_suoritettu_ammka_avain
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_amk_ts
	ON d_amk_ts.[tutkinto_suoritettu_avain] =  f.tutkinto_suoritettu_amk_avain
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_akk_ts
	ON d_akk_ts.[tutkinto_suoritettu_avain] =  f.tutkinto_suoritettu_akk_avain
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_ylamk_ts
	ON d_ylamk_ts.[tutkinto_suoritettu_avain] =  f.tutkinto_suoritettu_ylamk_avain
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_ykk_ts
	ON d_ykk_ts.[tutkinto_suoritettu_avain] =  f.tutkinto_suoritettu_ykk_avain
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_laaker_ts
	ON d_laaker_ts.[tutkinto_suoritettu_avain] =  f.tutkinto_suoritettu_laaker_avain
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_lis_ts
	ON d_lis_ts.[tutkinto_suoritettu_avain] =  f.tutkinto_suoritettu_lis_avain
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_toht_ts
	ON d_toht_ts.[tutkinto_suoritettu_avain] =  f.tutkinto_suoritettu_toht_avain

LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_yo_ts
	ON d_yo_ts.[tutkinto_suoritettu_avain] =  'MYOH_YO_' + f.yliopistotutkinto_myohempi_suoritettu
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_yojatko_ts
	ON d_yojatko_ts.[tutkinto_suoritettu_avain] =  'MYOH_YOJATKO_' + f.yo_jatkotutkinto_myohempi_suoritettu
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_opammka_ts
	ON d_opammka_ts.[tutkinto_suoritettu_avain] =  'MYOH_OP_AMMKA_' + f.opisto_tai_ammatillisen_korkea_asteen_tutkinto_myohempi_suoritettu
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_kk_ts
	ON d_kk_ts.[tutkinto_suoritettu_avain] =  'MYOH_KK_' + f.korkeakoulututkinto_myohempi_suoritettu
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_aste2_ts
	ON d_aste2_ts.[tutkinto_suoritettu_avain] =  'MYOH_ASTE2_' + f.toisen_asteen_tutkinto_myohempi_suoritettu

LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_amm_r1_ts
	ON d_amm_r1_ts.[tutkinto_suoritettu_avain] =  'MYOH_AMM_R1_' + f.ammatillisen_tutkinto_myohempi_suoritettu_ryhma1
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_amm_r2_ts
	ON d_amm_r2_ts.[tutkinto_suoritettu_avain] =  'MYOH_AMM_R2_' + f.ammatillisen_tutkinto_myohempi_suoritettu_ryhma2
LEFT JOIN VipunenTK.dbo.d_tutkinto_suoritettu d_amm_r3_ts
	ON d_amm_r3_ts.[tutkinto_suoritettu_avain] =  'MYOH_AMM_R3_' + f.ammatillisen_tutkinto_myohempi_suoritettu_ryhma3

-- Kuvaukset koulutusalan pysyvyydelle
/*
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lu_sama_myohempi_koulutusala2002 ON lu_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.lu_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amm_sama_myohempi_koulutusala2002 ON amm_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.amm_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opist_sama_myohempi_koulutusala2002 ON opist_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.opist_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ammka_sama_myohempi_koulutusala2002 ON ammka_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.ammka_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala akk_sama_myohempi_koulutusala2002 ON akk_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.akk_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amk_sama_myohempi_koulutusala2002 ON amk_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.amk_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ylamk_sama_myohempi_koulutusala2002 ON ylamk_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.ylamk_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ykk_sama_myohempi_koulutusala2002 ON ykk_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.ykk_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala laaker_sama_myohempi_koulutusala2002 ON laaker_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.laaker_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lis_sama_myohempi_koulutusala2002 ON lis_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.lis_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toht_sama_myohempi_koulutusala2002 ON toht_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.toht_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yliopistotutkinto_sama_myohempi_koulutusala2002 ON yliopistotutkinto_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.yliopistotutkinto_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yo_jatkotutkinto_sama_myohempi_koulutusala2002 ON yo_jatkotutkinto_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.yo_jatkotutkinto_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002 ON opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala korkeakoulututkinto_sama_myohempi_koulutusala2002 ON korkeakoulututkinto_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.korkeakoulututkinto_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toisen_asteen_tutkinto_sama_myohempi_koulutusala2002 ON toisen_asteen_tutkinto_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lu_sama_myohempi_opintoala2002 ON lu_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.lu_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amm_sama_myohempi_opintoala2002 ON amm_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.amm_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opist_sama_myohempi_opintoala2002 ON opist_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.opist_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ammka_sama_myohempi_opintoala2002 ON ammka_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.ammka_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala akk_sama_myohempi_opintoala2002 ON akk_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.akk_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amk_sama_myohempi_opintoala2002 ON amk_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.amk_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ylamk_sama_myohempi_opintoala2002 ON ylamk_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.ylamk_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ykk_sama_myohempi_opintoala2002 ON ykk_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.ykk_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala laaker_sama_myohempi_opintoala2002 ON laaker_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.laaker_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lis_sama_myohempi_opintoala2002 ON lis_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.lis_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toht_sama_myohempi_opintoala2002 ON toht_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.toht_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yliopistotutkinto_sama_myohempi_opintoala2002 ON yliopistotutkinto_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.yliopistotutkinto_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yo_jatkotutkinto_sama_myohempi_opintoala2002 ON yo_jatkotutkinto_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.yo_jatkotutkinto_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002 ON opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala korkeakoulututkinto_sama_myohempi_opintoala2002 ON korkeakoulututkinto_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.korkeakoulututkinto_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toisen_asteen_tutkinto_sama_myohempi_opintoala2002 ON toisen_asteen_tutkinto_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.toisen_asteen_tutkinto_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lu_sama_myohempi_opintoala1995 ON lu_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.lu_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amm_sama_myohempi_opintoala1995 ON amm_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.amm_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opist_sama_myohempi_opintoala1995 ON opist_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.opist_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ammka_sama_myohempi_opintoala1995 ON ammka_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.ammka_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala akk_sama_myohempi_opintoala1995 ON akk_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.akk_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amk_sama_myohempi_opintoala1995 ON amk_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.amk_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ylamk_sama_myohempi_opintoala1995 ON ylamk_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.ylamk_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ykk_sama_myohempi_opintoala1995 ON ykk_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.ykk_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala laaker_sama_myohempi_opintoala1995 ON laaker_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.laaker_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lis_sama_myohempi_opintoala1995 ON lis_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.lis_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toht_sama_myohempi_opintoala1995 ON toht_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.toht_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yliopistotutkinto_sama_myohempi_opintoala1995 ON yliopistotutkinto_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.yliopistotutkinto_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yo_jatkotutkinto_sama_myohempi_opintoala1995 ON yo_jatkotutkinto_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.yo_jatkotutkinto_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995 ON opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala korkeakoulututkinto_sama_myohempi_opintoala1995 ON korkeakoulututkinto_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.korkeakoulututkinto_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toisen_asteen_tutkinto_sama_myohempi_opintoala1995 ON toisen_asteen_tutkinto_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.toisen_asteen_tutkinto_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lu_sama_myohempi_iscfibroad2013 ON lu_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.lu_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amm_sama_myohempi_iscfibroad2013 ON amm_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.amm_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opist_sama_myohempi_iscfibroad2013 ON opist_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.opist_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ammka_sama_myohempi_iscfibroad2013 ON ammka_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.ammka_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala akk_sama_myohempi_iscfibroad2013 ON akk_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.akk_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amk_sama_myohempi_iscfibroad2013 ON amk_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.amk_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ylamk_sama_myohempi_iscfibroad2013 ON ylamk_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.ylamk_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ykk_sama_myohempi_iscfibroad2013 ON ykk_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.ykk_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala laaker_sama_myohempi_iscfibroad2013 ON laaker_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.laaker_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lis_sama_myohempi_iscfibroad2013 ON lis_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.lis_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toht_sama_myohempi_iscfibroad2013 ON toht_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.toht_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yliopistotutkinto_sama_myohempi_iscfibroad2013 ON yliopistotutkinto_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.yliopistotutkinto_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yo_jatkotutkinto_sama_myohempi_iscfibroad2013 ON yo_jatkotutkinto_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.yo_jatkotutkinto_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013 ON opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala korkeakoulututkinto_sama_myohempi_iscfibroad2013 ON korkeakoulututkinto_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.korkeakoulututkinto_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013 ON toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lu_sama_myohempi_iscfinarrow2013 ON lu_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.lu_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amm_sama_myohempi_iscfinarrow2013 ON amm_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.amm_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opist_sama_myohempi_iscfinarrow2013 ON opist_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.opist_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ammka_sama_myohempi_iscfinarrow2013 ON ammka_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.ammka_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala akk_sama_myohempi_iscfinarrow2013 ON akk_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.akk_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amk_sama_myohempi_iscfinarrow2013 ON amk_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.amk_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ylamk_sama_myohempi_iscfinarrow2013 ON ylamk_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.ylamk_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ykk_sama_myohempi_iscfinarrow2013 ON ykk_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.ykk_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala laaker_sama_myohempi_iscfinarrow2013 ON laaker_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.laaker_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lis_sama_myohempi_iscfinarrow2013 ON lis_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.lis_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toht_sama_myohempi_iscfinarrow2013 ON toht_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.toht_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yliopistotutkinto_sama_myohempi_iscfinarrow2013 ON yliopistotutkinto_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.yliopistotutkinto_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yo_jatkotutkinto_sama_myohempi_iscfinarrow2013 ON yo_jatkotutkinto_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013 ON opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala korkeakoulututkinto_sama_myohempi_iscfinarrow2013 ON korkeakoulututkinto_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.korkeakoulututkinto_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013 ON toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain
*/

Truncate table VipunenTK.dbo.f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8

INSERT INTO VipunenTK.dbo.f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8
Select 
	   [tilastovuosi]
      ,[tilv_date]
      ,[tarkastelujakso_koodi]
      ,[tarkastelujakso_id]
      ,[sukupuoli_koodi]
      ,[sukupuoli_id]
      ,[aidinkieli_versio1_koodi]
      ,[aidinkieli_id]
      ,[suorv]
      ,[suorlk]
      ,[suorituskausikoodi]
      ,[suorituskausi_id]
      ,[koulutusluokitus_avain]
      ,[koulutusluokitus_id]
      ,[alvv]
      ,[allk]
      ,[aloituskausikoodi]
      ,[aloituskausi_id]
      ,[oppisopimuskoulutus_koodi]
      ,[oppisopimuskoulutus_id]
      ,[ammatillisen_koulutuksen_koulutuslaji_koodi]
      ,[ammatillisen_koulutuksen_koulutuslaji_id]
      ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi]
      ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id]
      ,[nuorten_aikuisten_koulutus_amm_koodi]
      ,[nuorten_aikuisten_koulutus_amm_id]
      ,[syntv]
      ,[ika_avain]
      ,[ika_id]
      ,[henkiloiden_lkm]
      ,[lu_henkiloiden_lkm]
      ,[lukoulk]
      ,[lu_myohempi_koulutusluokitus_id]
      ,[lusuorv]
      ,[luaikoul]
      ,[lu_nuorten_aikuisten_koulutus_amm_id]
      ,[lu_ika]
      ,[lu_ika_id]
      ,[lu_myohempi_tutkinto_suoritettu]
      ,[lu_myohempi_tutkinto_suoritettu_id]
      ,[ammlkm_id]
      ,[amm_henkiloiden_lkm]
      ,[ammkoulk]
      ,[amm_myohempi_koulutusluokitus_id]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammoppis_id]
      ,[ammtutklaja]
      ,[ammtutklaja_id]
      ,[ammtutktav]
      ,[ammtutktav_id]
      ,[ammatillinen_koulutus_ryhma]
      ,[ammatillinen_koulutus_ryhma_id]
      ,[amm_ika]
      ,[amm_ika_id]
      ,[amm_myohempi_tutkinto_suoritettu]
      ,[amm_myohempi_tutkinto_suoritettu_id]
      ,[opist_henkiloiden_lkm]
      ,[opistkoulk]
      ,[opist_myohempi_koulutusluokitus_id]
      ,[opistsuorv]
      ,[opist_ika]
      ,[opist_ika_id]
      ,[opist_myohempi_tutkinto_suoritettu]
      ,[opist_myohempi_tutkinto_suoritettu_id]
      ,[ammka_henkiloiden_lkm]
      ,[ammkakoulk]
      ,[ammka_myohempi_koulutusluokitus_id]
      ,[ammkasuorv]
      ,[ammka_ika]
      ,[ammka_ika_id]
      ,[ammka_myohempi_tutkinto_suoritettu]
      ,[ammka_myohempi_tutkinto_suoritettu_id]
      ,[amklkm_id]
      ,[amk_henkiloiden_lkm]
      ,[amkkoulk]
      ,[amk_myohempi_koulutusluokitus_id]
      ,[amksuorv]
      ,[amkaikoul]
      ,[amkaikoul_id]
      ,[amk_ika]
      ,[amk_ika_id]
      ,[amk_myohempi_tutkinto_suoritettu]
      ,[amk_myohempi_tutkinto_suoritettu_id]
      ,[akklkm_id]
      ,[akk_henkiloiden_lkm]
      ,[akkkoulk]
      ,[akk_myohempi_koulutusluokitus_id]
      ,[akksuorv]
      ,[akk_ika]
      ,[akk_ika_id]
      ,[akk_myohempi_tutkinto_suoritettu]
      ,[akk_myohempi_tutkinto_suoritettu_id]
      ,[ylamklkm_henkiloiden_lkm]
      ,[ylamkkoulk]
      ,[ylamk_myohempi_koulutusluokitus_id]
      ,[ylamksuorv]
      ,[ylamk_ika]
      ,[ylamk_ika_id]
      ,[ylamk_myohempi_tutkinto_suoritettu]
      ,[ylamk_myohempi_tutkinto_suoritettu_id]
      ,[ykklkm_id]
      ,[ykk_henkiloiden_lkm]
      ,[ykkkoulk]
      ,[ykk_myohempi_koulutusluokitus_id]
      ,[ykksuorv]
      ,[ykk_ika]
      ,[ykk_ika_id]
      ,[ykk_myohempi_tutkinto_suoritettu]
      ,[ykk_myohempi_tutkinto_suoritettu_id]
      ,[laaker_henkiloiden_lkm]
      ,[laakerkoulk]
      ,[laaker_myohempi_koulutusluokitus_id]
      ,[laakersuorv]
      ,[laaker_ika]
      ,[laaker_ika_id]
      ,[laaker_myohempi_tutkinto_suoritettu]
      ,[laaker_myohempi_tutkinto_suoritettu_id]
      ,[lis_henkiloiden_lkm]
      ,[liskoulk]
      ,[lis_myohempi_koulutusluokitus_id]
      ,[lissuorv]
      ,[lis_ika]
      ,[lis_ika_id]
      ,[lis_myohempi_tutkinto_suoritettu]
      ,[lis_myohempi_tutkinto_suoritettu_id]
      ,[toht_henkiloiden_lkm]
      ,[tohtkoulk]
      ,[toht_myohempi_koulutusluokitus_id]
      ,[tohtsuorv]
      ,[toht_ika]
      ,[toht_ika_id]
      ,[toht_myohempi_tutkinto_suoritettu]
      ,[toht_myohempi_tutkinto_suoritettu_id]
      ,[yliopistotutkinto_myohempi_suoritettu_id]
      ,[yo_jatkotutkinto_myohempi_suoritettu_id]
      ,[opisto_tai_ammatillisen_korkea_asteen_tutkinto_myohempi_suoritettu_id]
      ,[korkeakoulututkinto_myohempi_suoritettu_id]
      ,[toisen_asteen_tutkinto_myohempi_suoritettu_id]
      ,[ammatillisen_tutkinto_myohempi_suoritettu_ryhma1_id]
      ,[ammatillisen_tutkinto_myohempi_suoritettu_ryhma2_id]
      ,[ammatillisen_tutkinto_myohempi_suoritettu_ryhma3_id]
      ,[myohemman_yliopistotutkinnon_suorittaneiden_lkm]
      ,[myohemman_yo_jatkotutkinnon_suorittaneiden_lkm]
      ,[myohemman_opisto_tai_ammatillisen_korkea_asteen_tutkinnon_suorittaneiden_lkm]
      ,[myohemman_korkeakoulututkinnon_suorittaneiden_lkm]
      ,[myohemman_toisen_asteen_tutkinnon_suorittaneiden_lkm]
      ,[myohemman_ammatillisen_tutkinnon_ryhma1_suorittaneiden_lkm]
      ,[myohemman_ammatillisen_tutkinnon_ryhma2_suorittaneiden_lkm]
      ,[myohemman_ammatillisen_tutkinnon_ryhma3_suorittaneiden_lkm]

	,lu_sama_myohempi_koulutusala2002_id = ISNULL(lu_sama_myohempi_koulutusala2002.id, -2)
    ,amm_sama_myohempi_koulutusala2002_id = ISNULL(amm_sama_myohempi_koulutusala2002.id, -2)
    ,opist_sama_myohempi_koulutusala2002_id = ISNULL(opist_sama_myohempi_koulutusala2002.id, -2)
    ,ammka_sama_myohempi_koulutusala2002_id = ISNULL(ammka_sama_myohempi_koulutusala2002.id, -2)
    ,akk_sama_myohempi_koulutusala2002_id = ISNULL(akk_sama_myohempi_koulutusala2002.id, -2)
    ,amk_sama_myohempi_koulutusala2002_id = ISNULL(amk_sama_myohempi_koulutusala2002.id, -2)
    ,ylamk_sama_myohempi_koulutusala2002_id = ISNULL(ylamk_sama_myohempi_koulutusala2002.id, -2)
    ,ykk_sama_myohempi_koulutusala2002_id = ISNULL(ykk_sama_myohempi_koulutusala2002.id, -2)
    ,laaker_sama_myohempi_koulutusala2002_id = ISNULL(laaker_sama_myohempi_koulutusala2002.id, -2)
    ,lis_sama_myohempi_koulutusala2002_id = ISNULL(lis_sama_myohempi_koulutusala2002.id, -2)
    ,toht_sama_myohempi_koulutusala2002_id = ISNULL(toht_sama_myohempi_koulutusala2002.id, -2)
    ,yliopistotutkinto_sama_myohempi_koulutusala2002_id = ISNULL(yliopistotutkinto_sama_myohempi_koulutusala2002.id, -2)
    ,yo_jatkotutkinto_sama_myohempi_koulutusala2002_id = ISNULL(yo_jatkotutkinto_sama_myohempi_koulutusala2002.id, -2)
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_id = ISNULL(opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002.id, -2)
    ,korkeakoulututkinto_sama_myohempi_koulutusala2002_id = ISNULL(korkeakoulututkinto_sama_myohempi_koulutusala2002.id, -2)
    ,toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_id = ISNULL(toisen_asteen_tutkinto_sama_myohempi_koulutusala2002.id, -2)
    ,lu_sama_myohempi_opintoala2002_id = ISNULL(lu_sama_myohempi_opintoala2002.id, -2)
    ,amm_sama_myohempi_opintoala2002_id = ISNULL(amm_sama_myohempi_opintoala2002.id, -2)
    ,opist_sama_myohempi_opintoala2002_id = ISNULL(opist_sama_myohempi_opintoala2002.id, -2)
    ,ammka_sama_myohempi_opintoala2002_id = ISNULL(ammka_sama_myohempi_opintoala2002.id, -2)
    ,akk_sama_myohempi_opintoala2002_id = ISNULL(akk_sama_myohempi_opintoala2002.id, -2)
    ,amk_sama_myohempi_opintoala2002_id = ISNULL(amk_sama_myohempi_opintoala2002.id, -2)
    ,ylamk_sama_myohempi_opintoala2002_id = ISNULL(ylamk_sama_myohempi_opintoala2002.id, -2)
    ,ykk_sama_myohempi_opintoala2002_id = ISNULL(ykk_sama_myohempi_opintoala2002.id, -2)
    ,laaker_sama_myohempi_opintoala2002_id = ISNULL(laaker_sama_myohempi_opintoala2002.id, -2)
    ,lis_sama_myohempi_opintoala2002_id = ISNULL(lis_sama_myohempi_opintoala2002.id, -2)
    ,toht_sama_myohempi_opintoala2002_id = ISNULL(toht_sama_myohempi_opintoala2002.id, -2)
    ,yliopistotutkinto_sama_myohempi_opintoala2002_id = ISNULL(yliopistotutkinto_sama_myohempi_opintoala2002.id, -2)
    ,yo_jatkotutkinto_sama_myohempi_opintoala2002_id = ISNULL(yo_jatkotutkinto_sama_myohempi_opintoala2002.id, -2)
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_id = ISNULL(opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002.id, -2)
    ,korkeakoulututkinto_sama_myohempi_opintoala2002_id = ISNULL(korkeakoulututkinto_sama_myohempi_opintoala2002.id, -2)
    ,toisen_asteen_tutkinto_sama_myohempi_opintoala2002_id = ISNULL(toisen_asteen_tutkinto_sama_myohempi_opintoala2002.id, -2)
    ,lu_sama_myohempi_opintoala1995_id = ISNULL(lu_sama_myohempi_opintoala1995.id, -2)
    ,amm_sama_myohempi_opintoala1995_id = ISNULL(amm_sama_myohempi_opintoala1995.id, -2)
    ,opist_sama_myohempi_opintoala1995_id = ISNULL(opist_sama_myohempi_opintoala1995.id, -2)
    ,ammka_sama_myohempi_opintoala1995_id = ISNULL(ammka_sama_myohempi_opintoala1995.id, -2)
    ,akk_sama_myohempi_opintoala1995_id = ISNULL(akk_sama_myohempi_opintoala1995.id, -2)
    ,amk_sama_myohempi_opintoala1995_id = ISNULL(amk_sama_myohempi_opintoala1995.id, -2)
    ,ylamk_sama_myohempi_opintoala1995_id = ISNULL(ylamk_sama_myohempi_opintoala1995.id, -2)
    ,ykk_sama_myohempi_opintoala1995_id = ISNULL(ykk_sama_myohempi_opintoala1995.id, -2)
    ,laaker_sama_myohempi_opintoala1995_id = ISNULL(laaker_sama_myohempi_opintoala1995.id, -2)
    ,lis_sama_myohempi_opintoala1995_id = ISNULL(lis_sama_myohempi_opintoala1995.id, -2)
    ,toht_sama_myohempi_opintoala1995_id = ISNULL(toht_sama_myohempi_opintoala1995.id, -2)
    ,yliopistotutkinto_sama_myohempi_opintoala1995_id = ISNULL(yliopistotutkinto_sama_myohempi_opintoala1995.id, -2)
    ,yo_jatkotutkinto_sama_myohempi_opintoala1995_id = ISNULL(yo_jatkotutkinto_sama_myohempi_opintoala1995.id, -2)
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_id = ISNULL(opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995.id, -2)
    ,korkeakoulututkinto_sama_myohempi_opintoala1995_id = ISNULL(korkeakoulututkinto_sama_myohempi_opintoala1995.id, -2)
    ,toisen_asteen_tutkinto_sama_myohempi_opintoala1995_id = ISNULL(toisen_asteen_tutkinto_sama_myohempi_opintoala1995.id, -2)
    ,lu_sama_myohempi_iscfibroad2013_id = ISNULL(lu_sama_myohempi_iscfibroad2013.id, -2)
    ,amm_sama_myohempi_iscfibroad2013_id = ISNULL(amm_sama_myohempi_iscfibroad2013.id, -2)
    ,opist_sama_myohempi_iscfibroad2013_id = ISNULL(opist_sama_myohempi_iscfibroad2013.id, -2)
    ,ammka_sama_myohempi_iscfibroad2013_id = ISNULL(ammka_sama_myohempi_iscfibroad2013.id, -2)
    ,akk_sama_myohempi_iscfibroad2013_id = ISNULL(akk_sama_myohempi_iscfibroad2013.id, -2)
    ,amk_sama_myohempi_iscfibroad2013_id = ISNULL(amk_sama_myohempi_iscfibroad2013.id, -2)
    ,ylamk_sama_myohempi_iscfibroad2013_id = ISNULL(ylamk_sama_myohempi_iscfibroad2013.id, -2)
    ,ykk_sama_myohempi_iscfibroad2013_id = ISNULL(ykk_sama_myohempi_iscfibroad2013.id, -2)
    ,laaker_sama_myohempi_iscfibroad2013_id = ISNULL(laaker_sama_myohempi_iscfibroad2013.id, -2)
    ,lis_sama_myohempi_iscfibroad2013_id = ISNULL(lis_sama_myohempi_iscfibroad2013.id, -2)
    ,toht_sama_myohempi_iscfibroad2013_id = ISNULL(toht_sama_myohempi_iscfibroad2013.id, -2)
    ,yliopistotutkinto_sama_myohempi_iscfibroad2013_id = ISNULL(yliopistotutkinto_sama_myohempi_iscfibroad2013.id, -2)
    ,yo_jatkotutkinto_sama_myohempi_iscfibroad2013_id = ISNULL(yo_jatkotutkinto_sama_myohempi_iscfibroad2013.id, -2)
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_id = ISNULL(opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013.id, -2)
    ,korkeakoulututkinto_sama_myohempi_iscfibroad2013_id = ISNULL(korkeakoulututkinto_sama_myohempi_iscfibroad2013.id, -2)
    ,toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_id = ISNULL(toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013.id, -2)
    ,lu_sama_myohempi_iscfinarrow2013_id = ISNULL(lu_sama_myohempi_iscfinarrow2013.id, -2)
    ,amm_sama_myohempi_iscfinarrow2013_id = ISNULL(amm_sama_myohempi_iscfinarrow2013.id, -2)
    ,opist_sama_myohempi_iscfinarrow2013_id = ISNULL(opist_sama_myohempi_iscfinarrow2013.id, -2)
    ,ammka_sama_myohempi_iscfinarrow2013_id = ISNULL(ammka_sama_myohempi_iscfinarrow2013.id, -2)
    ,akk_sama_myohempi_iscfinarrow2013_id = ISNULL(akk_sama_myohempi_iscfinarrow2013.id, -2)
    ,amk_sama_myohempi_iscfinarrow2013_id = ISNULL(amk_sama_myohempi_iscfinarrow2013.id, -2)
    ,ylamk_sama_myohempi_iscfinarrow2013_id = ISNULL(ylamk_sama_myohempi_iscfinarrow2013.id, -2)
    ,ykk_sama_myohempi_iscfinarrow2013_id = ISNULL(ykk_sama_myohempi_iscfinarrow2013.id, -2)
    ,laaker_sama_myohempi_iscfinarrow2013_id = ISNULL(laaker_sama_myohempi_iscfinarrow2013.id, -2)
    ,lis_sama_myohempi_iscfinarrow2013_id = ISNULL(lis_sama_myohempi_iscfinarrow2013.id, -2)
    ,toht_sama_myohempi_iscfinarrow2013_id = ISNULL(toht_sama_myohempi_iscfinarrow2013.id, -2)
    ,yliopistotutkinto_sama_myohempi_iscfinarrow2013_id = ISNULL(yliopistotutkinto_sama_myohempi_iscfinarrow2013.id, -2)
    ,yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_id = ISNULL(yo_jatkotutkinto_sama_myohempi_iscfinarrow2013.id, -2)
    ,opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id = ISNULL(opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013.id, -2)
    ,korkeakoulututkinto_sama_myohempi_iscfinarrow2013_id = ISNULL(korkeakoulututkinto_sama_myohempi_iscfinarrow2013.id, -2)
    ,toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id = ISNULL(toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013.id, -2)

      ,f.[tietolahde]
      ,[rivinumero]

FROM VipunenTK_DW.dbo._VipunenTK_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8 f
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lu_sama_myohempi_koulutusala2002 ON lu_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.lu_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amm_sama_myohempi_koulutusala2002 ON amm_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.amm_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opist_sama_myohempi_koulutusala2002 ON opist_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.opist_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ammka_sama_myohempi_koulutusala2002 ON ammka_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.ammka_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala akk_sama_myohempi_koulutusala2002 ON akk_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.akk_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amk_sama_myohempi_koulutusala2002 ON amk_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.amk_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ylamk_sama_myohempi_koulutusala2002 ON ylamk_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.ylamk_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ykk_sama_myohempi_koulutusala2002 ON ykk_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.ykk_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala laaker_sama_myohempi_koulutusala2002 ON laaker_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.laaker_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lis_sama_myohempi_koulutusala2002 ON lis_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.lis_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toht_sama_myohempi_koulutusala2002 ON toht_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.toht_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yliopistotutkinto_sama_myohempi_koulutusala2002 ON yliopistotutkinto_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.yliopistotutkinto_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yo_jatkotutkinto_sama_myohempi_koulutusala2002 ON yo_jatkotutkinto_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.yo_jatkotutkinto_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002 ON opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala korkeakoulututkinto_sama_myohempi_koulutusala2002 ON korkeakoulututkinto_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.korkeakoulututkinto_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toisen_asteen_tutkinto_sama_myohempi_koulutusala2002 ON toisen_asteen_tutkinto_sama_myohempi_koulutusala2002.sama_koulutusala_avain = f.toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lu_sama_myohempi_opintoala2002 ON lu_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.lu_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amm_sama_myohempi_opintoala2002 ON amm_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.amm_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opist_sama_myohempi_opintoala2002 ON opist_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.opist_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ammka_sama_myohempi_opintoala2002 ON ammka_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.ammka_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala akk_sama_myohempi_opintoala2002 ON akk_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.akk_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amk_sama_myohempi_opintoala2002 ON amk_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.amk_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ylamk_sama_myohempi_opintoala2002 ON ylamk_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.ylamk_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ykk_sama_myohempi_opintoala2002 ON ykk_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.ykk_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala laaker_sama_myohempi_opintoala2002 ON laaker_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.laaker_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lis_sama_myohempi_opintoala2002 ON lis_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.lis_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toht_sama_myohempi_opintoala2002 ON toht_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.toht_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yliopistotutkinto_sama_myohempi_opintoala2002 ON yliopistotutkinto_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.yliopistotutkinto_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yo_jatkotutkinto_sama_myohempi_opintoala2002 ON yo_jatkotutkinto_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.yo_jatkotutkinto_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002 ON opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala korkeakoulututkinto_sama_myohempi_opintoala2002 ON korkeakoulututkinto_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.korkeakoulututkinto_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toisen_asteen_tutkinto_sama_myohempi_opintoala2002 ON toisen_asteen_tutkinto_sama_myohempi_opintoala2002.sama_koulutusala_avain = f.toisen_asteen_tutkinto_sama_myohempi_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lu_sama_myohempi_opintoala1995 ON lu_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.lu_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amm_sama_myohempi_opintoala1995 ON amm_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.amm_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opist_sama_myohempi_opintoala1995 ON opist_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.opist_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ammka_sama_myohempi_opintoala1995 ON ammka_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.ammka_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala akk_sama_myohempi_opintoala1995 ON akk_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.akk_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amk_sama_myohempi_opintoala1995 ON amk_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.amk_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ylamk_sama_myohempi_opintoala1995 ON ylamk_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.ylamk_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ykk_sama_myohempi_opintoala1995 ON ykk_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.ykk_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala laaker_sama_myohempi_opintoala1995 ON laaker_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.laaker_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lis_sama_myohempi_opintoala1995 ON lis_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.lis_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toht_sama_myohempi_opintoala1995 ON toht_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.toht_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yliopistotutkinto_sama_myohempi_opintoala1995 ON yliopistotutkinto_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.yliopistotutkinto_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yo_jatkotutkinto_sama_myohempi_opintoala1995 ON yo_jatkotutkinto_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.yo_jatkotutkinto_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995 ON opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala korkeakoulututkinto_sama_myohempi_opintoala1995 ON korkeakoulututkinto_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.korkeakoulututkinto_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toisen_asteen_tutkinto_sama_myohempi_opintoala1995 ON toisen_asteen_tutkinto_sama_myohempi_opintoala1995.sama_koulutusala_avain = f.toisen_asteen_tutkinto_sama_myohempi_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lu_sama_myohempi_iscfibroad2013 ON lu_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.lu_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amm_sama_myohempi_iscfibroad2013 ON amm_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.amm_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opist_sama_myohempi_iscfibroad2013 ON opist_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.opist_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ammka_sama_myohempi_iscfibroad2013 ON ammka_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.ammka_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala akk_sama_myohempi_iscfibroad2013 ON akk_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.akk_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amk_sama_myohempi_iscfibroad2013 ON amk_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.amk_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ylamk_sama_myohempi_iscfibroad2013 ON ylamk_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.ylamk_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ykk_sama_myohempi_iscfibroad2013 ON ykk_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.ykk_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala laaker_sama_myohempi_iscfibroad2013 ON laaker_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.laaker_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lis_sama_myohempi_iscfibroad2013 ON lis_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.lis_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toht_sama_myohempi_iscfibroad2013 ON toht_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.toht_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yliopistotutkinto_sama_myohempi_iscfibroad2013 ON yliopistotutkinto_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.yliopistotutkinto_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yo_jatkotutkinto_sama_myohempi_iscfibroad2013 ON yo_jatkotutkinto_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.yo_jatkotutkinto_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013 ON opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala korkeakoulututkinto_sama_myohempi_iscfibroad2013 ON korkeakoulututkinto_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.korkeakoulututkinto_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013 ON toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013.sama_koulutusala_avain = f.toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lu_sama_myohempi_iscfinarrow2013 ON lu_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.lu_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amm_sama_myohempi_iscfinarrow2013 ON amm_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.amm_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opist_sama_myohempi_iscfinarrow2013 ON opist_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.opist_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ammka_sama_myohempi_iscfinarrow2013 ON ammka_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.ammka_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala akk_sama_myohempi_iscfinarrow2013 ON akk_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.akk_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala amk_sama_myohempi_iscfinarrow2013 ON amk_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.amk_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ylamk_sama_myohempi_iscfinarrow2013 ON ylamk_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.ylamk_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala ykk_sama_myohempi_iscfinarrow2013 ON ykk_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.ykk_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala laaker_sama_myohempi_iscfinarrow2013 ON laaker_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.laaker_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala lis_sama_myohempi_iscfinarrow2013 ON lis_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.lis_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toht_sama_myohempi_iscfinarrow2013 ON toht_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.toht_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yliopistotutkinto_sama_myohempi_iscfinarrow2013 ON yliopistotutkinto_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.yliopistotutkinto_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala yo_jatkotutkinto_sama_myohempi_iscfinarrow2013 ON yo_jatkotutkinto_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013 ON opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala korkeakoulututkinto_sama_myohempi_iscfinarrow2013 ON korkeakoulututkinto_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.korkeakoulututkinto_sama_myohempi_iscfinarrow2013_avain
LEFT JOIN VipunenTK.dbo.d_sama_koulutusala toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013 ON toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013.sama_koulutusala_avain = f.toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_avain



/* Testataan ensin vain tähtimallin luonti / Jarmo CSC 25.11.2015 */

--Truncate table VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
Drop table VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
Select top 0 * into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]


--Insert 50 000 riviä kerrallaan
declare @maxrow int
declare @fromrow int
declare @torow int

set @maxrow = (SELECT max(rivinumero) from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset])
set @fromrow = 1

while @fromrow < @maxrow

begin

	set @torow = @fromrow + 49999

	Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between @fromrow and @torow	

	set @fromrow = @torow + 1

end

/*
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero <= 49999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 50000 and 99999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 100000 and 149999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 150000 and 199999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 200000 and 249999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 250000 and 299999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 300000 and 349999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 350000 and 399999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 400000 and 449999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 450000 and 499999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 500000 and 549999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 550000 and 599999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 600000 and 649999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 650000 and 699999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 700000 and 749999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 750000 and 799999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 800000 and 849999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 850000 and 899999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 900000 and 949999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 950000 and 999999

Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1000000 and 1049999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1050000 and 1099999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1100000 and 1149999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1150000 and 1199999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1200000 and 1249999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1250000 and 1299999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1300000 and 1349999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1350000 and 1399999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1400000 and 1449999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1450000 and 1499999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1500000 and 1549999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1550000 and 1599999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1600000 and 1649999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1650000 and 1699999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1700000 and 1749999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1750000 and 1799999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1800000 and 1849999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1850000 and 1899999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1900000 and 1949999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 1950000 and 1999999

Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2000000 and 2049999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2050000 and 2099999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2100000 and 2149999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2150000 and 2199999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2200000 and 2249999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2250000 and 2299999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2300000 and 2349999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2350000 and 2399999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2400000 and 2449999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2450000 and 2499999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2500000 and 2549999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2550000 and 2599999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2600000 and 2649999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2650000 and 2699999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2700000 and 2749999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2750000 and 2799999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2800000 and 2849999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2850000 and 2899999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2900000 and 2949999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 2950000 and 2999999

Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3000000 and 3049999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3050000 and 3099999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3100000 and 3149999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3150000 and 3199999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3200000 and 3249999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3250000 and 3299999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3300000 and 3349999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3350000 and 3399999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3400000 and 3449999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3450000 and 3499999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3500000 and 3549999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3550000 and 3599999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3600000 and 3649999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3650000 and 3699999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3700000 and 3749999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3750000 and 3799999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3800000 and 3849999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3850000 and 3899999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3900000 and 3949999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 3950000 and 3999999

Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4000000 and 4049999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4050000 and 4099999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4100000 and 4149999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4150000 and 4199999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4200000 and 4249999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4250000 and 4299999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4300000 and 4349999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4350000 and 4399999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4400000 and 4449999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4450000 and 4499999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4500000 and 4549999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4550000 and 4599999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4600000 and 4649999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4650000 and 4699999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4700000 and 4749999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4750000 and 4799999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4800000 and 4849999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4850000 and 4899999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4900000 and 4949999
Insert into VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
	Select * from VipunenTK.[dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]
	where rivinumero between 4950000 and 4999999
*/
GO
USE [ANTERO]
