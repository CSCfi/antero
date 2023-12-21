USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]    Script Date: 21.12.2023 12:22:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE OR ALTER view [dbo].[v_f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus] as

-- CSC JN 10.9.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus
-- Select * into VipunenTK_DW.dbo.f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus from VipunenTK_DW.dbo.v_f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus
-- Insert into VipunenTK_DW.dbo.f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus Select * from VipunenTK_DW.dbo.v_f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus 


SELECT tilastovuosi = [tilv]
      ,[tilv_date]
      ,sukupuoli_koodi = [sp]
	  ,aidinkieli_versio1_koodi = aikielir1
      ,[suorv]
      ,[suorlk]
      ,[suorituskausikoodi]
      ,koulutusluokitus_avain = [koulk]
      ,[alvv]
      ,[allk]
      ,[aloituskausikoodi]
      ,[oppisopimuskoulutus_koodi] = [oppis]
	  ,[sopimusjaksot]
      ,[ammatillisen_koulutuksen_koulutuslaji_koodi] = [tutklaja]
      ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] = [tutktav]
      ,[nuorten_aikuisten_koulutus_amm_koodi] = [aikoul]
      ,[syntv]
      ,ika_avain = ika
	  ,henkiloiden_lkm = [lkm]

      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
	  ,lu_ika = Case when lulkm>0 and lusuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(lusuorv as int)) else NULL end
	  ,lu_aiempi_tutkinto_suoritettu = Case when lulkm>0 then 'K' else 'E' end

      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
	  ,[amm_sopimusjaksot]
      ,[ammtutklaja]
      ,[ammtutktav]
	  ,amm_ika = Case when ammlkm>0 and ammsuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(ammsuorv as int)) else NULL end
	  ,amm_aiempi_tutkinto_suoritettu = Case when ammlkm>0 then 'K' else 'E' end
      
	  ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
	  ,opist_ika = Case when opistlkm>0 and opistsuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(opistsuorv as int)) else NULL end
	  ,opist_aiempi_tutkinto_suoritettu = Case when opistlkm>0 then 'K' else 'E' end

      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
	  ,ammka_ika = Case when ammkalkm>0 and ammkasuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(ammkasuorv as int)) else NULL end
	  ,ammka_aiempi_tutkinto_suoritettu = Case when ammkalkm>0 then 'K' else 'E' end

      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
	  ,amk_ika = Case when amklkm>0 and amksuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(amksuorv as int)) else NULL end
	  ,amk_aiempi_tutkinto_suoritettu = Case when amklkm>0 then 'K' else 'E' end

      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
	  ,akk_ika = Case when akklkm>0 and akksuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(akksuorv as int)) else NULL end
	  ,akk_aiempi_tutkinto_suoritettu = Case when akklkm>0 then 'K' else 'E' end

      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
	  ,ylamk_ika = Case when ylamklkm>0 and ylamksuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(ylamksuorv as int)) else NULL end
	  ,ylamk_aiempi_tutkinto_suoritettu = Case when ylamklkm>0 then 'K' else 'E' end

      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
	  ,ykk_ika = Case when ykklkm>0 and ykksuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(ykksuorv as int)) else NULL end
	  ,ykk_aiempi_tutkinto_suoritettu = Case when ykklkm>0 then 'K' else 'E' end

      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
	  ,laaker_ika = Case when laakerlkm>0 and laakersuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(laakersuorv as int)) else NULL end
	  ,laaker_aiempi_tutkinto_suoritettu = Case when laakerlkm>0 then 'K' else 'E' end
      
	  ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
	  ,lis_ika = Case when lislkm>0 and lissuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(lissuorv as int)) else NULL end
	  ,lis_aiempi_tutkinto_suoritettu = Case when lislkm>0 then 'K' else 'E' end

      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
	  ,toht_ika = Case when tohtlkm>0 and tohtsuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(tohtsuorv as int)) else NULL end
	  ,toht_aiempi_tutkinto_suoritettu = Case when tohtlkm>0 then 'K' else 'E' end

	  ,Koulutusaste_taso2_koodi as [koulutustaso2_koodi]
      ,[iscle2011_koodi] as [koulutustaso1_koodi]
	  ,[korkein_aiempi_koulutus_taso2_tunnus] = null
	  ,[korkein_aiempi_koulutus_taso1_tunnus] = null
	  ,[koulutustason_nousu_taso2] = null
	  ,[koulutustason_nousu_taso1] = null

      ,f.[tietolahde]
      ,[rivinumero]
  FROM [dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus] f
  LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_kl
	ON d_kl.koulutusluokitus_avain = f.koulk







GO


