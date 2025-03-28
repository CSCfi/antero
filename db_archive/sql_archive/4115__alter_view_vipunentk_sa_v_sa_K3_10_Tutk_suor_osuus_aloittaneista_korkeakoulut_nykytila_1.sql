USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila_1]    Script Date: 2.10.2020 16:41:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila_1] AS

SELECT
    [tilv]
   ,[lahde]
   ,[sp]
   ,[syntv]
   ,[aikielir1]
   ,[alvv]
   ,[allk] = 
   -- Tampereen teknisen yliopiston kevään ja syksyn opiskelijamäärät ovat väärin päin aloitusvuosilla 2004 ja 2006.
   -- Korjataan virhe kääntämällä aloituskaudet toisin päin.
   -- CSC Jarmo 21.3.2014
    CASE 
      WHEN jarj='624001-8' AND alvv = '2004' and (alkkopiskjarj_2004<>'' or ylkkopiskjarj_2004<>'' or alkkopiskjarj_2005<>'' or ylkkopiskjarj_2005<>'')
        THEN CASE WHEN allk='1' THEN '2' WHEN allk='2' THEN '1' ELSE allk END
      WHEN jarj='624001-8' AND alvv = '2006' and (alkkopiskjarj_2006<>'' or ylkkopiskjarj_2006<>'' or alkkopiskjarj_2007<>'' or ylkkopiskjarj_2007<>'')
        THEN CASE WHEN allk='1' THEN '2' WHEN allk='2' THEN '1' ELSE allk END
      ELSE allk
    END
   ,[alvv_kk]
   ,[allk_kk] =
   -- Tampereen teknisen yliopiston kevään ja syksyn opiskelijamäärät ovat väärin päin aloitusvuosilla 2004 ja 2006.
   -- Korjataan virhe kääntämällä aloituskaudet toisin päin.
   -- CSC Jarmo 21.3.2014
    CASE 
      WHEN jarj='624001-8' AND alvv_kk = '2004' and (alkkopiskjarj_2004<>'' or ylkkopiskjarj_2004<>'' or alkkopiskjarj_2005<>'' or ylkkopiskjarj_2005<>'')
        THEN CASE WHEN allk_kk='1' THEN '2' WHEN allk_kk='2' THEN '1' ELSE allk_kk END
      WHEN jarj='624001-8' AND alvv_kk = '2006' and (alkkopiskjarj_2006<>'' or ylkkopiskjarj_2006<>'' or alkkopiskjarj_2007<>'' or ylkkopiskjarj_2007<>'')
        THEN CASE WHEN allk_kk='1' THEN '2' WHEN allk_kk='2' THEN '1' ELSE allk_kk END
      ELSE allk_kk
    END
   ,[ololk]
   ,[klaji]
   ,[jarj] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[jarj]), [jarj])
   ,[kkun] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_kunta_nykytila] WHERE alueluokitus_koodi=[kkun]), [kkun])
   ,[koulk] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[koulk]), [koulk])
   ,[pohjkoulk] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[pohjkoulk]), [pohjkoulk])
   ,[rahlahde]
   ,[amksuorv_2000]
   ,[amksuorlk_2000]
   ,[amktutkkmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2000]), [amktutkkmaak_2000])
   ,[amktutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2000]), [amktutkjarj_2000])
   ,[amktutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2000]), [amktutkkoulk_2000])
   ,[ylamksuorv_2000]
   ,[ylamksuorlk_2000]
   ,[ylamktutkkmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2000]), [ylamktutkkmaak_2000])
   ,[ylamktutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2000]), [ylamktutkjarj_2000])
   ,[ylamktutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2000]), [ylamktutkkoulk_2000])
   ,[alkksuorv_2000]
   ,[alkksuorlk_2000]
   ,[alkktutkkmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2000]), [alkktutkkmaak_2000])
   ,[alkktutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2000]), [alkktutkjarj_2000])
   ,[alkktutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2000]), [alkktutkkoulk_2000])
   ,[ylkksuorv_2000]
   ,[ylkksuorlk_2000]
   ,[ylkktutkkmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2000]), [ylkktutkkmaak_2000])
   ,[ylkktutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2000]), [ylkktutkjarj_2000])
   ,[ylkktutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2000]), [ylkktutkkoulk_2000])
   ,[tksuorv_2000]
   ,[tksuorlk_2000]
   ,[tktutkkmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2000]), [tktutkkmaak_2000])
   ,[tktutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2000]), [tktutkjarj_2000])
   ,[tktutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2000]), [tktutkkoulk_2000])
   ,[muutasuorv_2000]
   ,[muutasuorlk_2000]
   ,[muutatutkkmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2000]), [muutatutkkmaak_2000])
   ,[muutatutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2000]), [muutatutkjarj_2000])
   ,[muutatutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2000]), [muutatutkkoulk_2000])
   ,[amksuorv_2001]
   ,[amksuorlk_2001]
   ,[amktutkkmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2001]), [amktutkkmaak_2001])
   ,[amktutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2001]), [amktutkjarj_2001])
   ,[amktutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2001]), [amktutkkoulk_2001])
   ,[ylamksuorv_2001]
   ,[ylamksuorlk_2001]
   ,[ylamktutkkmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2001]), [ylamktutkkmaak_2001])
   ,[ylamktutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2001]), [ylamktutkjarj_2001])
   ,[ylamktutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2001]), [ylamktutkkoulk_2001])
   ,[alkksuorv_2001]
   ,[alkksuorlk_2001]
   ,[alkktutkkmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2001]), [alkktutkkmaak_2001])
   ,[alkktutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2001]), [alkktutkjarj_2001])
   ,[alkktutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2001]), [alkktutkkoulk_2001])
   ,[ylkksuorv_2001]
   ,[ylkksuorlk_2001]
   ,[ylkktutkkmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2001]), [ylkktutkkmaak_2001])
   ,[ylkktutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2001]), [ylkktutkjarj_2001])
   ,[ylkktutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2001]), [ylkktutkkoulk_2001])
   ,[tksuorv_2001]
   ,[tksuorlk_2001]
   ,[tktutkkmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2001]), [tktutkkmaak_2001])
   ,[tktutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2001]), [tktutkjarj_2001])
   ,[tktutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2001]), [tktutkkoulk_2001])
   ,[muutasuorv_2001]
   ,[muutasuorlk_2001]
   ,[muutatutkkmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2001]), [muutatutkkmaak_2001])
   ,[muutatutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2001]), [muutatutkjarj_2001])
   ,[muutatutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2001]), [muutatutkkoulk_2001])
   ,[amksuorv_2002]
   ,[amksuorlk_2002]
   ,[amktutkkmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2002]), [amktutkkmaak_2002])
   ,[amktutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2002]), [amktutkjarj_2002])
   ,[amktutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2002]), [amktutkkoulk_2002])
   ,[ylamksuorv_2002]
   ,[ylamksuorlk_2002]
   ,[ylamktutkkmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2002]), [ylamktutkkmaak_2002])
   ,[ylamktutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2002]), [ylamktutkjarj_2002])
   ,[ylamktutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2002]), [ylamktutkkoulk_2002])
   ,[alkksuorv_2002]
   ,[alkksuorlk_2002]
   ,[alkktutkkmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2002]), [alkktutkkmaak_2002])
   ,[alkktutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2002]), [alkktutkjarj_2002])
   ,[alkktutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2002]), [alkktutkkoulk_2002])
   ,[ylkksuorv_2002]
   ,[ylkksuorlk_2002]
   ,[ylkktutkkmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2002]), [ylkktutkkmaak_2002])
   ,[ylkktutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2002]), [ylkktutkjarj_2002])
   ,[ylkktutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2002]), [ylkktutkkoulk_2002])
   ,[tksuorv_2002]
   ,[tksuorlk_2002]
   ,[tktutkkmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2002]), [tktutkkmaak_2002])
   ,[tktutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2002]), [tktutkjarj_2002])
   ,[tktutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2002]), [tktutkkoulk_2002])
   ,[muutasuorv_2002]
   ,[muutasuorlk_2002]
   ,[muutatutkkmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2002]), [muutatutkkmaak_2002])
   ,[muutatutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2002]), [muutatutkjarj_2002])
   ,[muutatutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2002]), [muutatutkkoulk_2002])
   ,[amksuorv_2003]
   ,[amksuorlk_2003]
   ,[amktutkkmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2003]), [amktutkkmaak_2003])
   ,[amktutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2003]), [amktutkjarj_2003])
   ,[amktutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2003]), [amktutkkoulk_2003])
   ,[ylamksuorv_2003]
   ,[ylamksuorlk_2003]
   ,[ylamktutkkmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2003]), [ylamktutkkmaak_2003])
   ,[ylamktutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2003]), [ylamktutkjarj_2003])
   ,[ylamktutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2003]), [ylamktutkkoulk_2003])
   ,[alkksuorv_2003]
   ,[alkksuorlk_2003]
   ,[alkktutkkmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2003]), [alkktutkkmaak_2003])
   ,[alkktutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2003]), [alkktutkjarj_2003])
   ,[alkktutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2003]), [alkktutkkoulk_2003])
   ,[ylkksuorv_2003]
   ,[ylkksuorlk_2003]
   ,[ylkktutkkmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2003]), [ylkktutkkmaak_2003])
   ,[ylkktutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2003]), [ylkktutkjarj_2003])
   ,[ylkktutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2003]), [ylkktutkkoulk_2003])
   ,[tksuorv_2003]
   ,[tksuorlk_2003]
   ,[tktutkkmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2003]), [tktutkkmaak_2003])
   ,[tktutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2003]), [tktutkjarj_2003])
   ,[tktutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2003]), [tktutkkoulk_2003])
   ,[muutasuorv_2003]
   ,[muutasuorlk_2003]
   ,[muutatutkkmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2003]), [muutatutkkmaak_2003])
   ,[muutatutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2003]), [muutatutkjarj_2003])
   ,[muutatutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2003]), [muutatutkkoulk_2003])
   ,[amksuorv_2004]
   ,[amksuorlk_2004]
   ,[amktutkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2004]), [amktutkkmaak_2004])
   ,[amktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2004]), [amktutkjarj_2004])
   ,[amktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2004]), [amktutkkoulk_2004])
   ,[ylamksuorv_2004]
   ,[ylamksuorlk_2004]
   ,[ylamktutkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2004]), [ylamktutkkmaak_2004])
   ,[ylamktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2004]), [ylamktutkjarj_2004])
   ,[ylamktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2004]), [ylamktutkkoulk_2004])
   ,[alkksuorv_2004]
   ,[alkksuorlk_2004]
   ,[alkktutkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2004]), [alkktutkkmaak_2004])
   ,[alkktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2004]), [alkktutkjarj_2004])
   ,[alkktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2004]), [alkktutkkoulk_2004])
   ,[ylkksuorv_2004]
   ,[ylkksuorlk_2004]
   ,[ylkktutkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2004]), [ylkktutkkmaak_2004])
   ,[ylkktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2004]), [ylkktutkjarj_2004])
   ,[ylkktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2004]), [ylkktutkkoulk_2004])
   ,[tksuorv_2004]
   ,[tksuorlk_2004]
   ,[tktutkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2004]), [tktutkkmaak_2004])
   ,[tktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2004]), [tktutkjarj_2004])
   ,[tktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2004]), [tktutkkoulk_2004])
   ,[muutasuorv_2004]
   ,[muutasuorlk_2004]
   ,[muutatutkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2004]), [muutatutkkmaak_2004])
   ,[muutatutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2004]), [muutatutkjarj_2004])
   ,[muutatutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2004]), [muutatutkkoulk_2004])
   ,[amksuorv_2005]
   ,[amksuorlk_2005]
   ,[amktutkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2005]), [amktutkkmaak_2005])
   ,[amktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2005]), [amktutkjarj_2005])
   ,[amktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2005]), [amktutkkoulk_2005])
   ,[ylamksuorv_2005]
   ,[ylamksuorlk_2005]
   ,[ylamktutkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2005]), [ylamktutkkmaak_2005])
   ,[ylamktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2005]), [ylamktutkjarj_2005])
   ,[ylamktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2005]), [ylamktutkkoulk_2005])
   ,[alkksuorv_2005]
   ,[alkksuorlk_2005]
   ,[alkktutkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2005]), [alkktutkkmaak_2005])
   ,[alkktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2005]), [alkktutkjarj_2005])
   ,[alkktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2005]), [alkktutkkoulk_2005])
   ,[ylkksuorv_2005]
   ,[ylkksuorlk_2005]
   ,[ylkktutkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2005]), [ylkktutkkmaak_2005])
   ,[ylkktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2005]), [ylkktutkjarj_2005])
   ,[ylkktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2005]), [ylkktutkkoulk_2005])
   ,[tksuorv_2005]
   ,[tksuorlk_2005]
   ,[tktutkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2005]), [tktutkkmaak_2005])
   ,[tktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2005]), [tktutkjarj_2005])
   ,[tktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2005]), [tktutkkoulk_2005])
   ,[muutasuorv_2005]
   ,[muutasuorlk_2005]
   ,[muutatutkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2005]), [muutatutkkmaak_2005])
   ,[muutatutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2005]), [muutatutkjarj_2005])
   ,[muutatutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2005]), [muutatutkkoulk_2005])
   ,[amksuorv_2006]
   ,[amksuorlk_2006]
   ,[amktutkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2006]), [amktutkkmaak_2006])
   ,[amktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2006]), [amktutkjarj_2006])
   ,[amktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2006]), [amktutkkoulk_2006])
   ,[ylamksuorv_2006]
   ,[ylamksuorlk_2006]
   ,[ylamktutkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2006]), [ylamktutkkmaak_2006])
   ,[ylamktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2006]), [ylamktutkjarj_2006])
   ,[ylamktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2006]), [ylamktutkkoulk_2006])
   ,[alkksuorv_2006]
   ,[alkksuorlk_2006]
   ,[alkktutkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2006]), [alkktutkkmaak_2006])
   ,[alkktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2006]), [alkktutkjarj_2006])
   ,[alkktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2006]), [alkktutkkoulk_2006])
   ,[ylkksuorv_2006]
   ,[ylkksuorlk_2006]
   ,[ylkktutkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2006]), [ylkktutkkmaak_2006])
   ,[ylkktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2006]), [ylkktutkjarj_2006])
   ,[ylkktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2006]), [ylkktutkkoulk_2006])
   ,[tksuorv_2006]
   ,[tksuorlk_2006]
   ,[tktutkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2006]), [tktutkkmaak_2006])
   ,[tktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2006]), [tktutkjarj_2006])
   ,[tktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2006]), [tktutkkoulk_2006])
   ,[muutasuorv_2006]
   ,[muutasuorlk_2006]
   ,[muutatutkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2006]), [muutatutkkmaak_2006])
   ,[muutatutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2006]), [muutatutkjarj_2006])
   ,[muutatutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2006]), [muutatutkkoulk_2006])
   ,[amksuorv_2007]
   ,[amksuorlk_2007]
   ,[amktutkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2007]), [amktutkkmaak_2007])
   ,[amktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2007]), [amktutkjarj_2007])
   ,[amktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2007]), [amktutkkoulk_2007])
   ,[ylamksuorv_2007]
   ,[ylamksuorlk_2007]
   ,[ylamktutkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2007]), [ylamktutkkmaak_2007])
   ,[ylamktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2007]), [ylamktutkjarj_2007])
   ,[ylamktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2007]), [ylamktutkkoulk_2007])
   ,[alkksuorv_2007]
   ,[alkksuorlk_2007]
   ,[alkktutkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2007]), [alkktutkkmaak_2007])
   ,[alkktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2007]), [alkktutkjarj_2007])
   ,[alkktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2007]), [alkktutkkoulk_2007])
   ,[ylkksuorv_2007]
   ,[ylkksuorlk_2007]
   ,[ylkktutkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2007]), [ylkktutkkmaak_2007])
   ,[ylkktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2007]), [ylkktutkjarj_2007])
   ,[ylkktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2007]), [ylkktutkkoulk_2007])
   ,[tksuorv_2007]
   ,[tksuorlk_2007]
   ,[tktutkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2007]), [tktutkkmaak_2007])
   ,[tktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2007]), [tktutkjarj_2007])
   ,[tktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2007]), [tktutkkoulk_2007])
   ,[muutasuorv_2007]
   ,[muutasuorlk_2007]
   ,[muutatutkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2007]), [muutatutkkmaak_2007])
   ,[muutatutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2007]), [muutatutkjarj_2007])
   ,[muutatutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2007]), [muutatutkkoulk_2007])
   ,[amksuorv_2008]
   ,[amksuorlk_2008]
   ,[amktutkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2008]), [amktutkkmaak_2008])
   ,[amktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2008]), [amktutkjarj_2008])
   ,[amktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2008]), [amktutkkoulk_2008])
   ,[ylamksuorv_2008]
   ,[ylamksuorlk_2008]
   ,[ylamktutkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2008]), [ylamktutkkmaak_2008])
   ,[ylamktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2008]), [ylamktutkjarj_2008])
   ,[ylamktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2008]), [ylamktutkkoulk_2008])
   ,[alkksuorv_2008]
   ,[alkksuorlk_2008]
   ,[alkktutkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2008]), [alkktutkkmaak_2008])
   ,[alkktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2008]), [alkktutkjarj_2008])
   ,[alkktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2008]), [alkktutkkoulk_2008])
   ,[ylkksuorv_2008]
   ,[ylkksuorlk_2008]
   ,[ylkktutkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2008]), [ylkktutkkmaak_2008])
   ,[ylkktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2008]), [ylkktutkjarj_2008])
   ,[ylkktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2008]), [ylkktutkkoulk_2008])
   ,[tksuorv_2008]
   ,[tksuorlk_2008]
   ,[tktutkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2008]), [tktutkkmaak_2008])
   ,[tktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2008]), [tktutkjarj_2008])
   ,[tktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2008]), [tktutkkoulk_2008])
   ,[muutasuorv_2008]
   ,[muutasuorlk_2008]
   ,[muutatutkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2008]), [muutatutkkmaak_2008])
   ,[muutatutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2008]), [muutatutkjarj_2008])
   ,[muutatutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2008]), [muutatutkkoulk_2008])
   ,[amksuorv_2009]
   ,[amksuorlk_2009]
   ,[amktutkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2009]), [amktutkkmaak_2009])
   ,[amktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2009]), [amktutkjarj_2009])
   ,[amktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2009]), [amktutkkoulk_2009])
   ,[ylamksuorv_2009]
   ,[ylamksuorlk_2009]
   ,[ylamktutkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2009]), [ylamktutkkmaak_2009])
   ,[ylamktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2009]), [ylamktutkjarj_2009])
   ,[ylamktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2009]), [ylamktutkkoulk_2009])
   ,[alkksuorv_2009]
   ,[alkksuorlk_2009]
   ,[alkktutkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2009]), [alkktutkkmaak_2009])
   ,[alkktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2009]), [alkktutkjarj_2009])
   ,[alkktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2009]), [alkktutkkoulk_2009])
   ,[ylkksuorv_2009]
   ,[ylkksuorlk_2009]
   ,[ylkktutkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2009]), [ylkktutkkmaak_2009])
   ,[ylkktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2009]), [ylkktutkjarj_2009])
   ,[ylkktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2009]), [ylkktutkkoulk_2009])
   ,[tksuorv_2009]
   ,[tksuorlk_2009]
   ,[tktutkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2009]), [tktutkkmaak_2009])
   ,[tktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2009]), [tktutkjarj_2009])
   ,[tktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2009]), [tktutkkoulk_2009])
   ,[muutasuorv_2009]
   ,[muutasuorlk_2009]
   ,[muutatutkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2009]), [muutatutkkmaak_2009])
   ,[muutatutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2009]), [muutatutkjarj_2009])
   ,[muutatutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2009]), [muutatutkkoulk_2009])
   ,[amkopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2000]), [amkopiskkoulk_2000])
   ,[amkopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2000]), [amkopiskjarj_2000])
   ,[amkkmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2000]), [amkkmaak_2000])
   ,[amkolotamm_2000]
   ,[amkolosyys_2000]
   ,[ylamkopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2000]), [ylamkopiskkoulk_2000])
   ,[ylamkopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2000]), [ylamkopiskjarj_2000])
   ,[ylamkkmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2000]), [ylamkkmaak_2000])
   ,[ylamkolotamm_2000]
   ,[ylamkolosyys_2000]
   ,[alkkopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2000]), [alkkopiskkoulk_2000])
   ,[alkkopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2000]), [alkkopiskjarj_2000])
   ,[alkkkmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2000]), [alkkkmaak_2000])
   ,[alkkolotamm_2000]
   ,[alkkolosyys_2000]
   ,[ylkkopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2000]), [ylkkopiskkoulk_2000])
   ,[ylkkopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2000]), [ylkkopiskjarj_2000])
   ,[ylkkkmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2000]), [ylkkkmaak_2000])
   ,[ylkkolotamm_2000]
   ,[ylkkolosyys_2000]
   ,[tkopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2000]), [tkopiskkoulk_2000])
   ,[tkopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2000]), [tkopiskjarj_2000])
   ,[tkkmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2000]), [tkkmaak_2000])
   ,[tkolotamm_2000]
   ,[tkolosyys_2000]
   ,[muutaopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2000]), [muutaopiskkoulk_2000])
   ,[muutaopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2000]), [muutaopiskjarj_2000])
   ,[muutakmaak_2000] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2000]), [muutakmaak_2000])
   ,[muutaolotamm_2000]
   ,[muutaolosyys_2000]
   ,[amkopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2001]), [amkopiskkoulk_2001])
   ,[amkopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2001]), [amkopiskjarj_2001])
   ,[amkkmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2001]), [amkkmaak_2001])
   ,[amkolotamm_2001]
   ,[amkolosyys_2001]
   ,[ylamkopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2001]), [ylamkopiskkoulk_2001])
   ,[ylamkopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2001]), [ylamkopiskjarj_2001])
   ,[ylamkkmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2001]), [ylamkkmaak_2001])
   ,[ylamkolotamm_2001]
   ,[ylamkolosyys_2001]
   ,[alkkopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2001]), [alkkopiskkoulk_2001])
   ,[alkkopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2001]), [alkkopiskjarj_2001])
   ,[alkkkmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2001]), [alkkkmaak_2001])
   ,[alkkolotamm_2001]
   ,[alkkolosyys_2001]
   ,[ylkkopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2001]), [ylkkopiskkoulk_2001])
   ,[ylkkopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2001]), [ylkkopiskjarj_2001])
   ,[ylkkkmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2001]), [ylkkkmaak_2001])
   ,[ylkkolotamm_2001]
   ,[ylkkolosyys_2001]
   ,[tkopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2001]), [tkopiskkoulk_2001])
   ,[tkopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2001]), [tkopiskjarj_2001])
   ,[tkkmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2001]), [tkkmaak_2001])
   ,[tkolotamm_2001]
   ,[tkolosyys_2001]
   ,[muutaopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2001]), [muutaopiskkoulk_2001])
   ,[muutaopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2001]), [muutaopiskjarj_2001])
   ,[muutakmaak_2001] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2001]), [muutakmaak_2001])
   ,[muutaolotamm_2001]
   ,[muutaolosyys_2001]
   ,[amkopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2002]), [amkopiskkoulk_2002])
   ,[amkopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2002]), [amkopiskjarj_2002])
   ,[amkkmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2002]), [amkkmaak_2002])
   ,[amkolotamm_2002]
   ,[amkolosyys_2002]
   ,[ylamkopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2002]), [ylamkopiskkoulk_2002])
   ,[ylamkopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2002]), [ylamkopiskjarj_2002])
   ,[ylamkkmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2002]), [ylamkkmaak_2002])
   ,[ylamkolotamm_2002]
   ,[ylamkolosyys_2002]
   ,[alkkopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2002]), [alkkopiskkoulk_2002])
   ,[alkkopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2002]), [alkkopiskjarj_2002])
   ,[alkkkmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2002]), [alkkkmaak_2002])
   ,[alkkolotamm_2002]
   ,[alkkolosyys_2002]
   ,[ylkkopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2002]), [ylkkopiskkoulk_2002])
   ,[ylkkopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2002]), [ylkkopiskjarj_2002])
   ,[ylkkkmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2002]), [ylkkkmaak_2002])
   ,[ylkkolotamm_2002]
   ,[ylkkolosyys_2002]
   ,[tkopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2002]), [tkopiskkoulk_2002])
   ,[tkopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2002]), [tkopiskjarj_2002])
   ,[tkkmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2002]), [tkkmaak_2002])
   ,[tkolotamm_2002]
   ,[tkolosyys_2002]
   ,[muutaopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2002]), [muutaopiskkoulk_2002])
   ,[muutaopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2002]), [muutaopiskjarj_2002])
   ,[muutakmaak_2002] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2002]), [muutakmaak_2002])
   ,[muutaolotamm_2002]
   ,[muutaolosyys_2002]
   ,[amkopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2003]), [amkopiskkoulk_2003])
   ,[amkopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2003]), [amkopiskjarj_2003])
   ,[amkkmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2003]), [amkkmaak_2003])
   ,[amkolotamm_2003]
   ,[amkolosyys_2003]
   ,[ylamkopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2003]), [ylamkopiskkoulk_2003])
   ,[ylamkopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2003]), [ylamkopiskjarj_2003])
   ,[ylamkkmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2003]), [ylamkkmaak_2003])
   ,[ylamkolotamm_2003]
   ,[ylamkolosyys_2003]
   ,[alkkopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2003]), [alkkopiskkoulk_2003])
   ,[alkkopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2003]), [alkkopiskjarj_2003])
   ,[alkkkmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2003]), [alkkkmaak_2003])
   ,[alkkolotamm_2003]
   ,[alkkolosyys_2003]
   ,[ylkkopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2003]), [ylkkopiskkoulk_2003])
   ,[ylkkopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2003]), [ylkkopiskjarj_2003])
   ,[ylkkkmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2003]), [ylkkkmaak_2003])
   ,[ylkkolotamm_2003]
   ,[ylkkolosyys_2003]
   ,[tkopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2003]), [tkopiskkoulk_2003])
   ,[tkopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2003]), [tkopiskjarj_2003])
   ,[tkkmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2003]), [tkkmaak_2003])
   ,[tkolotamm_2003]
   ,[tkolosyys_2003]
   ,[muutaopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2003]), [muutaopiskkoulk_2003])
   ,[muutaopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2003]), [muutaopiskjarj_2003])
   ,[muutakmaak_2003] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2003]), [muutakmaak_2003])
   ,[muutaolotamm_2003]
   ,[muutaolosyys_2003]
   ,[amkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2004]), [amkopiskkoulk_2004])
   ,[amkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2004]), [amkopiskjarj_2004])
   ,[amkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2004]), [amkkmaak_2004])
   ,[amkolotamm_2004]
   ,[amkolosyys_2004]
   ,[ylamkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2004]), [ylamkopiskkoulk_2004])
   ,[ylamkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2004]), [ylamkopiskjarj_2004])
   ,[ylamkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2004]), [ylamkkmaak_2004])
   ,[ylamkolotamm_2004]
   ,[ylamkolosyys_2004]
   ,[alkkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2004]), [alkkopiskkoulk_2004])
   ,[alkkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2004]), [alkkopiskjarj_2004])
   ,[alkkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2004]), [alkkkmaak_2004])
   ,[alkkolotamm_2004]
   ,[alkkolosyys_2004]
   ,[ylkkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2004]), [ylkkopiskkoulk_2004])
   ,[ylkkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2004]), [ylkkopiskjarj_2004])
   ,[ylkkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2004]), [ylkkkmaak_2004])
   ,[ylkkolotamm_2004]
   ,[ylkkolosyys_2004]
   ,[tkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2004]), [tkopiskkoulk_2004])
   ,[tkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2004]), [tkopiskjarj_2004])
   ,[tkkmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2004]), [tkkmaak_2004])
   ,[tkolotamm_2004]
   ,[tkolosyys_2004]
   ,[muutaopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2004]), [muutaopiskkoulk_2004])
   ,[muutaopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2004]), [muutaopiskjarj_2004])
   ,[muutakmaak_2004] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2004]), [muutakmaak_2004])
   ,[muutaolotamm_2004]
   ,[muutaolosyys_2004]
   ,[amkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2005]), [amkopiskkoulk_2005])
   ,[amkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2005]), [amkopiskjarj_2005])
   ,[amkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2005]), [amkkmaak_2005])
   ,[amkolotamm_2005]
   ,[amkolosyys_2005]
   ,[ylamkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2005]), [ylamkopiskkoulk_2005])
   ,[ylamkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2005]), [ylamkopiskjarj_2005])
   ,[ylamkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2005]), [ylamkkmaak_2005])
   ,[ylamkolotamm_2005]
   ,[ylamkolosyys_2005]
   ,[alkkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2005]), [alkkopiskkoulk_2005])
   ,[alkkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2005]), [alkkopiskjarj_2005])
   ,[alkkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2005]), [alkkkmaak_2005])
   ,[alkkolotamm_2005]
   ,[alkkolosyys_2005]
   ,[ylkkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2005]), [ylkkopiskkoulk_2005])
   ,[ylkkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2005]), [ylkkopiskjarj_2005])
   ,[ylkkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2005]), [ylkkkmaak_2005])
   ,[ylkkolotamm_2005]
   ,[ylkkolosyys_2005]
   ,[tkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2005]), [tkopiskkoulk_2005])
   ,[tkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2005]), [tkopiskjarj_2005])
   ,[tkkmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2005]), [tkkmaak_2005])
   ,[tkolotamm_2005]
   ,[tkolosyys_2005]
   ,[muutaopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2005]), [muutaopiskkoulk_2005])
   ,[muutaopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2005]), [muutaopiskjarj_2005])
   ,[muutakmaak_2005] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2005]), [muutakmaak_2005])
   ,[muutaolotamm_2005]
   ,[muutaolosyys_2005]
   ,[amkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2006]), [amkopiskkoulk_2006])
   ,[amkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2006]), [amkopiskjarj_2006])
   ,[amkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2006]), [amkkmaak_2006])
   ,[amkolotamm_2006]
   ,[amkolosyys_2006]
   ,[ylamkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2006]), [ylamkopiskkoulk_2006])
   ,[ylamkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2006]), [ylamkopiskjarj_2006])
   ,[ylamkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2006]), [ylamkkmaak_2006])
   ,[ylamkolotamm_2006]
   ,[ylamkolosyys_2006]
   ,[alkkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2006]), [alkkopiskkoulk_2006])
   ,[alkkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2006]), [alkkopiskjarj_2006])
   ,[alkkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2006]), [alkkkmaak_2006])
   ,[alkkolotamm_2006]
   ,[alkkolosyys_2006]
   ,[ylkkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2006]), [ylkkopiskkoulk_2006])
   ,[ylkkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2006]), [ylkkopiskjarj_2006])
   ,[ylkkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2006]), [ylkkkmaak_2006])
   ,[ylkkolotamm_2006]
   ,[ylkkolosyys_2006]
   ,[tkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2006]), [tkopiskkoulk_2006])
   ,[tkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2006]), [tkopiskjarj_2006])
   ,[tkkmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2006]), [tkkmaak_2006])
   ,[tkolotamm_2006]
   ,[tkolosyys_2006]
   ,[muutaopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2006]), [muutaopiskkoulk_2006])
   ,[muutaopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2006]), [muutaopiskjarj_2006])
   ,[muutakmaak_2006] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2006]), [muutakmaak_2006])
   ,[muutaolotamm_2006]
   ,[muutaolosyys_2006]
   ,[amkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2007]), [amkopiskkoulk_2007])
   ,[amkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2007]), [amkopiskjarj_2007])
   ,[amkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2007]), [amkkmaak_2007])
   ,[amkolotamm_2007]
   ,[amkolosyys_2007]
   ,[ylamkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2007]), [ylamkopiskkoulk_2007])
   ,[ylamkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2007]), [ylamkopiskjarj_2007])
   ,[ylamkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2007]), [ylamkkmaak_2007])
   ,[ylamkolotamm_2007]
   ,[ylamkolosyys_2007]
   ,[alkkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2007]), [alkkopiskkoulk_2007])
   ,[alkkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2007]), [alkkopiskjarj_2007])
   ,[alkkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2007]), [alkkkmaak_2007])
   ,[alkkolotamm_2007]
   ,[alkkolosyys_2007]
   ,[ylkkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2007]), [ylkkopiskkoulk_2007])
   ,[ylkkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2007]), [ylkkopiskjarj_2007])
   ,[ylkkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2007]), [ylkkkmaak_2007])
   ,[ylkkolotamm_2007]
   ,[ylkkolosyys_2007]
   ,[tkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2007]), [tkopiskkoulk_2007])
   ,[tkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2007]), [tkopiskjarj_2007])
   ,[tkkmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2007]), [tkkmaak_2007])
   ,[tkolotamm_2007]
   ,[tkolosyys_2007]
   ,[muutaopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2007]), [muutaopiskkoulk_2007])
   ,[muutaopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2007]), [muutaopiskjarj_2007])
   ,[muutakmaak_2007] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2007]), [muutakmaak_2007])
   ,[muutaolotamm_2007]
   ,[muutaolosyys_2007]
   ,[amkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2008]), [amkopiskkoulk_2008])
   ,[amkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2008]), [amkopiskjarj_2008])
   ,[amkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2008]), [amkkmaak_2008])
   ,[amkolotamm_2008]
   ,[amkolosyys_2008]
   ,[ylamkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2008]), [ylamkopiskkoulk_2008])
   ,[ylamkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2008]), [ylamkopiskjarj_2008])
   ,[ylamkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2008]), [ylamkkmaak_2008])
   ,[ylamkolotamm_2008]
   ,[ylamkolosyys_2008]
   ,[alkkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2008]), [alkkopiskkoulk_2008])
   ,[alkkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2008]), [alkkopiskjarj_2008])
   ,[alkkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2008]), [alkkkmaak_2008])
   ,[alkkolotamm_2008]
   ,[alkkolosyys_2008]
   ,[ylkkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2008]), [ylkkopiskkoulk_2008])
   ,[ylkkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2008]), [ylkkopiskjarj_2008])
   ,[ylkkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2008]), [ylkkkmaak_2008])
   ,[ylkkolotamm_2008]
   ,[ylkkolosyys_2008]
   ,[tkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2008]), [tkopiskkoulk_2008])
   ,[tkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2008]), [tkopiskjarj_2008])
   ,[tkkmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2008]), [tkkmaak_2008])
   ,[tkolotamm_2008]
   ,[tkolosyys_2008]
   ,[muutaopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2008]), [muutaopiskkoulk_2008])
   ,[muutaopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2008]), [muutaopiskjarj_2008])
   ,[muutakmaak_2008] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2008]), [muutakmaak_2008])
   ,[muutaolotamm_2008]
   ,[muutaolosyys_2008]
   ,[amkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2009]), [amkopiskkoulk_2009])
   ,[amkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2009]), [amkopiskjarj_2009])
   ,[amkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2009]), [amkkmaak_2009])
   ,[amkolotamm_2009]
   ,[amkolosyys_2009]
   ,[ylamkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2009]), [ylamkopiskkoulk_2009])
   ,[ylamkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2009]), [ylamkopiskjarj_2009])
   ,[ylamkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2009]), [ylamkkmaak_2009])
   ,[ylamkolotamm_2009]
   ,[ylamkolosyys_2009]
   ,[alkkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2009]), [alkkopiskkoulk_2009])
   ,[alkkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2009]), [alkkopiskjarj_2009])
   ,[alkkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2009]), [alkkkmaak_2009])
   ,[alkkolotamm_2009]
   ,[alkkolosyys_2009]
   ,[ylkkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2009]), [ylkkopiskkoulk_2009])
   ,[ylkkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2009]), [ylkkopiskjarj_2009])
   ,[ylkkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2009]), [ylkkkmaak_2009])
   ,[ylkkolotamm_2009]
   ,[ylkkolosyys_2009]
   ,[tkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2009]), [tkopiskkoulk_2009])
   ,[tkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2009]), [tkopiskjarj_2009])
   ,[tkkmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2009]), [tkkmaak_2009])
   ,[tkolotamm_2009]
   ,[tkolosyys_2009]
   ,[muutaopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2009]), [muutaopiskkoulk_2009])
   ,[muutaopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2009]), [muutaopiskjarj_2009])
   ,[muutakmaak_2009] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2009]), [muutakmaak_2009])
   ,[muutaolotamm_2009]
   ,[muutaolosyys_2009]
   ,[ptoim1r5_2000]
   ,[amas_2000]
   ,[ptoim1r5_2001]
   ,[amas_2001]
   ,[ptoim1r5_2002]
   ,[amas_2002]
   ,[ptoim1r5_2003]
   ,[amas_2003]
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

--UUSIVUOSI
--2010
   ,[amksuorv_2010]
   ,[amksuorlk_2010]
   ,[amktutkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2010]), [amktutkkmaak_2010])
   ,[amktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2010]), [amktutkjarj_2010])
   ,[amktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2010]), [amktutkkoulk_2010])
   ,[ylamksuorv_2010]
   ,[ylamksuorlk_2010]
   ,[ylamktutkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2010]), [ylamktutkkmaak_2010])
   ,[ylamktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2010]), [ylamktutkjarj_2010])
   ,[ylamktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2010]), [ylamktutkkoulk_2010])
   ,[alkksuorv_2010]
   ,[alkksuorlk_2010]
   ,[alkktutkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2010]), [alkktutkkmaak_2010])
   ,[alkktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2010]), [alkktutkjarj_2010])
   ,[alkktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2010]), [alkktutkkoulk_2010])
   ,[ylkksuorv_2010]
   ,[ylkksuorlk_2010]
   ,[ylkktutkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2010]), [ylkktutkkmaak_2010])
   ,[ylkktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2010]), [ylkktutkjarj_2010])
   ,[ylkktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2010]), [ylkktutkkoulk_2010])
   ,[tksuorv_2010]
   ,[tksuorlk_2010]
   ,[tktutkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2010]), [tktutkkmaak_2010])
   ,[tktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2010]), [tktutkjarj_2010])
   ,[tktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2010]), [tktutkkoulk_2010])
   ,[muutasuorv_2010]
   ,[muutasuorlk_2010]
   ,[muutatutkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2010]), [muutatutkkmaak_2010])
   ,[muutatutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2010]), [muutatutkjarj_2010])
   ,[muutatutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2010]), [muutatutkkoulk_2010])
   ,[amkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2010]), [amkopiskkoulk_2010])
   ,[amkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2010]), [amkopiskjarj_2010])
   ,[amkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2010]), [amkkmaak_2010])
   ,[amkolotamm_2010]
   ,[amkolosyys_2010]
   ,[ylamkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2010]), [ylamkopiskkoulk_2010])
   ,[ylamkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2010]), [ylamkopiskjarj_2010])
   ,[ylamkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2010]), [ylamkkmaak_2010])
   ,[ylamkolotamm_2010]
   ,[ylamkolosyys_2010]
   ,[alkkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2010]), [alkkopiskkoulk_2010])
   ,[alkkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2010]), [alkkopiskjarj_2010])
   ,[alkkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2010]), [alkkkmaak_2010])
   ,[alkkolotamm_2010]
   ,[alkkolosyys_2010]
   ,[ylkkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2010]), [ylkkopiskkoulk_2010])
   ,[ylkkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2010]), [ylkkopiskjarj_2010])
   ,[ylkkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2010]), [ylkkkmaak_2010])
   ,[ylkkolotamm_2010]
   ,[ylkkolosyys_2010]
   ,[tkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2010]), [tkopiskkoulk_2010])
   ,[tkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2010]), [tkopiskjarj_2010])
   ,[tkkmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2010]), [tkkmaak_2010])
   ,[tkolotamm_2010]
   ,[tkolosyys_2010]
   ,[muutaopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2010]), [muutaopiskkoulk_2010])
   ,[muutaopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2010]), [muutaopiskjarj_2010])
   ,[muutakmaak_2010] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2010]), [muutakmaak_2010])
   ,[muutaolotamm_2010]
   ,[muutaolosyys_2010]
   ,[ptoim1r5_2010]
   ,[amas_2010]

--UUSIVUOSI
--2011
   ,[amksuorv_2011]
   ,[amksuorlk_2011]
   ,[amktutkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2011]), [amktutkkmaak_2011])
   ,[amktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2011]), [amktutkjarj_2011])
   ,[amktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2011]), [amktutkkoulk_2011])
   ,[ylamksuorv_2011]
   ,[ylamksuorlk_2011]
   ,[ylamktutkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2011]), [ylamktutkkmaak_2011])
   ,[ylamktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2011]), [ylamktutkjarj_2011])
   ,[ylamktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2011]), [ylamktutkkoulk_2011])
   ,[alkksuorv_2011]
   ,[alkksuorlk_2011]
   ,[alkktutkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2011]), [alkktutkkmaak_2011])
   ,[alkktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2011]), [alkktutkjarj_2011])
   ,[alkktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2011]), [alkktutkkoulk_2011])
   ,[ylkksuorv_2011]
   ,[ylkksuorlk_2011]
   ,[ylkktutkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2011]), [ylkktutkkmaak_2011])
   ,[ylkktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2011]), [ylkktutkjarj_2011])
   ,[ylkktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2011]), [ylkktutkkoulk_2011])
   ,[tksuorv_2011]
   ,[tksuorlk_2011]
   ,[tktutkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2011]), [tktutkkmaak_2011])
   ,[tktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2011]), [tktutkjarj_2011])
   ,[tktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2011]), [tktutkkoulk_2011])
   ,[muutasuorv_2011]
   ,[muutasuorlk_2011]
   ,[muutatutkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2011]), [muutatutkkmaak_2011])
   ,[muutatutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2011]), [muutatutkjarj_2011])
   ,[muutatutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2011]), [muutatutkkoulk_2011])
   ,[amkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2011]), [amkopiskkoulk_2011])
   ,[amkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2011]), [amkopiskjarj_2011])
   ,[amkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2011]), [amkkmaak_2011])
   ,[amkolotamm_2011]
   ,[amkolosyys_2011]
   ,[ylamkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2011]), [ylamkopiskkoulk_2011])
   ,[ylamkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2011]), [ylamkopiskjarj_2011])
   ,[ylamkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2011]), [ylamkkmaak_2011])
   ,[ylamkolotamm_2011]
   ,[ylamkolosyys_2011]
   ,[alkkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2011]), [alkkopiskkoulk_2011])
   ,[alkkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2011]), [alkkopiskjarj_2011])
   ,[alkkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2011]), [alkkkmaak_2011])
   ,[alkkolotamm_2011]
   ,[alkkolosyys_2011]
   ,[ylkkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2011]), [ylkkopiskkoulk_2011])
   ,[ylkkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2011]), [ylkkopiskjarj_2011])
   ,[ylkkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2011]), [ylkkkmaak_2011])
   ,[ylkkolotamm_2011]
   ,[ylkkolosyys_2011]
   ,[tkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2011]), [tkopiskkoulk_2011])
   ,[tkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2011]), [tkopiskjarj_2011])
   ,[tkkmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2011]), [tkkmaak_2011])
   ,[tkolotamm_2011]
   ,[tkolosyys_2011]
   ,[muutaopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2011]), [muutaopiskkoulk_2011])
   ,[muutaopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2011]), [muutaopiskjarj_2011])
   ,[muutakmaak_2011] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2011]), [muutakmaak_2011])
   ,[muutaolotamm_2011]
   ,[muutaolosyys_2011]
   ,[ptoim1r5_2011]
   ,[amas_2011]
   
--UUSIVUOSI
--2012
   ,[amksuorv_2012]
   ,[amksuorlk_2012]
   ,[amktutkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2012]), [amktutkkmaak_2012])
   ,[amktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2012]), [amktutkjarj_2012])
   ,[amktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2012]), [amktutkkoulk_2012])
   ,[ylamksuorv_2012]
   ,[ylamksuorlk_2012]
   ,[ylamktutkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2012]), [ylamktutkkmaak_2012])
   ,[ylamktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2012]), [ylamktutkjarj_2012])
   ,[ylamktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2012]), [ylamktutkkoulk_2012])
   ,[alkksuorv_2012]
   ,[alkksuorlk_2012]
   ,[alkktutkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2012]), [alkktutkkmaak_2012])
   ,[alkktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2012]), [alkktutkjarj_2012])
   ,[alkktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2012]), [alkktutkkoulk_2012])
   ,[ylkksuorv_2012]
   ,[ylkksuorlk_2012]
   ,[ylkktutkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2012]), [ylkktutkkmaak_2012])
   ,[ylkktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2012]), [ylkktutkjarj_2012])
   ,[ylkktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2012]), [ylkktutkkoulk_2012])
   ,[tksuorv_2012]
   ,[tksuorlk_2012]
   ,[tktutkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2012]), [tktutkkmaak_2012])
   ,[tktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2012]), [tktutkjarj_2012])
   ,[tktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2012]), [tktutkkoulk_2012])
   ,[muutasuorv_2012]
   ,[muutasuorlk_2012]
   ,[muutatutkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2012]), [muutatutkkmaak_2012])
   ,[muutatutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2012]), [muutatutkjarj_2012])
   ,[muutatutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2012]), [muutatutkkoulk_2012])
   ,[amkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2012]), [amkopiskkoulk_2012])
   ,[amkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2012]), [amkopiskjarj_2012])
   ,[amkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2012]), [amkkmaak_2012])
   ,[amkolotamm_2012]
   ,[amkolosyys_2012]
   ,[ylamkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2012]), [ylamkopiskkoulk_2012])
   ,[ylamkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2012]), [ylamkopiskjarj_2012])
   ,[ylamkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2012]), [ylamkkmaak_2012])
   ,[ylamkolotamm_2012]
   ,[ylamkolosyys_2012]
   ,[alkkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2012]), [alkkopiskkoulk_2012])
   ,[alkkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2012]), [alkkopiskjarj_2012])
   ,[alkkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2012]), [alkkkmaak_2012])
   ,[alkkolotamm_2012]
   ,[alkkolosyys_2012]
   ,[ylkkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2012]), [ylkkopiskkoulk_2012])
   ,[ylkkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2012]), [ylkkopiskjarj_2012])
   ,[ylkkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2012]), [ylkkkmaak_2012])
   ,[ylkkolotamm_2012]
   ,[ylkkolosyys_2012]
   ,[tkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2012]), [tkopiskkoulk_2012])
   ,[tkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2012]), [tkopiskjarj_2012])
   ,[tkkmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2012]), [tkkmaak_2012])
   ,[tkolotamm_2012]
   ,[tkolosyys_2012]
   ,[muutaopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2012]), [muutaopiskkoulk_2012])
   ,[muutaopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2012]), [muutaopiskjarj_2012])
   ,[muutakmaak_2012] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2012]), [muutakmaak_2012])
   ,[muutaolotamm_2012]
   ,[muutaolosyys_2012]
   ,[ptoim1r5_2012]
   ,[amas_2012]
--2013
   ,[amksuorv_2013]
   ,[amksuorlk_2013]
   ,[amktutkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2013]), [amktutkkmaak_2013])
   ,[amktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2013]), [amktutkjarj_2013])
   ,[amktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2013]), [amktutkkoulk_2013])
   ,[ylamksuorv_2013]
   ,[ylamksuorlk_2013]
   ,[ylamktutkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2013]), [ylamktutkkmaak_2013])
   ,[ylamktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2013]), [ylamktutkjarj_2013])
   ,[ylamktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2013]), [ylamktutkkoulk_2013])
   ,[alkksuorv_2013]
   ,[alkksuorlk_2013]
   ,[alkktutkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2013]), [alkktutkkmaak_2013])
   ,[alkktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2013]), [alkktutkjarj_2013])
   ,[alkktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2013]), [alkktutkkoulk_2013])
   ,[ylkksuorv_2013]
   ,[ylkksuorlk_2013]
   ,[ylkktutkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2013]), [ylkktutkkmaak_2013])
   ,[ylkktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2013]), [ylkktutkjarj_2013])
   ,[ylkktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2013]), [ylkktutkkoulk_2013])
   ,[tksuorv_2013]
   ,[tksuorlk_2013]
   ,[tktutkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2013]), [tktutkkmaak_2013])
   ,[tktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2013]), [tktutkjarj_2013])
   ,[tktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2013]), [tktutkkoulk_2013])
   ,[muutasuorv_2013]
   ,[muutasuorlk_2013]
   ,[muutatutkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2013]), [muutatutkkmaak_2013])
   ,[muutatutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2013]), [muutatutkjarj_2013])
   ,[muutatutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2013]), [muutatutkkoulk_2013])
   ,[amkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2013]), [amkopiskkoulk_2013])
   ,[amkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2013]), [amkopiskjarj_2013])
   ,[amkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2013]), [amkkmaak_2013])
   ,[amkolotamm_2013]
   ,[amkolosyys_2013]
   ,[ylamkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2013]), [ylamkopiskkoulk_2013])
   ,[ylamkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2013]), [ylamkopiskjarj_2013])
   ,[ylamkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2013]), [ylamkkmaak_2013])
   ,[ylamkolotamm_2013]
   ,[ylamkolosyys_2013]
   ,[alkkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2013]), [alkkopiskkoulk_2013])
   ,[alkkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2013]), [alkkopiskjarj_2013])
   ,[alkkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2013]), [alkkkmaak_2013])
   ,[alkkolotamm_2013]
   ,[alkkolosyys_2013]
   ,[ylkkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2013]), [ylkkopiskkoulk_2013])
   ,[ylkkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2013]), [ylkkopiskjarj_2013])
   ,[ylkkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2013]), [ylkkkmaak_2013])
   ,[ylkkolotamm_2013]
   ,[ylkkolosyys_2013]
   ,[tkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2013]), [tkopiskkoulk_2013])
   ,[tkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2013]), [tkopiskjarj_2013])
   ,[tkkmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2013]), [tkkmaak_2013])
   ,[tkolotamm_2013]
   ,[tkolosyys_2013]
   ,[muutaopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2013]), [muutaopiskkoulk_2013])
   ,[muutaopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2013]), [muutaopiskjarj_2013])
   ,[muutakmaak_2013] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2013]), [muutakmaak_2013])
   ,[muutaolotamm_2013]
   ,[muutaolosyys_2013]
   ,[ptoim1r5_2013]
   ,[amas_2013]

-- 2014

   ,[amksuorv_2014]
   ,[amksuorlk_2014]
   ,[amktutkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2014]), [amktutkkmaak_2014])
   ,[amktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2014]), [amktutkjarj_2014])
   ,[amktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2014]), [amktutkkoulk_2014])
   ,[ylamksuorv_2014]
   ,[ylamksuorlk_2014]
   ,[ylamktutkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2014]), [ylamktutkkmaak_2014])
   ,[ylamktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2014]), [ylamktutkjarj_2014])
   ,[ylamktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2014]), [ylamktutkkoulk_2014])
   ,[alkksuorv_2014]
   ,[alkksuorlk_2014]
   ,[alkktutkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2014]), [alkktutkkmaak_2014])
   ,[alkktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2014]), [alkktutkjarj_2014])
   ,[alkktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2014]), [alkktutkkoulk_2014])
   ,[ylkksuorv_2014]
   ,[ylkksuorlk_2014]
   ,[ylkktutkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2014]), [ylkktutkkmaak_2014])
   ,[ylkktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2014]), [ylkktutkjarj_2014])
   ,[ylkktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2014]), [ylkktutkkoulk_2014])
   ,[tksuorv_2014]
   ,[tksuorlk_2014]
   ,[tktutkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2014]), [tktutkkmaak_2014])
   ,[tktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2014]), [tktutkjarj_2014])
   ,[tktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2014]), [tktutkkoulk_2014])
   ,[muutasuorv_2014]
   ,[muutasuorlk_2014]
   ,[muutatutkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2014]), [muutatutkkmaak_2014])
   ,[muutatutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2014]), [muutatutkjarj_2014])
   ,[muutatutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2014]), [muutatutkkoulk_2014])
   ,[amkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2014]), [amkopiskkoulk_2014])
   ,[amkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2014]), [amkopiskjarj_2014])
   ,[amkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2014]), [amkkmaak_2014])
   ,[amkolotamm_2014]
   ,[amkolosyys_2014]
   ,[ylamkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2014]), [ylamkopiskkoulk_2014])
   ,[ylamkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2014]), [ylamkopiskjarj_2014])
   ,[ylamkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2014]), [ylamkkmaak_2014])
   ,[ylamkolotamm_2014]
   ,[ylamkolosyys_2014]
   ,[alkkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2014]), [alkkopiskkoulk_2014])
   ,[alkkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2014]), [alkkopiskjarj_2014])
   ,[alkkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2014]), [alkkkmaak_2014])
   ,[alkkolotamm_2014]
   ,[alkkolosyys_2014]
   ,[ylkkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2014]), [ylkkopiskkoulk_2014])
   ,[ylkkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2014]), [ylkkopiskjarj_2014])
   ,[ylkkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2014]), [ylkkkmaak_2014])
   ,[ylkkolotamm_2014]
   ,[ylkkolosyys_2014]
   ,[tkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2014]), [tkopiskkoulk_2014])
   ,[tkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2014]), [tkopiskjarj_2014])
   ,[tkkmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2014]), [tkkmaak_2014])
   ,[tkolotamm_2014]
   ,[tkolosyys_2014]
   ,[muutaopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2014]), [muutaopiskkoulk_2014])
   ,[muutaopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2014]), [muutaopiskjarj_2014])
   ,[muutakmaak_2014] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2014]), [muutakmaak_2014])
   ,[muutaolotamm_2014]
   ,[muutaolosyys_2014]
   ,[ptoim1r5_2014]
   ,[amas_2014]

--2015

   ,[amksuorv_2015]
   ,[amksuorlk_2015]
   ,[amktutkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amktutkkmaak_2015]), [amktutkkmaak_2015])
   ,[amktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2015]), [amktutkjarj_2015])
   ,[amktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2015]), [amktutkkoulk_2015])
   ,[ylamksuorv_2015]
   ,[ylamksuorlk_2015]
   ,[ylamktutkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamktutkkmaak_2015]), [ylamktutkkmaak_2015])
   ,[ylamktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2015]), [ylamktutkjarj_2015])
   ,[ylamktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2015]), [ylamktutkkoulk_2015])
   ,[alkksuorv_2015]
   ,[alkksuorlk_2015]
   ,[alkktutkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkktutkkmaak_2015]), [alkktutkkmaak_2015])
   ,[alkktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2015]), [alkktutkjarj_2015])
   ,[alkktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2015]), [alkktutkkoulk_2015])
   ,[ylkksuorv_2015]
   ,[ylkksuorlk_2015]
   ,[ylkktutkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkktutkkmaak_2015]), [ylkktutkkmaak_2015])
   ,[ylkktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2015]), [ylkktutkjarj_2015])
   ,[ylkktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2015]), [ylkktutkkoulk_2015])
   ,[tksuorv_2015]
   ,[tksuorlk_2015]
   ,[tktutkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tktutkkmaak_2015]), [tktutkkmaak_2015])
   ,[tktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2015]), [tktutkjarj_2015])
   ,[tktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2015]), [tktutkkoulk_2015])
   ,[muutasuorv_2015]
   ,[muutasuorlk_2015]
   ,[muutatutkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutatutkkmaak_2015]), [muutatutkkmaak_2015])
   ,[muutatutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2015]), [muutatutkjarj_2015])
   ,[muutatutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2015]), [muutatutkkoulk_2015])
   ,[amkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2015]), [amkopiskkoulk_2015])
   ,[amkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2015]), [amkopiskjarj_2015])
   ,[amkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[amkkmaak_2015]), [amkkmaak_2015])
   ,[amkolotamm_2015]
   ,[amkolosyys_2015]
   ,[ylamkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2015]), [ylamkopiskkoulk_2015])
   ,[ylamkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2015]), [ylamkopiskjarj_2015])
   ,[ylamkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylamkkmaak_2015]), [ylamkkmaak_2015])
   ,[ylamkolotamm_2015]
   ,[ylamkolosyys_2015]
   ,[alkkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2015]), [alkkopiskkoulk_2015])
   ,[alkkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2015]), [alkkopiskjarj_2015])
   ,[alkkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[alkkkmaak_2015]), [alkkkmaak_2015])
   ,[alkkolotamm_2015]
   ,[alkkolosyys_2015]
   ,[ylkkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2015]), [ylkkopiskkoulk_2015])
   ,[ylkkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2015]), [ylkkopiskjarj_2015])
   ,[ylkkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[ylkkkmaak_2015]), [ylkkkmaak_2015])
   ,[ylkkolotamm_2015]
   ,[ylkkolosyys_2015]
   ,[tkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2015]), [tkopiskkoulk_2015])
   ,[tkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2015]), [tkopiskjarj_2015])
   ,[tkkmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[tkkmaak_2015]), [tkkmaak_2015])
   ,[tkolotamm_2015]
   ,[tkolosyys_2015]
   ,[muutaopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2015]), [muutaopiskkoulk_2015])
   ,[muutaopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2015]), [muutaopiskjarj_2015])
   ,[muutakmaak_2015] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila] WHERE alueluokitus_koodi=[muutakmaak_2015]), [muutakmaak_2015])
   ,[muutaolotamm_2015]
   ,[muutaolosyys_2015]
   ,[ptoim1r5_2015]
   ,[amas_2015]

-- UUSI VUOSI
-- päivitä alle tietolähde ja lähdetaulut; lisää sarakkeet toiseen näkymään

   ,[lkm]
      ,[tietolahde]='K3_10_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, alvv, allk)
      ,[aineistorivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, alvv, allk)
	  ,f1.[rivinro]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_10_sopv_20_1] f1
  inner join [TK_H9098_CSC].[dbo].[TK_K3_10_sopv_20_2] as f2 on f1.rivinro=f2.rivinro 
 --28.8.2013 Poistetaan maanpuolustuskoulutus
WHERE jarj <> '999999-9'
--testausta /Jarmo
--and   alvv='2008' and allk='2'










GO


USE [ANTERO]