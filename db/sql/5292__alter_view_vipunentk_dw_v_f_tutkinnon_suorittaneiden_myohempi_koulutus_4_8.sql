USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 30.12.2021 16:42:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] AS

--CSC Jarmo 6.10.2015
-- Tehty kopiona ja muokkauksena 4.7-näkymästä
--  4_7 -> 4_8
--  aiempi -> myohempi
-- lisätty alla oleva ehto
	----Poistetaan tulevaisuuteen ulottuvat tarkastelujaksot /CSC Jarmo 4.11.2015
	--where tarkastelujakso_koodi = '99'
	--or cast(data.suorv as int) + d_tarkastelujakso.jaksovuosi <= cast(data.tilastovuosi as int)
-- lisätty ehto koulutusastekohtaisesta tarkastelujaksojen määrästä /CSC Jarmo 11.3.2016

--Drop table VipunenTK_DW.dbo.f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8
--Select * into VipunenTK_DW.dbo.f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8 from VipunenTK_DW.dbo.v_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8

--Truncate table VipunenTK_DW.dbo.f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8 
--Insert into VipunenTK_DW.dbo.f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8 Select * from VipunenTK_DW.dbo.v_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8 

    Select 
	   [tilastovuosi]
      ,[tilv_date]
      ,[sukupuoli_koodi]
      ,[aidinkieli_versio1_koodi]
      ,[suorv]
      ,[suorlk]
      ,[suorituskausikoodi]
      ,data.[koulutusluokitus_avain]
      ,[alvv]
      ,[allk]
      ,[aloituskausikoodi]
      ,data.[oppisopimuskoulutus_koodi]
      ,data.[ammatillisen_koulutuksen_koulutuslaji_koodi]
      ,data.[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi]
	  ,ammatillinen_koulutus_ryhma = akl.[ammatillisen_koulutuksen_luokittelu_4_7_4_8_avain]
	  ,ammatillinen_koulutus_ryhma_avain = akl.[ammatillisen_koulutuksen_luokittelu_avain]
      ,[nuorten_aikuisten_koulutus_amm_koodi]
      ,[syntv]
      ,[ika_avain]
      ,[henkiloiden_lkm]
      ,[lulkm] = Case when lu_ika <= jaksovuosi then lulkm else 0 end
      ,[lukoulk] = Case when lu_ika <= jaksovuosi then lukoulk else '' end
      ,[lusuorv] = Case when lu_ika <= jaksovuosi then lusuorv else '' end
      ,[luaikoul] = Case when lu_ika <= jaksovuosi then luaikoul else '' end
      ,[lu_ika] = Case when lu_ika <= jaksovuosi then lu_ika else NULL end
      ,[lu_myohempi_tutkinto_suoritettu] = Case when lu_ika <= jaksovuosi then lu_myohempi_tutkinto_suoritettu else 'E' end
      ,[ammlkm] = Case when amm_ika <= jaksovuosi then ammlkm else 0 end
      ,[ammkoulk] = Case when amm_ika <= jaksovuosi then ammkoulk else '' end
      ,[ammsuorv] = Case when amm_ika <= jaksovuosi then ammsuorv else '' end
      ,[ammoppis] = Case when amm_ika <= jaksovuosi then ammoppis else '' end
	  ,[amm_sopimusjaksot] = Case when amm_ika <= jaksovuosi then amm_sopimusjaksot else '' end
      ,[ammtutklaja] = Case when amm_ika <= jaksovuosi then ammtutklaja else '' end
      ,[ammtutktav] = Case when amm_ika <= jaksovuosi then ammtutklaja else '' end
      ,[amm_ika] = Case when amm_ika <= jaksovuosi then amm_ika else NULL end
      ,[amm_myohempi_tutkinto_suoritettu] = Case when amm_ika <= jaksovuosi then amm_myohempi_tutkinto_suoritettu else 'E' end
      ,[opistlkm] = Case when opist_ika <= jaksovuosi then opistlkm else 0 end
      ,[opistkoulk] = Case when opist_ika <= jaksovuosi then opistkoulk else '' end
      ,[opistsuorv] = Case when opist_ika <= jaksovuosi then opistsuorv else '' end
      ,[opist_ika] = Case when opist_ika <= jaksovuosi then opist_ika else NULL end
      ,[opist_myohempi_tutkinto_suoritettu] = Case when opist_ika <= jaksovuosi then opist_myohempi_tutkinto_suoritettu else 'E' end
      ,[ammkalkm] = Case when ammka_ika <= jaksovuosi then ammkalkm else 0 end
      ,[ammkakoulk] = Case when ammka_ika <= jaksovuosi then ammkakoulk else '' end
      ,[ammkasuorv] = Case when ammka_ika <= jaksovuosi then ammkasuorv else '' end
      ,[ammka_ika] = Case when ammka_ika <= jaksovuosi then ammka_ika else NULL end
      ,[ammka_myohempi_tutkinto_suoritettu] = Case when ammka_ika <= jaksovuosi then ammka_myohempi_tutkinto_suoritettu else 'E' end
      ,[amklkm] = Case when amk_ika <= jaksovuosi then amklkm else 0 end
      ,[amkkoulk] = Case when amk_ika <= jaksovuosi then amkkoulk else '' end
      ,[amksuorv] = Case when amk_ika <= jaksovuosi then amksuorv else '' end
      ,[amkaikoul] = Case when amk_ika <= jaksovuosi then amkaikoul else '' end
      ,[amk_ika] = Case when amk_ika <= jaksovuosi then amk_ika else '' end
      ,[amk_myohempi_tutkinto_suoritettu] = Case when amk_ika <= jaksovuosi then amk_myohempi_tutkinto_suoritettu else 'E' end
      ,[akklkm] = Case when akk_ika <= jaksovuosi then akklkm else 0 end
      ,[akkkoulk] = Case when akk_ika <= jaksovuosi then akkkoulk else '' end
      ,[akksuorv] = Case when akk_ika <= jaksovuosi then akksuorv else '' end
      ,[akk_ika] = Case when akk_ika <= jaksovuosi then akk_ika else NULL end
      ,[akk_myohempi_tutkinto_suoritettu] = Case when akk_ika <= jaksovuosi then akk_myohempi_tutkinto_suoritettu else 'E' end
      ,[ylamklkm] = Case when ylamk_ika <= jaksovuosi then ylamklkm else 0 end
      ,[ylamkkoulk] = Case when ylamk_ika <= jaksovuosi then ylamkkoulk else '' end
      ,[ylamksuorv] = Case when ylamk_ika <= jaksovuosi then ylamksuorv else '' end
      ,[ylamk_ika] = Case when ylamk_ika <= jaksovuosi then ylamk_ika else NULL end
      ,[ylamk_myohempi_tutkinto_suoritettu] = Case when ylamk_ika <= jaksovuosi then ylamk_myohempi_tutkinto_suoritettu else 'E' end
      ,[ykklkm] = Case when ykk_ika <= jaksovuosi then ykklkm else 0 end
      ,[ykkkoulk] = Case when ykk_ika <= jaksovuosi then ykkkoulk else '' end
      ,[ykksuorv] = Case when ykk_ika <= jaksovuosi then ykksuorv else '' end
      ,[ykk_ika] = Case when ykk_ika <= jaksovuosi then ykk_ika else NULL end
      ,[ykk_myohempi_tutkinto_suoritettu] = Case when ykk_ika <= jaksovuosi then ykk_myohempi_tutkinto_suoritettu else 'E' end
      ,[laakerlkm] = Case when laaker_ika <= jaksovuosi then laakerlkm else 0 end
      ,[laakerkoulk] = Case when laaker_ika <= jaksovuosi then laakerkoulk else '' end
      ,[laakersuorv] = Case when laaker_ika <= jaksovuosi then laakersuorv else '' end
      ,[laaker_ika] = Case when laaker_ika <= jaksovuosi then laaker_ika else NULL end
      ,[laaker_myohempi_tutkinto_suoritettu] = Case when laaker_ika <= jaksovuosi then laaker_myohempi_tutkinto_suoritettu else 'E' end
      ,[lislkm] = Case when lis_ika <= jaksovuosi then lislkm else 0 end
      ,[liskoulk] = Case when lis_ika <= jaksovuosi then liskoulk else '' end
      ,[lissuorv] = Case when lis_ika <= jaksovuosi then lissuorv else '' end
      ,[lis_ika] = Case when lis_ika <= jaksovuosi then lis_ika else NULL end
      ,[lis_myohempi_tutkinto_suoritettu] = Case when lis_ika <= jaksovuosi then lis_myohempi_tutkinto_suoritettu else 'E' end
      ,[tohtlkm] = Case when toht_ika <= jaksovuosi then tohtlkm else 0 end
      ,[tohtkoulk] = Case when toht_ika <= jaksovuosi then tohtkoulk else '' end
      ,[tohtsuorv] = Case when toht_ika <= jaksovuosi then tohtsuorv else '' end
      ,[toht_ika] = Case when toht_ika <= jaksovuosi then toht_ika else NULL end
      ,[toht_myohempi_tutkinto_suoritettu] = Case when toht_ika <= jaksovuosi then toht_myohempi_tutkinto_suoritettu else 'E' end


      ,data.[tietolahde]
      ,[rivinumero]
	  ,tarkastelujakso_koodi
	from [dbo].[f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus] data
	join VipunenTK.dbo.d_tarkastelujakso on tarkastelujakso_koodi in ('1', '2', '3', '4', '7', '10', '13', '16', '99') 
	--Huom! Tässä tehdään karteesinen tulo tarkoituksella / CSC Jarmo 14.9.2015
	left join VipunenTK_lisatiedot.dbo.ammatillinen_koulutus_luokittelu akl
		on  akl.[oppisopimuskoulutus_koodi] = data.oppisopimuskoulutus_koodi
		and akl.[ammatillisen_koulutuksen_koulutuslaji_koodi] = data.ammatillisen_koulutuksen_koulutuslaji_koodi
		and akl.[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] = data.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi
	--Poistetaan tulevaisuuteen ulottuvat tarkastelujaksot /CSC Jarmo 4.11.2015
	left join VipunenTK.dbo.d_koulutusluokitus kl
		on kl.koulutusluokitus_avain = data.koulutusluokitus_avain

	where 
	-- tarkastelujaksojen määrä riippuu koulutusaste2002:sta
	--   61,62,63,71,72,73,81,82 niin käytetään tarkastelujaksoja ('4', '7', '10', '13', '16', '99')
	--   31, 32, 50, 90 (itse asiassa kaikki joita ei ole mainittu edellisellä rivillä) niin käytetään tarkastelujaksoja ('1', '2', '3', '4', '7', '10', '13', '16', '99') 
		(
			( (kl.koulutusaste2002_koodi in ('61','62','63','71','72','73','81','82') 
				or kl.Koulutusaste_taso2_koodi in ('61','62','63','71','72','73','81','82')
			  ) and tarkastelujakso_koodi in ('4', '7', '10', '13', '16', '99') 
			)
			or
			( kl.koulutusaste2002_koodi not in ('61','62','63','71','72','73','81','82') 
			  and kl.Koulutusaste_taso2_koodi not in ('61','62','63','71','72','73','81','82')
			  and tarkastelujakso_koodi in ('1', '2', '3', '4', '7', '10', '13', '16', '99') 
			)
		) 
		and 
		(
			tarkastelujakso_koodi = '99'
			or 
			cast(data.suorv as int) + d_tarkastelujakso.jaksovuosi <= cast(data.tilastovuosi as int)
		)



GO


