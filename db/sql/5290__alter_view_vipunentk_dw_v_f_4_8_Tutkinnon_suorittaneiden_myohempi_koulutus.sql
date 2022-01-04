USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]    Script Date: 30.12.2021 16:38:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [dbo].[v_f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus] as

-- CSC JN 6.10.2015
-- Tehty kopiona ja muokkauksena 4.7-näkymästä
--  4_7 -> 4_8
--  aiempi -> myohempi

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus
-- Select * into VipunenTK_DW.dbo.f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus from VipunenTK_DW.dbo.v_f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus
-- Insert into VipunenTK_DW.dbo.f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus Select * from VipunenTK_DW.dbo.v_f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus 


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
	  ,lu_myohempi_tutkinto_suoritettu = Case when lulkm>0 then 'K' else 'E' end

      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
	  ,[amm_sopimusjaksot]
      ,[ammtutklaja]
      ,[ammtutktav]
	  ,amm_ika = Case when ammlkm>0 and ammsuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(ammsuorv as int)) else NULL end
	  ,amm_myohempi_tutkinto_suoritettu = Case when ammlkm>0 then 'K' else 'E' end
      
	  ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
	  ,opist_ika = Case when opistlkm>0 and opistsuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(opistsuorv as int)) else NULL end
	  ,opist_myohempi_tutkinto_suoritettu = Case when opistlkm>0 then 'K' else 'E' end

      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
	  ,ammka_ika = Case when ammkalkm>0 and ammkasuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(ammkasuorv as int)) else NULL end
	  ,ammka_myohempi_tutkinto_suoritettu = Case when ammkalkm>0 then 'K' else 'E' end

      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
	  ,amk_ika = Case when amklkm>0 and amksuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(amksuorv as int)) else NULL end
	  ,amk_myohempi_tutkinto_suoritettu = Case when amklkm>0 then 'K' else 'E' end

      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
	  ,akk_ika = Case when akklkm>0 and akksuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(akksuorv as int)) else NULL end
	  ,akk_myohempi_tutkinto_suoritettu = Case when akklkm>0 then 'K' else 'E' end

      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
	  ,ylamk_ika = Case when ylamklkm>0 and ylamksuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(ylamksuorv as int)) else NULL end
	  ,ylamk_myohempi_tutkinto_suoritettu = Case when ylamklkm>0 then 'K' else 'E' end

      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
	  ,ykk_ika = Case when ykklkm>0 and ykksuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(ykksuorv as int)) else NULL end
	  ,ykk_myohempi_tutkinto_suoritettu = Case when ykklkm>0 then 'K' else 'E' end

      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
	  ,laaker_ika = Case when laakerlkm>0 and laakersuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(laakersuorv as int)) else NULL end
	  ,laaker_myohempi_tutkinto_suoritettu = Case when laakerlkm>0 then 'K' else 'E' end
      
	  ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
	  ,lis_ika = Case when lislkm>0 and lissuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(lissuorv as int)) else NULL end
	  ,lis_myohempi_tutkinto_suoritettu = Case when lislkm>0 then 'K' else 'E' end

      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
	  ,toht_ika = Case when tohtlkm>0 and tohtsuorv not in ('','9999') then ABS(Cast(suorv as int)-Cast(tohtsuorv as int)) else NULL end
	  ,toht_myohempi_tutkinto_suoritettu = Case when tohtlkm>0 then 'K' else 'E' end

      ,[tietolahde]
      ,[rivinumero]
  FROM [dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]

--Jostain syystä aineistossa on rivejä, joissa lkm on nolla mutta tutkintoja on suuret määrät.
--Suodatetaan ne pois.
--CSC Jarmo 6.10.2015
WHERE lkm > 0




GO


