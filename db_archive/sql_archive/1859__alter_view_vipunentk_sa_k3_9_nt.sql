USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila]    Script Date: 5.10.2018 12:58:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








Alter VIEW [dbo].[v_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila] AS
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
      ,[jarj] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[jarj]), [jarj])
   ,[kkun] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_kunta_nykytila] WHERE alueluokitus_koodi=[kkun]), [kkun])
   ,[koulk] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[koulk]), [koulk])
   ,[pohjkoulk] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[pohjkoulk]), [pohjkoulk])
      ,[lusuorv_2004]
      ,[lusuorlk_2004]
   ,[lututkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2004]), [lututkmaak_2004])
      ,[lututkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2004]), [lututkjarj_2004])
   ,[lututkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2004]), [lututkkoulk_2004])
      ,[amptsuorv_2004]
      ,[amptsuorlk_2004]
   ,[ampttutkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2004]), [ampttutkmaak_2004])
      ,[ampttutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2004]), [ampttutkjarj_2004])
   ,[ampttutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2004]), [ampttutkkoulk_2004])
      ,[amlksuorv_2004]
      ,[amlksuorlk_2004]
   ,[amlktutkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2004]), [amlktutkmaak_2004])
      ,[amlktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2004]), [amlktutkjarj_2004])
   ,[amlktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2004]), [amlktutkkoulk_2004])
      ,[muukksuorv_2004]
      ,[muukksuorlk_2004]
   ,[muukktutkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2004]), [muukktutkmaak_2004])
      ,[muukktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2004]), [muukktutkjarj_2004])
   ,[muukktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2004]), [muukktutkkoulk_2004])
      ,[lusuorv_2005]
      ,[lusuorlk_2005]
   ,[lututkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2005]), [lututkmaak_2005])
      ,[lututkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2005]), [lututkjarj_2005])
   ,[lututkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2005]), [lututkkoulk_2005])
      ,[amptsuorv_2005]
      ,[amptsuorlk_2005]
   ,[ampttutkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2005]), [ampttutkmaak_2005])
      ,[ampttutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2005]), [ampttutkjarj_2005])
   ,[ampttutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2005]), [ampttutkkoulk_2005])
      ,[amlksuorv_2005]
      ,[amlksuorlk_2005]
   ,[amlktutkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2005]), [amlktutkmaak_2005])
      ,[amlktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2005]), [amlktutkjarj_2005])
   ,[amlktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2005]), [amlktutkkoulk_2005])
      ,[muukksuorv_2005]
      ,[muukksuorlk_2005]
   ,[muukktutkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2005]), [muukktutkmaak_2005])
      ,[muukktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2005]), [muukktutkjarj_2005])
   ,[muukktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2005]), [muukktutkkoulk_2005])
      ,[lusuorv_2006]
      ,[lusuorlk_2006]
   ,[lututkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2006]), [lututkmaak_2006])
      ,[lututkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2006]), [lututkjarj_2006])
   ,[lututkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2006]), [lututkkoulk_2006])
      ,[amptsuorv_2006]
      ,[amptsuorlk_2006]
   ,[ampttutkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2006]), [ampttutkmaak_2006])
      ,[ampttutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2006]), [ampttutkjarj_2006])
   ,[ampttutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2006]), [ampttutkkoulk_2006])
      ,[amlksuorv_2006]
      ,[amlksuorlk_2006]
   ,[amlktutkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2006]), [amlktutkmaak_2006])
      ,[amlktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2006]), [amlktutkjarj_2006])
   ,[amlktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2006]), [amlktutkkoulk_2006])
      ,[muukksuorv_2006]
      ,[muukksuorlk_2006]
   ,[muukktutkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2006]), [muukktutkmaak_2006])
      ,[muukktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2006]), [muukktutkjarj_2006])
   ,[muukktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2006]), [muukktutkkoulk_2006])
      ,[lusuorv_2007]
      ,[lusuorlk_2007]
   ,[lututkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2007]), [lututkmaak_2007])
      ,[lututkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2007]), [lututkjarj_2007])
   ,[lututkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2007]), [lututkkoulk_2007])
      ,[amptsuorv_2007]
      ,[amptsuorlk_2007]
   ,[ampttutkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2007]), [ampttutkmaak_2007])
      ,[ampttutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2007]), [ampttutkjarj_2007])
   ,[ampttutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2007]), [ampttutkkoulk_2007])
      ,[amlksuorv_2007]
      ,[amlksuorlk_2007]
   ,[amlktutkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2007]), [amlktutkmaak_2007])
      ,[amlktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2007]), [amlktutkjarj_2007])
   ,[amlktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2007]), [amlktutkkoulk_2007])
      ,[muukksuorv_2007]
      ,[muukksuorlk_2007]
   ,[muukktutkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2007]), [muukktutkmaak_2007])
      ,[muukktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2007]), [muukktutkjarj_2007])
   ,[muukktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2007]), [muukktutkkoulk_2007])
      ,[lusuorv_2008]
      ,[lusuorlk_2008]
   ,[lututkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2008]), [lututkmaak_2008])
      ,[lututkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2008]), [lututkjarj_2008])
   ,[lututkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2008]), [lututkkoulk_2008])
      ,[amptsuorv_2008]
      ,[amptsuorlk_2008]
   ,[ampttutkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2008]), [ampttutkmaak_2008])
      ,[ampttutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2008]), [ampttutkjarj_2008])
   ,[ampttutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2008]), [ampttutkkoulk_2008])
      ,[amlksuorv_2008]
      ,[amlksuorlk_2008]
   ,[amlktutkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2008]), [amlktutkmaak_2008])
      ,[amlktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2008]), [amlktutkjarj_2008])
   ,[amlktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2008]), [amlktutkkoulk_2008])
      ,[muukksuorv_2008]
      ,[muukksuorlk_2008]
   ,[muukktutkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2008]), [muukktutkmaak_2008])
      ,[muukktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2008]), [muukktutkjarj_2008])
   ,[muukktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2008]), [muukktutkkoulk_2008])
      ,[lusuorv_2009]
      ,[lusuorlk_2009]
   ,[lututkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2009]), [lututkmaak_2009])
      ,[lututkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2009]), [lututkjarj_2009])
   ,[lututkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2009]), [lututkkoulk_2009])
      ,[amptsuorv_2009]
      ,[amptsuorlk_2009]
   ,[ampttutkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2009]), [ampttutkmaak_2009])
      ,[ampttutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2009]), [ampttutkjarj_2009])
   ,[ampttutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2009]), [ampttutkkoulk_2009])
      ,[amlksuorv_2009]
      ,[amlksuorlk_2009]
   ,[amlktutkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2009]), [amlktutkmaak_2009])
      ,[amlktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2009]), [amlktutkjarj_2009])
   ,[amlktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2009]), [amlktutkkoulk_2009])
      ,[muukksuorv_2009]
      ,[muukksuorlk_2009]
   ,[muukktutkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2009]), [muukktutkmaak_2009])
      ,[muukktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2009]), [muukktutkjarj_2009])
   ,[muukktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2009]), [muukktutkkoulk_2009])

   ,[luopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2004]), [luopiskkoulk_2004])
      ,[luopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2004]), [luopiskjarj_2004])
   ,[lukmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2004]), [lukmaak_2004])
   ,[amptopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2004]), [amptopiskkoulk_2004])
      ,[amptopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2004]), [amptopiskjarj_2004])
   ,[amptkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2004]), [amptkmaak_2004])
   ,[amlkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2004]), [amlkopiskkoulk_2004])
      ,[amlkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2004]), [amlkopiskjarj_2004])
   ,[amlkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2004]), [amlkkmaak_2004])
   ,[muukkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2004]), [muukkopiskkoulk_2004])
      ,[muukkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2004]), [muukkopiskjarj_2004])
   ,[muukkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2004]), [muukkkmaak_2004])
   ,[luopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2005]), [luopiskkoulk_2005])
      ,[luopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2005]), [luopiskjarj_2005])
   ,[lukmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2005]), [lukmaak_2005])
   ,[amptopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2005]), [amptopiskkoulk_2005])
      ,[amptopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2005]), [amptopiskjarj_2005])
   ,[amptkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2005]), [amptkmaak_2005])
   ,[amlkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2005]), [amlkopiskkoulk_2005])
      ,[amlkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2005]), [amlkopiskjarj_2005])
   ,[amlkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2005]), [amlkkmaak_2005])
   ,[muukkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2005]), [muukkopiskkoulk_2005])
      ,[muukkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2005]), [muukkopiskjarj_2005])
   ,[muukkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2005]), [muukkkmaak_2005])

   ,[luopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2006]), [luopiskkoulk_2006])
      ,[luopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2006]), [luopiskjarj_2006])
   ,[lukmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2006]), [lukmaak_2006])
   ,[amptopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2006]), [amptopiskkoulk_2006])
      ,[amptopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2006]), [amptopiskjarj_2006])
   ,[amptkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2006]), [amptkmaak_2006])
   ,[amlkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2006]), [amlkopiskkoulk_2006])
      ,[amlkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2006]), [amlkopiskjarj_2006])
   ,[amlkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2006]), [amlkkmaak_2006])
   ,[muukkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2006]), [muukkopiskkoulk_2006])
      ,[muukkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2006]), [muukkopiskjarj_2006])
   ,[muukkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2006]), [muukkkmaak_2006])

   ,[luopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2007]), [luopiskkoulk_2007])
      ,[luopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2007]), [luopiskjarj_2007])
   ,[lukmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2007]), [lukmaak_2007])
   ,[amptopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2007]), [amptopiskkoulk_2007])
      ,[amptopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2007]), [amptopiskjarj_2007])
   ,[amptkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2007]), [amptkmaak_2007])
   ,[amlkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2007]), [amlkopiskkoulk_2007])
      ,[amlkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2007]), [amlkopiskjarj_2007])
   ,[amlkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2007]), [amlkkmaak_2007])
   ,[muukkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2007]), [muukkopiskkoulk_2007])
      ,[muukkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2007]), [muukkopiskjarj_2007])
   ,[muukkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2007]), [muukkkmaak_2007])

   ,[luopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2008]), [luopiskkoulk_2008])
      ,[luopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2008]), [luopiskjarj_2008])
   ,[lukmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2008]), [lukmaak_2008])
   ,[amptopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2008]), [amptopiskkoulk_2008])
      ,[amptopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2008]), [amptopiskjarj_2008])
   ,[amptkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2008]), [amptkmaak_2008])
   ,[amlkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2008]), [amlkopiskkoulk_2008])
      ,[amlkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2008]), [amlkopiskjarj_2008])
   ,[amlkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2008]), [amlkkmaak_2008])
   ,[muukkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2008]), [muukkopiskkoulk_2008])
      ,[muukkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2008]), [muukkopiskjarj_2008])
   ,[muukkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2008]), [muukkkmaak_2008])

   ,[luopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2009]), [luopiskkoulk_2009])
      ,[luopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2009]), [luopiskjarj_2009])
   ,[lukmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2009]), [lukmaak_2009])
   ,[amptopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2009]), [amptopiskkoulk_2009])
      ,[amptopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2009]), [amptopiskjarj_2009])
   ,[amptkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2009]), [amptkmaak_2009])
   ,[amlkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2009]), [amlkopiskkoulk_2009])
      ,[amlkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2009]), [amlkopiskjarj_2009])
   ,[amlkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2009]), [amlkkmaak_2009])
   ,[muukkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2009]), [muukkopiskkoulk_2009])
      ,[muukkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2009]), [muukkopiskjarj_2009])
   ,[muukkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2009]), [muukkkmaak_2009])

      ,[ptoim1r5_2004]
      ,[amas_2004]
      ,[ptoim1r5_2005]
      ,[amas_2005]
      ,[ptoim1r5_2006]
      ,[amas_2006]
      ,[ptoim1r5_2007]
      ,[amas_2007]
      ,[ptoim1r5_2008]
      ,[amas_2008]
      ,[ptoim1r5_2009]
      ,[amas_2009]
      ,[lusuorv_2010]
      ,[lusuorlk_2010]
   ,[lututkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2010]), [lututkmaak_2010])
      ,[lututkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2010]), [lututkjarj_2010])
   ,[lututkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2010]), [lututkkoulk_2010])
      ,[amptsuorv_2010]
      ,[amptsuorlk_2010]
   ,[ampttutkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2010]), [ampttutkmaak_2010])
      ,[ampttutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2010]), [ampttutkjarj_2010])
   ,[ampttutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2010]), [ampttutkkoulk_2010])
      ,[amlksuorv_2010]
      ,[amlksuorlk_2010]
   ,[amlktutkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2010]), [amlktutkmaak_2010])
      ,[amlktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2010]), [amlktutkjarj_2010])
   ,[amlktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2010]), [amlktutkkoulk_2010])
      ,[muukksuorv_2010]
      ,[muukksuorlk_2010]
   ,[muukktutkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2010]), [muukktutkmaak_2010])
      ,[muukktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2010]), [muukktutkjarj_2010])
   ,[muukktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2010]), [muukktutkkoulk_2010])
   ,[luopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2010]), [luopiskkoulk_2010])
      ,[luopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2010]), [luopiskjarj_2010])
   ,[lukmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2010]), [lukmaak_2010])
   ,[amptopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2010]), [amptopiskkoulk_2010])
      ,[amptopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2010]), [amptopiskjarj_2010])
   ,[amptkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2010]), [amptkmaak_2010])
   ,[amlkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2010]), [amlkopiskkoulk_2010])
      ,[amlkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2010]), [amlkopiskjarj_2010])
   ,[amlkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2010]), [amlkkmaak_2010])
   ,[muukkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2010]), [muukkopiskkoulk_2010])
      ,[muukkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2010]), [muukkopiskjarj_2010])
   ,[muukkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2010]), [muukkkmaak_2010])
      ,[ptoim1r5_2010]
      ,[amas_2010]
      ,[lusuorv_2011]
      ,[lusuorlk_2011]
   ,[lututkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2011]), [lututkmaak_2011])
      ,[lututkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2011]), [lututkjarj_2011])
   ,[lututkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2011]), [lututkkoulk_2011])
      ,[amptsuorv_2011]
      ,[amptsuorlk_2011]
   ,[ampttutkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2011]), [ampttutkmaak_2011])
      ,[ampttutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2011]), [ampttutkjarj_2011])
   ,[ampttutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2011]), [ampttutkkoulk_2011])
      ,[amlksuorv_2011]
      ,[amlksuorlk_2011]
   ,[amlktutkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2011]), [amlktutkmaak_2011])
      ,[amlktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2011]), [amlktutkjarj_2011])
   ,[amlktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2011]), [amlktutkkoulk_2011])
      ,[muukksuorv_2011]
      ,[muukksuorlk_2011]
   ,[muukktutkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2011]), [muukktutkmaak_2011])
      ,[muukktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2011]), [muukktutkjarj_2011])
   ,[muukktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2011]), [muukktutkkoulk_2011])
   ,[luopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2011]), [luopiskkoulk_2011])
      ,[luopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2011]), [luopiskjarj_2011])
   ,[lukmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2011]), [lukmaak_2011])
   ,[amptopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2011]), [amptopiskkoulk_2011])
      ,[amptopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2011]), [amptopiskjarj_2011])
   ,[amptkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2011]), [amptkmaak_2011])
   ,[amlkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2011]), [amlkopiskkoulk_2011])
      ,[amlkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2011]), [amlkopiskjarj_2011])
   ,[amlkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2011]), [amlkkmaak_2011])
   ,[muukkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2011]), [muukkopiskkoulk_2011])
      ,[muukkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2011]), [muukkopiskjarj_2011])
   ,[muukkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2011]), [muukkkmaak_2011])
      ,[ptoim1r5_2011]
      ,[amas_2011]
--2012     
      ,[lusuorv_2012]
      ,[lusuorlk_2012]
   ,[lututkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2012]), [lututkmaak_2012])
      ,[lututkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2012]), [lututkjarj_2012])
   ,[lututkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2012]), [lututkkoulk_2012])
      ,[amptsuorv_2012]
      ,[amptsuorlk_2012]
   ,[ampttutkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2012]), [ampttutkmaak_2012])
      ,[ampttutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2012]), [ampttutkjarj_2012])
   ,[ampttutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2012]), [ampttutkkoulk_2012])
      ,[amlksuorv_2012]
      ,[amlksuorlk_2012]
   ,[amlktutkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2012]), [amlktutkmaak_2012])
      ,[amlktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2012]), [amlktutkjarj_2012])
   ,[amlktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2012]), [amlktutkkoulk_2012])
      ,[muukksuorv_2012]
      ,[muukksuorlk_2012]
   ,[muukktutkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2012]), [muukktutkmaak_2012])
      ,[muukktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2012]), [muukktutkjarj_2012])
   ,[muukktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2012]), [muukktutkkoulk_2012])
   ,[luopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2012]), [luopiskkoulk_2012])
      ,[luopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2012]), [luopiskjarj_2012])
   ,[lukmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2012]), [lukmaak_2012])
   ,[amptopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2012]), [amptopiskkoulk_2012])
      ,[amptopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2012]), [amptopiskjarj_2012])
   ,[amptkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2012]), [amptkmaak_2012])
   ,[amlkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2012]), [amlkopiskkoulk_2012])
      ,[amlkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2012]), [amlkopiskjarj_2012])
   ,[amlkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2012]), [amlkkmaak_2012])
   ,[muukkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2012]), [muukkopiskkoulk_2012])
      ,[muukkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2012]), [muukkopiskjarj_2012])
   ,[muukkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2012]), [muukkkmaak_2012])
      ,[ptoim1r5_2012]
      ,[amas_2012]
--2013     
      ,[lusuorv_2013]
      ,[lusuorlk_2013]
   ,[lututkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2013]), [lututkmaak_2013])
      ,[lututkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2013]), [lututkjarj_2013])
   ,[lututkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2013]), [lututkkoulk_2013])
      ,[amptsuorv_2013]
      ,[amptsuorlk_2013]
   ,[ampttutkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2013]), [ampttutkmaak_2013])
      ,[ampttutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2013]), [ampttutkjarj_2013])
   ,[ampttutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2013]), [ampttutkkoulk_2013])
      ,[amlksuorv_2013]
      ,[amlksuorlk_2013]
   ,[amlktutkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2013]), [amlktutkmaak_2013])
      ,[amlktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2013]), [amlktutkjarj_2013])
   ,[amlktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2013]), [amlktutkkoulk_2013])
      ,[muukksuorv_2013]
      ,[muukksuorlk_2013]
   ,[muukktutkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2013]), [muukktutkmaak_2013])
      ,[muukktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2013]), [muukktutkjarj_2013])
   ,[muukktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2013]), [muukktutkkoulk_2013])
   ,[luopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2013]), [luopiskkoulk_2013])
      ,[luopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2013]), [luopiskjarj_2013])
   ,[lukmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2013]), [lukmaak_2013])
   ,[amptopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2013]), [amptopiskkoulk_2013])
      ,[amptopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2013]), [amptopiskjarj_2013])
   ,[amptkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2013]), [amptkmaak_2013])
   ,[amlkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2013]), [amlkopiskkoulk_2013])
      ,[amlkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2013]), [amlkopiskjarj_2013])
   ,[amlkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2013]), [amlkkmaak_2013])
   ,[muukkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2013]), [muukkopiskkoulk_2013])
      ,[muukkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2013]), [muukkopiskjarj_2013])
   ,[muukkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2013]), [muukkkmaak_2013])
      ,[ptoim1r5_2013]
      ,[amas_2013]

-- 2014

      ,[lusuorv_2014]
      ,[lusuorlk_2014]
   ,[lututkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2014]), [lututkmaak_2014])
      ,[lututkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2014]), [lututkjarj_2014])
   ,[lututkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2014]), [lututkkoulk_2014])
      ,[amptsuorv_2014]
      ,[amptsuorlk_2014]
   ,[ampttutkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2014]), [ampttutkmaak_2014])
      ,[ampttutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2014]), [ampttutkjarj_2014])
   ,[ampttutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2014]), [ampttutkkoulk_2014])
      ,[amlksuorv_2014]
      ,[amlksuorlk_2014]
   ,[amlktutkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2014]), [amlktutkmaak_2014])
      ,[amlktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2014]), [amlktutkjarj_2014])
   ,[amlktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2014]), [amlktutkkoulk_2014])
      ,[muukksuorv_2014]
      ,[muukksuorlk_2014]
   ,[muukktutkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2014]), [muukktutkmaak_2014])
      ,[muukktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2014]), [muukktutkjarj_2014])
   ,[muukktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2014]), [muukktutkkoulk_2014])
   ,[luopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2014]), [luopiskkoulk_2014])
      ,[luopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2014]), [luopiskjarj_2014])
   ,[lukmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2014]), [lukmaak_2014])
   ,[amptopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2014]), [amptopiskkoulk_2014])
      ,[amptopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2014]), [amptopiskjarj_2014])
   ,[amptkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2014]), [amptkmaak_2014])
   ,[amlkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2014]), [amlkopiskkoulk_2014])
      ,[amlkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2014]), [amlkopiskjarj_2014])
   ,[amlkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2014]), [amlkkmaak_2014])
   ,[muukkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2014]), [muukkopiskkoulk_2014])
      ,[muukkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2014]), [muukkopiskjarj_2014])
   ,[muukkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2014]), [muukkkmaak_2014])
      ,[ptoim1r5_2014]
      ,[amas_2014]

--2015

      ,[lusuorv_2015]
      ,[lusuorlk_2015]
   ,[lututkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2015]), [lututkmaak_2015])
      ,[lututkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2015]), [lututkjarj_2015])
   ,[lututkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2015]), [lututkkoulk_2015])
      ,[amptsuorv_2015]
      ,[amptsuorlk_2015]
   ,[ampttutkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2015]), [ampttutkmaak_2015])
      ,[ampttutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2015]), [ampttutkjarj_2015])
   ,[ampttutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2015]), [ampttutkkoulk_2015])
      ,[amlksuorv_2015]
      ,[amlksuorlk_2015]
   ,[amlktutkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2015]), [amlktutkmaak_2015])
      ,[amlktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2015]), [amlktutkjarj_2015])
   ,[amlktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2015]), [amlktutkkoulk_2015])
      ,[muukksuorv_2015]
      ,[muukksuorlk_2015]
   ,[muukktutkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2015]), [muukktutkmaak_2015])
      ,[muukktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2015]), [muukktutkjarj_2015])
   ,[muukktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2015]), [muukktutkkoulk_2015])
   ,[luopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2015]), [luopiskkoulk_2015])
      ,[luopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2015]), [luopiskjarj_2015])
   ,[lukmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2015]), [lukmaak_2015])
   ,[amptopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2015]), [amptopiskkoulk_2015])
      ,[amptopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2015]), [amptopiskjarj_2015])
   ,[amptkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2015]), [amptkmaak_2015])
   ,[amlkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2015]), [amlkopiskkoulk_2015])
      ,[amlkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2015]), [amlkopiskjarj_2015])
   ,[amlkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2015]), [amlkkmaak_2015])
   ,[muukkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2015]), [muukkopiskkoulk_2015])
      ,[muukkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2015]), [muukkopiskjarj_2015])
   ,[muukkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2015]), [muukkkmaak_2015])
      ,[ptoim1r5_2015]
      ,[amas_2015]

--2016

      ,[lusuorv_2016]
      ,[lusuorlk_2016]
   ,[lututkmaak_2016] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lututkmaak_2016]), [lututkmaak_2016])
      ,[lututkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[lututkjarj_2016]), [lututkjarj_2016])
   ,[lututkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[lututkkoulk_2016]), [lututkkoulk_2016])
      ,[amptsuorv_2016]
      ,[amptsuorlk_2016]
   ,[ampttutkmaak_2016] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ampttutkmaak_2016]), [ampttutkmaak_2016])
      ,[ampttutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ampttutkjarj_2016]), [ampttutkjarj_2016])
   ,[ampttutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ampttutkkoulk_2016]), [ampttutkkoulk_2016])
      ,[amlksuorv_2016]
      ,[amlksuorlk_2016]
   ,[amlktutkmaak_2016] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlktutkmaak_2016]), [amlktutkmaak_2016])
      ,[amlktutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlktutkjarj_2016]), [amlktutkjarj_2016])
   ,[amlktutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlktutkkoulk_2016]), [amlktutkkoulk_2016])
      ,[muukksuorv_2016]
      ,[muukksuorlk_2016]
   ,[muukktutkmaak_2016] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukktutkmaak_2016]), [muukktutkmaak_2016])
      ,[muukktutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukktutkjarj_2016]), [muukktutkjarj_2016])
   ,[muukktutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukktutkkoulk_2016]), [muukktutkkoulk_2016])
   ,[luopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[luopiskkoulk_2016]), [luopiskkoulk_2016])
      ,[luopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[luopiskjarj_2016]), [luopiskjarj_2016])
   ,[lukmaak_2016] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[lukmaak_2016]), [lukmaak_2016])
   ,[amptopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amptopiskkoulk_2016]), [amptopiskkoulk_2016])
      ,[amptopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amptopiskjarj_2016]), [amptopiskjarj_2016])
   ,[amptkmaak_2016] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amptkmaak_2016]), [amptkmaak_2016])
   ,[amlkopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amlkopiskkoulk_2016]), [amlkopiskkoulk_2016])
      ,[amlkopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amlkopiskjarj_2016]), [amlkopiskjarj_2016])
   ,[amlkkmaak_2016] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amlkkmaak_2016]), [amlkkmaak_2016])
   ,[muukkopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muukkopiskkoulk_2016]), [muukkopiskkoulk_2016])
      ,[muukkopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muukkopiskjarj_2016]), [muukkopiskjarj_2016])
   ,[muukkkmaak_2016] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muukkkmaak_2016]), [muukkkmaak_2016])
      ,[ptoim1r5_2016]
      ,[amas_2016]

--UUSI VUOSI 
      
      ,[lkm]
      ,[tietolahde]='K3_9_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, alvv, allk)
      ,[aineistorivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, alvv, allk)
  FROM [TK_H9098_CSC].[dbo].[TK_K3_9_sopv_18]







GO


