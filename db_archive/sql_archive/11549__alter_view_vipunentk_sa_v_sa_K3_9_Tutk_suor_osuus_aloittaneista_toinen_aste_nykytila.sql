USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila]    Script Date: 9.1.2026 12.51.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















CREATE OR ALTER VIEW [dbo].[v_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila] AS
-- Palauta lähtöaineisto järjestäjien ja koulutusten osalta nykytilaan päivitettynä
-- VipunenTK-kannan dimensiotaulujen pitää olla päivitettynä
-- Päivitetty aineistoon _14 /Jarmo 9.10.2014 

-- perusaineisto [VipunenTK_SA].[dbo].[v_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste] => (943933 row(s) affected)

-- Select * from [VipunenTK_SA].[dbo].v_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila


SELECT
       [tilv]
      ,[lahde]
      ,[sp]
      ,[syntv]
      ,[aikielir1]
      ,[alvv]
      ,[allk]
      ,[klaji]
      ,[ophal] = Case when lahde='21' then '1' else ophal end
      ,[jarj] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[jarj]), [jarj])
   ,[kkun] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_alueluokitus_kunta_nykytila] WHERE alueluokitus_koodi=[kkun]), [kkun])
   ,[koulk] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[koulk]), [koulk])
   ,[pohjkoulk] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[pohjkoulk]), [pohjkoulk])
--      ,[lusuorv_2004]
--      ,[lusuorlk_2004]
--   ,[lututkmaak_2004] = coalesce(nullif([lututkmaak_2004],'20'),'01')
--      ,[lututkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2004]), [lututkjarj_2004])
--   ,[lututkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2004]), [lututkkoulk_2004])
--      ,[amptsuorv_2004]
--      ,[amptsuorlk_2004]
--   ,[ampttutkmaak_2004] = coalesce(nullif([ampttutkmaak_2004],'20'),'01')
--      ,[ampttutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2004]), [ampttutkjarj_2004])
--   ,[ampttutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2004]), [ampttutkkoulk_2004])
--      ,[amlksuorv_2004]
--      ,[amlksuorlk_2004]
--   ,[amlktutkmaak_2004] = coalesce(nullif([amlktutkmaak_2004],'20'),'01')
--      ,[amlktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2004]), [amlktutkjarj_2004])
--   ,[amlktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2004]), [amlktutkkoulk_2004])
--      ,[muukksuorv_2004]
--      ,[muukksuorlk_2004]
--   ,[muukktutkmaak_2004] = coalesce(nullif([muukktutkmaak_2004],'20'),'01')
--      ,[muukktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2004]), [muukktutkjarj_2004])
--   ,[muukktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2004]), [muukktutkkoulk_2004])
--      ,[lusuorv_2005]
--      ,[lusuorlk_2005]
--   ,[lututkmaak_2005] = coalesce(nullif([lututkmaak_2005],'20'),'01')
--      ,[lututkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2005]), [lututkjarj_2005])
--   ,[lututkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2005]), [lututkkoulk_2005])
--      ,[amptsuorv_2005]
--      ,[amptsuorlk_2005]
--   ,[ampttutkmaak_2005] = coalesce(nullif([ampttutkmaak_2005],'20'),'01')
--      ,[ampttutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2005]), [ampttutkjarj_2005])
--   ,[ampttutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2005]), [ampttutkkoulk_2005])
--      ,[amlksuorv_2005]
--      ,[amlksuorlk_2005]
--   ,[amlktutkmaak_2005] = coalesce(nullif([amlktutkmaak_2005],'20'),'01')
--      ,[amlktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2005]), [amlktutkjarj_2005])
--   ,[amlktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2005]), [amlktutkkoulk_2005])
--      ,[muukksuorv_2005]
--      ,[muukksuorlk_2005]
--   ,[muukktutkmaak_2005] = coalesce(nullif([muukktutkmaak_2005],'20'),'01')
--      ,[muukktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2005]), [muukktutkjarj_2005])
--   ,[muukktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2005]), [muukktutkkoulk_2005])
--      ,[lusuorv_2006]
--      ,[lusuorlk_2006]
--   ,[lututkmaak_2006] = coalesce(nullif([lututkmaak_2006],'20'),'01')
--      ,[lututkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2006]), [lututkjarj_2006])
--   ,[lututkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2006]), [lututkkoulk_2006])
--      ,[amptsuorv_2006]
--      ,[amptsuorlk_2006]
--   ,[ampttutkmaak_2006] = coalesce(nullif([ampttutkmaak_2006],'20'),'01')
--      ,[ampttutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2006]), [ampttutkjarj_2006])
--   ,[ampttutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2006]), [ampttutkkoulk_2006])
--      ,[amlksuorv_2006]
--      ,[amlksuorlk_2006]
--   ,[amlktutkmaak_2006] = coalesce(nullif([amlktutkmaak_2006],'20'),'01')
--      ,[amlktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2006]), [amlktutkjarj_2006])
--   ,[amlktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2006]), [amlktutkkoulk_2006])
--      ,[muukksuorv_2006]
--      ,[muukksuorlk_2006]
--   ,[muukktutkmaak_2006] = coalesce(nullif([muukktutkmaak_2006],'20'),'01')
--      ,[muukktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2006]), [muukktutkjarj_2006])
--   ,[muukktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2006]), [muukktutkkoulk_2006])
--      ,[lusuorv_2007]
--      ,[lusuorlk_2007]
--   ,[lututkmaak_2007] = coalesce(nullif([lututkmaak_2007],'20'),'01')
--      ,[lututkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2007]), [lututkjarj_2007])
--   ,[lututkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2007]), [lututkkoulk_2007])
--      ,[amptsuorv_2007]
--      ,[amptsuorlk_2007]
--   ,[ampttutkmaak_2007] = coalesce(nullif([ampttutkmaak_2007],'20'),'01')
--      ,[ampttutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2007]), [ampttutkjarj_2007])
--   ,[ampttutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2007]), [ampttutkkoulk_2007])
--      ,[amlksuorv_2007]
--      ,[amlksuorlk_2007]
--   ,[amlktutkmaak_2007] = coalesce(nullif([amlktutkmaak_2007],'20'),'01')
--      ,[amlktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2007]), [amlktutkjarj_2007])
--   ,[amlktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2007]), [amlktutkkoulk_2007])
--      ,[muukksuorv_2007]
--      ,[muukksuorlk_2007]
--   ,[muukktutkmaak_2007] = coalesce(nullif([muukktutkmaak_2007],'20'),'01')
--      ,[muukktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2007]), [muukktutkjarj_2007])
--   ,[muukktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2007]), [muukktutkkoulk_2007])
--      ,[lusuorv_2008]
--      ,[lusuorlk_2008]
--   ,[lututkmaak_2008] = coalesce(nullif([lututkmaak_2008],'20'),'01')
--      ,[lututkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2008]), [lututkjarj_2008])
--   ,[lututkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2008]), [lututkkoulk_2008])
--      ,[amptsuorv_2008]
--      ,[amptsuorlk_2008]
--   ,[ampttutkmaak_2008] = coalesce(nullif([ampttutkmaak_2008],'20'),'01')
--      ,[ampttutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2008]), [ampttutkjarj_2008])
--   ,[ampttutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2008]), [ampttutkkoulk_2008])
--      ,[amlksuorv_2008]
--      ,[amlksuorlk_2008]
--   ,[amlktutkmaak_2008] = coalesce(nullif([amlktutkmaak_2008],'20'),'01')
--      ,[amlktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2008]), [amlktutkjarj_2008])
--   ,[amlktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2008]), [amlktutkkoulk_2008])
--      ,[muukksuorv_2008]
--      ,[muukksuorlk_2008]
--   ,[muukktutkmaak_2008] = coalesce(nullif([muukktutkmaak_2008],'20'),'01')
--      ,[muukktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2008]), [muukktutkjarj_2008])
--   ,[muukktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2008]), [muukktutkkoulk_2008])

      ,[lusuorv_2009]
      ,[lusuorlk_2009]
   ,[lututkmaak_2009] = coalesce(nullif([lututkmaak_2009],'20'),'01')
      ,[lututkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2009]), [lututkjarj_2009])
   ,[lututkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2009]), [lututkkoulk_2009])
      ,[amptsuorv_2009]
      ,[amptsuorlk_2009]
   ,[ampttutkmaak_2009] = coalesce(nullif([ampttutkmaak_2009],'20'),'01')
      ,[ampttutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2009]), [ampttutkjarj_2009])
   ,[ampttutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2009]), [ampttutkkoulk_2009])
      ,[amlksuorv_2009]
      ,[amlksuorlk_2009]
   ,[amlktutkmaak_2009] = coalesce(nullif([amlktutkmaak_2009],'20'),'01')
      ,[amlktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2009]), [amlktutkjarj_2009])
   ,[amlktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2009]), [amlktutkkoulk_2009])
      ,[muukksuorv_2009]
      ,[muukksuorlk_2009]
   ,[muukktutkmaak_2009] = coalesce(nullif([muukktutkmaak_2009],'20'),'01')
      ,[muukktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2009]), [muukktutkjarj_2009])
   ,[muukktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2009]), [muukktutkkoulk_2009])

--   ,[luopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2004]), [luopiskkoulk_2004])
--      ,[luopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2004]), [luopiskjarj_2004])
--   ,[lukmaak_2004] = coalesce(nullif([lukmaak_2004],'20'),'01')
--   ,[amptopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2004]), [amptopiskkoulk_2004])
--      ,[amptopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2004]), [amptopiskjarj_2004])
--   ,[amptkmaak_2004] = coalesce(nullif([amptkmaak_2004],'20'),'01')
--   ,[amlkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2004]), [amlkopiskkoulk_2004])
--      ,[amlkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2004]), [amlkopiskjarj_2004])
--   ,[amlkkmaak_2004] = coalesce(nullif([amlkkmaak_2004],'20'),'01')
--   ,[muukkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2004]), [muukkopiskkoulk_2004])
--      ,[muukkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2004]), [muukkopiskjarj_2004])
--   ,[muukkkmaak_2004] = coalesce(nullif([muukkkmaak_2004],'20'),'01')
--   ,[luopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2005]), [luopiskkoulk_2005])
--      ,[luopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2005]), [luopiskjarj_2005])
--   ,[lukmaak_2005] = coalesce(nullif([lukmaak_2005],'20'),'01')
--   ,[amptopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2005]), [amptopiskkoulk_2005])
--      ,[amptopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2005]), [amptopiskjarj_2005])
--   ,[amptkmaak_2005] = coalesce(nullif([amptkmaak_2005],'20'),'01')
--   ,[amlkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2005]), [amlkopiskkoulk_2005])
--      ,[amlkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2005]), [amlkopiskjarj_2005])
--   ,[amlkkmaak_2005] = coalesce(nullif([amlkkmaak_2005],'20'),'01')
--   ,[muukkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2005]), [muukkopiskkoulk_2005])
--      ,[muukkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2005]), [muukkopiskjarj_2005])
--   ,[muukkkmaak_2005] = coalesce(nullif([muukkkmaak_2005],'20'),'01')

--   ,[luopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2006]), [luopiskkoulk_2006])
--      ,[luopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2006]), [luopiskjarj_2006])
--   ,[lukmaak_2006] = coalesce(nullif([lukmaak_2006],'20'),'01')
--   ,[amptopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2006]), [amptopiskkoulk_2006])
--      ,[amptopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2006]), [amptopiskjarj_2006])
--   ,[amptkmaak_2006] = coalesce(nullif([amptkmaak_2006],'20'),'01')
--   ,[amlkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2006]), [amlkopiskkoulk_2006])
--      ,[amlkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2006]), [amlkopiskjarj_2006])
--   ,[amlkkmaak_2006] = coalesce(nullif([amlkkmaak_2006],'20'),'01')
--   ,[muukkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2006]), [muukkopiskkoulk_2006])
--      ,[muukkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2006]), [muukkopiskjarj_2006])
--   ,[muukkkmaak_2006] = coalesce(nullif([muukkkmaak_2006],'20'),'01')

--   ,[luopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2007]), [luopiskkoulk_2007])
--      ,[luopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2007]), [luopiskjarj_2007])
--   ,[lukmaak_2007] = coalesce(nullif([lukmaak_2007],'20'),'01')
--   ,[amptopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2007]), [amptopiskkoulk_2007])
--      ,[amptopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2007]), [amptopiskjarj_2007])
--   ,[amptkmaak_2007] = coalesce(nullif([amptkmaak_2007],'20'),'01')
--   ,[amlkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2007]), [amlkopiskkoulk_2007])
--      ,[amlkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2007]), [amlkopiskjarj_2007])
--   ,[amlkkmaak_2007] = coalesce(nullif([amlkkmaak_2007],'20'),'01')
--   ,[muukkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2007]), [muukkopiskkoulk_2007])
--      ,[muukkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2007]), [muukkopiskjarj_2007])
--   ,[muukkkmaak_2007] = coalesce(nullif([muukkkmaak_2007],'20'),'01')

--   ,[luopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2008]), [luopiskkoulk_2008])
--      ,[luopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2008]), [luopiskjarj_2008])
--   ,[lukmaak_2008] = coalesce(nullif([lukmaak_2008],'20'),'01')
--   ,[amptopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2008]), [amptopiskkoulk_2008])
--      ,[amptopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2008]), [amptopiskjarj_2008])
--   ,[amptkmaak_2008] = coalesce(nullif([amptkmaak_2008],'20'),'01')
--   ,[amlkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2008]), [amlkopiskkoulk_2008])
--      ,[amlkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2008]), [amlkopiskjarj_2008])
--   ,[amlkkmaak_2008] = coalesce(nullif([amlkkmaak_2008],'20'),'01')
--   ,[muukkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2008]), [muukkopiskkoulk_2008])
--      ,[muukkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2008]), [muukkopiskjarj_2008])
--   ,[muukkkmaak_2008] = coalesce(nullif([muukkkmaak_2008],'20'),'01')

   ,[luopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2009]), [luopiskkoulk_2009])
      ,[luopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2009]), [luopiskjarj_2009])
   ,[lukmaak_2009] = coalesce(nullif([lukmaak_2009],'20'),'01')
   ,[amptopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2009]), [amptopiskkoulk_2009])
      ,[amptopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2009]), [amptopiskjarj_2009])
   ,[amptkmaak_2009] = coalesce(nullif([amptkmaak_2009],'20'),'01')
   ,[amlkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2009]), [amlkopiskkoulk_2009])
      ,[amlkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2009]), [amlkopiskjarj_2009])
   ,[amlkkmaak_2009] = coalesce(nullif([amlkkmaak_2009],'20'),'01')
   ,[muukkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2009]), [muukkopiskkoulk_2009])
      ,[muukkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2009]), [muukkopiskjarj_2009])
   ,[muukkkmaak_2009] = coalesce(nullif([muukkkmaak_2009],'20'),'01')

--      ,[ptoim1r5_2004]
--      ,[amas_2004]
--      ,[ptoim1r5_2005]
--      ,[amas_2005]
--      ,[ptoim1r5_2006]
--      ,[amas_2006]
--      ,[ptoim1r5_2007]
--      ,[amas_2007]
--      ,[ptoim1r5_2008]
--      ,[amas_2008]
      ,[ptoim1r5_2009]
      ,[amas_2009]
      ,[lusuorv_2010]
      ,[lusuorlk_2010]
   ,[lututkmaak_2010] = coalesce(nullif([lututkmaak_2010],'20'),'01')
      ,[lututkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2010]), [lututkjarj_2010])
   ,[lututkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2010]), [lututkkoulk_2010])
      ,[amptsuorv_2010]
      ,[amptsuorlk_2010]
   ,[ampttutkmaak_2010] = coalesce(nullif([ampttutkmaak_2010],'20'),'01')
      ,[ampttutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2010]), [ampttutkjarj_2010])
   ,[ampttutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2010]), [ampttutkkoulk_2010])
      ,[amlksuorv_2010]
      ,[amlksuorlk_2010]
   ,[amlktutkmaak_2010] = coalesce(nullif([amlktutkmaak_2010],'20'),'01')
      ,[amlktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2010]), [amlktutkjarj_2010])
   ,[amlktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2010]), [amlktutkkoulk_2010])
      ,[muukksuorv_2010]
      ,[muukksuorlk_2010]
   ,[muukktutkmaak_2010] = coalesce(nullif([muukktutkmaak_2010],'20'),'01')
      ,[muukktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2010]), [muukktutkjarj_2010])
   ,[muukktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2010]), [muukktutkkoulk_2010])
   ,[luopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2010]), [luopiskkoulk_2010])
      ,[luopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2010]), [luopiskjarj_2010])
   ,[lukmaak_2010] = coalesce(nullif([lukmaak_2010],'20'),'01')
   ,[amptopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2010]), [amptopiskkoulk_2010])
      ,[amptopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2010]), [amptopiskjarj_2010])
   ,[amptkmaak_2010] = coalesce(nullif([amptkmaak_2010],'20'),'01')
   ,[amlkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2010]), [amlkopiskkoulk_2010])
      ,[amlkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2010]), [amlkopiskjarj_2010])
   ,[amlkkmaak_2010] = coalesce(nullif([amlkkmaak_2010],'20'),'01')
   ,[muukkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2010]), [muukkopiskkoulk_2010])
      ,[muukkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2010]), [muukkopiskjarj_2010])
   ,[muukkkmaak_2010] = coalesce(nullif([muukkkmaak_2010],'20'),'01')
      ,[ptoim1r5_2010]
      ,[amas_2010]
      ,[lusuorv_2011]
      ,[lusuorlk_2011]
   ,[lututkmaak_2011] = coalesce(nullif([lututkmaak_2011],'20'),'01')
      ,[lututkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2011]), [lututkjarj_2011])
   ,[lututkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2011]), [lututkkoulk_2011])
      ,[amptsuorv_2011]
      ,[amptsuorlk_2011]
   ,[ampttutkmaak_2011] = coalesce(nullif([ampttutkmaak_2011],'20'),'01')
      ,[ampttutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2011]), [ampttutkjarj_2011])
   ,[ampttutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2011]), [ampttutkkoulk_2011])
      ,[amlksuorv_2011]
      ,[amlksuorlk_2011]
   ,[amlktutkmaak_2011] = coalesce(nullif([amlktutkmaak_2011],'20'),'01')
      ,[amlktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2011]), [amlktutkjarj_2011])
   ,[amlktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2011]), [amlktutkkoulk_2011])
      ,[muukksuorv_2011]
      ,[muukksuorlk_2011]
   ,[muukktutkmaak_2011] = coalesce(nullif([muukktutkmaak_2011],'20'),'01')
      ,[muukktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2011]), [muukktutkjarj_2011])
   ,[muukktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2011]), [muukktutkkoulk_2011])
   ,[luopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2011]), [luopiskkoulk_2011])
      ,[luopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2011]), [luopiskjarj_2011])
   ,[lukmaak_2011] = coalesce(nullif([lukmaak_2011],'20'),'01')
   ,[amptopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2011]), [amptopiskkoulk_2011])
      ,[amptopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2011]), [amptopiskjarj_2011])
   ,[amptkmaak_2011] = coalesce(nullif([amptkmaak_2011],'20'),'01')
   ,[amlkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2011]), [amlkopiskkoulk_2011])
      ,[amlkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2011]), [amlkopiskjarj_2011])
   ,[amlkkmaak_2011] = coalesce(nullif([amlkkmaak_2011],'20'),'01')
   ,[muukkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2011]), [muukkopiskkoulk_2011])
      ,[muukkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2011]), [muukkopiskjarj_2011])
   ,[muukkkmaak_2011] = coalesce(nullif([muukkkmaak_2011],'20'),'01')
      ,[ptoim1r5_2011]
      ,[amas_2011]
--2012     
      ,[lusuorv_2012]
      ,[lusuorlk_2012]
   ,[lututkmaak_2012] = coalesce(nullif([lututkmaak_2012],'20'),'01')
      ,[lututkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2012]), [lututkjarj_2012])
   ,[lututkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2012]), [lututkkoulk_2012])
      ,[amptsuorv_2012]
      ,[amptsuorlk_2012]
   ,[ampttutkmaak_2012] = coalesce(nullif([ampttutkmaak_2012],'20'),'01')
      ,[ampttutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2012]), [ampttutkjarj_2012])
   ,[ampttutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2012]), [ampttutkkoulk_2012])
      ,[amlksuorv_2012]
      ,[amlksuorlk_2012]
   ,[amlktutkmaak_2012] = coalesce(nullif([amlktutkmaak_2012],'20'),'01')
      ,[amlktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2012]), [amlktutkjarj_2012])
   ,[amlktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2012]), [amlktutkkoulk_2012])
      ,[muukksuorv_2012]
      ,[muukksuorlk_2012]
   ,[muukktutkmaak_2012] = coalesce(nullif([muukktutkmaak_2012],'20'),'01')
      ,[muukktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2012]), [muukktutkjarj_2012])
   ,[muukktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2012]), [muukktutkkoulk_2012])
   ,[luopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2012]), [luopiskkoulk_2012])
      ,[luopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2012]), [luopiskjarj_2012])
   ,[lukmaak_2012] = coalesce(nullif([lukmaak_2012],'20'),'01')
   ,[amptopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2012]), [amptopiskkoulk_2012])
      ,[amptopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2012]), [amptopiskjarj_2012])
   ,[amptkmaak_2012] = coalesce(nullif([amptkmaak_2012],'20'),'01')
   ,[amlkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2012]), [amlkopiskkoulk_2012])
      ,[amlkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2012]), [amlkopiskjarj_2012])
   ,[amlkkmaak_2012] = coalesce(nullif([amlkkmaak_2012],'20'),'01')
   ,[muukkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2012]), [muukkopiskkoulk_2012])
      ,[muukkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2012]), [muukkopiskjarj_2012])
   ,[muukkkmaak_2012] = coalesce(nullif([muukkkmaak_2012],'20'),'01')
      ,[ptoim1r5_2012]
      ,[amas_2012]
--2013     
      ,[lusuorv_2013]
      ,[lusuorlk_2013]
   ,[lututkmaak_2013] = coalesce(nullif([lututkmaak_2013],'20'),'01')
      ,[lututkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2013]), [lututkjarj_2013])
   ,[lututkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2013]), [lututkkoulk_2013])
      ,[amptsuorv_2013]
      ,[amptsuorlk_2013]
   ,[ampttutkmaak_2013] = coalesce(nullif([ampttutkmaak_2013],'20'),'01')
      ,[ampttutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2013]), [ampttutkjarj_2013])
   ,[ampttutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2013]), [ampttutkkoulk_2013])
      ,[amlksuorv_2013]
      ,[amlksuorlk_2013]
   ,[amlktutkmaak_2013] = coalesce(nullif([amlktutkmaak_2013],'20'),'01')
      ,[amlktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2013]), [amlktutkjarj_2013])
   ,[amlktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2013]), [amlktutkkoulk_2013])
      ,[muukksuorv_2013]
      ,[muukksuorlk_2013]
   ,[muukktutkmaak_2013] = coalesce(nullif([muukktutkmaak_2013],'20'),'01')
      ,[muukktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2013]), [muukktutkjarj_2013])
   ,[muukktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2013]), [muukktutkkoulk_2013])
   ,[luopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2013]), [luopiskkoulk_2013])
      ,[luopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2013]), [luopiskjarj_2013])
   ,[lukmaak_2013] = coalesce(nullif([lukmaak_2013],'20'),'01')
   ,[amptopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2013]), [amptopiskkoulk_2013])
      ,[amptopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2013]), [amptopiskjarj_2013])
   ,[amptkmaak_2013] = coalesce(nullif([amptkmaak_2013],'20'),'01')
   ,[amlkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2013]), [amlkopiskkoulk_2013])
      ,[amlkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2013]), [amlkopiskjarj_2013])
   ,[amlkkmaak_2013] = coalesce(nullif([amlkkmaak_2013],'20'),'01')
   ,[muukkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2013]), [muukkopiskkoulk_2013])
      ,[muukkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2013]), [muukkopiskjarj_2013])
   ,[muukkkmaak_2013] = coalesce(nullif([muukkkmaak_2013],'20'),'01')
      ,[ptoim1r5_2013]
      ,[amas_2013]

-- 2014

      ,[lusuorv_2014]
      ,[lusuorlk_2014]
   ,[lututkmaak_2014] = coalesce(nullif([lututkmaak_2014],'20'),'01')
      ,[lututkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2014]), [lututkjarj_2014])
   ,[lututkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2014]), [lututkkoulk_2014])
      ,[amptsuorv_2014]
      ,[amptsuorlk_2014]
   ,[ampttutkmaak_2014] = coalesce(nullif([ampttutkmaak_2014],'20'),'01')
      ,[ampttutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2014]), [ampttutkjarj_2014])
   ,[ampttutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2014]), [ampttutkkoulk_2014])
      ,[amlksuorv_2014]
      ,[amlksuorlk_2014]
   ,[amlktutkmaak_2014] = coalesce(nullif([amlktutkmaak_2014],'20'),'01')
      ,[amlktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2014]), [amlktutkjarj_2014])
   ,[amlktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2014]), [amlktutkkoulk_2014])
      ,[muukksuorv_2014]
      ,[muukksuorlk_2014]
   ,[muukktutkmaak_2014] = coalesce(nullif([muukktutkmaak_2014],'20'),'01')
      ,[muukktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2014]), [muukktutkjarj_2014])
   ,[muukktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2014]), [muukktutkkoulk_2014])
   ,[luopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2014]), [luopiskkoulk_2014])
      ,[luopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2014]), [luopiskjarj_2014])
   ,[lukmaak_2014] = coalesce(nullif([lukmaak_2014],'20'),'01')
   ,[amptopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2014]), [amptopiskkoulk_2014])
      ,[amptopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2014]), [amptopiskjarj_2014])
   ,[amptkmaak_2014] = coalesce(nullif([amptkmaak_2014],'20'),'01')
   ,[amlkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2014]), [amlkopiskkoulk_2014])
      ,[amlkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2014]), [amlkopiskjarj_2014])
   ,[amlkkmaak_2014] = coalesce(nullif([amlkkmaak_2014],'20'),'01')
   ,[muukkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2014]), [muukkopiskkoulk_2014])
      ,[muukkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2014]), [muukkopiskjarj_2014])
   ,[muukkkmaak_2014] = coalesce(nullif([muukkkmaak_2014],'20'),'01')
      ,[ptoim1r5_2014]
      ,[amas_2014]

--2015

      ,[lusuorv_2015]
      ,[lusuorlk_2015]
   ,[lututkmaak_2015] = coalesce(nullif([lututkmaak_2015],'20'),'01')
      ,[lututkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2015]), [lututkjarj_2015])
   ,[lututkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2015]), [lututkkoulk_2015])
      ,[amptsuorv_2015]
      ,[amptsuorlk_2015]
   ,[ampttutkmaak_2015] = coalesce(nullif([ampttutkmaak_2015],'20'),'01')
      ,[ampttutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2015]), [ampttutkjarj_2015])
   ,[ampttutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2015]), [ampttutkkoulk_2015])
      ,[amlksuorv_2015]
      ,[amlksuorlk_2015]
   ,[amlktutkmaak_2015] = coalesce(nullif([amlktutkmaak_2015],'20'),'01')
      ,[amlktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2015]), [amlktutkjarj_2015])
   ,[amlktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2015]), [amlktutkkoulk_2015])
      ,[muukksuorv_2015]
      ,[muukksuorlk_2015]
   ,[muukktutkmaak_2015] = coalesce(nullif([muukktutkmaak_2015],'20'),'01')
      ,[muukktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2015]), [muukktutkjarj_2015])
   ,[muukktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2015]), [muukktutkkoulk_2015])
   ,[luopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2015]), [luopiskkoulk_2015])
      ,[luopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2015]), [luopiskjarj_2015])
   ,[lukmaak_2015] = coalesce(nullif([lukmaak_2015],'20'),'01')
   ,[amptopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2015]), [amptopiskkoulk_2015])
      ,[amptopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2015]), [amptopiskjarj_2015])
   ,[amptkmaak_2015] = coalesce(nullif([amptkmaak_2015],'20'),'01')
   ,[amlkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2015]), [amlkopiskkoulk_2015])
      ,[amlkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2015]), [amlkopiskjarj_2015])
   ,[amlkkmaak_2015] = coalesce(nullif([amlkkmaak_2015],'20'),'01')
   ,[muukkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2015]), [muukkopiskkoulk_2015])
      ,[muukkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2015]), [muukkopiskjarj_2015])
   ,[muukkkmaak_2015] = coalesce(nullif([muukkkmaak_2015],'20'),'01')
      ,[ptoim1r5_2015]
      ,[amas_2015]

--2016

      ,[lusuorv_2016]
      ,[lusuorlk_2016]
   ,[lututkmaak_2016] = coalesce(nullif([lututkmaak_2016],'20'),'01')
      ,[lututkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2016]), [lututkjarj_2016])
   ,[lututkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2016]), [lututkkoulk_2016])
      ,[amptsuorv_2016]
      ,[amptsuorlk_2016]
   ,[ampttutkmaak_2016] = coalesce(nullif([ampttutkmaak_2016],'20'),'01')
      ,[ampttutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2016]), [ampttutkjarj_2016])
   ,[ampttutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2016]), [ampttutkkoulk_2016])
      ,[amlksuorv_2016]
      ,[amlksuorlk_2016]
   ,[amlktutkmaak_2016] = coalesce(nullif([amlktutkmaak_2016],'20'),'01')
      ,[amlktutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2016]), [amlktutkjarj_2016])
   ,[amlktutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2016]), [amlktutkkoulk_2016])
      ,[muukksuorv_2016]
      ,[muukksuorlk_2016]
   ,[muukktutkmaak_2016] = coalesce(nullif([muukktutkmaak_2016],'20'),'01')
      ,[muukktutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2016]), [muukktutkjarj_2016])
   ,[muukktutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2016]), [muukktutkkoulk_2016])
   ,[luopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2016]), [luopiskkoulk_2016])
      ,[luopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2016]), [luopiskjarj_2016])
   ,[lukmaak_2016] = coalesce(nullif([lukmaak_2016],'20'),'01')
   ,[amptopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2016]), [amptopiskkoulk_2016])
      ,[amptopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2016]), [amptopiskjarj_2016])
   ,[amptkmaak_2016] = coalesce(nullif([amptkmaak_2016],'20'),'01')
   ,[amlkopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2016]), [amlkopiskkoulk_2016])
      ,[amlkopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2016]), [amlkopiskjarj_2016])
   ,[amlkkmaak_2016] = coalesce(nullif([amlkkmaak_2016],'20'),'01')
   ,[muukkopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2016]), [muukkopiskkoulk_2016])
      ,[muukkopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2016]), [muukkopiskjarj_2016])
   ,[muukkkmaak_2016] = coalesce(nullif([muukkkmaak_2016],'20'),'01')
      ,[ptoim1r5_2016]
      ,[amas_2016]

--2017

      ,[lusuorv_2017]
      ,[lusuorlk_2017]
   ,[lututkmaak_2017] = coalesce(nullif([lututkmaak_2017],'20'),'01')
      ,[lututkjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2017]), [lututkjarj_2017])
   ,[lututkkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2017]), [lututkkoulk_2017])
      ,[amptsuorv_2017]
      ,[amptsuorlk_2017]
   ,[ampttutkmaak_2017] = coalesce(nullif([ampttutkmaak_2017],'20'),'01')
      ,[ampttutkjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2017]), [ampttutkjarj_2017])
   ,[ampttutkkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2017]), [ampttutkkoulk_2017])
      ,[amlksuorv_2017]
      ,[amlksuorlk_2017]
   ,[amlktutkmaak_2017] = coalesce(nullif([amlktutkmaak_2017],'20'),'01')
      ,[amlktutkjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2017]), [amlktutkjarj_2017])
   ,[amlktutkkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2017]), [amlktutkkoulk_2017])
      ,[muukksuorv_2017]
      ,[muukksuorlk_2017]
   ,[muukktutkmaak_2017] = coalesce(nullif([muukktutkmaak_2017],'20'),'01')
      ,[muukktutkjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2017]), [muukktutkjarj_2017])
   ,[muukktutkkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2017]), [muukktutkkoulk_2017])
   ,[luopiskkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2017]), [luopiskkoulk_2017])
      ,[luopiskjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2017]), [luopiskjarj_2017])
   ,[lukmaak_2017] = coalesce(nullif([lukmaak_2017],'20'),'01')
   ,[amptopiskkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2017]), [amptopiskkoulk_2017])
      ,[amptopiskjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2017]), [amptopiskjarj_2017])
   ,[amptkmaak_2017] = coalesce(nullif([amptkmaak_2017],'20'),'01')
   ,[amlkopiskkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2017]), [amlkopiskkoulk_2017])
      ,[amlkopiskjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2017]), [amlkopiskjarj_2017])
   ,[amlkkmaak_2017] = coalesce(nullif([amlkkmaak_2017],'20'),'01')
   ,[muukkopiskkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2017]), [muukkopiskkoulk_2017])
      ,[muukkopiskjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2017]), [muukkopiskjarj_2017])
   ,[muukkkmaak_2017] = coalesce(nullif([muukkkmaak_2017],'20'),'01')
      ,[ptoim1r5_2017]
      ,[amas_2017]

--2018

      ,[lusuorv_2018]
      ,[lusuorlk_2018]
   ,[lututkmaak_2018] = coalesce(nullif([lututkmaak_2018],'20'),'01')
      ,[lututkjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2018]), [lututkjarj_2018])
   ,[lututkkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2018]), [lututkkoulk_2018])
      ,[amptsuorv_2018]
      ,[amptsuorlk_2018]
   ,[ampttutkmaak_2018] = coalesce(nullif([ampttutkmaak_2018],'20'),'01')
      ,[ampttutkjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2018]), [ampttutkjarj_2018])
   ,[ampttutkkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2018]), [ampttutkkoulk_2018])
      ,[amlksuorv_2018]
      ,[amlksuorlk_2018]
   ,[amlktutkmaak_2018] = coalesce(nullif([amlktutkmaak_2018],'20'),'01')
      ,[amlktutkjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2018]), [amlktutkjarj_2018])
   ,[amlktutkkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2018]), [amlktutkkoulk_2018])
      ,[muukksuorv_2018]
      ,[muukksuorlk_2018]
   ,[muukktutkmaak_2018] = coalesce(nullif([muukktutkmaak_2018],'20'),'01')
      ,[muukktutkjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2018]), [muukktutkjarj_2018])
   ,[muukktutkkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2018]), [muukktutkkoulk_2018])
   ,[luopiskkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2018]), [luopiskkoulk_2018])
      ,[luopiskjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2018]), [luopiskjarj_2018])
   ,[lukmaak_2018] = coalesce(nullif([lukmaak_2018],'20'),'01')
   ,[amptopiskkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2018]), [amptopiskkoulk_2018])
      ,[amptopiskjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2018]), [amptopiskjarj_2018])
   ,[amptkmaak_2018] = coalesce(nullif([amptkmaak_2018],'20'),'01')
   ,[amlkopiskkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2018]), [amlkopiskkoulk_2018])
      ,[amlkopiskjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2018]), [amlkopiskjarj_2018])
   ,[amlkkmaak_2018] = coalesce(nullif([amlkkmaak_2018],'20'),'01')
   ,[muukkopiskkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2018]), [muukkopiskkoulk_2018])
      ,[muukkopiskjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2018]), [muukkopiskjarj_2018])
   ,[muukkkmaak_2018] = coalesce(nullif([muukkkmaak_2018],'20'),'01')
      ,[ptoim1r5_2018]
      ,[amas_2018]

--2019

      ,[lusuorv_2019]
      ,[lusuorlk_2019]
   ,[lututkmaak_2019] = coalesce(nullif([lututkmaak_2019],'20'),'01')
      ,[lututkjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2019]), [lututkjarj_2019])
   ,[lututkkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2019]), [lututkkoulk_2019])
      ,[amptsuorv_2019]
      ,[amptsuorlk_2019]
   ,[ampttutkmaak_2019] = coalesce(nullif([ampttutkmaak_2019],'20'),'01')
      ,[ampttutkjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2019]), [ampttutkjarj_2019])
   ,[ampttutkkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2019]), [ampttutkkoulk_2019])
      ,[amlksuorv_2019]
      ,[amlksuorlk_2019]
   ,[amlktutkmaak_2019] = coalesce(nullif([amlktutkmaak_2019],'20'),'01')
      ,[amlktutkjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2019]), [amlktutkjarj_2019])
   ,[amlktutkkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2019]), [amlktutkkoulk_2019])
      ,[muukksuorv_2019]
      ,[muukksuorlk_2019]
   ,[muukktutkmaak_2019] = coalesce(nullif([muukktutkmaak_2019],'20'),'01')
      ,[muukktutkjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2019]), [muukktutkjarj_2019])
   ,[muukktutkkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2019]), [muukktutkkoulk_2019])
   ,[luopiskkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2019]), [luopiskkoulk_2019])
      ,[luopiskjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2019]), [luopiskjarj_2019])
   ,[lukmaak_2019] = coalesce(nullif([lukmaak_2019],'20'),'01')
   ,[amptopiskkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2019]), [amptopiskkoulk_2019])
      ,[amptopiskjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2019]), [amptopiskjarj_2019])
   ,[amptkmaak_2019] = coalesce(nullif([amptkmaak_2019],'20'),'01')
   ,[amlkopiskkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2019]), [amlkopiskkoulk_2019])
      ,[amlkopiskjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2019]), [amlkopiskjarj_2019])
   ,[amlkkmaak_2019] = coalesce(nullif([amlkkmaak_2019],'20'),'01')
   ,[muukkopiskkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2019]), [muukkopiskkoulk_2019])
      ,[muukkopiskjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2019]), [muukkopiskjarj_2019])
   ,[muukkkmaak_2019] = coalesce(nullif([muukkkmaak_2019],'20'),'01')
      ,[ptoim1r5_2019]
      ,[amas_2019]

--2020

      ,[lusuorv_2020]
      ,[lusuorlk_2020]
   ,[lututkmaak_2020] = coalesce(nullif([lututkmaak_2020],'20'),'01')
      ,[lututkjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2020]), [lututkjarj_2020])
   ,[lututkkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2020]), [lututkkoulk_2020])
      ,[amptsuorv_2020]
      ,[amptsuorlk_2020]
   ,[ampttutkmaak_2020] = coalesce(nullif([ampttutkmaak_2020],'20'),'01')
      ,[ampttutkjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2020]), [ampttutkjarj_2020])
   ,[ampttutkkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2020]), [ampttutkkoulk_2020])
      ,[amlksuorv_2020]
      ,[amlksuorlk_2020]
   ,[amlktutkmaak_2020] = coalesce(nullif([amlktutkmaak_2020],'20'),'01')
      ,[amlktutkjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2020]), [amlktutkjarj_2020])
   ,[amlktutkkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2020]), [amlktutkkoulk_2020])
      ,[muukksuorv_2020]
      ,[muukksuorlk_2020]
   ,[muukktutkmaak_2020] = coalesce(nullif([muukktutkmaak_2020],'20'),'01')
      ,[muukktutkjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2020]), [muukktutkjarj_2020])
   ,[muukktutkkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2020]), [muukktutkkoulk_2020])
   ,[luopiskkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2020]), [luopiskkoulk_2020])
      ,[luopiskjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2020]), [luopiskjarj_2020])
   ,[lukmaak_2020] = coalesce(nullif([lukmaak_2020],'20'),'01')
   ,[amptopiskkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2020]), [amptopiskkoulk_2020])
      ,[amptopiskjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2020]), [amptopiskjarj_2020])
   ,[amptkmaak_2020] = coalesce(nullif([amptkmaak_2020],'20'),'01')
   ,[amlkopiskkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2020]), [amlkopiskkoulk_2020])
      ,[amlkopiskjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2020]), [amlkopiskjarj_2020])
   ,[amlkkmaak_2020] = coalesce(nullif([amlkkmaak_2020],'20'),'01')
   ,[muukkopiskkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2020]), [muukkopiskkoulk_2020])
      ,[muukkopiskjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2020]), [muukkopiskjarj_2020])
   ,[muukkkmaak_2020] = coalesce(nullif([muukkkmaak_2020],'20'),'01')
      ,[ptoim1r5_2020]
      ,[amas_2020]

-- 2021

      ,[lusuorv_2021]
      ,[lusuorlk_2021]
   ,[lututkmaak_2021] = coalesce(nullif([lututkmaak_2021],'20'),'01')
      ,[lututkjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2021]), [lututkjarj_2021])
   ,[lututkkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2021]), [lututkkoulk_2021])
      ,[amptsuorv_2021]
      ,[amptsuorlk_2021]
   ,[ampttutkmaak_2021] = coalesce(nullif([ampttutkmaak_2021],'20'),'01')
      ,[ampttutkjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2021]), [ampttutkjarj_2021])
   ,[ampttutkkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2021]), [ampttutkkoulk_2021])
      ,[amlksuorv_2021]
      ,[amlksuorlk_2021]
   ,[amlktutkmaak_2021] = coalesce(nullif([amlktutkmaak_2021],'20'),'01')
      ,[amlktutkjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2021]), [amlktutkjarj_2021])
   ,[amlktutkkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2021]), [amlktutkkoulk_2021])
      ,[muukksuorv_2021]
      ,[muukksuorlk_2021]
   ,[muukktutkmaak_2021] = coalesce(nullif([muukktutkmaak_2021],'20'),'01')
      ,[muukktutkjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2021]), [muukktutkjarj_2021])
   ,[muukktutkkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2021]), [muukktutkkoulk_2021])
   ,[luopiskkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2021]), [luopiskkoulk_2021])
      ,[luopiskjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2021]), [luopiskjarj_2021])
   ,[lukmaak_2021] = coalesce(nullif([lukmaak_2021],'20'),'01')
   ,[amptopiskkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2021]), [amptopiskkoulk_2021])
      ,[amptopiskjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2021]), [amptopiskjarj_2021])
   ,[amptkmaak_2021] = coalesce(nullif([amptkmaak_2021],'20'),'01')
   ,[amlkopiskkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2021]), [amlkopiskkoulk_2021])
      ,[amlkopiskjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2021]), [amlkopiskjarj_2021])
   ,[amlkkmaak_2021] = coalesce(nullif([amlkkmaak_2021],'20'),'01')
   ,[muukkopiskkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2021]), [muukkopiskkoulk_2021])
      ,[muukkopiskjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2021]), [muukkopiskjarj_2021])
   ,[muukkkmaak_2021] = coalesce(nullif([muukkkmaak_2021],'20'),'01')
      ,[ptoim1r5_2021]
      ,[amas_2021]

-- 2022

      ,[lusuorv_2022]
      ,[lusuorlk_2022]
   ,[lututkmaak_2022] = coalesce(nullif([lututkmaak_2022],'20'),'01')
      ,[lututkjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2022]), [lututkjarj_2022])
   ,[lututkkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2022]), [lututkkoulk_2022])
      ,[amptsuorv_2022]
      ,[amptsuorlk_2022]
   ,[ampttutkmaak_2022] = coalesce(nullif([ampttutkmaak_2022],'20'),'01')
      ,[ampttutkjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2022]), [ampttutkjarj_2022])
   ,[ampttutkkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2022]), [ampttutkkoulk_2022])
      ,[amlksuorv_2022]
      ,[amlksuorlk_2022]
   ,[amlktutkmaak_2022] = coalesce(nullif([amlktutkmaak_2022],'20'),'01')
      ,[amlktutkjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2022]), [amlktutkjarj_2022])
   ,[amlktutkkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2022]), [amlktutkkoulk_2022])
      ,[muukksuorv_2022]
      ,[muukksuorlk_2022]
   ,[muukktutkmaak_2022] = coalesce(nullif([muukktutkmaak_2022],'20'),'01')
      ,[muukktutkjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2022]), [muukktutkjarj_2022])
   ,[muukktutkkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2022]), [muukktutkkoulk_2022])
   ,[luopiskkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2022]), [luopiskkoulk_2022])
      ,[luopiskjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2022]), [luopiskjarj_2022])
   ,[lukmaak_2022] = coalesce(nullif([lukmaak_2022],'20'),'01')
   ,[amptopiskkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2022]), [amptopiskkoulk_2022])
      ,[amptopiskjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2022]), [amptopiskjarj_2022])
   ,[amptkmaak_2022] = coalesce(nullif([amptkmaak_2022],'20'),'01')
   ,[amlkopiskkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2022]), [amlkopiskkoulk_2022])
      ,[amlkopiskjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2022]), [amlkopiskjarj_2022])
   ,[amlkkmaak_2022] = coalesce(nullif([amlkkmaak_2022],'20'),'01')
   ,[muukkopiskkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2022]), [muukkopiskkoulk_2022])
      ,[muukkopiskjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2022]), [muukkopiskjarj_2022])
   ,[muukkkmaak_2022] = coalesce(nullif([muukkkmaak_2022],'20'),'01')
      ,[ptoim1r5_2022]
      ,[amas_2022]


-- 2023

      ,[lusuorv_2023]
      ,[lusuorlk_2023]
   ,[lututkmaak_2023] = coalesce(nullif([lututkmaak_2023],'20'),'01')
      ,[lututkjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2023]), [lututkjarj_2023])
   ,[lututkkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2023]), [lututkkoulk_2023])
      ,[amptsuorv_2023]
      ,[amptsuorlk_2023]
   ,[ampttutkmaak_2023] = coalesce(nullif([ampttutkmaak_2023],'20'),'01')
      ,[ampttutkjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2023]), [ampttutkjarj_2023])
   ,[ampttutkkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2023]), [ampttutkkoulk_2023])
      ,[amlksuorv_2023]
      ,[amlksuorlk_2023]
   ,[amlktutkmaak_2023] = coalesce(nullif([amlktutkmaak_2023],'20'),'01')
      ,[amlktutkjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2023]), [amlktutkjarj_2023])
   ,[amlktutkkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2023]), [amlktutkkoulk_2023])
      ,[muukksuorv_2023]
      ,[muukksuorlk_2023]
   ,[muukktutkmaak_2023] = coalesce(nullif([muukktutkmaak_2023],'20'),'01')
      ,[muukktutkjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2023]), [muukktutkjarj_2023])
   ,[muukktutkkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2023]), [muukktutkkoulk_2023])
   ,[luopiskkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2023]), [luopiskkoulk_2023])
      ,[luopiskjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2023]), [luopiskjarj_2023])
   ,[lukmaak_2023] = coalesce(nullif([lukmaak_2023],'20'),'01')
   ,[amptopiskkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2023]), [amptopiskkoulk_2023])
      ,[amptopiskjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2023]), [amptopiskjarj_2023])
   ,[amptkmaak_2023] = coalesce(nullif([amptkmaak_2023],'20'),'01')
   ,[amlkopiskkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2023]), [amlkopiskkoulk_2023])
      ,[amlkopiskjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2023]), [amlkopiskjarj_2023])
   ,[amlkkmaak_2023] = coalesce(nullif([amlkkmaak_2023],'20'),'01')
   ,[muukkopiskkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2023]), [muukkopiskkoulk_2023])
      ,[muukkopiskjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2023]), [muukkopiskjarj_2023])
   ,[muukkkmaak_2023] = coalesce(nullif([muukkkmaak_2023],'20'),'01')
      ,[ptoim1r5_2023]
      ,[amas_2023]

--UUSI VUOSI; poista alusta vanha vuosi
      
      ,[lkm]
      ,[tietolahde]='K3_9_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, alvv, allk)
      ,[aineistorivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, alvv, allk)
  FROM [TK_H9098_CSC].[dbo].[TK_K3_9_sopv_25]
  --WHERE lahde = '21'






GO


