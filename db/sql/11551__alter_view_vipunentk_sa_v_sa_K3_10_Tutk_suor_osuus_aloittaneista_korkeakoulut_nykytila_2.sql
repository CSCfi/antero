USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila_2]    Script Date: 9.1.2026 12.53.33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE OR ALTER VIEW [dbo].[v_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila_2] AS

SELECT
/*    [tilv]
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
   ,[alvv_kk] = coalesce(nullif([alvv_kk],''), [alvv]) --täyttö siirretty myöhemmästä latauksesta / CSC Juha 10.9.2021
	,[allk_kk] =
    -- Tampereen teknisen yliopiston kevään ja syksyn opiskelijamäärät ovat väärin päin aloitusvuosilla 2004 ja 2006.
    -- Korjataan virhe kääntämällä aloituskaudet toisin päin.
    -- CSC Jarmo 21.3.2014
		coalesce(nullif( --täyttö siirretty myöhemmästä latauksesta / CSC Juha 10.9.2021
			CASE 
				WHEN jarj='624001-8' AND alvv_kk = '2004' and (alkkopiskjarj_2004<>'' or ylkkopiskjarj_2004<>'' or alkkopiskjarj_2005<>'' or ylkkopiskjarj_2005<>'')
					THEN CASE WHEN allk_kk='1' THEN '2' WHEN allk_kk='2' THEN '1' ELSE allk_kk END
				WHEN jarj='624001-8' AND alvv_kk = '2006' and (alkkopiskjarj_2006<>'' or ylkkopiskjarj_2006<>'' or alkkopiskjarj_2007<>'' or ylkkopiskjarj_2007<>'')
					THEN CASE WHEN allk_kk='1' THEN '2' WHEN allk_kk='2' THEN '1' ELSE allk_kk END
				ELSE allk_kk
			END
		,''),allk)
   ,[ololk]
   ,[klaji]
*/
   [jarj] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[jarj]), [jarj])
/*   ,[kkun] = coalesce((Select alueluokitus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_alueluokitus_kunta_nykytila] WHERE alueluokitus_koodi=[kkun]), [kkun])
   ,[koulk] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[koulk]), [koulk])
   ,[pohjkoulk] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[pohjkoulk]), [pohjkoulk])
   ,[rahlahde]
   ,[amksuorv_2000]
   ,[amksuorlk_2000]
   ,[amktutkkmaak_2000] = coalesce(nullif([amktutkkmaak_2000],'20'),'01')
   ,[amktutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2000]), [amktutkjarj_2000])
   ,[amktutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2000]), [amktutkkoulk_2000])
   ,[ylamksuorv_2000]
   ,[ylamksuorlk_2000]
   ,[ylamktutkkmaak_2000] = coalesce(nullif([ylamktutkkmaak_2000],'20'),'01')
   ,[ylamktutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2000]), [ylamktutkjarj_2000])
   ,[ylamktutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2000]), [ylamktutkkoulk_2000])
   ,[alkksuorv_2000]
   ,[alkksuorlk_2000]
   ,[alkktutkkmaak_2000] = coalesce(nullif([alkktutkkmaak_2000],'20'),'01')
   ,[alkktutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2000]), [alkktutkjarj_2000])
   ,[alkktutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2000]), [alkktutkkoulk_2000])
   ,[ylkksuorv_2000]
   ,[ylkksuorlk_2000]
   ,[ylkktutkkmaak_2000] = coalesce(nullif([ylkktutkkmaak_2000],'20'),'01')
   ,[ylkktutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2000]), [ylkktutkjarj_2000])
   ,[ylkktutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2000]), [ylkktutkkoulk_2000])
   ,[tksuorv_2000]
   ,[tksuorlk_2000]
   ,[tktutkkmaak_2000] = coalesce(nullif([tktutkkmaak_2000],'20'),'01')
   ,[tktutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2000]), [tktutkjarj_2000])
   ,[tktutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2000]), [tktutkkoulk_2000])
   ,[muutasuorv_2000]
   ,[muutasuorlk_2000]
   ,[muutatutkkmaak_2000] = coalesce(nullif([muutatutkkmaak_2000],'20'),'01')
   ,[muutatutkjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2000]), [muutatutkjarj_2000])
   ,[muutatutkkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2000]), [muutatutkkoulk_2000])
   ,[amksuorv_2001]
   ,[amksuorlk_2001]
   ,[amktutkkmaak_2001] = coalesce(nullif([amktutkkmaak_2001],'20'),'01')
   ,[amktutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2001]), [amktutkjarj_2001])
   ,[amktutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2001]), [amktutkkoulk_2001])
   ,[ylamksuorv_2001]
   ,[ylamksuorlk_2001]
   ,[ylamktutkkmaak_2001] = coalesce(nullif([ylamktutkkmaak_2001],'20'),'01')
   ,[ylamktutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2001]), [ylamktutkjarj_2001])
   ,[ylamktutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2001]), [ylamktutkkoulk_2001])
   ,[alkksuorv_2001]
   ,[alkksuorlk_2001]
   ,[alkktutkkmaak_2001] = coalesce(nullif([alkktutkkmaak_2001],'20'),'01')
   ,[alkktutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2001]), [alkktutkjarj_2001])
   ,[alkktutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2001]), [alkktutkkoulk_2001])
   ,[ylkksuorv_2001]
   ,[ylkksuorlk_2001]
   ,[ylkktutkkmaak_2001] = coalesce(nullif([ylkktutkkmaak_2001],'20'),'01')
   ,[ylkktutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2001]), [ylkktutkjarj_2001])
   ,[ylkktutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2001]), [ylkktutkkoulk_2001])
   ,[tksuorv_2001]
   ,[tksuorlk_2001]
   ,[tktutkkmaak_2001] = coalesce(nullif([tktutkkmaak_2001],'20'),'01')
   ,[tktutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2001]), [tktutkjarj_2001])
   ,[tktutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2001]), [tktutkkoulk_2001])
   ,[muutasuorv_2001]
   ,[muutasuorlk_2001]
   ,[muutatutkkmaak_2001] = coalesce(nullif([muutatutkkmaak_2001],'20'),'01')
   ,[muutatutkjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2001]), [muutatutkjarj_2001])
   ,[muutatutkkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2001]), [muutatutkkoulk_2001])
   ,[amksuorv_2002]
   ,[amksuorlk_2002]
   ,[amktutkkmaak_2002] = coalesce(nullif([amktutkkmaak_2002],'20'),'01')
   ,[amktutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2002]), [amktutkjarj_2002])
   ,[amktutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2002]), [amktutkkoulk_2002])
   ,[ylamksuorv_2002]
   ,[ylamksuorlk_2002]
   ,[ylamktutkkmaak_2002] = coalesce(nullif([ylamktutkkmaak_2002],'20'),'01')
   ,[ylamktutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2002]), [ylamktutkjarj_2002])
   ,[ylamktutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2002]), [ylamktutkkoulk_2002])
   ,[alkksuorv_2002]
   ,[alkksuorlk_2002]
   ,[alkktutkkmaak_2002] = coalesce(nullif([alkktutkkmaak_2002],'20'),'01')
   ,[alkktutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2002]), [alkktutkjarj_2002])
   ,[alkktutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2002]), [alkktutkkoulk_2002])
   ,[ylkksuorv_2002]
   ,[ylkksuorlk_2002]
   ,[ylkktutkkmaak_2002] = coalesce(nullif([ylkktutkkmaak_2002],'20'),'01')
   ,[ylkktutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2002]), [ylkktutkjarj_2002])
   ,[ylkktutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2002]), [ylkktutkkoulk_2002])
   ,[tksuorv_2002]
   ,[tksuorlk_2002]
   ,[tktutkkmaak_2002] = coalesce(nullif([tktutkkmaak_2002],'20'),'01')
   ,[tktutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2002]), [tktutkjarj_2002])
   ,[tktutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2002]), [tktutkkoulk_2002])
   ,[muutasuorv_2002]
   ,[muutasuorlk_2002]
   ,[muutatutkkmaak_2002] = coalesce(nullif([muutatutkkmaak_2002],'20'),'01')
   ,[muutatutkjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2002]), [muutatutkjarj_2002])
   ,[muutatutkkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2002]), [muutatutkkoulk_2002])
   ,[amksuorv_2003]
   ,[amksuorlk_2003]
   ,[amktutkkmaak_2003] = coalesce(nullif([amktutkkmaak_2003],'20'),'01')
   ,[amktutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2003]), [amktutkjarj_2003])
   ,[amktutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2003]), [amktutkkoulk_2003])
   ,[ylamksuorv_2003]
   ,[ylamksuorlk_2003]
   ,[ylamktutkkmaak_2003] = coalesce(nullif([ylamktutkkmaak_2003],'20'),'01')
   ,[ylamktutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2003]), [ylamktutkjarj_2003])
   ,[ylamktutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2003]), [ylamktutkkoulk_2003])
   ,[alkksuorv_2003]
   ,[alkksuorlk_2003]
   ,[alkktutkkmaak_2003] = coalesce(nullif([alkktutkkmaak_2003],'20'),'01')
   ,[alkktutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2003]), [alkktutkjarj_2003])
   ,[alkktutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2003]), [alkktutkkoulk_2003])
   ,[ylkksuorv_2003]
   ,[ylkksuorlk_2003]
   ,[ylkktutkkmaak_2003] = coalesce(nullif([ylkktutkkmaak_2003],'20'),'01')
   ,[ylkktutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2003]), [ylkktutkjarj_2003])
   ,[ylkktutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2003]), [ylkktutkkoulk_2003])
   ,[tksuorv_2003]
   ,[tksuorlk_2003]
   ,[tktutkkmaak_2003] = coalesce(nullif([tktutkkmaak_2003],'20'),'01')
   ,[tktutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2003]), [tktutkjarj_2003])
   ,[tktutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2003]), [tktutkkoulk_2003])
   ,[muutasuorv_2003]
   ,[muutasuorlk_2003]
   ,[muutatutkkmaak_2003] = coalesce(nullif([muutatutkkmaak_2003],'20'),'01')
   ,[muutatutkjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2003]), [muutatutkjarj_2003])
   ,[muutatutkkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2003]), [muutatutkkoulk_2003])
   ,[amksuorv_2004]
   ,[amksuorlk_2004]
   ,[amktutkkmaak_2004] = coalesce(nullif([amktutkkmaak_2004],'20'),'01')
   ,[amktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2004]), [amktutkjarj_2004])
   ,[amktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2004]), [amktutkkoulk_2004])
   ,[ylamksuorv_2004]
   ,[ylamksuorlk_2004]
   ,[ylamktutkkmaak_2004] = coalesce(nullif([ylamktutkkmaak_2004],'20'),'01')
   ,[ylamktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2004]), [ylamktutkjarj_2004])
   ,[ylamktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2004]), [ylamktutkkoulk_2004])
   ,[alkksuorv_2004]
   ,[alkksuorlk_2004]
   ,[alkktutkkmaak_2004] = coalesce(nullif([alkktutkkmaak_2004],'20'),'01')
   ,[alkktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2004]), [alkktutkjarj_2004])
   ,[alkktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2004]), [alkktutkkoulk_2004])
   ,[ylkksuorv_2004]
   ,[ylkksuorlk_2004]
   ,[ylkktutkkmaak_2004] = coalesce(nullif([ylkktutkkmaak_2004],'20'),'01')
   ,[ylkktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2004]), [ylkktutkjarj_2004])
   ,[ylkktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2004]), [ylkktutkkoulk_2004])
   ,[tksuorv_2004]
   ,[tksuorlk_2004]
   ,[tktutkkmaak_2004] = coalesce(nullif([tktutkkmaak_2004],'20'),'01')
   ,[tktutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2004]), [tktutkjarj_2004])
   ,[tktutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2004]), [tktutkkoulk_2004])
   ,[muutasuorv_2004]
   ,[muutasuorlk_2004]
   ,[muutatutkkmaak_2004] = coalesce(nullif([muutatutkkmaak_2004],'20'),'01')
   ,[muutatutkjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2004]), [muutatutkjarj_2004])
   ,[muutatutkkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2004]), [muutatutkkoulk_2004])
   ,[amksuorv_2005]
   ,[amksuorlk_2005]
   ,[amktutkkmaak_2005] = coalesce(nullif([amktutkkmaak_2005],'20'),'01')
   ,[amktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2005]), [amktutkjarj_2005])
   ,[amktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2005]), [amktutkkoulk_2005])
   ,[ylamksuorv_2005]
   ,[ylamksuorlk_2005]
   ,[ylamktutkkmaak_2005] = coalesce(nullif([ylamktutkkmaak_2005],'20'),'01')
   ,[ylamktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2005]), [ylamktutkjarj_2005])
   ,[ylamktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2005]), [ylamktutkkoulk_2005])
   ,[alkksuorv_2005]
   ,[alkksuorlk_2005]
   ,[alkktutkkmaak_2005] = coalesce(nullif([alkktutkkmaak_2005],'20'),'01')
   ,[alkktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2005]), [alkktutkjarj_2005])
   ,[alkktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2005]), [alkktutkkoulk_2005])
   ,[ylkksuorv_2005]
   ,[ylkksuorlk_2005]
   ,[ylkktutkkmaak_2005] = coalesce(nullif([ylkktutkkmaak_2005],'20'),'01')
   ,[ylkktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2005]), [ylkktutkjarj_2005])
   ,[ylkktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2005]), [ylkktutkkoulk_2005])
   ,[tksuorv_2005]
   ,[tksuorlk_2005]
   ,[tktutkkmaak_2005] = coalesce(nullif([tktutkkmaak_2005],'20'),'01')
   ,[tktutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2005]), [tktutkjarj_2005])
   ,[tktutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2005]), [tktutkkoulk_2005])
   ,[muutasuorv_2005]
   ,[muutasuorlk_2005]
   ,[muutatutkkmaak_2005] = coalesce(nullif([muutatutkkmaak_2005],'20'),'01')
   ,[muutatutkjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2005]), [muutatutkjarj_2005])
   ,[muutatutkkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2005]), [muutatutkkoulk_2005])
   ,[amksuorv_2006]
   ,[amksuorlk_2006]
   ,[amktutkkmaak_2006] = coalesce(nullif([amktutkkmaak_2006],'20'),'01')
   ,[amktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2006]), [amktutkjarj_2006])
   ,[amktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2006]), [amktutkkoulk_2006])
   ,[ylamksuorv_2006]
   ,[ylamksuorlk_2006]
   ,[ylamktutkkmaak_2006] = coalesce(nullif([ylamktutkkmaak_2006],'20'),'01')
   ,[ylamktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2006]), [ylamktutkjarj_2006])
   ,[ylamktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2006]), [ylamktutkkoulk_2006])
   ,[alkksuorv_2006]
   ,[alkksuorlk_2006]
   ,[alkktutkkmaak_2006] = coalesce(nullif([alkktutkkmaak_2006],'20'),'01')
   ,[alkktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2006]), [alkktutkjarj_2006])
   ,[alkktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2006]), [alkktutkkoulk_2006])
   ,[ylkksuorv_2006]
   ,[ylkksuorlk_2006]
   ,[ylkktutkkmaak_2006] = coalesce(nullif([ylkktutkkmaak_2006],'20'),'01')
   ,[ylkktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2006]), [ylkktutkjarj_2006])
   ,[ylkktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2006]), [ylkktutkkoulk_2006])
   ,[tksuorv_2006]
   ,[tksuorlk_2006]
   ,[tktutkkmaak_2006] = coalesce(nullif([tktutkkmaak_2006],'20'),'01')
   ,[tktutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2006]), [tktutkjarj_2006])
   ,[tktutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2006]), [tktutkkoulk_2006])
   ,[muutasuorv_2006]
   ,[muutasuorlk_2006]
   ,[muutatutkkmaak_2006] = coalesce(nullif([muutatutkkmaak_2006],'20'),'01')
   ,[muutatutkjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2006]), [muutatutkjarj_2006])
   ,[muutatutkkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2006]), [muutatutkkoulk_2006])
   ,[amksuorv_2007]
   ,[amksuorlk_2007]
   ,[amktutkkmaak_2007] = coalesce(nullif([amktutkkmaak_2007],'20'),'01')
   ,[amktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2007]), [amktutkjarj_2007])
   ,[amktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2007]), [amktutkkoulk_2007])
   ,[ylamksuorv_2007]
   ,[ylamksuorlk_2007]
   ,[ylamktutkkmaak_2007] = coalesce(nullif([ylamktutkkmaak_2007],'20'),'01')
   ,[ylamktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2007]), [ylamktutkjarj_2007])
   ,[ylamktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2007]), [ylamktutkkoulk_2007])
   ,[alkksuorv_2007]
   ,[alkksuorlk_2007]
   ,[alkktutkkmaak_2007] = coalesce(nullif([alkktutkkmaak_2007],'20'),'01')
   ,[alkktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2007]), [alkktutkjarj_2007])
   ,[alkktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2007]), [alkktutkkoulk_2007])
   ,[ylkksuorv_2007]
   ,[ylkksuorlk_2007]
   ,[ylkktutkkmaak_2007] = coalesce(nullif([ylkktutkkmaak_2007],'20'),'01')
   ,[ylkktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2007]), [ylkktutkjarj_2007])
   ,[ylkktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2007]), [ylkktutkkoulk_2007])
   ,[tksuorv_2007]
   ,[tksuorlk_2007]
   ,[tktutkkmaak_2007] = coalesce(nullif([tktutkkmaak_2007],'20'),'01')
   ,[tktutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2007]), [tktutkjarj_2007])
   ,[tktutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2007]), [tktutkkoulk_2007])
   ,[muutasuorv_2007]
   ,[muutasuorlk_2007]
   ,[muutatutkkmaak_2007] = coalesce(nullif([muutatutkkmaak_2007],'20'),'01')
   ,[muutatutkjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2007]), [muutatutkjarj_2007])
   ,[muutatutkkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2007]), [muutatutkkoulk_2007])
   ,[amksuorv_2008]
   ,[amksuorlk_2008]
   ,[amktutkkmaak_2008] = coalesce(nullif([amktutkkmaak_2008],'20'),'01')
   ,[amktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2008]), [amktutkjarj_2008])
   ,[amktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2008]), [amktutkkoulk_2008])
   ,[ylamksuorv_2008]
   ,[ylamksuorlk_2008]
   ,[ylamktutkkmaak_2008] = coalesce(nullif([ylamktutkkmaak_2008],'20'),'01')
   ,[ylamktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2008]), [ylamktutkjarj_2008])
   ,[ylamktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2008]), [ylamktutkkoulk_2008])
   ,[alkksuorv_2008]
   ,[alkksuorlk_2008]
   ,[alkktutkkmaak_2008] = coalesce(nullif([alkktutkkmaak_2008],'20'),'01')
   ,[alkktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2008]), [alkktutkjarj_2008])
   ,[alkktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2008]), [alkktutkkoulk_2008])
   ,[ylkksuorv_2008]
   ,[ylkksuorlk_2008]
   ,[ylkktutkkmaak_2008] = coalesce(nullif([ylkktutkkmaak_2008],'20'),'01')
   ,[ylkktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2008]), [ylkktutkjarj_2008])
   ,[ylkktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2008]), [ylkktutkkoulk_2008])
   ,[tksuorv_2008]
   ,[tksuorlk_2008]
   ,[tktutkkmaak_2008] = coalesce(nullif([tktutkkmaak_2008],'20'),'01')
   ,[tktutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2008]), [tktutkjarj_2008])
   ,[tktutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2008]), [tktutkkoulk_2008])
   ,[muutasuorv_2008]
   ,[muutasuorlk_2008]
   ,[muutatutkkmaak_2008] = coalesce(nullif([muutatutkkmaak_2008],'20'),'01')
   ,[muutatutkjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2008]), [muutatutkjarj_2008])
   ,[muutatutkkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2008]), [muutatutkkoulk_2008])
   ,[amksuorv_2009]
   ,[amksuorlk_2009]
   ,[amktutkkmaak_2009] = coalesce(nullif([amktutkkmaak_2009],'20'),'01')
   ,[amktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2009]), [amktutkjarj_2009])
   ,[amktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2009]), [amktutkkoulk_2009])
   ,[ylamksuorv_2009]
   ,[ylamksuorlk_2009]
   ,[ylamktutkkmaak_2009] = coalesce(nullif([ylamktutkkmaak_2009],'20'),'01')
   ,[ylamktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2009]), [ylamktutkjarj_2009])
   ,[ylamktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2009]), [ylamktutkkoulk_2009])
   ,[alkksuorv_2009]
   ,[alkksuorlk_2009]
   ,[alkktutkkmaak_2009] = coalesce(nullif([alkktutkkmaak_2009],'20'),'01')
   ,[alkktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2009]), [alkktutkjarj_2009])
   ,[alkktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2009]), [alkktutkkoulk_2009])
   ,[ylkksuorv_2009]
   ,[ylkksuorlk_2009]
   ,[ylkktutkkmaak_2009] = coalesce(nullif([ylkktutkkmaak_2009],'20'),'01')
   ,[ylkktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2009]), [ylkktutkjarj_2009])
   ,[ylkktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2009]), [ylkktutkkoulk_2009])
   ,[tksuorv_2009]
   ,[tksuorlk_2009]
   ,[tktutkkmaak_2009] = coalesce(nullif([tktutkkmaak_2009],'20'),'01')
   ,[tktutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2009]), [tktutkjarj_2009])
   ,[tktutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2009]), [tktutkkoulk_2009])
   ,[muutasuorv_2009]
   ,[muutasuorlk_2009]
   ,[muutatutkkmaak_2009] = coalesce(nullif([muutatutkkmaak_2009],'20'),'01')
   ,[muutatutkjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2009]), [muutatutkjarj_2009])
   ,[muutatutkkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2009]), [muutatutkkoulk_2009])
   ,[amkopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2000]), [amkopiskkoulk_2000])
   ,[amkopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2000]), [amkopiskjarj_2000])
   ,[amkkmaak_2000] = coalesce(nullif([amkkmaak_2000],'20'),'01')
   ,[amkolotamm_2000]
   ,[amkolosyys_2000]
   ,[ylamkopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2000]), [ylamkopiskkoulk_2000])
   ,[ylamkopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2000]), [ylamkopiskjarj_2000])
   ,[ylamkkmaak_2000] = coalesce(nullif([ylamkkmaak_2000],'20'),'01')
   ,[ylamkolotamm_2000]
   ,[ylamkolosyys_2000]
   ,[alkkopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2000]), [alkkopiskkoulk_2000])
   ,[alkkopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2000]), [alkkopiskjarj_2000])
   ,[alkkkmaak_2000] = coalesce(nullif([alkkkmaak_2000],'20'),'01')
   ,[alkkolotamm_2000]
   ,[alkkolosyys_2000]
   ,[ylkkopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2000]), [ylkkopiskkoulk_2000])
   ,[ylkkopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2000]), [ylkkopiskjarj_2000])
   ,[ylkkkmaak_2000] = coalesce(nullif([ylkkkmaak_2000],'20'),'01')
   ,[ylkkolotamm_2000]
   ,[ylkkolosyys_2000]
   ,[tkopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2000]), [tkopiskkoulk_2000])
   ,[tkopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2000]), [tkopiskjarj_2000])
   ,[tkkmaak_2000] = coalesce(nullif([tkkmaak_2000],'20'),'01')
   ,[tkolotamm_2000]
   ,[tkolosyys_2000]
   ,[muutaopiskkoulk_2000] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2000]), [muutaopiskkoulk_2000])
   ,[muutaopiskjarj_2000] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2000]), [muutaopiskjarj_2000])
   ,[muutakmaak_2000] = coalesce(nullif([muutakmaak_2000],'20'),'01')
   ,[muutaolotamm_2000]
   ,[muutaolosyys_2000]
   ,[amkopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2001]), [amkopiskkoulk_2001])
   ,[amkopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2001]), [amkopiskjarj_2001])
   ,[amkkmaak_2001] = coalesce(nullif([amkkmaak_2001],'20'),'01')
   ,[amkolotamm_2001]
   ,[amkolosyys_2001]
   ,[ylamkopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2001]), [ylamkopiskkoulk_2001])
   ,[ylamkopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2001]), [ylamkopiskjarj_2001])
   ,[ylamkkmaak_2001] = coalesce(nullif([ylamkkmaak_2001],'20'),'01')
   ,[ylamkolotamm_2001]
   ,[ylamkolosyys_2001]
   ,[alkkopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2001]), [alkkopiskkoulk_2001])
   ,[alkkopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2001]), [alkkopiskjarj_2001])
   ,[alkkkmaak_2001] = coalesce(nullif([alkkkmaak_2001],'20'),'01')
   ,[alkkolotamm_2001]
   ,[alkkolosyys_2001]
   ,[ylkkopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2001]), [ylkkopiskkoulk_2001])
   ,[ylkkopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2001]), [ylkkopiskjarj_2001])
   ,[ylkkkmaak_2001] = coalesce(nullif([ylkkkmaak_2001],'20'),'01')
   ,[ylkkolotamm_2001]
   ,[ylkkolosyys_2001]
   ,[tkopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2001]), [tkopiskkoulk_2001])
   ,[tkopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2001]), [tkopiskjarj_2001])
   ,[tkkmaak_2001] = coalesce(nullif([tkkmaak_2001],'20'),'01')
   ,[tkolotamm_2001]
   ,[tkolosyys_2001]
   ,[muutaopiskkoulk_2001] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2001]), [muutaopiskkoulk_2001])
   ,[muutaopiskjarj_2001] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2001]), [muutaopiskjarj_2001])
   ,[muutakmaak_2001] = coalesce(nullif([muutakmaak_2001],'20'),'01')
   ,[muutaolotamm_2001]
   ,[muutaolosyys_2001]
   ,[amkopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2002]), [amkopiskkoulk_2002])
   ,[amkopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2002]), [amkopiskjarj_2002])
   ,[amkkmaak_2002] = coalesce(nullif([amkkmaak_2002],'20'),'01')
   ,[amkolotamm_2002]
   ,[amkolosyys_2002]
   ,[ylamkopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2002]), [ylamkopiskkoulk_2002])
   ,[ylamkopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2002]), [ylamkopiskjarj_2002])
   ,[ylamkkmaak_2002] = coalesce(nullif([ylamkkmaak_2002],'20'),'01')
   ,[ylamkolotamm_2002]
   ,[ylamkolosyys_2002]
   ,[alkkopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2002]), [alkkopiskkoulk_2002])
   ,[alkkopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2002]), [alkkopiskjarj_2002])
   ,[alkkkmaak_2002] = coalesce(nullif([alkkkmaak_2002],'20'),'01')
   ,[alkkolotamm_2002]
   ,[alkkolosyys_2002]
   ,[ylkkopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2002]), [ylkkopiskkoulk_2002])
   ,[ylkkopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2002]), [ylkkopiskjarj_2002])
   ,[ylkkkmaak_2002] = coalesce(nullif([ylkkkmaak_2002],'20'),'01')
   ,[ylkkolotamm_2002]
   ,[ylkkolosyys_2002]
   ,[tkopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2002]), [tkopiskkoulk_2002])
   ,[tkopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2002]), [tkopiskjarj_2002])
   ,[tkkmaak_2002] = coalesce(nullif([tkkmaak_2002],'20'),'01')
   ,[tkolotamm_2002]
   ,[tkolosyys_2002]
   ,[muutaopiskkoulk_2002] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2002]), [muutaopiskkoulk_2002])
   ,[muutaopiskjarj_2002] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2002]), [muutaopiskjarj_2002])
   ,[muutakmaak_2002] = coalesce(nullif([muutakmaak_2002],'20'),'01')
   ,[muutaolotamm_2002]
   ,[muutaolosyys_2002]
   ,[amkopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2003]), [amkopiskkoulk_2003])
   ,[amkopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2003]), [amkopiskjarj_2003])
   ,[amkkmaak_2003] = coalesce(nullif([amkkmaak_2003],'20'),'01')
   ,[amkolotamm_2003]
   ,[amkolosyys_2003]
   ,[ylamkopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2003]), [ylamkopiskkoulk_2003])
   ,[ylamkopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2003]), [ylamkopiskjarj_2003])
   ,[ylamkkmaak_2003] = coalesce(nullif([ylamkkmaak_2003],'20'),'01')
   ,[ylamkolotamm_2003]
   ,[ylamkolosyys_2003]
   ,[alkkopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2003]), [alkkopiskkoulk_2003])
   ,[alkkopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2003]), [alkkopiskjarj_2003])
   ,[alkkkmaak_2003] = coalesce(nullif([alkkkmaak_2003],'20'),'01')
   ,[alkkolotamm_2003]
   ,[alkkolosyys_2003]
   ,[ylkkopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2003]), [ylkkopiskkoulk_2003])
   ,[ylkkopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2003]), [ylkkopiskjarj_2003])
   ,[ylkkkmaak_2003] = coalesce(nullif([ylkkkmaak_2003],'20'),'01')
   ,[ylkkolotamm_2003]
   ,[ylkkolosyys_2003]
   ,[tkopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2003]), [tkopiskkoulk_2003])
   ,[tkopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2003]), [tkopiskjarj_2003])
   ,[tkkmaak_2003] = coalesce(nullif([tkkmaak_2003],'20'),'01')
   ,[tkolotamm_2003]
   ,[tkolosyys_2003]
   ,[muutaopiskkoulk_2003] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2003]), [muutaopiskkoulk_2003])
   ,[muutaopiskjarj_2003] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2003]), [muutaopiskjarj_2003])
   ,[muutakmaak_2003] = coalesce(nullif([muutakmaak_2003],'20'),'01')
   ,[muutaolotamm_2003]
   ,[muutaolosyys_2003]
   ,[amkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2004]), [amkopiskkoulk_2004])
   ,[amkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2004]), [amkopiskjarj_2004])
   ,[amkkmaak_2004] = coalesce(nullif([amkkmaak_2004],'20'),'01')
   ,[amkolotamm_2004]
   ,[amkolosyys_2004]
   ,[ylamkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2004]), [ylamkopiskkoulk_2004])
   ,[ylamkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2004]), [ylamkopiskjarj_2004])
   ,[ylamkkmaak_2004] = coalesce(nullif([ylamkkmaak_2004],'20'),'01')
   ,[ylamkolotamm_2004]
   ,[ylamkolosyys_2004]
   ,[alkkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2004]), [alkkopiskkoulk_2004])
   ,[alkkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2004]), [alkkopiskjarj_2004])
   ,[alkkkmaak_2004] = coalesce(nullif([alkkkmaak_2004],'20'),'01')
   ,[alkkolotamm_2004]
   ,[alkkolosyys_2004]
   ,[ylkkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2004]), [ylkkopiskkoulk_2004])
   ,[ylkkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2004]), [ylkkopiskjarj_2004])
   ,[ylkkkmaak_2004] = coalesce(nullif([ylkkkmaak_2004],'20'),'01')
   ,[ylkkolotamm_2004]
   ,[ylkkolosyys_2004]
   ,[tkopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2004]), [tkopiskkoulk_2004])
   ,[tkopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2004]), [tkopiskjarj_2004])
   ,[tkkmaak_2004] = coalesce(nullif([tkkmaak_2004],'20'),'01')
   ,[tkolotamm_2004]
   ,[tkolosyys_2004]
   ,[muutaopiskkoulk_2004] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2004]), [muutaopiskkoulk_2004])
   ,[muutaopiskjarj_2004] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2004]), [muutaopiskjarj_2004])
   ,[muutakmaak_2004] = coalesce(nullif([muutakmaak_2004],'20'),'01')
   ,[muutaolotamm_2004]
   ,[muutaolosyys_2004]
   ,[amkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2005]), [amkopiskkoulk_2005])
   ,[amkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2005]), [amkopiskjarj_2005])
   ,[amkkmaak_2005] = coalesce(nullif([amkkmaak_2005],'20'),'01')
   ,[amkolotamm_2005]
   ,[amkolosyys_2005]
   ,[ylamkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2005]), [ylamkopiskkoulk_2005])
   ,[ylamkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2005]), [ylamkopiskjarj_2005])
   ,[ylamkkmaak_2005] = coalesce(nullif([ylamkkmaak_2005],'20'),'01')
   ,[ylamkolotamm_2005]
   ,[ylamkolosyys_2005]
   ,[alkkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2005]), [alkkopiskkoulk_2005])
   ,[alkkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2005]), [alkkopiskjarj_2005])
   ,[alkkkmaak_2005] = coalesce(nullif([alkkkmaak_2005],'20'),'01')
   ,[alkkolotamm_2005]
   ,[alkkolosyys_2005]
   ,[ylkkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2005]), [ylkkopiskkoulk_2005])
   ,[ylkkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2005]), [ylkkopiskjarj_2005])
   ,[ylkkkmaak_2005] = coalesce(nullif([ylkkkmaak_2005],'20'),'01')
   ,[ylkkolotamm_2005]
   ,[ylkkolosyys_2005]
   ,[tkopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2005]), [tkopiskkoulk_2005])
   ,[tkopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2005]), [tkopiskjarj_2005])
   ,[tkkmaak_2005] = coalesce(nullif([tkkmaak_2005],'20'),'01')
   ,[tkolotamm_2005]
   ,[tkolosyys_2005]
   ,[muutaopiskkoulk_2005] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2005]), [muutaopiskkoulk_2005])
   ,[muutaopiskjarj_2005] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2005]), [muutaopiskjarj_2005])
   ,[muutakmaak_2005] = coalesce(nullif([muutakmaak_2005],'20'),'01')
   ,[muutaolotamm_2005]
   ,[muutaolosyys_2005]
   ,[amkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2006]), [amkopiskkoulk_2006])
   ,[amkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2006]), [amkopiskjarj_2006])
   ,[amkkmaak_2006] = coalesce(nullif([amkkmaak_2006],'20'),'01')
   ,[amkolotamm_2006]
   ,[amkolosyys_2006]
   ,[ylamkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2006]), [ylamkopiskkoulk_2006])
   ,[ylamkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2006]), [ylamkopiskjarj_2006])
   ,[ylamkkmaak_2006] = coalesce(nullif([ylamkkmaak_2006],'20'),'01')
   ,[ylamkolotamm_2006]
   ,[ylamkolosyys_2006]
   ,[alkkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2006]), [alkkopiskkoulk_2006])
   ,[alkkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2006]), [alkkopiskjarj_2006])
   ,[alkkkmaak_2006] = coalesce(nullif([alkkkmaak_2006],'20'),'01')
   ,[alkkolotamm_2006]
   ,[alkkolosyys_2006]
   ,[ylkkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2006]), [ylkkopiskkoulk_2006])
   ,[ylkkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2006]), [ylkkopiskjarj_2006])
   ,[ylkkkmaak_2006] = coalesce(nullif([ylkkkmaak_2006],'20'),'01')
   ,[ylkkolotamm_2006]
   ,[ylkkolosyys_2006]
   ,[tkopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2006]), [tkopiskkoulk_2006])
   ,[tkopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2006]), [tkopiskjarj_2006])
   ,[tkkmaak_2006] = coalesce(nullif([tkkmaak_2006],'20'),'01')
   ,[tkolotamm_2006]
   ,[tkolosyys_2006]
   ,[muutaopiskkoulk_2006] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2006]), [muutaopiskkoulk_2006])
   ,[muutaopiskjarj_2006] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2006]), [muutaopiskjarj_2006])
   ,[muutakmaak_2006] = coalesce(nullif([muutakmaak_2006],'20'),'01')
   ,[muutaolotamm_2006]
   ,[muutaolosyys_2006]
   ,[amkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2007]), [amkopiskkoulk_2007])
   ,[amkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2007]), [amkopiskjarj_2007])
   ,[amkkmaak_2007] = coalesce(nullif([amkkmaak_2007],'20'),'01')
   ,[amkolotamm_2007]
   ,[amkolosyys_2007]
   ,[ylamkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2007]), [ylamkopiskkoulk_2007])
   ,[ylamkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2007]), [ylamkopiskjarj_2007])
   ,[ylamkkmaak_2007] = coalesce(nullif([ylamkkmaak_2007],'20'),'01')
   ,[ylamkolotamm_2007]
   ,[ylamkolosyys_2007]
   ,[alkkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2007]), [alkkopiskkoulk_2007])
   ,[alkkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2007]), [alkkopiskjarj_2007])
   ,[alkkkmaak_2007] = coalesce(nullif([alkkkmaak_2007],'20'),'01')
   ,[alkkolotamm_2007]
   ,[alkkolosyys_2007]
   ,[ylkkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2007]), [ylkkopiskkoulk_2007])
   ,[ylkkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2007]), [ylkkopiskjarj_2007])
   ,[ylkkkmaak_2007] = coalesce(nullif([ylkkkmaak_2007],'20'),'01')
   ,[ylkkolotamm_2007]
   ,[ylkkolosyys_2007]
   ,[tkopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2007]), [tkopiskkoulk_2007])
   ,[tkopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2007]), [tkopiskjarj_2007])
   ,[tkkmaak_2007] = coalesce(nullif([tkkmaak_2007],'20'),'01')
   ,[tkolotamm_2007]
   ,[tkolosyys_2007]
   ,[muutaopiskkoulk_2007] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2007]), [muutaopiskkoulk_2007])
   ,[muutaopiskjarj_2007] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2007]), [muutaopiskjarj_2007])
   ,[muutakmaak_2007] = coalesce(nullif([muutakmaak_2007],'20'),'01')
   ,[muutaolotamm_2007]
   ,[muutaolosyys_2007]
   ,[amkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2008]), [amkopiskkoulk_2008])
   ,[amkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2008]), [amkopiskjarj_2008])
   ,[amkkmaak_2008] = coalesce(nullif([amkkmaak_2008],'20'),'01')
   ,[amkolotamm_2008]
   ,[amkolosyys_2008]
   ,[ylamkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2008]), [ylamkopiskkoulk_2008])
   ,[ylamkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2008]), [ylamkopiskjarj_2008])
   ,[ylamkkmaak_2008] = coalesce(nullif([ylamkkmaak_2008],'20'),'01')
   ,[ylamkolotamm_2008]
   ,[ylamkolosyys_2008]
   ,[alkkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2008]), [alkkopiskkoulk_2008])
   ,[alkkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2008]), [alkkopiskjarj_2008])
   ,[alkkkmaak_2008] = coalesce(nullif([alkkkmaak_2008],'20'),'01')
   ,[alkkolotamm_2008]
   ,[alkkolosyys_2008]
   ,[ylkkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2008]), [ylkkopiskkoulk_2008])
   ,[ylkkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2008]), [ylkkopiskjarj_2008])
   ,[ylkkkmaak_2008] = coalesce(nullif([ylkkkmaak_2008],'20'),'01')
   ,[ylkkolotamm_2008]
   ,[ylkkolosyys_2008]
   ,[tkopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2008]), [tkopiskkoulk_2008])
   ,[tkopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2008]), [tkopiskjarj_2008])
   ,[tkkmaak_2008] = coalesce(nullif([tkkmaak_2008],'20'),'01')
   ,[tkolotamm_2008]
   ,[tkolosyys_2008]
   ,[muutaopiskkoulk_2008] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2008]), [muutaopiskkoulk_2008])
   ,[muutaopiskjarj_2008] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2008]), [muutaopiskjarj_2008])
   ,[muutakmaak_2008] = coalesce(nullif([muutakmaak_2008],'20'),'01')
   ,[muutaolotamm_2008]
   ,[muutaolosyys_2008]
   ,[amkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2009]), [amkopiskkoulk_2009])
   ,[amkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2009]), [amkopiskjarj_2009])
   ,[amkkmaak_2009] = coalesce(nullif([amkkmaak_2009],'20'),'01')
   ,[amkolotamm_2009]
   ,[amkolosyys_2009]
   ,[ylamkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2009]), [ylamkopiskkoulk_2009])
   ,[ylamkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2009]), [ylamkopiskjarj_2009])
   ,[ylamkkmaak_2009] = coalesce(nullif([ylamkkmaak_2009],'20'),'01')
   ,[ylamkolotamm_2009]
   ,[ylamkolosyys_2009]
   ,[alkkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2009]), [alkkopiskkoulk_2009])
   ,[alkkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2009]), [alkkopiskjarj_2009])
   ,[alkkkmaak_2009] = coalesce(nullif([alkkkmaak_2009],'20'),'01')
   ,[alkkolotamm_2009]
   ,[alkkolosyys_2009]
   ,[ylkkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2009]), [ylkkopiskkoulk_2009])
   ,[ylkkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2009]), [ylkkopiskjarj_2009])
   ,[ylkkkmaak_2009] = coalesce(nullif([ylkkkmaak_2009],'20'),'01')
   ,[ylkkolotamm_2009]
   ,[ylkkolosyys_2009]
   ,[tkopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2009]), [tkopiskkoulk_2009])
   ,[tkopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2009]), [tkopiskjarj_2009])
   ,[tkkmaak_2009] = coalesce(nullif([tkkmaak_2009],'20'),'01')
   ,[tkolotamm_2009]
   ,[tkolosyys_2009]
   ,[muutaopiskkoulk_2009] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2009]), [muutaopiskkoulk_2009])
   ,[muutaopiskjarj_2009] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2009]), [muutaopiskjarj_2009])
   ,[muutakmaak_2009] = coalesce(nullif([muutakmaak_2009],'20'),'01')
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
   ,[amktutkkmaak_2010] = coalesce(nullif([amktutkkmaak_2010],'20'),'01')
   ,[amktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2010]), [amktutkjarj_2010])
   ,[amktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2010]), [amktutkkoulk_2010])
   ,[ylamksuorv_2010]
   ,[ylamksuorlk_2010]
   ,[ylamktutkkmaak_2010] = coalesce(nullif([ylamktutkkmaak_2010],'20'),'01')
   ,[ylamktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2010]), [ylamktutkjarj_2010])
   ,[ylamktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2010]), [ylamktutkkoulk_2010])
   ,[alkksuorv_2010]
   ,[alkksuorlk_2010]
   ,[alkktutkkmaak_2010] = coalesce(nullif([alkktutkkmaak_2010],'20'),'01')
   ,[alkktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2010]), [alkktutkjarj_2010])
   ,[alkktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2010]), [alkktutkkoulk_2010])
   ,[ylkksuorv_2010]
   ,[ylkksuorlk_2010]
   ,[ylkktutkkmaak_2010] = coalesce(nullif([ylkktutkkmaak_2010],'20'),'01')
   ,[ylkktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2010]), [ylkktutkjarj_2010])
   ,[ylkktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2010]), [ylkktutkkoulk_2010])
   ,[tksuorv_2010]
   ,[tksuorlk_2010]
   ,[tktutkkmaak_2010] = coalesce(nullif([tktutkkmaak_2010],'20'),'01')
   ,[tktutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2010]), [tktutkjarj_2010])
   ,[tktutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2010]), [tktutkkoulk_2010])
   ,[muutasuorv_2010]
   ,[muutasuorlk_2010]
   ,[muutatutkkmaak_2010] = coalesce(nullif([muutatutkkmaak_2010],'20'),'01')
   ,[muutatutkjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2010]), [muutatutkjarj_2010])
   ,[muutatutkkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2010]), [muutatutkkoulk_2010])
   ,[amkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2010]), [amkopiskkoulk_2010])
   ,[amkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2010]), [amkopiskjarj_2010])
   ,[amkkmaak_2010] = coalesce(nullif([amkkmaak_2010],'20'),'01')
   ,[amkolotamm_2010]
   ,[amkolosyys_2010]
   ,[ylamkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2010]), [ylamkopiskkoulk_2010])
   ,[ylamkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2010]), [ylamkopiskjarj_2010])
   ,[ylamkkmaak_2010] = coalesce(nullif([ylamkkmaak_2010],'20'),'01')
   ,[ylamkolotamm_2010]
   ,[ylamkolosyys_2010]
   ,[alkkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2010]), [alkkopiskkoulk_2010])
   ,[alkkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2010]), [alkkopiskjarj_2010])
   ,[alkkkmaak_2010] = coalesce(nullif([alkkkmaak_2010],'20'),'01')
   ,[alkkolotamm_2010]
   ,[alkkolosyys_2010]
   ,[ylkkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2010]), [ylkkopiskkoulk_2010])
   ,[ylkkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2010]), [ylkkopiskjarj_2010])
   ,[ylkkkmaak_2010] = coalesce(nullif([ylkkkmaak_2010],'20'),'01')
   ,[ylkkolotamm_2010]
   ,[ylkkolosyys_2010]
   ,[tkopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2010]), [tkopiskkoulk_2010])
   ,[tkopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2010]), [tkopiskjarj_2010])
   ,[tkkmaak_2010] = coalesce(nullif([tkkmaak_2010],'20'),'01')
   ,[tkolotamm_2010]
   ,[tkolosyys_2010]
   ,[muutaopiskkoulk_2010] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2010]), [muutaopiskkoulk_2010])
   ,[muutaopiskjarj_2010] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2010]), [muutaopiskjarj_2010])
   ,[muutakmaak_2010] = coalesce(nullif([muutakmaak_2010],'20'),'01')
   ,[muutaolotamm_2010]
   ,[muutaolosyys_2010]
   ,[ptoim1r5_2010]
   ,[amas_2010]

--UUSIVUOSI
--2011
   ,[amksuorv_2011]
   ,[amksuorlk_2011]
   ,[amktutkkmaak_2011] = coalesce(nullif([amktutkkmaak_2011],'20'),'01')
   ,[amktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2011]), [amktutkjarj_2011])
   ,[amktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2011]), [amktutkkoulk_2011])
   ,[ylamksuorv_2011]
   ,[ylamksuorlk_2011]
   ,[ylamktutkkmaak_2011] = coalesce(nullif([ylamktutkkmaak_2011],'20'),'01')
   ,[ylamktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2011]), [ylamktutkjarj_2011])
   ,[ylamktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2011]), [ylamktutkkoulk_2011])
   ,[alkksuorv_2011]
   ,[alkksuorlk_2011]
   ,[alkktutkkmaak_2011] = coalesce(nullif([alkktutkkmaak_2011],'20'),'01')
   ,[alkktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2011]), [alkktutkjarj_2011])
   ,[alkktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2011]), [alkktutkkoulk_2011])
   ,[ylkksuorv_2011]
   ,[ylkksuorlk_2011]
   ,[ylkktutkkmaak_2011] = coalesce(nullif([ylkktutkkmaak_2011],'20'),'01')
   ,[ylkktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2011]), [ylkktutkjarj_2011])
   ,[ylkktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2011]), [ylkktutkkoulk_2011])
   ,[tksuorv_2011]
   ,[tksuorlk_2011]
   ,[tktutkkmaak_2011] = coalesce(nullif([tktutkkmaak_2011],'20'),'01')
   ,[tktutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2011]), [tktutkjarj_2011])
   ,[tktutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2011]), [tktutkkoulk_2011])
   ,[muutasuorv_2011]
   ,[muutasuorlk_2011]
   ,[muutatutkkmaak_2011] = coalesce(nullif([muutatutkkmaak_2011],'20'),'01')
   ,[muutatutkjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2011]), [muutatutkjarj_2011])
   ,[muutatutkkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2011]), [muutatutkkoulk_2011])
   ,[amkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2011]), [amkopiskkoulk_2011])
   ,[amkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2011]), [amkopiskjarj_2011])
   ,[amkkmaak_2011] = coalesce(nullif([amkkmaak_2011],'20'),'01')
   ,[amkolotamm_2011]
   ,[amkolosyys_2011]
   ,[ylamkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2011]), [ylamkopiskkoulk_2011])
   ,[ylamkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2011]), [ylamkopiskjarj_2011])
   ,[ylamkkmaak_2011] = coalesce(nullif([ylamkkmaak_2011],'20'),'01')
   ,[ylamkolotamm_2011]
   ,[ylamkolosyys_2011]
   ,[alkkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2011]), [alkkopiskkoulk_2011])
   ,[alkkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2011]), [alkkopiskjarj_2011])
   ,[alkkkmaak_2011] = coalesce(nullif([alkkkmaak_2011],'20'),'01')
   ,[alkkolotamm_2011]
   ,[alkkolosyys_2011]
   ,[ylkkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2011]), [ylkkopiskkoulk_2011])
   ,[ylkkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2011]), [ylkkopiskjarj_2011])
   ,[ylkkkmaak_2011] = coalesce(nullif([ylkkkmaak_2011],'20'),'01')
   ,[ylkkolotamm_2011]
   ,[ylkkolosyys_2011]
   ,[tkopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2011]), [tkopiskkoulk_2011])
   ,[tkopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2011]), [tkopiskjarj_2011])
   ,[tkkmaak_2011] = coalesce(nullif([tkkmaak_2011],'20'),'01')
   ,[tkolotamm_2011]
   ,[tkolosyys_2011]
   ,[muutaopiskkoulk_2011] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2011]), [muutaopiskkoulk_2011])
   ,[muutaopiskjarj_2011] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2011]), [muutaopiskjarj_2011])
   ,[muutakmaak_2011] = coalesce(nullif([muutakmaak_2011],'20'),'01')
   ,[muutaolotamm_2011]
   ,[muutaolosyys_2011]
   ,[ptoim1r5_2011]
   ,[amas_2011]
   
--UUSIVUOSI
--2012
   ,[amksuorv_2012]
   ,[amksuorlk_2012]
   ,[amktutkkmaak_2012] = coalesce(nullif([amktutkkmaak_2012],'20'),'01')
   ,[amktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2012]), [amktutkjarj_2012])
   ,[amktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2012]), [amktutkkoulk_2012])
   ,[ylamksuorv_2012]
   ,[ylamksuorlk_2012]
   ,[ylamktutkkmaak_2012] = coalesce(nullif([ylamktutkkmaak_2012],'20'),'01')
   ,[ylamktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2012]), [ylamktutkjarj_2012])
   ,[ylamktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2012]), [ylamktutkkoulk_2012])
   ,[alkksuorv_2012]
   ,[alkksuorlk_2012]
   ,[alkktutkkmaak_2012] = coalesce(nullif([alkktutkkmaak_2012],'20'),'01')
   ,[alkktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2012]), [alkktutkjarj_2012])
   ,[alkktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2012]), [alkktutkkoulk_2012])
   ,[ylkksuorv_2012]
   ,[ylkksuorlk_2012]
   ,[ylkktutkkmaak_2012] = coalesce(nullif([ylkktutkkmaak_2012],'20'),'01')
   ,[ylkktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2012]), [ylkktutkjarj_2012])
   ,[ylkktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2012]), [ylkktutkkoulk_2012])
   ,[tksuorv_2012]
   ,[tksuorlk_2012]
   ,[tktutkkmaak_2012] = coalesce(nullif([tktutkkmaak_2012],'20'),'01')
   ,[tktutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2012]), [tktutkjarj_2012])
   ,[tktutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2012]), [tktutkkoulk_2012])
   ,[muutasuorv_2012]
   ,[muutasuorlk_2012]
   ,[muutatutkkmaak_2012] = coalesce(nullif([muutatutkkmaak_2012],'20'),'01')
   ,[muutatutkjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2012]), [muutatutkjarj_2012])
   ,[muutatutkkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2012]), [muutatutkkoulk_2012])
   ,[amkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2012]), [amkopiskkoulk_2012])
   ,[amkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2012]), [amkopiskjarj_2012])
   ,[amkkmaak_2012] = coalesce(nullif([amkkmaak_2012],'20'),'01')
   ,[amkolotamm_2012]
   ,[amkolosyys_2012]
   ,[ylamkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2012]), [ylamkopiskkoulk_2012])
   ,[ylamkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2012]), [ylamkopiskjarj_2012])
   ,[ylamkkmaak_2012] = coalesce(nullif([ylamkkmaak_2012],'20'),'01')
   ,[ylamkolotamm_2012]
   ,[ylamkolosyys_2012]
   ,[alkkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2012]), [alkkopiskkoulk_2012])
   ,[alkkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2012]), [alkkopiskjarj_2012])
   ,[alkkkmaak_2012] = coalesce(nullif([alkkkmaak_2012],'20'),'01')
   ,[alkkolotamm_2012]
   ,[alkkolosyys_2012]
   ,[ylkkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2012]), [ylkkopiskkoulk_2012])
   ,[ylkkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2012]), [ylkkopiskjarj_2012])
   ,[ylkkkmaak_2012] = coalesce(nullif([ylkkkmaak_2012],'20'),'01')
   ,[ylkkolotamm_2012]
   ,[ylkkolosyys_2012]
   ,[tkopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2012]), [tkopiskkoulk_2012])
   ,[tkopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2012]), [tkopiskjarj_2012])
   ,[tkkmaak_2012] = coalesce(nullif([tkkmaak_2012],'20'),'01')
   ,[tkolotamm_2012]
   ,[tkolosyys_2012]
   ,[muutaopiskkoulk_2012] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2012]), [muutaopiskkoulk_2012])
   ,[muutaopiskjarj_2012] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2012]), [muutaopiskjarj_2012])
   ,[muutakmaak_2012] = coalesce(nullif([muutakmaak_2012],'20'),'01')
   ,[muutaolotamm_2012]
   ,[muutaolosyys_2012]
   ,[ptoim1r5_2012]
   ,[amas_2012]
--2013
   ,[amksuorv_2013]
   ,[amksuorlk_2013]
   ,[amktutkkmaak_2013] = coalesce(nullif([amktutkkmaak_2013],'20'),'01')
   ,[amktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2013]), [amktutkjarj_2013])
   ,[amktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2013]), [amktutkkoulk_2013])
   ,[ylamksuorv_2013]
   ,[ylamksuorlk_2013]
   ,[ylamktutkkmaak_2013] = coalesce(nullif([ylamktutkkmaak_2013],'20'),'01')
   ,[ylamktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2013]), [ylamktutkjarj_2013])
   ,[ylamktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2013]), [ylamktutkkoulk_2013])
   ,[alkksuorv_2013]
   ,[alkksuorlk_2013]
   ,[alkktutkkmaak_2013] = coalesce(nullif([alkktutkkmaak_2013],'20'),'01')
   ,[alkktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2013]), [alkktutkjarj_2013])
   ,[alkktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2013]), [alkktutkkoulk_2013])
   ,[ylkksuorv_2013]
   ,[ylkksuorlk_2013]
   ,[ylkktutkkmaak_2013] = coalesce(nullif([ylkktutkkmaak_2013],'20'),'01')
   ,[ylkktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2013]), [ylkktutkjarj_2013])
   ,[ylkktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2013]), [ylkktutkkoulk_2013])
   ,[tksuorv_2013]
   ,[tksuorlk_2013]
   ,[tktutkkmaak_2013] = coalesce(nullif([tktutkkmaak_2013],'20'),'01')
   ,[tktutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2013]), [tktutkjarj_2013])
   ,[tktutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2013]), [tktutkkoulk_2013])
   ,[muutasuorv_2013]
   ,[muutasuorlk_2013]
   ,[muutatutkkmaak_2013] = coalesce(nullif([muutatutkkmaak_2013],'20'),'01')
   ,[muutatutkjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2013]), [muutatutkjarj_2013])
   ,[muutatutkkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2013]), [muutatutkkoulk_2013])
   ,[amkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2013]), [amkopiskkoulk_2013])
   ,[amkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2013]), [amkopiskjarj_2013])
   ,[amkkmaak_2013] = coalesce(nullif([amkkmaak_2013],'20'),'01')
   ,[amkolotamm_2013]
   ,[amkolosyys_2013]
   ,[ylamkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2013]), [ylamkopiskkoulk_2013])
   ,[ylamkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2013]), [ylamkopiskjarj_2013])
   ,[ylamkkmaak_2013] = coalesce(nullif([ylamkkmaak_2013],'20'),'01')
   ,[ylamkolotamm_2013]
   ,[ylamkolosyys_2013]
   ,[alkkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2013]), [alkkopiskkoulk_2013])
   ,[alkkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2013]), [alkkopiskjarj_2013])
   ,[alkkkmaak_2013] = coalesce(nullif([alkkkmaak_2013],'20'),'01')
   ,[alkkolotamm_2013]
   ,[alkkolosyys_2013]
   ,[ylkkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2013]), [ylkkopiskkoulk_2013])
   ,[ylkkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2013]), [ylkkopiskjarj_2013])
   ,[ylkkkmaak_2013] = coalesce(nullif([ylkkkmaak_2013],'20'),'01')
   ,[ylkkolotamm_2013]
   ,[ylkkolosyys_2013]
   ,[tkopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2013]), [tkopiskkoulk_2013])
   ,[tkopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2013]), [tkopiskjarj_2013])
   ,[tkkmaak_2013] = coalesce(nullif([tkkmaak_2013],'20'),'01')
   ,[tkolotamm_2013]
   ,[tkolosyys_2013]
   ,[muutaopiskkoulk_2013] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2013]), [muutaopiskkoulk_2013])
   ,[muutaopiskjarj_2013] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2013]), [muutaopiskjarj_2013])
   ,[muutakmaak_2013] = coalesce(nullif([muutakmaak_2013],'20'),'01')
   ,[muutaolotamm_2013]
   ,[muutaolosyys_2013]
   ,[ptoim1r5_2013]
   ,[amas_2013]

-- 2014

   ,[amksuorv_2014]
   ,[amksuorlk_2014]
   ,[amktutkkmaak_2014] = coalesce(nullif([amktutkkmaak_2014],'20'),'01')
   ,[amktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2014]), [amktutkjarj_2014])
   ,[amktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2014]), [amktutkkoulk_2014])
   ,[ylamksuorv_2014]
   ,[ylamksuorlk_2014]
   ,[ylamktutkkmaak_2014] = coalesce(nullif([ylamktutkkmaak_2014],'20'),'01')
   ,[ylamktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2014]), [ylamktutkjarj_2014])
   ,[ylamktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2014]), [ylamktutkkoulk_2014])
   ,[alkksuorv_2014]
   ,[alkksuorlk_2014]
   ,[alkktutkkmaak_2014] = coalesce(nullif([alkktutkkmaak_2014],'20'),'01')
   ,[alkktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2014]), [alkktutkjarj_2014])
   ,[alkktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2014]), [alkktutkkoulk_2014])
   ,[ylkksuorv_2014]
   ,[ylkksuorlk_2014]
   ,[ylkktutkkmaak_2014] = coalesce(nullif([ylkktutkkmaak_2014],'20'),'01')
   ,[ylkktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2014]), [ylkktutkjarj_2014])
   ,[ylkktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2014]), [ylkktutkkoulk_2014])
   ,[tksuorv_2014]
   ,[tksuorlk_2014]
   ,[tktutkkmaak_2014] = coalesce(nullif([tktutkkmaak_2014],'20'),'01')
   ,[tktutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2014]), [tktutkjarj_2014])
   ,[tktutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2014]), [tktutkkoulk_2014])
   ,[muutasuorv_2014]
   ,[muutasuorlk_2014]
   ,[muutatutkkmaak_2014] = coalesce(nullif([muutatutkkmaak_2014],'20'),'01')
   ,[muutatutkjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2014]), [muutatutkjarj_2014])
   ,[muutatutkkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2014]), [muutatutkkoulk_2014])
   ,[amkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2014]), [amkopiskkoulk_2014])
   ,[amkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2014]), [amkopiskjarj_2014])
   ,[amkkmaak_2014] = coalesce(nullif([amkkmaak_2014],'20'),'01')
   ,[amkolotamm_2014]
   ,[amkolosyys_2014]
   ,[ylamkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2014]), [ylamkopiskkoulk_2014])
   ,[ylamkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2014]), [ylamkopiskjarj_2014])
   ,[ylamkkmaak_2014] = coalesce(nullif([ylamkkmaak_2014],'20'),'01')
   ,[ylamkolotamm_2014]
   ,[ylamkolosyys_2014]
   ,[alkkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2014]), [alkkopiskkoulk_2014])
   ,[alkkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2014]), [alkkopiskjarj_2014])
   ,[alkkkmaak_2014] = coalesce(nullif([alkkkmaak_2014],'20'),'01')
   ,[alkkolotamm_2014]
   ,[alkkolosyys_2014]
   ,[ylkkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2014]), [ylkkopiskkoulk_2014])
   ,[ylkkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2014]), [ylkkopiskjarj_2014])
   ,[ylkkkmaak_2014] = coalesce(nullif([ylkkkmaak_2014],'20'),'01')
   ,[ylkkolotamm_2014]
   ,[ylkkolosyys_2014]
   ,[tkopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2014]), [tkopiskkoulk_2014])
   ,[tkopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2014]), [tkopiskjarj_2014])
   ,[tkkmaak_2014] = coalesce(nullif([tkkmaak_2014],'20'),'01')
   ,[tkolotamm_2014]
   ,[tkolosyys_2014]
   ,[muutaopiskkoulk_2014] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2014]), [muutaopiskkoulk_2014])
   ,[muutaopiskjarj_2014] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2014]), [muutaopiskjarj_2014])
   ,[muutakmaak_2014] = coalesce(nullif([muutakmaak_2014],'20'),'01')
   ,[muutaolotamm_2014]
   ,[muutaolosyys_2014]
   ,[ptoim1r5_2014]
   ,[amas_2014]

--2015

   ,[amksuorv_2015]
   ,[amksuorlk_2015]
   ,[amktutkkmaak_2015] = coalesce(nullif([amktutkkmaak_2015],'20'),'01')
   ,[amktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2015]), [amktutkjarj_2015])
   ,[amktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2015]), [amktutkkoulk_2015])
   ,[ylamksuorv_2015]
   ,[ylamksuorlk_2015]
   ,[ylamktutkkmaak_2015] = coalesce(nullif([ylamktutkkmaak_2015],'20'),'01')
   ,[ylamktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2015]), [ylamktutkjarj_2015])
   ,[ylamktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2015]), [ylamktutkkoulk_2015])
   ,[alkksuorv_2015]
   ,[alkksuorlk_2015]
   ,[alkktutkkmaak_2015] = coalesce(nullif([alkktutkkmaak_2015],'20'),'01')
   ,[alkktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2015]), [alkktutkjarj_2015])
   ,[alkktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2015]), [alkktutkkoulk_2015])
   ,[ylkksuorv_2015]
   ,[ylkksuorlk_2015]
   ,[ylkktutkkmaak_2015] = coalesce(nullif([ylkktutkkmaak_2015],'20'),'01')
   ,[ylkktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2015]), [ylkktutkjarj_2015])
   ,[ylkktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2015]), [ylkktutkkoulk_2015])
   ,[tksuorv_2015]
   ,[tksuorlk_2015]
   ,[tktutkkmaak_2015] = coalesce(nullif([tktutkkmaak_2015],'20'),'01')
   ,[tktutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2015]), [tktutkjarj_2015])
   ,[tktutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2015]), [tktutkkoulk_2015])
   ,[muutasuorv_2015]
   ,[muutasuorlk_2015]
   ,[muutatutkkmaak_2015] = coalesce(nullif([muutatutkkmaak_2015],'20'),'01')
   ,[muutatutkjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2015]), [muutatutkjarj_2015])
   ,[muutatutkkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2015]), [muutatutkkoulk_2015])
   ,[amkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2015]), [amkopiskkoulk_2015])
   ,[amkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2015]), [amkopiskjarj_2015])
   ,[amkkmaak_2015] = coalesce(nullif([amkkmaak_2015],'20'),'01')
   ,[amkolotamm_2015]
   ,[amkolosyys_2015]
   ,[ylamkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2015]), [ylamkopiskkoulk_2015])
   ,[ylamkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2015]), [ylamkopiskjarj_2015])
   ,[ylamkkmaak_2015] = coalesce(nullif([ylamkkmaak_2015],'20'),'01')
   ,[ylamkolotamm_2015]
   ,[ylamkolosyys_2015]
   ,[alkkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2015]), [alkkopiskkoulk_2015])
   ,[alkkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2015]), [alkkopiskjarj_2015])
   ,[alkkkmaak_2015] = coalesce(nullif([alkkkmaak_2015],'20'),'01')
   ,[alkkolotamm_2015]
   ,[alkkolosyys_2015]
   ,[ylkkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2015]), [ylkkopiskkoulk_2015])
   ,[ylkkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2015]), [ylkkopiskjarj_2015])
   ,[ylkkkmaak_2015] = coalesce(nullif([ylkkkmaak_2015],'20'),'01')
   ,[ylkkolotamm_2015]
   ,[ylkkolosyys_2015]
   ,[tkopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2015]), [tkopiskkoulk_2015])
   ,[tkopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2015]), [tkopiskjarj_2015])
   ,[tkkmaak_2015] = coalesce(nullif([tkkmaak_2015],'20'),'01')
   ,[tkolotamm_2015]
   ,[tkolosyys_2015]
   ,[muutaopiskkoulk_2015] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2015]), [muutaopiskkoulk_2015])
   ,[muutaopiskjarj_2015] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2015]), [muutaopiskjarj_2015])
   ,[muutakmaak_2015] = coalesce(nullif([muutakmaak_2015],'20'),'01')
   ,[muutaolotamm_2015]
   ,[muutaolosyys_2015]
   ,[ptoim1r5_2015]
   ,[amas_2015]
*/

--2016

   ,[amksuorv_2016]
   ,[amksuorlk_2016]
   ,[amktutkkmaak_2016] = coalesce(nullif([amktutkkmaak_2016],'20'),'01')
   ,[amktutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2016]), [amktutkjarj_2016])
   ,[amktutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2016]), [amktutkkoulk_2016])
   ,[ylamksuorv_2016]
   ,[ylamksuorlk_2016]
   ,[ylamktutkkmaak_2016] = coalesce(nullif([ylamktutkkmaak_2016],'20'),'01')
   ,[ylamktutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2016]), [ylamktutkjarj_2016])
   ,[ylamktutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2016]), [ylamktutkkoulk_2016])
   ,[alkksuorv_2016]
   ,[alkksuorlk_2016]
   ,[alkktutkkmaak_2016] = coalesce(nullif([alkktutkkmaak_2016],'20'),'01')
   ,[alkktutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2016]), [alkktutkjarj_2016])
   ,[alkktutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2016]), [alkktutkkoulk_2016])
   ,[ylkksuorv_2016]
   ,[ylkksuorlk_2016]
   ,[ylkktutkkmaak_2016] = coalesce(nullif([ylkktutkkmaak_2016],'20'),'01')
   ,[ylkktutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2016]), [ylkktutkjarj_2016])
   ,[ylkktutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2016]), [ylkktutkkoulk_2016])
   ,[tksuorv_2016]
   ,[tksuorlk_2016]
   ,[tktutkkmaak_2016] = coalesce(nullif([tktutkkmaak_2016],'20'),'01')
   ,[tktutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2016]), [tktutkjarj_2016])
   ,[tktutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2016]), [tktutkkoulk_2016])
   ,[muutasuorv_2016]
   ,[muutasuorlk_2016]
   ,[muutatutkkmaak_2016] = coalesce(nullif([muutatutkkmaak_2016],'20'),'01')
   ,[muutatutkjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2016]), [muutatutkjarj_2016])
   ,[muutatutkkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2016]), [muutatutkkoulk_2016])
   ,[amkopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2016]), [amkopiskkoulk_2016])
   ,[amkopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2016]), [amkopiskjarj_2016])
   ,[amkkmaak_2016] = coalesce(nullif([amkkmaak_2016],'20'),'01')
   ,[amkolotamm_2016]
   ,[amkolosyys_2016]
   ,[ylamkopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2016]), [ylamkopiskkoulk_2016])
   ,[ylamkopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2016]), [ylamkopiskjarj_2016])
   ,[ylamkkmaak_2016] = coalesce(nullif([ylamkkmaak_2016],'20'),'01')
   ,[ylamkolotamm_2016]
   ,[ylamkolosyys_2016]
   ,[alkkopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2016]), [alkkopiskkoulk_2016])
   ,[alkkopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2016]), [alkkopiskjarj_2016])
   ,[alkkkmaak_2016] = coalesce(nullif([alkkkmaak_2016],'20'),'01')
   ,[alkkolotamm_2016]
   ,[alkkolosyys_2016]
   ,[ylkkopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2016]), [ylkkopiskkoulk_2016])
   ,[ylkkopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2016]), [ylkkopiskjarj_2016])
   ,[ylkkkmaak_2016] = coalesce(nullif([ylkkkmaak_2016],'20'),'01')
   ,[ylkkolotamm_2016]
   ,[ylkkolosyys_2016]
   ,[tkopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2016]), [tkopiskkoulk_2016])
   ,[tkopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2016]), [tkopiskjarj_2016])
   ,[tkkmaak_2016] = coalesce(nullif([tkkmaak_2016],'20'),'01')
   ,[tkolotamm_2016]
   ,[tkolosyys_2016]
   ,[muutaopiskkoulk_2016] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2016]), [muutaopiskkoulk_2016])
   ,[muutaopiskjarj_2016] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2016]), [muutaopiskjarj_2016])
   ,[muutakmaak_2016] = coalesce(nullif([muutakmaak_2016],'20'),'01')
   ,[muutaolotamm_2016]
   ,[muutaolosyys_2016]
   ,[ptoim1r5_2016]
   ,[amas_2016]

--2017

   ,[amksuorv_2017]
   ,[amksuorlk_2017]
   ,[amktutkkmaak_2017] = coalesce(nullif([amktutkkmaak_2017],'20'),'01')
   ,[amktutkjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2017]), [amktutkjarj_2017])
   ,[amktutkkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2017]), [amktutkkoulk_2017])
   ,[ylamksuorv_2017]
   ,[ylamksuorlk_2017]
   ,[ylamktutkkmaak_2017] = coalesce(nullif([ylamktutkkmaak_2017],'20'),'01')
   ,[ylamktutkjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2017]), [ylamktutkjarj_2017])
   ,[ylamktutkkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2017]), [ylamktutkkoulk_2017])
   ,[alkksuorv_2017]
   ,[alkksuorlk_2017]
   ,[alkktutkkmaak_2017] = coalesce(nullif([alkktutkkmaak_2017],'20'),'01')
   ,[alkktutkjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2017]), [alkktutkjarj_2017])
   ,[alkktutkkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2017]), [alkktutkkoulk_2017])
   ,[ylkksuorv_2017]
   ,[ylkksuorlk_2017]
   ,[ylkktutkkmaak_2017] = coalesce(nullif([ylkktutkkmaak_2017],'20'),'01')
   ,[ylkktutkjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2017]), [ylkktutkjarj_2017])
   ,[ylkktutkkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2017]), [ylkktutkkoulk_2017])
   ,[tksuorv_2017]
   ,[tksuorlk_2017]
   ,[tktutkkmaak_2017] = coalesce(nullif([tktutkkmaak_2017],'20'),'01')
   ,[tktutkjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2017]), [tktutkjarj_2017])
   ,[tktutkkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2017]), [tktutkkoulk_2017])
   ,[muutasuorv_2017]
   ,[muutasuorlk_2017]
   ,[muutatutkkmaak_2017] = coalesce(nullif([muutatutkkmaak_2017],'20'),'01')
   ,[muutatutkjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2017]), [muutatutkjarj_2017])
   ,[muutatutkkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2017]), [muutatutkkoulk_2017])
   ,[amkopiskkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2017]), [amkopiskkoulk_2017])
   ,[amkopiskjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2017]), [amkopiskjarj_2017])
   ,[amkkmaak_2017] = coalesce(nullif([amkkmaak_2017],'20'),'01')
   ,[amkolotamm_2017]
   ,[amkolosyys_2017]
   ,[ylamkopiskkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2017]), [ylamkopiskkoulk_2017])
   ,[ylamkopiskjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2017]), [ylamkopiskjarj_2017])
   ,[ylamkkmaak_2017] = coalesce(nullif([ylamkkmaak_2017],'20'),'01')
   ,[ylamkolotamm_2017]
   ,[ylamkolosyys_2017]
   ,[alkkopiskkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2017]), [alkkopiskkoulk_2017])
   ,[alkkopiskjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2017]), [alkkopiskjarj_2017])
   ,[alkkkmaak_2017] = coalesce(nullif([alkkkmaak_2017],'20'),'01')
   ,[alkkolotamm_2017]
   ,[alkkolosyys_2017]
   ,[ylkkopiskkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2017]), [ylkkopiskkoulk_2017])
   ,[ylkkopiskjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2017]), [ylkkopiskjarj_2017])
   ,[ylkkkmaak_2017] = coalesce(nullif([ylkkkmaak_2017],'20'),'01')
   ,[ylkkolotamm_2017]
   ,[ylkkolosyys_2017]
   ,[tkopiskkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2017]), [tkopiskkoulk_2017])
   ,[tkopiskjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2017]), [tkopiskjarj_2017])
   ,[tkkmaak_2017] = coalesce(nullif([tkkmaak_2017],'20'),'01')
   ,[tkolotamm_2017]
   ,[tkolosyys_2017]
   ,[muutaopiskkoulk_2017] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2017]), [muutaopiskkoulk_2017])
   ,[muutaopiskjarj_2017] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2017]), [muutaopiskjarj_2017])
   ,[muutakmaak_2017] = coalesce(nullif([muutakmaak_2017],'20'),'01')
   ,[muutaolotamm_2017]
   ,[muutaolosyys_2017]
   ,[ptoim1r5_2017]
   ,[amas_2017]

--2018

   ,[amksuorv_2018]
   ,[amksuorlk_2018]
   ,[amktutkkmaak_2018] = coalesce(nullif([amktutkkmaak_2018],'20'),'01')
   ,[amktutkjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2018]), [amktutkjarj_2018])
   ,[amktutkkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2018]), [amktutkkoulk_2018])
   ,[ylamksuorv_2018]
   ,[ylamksuorlk_2018]
   ,[ylamktutkkmaak_2018] = coalesce(nullif([ylamktutkkmaak_2018],'20'),'01')
   ,[ylamktutkjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2018]), [ylamktutkjarj_2018])
   ,[ylamktutkkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2018]), [ylamktutkkoulk_2018])
   ,[alkksuorv_2018]
   ,[alkksuorlk_2018]
   ,[alkktutkkmaak_2018] = coalesce(nullif([alkktutkkmaak_2018],'20'),'01')
   ,[alkktutkjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2018]), [alkktutkjarj_2018])
   ,[alkktutkkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2018]), [alkktutkkoulk_2018])
   ,[ylkksuorv_2018]
   ,[ylkksuorlk_2018]
   ,[ylkktutkkmaak_2018] = coalesce(nullif([ylkktutkkmaak_2018],'20'),'01')
   ,[ylkktutkjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2018]), [ylkktutkjarj_2018])
   ,[ylkktutkkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2018]), [ylkktutkkoulk_2018])
   ,[tksuorv_2018]
   ,[tksuorlk_2018]
   ,[tktutkkmaak_2018] = coalesce(nullif([tktutkkmaak_2018],'20'),'01')
   ,[tktutkjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2018]), [tktutkjarj_2018])
   ,[tktutkkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2018]), [tktutkkoulk_2018])
   ,[muutasuorv_2018]
   ,[muutasuorlk_2018]
   ,[muutatutkkmaak_2018] = coalesce(nullif([muutatutkkmaak_2018],'20'),'01')
   ,[muutatutkjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2018]), [muutatutkjarj_2018])
   ,[muutatutkkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2018]), [muutatutkkoulk_2018])
   ,[amkopiskkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2018]), [amkopiskkoulk_2018])
   ,[amkopiskjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2018]), [amkopiskjarj_2018])
   ,[amkkmaak_2018] = coalesce(nullif([amkkmaak_2018],'20'),'01')
   ,[amkolotamm_2018]
   ,[amkolosyys_2018]
   ,[ylamkopiskkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2018]), [ylamkopiskkoulk_2018])
   ,[ylamkopiskjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2018]), [ylamkopiskjarj_2018])
   ,[ylamkkmaak_2018] = coalesce(nullif([ylamkkmaak_2018],'20'),'01')
   ,[ylamkolotamm_2018]
   ,[ylamkolosyys_2018]
   ,[alkkopiskkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2018]), [alkkopiskkoulk_2018])
   ,[alkkopiskjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2018]), [alkkopiskjarj_2018])
   ,[alkkkmaak_2018] = coalesce(nullif([alkkkmaak_2018],'20'),'01')
   ,[alkkolotamm_2018]
   ,[alkkolosyys_2018]
   ,[ylkkopiskkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2018]), [ylkkopiskkoulk_2018])
   ,[ylkkopiskjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2018]), [ylkkopiskjarj_2018])
   ,[ylkkkmaak_2018] = coalesce(nullif([ylkkkmaak_2018],'20'),'01')
   ,[ylkkolotamm_2018]
   ,[ylkkolosyys_2018]
   ,[tkopiskkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2018]), [tkopiskkoulk_2018])
   ,[tkopiskjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2018]), [tkopiskjarj_2018])
   ,[tkkmaak_2018] = coalesce(nullif([tkkmaak_2018],'20'),'01')
   ,[tkolotamm_2018]
   ,[tkolosyys_2018]
   ,[muutaopiskkoulk_2018] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2018]), [muutaopiskkoulk_2018])
   ,[muutaopiskjarj_2018] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2018]), [muutaopiskjarj_2018])
   ,[muutakmaak_2018] = coalesce(nullif([muutakmaak_2018],'20'),'01')
   ,[muutaolotamm_2018]
   ,[muutaolosyys_2018]
   ,[ptoim1r5_2018]
   ,[amas_2018]

--2019

   ,[amksuorv_2019]
   ,[amksuorlk_2019]
   ,[amktutkkmaak_2019] = coalesce(nullif([amktutkkmaak_2019],'20'),'01')
   ,[amktutkjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2019]), [amktutkjarj_2019])
   ,[amktutkkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2019]), [amktutkkoulk_2019])
   ,[ylamksuorv_2019]
   ,[ylamksuorlk_2019]
   ,[ylamktutkkmaak_2019] = coalesce(nullif([ylamktutkkmaak_2019],'20'),'01')
   ,[ylamktutkjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2019]), [ylamktutkjarj_2019])
   ,[ylamktutkkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2019]), [ylamktutkkoulk_2019])
   ,[alkksuorv_2019]
   ,[alkksuorlk_2019]
   ,[alkktutkkmaak_2019] = coalesce(nullif([alkktutkkmaak_2019],'20'),'01')
   ,[alkktutkjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2019]), [alkktutkjarj_2019])
   ,[alkktutkkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2019]), [alkktutkkoulk_2019])
   ,[ylkksuorv_2019]
   ,[ylkksuorlk_2019]
   ,[ylkktutkkmaak_2019] = coalesce(nullif([ylkktutkkmaak_2019],'20'),'01')
   ,[ylkktutkjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2019]), [ylkktutkjarj_2019])
   ,[ylkktutkkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2019]), [ylkktutkkoulk_2019])
   ,[tksuorv_2019]
   ,[tksuorlk_2019]
   ,[tktutkkmaak_2019] = coalesce(nullif([tktutkkmaak_2019],'20'),'01')
   ,[tktutkjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2019]), [tktutkjarj_2019])
   ,[tktutkkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2019]), [tktutkkoulk_2019])
   ,[muutasuorv_2019]
   ,[muutasuorlk_2019]
   ,[muutatutkkmaak_2019] = coalesce(nullif([muutatutkkmaak_2019],'20'),'01')
   ,[muutatutkjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2019]), [muutatutkjarj_2019])
   ,[muutatutkkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2019]), [muutatutkkoulk_2019])
   ,[amkopiskkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2019]), [amkopiskkoulk_2019])
   ,[amkopiskjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2019]), [amkopiskjarj_2019])
   ,[amkkmaak_2019] = coalesce(nullif([amkkmaak_2019],'20'),'01')
   ,[amkolotamm_2019]
   ,[amkolosyys_2019]
   ,[ylamkopiskkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2019]), [ylamkopiskkoulk_2019])
   ,[ylamkopiskjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2019]), [ylamkopiskjarj_2019])
   ,[ylamkkmaak_2019] = coalesce(nullif([ylamkkmaak_2019],'20'),'01')
   ,[ylamkolotamm_2019]
   ,[ylamkolosyys_2019]
   ,[alkkopiskkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2019]), [alkkopiskkoulk_2019])
   ,[alkkopiskjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2019]), [alkkopiskjarj_2019])
   ,[alkkkmaak_2019] = coalesce(nullif([alkkkmaak_2019],'20'),'01')
   ,[alkkolotamm_2019]
   ,[alkkolosyys_2019]
   ,[ylkkopiskkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2019]), [ylkkopiskkoulk_2019])
   ,[ylkkopiskjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2019]), [ylkkopiskjarj_2019])
   ,[ylkkkmaak_2019] = coalesce(nullif([ylkkkmaak_2019],'20'),'01')
   ,[ylkkolotamm_2019]
   ,[ylkkolosyys_2019]
   ,[tkopiskkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2019]), [tkopiskkoulk_2019])
   ,[tkopiskjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2019]), [tkopiskjarj_2019])
   ,[tkkmaak_2019] = coalesce(nullif([tkkmaak_2019],'20'),'01')
   ,[tkolotamm_2019]
   ,[tkolosyys_2019]
   ,[muutaopiskkoulk_2019] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2019]), [muutaopiskkoulk_2019])
   ,[muutaopiskjarj_2019] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2019]), [muutaopiskjarj_2019])
   ,[muutakmaak_2019] = coalesce(nullif([muutakmaak_2019],'20'),'01')
   ,[muutaolotamm_2019]
   ,[muutaolosyys_2019]
   ,[ptoim1r5_2019]
   ,[amas_2019]

--2020

   ,[amksuorv_2020]
   ,[amksuorlk_2020]
   ,[amktutkkmaak_2020] = coalesce(nullif([amktutkkmaak_2020],'20'),'01')
   ,[amktutkjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2020]), [amktutkjarj_2020])
   ,[amktutkkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2020]), [amktutkkoulk_2020])
   ,[ylamksuorv_2020]
   ,[ylamksuorlk_2020]
   ,[ylamktutkkmaak_2020] = coalesce(nullif([ylamktutkkmaak_2020],'20'),'01')
   ,[ylamktutkjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2020]), [ylamktutkjarj_2020])
   ,[ylamktutkkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2020]), [ylamktutkkoulk_2020])
   ,[alkksuorv_2020]
   ,[alkksuorlk_2020]
   ,[alkktutkkmaak_2020] = coalesce(nullif([alkktutkkmaak_2020],'20'),'01')
   ,[alkktutkjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2020]), [alkktutkjarj_2020])
   ,[alkktutkkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2020]), [alkktutkkoulk_2020])
   ,[ylkksuorv_2020]
   ,[ylkksuorlk_2020]
   ,[ylkktutkkmaak_2020] = coalesce(nullif([ylkktutkkmaak_2020],'20'),'01')
   ,[ylkktutkjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2020]), [ylkktutkjarj_2020])
   ,[ylkktutkkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2020]), [ylkktutkkoulk_2020])
   ,[tksuorv_2020]
   ,[tksuorlk_2020]
   ,[tktutkkmaak_2020] = coalesce(nullif([tktutkkmaak_2020],'20'),'01')
   ,[tktutkjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2020]), [tktutkjarj_2020])
   ,[tktutkkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2020]), [tktutkkoulk_2020])
   ,[muutasuorv_2020]
   ,[muutasuorlk_2020]
   ,[muutatutkkmaak_2020] = coalesce(nullif([muutatutkkmaak_2020],'20'),'01')
   ,[muutatutkjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2020]), [muutatutkjarj_2020])
   ,[muutatutkkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2020]), [muutatutkkoulk_2020])
   ,[amkopiskkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2020]), [amkopiskkoulk_2020])
   ,[amkopiskjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2020]), [amkopiskjarj_2020])
   ,[amkkmaak_2020] = coalesce(nullif([amkkmaak_2020],'20'),'01')
   ,[amkolotamm_2020]
   ,[amkolosyys_2020]
   ,[ylamkopiskkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2020]), [ylamkopiskkoulk_2020])
   ,[ylamkopiskjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2020]), [ylamkopiskjarj_2020])
   ,[ylamkkmaak_2020] = coalesce(nullif([ylamkkmaak_2020],'20'),'01')
   ,[ylamkolotamm_2020]
   ,[ylamkolosyys_2020]
   ,[alkkopiskkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2020]), [alkkopiskkoulk_2020])
   ,[alkkopiskjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2020]), [alkkopiskjarj_2020])
   ,[alkkkmaak_2020] = coalesce(nullif([alkkkmaak_2020],'20'),'01')
   ,[alkkolotamm_2020]
   ,[alkkolosyys_2020]
   ,[ylkkopiskkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2020]), [ylkkopiskkoulk_2020])
   ,[ylkkopiskjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2020]), [ylkkopiskjarj_2020])
   ,[ylkkkmaak_2020] = coalesce(nullif([ylkkkmaak_2020],'20'),'01')
   ,[ylkkolotamm_2020]
   ,[ylkkolosyys_2020]
   ,[tkopiskkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2020]), [tkopiskkoulk_2020])
   ,[tkopiskjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2020]), [tkopiskjarj_2020])
   ,[tkkmaak_2020] = coalesce(nullif([tkkmaak_2020],'20'),'01')
   ,[tkolotamm_2020]
   ,[tkolosyys_2020]
   ,[muutaopiskkoulk_2020] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2020]), [muutaopiskkoulk_2020])
   ,[muutaopiskjarj_2020] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2020]), [muutaopiskjarj_2020])
   ,[muutakmaak_2020] = coalesce(nullif([muutakmaak_2020],'20'),'01')
   ,[muutaolotamm_2020]
   ,[muutaolosyys_2020]
   ,[ptoim1r5_2020]
   ,[amas_2020]

--2021

   ,[amksuorv_2021]
   ,[amksuorlk_2021]
   ,[amktutkkmaak_2021] = coalesce(nullif([amktutkkmaak_2021],'20'),'01')
   ,[amktutkjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2021]), [amktutkjarj_2021])
   ,[amktutkkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2021]), [amktutkkoulk_2021])
   ,[ylamksuorv_2021]
   ,[ylamksuorlk_2021]
   ,[ylamktutkkmaak_2021] = coalesce(nullif([ylamktutkkmaak_2021],'20'),'01')
   ,[ylamktutkjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2021]), [ylamktutkjarj_2021])
   ,[ylamktutkkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2021]), [ylamktutkkoulk_2021])
   ,[alkksuorv_2021]
   ,[alkksuorlk_2021]
   ,[alkktutkkmaak_2021] = coalesce(nullif([alkktutkkmaak_2021],'20'),'01')
   ,[alkktutkjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2021]), [alkktutkjarj_2021])
   ,[alkktutkkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2021]), [alkktutkkoulk_2021])
   ,[ylkksuorv_2021]
   ,[ylkksuorlk_2021]
   ,[ylkktutkkmaak_2021] = coalesce(nullif([ylkktutkkmaak_2021],'20'),'01')
   ,[ylkktutkjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2021]), [ylkktutkjarj_2021])
   ,[ylkktutkkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2021]), [ylkktutkkoulk_2021])
   ,[tksuorv_2021]
   ,[tksuorlk_2021]
   ,[tktutkkmaak_2021] = coalesce(nullif([tktutkkmaak_2021],'20'),'01')
   ,[tktutkjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2021]), [tktutkjarj_2021])
   ,[tktutkkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2021]), [tktutkkoulk_2021])
   ,[muutasuorv_2021]
   ,[muutasuorlk_2021]
   ,[muutatutkkmaak_2021] = coalesce(nullif([muutatutkkmaak_2021],'20'),'01')
   ,[muutatutkjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2021]), [muutatutkjarj_2021])
   ,[muutatutkkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2021]), [muutatutkkoulk_2021])
   ,[amkopiskkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2021]), [amkopiskkoulk_2021])
   ,[amkopiskjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2021]), [amkopiskjarj_2021])
   ,[amkkmaak_2021] = coalesce(nullif([amkkmaak_2021],'20'),'01')
   ,[amkolotamm_2021]
   ,[amkolosyys_2021]
   ,[ylamkopiskkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2021]), [ylamkopiskkoulk_2021])
   ,[ylamkopiskjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2021]), [ylamkopiskjarj_2021])
   ,[ylamkkmaak_2021] = coalesce(nullif([ylamkkmaak_2021],'20'),'01')
   ,[ylamkolotamm_2021]
   ,[ylamkolosyys_2021]
   ,[alkkopiskkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2021]), [alkkopiskkoulk_2021])
   ,[alkkopiskjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2021]), [alkkopiskjarj_2021])
   ,[alkkkmaak_2021] = coalesce(nullif([alkkkmaak_2021],'20'),'01')
   ,[alkkolotamm_2021]
   ,[alkkolosyys_2021]
   ,[ylkkopiskkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2021]), [ylkkopiskkoulk_2021])
   ,[ylkkopiskjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2021]), [ylkkopiskjarj_2021])
   ,[ylkkkmaak_2021] = coalesce(nullif([ylkkkmaak_2021],'20'),'01')
   ,[ylkkolotamm_2021]
   ,[ylkkolosyys_2021]
   ,[tkopiskkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2021]), [tkopiskkoulk_2021])
   ,[tkopiskjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2021]), [tkopiskjarj_2021])
   ,[tkkmaak_2021] = coalesce(nullif([tkkmaak_2021],'20'),'01')
   ,[tkolotamm_2021]
   ,[tkolosyys_2021]
   ,[muutaopiskkoulk_2021] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2021]), [muutaopiskkoulk_2021])
   ,[muutaopiskjarj_2021] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2021]), [muutaopiskjarj_2021])
   ,[muutakmaak_2021] = coalesce(nullif([muutakmaak_2021],'20'),'01')
   ,[muutaolotamm_2021]
   ,[muutaolosyys_2021]
   ,[ptoim1r5_2021]
   ,[amas_2021]

--2022

   ,[amksuorv_2022]
   ,[amksuorlk_2022]
   ,[amktutkkmaak_2022] = coalesce(nullif([amktutkkmaak_2022],'20'),'01')
   ,[amktutkjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2022]), [amktutkjarj_2022])
   ,[amktutkkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2022]), [amktutkkoulk_2022])
   ,[ylamksuorv_2022]
   ,[ylamksuorlk_2022]
   ,[ylamktutkkmaak_2022] = coalesce(nullif([ylamktutkkmaak_2022],'20'),'01')
   ,[ylamktutkjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2022]), [ylamktutkjarj_2022])
   ,[ylamktutkkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2022]), [ylamktutkkoulk_2022])
   ,[alkksuorv_2022]
   ,[alkksuorlk_2022]
   ,[alkktutkkmaak_2022] = coalesce(nullif([alkktutkkmaak_2022],'20'),'01')
   ,[alkktutkjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2022]), [alkktutkjarj_2022])
   ,[alkktutkkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2022]), [alkktutkkoulk_2022])
   ,[ylkksuorv_2022]
   ,[ylkksuorlk_2022]
   ,[ylkktutkkmaak_2022] = coalesce(nullif([ylkktutkkmaak_2022],'20'),'01')
   ,[ylkktutkjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2022]), [ylkktutkjarj_2022])
   ,[ylkktutkkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2022]), [ylkktutkkoulk_2022])
   ,[tksuorv_2022]
   ,[tksuorlk_2022]
   ,[tktutkkmaak_2022] = coalesce(nullif([tktutkkmaak_2022],'20'),'01')
   ,[tktutkjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2022]), [tktutkjarj_2022])
   ,[tktutkkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2022]), [tktutkkoulk_2022])
   ,[muutasuorv_2022]
   ,[muutasuorlk_2022]
   ,[muutatutkkmaak_2022] = coalesce(nullif([muutatutkkmaak_2022],'20'),'01')
   ,[muutatutkjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2022]), [muutatutkjarj_2022])
   ,[muutatutkkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2022]), [muutatutkkoulk_2022])
   ,[amkopiskkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2022]), [amkopiskkoulk_2022])
   ,[amkopiskjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2022]), [amkopiskjarj_2022])
   ,[amkkmaak_2022] = coalesce(nullif([amkkmaak_2022],'20'),'01')
   ,[amkolotamm_2022]
   ,[amkolosyys_2022]
   ,[ylamkopiskkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2022]), [ylamkopiskkoulk_2022])
   ,[ylamkopiskjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2022]), [ylamkopiskjarj_2022])
   ,[ylamkkmaak_2022] = coalesce(nullif([ylamkkmaak_2022],'20'),'01')
   ,[ylamkolotamm_2022]
   ,[ylamkolosyys_2022]
   ,[alkkopiskkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2022]), [alkkopiskkoulk_2022])
   ,[alkkopiskjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2022]), [alkkopiskjarj_2022])
   ,[alkkkmaak_2022] = coalesce(nullif([alkkkmaak_2022],'20'),'01')
   ,[alkkolotamm_2022]
   ,[alkkolosyys_2022]
   ,[ylkkopiskkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2022]), [ylkkopiskkoulk_2022])
   ,[ylkkopiskjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2022]), [ylkkopiskjarj_2022])
   ,[ylkkkmaak_2022] = coalesce(nullif([ylkkkmaak_2022],'20'),'01')
   ,[ylkkolotamm_2022]
   ,[ylkkolosyys_2022]
   ,[tkopiskkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2022]), [tkopiskkoulk_2022])
   ,[tkopiskjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2022]), [tkopiskjarj_2022])
   ,[tkkmaak_2022] = coalesce(nullif([tkkmaak_2022],'20'),'01')
   ,[tkolotamm_2022]
   ,[tkolosyys_2022]
   ,[muutaopiskkoulk_2022] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2022]), [muutaopiskkoulk_2022])
   ,[muutaopiskjarj_2022] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2022]), [muutaopiskjarj_2022])
   ,[muutakmaak_2022] = coalesce(nullif([muutakmaak_2022],'20'),'01')
   ,[muutaolotamm_2022]
   ,[muutaolosyys_2022]
   ,[ptoim1r5_2022]
   ,[amas_2022]

-- 2023

   ,[amksuorv_2023]
   ,[amksuorlk_2023]
   ,[amktutkkmaak_2023] = coalesce(nullif([amktutkkmaak_2023],'20'),'01')
   ,[amktutkjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amktutkjarj_2023]), [amktutkjarj_2023])
   ,[amktutkkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amktutkkoulk_2023]), [amktutkkoulk_2023])
   ,[ylamksuorv_2023]
   ,[ylamksuorlk_2023]
   ,[ylamktutkkmaak_2023] = coalesce(nullif([ylamktutkkmaak_2023],'20'),'01')
   ,[ylamktutkjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamktutkjarj_2023]), [ylamktutkjarj_2023])
   ,[ylamktutkkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamktutkkoulk_2023]), [ylamktutkkoulk_2023])
   ,[alkksuorv_2023]
   ,[alkksuorlk_2023]
   ,[alkktutkkmaak_2023] = coalesce(nullif([alkktutkkmaak_2023],'20'),'01')
   ,[alkktutkjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkktutkjarj_2023]), [alkktutkjarj_2023])
   ,[alkktutkkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkktutkkoulk_2023]), [alkktutkkoulk_2023])
   ,[ylkksuorv_2023]
   ,[ylkksuorlk_2023]
   ,[ylkktutkkmaak_2023] = coalesce(nullif([ylkktutkkmaak_2023],'20'),'01')
   ,[ylkktutkjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkktutkjarj_2023]), [ylkktutkjarj_2023])
   ,[ylkktutkkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkktutkkoulk_2023]), [ylkktutkkoulk_2023])
   ,[tksuorv_2023]
   ,[tksuorlk_2023]
   ,[tktutkkmaak_2023] = coalesce(nullif([tktutkkmaak_2023],'20'),'01')
   ,[tktutkjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tktutkjarj_2023]), [tktutkjarj_2023])
   ,[tktutkkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tktutkkoulk_2023]), [tktutkkoulk_2023])
   ,[muutasuorv_2023]
   ,[muutasuorlk_2023]
   ,[muutatutkkmaak_2023] = coalesce(nullif([muutatutkkmaak_2023],'20'),'01')
   ,[muutatutkjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutatutkjarj_2023]), [muutatutkjarj_2023])
   ,[muutatutkkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutatutkkoulk_2023]), [muutatutkkoulk_2023])
   ,[amkopiskkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[amkopiskkoulk_2023]), [amkopiskkoulk_2023])
   ,[amkopiskjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[amkopiskjarj_2023]), [amkopiskjarj_2023])
   ,[amkkmaak_2023] = coalesce(nullif([amkkmaak_2023],'20'),'01')
   ,[amkolotamm_2023]
   ,[amkolosyys_2023]
   ,[ylamkopiskkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylamkopiskkoulk_2023]), [ylamkopiskkoulk_2023])
   ,[ylamkopiskjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylamkopiskjarj_2023]), [ylamkopiskjarj_2023])
   ,[ylamkkmaak_2023] = coalesce(nullif([ylamkkmaak_2023],'20'),'01')
   ,[ylamkolotamm_2023]
   ,[ylamkolosyys_2023]
   ,[alkkopiskkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[alkkopiskkoulk_2023]), [alkkopiskkoulk_2023])
   ,[alkkopiskjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[alkkopiskjarj_2023]), [alkkopiskjarj_2023])
   ,[alkkkmaak_2023] = coalesce(nullif([alkkkmaak_2023],'20'),'01')
   ,[alkkolotamm_2023]
   ,[alkkolosyys_2023]
   ,[ylkkopiskkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[ylkkopiskkoulk_2023]), [ylkkopiskkoulk_2023])
   ,[ylkkopiskjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[ylkkopiskjarj_2023]), [ylkkopiskjarj_2023])
   ,[ylkkkmaak_2023] = coalesce(nullif([ylkkkmaak_2023],'20'),'01')
   ,[ylkkolotamm_2023]
   ,[ylkkolosyys_2023]
   ,[tkopiskkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[tkopiskkoulk_2023]), [tkopiskkoulk_2023])
   ,[tkopiskjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[tkopiskjarj_2023]), [tkopiskjarj_2023])
   ,[tkkmaak_2023] = coalesce(nullif([tkkmaak_2023],'20'),'01')
   ,[tkolotamm_2023]
   ,[tkolosyys_2023]
   ,[muutaopiskkoulk_2023] = coalesce((Select koulutus_koodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutusluokitus_nykytila] WHERE koulutus_koodi=[muutaopiskkoulk_2023]), [muutaopiskkoulk_2023])
   ,[muutaopiskjarj_2023] = coalesce((Select koulutuksen_jarjestajakoodi_nykytila FROM [VipunenTK_lisatiedot].[dbo].[AL_koulutuksen_jarjestaja_nykytila] WHERE koulutuksen_jarjestajakoodi=[muutaopiskjarj_2023]), [muutaopiskjarj_2023])
   ,[muutakmaak_2023] = coalesce(nullif([muutakmaak_2023],'20'),'01')
   ,[muutaolotamm_2023]
   ,[muutaolosyys_2023]
   ,[ptoim1r5_2023]
   ,[amas_2023]


-- UUSI VUOSI
-- lisää sarakkeet ylle ja päivitä tietolähde sekä lähdetaulut alle

    ,[lkm]
    ,[tietolahde]='K3_10_sopv_25'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, alvv, allk)
    ,[aineistorivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, alvv, allk)
	,f1.[rivinro]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_10_sopv_25_1] f1
  inner join [TK_H9098_CSC].[dbo].[TK_K3_10_sopv_25_2] as f2 on f1.rivinro=f2.rivinro 
 --28.8.2013 Poistetaan maanpuolustuskoulutus
WHERE jarj not in ('999999-9', '0952029-9'/*sopv19-*/)
--testausta /Jarmo
--and   alvv='2008' and allk='2'








GO


