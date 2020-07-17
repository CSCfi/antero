USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 17.7.2020 13:45:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO















/****** Script for SelectTopNRows command from SSMS  ******/


ALTER VIEW [dbo].[v_f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] AS

--truncate table f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk

--insert into f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk

SELECT  
       tilastovuosi = [tilv]
      ,sukupuoli_avain = [sp]
      ,syntymavuosi = 
			CASE WHEN [syntv] = '9999' or syntv IS NULL THEN 'Tuntematon'
			ELSE cast(syntv as varchar(10))
			END
      ,jarjestys_syntymavuosi = 
			CASE WHEN [syntv] = '9999' or syntv IS NULL THEN 9999
			ELSE cast(syntv as int)
			END
      ,kotikunta_avain = [tilvaskun]
      ,kotikunta_sama_kuin_edeltavana_vuonna_avain = [tilvaskunsama]
      ,edeltavan_vuoden_asuinpaikka_avain = [oleskelux]
      ,suomeen_muuttamisvuosi = 
			CASE WHEN muuttov IS NULL THEN 'Asunut koko ikänsä Suomessa'
			ELSE cast([muuttov] as Varchar(30))
			END
      ,jarjestys_suomeen_muuttamisvuosi = 
			CASE WHEN muuttov IS NULL THEN 9999
			ELSE cast([muuttov] as int)
			END
      ,aidinkieli_versio4_avain = 
		CASE
			WHEN aikielir4 = '99' THEN '90' -- ohjataan muuksi tuntemattoman sijaan
			ELSE aikielir4
		END	  
      ,kansalaisuus_avain = [kansalr3]
      ,syntymamaa_avain = [svaltr3]
      ,aidin_syntymamaa_avain = [svaltr3_aiti]
      ,isan_syntymamaa_avain = [svaltr3_isa]
      ,henkilotunnuksen_oikeellisuus_avain = [htok]
      ,koulutusryhma_avain = [klajir1]
      ,opetushallinnon_koulutus_avain = [ophal]
      ,koulutusluokitus_avain = 'OPMOPA' + [opmopa]
	  ,koulutusala_taso2_avain = 'ISCFINARROW' + ulkomaalaistaustaiset.[iscfinarrow2013]
      ,koulutuksen_opetuskieli_avain = [kkieli]
      ,koulutuksen_sijaintikunta_koodi = [kkun]
      ,tutkinnon_aloittamisvuosi = 
			CASE WHEN [alvv] = '9999' or alvv is null THEN 'Tuntematon'
			ELSE cast(alvv as varchar(10))
			END
      ,jarjestys_tutkinnon_aloittamisvuosi = 
			CASE WHEN [alvv] = '9999' or alvv is null THEN 9999
			ELSE cast(alvv as int)
			END
      ,opiskelijan_olo_avain = [olosyys]
      ,maassaolo_avain = [maassaolo]
      ,osatutkinto_koodi = [osatutk]
      ,aloittaneet = [uusi]
      ,opiskelijat = [opisk]
      ,tutkinnot = [tutk]
      

/*** johdetut dimensiot ***/

      ,tutkinnon_toteuma_avain =   
		CASE 
			WHEN osatutk = 1 THEN 2
			WHEN osatutk = 2 THEN 1
			ELSE -1
		END
      ,aineisto_avain  -- ennakko / lopullinen
      --,aineisto_OTV_avain = 'K2.17a-b'  -- ei tarvita aineistokäsittelynä 28.4.2015
      ,koulutussektori_avain = 
        CASE
			WHEN klajir1 IN (21, 22) THEN 2
			WHEN klajir1 IN (31, 32, 33, 35, 61, 62, 63, 64, 65, 66) THEN 3
			WHEN klajir1 IN (41, 42, 43, 44, 45, 46) THEN 4
			WHEN klajir1 IN (51, 52, 53, 54) THEN 5
			ELSE -1
        END
      ,ika1v_avain = 
		CASE
			WHEN syntv = 9999 THEN -1
			ELSE cast(tilv as int) - syntv
		END
      ,ikaryhma1_avain = 
		CASE
			WHEN syntv = 9999 THEN '-1'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) >59 THEN 'kirikar160'
			ELSE cast(cast(tilv as int) - syntv as varchar(10))
		END
      ,ikaryhma2_avain = 
		CASE
			WHEN syntv = 9999 THEN '-1'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) <3 THEN 'ikaryh2_2'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 3 AND 5 THEN 'ikaryh2_5'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) = 6 THEN 'ikaryh2_6'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 7 AND 12 THEN 'ikaryh2_12'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 13 AND 15 THEN 'ikaryh2_15'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 16 AND 18 THEN 'ikaryh2_18'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 19 AND 21 THEN 'ikaryh2_21'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 22 AND 24 THEN 'ikaryh2_24'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 25 AND 29 THEN 'ikaryh2_29'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 30 AND 34 THEN 'ikaryh2_34'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 35 AND 39 THEN 'ikaryh2_39'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 40 AND 44 THEN 'ikaryh2_44'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 45 AND 49 THEN 'ikaryh2_49'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 50 AND 54 THEN 'ikaryh2_54'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 55 AND 59 THEN 'ikaryh2_59'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 60 AND 64 THEN 'ikaryh2_64'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) > 64 THEN 'ikaryh2_65'
			ELSE '-1'
		END
      ,suoritusaika = 
	    CASE
			WHEN alvv = 9999 or alvv IS NULL THEN 'Tuntematon'
			ELSE cast(cast(tilv as int) - alvv as varchar(10))
		END
      ,jarjestys_suoritusaika = 
	    CASE
			WHEN alvv = 9999 or alvv IS NULL THEN 9999
			ELSE cast(tilv as int) - alvv
		END

      ,aidinkieli_versio1_avain =
		CASE
			WHEN aikielir4 IN ('fi', 'se') THEN 'fs'
			WHEN aikielir4 IN ('sv') THEN aikielir4
			ELSE '99'
		END
     
      ,aidinkieli_versio2_avain =
		CASE
			WHEN aikielir4 IN ('fi', 'sv', 'se') THEN aikielir4
			ELSE '99'
		END
	  ,maahantulo_ja_toisen_asteen_koul_aloittaminen_avain =   
		CASE
			WHEN klajir1 IN (21, 22, 31, 32, 33, 35, 61, 62, 63, 64, 65, 66) AND muuttov < alvv AND muuttov IS NOT NULL THEN 1 --'Maahantulo ennen opiskelun aloittamisvuotta'
			WHEN klajir1 IN (21, 22, 31, 32, 33, 35, 61, 62, 63, 64, 65, 66) AND muuttov = alvv AND muuttov IS NOT NULL THEN 2 --'Maahantulo opiskelun aloittamisvuonna'
			WHEN muuttov IS NULL THEN 3
			ELSE '-1'
		END
	  ,maahantulo_ja_korkeakoulutuksen_aloittaminen_avain =  
		CASE
			WHEN klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov < alvv AND muuttov IS NOT NULL THEN 1 --'Maahantulo ennen opiskelun aloittamisvuotta'
			WHEN klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv AND muuttov IS NOT NULL THEN 2 --'Maahantulo opiskelun aloittamisvuonna'
			WHEN muuttov IS NULL THEN 3
			ELSE '-1'
		END      

		,koulutuksen_jarjestamismuoto_avain = cast(
		(
			case
				when klajir1 in (31, 32, 33, 61, 62, 63) then '1'
				when klajir1 in (35, 64, 65, 66) then '2'
			else '-1'
			end
		)
		as nvarchar(2))
		


		
/*** johdetut mittarit ***/

	  ,aloittaneet_ulkomaalaistausta_kielen_mukaan =
		CASE
			WHEN ((aikielir4<>'fi' AND aikielir4<>'sv' AND aikielir4<>'se') 
					OR (aikielir4='sv' AND svaltr3_aiti<>246 AND svaltr3_aiti<>248 AND svaltr3_isa<>246 AND svaltr3_isa<>248))
				AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 	
				AND klajir1 NOT IN (43, 44, 45, 52, 53, 54)			
			THEN uusi
		END	   
	  ,opiskelijat_ulkomaalaistausta_kielen_mukaan =
		CASE
			WHEN ((aikielir4<>'fi' AND aikielir4<>'sv' AND aikielir4<>'se') 
					OR (aikielir4='sv' AND svaltr3_aiti<>246 AND svaltr3_aiti<>248 AND svaltr3_isa<>246 AND svaltr3_isa<>248)) 
				AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 	
			THEN opisk											
		END
	  ,tutkinnot_ulkomaalaistausta_kielen_mukaan =
		CASE
			WHEN ((aikielir4<>'fi' AND aikielir4<>'sv' AND aikielir4<>'se') 
					OR (aikielir4='sv' AND svaltr3_aiti<>246 AND svaltr3_aiti<>248 AND svaltr3_isa<>246 AND svaltr3_isa<>248)) 
				AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 	
			THEN tutk
		END	
	  ,aloittaneet_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan =
		CASE
			WHEN (svaltr3_aiti<>246 AND svaltr3_aiti<>248 AND svaltr3_isa<>246 AND svaltr3_isa<>248) 
			AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 	
			AND klajir1 NOT IN (43, 44, 45, 52, 53, 54)
			THEN uusi
		END
	  ,opiskelijat_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan =
		CASE
			WHEN (svaltr3_aiti<>246 AND svaltr3_aiti<>248 AND svaltr3_isa<>246 AND svaltr3_isa<>248) 
			AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 	
			THEN opisk
		END
	  ,tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan =
		CASE
			WHEN (svaltr3_aiti<>246 AND svaltr3_aiti<>248 AND svaltr3_isa<>246 AND svaltr3_isa<>248) 
			AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 	
			THEN tutk
		END
	  ,aloittaneet_ulkomaalaiset =
		CASE
			WHEN kansalr3<>246 and kansalr3<>248 
			AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 	
			AND klajir1 NOT IN (43, 44, 45, 52, 53, 54)
			THEN uusi
		END
	  ,opiskelijat_ulkomaalaiset =
		CASE
			WHEN kansalr3<>246 and kansalr3<>248 
			AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 			
			THEN opisk
		END
	  ,tutkinnot_ulkomaalaiset =
		CASE
			WHEN kansalr3<>246 and kansalr3<>248 
			AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 	
			THEN tutk
		END
	  ,aloittaneet_ulkomailla_syntyneet =
		CASE
			WHEN svaltr3<>246 and svaltr3<>248 
			AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 	
			AND klajir1 NOT IN (43, 44, 45, 52, 53, 54)
			THEN uusi
		END
	  ,opiskelijat_ulkomailla_syntyneet =
		CASE
			WHEN svaltr3<>246 and svaltr3<>248 
			AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 	
			THEN opisk
		END
	  ,tutkinnot_ulkomailla_syntyneet =
		CASE
			WHEN svaltr3<>246 and svaltr3<>248 
			AND NOT (klajir1 IN (41, 42, 43, 44, 45, 46, 51, 52, 53, 54) AND muuttov = alvv and muuttov IS NOT NULL) 	
			THEN tutk
		END	  
	  ,hallinnonala2 = 
			case
				when ophal=1 then '1'
				when ophal=2 and al.maakunta_koodi<>'21' and (opmopa not in ('902','903','904') or iscfinarrow2013 <> '103') then '2'
				when ophal=2 then '3'
				else '-1'
			end
	  
FROM (

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov]
      ,[aikielir4]
      ,[kansalr3]
      ,[svaltr3]
      ,[svaltr3_aiti]
      ,[svaltr3_isa]
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
	  ,[iscfinarrow2013]
      ,[kkieli]
      ,[kkun]
      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,[uusi]
      ,[opisk]
      ,[tutk]
      ,aineisto_avain = 'L'  -- lopullinen
  FROM [VipunenTK_DW].[dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]

UNION ALL
  
SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov]
      ,[aikielir4]
      ,[kansalr3]
      ,[svaltr3]
      ,[svaltr3_aiti]
      ,[svaltr3_isa]
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
	  ,[iscfinarrow2013]
      ,[kkieli]
      ,[kkun]
      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,[uusi]
      ,[opisk]
      ,[tutk]
      ,aineisto_avain = 'E'  -- ennakko
 FROM [VipunenTK_DW].[dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]  
) ulkomaalaistaustaiset
left join VipunenTK.dbo.d_alueluokitus al on al.alueluokitus_avain=ulkomaalaistaustaiset.kkun
--left join VipunenTK.dbo.d_koulutusluokitus kl on kl.koulutusluokitus_avain='OPMOPA' + ulkomaalaistaustaiset.opmopa






GO


USE [ANTERO]