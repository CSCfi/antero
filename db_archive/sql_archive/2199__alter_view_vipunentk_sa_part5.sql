USE [VipunenTK_SA]
GO
/****** Object:  View [dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat]
GO
/****** Object:  View [dbo].[v_sa_R4_20_Tyollisten_aiemmat_ammatit]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_R4_20_Tyollisten_aiemmat_ammatit]
GO
/****** Object:  View [dbo].[v_sa_R4_19_Tyollisten_ammattisiirtymat]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_R4_19_Tyollisten_ammattisiirtymat]
GO
/****** Object:  View [dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]
GO
/****** Object:  View [dbo].[v_sa_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]
GO
/****** Object:  View [dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]
GO
/****** Object:  View [dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
GO
/****** Object:  View [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
GO
/****** Object:  View [dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
GO
/****** Object:  View [dbo].[v_sa_R2_22_Oppilaitostason_oppil_ja_opisk]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_R2_22_Oppilaitostason_oppil_ja_opisk]
GO
/****** Object:  View [dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]
GO
/****** Object:  View [dbo].[v_sa_K4_22_Yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_K4_22_Yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan]
GO
/****** Object:  View [dbo].[v_sa_K3_16_Moninkertainen_haku]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_K3_16_Moninkertainen_haku]
GO
/****** Object:  View [dbo].[v_sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]
GO
/****** Object:  View [dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]
GO
/****** Object:  View [dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 4.4.2019 18:12:11 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]
GO
/****** Object:  View [dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]'))
EXEC dbo.sp_executesql @statement = N'





/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk] AS

/** HUOM! ophal-muuttuja ei toimi tilastovuosille 2009-2012, ohjattu tuntemattomaksi niiden osalta. Sen jälkeen ohjataan vain arvo 9 tuntemattomaksi **/

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] = ''-1''
      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN ''0'' + opmopa
				WHEN len(opmopa) = 1 THEN ''00'' + opmopa
				ELSE opmopa
			END
	  ,[iscfinarrow2013] = NULL
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_11]
  
UNION ALL

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] = ''-1''
      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN ''0'' + opmopa
				WHEN len(opmopa) = 1 THEN ''00'' + opmopa
				ELSE opmopa
			END
	  ,[iscfinarrow2013]
	  ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_12_H]  
  
UNION ALL

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')      
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] = ''-1''
      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN ''0'' + opmopa
				WHEN len(opmopa) = 1 THEN ''00'' + opmopa
				ELSE opmopa
			END
	  ,[iscfinarrow2013] 
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)
      
  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_13_H]  
  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] = ''-1''
      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN ''0'' + opmopa
				WHEN len(opmopa) = 1 THEN ''00'' + opmopa
				ELSE opmopa
			END
	  ,[iscfinarrow2013]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_14_H]  
  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] =
			CASE 
				WHEN ophal = ''9'' THEN ''-1''
				ELSE ophal
			END

      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN ''0'' + opmopa
				WHEN len(opmopa) = 1 THEN ''00'' + opmopa
				ELSE opmopa
			END
	  ,[iscfinarrow2013] 
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_15_H]  
  

UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] =
			CASE 
				WHEN ophal = ''9'' THEN ''-1''
				ELSE ophal
			END

      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN ''0'' + opmopa
				WHEN len(opmopa) = 1 THEN ''00'' + opmopa
				ELSE opmopa
			END
	  ,[iscfinarrow2013] 
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_16_H]  


  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] =
			CASE 
				WHEN ophal = ''9'' THEN ''-1''
				ELSE ophal
			END

      ,[opmopa] =
			CASE
				WHEN len(opmopa) = 2 THEN ''0'' + opmopa
				WHEN len(opmopa) = 1 THEN ''00'' + opmopa
				ELSE opmopa
			END
	  ,[iscfinarrow2013] 
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_17_H]

UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] =
			CASE 
				WHEN ophal = ''9'' THEN ''-1''
				ELSE ophal
			END

      ,[opmopa] = NULL
			/**
				WHEN len(opmopa) = 2 THEN ''0'' + opmopa
				WHEN len(opmopa) = 1 THEN ''00'' + opmopa
				ELSE opmopa
			END **/
	  ,[iscfinarrow2013]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_18]  

UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] =
			CASE 
				WHEN ophal = ''9'' THEN ''-1''
				ELSE ophal
			END

      ,[opmopa] = NULL
			/**
				WHEN len(opmopa) = 2 THEN ''0'' + opmopa
				WHEN len(opmopa) = 1 THEN ''00'' + opmopa
				ELSE opmopa
			END **/
	  ,[iscfinarrow2013]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,[alvv]
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17a_sopv_19]    
  


' 
GO
/****** Object:  View [dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]'))
EXEC dbo.sp_executesql @statement = N'















/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk] AS

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				WHEN tilvaskun = ''BBB'' THEN ''999''
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal] =
			CASE 
				WHEN ophal = ''9'' THEN ''-1''
				ELSE ophal
			END
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END


      ,alvv = nullif([alvv], ''BBBB'')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_11]
  
UNION ALL

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				WHEN tilvaskun = ''BBB'' THEN ''999''
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], ''BBBB'')
	  ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_12]  
  
UNION ALL

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				WHEN tilvaskun = ''BBB'' THEN ''999''
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], ''BBBB'')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_13]  
  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				WHEN tilvaskun = ''BBB'' THEN ''999''
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], ''BBBB'')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_14]  
  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				WHEN tilvaskun = ''BBB'' THEN ''999''
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(muuttov,'''')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], ''BBBB'')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_15]  
  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				WHEN tilvaskun = ''BBB'' THEN ''999''
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(nullif(muuttov,''''), ''BBBB'')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], ''BBBB'')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

  FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_16]  

  
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				WHEN tilvaskun = ''BBB'' THEN ''999''
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(nullif(muuttov,''''), ''BBBB'')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], ''BBBB'')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_17]

UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				WHEN tilvaskun = ''BBB'' THEN ''999''
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(nullif(muuttov,''''), ''BBBB'')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], ''BBBB'')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)

FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_18]  
 
UNION ALL  

SELECT [tilv]
      ,[sp]
      ,[syntv]
      ,[tilvaskun]  =
			CASE
				WHEN len(tilvaskun) = 2 THEN ''0'' + tilvaskun
				WHEN len(tilvaskun) = 1 THEN ''00'' + tilvaskun
				WHEN tilvaskun = ''BBB'' THEN ''999''
				ELSE tilvaskun
			END
      ,[tilvaskunsama]
      ,[oleskelux]
      ,[muuttov] = nullif(nullif(muuttov,''''), ''BBBB'')
      ,[aikielir4]
      ,[kansalr3] = Right(''000''+[kansalr3],3)
      ,[svaltr3] = Right(''000''+[svaltr3],3)
      ,[svaltr3_aiti] = Right(''000''+[svaltr3_aiti],3)
      ,[svaltr3_isa] = Right(''000''+[svaltr3_isa],3)
      ,[htok]
      ,[klajir1]
      ,[ophal]
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[kkieli]
      ,[kkun] =
			CASE
				WHEN len(kkun) = 2 THEN ''0'' + kkun
				WHEN len(kkun) = 1 THEN ''00'' + kkun
				ELSE kkun
			END

      ,alvv = nullif([alvv], ''BBBB'')
      ,[olosyys]
      ,[maassaolo]
      ,[osatutk]
      ,uusi = NULLIF([uusi], 0)
      ,opisk = NULLIF([opisk], 0)
      ,tutk = NULLIF([tutk], 0)
FROM [TK_H9098_CSC].[dbo].[TK_K2_17b_sopv_19]  


' 
GO
/****** Object:  View [dbo].[v_sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]'))
EXEC dbo.sp_executesql @statement = N'











CREATE VIEW [dbo].[v_sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta] AS

SELECT
      [tilv]= cast(kaikkivuodet.tilv as nvarchar(4))
	  ,tilv_date = cast(kaikkivuodet.tilv+''-01-01'' as date)
      ,[aineisto]= cast(kaikkivuodet.aineisto as nvarchar(1))
      ,[lahde]= cast(kaikkivuodet.lahde as nvarchar(2))
      ,[sp]= cast(kaikkivuodet.sp as nvarchar(1))
      ,[aikielir1]= cast(kaikkivuodet.aikielir1 as nvarchar(2))
      ,[syntv]= cast(kaikkivuodet.syntv as nvarchar(4))
      ,[tilvaskun]= cast(kaikkivuodet.tilvaskun as nvarchar(3))
      ,[kansalr1]= cast(kaikkivuodet.kansalr1 as nvarchar(1))
      ,[eumaa]= cast(kaikkivuodet.eumaa as nvarchar(1))
      ,[etamaa]= cast(kaikkivuodet.etamaa as nvarchar(1))
      ,[pohjmaa]= cast(kaikkivuodet.pohjmaa as nvarchar(1))
      ,[alvv]= cast(kaikkivuodet.alvv as nvarchar(4))
      ,[allk]= cast(kaikkivuodet.allk as nvarchar(1))
      ,[ololk]= cast(kaikkivuodet.ololk as nvarchar(1))
      ,[jarj]= cast(kaikkivuodet.jarj as nvarchar(10))
      ,[tunn]= cast(kaikkivuodet.tunn as nvarchar(5))
      ,[koulk]= cast(kaikkivuodet.koulk as nvarchar(6))
	  ,[koulk_opintoala] = CAST(kaikkivuodet.koulk_opintoala as nvarchar (6))
	  ,[koulk_koulutusala] = CAST(kaikkivuodet.koulk_koulutusala as nvarchar (6))
	  ,[koulk_koulutusaste] = CAST(kaikkivuodet.koulk_koulutusaste as nvarchar (6))
      ,[kkielir1]= cast(kaikkivuodet.kkielir1 as nvarchar(2))
      ,[kkun]= cast(kaikkivuodet.kkun as nvarchar(3))
	  ,[kkun_kmaak]= cast(kaikkivuodet.kkun_kmaak as nvarchar(2))
	  ,[ophal]= cast(kaikkivuodet.ophal as nvarchar(1))
      ,[koultyp]= cast(kaikkivuodet.koultyp	 as nvarchar(1))
      ,[tutkmaak]= cast(kaikkivuodet.tutkmaak as nvarchar(2))
      ,[tutkjarj]= cast(kaikkivuodet.tutkjarj as nvarchar(10))
      ,[tutktunn]= cast(kaikkivuodet.tutktunn as nvarchar(5))
      ,[tutkkoulk]= cast(kaikkivuodet.tutkkoulk as nvarchar(6))
	  ,[tutk_opintoala] = CAST(kaikkivuodet.tutk_opintoala as nvarchar (6))
	  ,[tutk_koulutusala] = CAST(kaikkivuodet.tutk_koulutusala as nvarchar (6))
	  ,[tutk_koulutusaste] = CAST(kaikkivuodet.tutk_koulutusaste as nvarchar (6))
      ,[tutkkoultyp]= cast(kaikkivuodet.tutkkoultyp as nvarchar(1))
      ,[seurvkmaak]= cast(kaikkivuodet.seurvkmaak as nvarchar(2))
      ,[seurvjarj]= cast(kaikkivuodet.seurvjarj as nvarchar(10))
      ,[seurvtunn]= cast(kaikkivuodet.seurvtunn as nvarchar(5))
      ,[seurvkoulk]= cast(kaikkivuodet.seurvkoulk as nvarchar(6))
	  ,[seurv_opintoala] = CAST(kaikkivuodet.seurv_opintoala as nvarchar (6))
	  ,[seurv_koulutusala] = CAST(kaikkivuodet.seurv_koulutusala as nvarchar (6))
	  ,[seurv_koulutusaste] = CAST(kaikkivuodet.seurv_koulutusaste as nvarchar (6))
      ,[seurvkoulutyp]= cast(kaikkivuodet.seurvkoulutyp as nvarchar(1))
      ,[ptoim1r2]= cast(kaikkivuodet.ptoim1r2 as nvarchar(2))
      ,[amas1]= cast(kaikkivuodet.amas1 as nvarchar(1))
      ,[lkm]= CAST(kaikkivuodet.lkm as int)
 FROM (
SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk]
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''''), ''-1'') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+''-01-01'' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_11] tk
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+''-01-01'' between kl1.alkaa and kl1.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+''-01-01'' between kl2.alkaa and kl2.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+''-01-01'' between kl3.alkaa and kl3.paattyy
  where [aineisto] = ''L''
  UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk]
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''''), ''-1'') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+''-01-01'' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_12] tk
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+''-01-01'' between kl1.alkaa and kl1.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+''-01-01'' between kl2.alkaa and kl2.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+''-01-01'' between kl3.alkaa and kl3.paattyy
  where [aineisto] = ''L''
 UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk]
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''''), ''-1'') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+''-01-01'' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_13] tk
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+''-01-01'' between kl1.alkaa and kl1.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+''-01-01'' between kl2.alkaa and kl2.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+''-01-01'' between kl3.alkaa and kl3.paattyy
  where [aineisto] = ''L''
 UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk]
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''''), ''-1'') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+''-01-01'' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_14] tk
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+''-01-01'' between kl1.alkaa and kl1.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+''-01-01'' between kl2.alkaa and kl2.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+''-01-01'' between kl3.alkaa and kl3.paattyy
  where [aineisto] = ''L''
UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk]
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''''), ''-1'') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+''-01-01'' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_15] tk
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+''-01-01'' between kl1.alkaa and kl1.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+''-01-01'' between kl2.alkaa and kl2.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+''-01-01'' between kl3.alkaa and kl3.paattyy
  where [aineisto] = ''L''
UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk]
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''''), ''-1'') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+''-01-01'' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
  FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_16] tk
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+''-01-01'' between kl1.alkaa and kl1.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+''-01-01'' between kl2.alkaa and kl2.paattyy
  left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+''-01-01'' between kl3.alkaa and kl3.paattyy
  where [aineisto] = ''L''
UNION ALL
  SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk]
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''''), ''-1'') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+''-01-01'' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_17] tk
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+''-01-01'' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+''-01-01'' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+''-01-01'' between kl3.alkaa and kl3.paattyy
where [aineisto] = ''L''

UNION ALL

SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk]
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''''), ''-1'') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+''-01-01'' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_18] tk
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+''-01-01'' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+''-01-01'' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+''-01-01'' between kl3.alkaa and kl3.paattyy
where [aineisto] = ''L''

UNION ALL

SELECT [tilv]
      ,[aineisto]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskun]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[pohjmaa]
      ,[alvv]
      ,[allk]
      ,[ololk]
      ,[jarj]
      ,[tunn]
      ,[koulk]
	  ,[koulk_opintoala] = cast(coalesce(nullif(kl1.opintoala2002_koodi, ''''), ''-1'') as nvarchar(6))
	  --,[koulk_opintoala] = (select distinct  opintoala2002_koodi  from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusala] = cast(coalesce(nullif(kl1.koulutusala2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusala] = (select distinct koulutusala2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
	  ,[koulk_koulutusaste] = cast(coalesce(nullif(kl1.koulutusaste2002_koodi , ''''), ''-1'') as nvarchar(6))
      --,[koulk_koulutusaste] = (select distinct koulutusaste2002_koodi   from [VipunenTK_DW].[dbo].[d_koulutusluokitus] where koulutusluokitus_avain = [koulk])
      ,[kkielir1]
      ,[kkun]
	  ,[kkun_kmaak]= (select distinct maakunta_koodi   from [VipunenTK_DW].[dbo].[d_alueluokitus] where alueluokitus_avain = [kkun] and tilv+''-01-01'' between
	  (alkaa) and (paattyy) )
      ,[ophal]
      ,[koultyp]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutktunn]
      ,[tutkkoulk]
	  ,[tutk_opintoala] = kl2.opintoala2002_koodi
      ,[tutk_koulutusala] = kl2.koulutusala2002_koodi
      ,[tutk_koulutusaste] = kl2.koulutusaste2002_koodi
      ,[tutkkoultyp]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvtunn]
      ,[seurvkoulk]
	  ,[seurv_opintoala] = kl3.opintoala2002_koodi
      ,[seurv_koulutusala] = kl3.koulutusala2002_koodi
      ,[seurv_koulutusaste] = kl3.koulutusaste2002_koodi
      ,[seurvkoulutyp]
      ,[ptoim1r2]
      ,[amas1]
      ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K3_11a_sopv_19] tk
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl1 on kl1.koulutusluokitus_avain=tk.koulk and tilv+''-01-01'' between kl1.alkaa and kl1.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl2 on kl2.koulutusluokitus_avain=tk.tutkkoulk and tilv+''-01-01'' between kl2.alkaa and kl2.paattyy
left join [VipunenTK_DW].[dbo].[d_koulutusluokitus] kl3 on kl3.koulutusluokitus_avain=tk.seurvkoulk and tilv+''-01-01'' between kl3.alkaa and kl3.paattyy
where [aineisto] = ''L''

) as kaikkivuodet




' 
GO
/****** Object:  View [dbo].[v_sa_K3_16_Moninkertainen_haku]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_K3_16_Moninkertainen_haku]'))
EXEC dbo.sp_executesql @statement = N'









CREATE VIEW [dbo].[v_sa_K3_16_Moninkertainen_haku] AS

-- truncate table vipunentk_dw.dbo.sa_K3_16_Moninkertainen_haku
-- insert into vipunentk_dw.dbo.sa_K3_16_Moninkertainen_haku select * from [VipunenTK_SA].dbo.v_sa_K3_16_Moninkertainen_haku

-- Drop table vipunentk_dw.dbo.sa_K3_16_Moninkertainen_haku
-- Select * into vipunentk_dw.dbo.sa_K3_16_Moninkertainen_haku from [VipunenTK_SA].dbo.v_sa_K3_16_Moninkertainen_haku

SELECT [tilv]
	  ,tilv_date = Cast(kaikkivuodet.tilv+''0101'' as date)
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2]
	  ,[luammhaku2_kaste_t2] 
	  ,[luammhaku3_kaste_t2] 
	  ,[luammhaku4_kaste_t2] 
	  ,[luammhaku5_kaste_t2]
	  ,[luammhaku1_iscfibroad2013] 
	  ,[luammhaku2_iscfibroad2013] 
	  ,[luammhaku3_iscfibroad2013] 
	  ,[luammhaku4_iscfibroad2013] 
	  ,[luammhaku5_iscfibroad2013] 
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv] = Case when luammhaku1_hyv=''1'' then ''K'' when luammhaku1_hyv=''2'' then ''E'' else NULL end
      ,[luammhaku2_hyv] = Case when luammhaku2_hyv=''1'' then ''K'' when luammhaku2_hyv=''2'' then ''E'' else NULL end
      ,[luammhaku3_hyv] = Case when luammhaku3_hyv=''1'' then ''K'' when luammhaku3_hyv=''2'' then ''E'' else NULL end
      ,[luammhaku4_hyv] = Case when luammhaku4_hyv=''1'' then ''K'' when luammhaku4_hyv=''2'' then ''E'' else NULL end
      ,[luammhaku5_hyv] = Case when luammhaku5_hyv=''1'' then ''K'' when luammhaku5_hyv=''2'' then ''E'' else NULL end
      ,[luammhaku1_vastotto] = Case when luammhaku1_vastotto=''1'' then ''K'' when luammhaku1_vastotto=''2'' then ''E'' else NULL end
      ,[luammhaku2_vastotto] = Case when luammhaku2_vastotto=''1'' then ''K'' when luammhaku2_vastotto=''2'' then ''E'' else NULL end
      ,[luammhaku3_vastotto] = Case when luammhaku3_vastotto=''1'' then ''K'' when luammhaku3_vastotto=''2'' then ''E'' else NULL end
      ,[luammhaku4_vastotto] = Case when luammhaku4_vastotto=''1'' then ''K'' when luammhaku4_vastotto=''2'' then ''E'' else NULL end
      ,[luammhaku5_vastotto] = Case when luammhaku5_vastotto=''1'' then ''K'' when luammhaku5_vastotto=''2'' then ''E'' else NULL end
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn]
	  ,[amkhaku5_tunn]
	  ,[amkhaku6_tunn]
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast]
	  ,[amkhaku5_opmast]
	  ,[amkhaku6_opmast]
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa]
	  ,[amkhaku5_opmopa]
	  ,[amkhaku6_opmopa]
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa]
	  ,[amkhaku5_opm95opa]
	  ,[amkhaku6_opm95opa]
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli]
	  ,[amkhaku5_okieli]
	  ,[amkhaku6_okieli]
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv] = Case when amkhaku1_hyv=''1'' then ''K'' when amkhaku1_hyv=''2'' then ''E'' else NULL end
      ,[amkhaku2_hyv] = Case when amkhaku2_hyv=''1'' then ''K'' when amkhaku2_hyv=''2'' then ''E'' else NULL end
      ,[amkhaku3_hyv] = Case when amkhaku3_hyv=''1'' then ''K'' when amkhaku3_hyv=''2'' then ''E'' else NULL end
      ,[amkhaku4_hyv] = Case when amkhaku4_hyv=''1'' then ''K'' when amkhaku4_hyv=''2'' then ''E'' else NULL end
	  ,[amkhaku5_hyv] = Case when amkhaku5_hyv=''1'' then ''K'' when amkhaku5_hyv=''2'' then ''E'' else NULL end
	  ,[amkhaku6_hyv] = Case when amkhaku6_hyv=''1'' then ''K'' when amkhaku6_hyv=''2'' then ''E'' else NULL end
      ,[amkhakum_hyv] = Case when amkhakum_hyv=''1'' then ''K'' when amkhakum_hyv=''2'' then ''E'' else NULL end
      ,[amkhaku1_vastotto] = Case when amkhaku1_vastotto=''1'' then ''K'' when amkhaku1_vastotto=''2'' then ''E'' else NULL end
      ,[amkhaku2_vastotto] = Case when amkhaku2_vastotto=''1'' then ''K'' when amkhaku2_vastotto=''2'' then ''E'' else NULL end
      ,[amkhaku3_vastotto] = Case when amkhaku3_vastotto=''1'' then ''K'' when amkhaku3_vastotto=''2'' then ''E'' else NULL end
      ,[amkhaku4_vastotto] = Case when amkhaku4_vastotto=''1'' then ''K'' when amkhaku4_vastotto=''2'' then ''E'' else NULL end
	  ,[amkhaku5_vastotto] = Case when amkhaku5_vastotto=''1'' then ''K'' when amkhaku5_vastotto=''2'' then ''E'' else NULL end
	  ,[amkhaku6_vastotto] = Case when amkhaku6_vastotto=''1'' then ''K'' when amkhaku6_vastotto=''2'' then ''E'' else NULL end
      ,[amkhakum_vastotto] = Case when amkhakum_vastotto=''1'' then ''K'' when amkhakum_vastotto=''2'' then ''E'' else NULL end
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv] = Case when yohakua_hyv=''1'' then ''K'' when yohakua_hyv=''2'' then ''E'' else NULL end
      ,[yohakub_hyv] = Case when yohakub_hyv=''1'' then ''K'' when yohakub_hyv=''2'' then ''E'' else NULL end
      ,[yohakuc_hyv] = Case when yohakuc_hyv=''1'' then ''K'' when yohakuc_hyv=''2'' then ''E'' else NULL end
      ,[yohakud_hyv] = Case when yohakud_hyv=''1'' then ''K'' when yohakud_hyv=''2'' then ''E'' else NULL end
      ,[yohakue_hyv] = Case when yohakue_hyv=''1'' then ''K'' when yohakue_hyv=''2'' then ''E'' else NULL end
      ,[yohakuf_hyv] = Case when yohakuf_hyv=''1'' then ''K'' when yohakuf_hyv=''2'' then ''E'' else NULL end
      ,[yohakug_hyv] = Case when yohakug_hyv=''1'' then ''K'' when yohakug_hyv=''2'' then ''E'' else NULL end
      ,[yohakuh_hyv] = Case when yohakuh_hyv=''1'' then ''K'' when yohakuh_hyv=''2'' then ''E'' else NULL end
      ,[yohakui_hyv] = Case when yohakui_hyv=''1'' then ''K'' when yohakui_hyv=''2'' then ''E'' else NULL end
      ,[yohakua_vastotto] = Case when yohakua_vastotto=''1'' then ''K'' when yohakua_vastotto=''2'' then ''E'' else NULL end
      ,[yohakub_vastotto] = Case when yohakub_vastotto=''1'' then ''K'' when yohakub_vastotto=''2'' then ''E'' else NULL end
      ,[yohakuc_vastotto] = Case when yohakuc_vastotto=''1'' then ''K'' when yohakuc_vastotto=''2'' then ''E'' else NULL end
      ,[yohakud_vastotto] = Case when yohakud_vastotto=''1'' then ''K'' when yohakud_vastotto=''2'' then ''E'' else NULL end
      ,[yohakue_vastotto] = Case when yohakue_vastotto=''1'' then ''K'' when yohakue_vastotto=''2'' then ''E'' else NULL end
      ,[yohakuf_vastotto] = Case when yohakuf_vastotto=''1'' then ''K'' when yohakuf_vastotto=''2'' then ''E'' else NULL end
      ,[yohakug_vastotto] = Case when yohakug_vastotto=''1'' then ''K'' when yohakug_vastotto=''2'' then ''E'' else NULL end
      ,[yohakuh_vastotto] = Case when yohakuh_vastotto=''1'' then ''K'' when yohakuh_vastotto=''2'' then ''E'' else NULL end
      ,[yohakui_vastotto] = Case when yohakui_vastotto=''1'' then ''K'' when yohakui_vastotto=''2'' then ''E'' else NULL end
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2]
	  ,[kkhaku2_kaste_t2] 
	  ,[kkhaku3_kaste_t2]
	  ,[kkhaku4_kaste_t2] 
	  ,[kkhaku5_kaste_t2] 
	  ,[kkhaku6_kaste_t2] 
	  ,[kkhaku1_iscfibroad2013] 
	  ,[kkhaku2_iscfibroad2013] 
	  ,[kkhaku3_iscfibroad2013] 
	  ,[kkhaku4_iscfibroad2013] 
	  ,[kkhaku5_iscfibroad2013] 
	  ,[kkhaku6_iscfibroad2013]
      ,[luhakux] = Case when luhakux=''1'' then ''K'' when luhakux=''2'' then ''E'' else NULL end
      ,[luhaku2x] = Case when luhaku2x=''1'' then ''K'' when luhaku2x=''2'' then ''E'' else NULL end
      ,[luhaku3x] = Case when luhaku3x=''1'' then ''K'' when luhaku3x=''2'' then ''E'' else NULL end
      ,[ammhakux] = Case when ammhakux=''1'' then ''K'' when ammhakux=''2'' then ''E'' else NULL end
      ,[ammhaku2x] = Case when ammhaku2x=''1'' then ''K'' when ammhaku2x=''2'' then ''E'' else NULL end
      ,[ammhaku3x] = Case when ammhaku3x=''1'' then ''K'' when ammhaku3x=''2'' then ''E'' else NULL end
      ,[amkhakux] = Case when amkhakux=''1'' then ''K'' when amkhakux=''2'' then ''E'' else NULL end
      ,[amkhaku2x] = Case when amkhaku2x=''1'' then ''K'' when amkhaku2x=''2'' then ''E'' else NULL end
      ,[amkhaku3x] = Case when amkhaku3x=''1'' then ''K'' when amkhaku3x=''2'' then ''E'' else NULL end
      ,[yohakux] = Case when yohakux=''1'' then ''K'' when yohakux=''2'' then ''E'' else NULL end
      ,[yohaku2x] = Case when yohaku2x=''1'' then ''K'' when yohaku2x=''2'' then ''E'' else NULL end
      ,[yohaku3x] = Case when yohaku3x=''1'' then ''K'' when yohaku3x=''2'' then ''E'' else NULL end
      ,[sp]
      ,[aikielir1]
      ,[syntv] = Case when syntv=''9999'' then '''' else syntv end
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk] = Case when aikyotutk=''1'' then ''K'' when aikyotutk=''0'' then ''E'' else ''E'' end
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm] = Case when aikamm=''1'' then ''K'' when aikamm=''0'' then ''E'' else ''E'' end
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk] = Case when aikamk=''1'' then ''K'' when aikamk=''0'' then ''E'' else ''E'' end
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk] = Case when aikylamk=''1'' then ''K'' when aikylamk=''0'' then ''E'' else ''E'' end
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk] = Case when aikalkk=''1'' then ''K'' when aikalkk=''0'' then ''E'' else ''E'' end
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk] = Case when aikylkk=''1'' then ''K'' when aikylkk=''0'' then ''E'' else ''E'' end
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri] = Case when aiklistri=''1'' then ''K'' when aiklistri=''0'' then ''E'' else ''E'' end
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx] = Case when [yotutkopisx]=''1'' then ''K'' when [yotutkopisx]=''0'' then ''E'' else ''E'' end
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx] = Case when [ammopisx]=''1'' then ''K'' when [ammopisx]=''0'' then ''E'' else ''E'' end
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1] = Case when [amkopisx1]=''1'' then ''K'' when [amkopisx1]=''0'' then ''E'' else ''E'' end
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2] = Case when [amkopisx2]=''1'' then ''K'' when [amkopisx2]=''0'' then ''E'' else ''E'' end
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3] = Case when [amkopisx3]=''1'' then ''K'' when [amkopisx3]=''0'' then ''E'' else ''E'' end
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1] = Case when [yoopisx1]=''1'' then ''K'' when [yoopisx1]=''0'' then ''E'' else ''E'' end
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2] = Case when [yoopisx2]=''1'' then ''K'' when [yoopisx2]=''0'' then ''E'' else ''E'' end
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3] = Case when [yoopisx3]=''1'' then ''K'' when [yoopisx3]=''0'' then ''E'' else ''E'' end
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok] = Case when [htok]=''1'' then ''K'' when [htok]=''2'' then ''E'' else NULL end
      ,[lkm]
      ,[tietolahde]
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM (
  
SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn],[amkhaku5_tunn] = null,[amkhaku6_tunn] = null
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast],[amkhaku5_opmast] = null,[amkhaku6_opmast] = null
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa],[amkhaku5_opmopa] = null,[amkhaku6_opmopa] = null
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa],[amkhaku5_opm95opa] = null,[amkhaku6_opm95opa] = null
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli],[amkhaku5_okieli] = null,[amkhaku6_okieli] = null
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv]
      ,[amkhaku2_hyv]
      ,[amkhaku3_hyv]
      ,[amkhaku4_hyv],[amkhaku5_hyv] = null,[amkhaku6_hyv] = null
      ,[amkhakum_hyv]
      ,[amkhaku1_vastotto]
      ,[amkhaku2_vastotto]
      ,[amkhaku3_vastotto]
      ,[amkhaku4_vastotto],[amkhaku5_vastotto] = null,[amkhaku6_vastotto] = null
      ,[amkhakum_vastotto]
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv]
      ,[yohakub_hyv]
      ,[yohakuc_hyv]
      ,[yohakud_hyv]
      ,[yohakue_hyv]
      ,[yohakuf_hyv]
      ,[yohakug_hyv]
      ,[yohakuh_hyv]
      ,[yohakui_hyv]
      ,[yohakua_vastotto]
      ,[yohakub_vastotto]
      ,[yohakuc_vastotto]
      ,[yohakud_vastotto]
      ,[yohakue_vastotto]
      ,[yohakuf_vastotto]
      ,[yohakug_vastotto]
      ,[yohakuh_vastotto]
      ,[yohakui_vastotto]
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]=''TK_K3_16_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_12]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn],[amkhaku5_tunn] = null,[amkhaku6_tunn] = null
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast],[amkhaku5_opmast] = null,[amkhaku6_opmast] = null
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa],[amkhaku5_opmopa] = null,[amkhaku6_opmopa] = null
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa],[amkhaku5_opm95opa] = null,[amkhaku6_opm95opa] = null
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli],[amkhaku5_okieli] = null,[amkhaku6_okieli] = null
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv]
      ,[amkhaku2_hyv]
      ,[amkhaku3_hyv]
      ,[amkhaku4_hyv],[amkhaku5_hyv] = null,[amkhaku6_hyv] = null
      ,[amkhakum_hyv]
      ,[amkhaku1_vastotto]
      ,[amkhaku2_vastotto]
      ,[amkhaku3_vastotto]
      ,[amkhaku4_vastotto],[amkhaku5_vastotto] = null,[amkhaku6_vastotto] = null
      ,[amkhakum_vastotto]
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv]
      ,[yohakub_hyv]
      ,[yohakuc_hyv]
      ,[yohakud_hyv]
      ,[yohakue_hyv]
      ,[yohakuf_hyv]
      ,[yohakug_hyv]
      ,[yohakuh_hyv]
      ,[yohakui_hyv]
      ,[yohakua_vastotto]
      ,[yohakub_vastotto]
      ,[yohakuc_vastotto]
      ,[yohakud_vastotto]
      ,[yohakue_vastotto]
      ,[yohakuf_vastotto]
      ,[yohakug_vastotto]
      ,[yohakuh_vastotto]
      ,[yohakui_vastotto]
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]=''TK_K3_16_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_13]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn],[amkhaku5_tunn] = null,[amkhaku6_tunn] = null
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast],[amkhaku5_opmast] = null,[amkhaku6_opmast] = null
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa],[amkhaku5_opmopa] = null,[amkhaku6_opmopa] = null
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa],[amkhaku5_opm95opa] = null,[amkhaku6_opm95opa] = null
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli],[amkhaku5_okieli] = null,[amkhaku6_okieli] = null
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv]
      ,[amkhaku2_hyv]
      ,[amkhaku3_hyv]
      ,[amkhaku4_hyv],[amkhaku5_hyv] = null,[amkhaku6_hyv] = null
      ,[amkhakum_hyv]
      ,[amkhaku1_vastotto]
      ,[amkhaku2_vastotto]
      ,[amkhaku3_vastotto]
      ,[amkhaku4_vastotto],[amkhaku5_vastotto] = null,[amkhaku6_vastotto] = null
      ,[amkhakum_vastotto]
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv]
      ,[yohakub_hyv]
      ,[yohakuc_hyv]
      ,[yohakud_hyv]
      ,[yohakue_hyv]
      ,[yohakuf_hyv]
      ,[yohakug_hyv]
      ,[yohakuh_hyv]
      ,[yohakui_hyv]
      ,[yohakua_vastotto]
      ,[yohakub_vastotto]
      ,[yohakuc_vastotto]
      ,[yohakud_vastotto]
      ,[yohakue_vastotto]
      ,[yohakuf_vastotto]
      ,[yohakug_vastotto]
      ,[yohakuh_vastotto]
      ,[yohakui_vastotto]
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]=''TK_K3_16_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [VipunenTK_SA].[dbo].[TK_K3_16_sopv_14]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn],[amkhaku5_tunn] = null,[amkhaku6_tunn] = null
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast],[amkhaku5_opmast] = null,[amkhaku6_opmast] = null
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa],[amkhaku5_opmopa] = null,[amkhaku6_opmopa] = null
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa],[amkhaku5_opm95opa] = null,[amkhaku6_opm95opa] = null
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli],[amkhaku5_okieli] = null,[amkhaku6_okieli] = null
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv]
      ,[amkhaku2_hyv]
      ,[amkhaku3_hyv]
      ,[amkhaku4_hyv],[amkhaku5_hyv] = null,[amkhaku6_hyv] = null
      ,[amkhakum_hyv]
      ,[amkhaku1_vastotto]
      ,[amkhaku2_vastotto]
      ,[amkhaku3_vastotto]
      ,[amkhaku4_vastotto],[amkhaku5_vastotto] = null,[amkhaku6_vastotto] = null
      ,[amkhakum_vastotto]
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv]
      ,[yohakub_hyv]
      ,[yohakuc_hyv]
      ,[yohakud_hyv]
      ,[yohakue_hyv]
      ,[yohakuf_hyv]
      ,[yohakug_hyv]
      ,[yohakuh_hyv]
      ,[yohakui_hyv]
      ,[yohakua_vastotto]
      ,[yohakub_vastotto]
      ,[yohakuc_vastotto]
      ,[yohakud_vastotto]
      ,[yohakue_vastotto]
      ,[yohakuf_vastotto]
      ,[yohakug_vastotto]
      ,[yohakuh_vastotto]
      ,[yohakui_vastotto]
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]=''TK_K3_16_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_15]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn]
      ,[amkhaku2_tunn]
      ,[amkhaku3_tunn]
      ,[amkhaku4_tunn],[amkhaku5_tunn] = null,[amkhaku6_tunn] = null
      ,[amkhakum_tunn]
      ,[amkhaku1_opmast]
      ,[amkhaku2_opmast]
      ,[amkhaku3_opmast]
      ,[amkhaku4_opmast],[amkhaku5_opmast] = null,[amkhaku6_opmast] = null
      ,[amkhakum_opmast]
      ,[amkhaku1_opmopa]
      ,[amkhaku2_opmopa]
      ,[amkhaku3_opmopa]
      ,[amkhaku4_opmopa],[amkhaku5_opmopa] = null,[amkhaku6_opmopa] = null
      ,[amkhakum_opmopa]
      ,[amkhaku1_opm95opa]
      ,[amkhaku2_opm95opa]
      ,[amkhaku3_opm95opa]
      ,[amkhaku4_opm95opa],[amkhaku5_opm95opa] = null,[amkhaku6_opm95opa] = null
      ,[amkhakum_opm95opa]
      ,[amkhaku1_koultyp]
      ,[amkhaku2_koultyp]
      ,[amkhaku3_koultyp]
      ,[amkhaku4_koultyp]
      ,[amkhakum_koultyp]
      ,[amkhaku1_okieli]
      ,[amkhaku2_okieli]
      ,[amkhaku3_okieli]
      ,[amkhaku4_okieli],[amkhaku5_okieli] = null,[amkhaku6_okieli] = null
      ,[amkhakum_okieli]
      ,[amkhaku1_hyv]
      ,[amkhaku2_hyv]
      ,[amkhaku3_hyv]
      ,[amkhaku4_hyv],[amkhaku5_hyv] = null,[amkhaku6_hyv] = null
      ,[amkhakum_hyv]
      ,[amkhaku1_vastotto]
      ,[amkhaku2_vastotto]
      ,[amkhaku3_vastotto]
      ,[amkhaku4_vastotto],[amkhaku5_vastotto] = null,[amkhaku6_vastotto] = null
      ,[amkhakum_vastotto]
      ,[yohakua_tunn]
      ,[yohakub_tunn]
      ,[yohakuc_tunn]
      ,[yohakud_tunn]
      ,[yohakue_tunn]
      ,[yohakuf_tunn]
      ,[yohakug_tunn]
      ,[yohakuh_tunn]
      ,[yohakui_tunn]
      ,[yohakua_opmast]
      ,[yohakub_opmast]
      ,[yohakuc_opmast]
      ,[yohakud_opmast]
      ,[yohakue_opmast]
      ,[yohakuf_opmast]
      ,[yohakug_opmast]
      ,[yohakuh_opmast]
      ,[yohakui_opmast]
      ,[yohakua_opmopa]
      ,[yohakub_opmopa]
      ,[yohakuc_opmopa]
      ,[yohakud_opmopa]
      ,[yohakue_opmopa]
      ,[yohakuf_opmopa]
      ,[yohakug_opmopa]
      ,[yohakuh_opmopa]
      ,[yohakui_opmopa]
      ,[yohakua_opm95opa]
      ,[yohakub_opm95opa]
      ,[yohakuc_opm95opa]
      ,[yohakud_opm95opa]
      ,[yohakue_opm95opa]
      ,[yohakuf_opm95opa]
      ,[yohakug_opm95opa]
      ,[yohakuh_opm95opa]
      ,[yohakui_opm95opa]
      ,[yohakua_hyv]
      ,[yohakub_hyv]
      ,[yohakuc_hyv]
      ,[yohakud_hyv]
      ,[yohakue_hyv]
      ,[yohakuf_hyv]
      ,[yohakug_hyv]
      ,[yohakuh_hyv]
      ,[yohakui_hyv]
      ,[yohakua_vastotto]
      ,[yohakub_vastotto]
      ,[yohakuc_vastotto]
      ,[yohakud_vastotto]
      ,[yohakue_vastotto]
      ,[yohakuf_vastotto]
      ,[yohakug_vastotto]
      ,[yohakuh_vastotto]
      ,[yohakui_vastotto]
      ,[yohakua_harekast]
      ,[yohakub_harekast]
      ,[yohakuc_harekast]
      ,[yohakud_harekast]
      ,[yohakue_harekast]
      ,[yohakuf_harekast]
      ,[yohakug_harekast]
      ,[yohakuh_harekast]
      ,[yohakui_harekast]
      ,[yohakua_ylempi]
      ,[yohakub_ylempi]
      ,[yohakuc_ylempi]
      ,[yohakud_ylempi]
      ,[yohakue_ylempi]
      ,[yohakuf_ylempi]
      ,[yohakug_ylempi]
      ,[yohakuh_ylempi]
      ,[yohakui_ylempi]
      ,[yohakua_erval]
      ,[yohakub_erval]
      ,[yohakuc_erval]
      ,[yohakud_erval]
      ,[yohakue_erval]
      ,[yohakuf_erval]
      ,[yohakug_erval]
      ,[yohakuh_erval]
      ,[yohakui_erval]
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]=''TK_K3_16_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_16]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast]
      ,[luammhaku2_opmast]
      ,[luammhaku3_opmast]
      ,[luammhaku4_opmast]
      ,[luammhaku5_opmast]
	  ,[luammhaku1_kaste_t2] = null
	  ,[luammhaku2_kaste_t2] = null
	  ,[luammhaku3_kaste_t2] = null
	  ,[luammhaku4_kaste_t2] = null
	  ,[luammhaku5_kaste_t2] = null
	  ,[luammhaku1_iscfibroad2013] = null
	  ,[luammhaku2_iscfibroad2013] = null
	  ,[luammhaku3_iscfibroad2013] = null
	  ,[luammhaku4_iscfibroad2013] = null
	  ,[luammhaku5_iscfibroad2013] = null
      ,[luammhaku1_opmopa]
      ,[luammhaku2_opmopa]
      ,[luammhaku3_opmopa]
      ,[luammhaku4_opmopa]
      ,[luammhaku5_opmopa]
      ,[luammhaku1_opm95opa]
      ,[luammhaku2_opm95opa]
      ,[luammhaku3_opm95opa]
      ,[luammhaku4_opm95opa]
      ,[luammhaku5_opm95opa]
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn] = case when kkhaku1_opmast in (62,71) then kkhaku1_tunn else null end
      ,[amkhaku2_tunn] = case when kkhaku2_opmast in (62,71) then kkhaku2_tunn else null end
      ,[amkhaku3_tunn] = case when kkhaku3_opmast in (62,71) then kkhaku3_tunn else null end
      ,[amkhaku4_tunn] = case when kkhaku4_opmast in (62,71) then kkhaku4_tunn else null end
	  ,[amkhaku5_tunn] = case when kkhaku5_opmast in (62,71) then kkhaku5_tunn else null end
	  ,[amkhaku6_tunn] = case when kkhaku6_opmast in (62,71) then kkhaku6_tunn else null end
      ,[amkhakum_tunn] =null
      ,[amkhaku1_opmast] = case when kkhaku1_opmast in (62,71) then kkhaku1_opmast else null end
      ,[amkhaku2_opmast] = case when kkhaku2_opmast in (62,71) then kkhaku2_opmast else null end
      ,[amkhaku3_opmast] = case when kkhaku3_opmast in (62,71) then kkhaku3_opmast else null end
      ,[amkhaku4_opmast] = case when kkhaku4_opmast in (62,71) then kkhaku4_opmast else null end
	  ,[amkhaku5_opmast] = case when kkhaku5_opmast in (62,71) then kkhaku5_opmast else null end
	  ,[amkhaku6_opmast] = case when kkhaku6_opmast in (62,71) then kkhaku6_opmast else null end
      ,[amkhakum_opmast] = null
      ,[amkhaku1_opmopa] = case when kkhaku1_opmast in (62,71) then kkhaku1_opmopa else null end
      ,[amkhaku2_opmopa] = case when kkhaku2_opmast in (62,71) then kkhaku2_opmopa else null end
      ,[amkhaku3_opmopa] = case when kkhaku3_opmast in (62,71) then kkhaku3_opmopa else null end
      ,[amkhaku4_opmopa] = case when kkhaku4_opmast in (62,71) then kkhaku4_opmopa else null end
	  ,[amkhaku5_opmopa] = case when kkhaku5_opmast in (62,71) then kkhaku5_opmopa else null end
	  ,[amkhaku6_opmopa] = case when kkhaku6_opmast in (62,71) then kkhaku6_opmopa else null end
      ,[amkhakum_opmopa] = null
      ,[amkhaku1_opm95opa] = case when kkhaku1_opmast in (62,71) then kkhaku1_opm95opa else null end
      ,[amkhaku2_opm95opa] = case when kkhaku2_opmast in (62,71) then kkhaku2_opm95opa else null end
      ,[amkhaku3_opm95opa] = case when kkhaku3_opmast in (62,71) then kkhaku3_opm95opa else null end
      ,[amkhaku4_opm95opa] = case when kkhaku4_opmast in (62,71) then kkhaku4_opm95opa else null end
	  ,[amkhaku5_opm95opa] = case when kkhaku5_opmast in (62,71) then kkhaku5_opm95opa else null end
	  ,[amkhaku6_opm95opa] = case when kkhaku6_opmast in (62,71) then kkhaku6_opm95opa else null end
      ,[amkhakum_opm95opa] = null
      ,[amkhaku1_koultyp] = null
      ,[amkhaku2_koultyp] = null
      ,[amkhaku3_koultyp] = null
      ,[amkhaku4_koultyp] = null
      ,[amkhakum_koultyp] = null
      ,[amkhaku1_okieli] = case when kkhaku1_opmast in (62,71) then kkhaku1_okieli else null end
      ,[amkhaku2_okieli] = case when kkhaku2_opmast in (62,71) then kkhaku2_okieli else null end
      ,[amkhaku3_okieli] = case when kkhaku3_opmast in (62,71) then kkhaku3_okieli else null end
      ,[amkhaku4_okieli] = case when kkhaku4_opmast in (62,71) then kkhaku4_okieli else null end
	  ,[amkhaku5_okieli] = case when kkhaku5_opmast in (62,71) then kkhaku5_okieli else null end
	  ,[amkhaku6_okieli] = case when kkhaku6_opmast in (62,71) then kkhaku6_okieli else null end
      ,[amkhakum_okieli] = null
      ,[amkhaku1_hyv] = case when kkhaku1_opmast in (62,71) then kkhaku1_hyv else null end
      ,[amkhaku2_hyv] = case when kkhaku2_opmast in (62,71) then kkhaku2_hyv else null end
      ,[amkhaku3_hyv] = case when kkhaku3_opmast in (62,71) then kkhaku3_hyv else null end
      ,[amkhaku4_hyv] = case when kkhaku4_opmast in (62,71) then kkhaku4_hyv else null end
	  ,[amkhaku5_hyv] = case when kkhaku5_opmast in (62,71) then kkhaku5_hyv else null end
	  ,[amkhaku6_hyv] = case when kkhaku6_opmast in (62,71) then kkhaku6_hyv else null end
      ,[amkhakum_hyv] = null
      ,[amkhaku1_vastotto] = case when kkhaku1_opmast in (62,71) then kkhaku1_vastotto else null end
      ,[amkhaku2_vastotto] = case when kkhaku2_opmast in (62,71) then kkhaku2_vastotto else null end
      ,[amkhaku3_vastotto] = case when kkhaku3_opmast in (62,71) then kkhaku3_vastotto else null end
      ,[amkhaku4_vastotto] = case when kkhaku4_opmast in (62,71) then kkhaku4_vastotto else null end
	  ,[amkhaku5_vastotto] = case when kkhaku5_opmast in (62,71) then kkhaku5_vastotto else null end
	  ,[amkhaku6_vastotto] = case when kkhaku6_opmast in (62,71) then kkhaku6_vastotto else null end
      ,[amkhakum_vastotto] = null
      ,[yohakua_tunn] = case when kkhaku1_opmast in (63,72) then kkhaku1_tunn else null end
      ,[yohakub_tunn] = case when kkhaku2_opmast in (63,72) then kkhaku2_tunn else null end
      ,[yohakuc_tunn] = case when kkhaku3_opmast in (63,72) then kkhaku3_tunn else null end
      ,[yohakud_tunn] = case when kkhaku4_opmast in (63,72) then kkhaku4_tunn else null end
      ,[yohakue_tunn] = case when kkhaku5_opmast in (63,72) then kkhaku5_tunn else null end
      ,[yohakuf_tunn] = case when kkhaku6_opmast in (63,72) then kkhaku6_tunn else null end
      ,[yohakug_tunn] = null
      ,[yohakuh_tunn] = null
      ,[yohakui_tunn] = null
      ,[yohakua_opmast] = case when kkhaku1_opmast in (63,72) then kkhaku1_opmast else null end
      ,[yohakub_opmast] = case when kkhaku2_opmast in (63,72) then kkhaku2_opmast else null end
      ,[yohakuc_opmast] = case when kkhaku3_opmast in (63,72) then kkhaku3_opmast else null end
      ,[yohakud_opmast] = case when kkhaku4_opmast in (63,72) then kkhaku4_opmast else null end
      ,[yohakue_opmast] = case when kkhaku5_opmast in (63,72) then kkhaku5_opmast else null end
      ,[yohakuf_opmast] = case when kkhaku6_opmast in (63,72) then kkhaku6_opmast else null end
      ,[yohakug_opmast] = null
      ,[yohakuh_opmast] = null
      ,[yohakui_opmast] = null
      ,[yohakua_opmopa] = case when kkhaku1_opmast in (63,72) then kkhaku1_opmopa else null end
      ,[yohakub_opmopa] = case when kkhaku2_opmast in (63,72) then kkhaku2_opmopa else null end
      ,[yohakuc_opmopa] = case when kkhaku3_opmast in (63,72) then kkhaku3_opmopa else null end
      ,[yohakud_opmopa] = case when kkhaku4_opmast in (63,72) then kkhaku4_opmopa else null end
      ,[yohakue_opmopa] = case when kkhaku5_opmast in (63,72) then kkhaku5_opmopa else null end
      ,[yohakuf_opmopa] = case when kkhaku6_opmast in (63,72) then kkhaku6_opmopa else null end
      ,[yohakug_opmopa] = null
      ,[yohakuh_opmopa] = null
      ,[yohakui_opmopa] = null
      ,[yohakua_opm95opa] = case when kkhaku1_opmast in (63,72) then kkhaku1_opm95opa else null end
      ,[yohakub_opm95opa] = case when kkhaku2_opmast in (63,72) then kkhaku2_opm95opa else null end
      ,[yohakuc_opm95opa] = case when kkhaku3_opmast in (63,72) then kkhaku3_opm95opa else null end
      ,[yohakud_opm95opa] = case when kkhaku4_opmast in (63,72) then kkhaku4_opm95opa else null end
      ,[yohakue_opm95opa] = case when kkhaku5_opmast in (63,72) then kkhaku5_opm95opa else null end
      ,[yohakuf_opm95opa] = case when kkhaku6_opmast in (63,72) then kkhaku6_opm95opa else null end
      ,[yohakug_opm95opa] = null
      ,[yohakuh_opm95opa] = null
      ,[yohakui_opm95opa] = null
      ,[yohakua_hyv] = case when kkhaku1_opmast in (63,72) then kkhaku1_hyv else null end
      ,[yohakub_hyv] = case when kkhaku2_opmast in (63,72) then kkhaku2_hyv else null end
      ,[yohakuc_hyv] = case when kkhaku3_opmast in (63,72) then kkhaku3_hyv else null end
      ,[yohakud_hyv] = case when kkhaku4_opmast in (63,72) then kkhaku4_hyv else null end
      ,[yohakue_hyv] = case when kkhaku5_opmast in (63,72) then kkhaku5_hyv else null end
      ,[yohakuf_hyv] = case when kkhaku6_opmast in (63,72) then kkhaku6_hyv else null end
      ,[yohakug_hyv] = null
      ,[yohakuh_hyv] = null
      ,[yohakui_hyv] = null
      ,[yohakua_vastotto] = case when kkhaku1_opmast in (63,72) then kkhaku1_vastotto else null end
      ,[yohakub_vastotto] = case when kkhaku2_opmast in (63,72) then kkhaku2_vastotto else null end
      ,[yohakuc_vastotto] = case when kkhaku3_opmast in (63,72) then kkhaku3_vastotto else null end
      ,[yohakud_vastotto] = case when kkhaku4_opmast in (63,72) then kkhaku4_vastotto else null end
      ,[yohakue_vastotto] = case when kkhaku5_opmast in (63,72) then kkhaku5_vastotto else null end
      ,[yohakuf_vastotto] = case when kkhaku6_opmast in (63,72) then kkhaku6_vastotto else null end
      ,[yohakug_vastotto] = null
      ,[yohakuh_vastotto] = null
      ,[yohakui_vastotto] = null
      ,[yohakua_harekast] = case when kkhaku1_opmast = 63 then ''05'' when kkhaku1_opmast = 72 then ''06'' else null end
      ,[yohakub_harekast] = case when kkhaku2_opmast = 63 then ''05'' when kkhaku2_opmast = 72 then ''06'' else null end
      ,[yohakuc_harekast] = case when kkhaku3_opmast = 63 then ''05'' when kkhaku3_opmast = 72 then ''06'' else null end
      ,[yohakud_harekast] = case when kkhaku4_opmast = 63 then ''05'' when kkhaku4_opmast = 72 then ''06'' else null end
      ,[yohakue_harekast] = case when kkhaku5_opmast = 63 then ''05'' when kkhaku5_opmast = 72 then ''06'' else null end
      ,[yohakuf_harekast] = case when kkhaku6_opmast = 63 then ''05'' when kkhaku6_opmast = 72 then ''06'' else null end
      ,[yohakug_harekast] = null
      ,[yohakuh_harekast] = null
      ,[yohakui_harekast] = null
      ,[yohakua_ylempi] = null
      ,[yohakub_ylempi] = null
      ,[yohakuc_ylempi] = null
      ,[yohakud_ylempi] = null
      ,[yohakue_ylempi] = null
      ,[yohakuf_ylempi] = null
      ,[yohakug_ylempi] = null
      ,[yohakuh_ylempi] = null
      ,[yohakui_ylempi] = null
      ,[yohakua_erval] = null
      ,[yohakub_erval] = null
      ,[yohakuc_erval] = null
      ,[yohakud_erval] = null
      ,[yohakue_erval] = null
      ,[yohakuf_erval] = null
      ,[yohakug_erval] = null
      ,[yohakuh_erval] = null
      ,[yohakui_erval] = null
	  ,[kkhaku1_kaste_t2] = null
	  ,[kkhaku2_kaste_t2] = null
	  ,[kkhaku3_kaste_t2] = null
	  ,[kkhaku4_kaste_t2] = null
	  ,[kkhaku5_kaste_t2] = null
	  ,[kkhaku6_kaste_t2] = null
	  ,[kkhaku1_iscfibroad2013] = null
	  ,[kkhaku2_iscfibroad2013] = null
	  ,[kkhaku3_iscfibroad2013] = null
	  ,[kkhaku4_iscfibroad2013] = null
	  ,[kkhaku5_iscfibroad2013] = null
	  ,[kkhaku6_iscfibroad2013] = null
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]=''TK_K3_16_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_17]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast] = NULL
      ,[luammhaku2_opmast] = NULL
      ,[luammhaku3_opmast] = NULL
      ,[luammhaku4_opmast] = NULL
      ,[luammhaku5_opmast] = NULL
	  ,[luammhaku1_kaste_t2]
	  ,[luammhaku2_kaste_t2]
	  ,[luammhaku3_kaste_t2]
	  ,[luammhaku4_kaste_t2]
	  ,[luammhaku5_kaste_t2]
	  ,[luammhaku1_iscfibroad2013]
	  ,[luammhaku2_iscfibroad2013]
	  ,[luammhaku3_iscfibroad2013]
	  ,[luammhaku4_iscfibroad2013]
	  ,[luammhaku5_iscfibroad2013]
      ,[luammhaku1_opmopa] = NULL
      ,[luammhaku2_opmopa] = NULL
      ,[luammhaku3_opmopa] = NULL
      ,[luammhaku4_opmopa] = NULL
      ,[luammhaku5_opmopa] = NULL
      ,[luammhaku1_opm95opa] = NULL
      ,[luammhaku2_opm95opa] = NULL
      ,[luammhaku3_opm95opa] = NULL
      ,[luammhaku4_opm95opa] = NULL
      ,[luammhaku5_opm95opa] = NULL
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_tunn else null end
      ,[amkhaku2_tunn] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_tunn else null end
      ,[amkhaku3_tunn] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_tunn else null end
      ,[amkhaku4_tunn] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_tunn else null end
	  ,[amkhaku5_tunn] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_tunn else null end
	  ,[amkhaku6_tunn] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_tunn else null end
      ,[amkhakum_tunn] =null
      ,[amkhaku1_opmast] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_kaste_t2 else null end
      ,[amkhaku2_opmast] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_kaste_t2 else null end
      ,[amkhaku3_opmast] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_kaste_t2 else null end
      ,[amkhaku4_opmast] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_kaste_t2 else null end
	  ,[amkhaku5_opmast] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_kaste_t2 else null end
	  ,[amkhaku6_opmast] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_kaste_t2 else null end
      ,[amkhakum_opmast] = null
      ,[amkhaku1_opmopa] = null--case when kkhaku1_kaste_t2 in (62,71) then null else null end
      ,[amkhaku2_opmopa] = null--case when kkhaku2_kaste_t2 in (62,71) then null else null end
      ,[amkhaku3_opmopa] = null--case when kkhaku3_kaste_t2 in (62,71) then null else null end
      ,[amkhaku4_opmopa] = null--case when kkhaku4_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku5_opmopa] = null--case when kkhaku5_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku6_opmopa] = null--case when kkhaku6_kaste_t2 in (62,71) then null else null end
      ,[amkhakum_opmopa] = null
      ,[amkhaku1_opm95opa] = null--case when kkhaku1_kaste_t2 in (62,71) then null else null end
      ,[amkhaku2_opm95opa] = null--case when kkhaku2_kaste_t2 in (62,71) then null else null end
      ,[amkhaku3_opm95opa] = null--case when kkhaku3_kaste_t2 in (62,71) then null else null end
      ,[amkhaku4_opm95opa] = null--case when kkhaku4_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku5_opm95opa] = null--case when kkhaku5_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku6_opm95opa] = null--case when kkhaku6_kaste_t2 in (62,71) then null else null end
      ,[amkhakum_opm95opa] = null
      ,[amkhaku1_koultyp] = null
      ,[amkhaku2_koultyp] = null
      ,[amkhaku3_koultyp] = null
      ,[amkhaku4_koultyp] = null
      ,[amkhakum_koultyp] = null
      ,[amkhaku1_okieli] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_okieli else null end
      ,[amkhaku2_okieli] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_okieli else null end
      ,[amkhaku3_okieli] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_okieli else null end
      ,[amkhaku4_okieli] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_okieli else null end
	  ,[amkhaku5_okieli] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_okieli else null end
	  ,[amkhaku6_okieli] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_okieli else null end
      ,[amkhakum_okieli] = null
      ,[amkhaku1_hyv] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_hyv else null end
      ,[amkhaku2_hyv] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_hyv else null end
      ,[amkhaku3_hyv] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_hyv else null end
      ,[amkhaku4_hyv] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_hyv else null end
	  ,[amkhaku5_hyv] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_hyv else null end
	  ,[amkhaku6_hyv] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_hyv else null end
      ,[amkhakum_hyv] = null
      ,[amkhaku1_vastotto] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_vastotto else null end
      ,[amkhaku2_vastotto] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_vastotto else null end
      ,[amkhaku3_vastotto] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_vastotto else null end
      ,[amkhaku4_vastotto] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_vastotto else null end
	  ,[amkhaku5_vastotto] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_vastotto else null end
	  ,[amkhaku6_vastotto] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_vastotto else null end
      ,[amkhakum_vastotto] = null
      ,[yohakua_tunn] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_tunn else null end
      ,[yohakub_tunn] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_tunn else null end
      ,[yohakuc_tunn] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_tunn else null end
      ,[yohakud_tunn] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_tunn else null end
      ,[yohakue_tunn] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_tunn else null end
      ,[yohakuf_tunn] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_tunn else null end
      ,[yohakug_tunn] = null
      ,[yohakuh_tunn] = null
      ,[yohakui_tunn] = null
      ,[yohakua_opmast] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_kaste_t2 else null end
      ,[yohakub_opmast] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_kaste_t2 else null end
      ,[yohakuc_opmast] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_kaste_t2 else null end
      ,[yohakud_opmast] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_kaste_t2 else null end
      ,[yohakue_opmast] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_kaste_t2 else null end
      ,[yohakuf_opmast] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_kaste_t2 else null end
      ,[yohakug_opmast] = null
      ,[yohakuh_opmast] = null
      ,[yohakui_opmast] = null
      ,[yohakua_opmopa] = null--case when kkhaku1_kaste_t2 in (63,72) then null else null end
      ,[yohakub_opmopa] = null--case when kkhaku2_kaste_t2 in (63,72) then null else null end
      ,[yohakuc_opmopa] = null--case when kkhaku3_kaste_t2 in (63,72) then null else null end
      ,[yohakud_opmopa] = null--case when kkhaku4_kaste_t2 in (63,72) then null else null end
      ,[yohakue_opmopa] = null--case when kkhaku5_kaste_t2 in (63,72) then null else null end
      ,[yohakuf_opmopa] = null--case when kkhaku6_kaste_t2 in (63,72) then null else null end
      ,[yohakug_opmopa] = null
      ,[yohakuh_opmopa] = null
      ,[yohakui_opmopa] = null
      ,[yohakua_opm95opa] = null--case when kkhaku1_kaste_t2 in (63,72) then null else null end
      ,[yohakub_opm95opa] = null--case when kkhaku2_kaste_t2 in (63,72) then null else null end
      ,[yohakuc_opm95opa] = null--case when kkhaku3_kaste_t2 in (63,72) then null else null end
      ,[yohakud_opm95opa] = null--case when kkhaku4_kaste_t2 in (63,72) then null else null end
      ,[yohakue_opm95opa] = null--case when kkhaku5_kaste_t2 in (63,72) then null else null end
      ,[yohakuf_opm95opa] = null--case when kkhaku6_kaste_t2 in (63,72) then null else null end
      ,[yohakug_opm95opa] = null
      ,[yohakuh_opm95opa] = null
      ,[yohakui_opm95opa] = null
      ,[yohakua_hyv] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_hyv else null end
      ,[yohakub_hyv] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_hyv else null end
      ,[yohakuc_hyv] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_hyv else null end
      ,[yohakud_hyv] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_hyv else null end
      ,[yohakue_hyv] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_hyv else null end
      ,[yohakuf_hyv] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_hyv else null end
      ,[yohakug_hyv] = null
      ,[yohakuh_hyv] = null
      ,[yohakui_hyv] = null
      ,[yohakua_vastotto] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_vastotto else null end
      ,[yohakub_vastotto] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_vastotto else null end
      ,[yohakuc_vastotto] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_vastotto else null end
      ,[yohakud_vastotto] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_vastotto else null end
      ,[yohakue_vastotto] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_vastotto else null end
      ,[yohakuf_vastotto] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_vastotto else null end
      ,[yohakug_vastotto] = null
      ,[yohakuh_vastotto] = null
      ,[yohakui_vastotto] = null
      ,[yohakua_harekast] = case when kkhaku1_kaste_t2 = 63 then ''05'' when kkhaku1_kaste_t2 = 72 then ''06'' else null end
      ,[yohakub_harekast] = case when kkhaku2_kaste_t2 = 63 then ''05'' when kkhaku2_kaste_t2 = 72 then ''06'' else null end
      ,[yohakuc_harekast] = case when kkhaku3_kaste_t2 = 63 then ''05'' when kkhaku3_kaste_t2 = 72 then ''06'' else null end
      ,[yohakud_harekast] = case when kkhaku4_kaste_t2 = 63 then ''05'' when kkhaku4_kaste_t2 = 72 then ''06'' else null end
      ,[yohakue_harekast] = case when kkhaku5_kaste_t2 = 63 then ''05'' when kkhaku5_kaste_t2 = 72 then ''06'' else null end
      ,[yohakuf_harekast] = case when kkhaku6_kaste_t2 = 63 then ''05'' when kkhaku6_kaste_t2 = 72 then ''06'' else null end
      ,[yohakug_harekast] = null
      ,[yohakuh_harekast] = null
      ,[yohakui_harekast] = null
      ,[yohakua_ylempi] = null
      ,[yohakub_ylempi] = null
      ,[yohakuc_ylempi] = null
      ,[yohakud_ylempi] = null
      ,[yohakue_ylempi] = null
      ,[yohakuf_ylempi] = null
      ,[yohakug_ylempi] = null
      ,[yohakuh_ylempi] = null
      ,[yohakui_ylempi] = null
      ,[yohakua_erval] = null
      ,[yohakub_erval] = null
      ,[yohakuc_erval] = null
      ,[yohakud_erval] = null
      ,[yohakue_erval] = null
      ,[yohakuf_erval] = null
      ,[yohakug_erval] = null
      ,[yohakuh_erval] = null
      ,[yohakui_erval] = null
	  ,[kkhaku1_kaste_t2]
	  ,[kkhaku2_kaste_t2]
	  ,[kkhaku3_kaste_t2]
	  ,[kkhaku4_kaste_t2]
	  ,[kkhaku5_kaste_t2]
	  ,[kkhaku6_kaste_t2]
	  ,[kkhaku1_iscfibroad2013]
	  ,[kkhaku2_iscfibroad2013]
	  ,[kkhaku3_iscfibroad2013]
	  ,[kkhaku4_iscfibroad2013]
	  ,[kkhaku5_iscfibroad2013]
	  ,[kkhaku6_iscfibroad2013]
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]=''TK_K3_16_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_18]

UNION ALL

SELECT [tilv]
      ,[allk]
      ,[luammhaku1_tunn]
      ,[luammhaku2_tunn]
      ,[luammhaku3_tunn]
      ,[luammhaku4_tunn]
      ,[luammhaku5_tunn]
      ,[luammhaku1_opmast] = NULL
      ,[luammhaku2_opmast] = NULL
      ,[luammhaku3_opmast] = NULL
      ,[luammhaku4_opmast] = NULL
      ,[luammhaku5_opmast] = NULL
	  ,[luammhaku1_kaste_t2]
	  ,[luammhaku2_kaste_t2]
	  ,[luammhaku3_kaste_t2]
	  ,[luammhaku4_kaste_t2]
	  ,[luammhaku5_kaste_t2]
	  ,[luammhaku1_iscfibroad2013]
	  ,[luammhaku2_iscfibroad2013]
	  ,[luammhaku3_iscfibroad2013]
	  ,[luammhaku4_iscfibroad2013]
	  ,[luammhaku5_iscfibroad2013]
      ,[luammhaku1_opmopa] = NULL
      ,[luammhaku2_opmopa] = NULL
      ,[luammhaku3_opmopa] = NULL
      ,[luammhaku4_opmopa] = NULL
      ,[luammhaku5_opmopa] = NULL
      ,[luammhaku1_opm95opa] = NULL
      ,[luammhaku2_opm95opa] = NULL
      ,[luammhaku3_opm95opa] = NULL
      ,[luammhaku4_opm95opa] = NULL
      ,[luammhaku5_opm95opa] = NULL
      ,[luammhaku1_okieli]
      ,[luammhaku2_okieli]
      ,[luammhaku3_okieli]
      ,[luammhaku4_okieli]
      ,[luammhaku5_okieli]
      ,[luammhaku1_hyv]
      ,[luammhaku2_hyv]
      ,[luammhaku3_hyv]
      ,[luammhaku4_hyv]
      ,[luammhaku5_hyv]
      ,[luammhaku1_vastotto]
      ,[luammhaku2_vastotto]
      ,[luammhaku3_vastotto]
      ,[luammhaku4_vastotto]
      ,[luammhaku5_vastotto]
      ,[amkhaku1_tunn] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_tunn else null end
      ,[amkhaku2_tunn] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_tunn else null end
      ,[amkhaku3_tunn] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_tunn else null end
      ,[amkhaku4_tunn] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_tunn else null end
	  ,[amkhaku5_tunn] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_tunn else null end
	  ,[amkhaku6_tunn] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_tunn else null end
      ,[amkhakum_tunn] =null
      ,[amkhaku1_opmast] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_kaste_t2 else null end
      ,[amkhaku2_opmast] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_kaste_t2 else null end
      ,[amkhaku3_opmast] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_kaste_t2 else null end
      ,[amkhaku4_opmast] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_kaste_t2 else null end
	  ,[amkhaku5_opmast] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_kaste_t2 else null end
	  ,[amkhaku6_opmast] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_kaste_t2 else null end
      ,[amkhakum_opmast] = null
      ,[amkhaku1_opmopa] = null--case when kkhaku1_kaste_t2 in (62,71) then null else null end
      ,[amkhaku2_opmopa] = null--case when kkhaku2_kaste_t2 in (62,71) then null else null end
      ,[amkhaku3_opmopa] = null--case when kkhaku3_kaste_t2 in (62,71) then null else null end
      ,[amkhaku4_opmopa] = null--case when kkhaku4_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku5_opmopa] = null--case when kkhaku5_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku6_opmopa] = null--case when kkhaku6_kaste_t2 in (62,71) then null else null end
      ,[amkhakum_opmopa] = null
      ,[amkhaku1_opm95opa] = null--case when kkhaku1_kaste_t2 in (62,71) then null else null end
      ,[amkhaku2_opm95opa] = null--case when kkhaku2_kaste_t2 in (62,71) then null else null end
      ,[amkhaku3_opm95opa] = null--case when kkhaku3_kaste_t2 in (62,71) then null else null end
      ,[amkhaku4_opm95opa] = null--case when kkhaku4_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku5_opm95opa] = null--case when kkhaku5_kaste_t2 in (62,71) then null else null end
	  ,[amkhaku6_opm95opa] = null--case when kkhaku6_kaste_t2 in (62,71) then null else null end
      ,[amkhakum_opm95opa] = null
      ,[amkhaku1_koultyp] = null
      ,[amkhaku2_koultyp] = null
      ,[amkhaku3_koultyp] = null
      ,[amkhaku4_koultyp] = null
      ,[amkhakum_koultyp] = null
      ,[amkhaku1_okieli] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_okieli else null end
      ,[amkhaku2_okieli] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_okieli else null end
      ,[amkhaku3_okieli] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_okieli else null end
      ,[amkhaku4_okieli] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_okieli else null end
	  ,[amkhaku5_okieli] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_okieli else null end
	  ,[amkhaku6_okieli] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_okieli else null end
      ,[amkhakum_okieli] = null
      ,[amkhaku1_hyv] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_hyv else null end
      ,[amkhaku2_hyv] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_hyv else null end
      ,[amkhaku3_hyv] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_hyv else null end
      ,[amkhaku4_hyv] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_hyv else null end
	  ,[amkhaku5_hyv] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_hyv else null end
	  ,[amkhaku6_hyv] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_hyv else null end
      ,[amkhakum_hyv] = null
      ,[amkhaku1_vastotto] = case when kkhaku1_kaste_t2 in (62,71) then kkhaku1_vastotto else null end
      ,[amkhaku2_vastotto] = case when kkhaku2_kaste_t2 in (62,71) then kkhaku2_vastotto else null end
      ,[amkhaku3_vastotto] = case when kkhaku3_kaste_t2 in (62,71) then kkhaku3_vastotto else null end
      ,[amkhaku4_vastotto] = case when kkhaku4_kaste_t2 in (62,71) then kkhaku4_vastotto else null end
	  ,[amkhaku5_vastotto] = case when kkhaku5_kaste_t2 in (62,71) then kkhaku5_vastotto else null end
	  ,[amkhaku6_vastotto] = case when kkhaku6_kaste_t2 in (62,71) then kkhaku6_vastotto else null end
      ,[amkhakum_vastotto] = null
      ,[yohakua_tunn] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_tunn else null end
      ,[yohakub_tunn] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_tunn else null end
      ,[yohakuc_tunn] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_tunn else null end
      ,[yohakud_tunn] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_tunn else null end
      ,[yohakue_tunn] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_tunn else null end
      ,[yohakuf_tunn] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_tunn else null end
      ,[yohakug_tunn] = null
      ,[yohakuh_tunn] = null
      ,[yohakui_tunn] = null
      ,[yohakua_opmast] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_kaste_t2 else null end
      ,[yohakub_opmast] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_kaste_t2 else null end
      ,[yohakuc_opmast] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_kaste_t2 else null end
      ,[yohakud_opmast] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_kaste_t2 else null end
      ,[yohakue_opmast] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_kaste_t2 else null end
      ,[yohakuf_opmast] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_kaste_t2 else null end
      ,[yohakug_opmast] = null
      ,[yohakuh_opmast] = null
      ,[yohakui_opmast] = null
      ,[yohakua_opmopa] = null--case when kkhaku1_kaste_t2 in (63,72) then null else null end
      ,[yohakub_opmopa] = null--case when kkhaku2_kaste_t2 in (63,72) then null else null end
      ,[yohakuc_opmopa] = null--case when kkhaku3_kaste_t2 in (63,72) then null else null end
      ,[yohakud_opmopa] = null--case when kkhaku4_kaste_t2 in (63,72) then null else null end
      ,[yohakue_opmopa] = null--case when kkhaku5_kaste_t2 in (63,72) then null else null end
      ,[yohakuf_opmopa] = null--case when kkhaku6_kaste_t2 in (63,72) then null else null end
      ,[yohakug_opmopa] = null
      ,[yohakuh_opmopa] = null
      ,[yohakui_opmopa] = null
      ,[yohakua_opm95opa] = null--case when kkhaku1_kaste_t2 in (63,72) then null else null end
      ,[yohakub_opm95opa] = null--case when kkhaku2_kaste_t2 in (63,72) then null else null end
      ,[yohakuc_opm95opa] = null--case when kkhaku3_kaste_t2 in (63,72) then null else null end
      ,[yohakud_opm95opa] = null--case when kkhaku4_kaste_t2 in (63,72) then null else null end
      ,[yohakue_opm95opa] = null--case when kkhaku5_kaste_t2 in (63,72) then null else null end
      ,[yohakuf_opm95opa] = null--case when kkhaku6_kaste_t2 in (63,72) then null else null end
      ,[yohakug_opm95opa] = null
      ,[yohakuh_opm95opa] = null
      ,[yohakui_opm95opa] = null
      ,[yohakua_hyv] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_hyv else null end
      ,[yohakub_hyv] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_hyv else null end
      ,[yohakuc_hyv] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_hyv else null end
      ,[yohakud_hyv] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_hyv else null end
      ,[yohakue_hyv] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_hyv else null end
      ,[yohakuf_hyv] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_hyv else null end
      ,[yohakug_hyv] = null
      ,[yohakuh_hyv] = null
      ,[yohakui_hyv] = null
      ,[yohakua_vastotto] = case when kkhaku1_kaste_t2 in (63,72) then kkhaku1_vastotto else null end
      ,[yohakub_vastotto] = case when kkhaku2_kaste_t2 in (63,72) then kkhaku2_vastotto else null end
      ,[yohakuc_vastotto] = case when kkhaku3_kaste_t2 in (63,72) then kkhaku3_vastotto else null end
      ,[yohakud_vastotto] = case when kkhaku4_kaste_t2 in (63,72) then kkhaku4_vastotto else null end
      ,[yohakue_vastotto] = case when kkhaku5_kaste_t2 in (63,72) then kkhaku5_vastotto else null end
      ,[yohakuf_vastotto] = case when kkhaku6_kaste_t2 in (63,72) then kkhaku6_vastotto else null end
      ,[yohakug_vastotto] = null
      ,[yohakuh_vastotto] = null
      ,[yohakui_vastotto] = null
      ,[yohakua_harekast] = case when kkhaku1_kaste_t2 = 63 then ''05'' when kkhaku1_kaste_t2 = 72 then ''06'' else null end
      ,[yohakub_harekast] = case when kkhaku2_kaste_t2 = 63 then ''05'' when kkhaku2_kaste_t2 = 72 then ''06'' else null end
      ,[yohakuc_harekast] = case when kkhaku3_kaste_t2 = 63 then ''05'' when kkhaku3_kaste_t2 = 72 then ''06'' else null end
      ,[yohakud_harekast] = case when kkhaku4_kaste_t2 = 63 then ''05'' when kkhaku4_kaste_t2 = 72 then ''06'' else null end
      ,[yohakue_harekast] = case when kkhaku5_kaste_t2 = 63 then ''05'' when kkhaku5_kaste_t2 = 72 then ''06'' else null end
      ,[yohakuf_harekast] = case when kkhaku6_kaste_t2 = 63 then ''05'' when kkhaku6_kaste_t2 = 72 then ''06'' else null end
      ,[yohakug_harekast] = null
      ,[yohakuh_harekast] = null
      ,[yohakui_harekast] = null
      ,[yohakua_ylempi] = null
      ,[yohakub_ylempi] = null
      ,[yohakuc_ylempi] = null
      ,[yohakud_ylempi] = null
      ,[yohakue_ylempi] = null
      ,[yohakuf_ylempi] = null
      ,[yohakug_ylempi] = null
      ,[yohakuh_ylempi] = null
      ,[yohakui_ylempi] = null
      ,[yohakua_erval] = null
      ,[yohakub_erval] = null
      ,[yohakuc_erval] = null
      ,[yohakud_erval] = null
      ,[yohakue_erval] = null
      ,[yohakuf_erval] = null
      ,[yohakug_erval] = null
      ,[yohakuh_erval] = null
      ,[yohakui_erval] = null
	  ,[kkhaku1_kaste_t2]
	  ,[kkhaku2_kaste_t2]
	  ,[kkhaku3_kaste_t2]
	  ,[kkhaku4_kaste_t2]
	  ,[kkhaku5_kaste_t2]
	  ,[kkhaku6_kaste_t2]
	  ,[kkhaku1_iscfibroad2013]
	  ,[kkhaku2_iscfibroad2013]
	  ,[kkhaku3_iscfibroad2013]
	  ,[kkhaku4_iscfibroad2013]
	  ,[kkhaku5_iscfibroad2013]
	  ,[kkhaku6_iscfibroad2013]
      ,[luhakux]
      ,[luhaku2x]
      ,[luhaku3x]
      ,[ammhakux]
      ,[ammhaku2x]
      ,[ammhaku3x]
      ,[amkhakux]
      ,[amkhaku2x]
      ,[amkhaku3x]
      ,[yohakux]
      ,[yohaku2x]
      ,[yohaku3x]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[tilvaskunx]
      ,[kansalr1]
      ,[aikyotutk]
      ,[aikyotutkkoulk]
      ,[suvuosiyotutk]
      ,[tunnyotutk]
      ,[aikamm]
      ,[aikammkoulk]
      ,[suvuosiamm]
      ,[tunnamm]
      ,[aikamk]
      ,[aikamkkoulk]
      ,[suvuosiamk]
      ,[tunnamk]
      ,[aikylamk]
      ,[aikylamkkoulk]
      ,[suvuosiylamk]
      ,[tunnylamk]
      ,[aikalkk]
      ,[aikalkkkoulk]
      ,[suvuosialkk]
      ,[tunnalkk]
      ,[aikylkk]
      ,[aikylkkkoulk]
      ,[suvuosiylkk]
      ,[tunnylkk]
      ,[aiklistri]
      ,[aiklistrikoulk]
      ,[suvuosilistri]
      ,[tunnlistri]
      ,[yotutkopisx]
      ,[yotutkopisxkoulk]
      ,[yotutkopisxtunn]
      ,[ammopisx]
      ,[ammopisxkoulk]
      ,[ammopisxtunn]
      ,[amkopisx1]
      ,[amkopisxkoulk1]
      ,[amkopisxtunn1]
      ,[amkopisx2]
      ,[amkopisxkoulk2]
      ,[amkopisxtunn2]
      ,[amkopisx3]
      ,[amkopisxkoulk3]
      ,[amkopisxtunn3]
      ,[yoopisx1]
      ,[yoopisxkoulk1]
      ,[yoopisxtunn1]
      ,[yoopisx2]
      ,[yoopisxkoulk2]
      ,[yoopisxtunn2]
      ,[yoopisx3]
      ,[yoopisxkoulk3]
      ,[yoopisxtunn3]
      ,[ptoim1r3x]
      ,[htok]
      ,[lkm]
      ,[tietolahde]=''TK_K3_16_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_16_sopv_19]

) kaikkivuodet







' 
GO
/****** Object:  View [dbo].[v_sa_K4_22_Yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_K4_22_Yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[v_sa_K4_22_Yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan] AS

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013] 
	  ,[kaste_t2] 
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''K4_22_sopv_14''
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_14_H]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013] 
	  ,[kaste_t2] 
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''K4_22_sopv_15''
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_15_H]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
	  ,[kaste_t2] 
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''K4_22_sopv_16''
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_16_H]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013] 
	  ,[kaste_t2] 
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''K4_22_sopv_17''
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_17_H]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''K4_22_sopv_18''
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_18]

UNION ALL

SELECT [tilv]
      ,[aikieli]
      ,[tilvaskun]
      ,[ikar5]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''K4_22_sopv_19''
FROM [TK_H9098_CSC].[dbo].[TK_K4_22_sopv_19]








' 
GO
/****** Object:  View [dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat] AS 
/*
drop table  [VipunenTK_DW].[dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]
select * into [VipunenTK_DW].[dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat] from [VipunenTK_SA].[dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]

truncate table  [VipunenTK_DW].[dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]
insert into [VipunenTK_DW].[dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]
 select * from   [VipunenTK_SA].[dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]
*/

SELECT [tilv]
      ,[svalt] = Case when svalt in (''991'', ''997'', ''998'') then ''-1'' else svalt end --Dimensiossa ei ole etunollia
      ,[kansal] = Case when kansal in (''991'', ''997'', ''998'') then ''-1'' else kansal end --Dimensiossa ei ole etunollia
      ,[sp]
      ,ikar5 = ltrim([ikar])
      ,[maakunta]
      ,[ptoim1]
      ,[koulk] = ISNULL(koulk, ''-1'')
      ,[suorv]
      ,[suormaak] = ISNULL(NULLIF(suormaak, ''99''), ''-1'')
      ,[amm2010_2] = CASE WHEN left(amm2010_2, 1) = ''X'' then -1 when amm2010_2 is null then -1 else amm2010_2 end
      ,[tmaak] = ISNULL(NULLIF(tmaak, ''99''), ''-1'')
      ,[tol2008_akatemia] = ISNULL(NULLIF([tol2008_akatemia], ''99''), ''-1'')
      ,[tsekt_2] = ISNULL([tsekt_2], ''0'')
	  ,[ta_vaihdos] = ISNULL([ta_vaihdos],''-1'')
	  ,[sl] = ISNULL([sl],''-1'')
	  ,[tol2008_tthv_ed] = ISNULL(NULLIF([tol2008_tthv_ed], ''99''), ''-1'')
	  ,[tsekt_ed] = ISNULL([tsekt_ed],''0'')
      ,[lkm]
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
FROM ( --kaikkivuodet

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar]
      ,[maakunta]
      ,[ptoim1] = ''-1''
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_akatemia]
      ,[tsekt_2]
	  ,[ta_vaihdos] = null
	  ,[sl] = null
	  ,[tol2008_tthv_ed] = null
	  ,[tsekt_ed] = null
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_K5_5_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_15]
  WHERE tilv in (''2008'', ''2009'', ''2010'')

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos] = null
	  ,[sl] = null
	  ,[tol2008_tthv_ed] = null
	  ,[tsekt_ed] = null
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_K5_5_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_16]
  WHERE tilv in (''2011'', ''2012'', ''2013'')

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_K5_5_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_17]
WHERE tilv = ''2014''

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_K5_5_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_18]
WHERE tilv = ''2015''

UNION ALL

SELECT [tilv]
      ,[svalt]
      ,[kansal]
      ,[sp]
      ,[ikar5]
      ,[maakunta]
      ,[ptoim1]
      ,[koulk]
      ,[suorv]
      ,[suormaak]
      ,[amm2010_2]
      ,[tmaak]
      ,[tol2008_tthv]
      ,[tsekt_2]
	  ,[ta_vaihdos]
	  ,[sl]
	  ,[tol2008_tthv_ed]
	  ,[tsekt_ed]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_K5_5_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, svalt, sp, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K5_5_sopv_19]
WHERE tilv = ''2016''

 ) kaikkivuodet


' 
GO
/****** Object:  View [dbo].[v_sa_R2_22_Oppilaitostason_oppil_ja_opisk]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_R2_22_Oppilaitostason_oppil_ja_opisk]'))
EXEC dbo.sp_executesql @statement = N'








CREATE VIEW [dbo].[v_sa_R2_22_Oppilaitostason_oppil_ja_opisk] AS
--Select * from [v_sa_R2_22_Oppilaitostason_oppil_ja_opisk]
/*
Drop table VipunenTK_DW.[dbo].f_R2_22_Oppilaitostason_oppil_ja_opisk

truncate table VipunenTK_DW.[dbo].f_R2_22_Oppilaitostason_oppil_ja_opisk
insert into VipunenTK_DW.[dbo].f_R2_22_Oppilaitostason_oppil_ja_opisk select * from v_sa_R2_22_Oppilaitostason_oppil_ja_opisk

Select * from [v_sa_R2_22_Peruskoulutiedosto]
*/

SELECT [tilv] = CAST(tilv as nvarchar(4))
	  ,[tilv_date] = Cast(tilv+''0101'' as date)
      ,[jarj] = CAST(jarj as nvarchar(10))
      ,[tiedtype] = CAST(tiedtype as nchar(1))
      ,[tunn] = CAST(tunn as nvarchar(5))
      ,[edesi] = CAST([edesi] as nchar(1))
      ,[edala] = CAST([edala] as nchar(1))
      ,[edyla] = CAST([edyla] as nchar(1))
      ,[edlisa] = CAST([edlisa] as nchar(1))
      ,[edainep] = CAST([edainep] as nchar(1))
      ,[syesi] = CAST([syesi] as nchar(1))
      ,[syala] = CAST([syala] as nchar(1))
      ,[syyla] = CAST([syyla] as nchar(1))
      ,[sylisa] = CAST([sylisa] as nchar(1))
      ,[symamu] = CAST([symamu] as nchar(1))
      ,[sylukio] = CAST([sylukio] as nchar(1))
      ,[syamm] = CAST([syamm] as nchar(1))
      ,[symuu] = CAST([symuu] as nchar(1))

      ,[keven]=  Cast([keven] as int)
      ,[kev1]=  Cast([kev1] as int)
      ,[kev1n]=  Cast([kev1n] as int)
      ,[kev2]=  Cast([kev2] as int)
      ,[kev2n]=  Cast([kev2n] as int)
      ,[kev3]=  Cast([kev3] as int)
      ,[kev3n]=  Cast([kev3n] as int)
      ,[kev4]=  Cast([kev4] as int)
      ,[kev4n]=  Cast([kev4n] as int)
      ,[kev5]=  Cast([kev5] as int)
      ,[kev5n]=  Cast([kev5n] as int)
      ,[kev6]=  Cast([kev6] as int)
      ,[kev6n]=  Cast([kev6n] as int)
      ,[kev7]=  Cast([kev7] as int)
      ,[kev7n]=  Cast([kev7n] as int)
      ,[kev8]=  Cast([kev8] as int)
      ,[kev8n]=  Cast([kev8n] as int)
      ,[kev9]=  Cast([kev9] as int)
      ,[kev9n]=  Cast([kev9n] as int)
      ,[kev10]=  Cast([kev10] as int)
      ,[kev10n]=  Cast([kev10n] as int)
      ,[kev]=  Cast([kev] as int)
      ,[kevn]=  Cast([kevn] as int)
      ,[luok1]=  Cast([luok1] as int)
      ,[luok1n]=  Cast([luok1n] as int)
      ,[luok2]=  Cast([luok2] as int)
      ,[luok2n]=  Cast([luok2n] as int)
      ,[luok3]=  Cast([luok3] as int)
      ,[luok3n]=  Cast([luok3n] as int)
      ,[luok4]=  Cast([luok4] as int)
      ,[luok4n]=  Cast([luok4n] as int)
      ,[luok5]=  Cast([luok5] as int)
      ,[luok5n]=  Cast([luok5n] as int)
      ,[luok6]=  Cast([luok6] as int)
      ,[luok6n]=  Cast([luok6n] as int)
      ,[luok7]=  Cast([luok7] as int)
      ,[luok7n]=  Cast([luok7n] as int)
      ,[luok8]=  Cast([luok8] as int)
      ,[luok8n]=  Cast([luok8n] as int)
      ,[luok9]=  Cast([luok9] as int)
      ,[luok9n]=  Cast([luok9n] as int)
      ,[luok]=  Cast([luok] as int)
      ,[luokn]=  Cast([luokn] as int)
      ,[kelaim]=  Cast([kelaim] as int)
      ,[kelaimn]=  Cast([kelaimn] as int)
      ,[tod]=  Cast([tod] as int)
      ,[todn]=  Cast([todn] as int)
      ,[tutkt]=  Cast([tutkt] as int)
      ,[tutktn]=  Cast([tutktn] as int)
      ,[suor10]=  Cast([suor10] as int)
      ,[suor10n]=  Cast([suor10n] as int)
      ,[oeriy]=  Cast([oeriy] as int)
      ,[oeriyn]=  Cast([oeriyn] as int)
      ,[ilmtod]=  Cast([ilmtod] as int)
      ,[ilmtodn]=  Cast([ilmtodn] as int)

      ,[aku] = CAST(aku as nchar(1))

      ,[mamukurs]=  Cast([mamukurs] as int)
      ,[oppkurs]=  Cast([oppkurs] as int)
      ,[muukurs]=  Cast([muukurs] as int)
      ,[akukurs]=  Cast([akukurs] as int)
      ,[kmamu]=  Cast([kmamu] as int)
      ,[kmamun]=  Cast([kmamun] as int)
      ,[syulkom]=  Cast([syulkom] as int)
      ,[syulkomn]=  Cast([syulkomn] as int)
      ,[sykoti]=  Cast([sykoti] as int)
      ,[sykotin]=  Cast([sykotin] as int)
      ,[ika4e]=  Cast([ika4e] as int)
      ,[ika4en]=  Cast([ika4en] as int)
      ,[ika5e]=  Cast([ika5e] as int)
      ,[ika5en]=  Cast([ika5en] as int)
      ,[pid5v]=  Cast([pid5v] as int)
      ,[ika6e]=  Cast([ika6e] as int)
      ,[ika6en]=  Cast([ika6en] as int)
      ,[ika7e]=  Cast([ika7e] as int)
      ,[ika7en]=  Cast([ika7en] as int)
      ,[ikae]=  Cast([ikae] as int)
      ,[ikaen]=  Cast([ikaen] as int)
      ,[ove]=  Cast([ove] as int)
      ,[ov1]=  Cast([ov1] as int)
      ,[ov2]=  Cast([ov2] as int)
      ,[ov3]=  Cast([ov3] as int)
      ,[ov4]=  Cast([ov4] as int)
      ,[ov5]=  Cast([ov5] as int)
      ,[ov6]=  Cast([ov6] as int)
      ,[ov7]=  Cast([ov7] as int)
      ,[ov8]=  Cast([ov8] as int)
      ,[ov9]=  Cast([ov9] as int)
      ,[ov10]=  Cast([ov10] as int)
      ,[ovy]=  Cast([ovy] as int)
      ,[tehoe]=  Cast([tehoe] as int)
      ,[teho1]=  Cast([teho1] as int)
      ,[teho2]=  Cast([teho2] as int)
      ,[teho3]=  Cast([teho3] as int)
      ,[teho4]=  Cast([teho4] as int)
      ,[teho5]=  Cast([teho5] as int)
      ,[teho6]=  Cast([teho6] as int)
      ,[teho7]=  Cast([teho7] as int)
      ,[teho8]=  Cast([teho8] as int)
      ,[teho9]=  Cast([teho9] as int)
      ,[teho10]=  Cast([teho10] as int)
      ,[tehoy]=  Cast([tehoy] as int)
      ,[eipide]=  Cast([eipide] as int)
      ,[eipid1]=  Cast([eipid1] as int)
      ,[eipid2]=  Cast([eipid2] as int)
      ,[eipid3]=  Cast([eipid3] as int)
      ,[eipid4]=  Cast([eipid4] as int)
      ,[eipid5]=  Cast([eipid5] as int)
      ,[eipid6]=  Cast([eipid6] as int)
      ,[eipid7]=  Cast([eipid7] as int)
      ,[eipid8]=  Cast([eipid8] as int)
      ,[eipid9]=  Cast([eipid9] as int)
      ,[eipid10]=  Cast([eipid10] as int)
      ,[eipidy]=  Cast([eipidy] as int)
      ,[ertuve]=  Cast([ertuve] as int)
      ,[ertuv1]=  Cast([ertuv1] as int)
      ,[ertuv2]=  Cast([ertuv2] as int)
      ,[ertuv3]=  Cast([ertuv3] as int)
      ,[ertuv4]=  Cast([ertuv4] as int)
      ,[ertuv5]=  Cast([ertuv5] as int)
      ,[ertuv6]=  Cast([ertuv6] as int)
      ,[ertuv7]=  Cast([ertuv7] as int)
      ,[ertuv8]=  Cast([ertuv8] as int)
      ,[ertuv9]=  Cast([ertuv9] as int)
      ,[ertuv10]=  Cast([ertuv10] as int)
      ,[ertuvy]=  Cast([ertuvy] as int)
      ,[ertume]=  Cast([ertume] as int)
      ,[ertum1]=  Cast([ertum1] as int)
      ,[ertum2]=  Cast([ertum2] as int)
      ,[ertum3]=  Cast([ertum3] as int)
      ,[ertum4]=  Cast([ertum4] as int)
      ,[ertum5]=  Cast([ertum5] as int)
      ,[ertum6]=  Cast([ertum6] as int)
      ,[ertum7]=  Cast([ertum7] as int)
      ,[ertum8]=  Cast([ertum8] as int)
      ,[ertum9]=  Cast([ertum9] as int)
      ,[ertum10]=  Cast([ertum10] as int)
      ,[ertumy]=  Cast([ertumy] as int)
      ,[tavove]=  Cast([tavove] as int)
      ,[tavov1]=  Cast([tavov1] as int)
      ,[tavov2]=  Cast([tavov2] as int)
      ,[tavov3]=  Cast([tavov3] as int)
      ,[tavov4]=  Cast([tavov4] as int)
      ,[tavov5]=  Cast([tavov5] as int)
      ,[tavov6]=  Cast([tavov6] as int)
      ,[tavov7]=  Cast([tavov7] as int)
      ,[tavov8]=  Cast([tavov8] as int)
      ,[tavov9]=  Cast([tavov9] as int)
      ,[tavov10]=  Cast([tavov10] as int)
      ,[tavovy]=  Cast([tavovy] as int)
      ,[oven]=  Cast([oven] as int)
      ,[ov1n]=  Cast([ov1n] as int)
      ,[ov2n]=  Cast([ov2n] as int)
      ,[ov3n]=  Cast([ov3n] as int)
      ,[ov4n]=  Cast([ov4n] as int)
      ,[ov5n]=  Cast([ov5n] as int)
      ,[ov6n]=  Cast([ov6n] as int)
      ,[ov7n]=  Cast([ov7n] as int)
      ,[ov8n]=  Cast([ov8n] as int)
      ,[ov9n]=  Cast([ov9n] as int)
      ,[ov10n]=  Cast([ov10n] as int)
      ,[ovyn]=  Cast([ovyn] as int)
      ,[tehoen]=  Cast([tehoen] as int)
      ,[teho1n]=  Cast([teho1n] as int)
      ,[teho2n]=  Cast([teho2n] as int)
      ,[teho3n]=  Cast([teho3n] as int)
      ,[teho4n]=  Cast([teho4n] as int)
      ,[teho5n]=  Cast([teho5n] as int)
      ,[teho6n]=  Cast([teho6n] as int)
      ,[teho7n]=  Cast([teho7n] as int)
      ,[teho8n]=  Cast([teho8n] as int)
      ,[teho9n]=  Cast([teho9n] as int)
      ,[teho10n]=  Cast([teho10n] as int)
      ,[tehoyn]=  Cast([tehoyn] as int)
      ,[eipiden]=  Cast([eipiden] as int)
      ,[eipid1n]=  Cast([eipid1n] as int)
      ,[eipid2n]=  Cast([eipid2n] as int)
      ,[eipid3n]=  Cast([eipid3n] as int)
      ,[eipid4n]=  Cast([eipid4n] as int)
      ,[eipid5n]=  Cast([eipid5n] as int)
      ,[eipid6n]=  Cast([eipid6n] as int)
      ,[eipid7n]=  Cast([eipid7n] as int)
      ,[eipid8n]=  Cast([eipid8n] as int)
      ,[eipid9n]=  Cast([eipid9n] as int)
      ,[eipid10n]=  Cast([eipid10n] as int)
      ,[eipidyn]=  Cast([eipidyn] as int)
      ,[ertuven]=  Cast([ertuven] as int)
      ,[ertuv1n]=  Cast([ertuv1n] as int)
      ,[ertuv2n]=  Cast([ertuv2n] as int)
      ,[ertuv3n]=  Cast([ertuv3n] as int)
      ,[ertuv4n]=  Cast([ertuv4n] as int)
      ,[ertuv5n]=  Cast([ertuv5n] as int)
      ,[ertuv6n]=  Cast([ertuv6n] as int)
      ,[ertuv7n]=  Cast([ertuv7n] as int)
      ,[ertuv8n]=  Cast([ertuv8n] as int)
      ,[ertuv9n]=  Cast([ertuv9n] as int)
      ,[ertuv10n]=  Cast([ertuv10n] as int)
      ,[ertuvyn]=  Cast([ertuvyn] as int)
      ,[ertumen]=  Cast([ertumen] as int)
      ,[ertum1n]=  Cast([ertum1n] as int)
      ,[ertum2n]=  Cast([ertum2n] as int)
      ,[ertum3n]=  Cast([ertum3n] as int)
      ,[ertum4n]=  Cast([ertum4n] as int)
      ,[ertum5n]=  Cast([ertum5n] as int)
      ,[ertum6n]=  Cast([ertum6n] as int)
      ,[ertum7n]=  Cast([ertum7n] as int)
      ,[ertum8n]=  Cast([ertum8n] as int)
      ,[ertum9n]=  Cast([ertum9n] as int)
      ,[ertum10n]=  Cast([ertum10n] as int)
      ,[ertumyn]=  Cast([ertumyn] as int)
      ,[tavoven]=  Cast([tavoven] as int)
      ,[tavov1n]=  Cast([tavov1n] as int)
      ,[tavov2n]=  Cast([tavov2n] as int)
      ,[tavov3n]=  Cast([tavov3n] as int)
      ,[tavov4n]=  Cast([tavov4n] as int)
      ,[tavov5n]=  Cast([tavov5n] as int)
      ,[tavov6n]=  Cast([tavov6n] as int)
      ,[tavov7n]=  Cast([tavov7n] as int)
      ,[tavov8n]=  Cast([tavov8n] as int)
      ,[tavov9n]=  Cast([tavov9n] as int)
      ,[tavov10n]=  Cast([tavov10n] as int)
      ,[tavovyn]=  Cast([tavovyn] as int)
      ,[eipidec]=  Cast([eipidec] as int)
      ,[eipidpc]=  Cast([eipidpc] as int)
      ,[eipidlc]=  Cast([eipidlc] as int)
      ,[eipidyc]=  Cast([eipidyc] as int)
      ,[ertuvec]=  Cast([ertuvec] as int)
      ,[ertuvpc]=  Cast([ertuvpc] as int)
      ,[ertuvlc]=  Cast([ertuvlc] as int)
      ,[ertuvyc]=  Cast([ertuvyc] as int)
      ,[ertumec]=  Cast([ertumec] as int)
      ,[ertumpc]=  Cast([ertumpc] as int)
      ,[ertumlc]=  Cast([ertumlc] as int)
      ,[ertumyc]=  Cast([ertumyc] as int)
      ,[muuec]=  Cast([muuec] as int)
      ,[muupc]=  Cast([muupc] as int)
      ,[muulc]=  Cast([muulc] as int)
      ,[muuyc]=  Cast([muuyc] as int)
      ,[ovec]=  Cast([ovec] as int)
      ,[ovpc]=  Cast([ovpc] as int)
      ,[ovlc]=  Cast([ovlc] as int)
      ,[ovyc]=  Cast([ovyc] as int)
      ,[sisae]=  Cast([sisae] as int)
      ,[sisap]=  Cast([sisap] as int)
      ,[sisal]=  Cast([sisal] as int)
      ,[sisam]=  Cast([sisam] as int)
      ,[sisay]=  Cast([sisay] as int)
      ,[maeipide]=  Cast([maeipide] as int)
      ,[maeipidp]=  Cast([maeipidp] as int)
      ,[maeipidl]=  Cast([maeipidl] as int)
      ,[maeipidy]=  Cast([maeipidy] as int)
      ,[maertuve]=  Cast([maertuve] as int)
      ,[maertuvp]=  Cast([maertuvp] as int)
      ,[maertuvl]=  Cast([maertuvl] as int)
      ,[maertuvy]=  Cast([maertuvy] as int)
      ,[maertume]=  Cast([maertume] as int)
      ,[maertump]=  Cast([maertump] as int)
      ,[maertuml]=  Cast([maertuml] as int)
      ,[maertumy]=  Cast([maertumy] as int)
      ,[mamuue]=  Cast([mamuue] as int)
      ,[mamuup]=  Cast([mamuup] as int)
      ,[mamuul]=  Cast([mamuul] as int)
      ,[mamuuy]=  Cast([mamuuy] as int)
      ,[maove]=  Cast([maove] as int)
      ,[maovp]=  Cast([maovp] as int)
      ,[maovl]=  Cast([maovl] as int)
      ,[maovy]=  Cast([maovy] as int)
      ,[kueipide]=  Cast([kueipide] as int)
      ,[kueipidp]=  Cast([kueipidp] as int)
      ,[kueipidl]=  Cast([kueipidl] as int)
      ,[kueipidy]=  Cast([kueipidy] as int)
      ,[kuertuve]=  Cast([kuertuve] as int)
      ,[kuertuvp]=  Cast([kuertuvp] as int)
      ,[kuertuvl]=  Cast([kuertuvl] as int)
      ,[kuertuvy]=  Cast([kuertuvy] as int)
      ,[kuertume]=  Cast([kuertume] as int)
      ,[kuertump]=  Cast([kuertump] as int)
      ,[kuertuml]=  Cast([kuertuml] as int)
      ,[kuertumy]=  Cast([kuertumy] as int)
      ,[kumuue]=  Cast([kumuue] as int)
      ,[kumuup]=  Cast([kumuup] as int)
      ,[kumuul]=  Cast([kumuul] as int)
      ,[kumuuy]=  Cast([kumuuy] as int)
      ,[kuove]=  Cast([kuove] as int)
      ,[kuovp]=  Cast([kuovp] as int)
      ,[kuovl]=  Cast([kuovl] as int)
      ,[kuovy]=  Cast([kuovy] as int)
      ,[vieipide]=  Cast([vieipide] as int)
      ,[vieipidp]=  Cast([vieipidp] as int)
      ,[vieipidl]=  Cast([vieipidl] as int)
      ,[vieipidy]=  Cast([vieipidy] as int)
      ,[viertuve]=  Cast([viertuve] as int)
      ,[viertuvp]=  Cast([viertuvp] as int)
      ,[viertuvl]=  Cast([viertuvl] as int)
      ,[viertuvy]=  Cast([viertuvy] as int)
      ,[viertume]=  Cast([viertume] as int)
      ,[viertump]=  Cast([viertump] as int)
      ,[viertuml]=  Cast([viertuml] as int)
      ,[viertumy]=  Cast([viertumy] as int)
      ,[vimuue]=  Cast([vimuue] as int)
      ,[vimuup]=  Cast([vimuup] as int)
      ,[vimuul]=  Cast([vimuul] as int)
      ,[vimuuy]=  Cast([vimuuy] as int)
      ,[viove]=  Cast([viove] as int)
      ,[viovp]=  Cast([viovp] as int)
      ,[viovl]=  Cast([viovl] as int)
      ,[viovy]=  Cast([viovy] as int)
      ,[ika61]=  Cast([ika61] as int)
      ,[ika61n]=  Cast([ika61n] as int)
      ,[ika71]=  Cast([ika71] as int)
      ,[ika71n]=  Cast([ika71n] as int)
      ,[ika81]=  Cast([ika81] as int)
      ,[ika81n]=  Cast([ika81n] as int)
      ,[ika91]=  Cast([ika91] as int)
      ,[ika91n]=  Cast([ika91n] as int)
      ,[ika1]=  Cast([ika1] as int)
      ,[ika1n]=  Cast([ika1n] as int)
      ,[lykk]=  Cast([lykk] as int)
      ,[lykkn]=  Cast([lykkn] as int)
      ,[jopo]=  Cast([jopo] as int)
      ,[jopon]=  Cast([jopon] as int)
      ,[kan17v]=  Cast([kan17v] as int)
      ,[muu17v]=  Cast([muu17v] as int)
      ,[op17v]=  Cast([op17v] as int)
      ,[lukoko]=  Cast([lukoko] as int)
      ,[lukokon]=  Cast([lukokon] as int)
      ,[luib]=  Cast([luib] as int)
      ,[luibn]=  Cast([luibn] as int)
      ,[reife]=  Cast([reife] as int)
      ,[reifen]=  Cast([reifen] as int)
      ,[gymn]=  Cast([gymn] as int)
      ,[gymnn]=  Cast([gymnn] as int)
      ,[lueb]=  Cast([lueb] as int)
      ,[luebn]=  Cast([luebn] as int)
      ,[lukio]=  Cast([lukio] as int)
      ,[lukion]=  Cast([lukion] as int)
      ,[opsamm]=  Cast([opsamm] as int)
      ,[opsammn]=  Cast([opsammn] as int)
      ,[muuamm]=  Cast([muuamm] as int)
      ,[muuammn]=  Cast([muuammn] as int)
      ,[amm]=  Cast([amm] as int)
      ,[ammn]=  Cast([ammn] as int)
      ,[peain]=  Cast([peain] as int)
      ,[peainn]=  Cast([peainn] as int)
      ,[luain]=  Cast([luain] as int)
      ,[luainn]=  Cast([luainn] as int)
      ,[vapsiv]=  Cast([vapsiv] as int)
      ,[vapsivn]=  Cast([vapsivn] as int)
      ,[taiop]=  Cast([taiop] as int)
      ,[taiopn]=  Cast([taiopn] as int)
      ,[muukoul]=  Cast([muukoul] as int)
      ,[muukouln]=  Cast([muukouln] as int)
      ,[muuop]=  Cast([muuop] as int)
      ,[muuopn]=  Cast([muuopn] as int)
      ,[tehoec]=  Cast([tehoec] as int)
      ,[teho16c]=  Cast([teho16c] as int)
      ,[teho79c]=  Cast([teho79c] as int)
      ,[teholc]=  Cast([teholc] as int)
      ,[tehoyc]=  Cast([tehoyc] as int)
      ,[ertuec]=  Cast([ertuec] as int)
      ,[ertu16c]=  Cast([ertu16c] as int)
      ,[ertu79c]=  Cast([ertu79c] as int)
      ,[ertulc]=  Cast([ertulc] as int)
      ,[ertuyc]=  Cast([ertuyc] as int)
      ,[eritec]=  Cast([eritec] as int)
      ,[erit16c]=  Cast([erit16c] as int)
      ,[erit79c]=  Cast([erit79c] as int)
      ,[eritlc]=  Cast([eritlc] as int)
      ,[erityc]=  Cast([erityc] as int)
      ,[inte4]=  Cast([inte4] as int)
      ,[int164]=  Cast([int164] as int)
      ,[int794]=  Cast([int794] as int)
      ,[intl4]=  Cast([intl4] as int)
      ,[inty4]=  Cast([inty4] as int)
      ,[inte3]=  Cast([inte3] as int)
      ,[int163]=  Cast([int163] as int)
      ,[int793]=  Cast([int793] as int)
      ,[intl3]=  Cast([intl3] as int)
      ,[inty3]=  Cast([inty3] as int)
      ,[inte2]=  Cast([inte2] as int)
      ,[int162]=  Cast([int162] as int)
      ,[int792]=  Cast([int792] as int)
      ,[intl2]=  Cast([intl2] as int)
      ,[inty2]=  Cast([inty2] as int)
      ,[inte1]=  Cast([inte1] as int)
      ,[int161]=  Cast([int161] as int)
      ,[int791]=  Cast([int791] as int)
      ,[intl1]=  Cast([intl1] as int)
      ,[inty1]=  Cast([inty1] as int)
      ,[inte0]=  Cast([inte0] as int)
      ,[int160]=  Cast([int160] as int)
      ,[int790]=  Cast([int790] as int)
      ,[intl0]=  Cast([intl0] as int)
      ,[inty0]=  Cast([inty0] as int)
      ,[intey]=  Cast([intey] as int)
      ,[int16y]=  Cast([int16y] as int)
      ,[int79y]=  Cast([int79y] as int)
      ,[intly]=  Cast([intly] as int)
      ,[intyy]=  Cast([intyy] as int)
      ,[yks160]=  Cast([yks160] as int)
      ,[yks790]=  Cast([yks790] as int)
      ,[yksl0]=  Cast([yksl0] as int)
      ,[yksy0]=  Cast([yksy0] as int)
      ,[yks161]=  Cast([yks161] as int)
      ,[yks791]=  Cast([yks791] as int)
      ,[yksl1]=  Cast([yksl1] as int)
      ,[yksy1]=  Cast([yksy1] as int)
      ,[yks162]=  Cast([yks162] as int)
      ,[yks792]=  Cast([yks792] as int)
      ,[yksl2]=  Cast([yksl2] as int)
      ,[yksy2]=  Cast([yksy2] as int)
      ,[yks164]=  Cast([yks164] as int)
      ,[yks794]=  Cast([yks794] as int)
      ,[yksl4]=  Cast([yksl4] as int)
      ,[yksy4]=  Cast([yksy4] as int)
      ,[yks16t]=  Cast([yks16t] as int)
      ,[yks79t]=  Cast([yks79t] as int)
      ,[ykslt]=  Cast([ykslt] as int)
      ,[yksyt]=  Cast([yksyt] as int)
      ,[yks16y]=  Cast([yks16y] as int)
      ,[yks79y]=  Cast([yks79y] as int)
      ,[yksly]=  Cast([yksly] as int)
      ,[yksyy]=  Cast([yksyy] as int)
      ,[tehoosa]=  Cast([tehoosa] as int)
      ,[ertuosa]=  Cast([ertuosa] as int)
      ,[eritosa]=  Cast([eritosa] as int)
      ,[tehotuki]=  Cast([tehotuki] as int)
      ,[ertutuki]=  Cast([ertutuki] as int)
      ,[erittuki]=  Cast([erittuki] as int)
      ,[tehoavu]=  Cast([tehoavu] as int)
      ,[ertuavu]=  Cast([ertuavu] as int)
      ,[eritavu]=  Cast([eritavu] as int)
      ,[tehomuu]=  Cast([tehomuu] as int)
      ,[ertumuu]=  Cast([ertumuu] as int)
      ,[eritmuu]=  Cast([eritmuu] as int)
      ,[alc]=  Cast([alc] as int)
      ,[ylc]=  Cast([ylc] as int)
      ,[luc]=  Cast([luc] as int)
      ,[amc]=  Cast([amc] as int)
      ,[alkieli0]=  Cast([alkieli0] as int)
      ,[alkieli1]=  Cast([alkieli1] as int)
      ,[alkieli2]=  Cast([alkieli2] as int)
      ,[alkieli3]=  Cast([alkieli3] as int)
      ,[alkieli4]=  Cast([alkieli4] as int)
      ,[alkieliy]=  Cast([alkieliy] as int)
      ,[ylkieli0]=  Cast([ylkieli0] as int)
      ,[ylkieli1]=  Cast([ylkieli1] as int)
      ,[ylkieli2]=  Cast([ylkieli2] as int)
      ,[ylkieli3]=  Cast([ylkieli3] as int)
      ,[ylkieli4]=  Cast([ylkieli4] as int)
      ,[ylkieli5]=  Cast([ylkieli5] as int)
      ,[ylkieliy]=  Cast([ylkieliy] as int)
      ,[lukieli0]=  Cast([lukieli0] as int)
      ,[lukieli1]=  Cast([lukieli1] as int)
      ,[lukieli2]=  Cast([lukieli2] as int)
      ,[lukieli3]=  Cast([lukieli3] as int)
      ,[lukieli4]=  Cast([lukieli4] as int)
      ,[lukieli5]=  Cast([lukieli5] as int)
      ,[lukieli6]=  Cast([lukieli6] as int)
      ,[lukieliy]=  Cast([lukieliy] as int)
      ,[amkieli0]=  Cast([amkieli0] as int)
      ,[amkieli1]=  Cast([amkieli1] as int)
      ,[amkieli2]=  Cast([amkieli2] as int)
      ,[amkieli3]=  Cast([amkieli3] as int)
      ,[amkieli4]=  Cast([amkieli4] as int)
      ,[amkieli5]=  Cast([amkieli5] as int)
      ,[amkieli6]=  Cast([amkieli6] as int)
      ,[amkieliy]=  Cast([amkieliy] as int)
      ,[aleny]=  Cast([aleny] as int)
      ,[alruy]=  Cast([alruy] as int)
      ,[alsuy]=  Cast([alsuy] as int)
      ,[alray]=  Cast([alray] as int)
      ,[alsay]=  Cast([alsay] as int)
      ,[alvey]=  Cast([alvey] as int)
      ,[alesy]=  Cast([alesy] as int)
      ,[ality]=  Cast([ality] as int)
      ,[alsaay]=  Cast([alsaay] as int)
      ,[almuy]=  Cast([almuy] as int)
      ,[yleny]=  Cast([yleny] as int)
      ,[ylruy]=  Cast([ylruy] as int)
      ,[ylsuy]=  Cast([ylsuy] as int)
      ,[ylray]=  Cast([ylray] as int)
      ,[ylsay]=  Cast([ylsay] as int)
      ,[ylvey]=  Cast([ylvey] as int)
      ,[ylesy]=  Cast([ylesy] as int)
      ,[ylity]=  Cast([ylity] as int)
      ,[ylsaay]=  Cast([ylsaay] as int)
      ,[yllaty]=  Cast([yllaty] as int)
      ,[ylmuy]=  Cast([ylmuy] as int)
      ,[lueny]=  Cast([lueny] as int)
      ,[luruy]=  Cast([luruy] as int)
      ,[lusuy]=  Cast([lusuy] as int)
      ,[luray]=  Cast([luray] as int)
      ,[lusay]=  Cast([lusay] as int)
      ,[luvey]=  Cast([luvey] as int)
      ,[luesy]=  Cast([luesy] as int)
      ,[luity]=  Cast([luity] as int)
      ,[lusaay]=  Cast([lusaay] as int)
      ,[lulaty]=  Cast([lulaty] as int)
      ,[lumuy]=  Cast([lumuy] as int)
      ,[ameny]=  Cast([ameny] as int)
      ,[amruy]=  Cast([amruy] as int)
      ,[amsuy]=  Cast([amsuy] as int)
      ,[amray]=  Cast([amray] as int)
      ,[amsay]=  Cast([amsay] as int)
      ,[amvey]=  Cast([amvey] as int)
      ,[amesy]=  Cast([amesy] as int)
      ,[amity]=  Cast([amity] as int)
      ,[amsaay]=  Cast([amsaay] as int)
      ,[amlaty]=  Cast([amlaty] as int)
      ,[ammuy]=  Cast([ammuy] as int)
      ,[ov1c]=  Cast([ov1c] as int)
      ,[ov2c]=  Cast([ov2c] as int)
      ,[ov3c]=  Cast([ov3c] as int)
      ,[ov4c]=  Cast([ov4c] as int)
      ,[ov5c]=  Cast([ov5c] as int)
      ,[ov6c]=  Cast([ov6c] as int)
      ,[ov16yc]=  Cast([ov16yc] as int)
      ,[ov16nc]=  Cast([ov16nc] as int)
      ,[eng1]=  Cast([eng1] as int)
      ,[ru1]=  Cast([ru1] as int)
      ,[su1]=  Cast([su1] as int)
      ,[ra1]=  Cast([ra1] as int)
      ,[sa1]=  Cast([sa1] as int)
      ,[ve1]=  Cast([ve1] as int)
      ,[es1]=  Cast([es1] as int)
      ,[it1]=  Cast([it1] as int)
      ,[saa1]=  Cast([saa1] as int)
      ,[mu1]=  Cast([mu1] as int)
      ,[eopis1]=  Cast([eopis1] as int)
      ,[eng2]=  Cast([eng2] as int)
      ,[ru2]=  Cast([ru2] as int)
      ,[su2]=  Cast([su2] as int)
      ,[ra2]=  Cast([ra2] as int)
      ,[sa2]=  Cast([sa2] as int)
      ,[ve2]=  Cast([ve2] as int)
      ,[es2]=  Cast([es2] as int)
      ,[it2]=  Cast([it2] as int)
      ,[saa2]=  Cast([saa2] as int)
      ,[mu2]=  Cast([mu2] as int)
      ,[eopis2]=  Cast([eopis2] as int)
      ,[eng3]=  Cast([eng3] as int)
      ,[ru3]=  Cast([ru3] as int)
      ,[su3]=  Cast([su3] as int)
      ,[ra3]=  Cast([ra3] as int)
      ,[sa3]=  Cast([sa3] as int)
      ,[ve3]=  Cast([ve3] as int)
      ,[es3]=  Cast([es3] as int)
      ,[it3]=  Cast([it3] as int)
      ,[saa3]=  Cast([saa3] as int)
      ,[mu3]=  Cast([mu3] as int)
      ,[eopis3]=  Cast([eopis3] as int)
      ,[eng4]=  Cast([eng4] as int)
      ,[ru4]=  Cast([ru4] as int)
      ,[su4]=  Cast([su4] as int)
      ,[ra4]=  Cast([ra4] as int)
      ,[sa4]=  Cast([sa4] as int)
      ,[ve4]=  Cast([ve4] as int)
      ,[es4]=  Cast([es4] as int)
      ,[it4]=  Cast([it4] as int)
      ,[saa4]=  Cast([saa4] as int)
      ,[mu4]=  Cast([mu4] as int)
      ,[eopis4]=  Cast([eopis4] as int)
      ,[eng5]=  Cast([eng5] as int)
      ,[ru5]=  Cast([ru5] as int)
      ,[su5]=  Cast([su5] as int)
      ,[ra5]=  Cast([ra5] as int)
      ,[sa5]=  Cast([sa5] as int)
      ,[ve5]=  Cast([ve5] as int)
      ,[es5]=  Cast([es5] as int)
      ,[it5]=  Cast([it5] as int)
      ,[saa5]=  Cast([saa5] as int)
      ,[mu5]=  Cast([mu5] as int)
      ,[eopis5]=  Cast([eopis5] as int)
      ,[eng6]=  Cast([eng6] as int)
      ,[ru6]=  Cast([ru6] as int)
      ,[su6]=  Cast([su6] as int)
      ,[ra6]=  Cast([ra6] as int)
      ,[sa6]=  Cast([sa6] as int)
      ,[ve6]=  Cast([ve6] as int)
      ,[es6]=  Cast([es6] as int)
      ,[it6]=  Cast([it6] as int)
      ,[saa6]=  Cast([saa6] as int)
      ,[mu6]=  Cast([mu6] as int)
      ,[eopis6]=  Cast([eopis6] as int)
      ,[eny]=  Cast([eny] as int)
      ,[ruy]=  Cast([ruy] as int)
      ,[suy]=  Cast([suy] as int)
      ,[ray]=  Cast([ray] as int)
      ,[say]=  Cast([say] as int)
      ,[vey]=  Cast([vey] as int)
      ,[esy]=  Cast([esy] as int)
      ,[ity]=  Cast([ity] as int)
      ,[saay]=  Cast([saay] as int)
      ,[muy]=  Cast([muy] as int)
      ,[eopisy]=  Cast([eopisy] as int)
      ,[enn]=  Cast([enn] as int)
      ,[run]=  Cast([run] as int)
      ,[sun]=  Cast([sun] as int)
      ,[ran]=  Cast([ran] as int)
      ,[san]=  Cast([san] as int)
      ,[ven]=  Cast([ven] as int)
      ,[esn]=  Cast([esn] as int)
      ,[itn]=  Cast([itn] as int)
      ,[saan]=  Cast([saan] as int)
      ,[mun]=  Cast([mun] as int)
      ,[eopisn]=  Cast([eopisn] as int)
      ,[ven1]=  Cast([ven1] as int)
      ,[vru1]=  Cast([vru1] as int)
      ,[vsu1]=  Cast([vsu1] as int)
      ,[vra1]=  Cast([vra1] as int)
      ,[vsa1]=  Cast([vsa1] as int)
      ,[vve1]=  Cast([vve1] as int)
      ,[ves1]=  Cast([ves1] as int)
      ,[vit1]=  Cast([vit1] as int)
      ,[vsaa1]=  Cast([vsaa1] as int)
      ,[vmu1]=  Cast([vmu1] as int)
      ,[vyht1]=  Cast([vyht1] as int)
      ,[ven2]=  Cast([ven2] as int)
      ,[vru2]=  Cast([vru2] as int)
      ,[vsu2]=  Cast([vsu2] as int)
      ,[vra2]=  Cast([vra2] as int)
      ,[vsa2]=  Cast([vsa2] as int)
      ,[vve2]=  Cast([vve2] as int)
      ,[ves2]=  Cast([ves2] as int)
      ,[vit2]=  Cast([vit2] as int)
      ,[vsaa2]=  Cast([vsaa2] as int)
      ,[vmu2]=  Cast([vmu2] as int)
      ,[vyht2]=  Cast([vyht2] as int)
      ,[ven3]=  Cast([ven3] as int)
      ,[vru3]=  Cast([vru3] as int)
      ,[vsu3]=  Cast([vsu3] as int)
      ,[vra3]=  Cast([vra3] as int)
      ,[vsa3]=  Cast([vsa3] as int)
      ,[vve3]=  Cast([vve3] as int)
      ,[ves3]=  Cast([ves3] as int)
      ,[vit3]=  Cast([vit3] as int)
      ,[vsaa3]=  Cast([vsaa3] as int)
      ,[vmu3]=  Cast([vmu3] as int)
      ,[vyht3]=  Cast([vyht3] as int)
      ,[ven4]=  Cast([ven4] as int)
      ,[vru4]=  Cast([vru4] as int)
      ,[vsu4]=  Cast([vsu4] as int)
      ,[vra4]=  Cast([vra4] as int)
      ,[vsa4]=  Cast([vsa4] as int)
      ,[vve4]=  Cast([vve4] as int)
      ,[ves4]=  Cast([ves4] as int)
      ,[vit4]=  Cast([vit4] as int)
      ,[vsaa4]=  Cast([vsaa4] as int)
      ,[vmu4]=  Cast([vmu4] as int)
      ,[vyht4]=  Cast([vyht4] as int)
      ,[ven5]=  Cast([ven5] as int)
      ,[vru5]=  Cast([vru5] as int)
      ,[vsu5]=  Cast([vsu5] as int)
      ,[vra5]=  Cast([vra5] as int)
      ,[vsa5]=  Cast([vsa5] as int)
      ,[vve5]=  Cast([vve5] as int)
      ,[ves5]=  Cast([ves5] as int)
      ,[vit5]=  Cast([vit5] as int)
      ,[vsaa5]=  Cast([vsaa5] as int)
      ,[vmu5]=  Cast([vmu5] as int)
      ,[vyht5]=  Cast([vyht5] as int)
      ,[ven6]=  Cast([ven6] as int)
      ,[vru6]=  Cast([vru6] as int)
      ,[vsu6]=  Cast([vsu6] as int)
      ,[vra6]=  Cast([vra6] as int)
      ,[vsa6]=  Cast([vsa6] as int)
      ,[vve6]=  Cast([vve6] as int)
      ,[ves6]=  Cast([ves6] as int)
      ,[vit6]=  Cast([vit6] as int)
      ,[vsaa6]=  Cast([vsaa6] as int)
      ,[vmu6]=  Cast([vmu6] as int)
      ,[vyht6]=  Cast([vyht6] as int)
      ,[veny]=  Cast([veny] as int)
      ,[vruy]=  Cast([vruy] as int)
      ,[vsuy]=  Cast([vsuy] as int)
      ,[vray]=  Cast([vray] as int)
      ,[vsay]=  Cast([vsay] as int)
      ,[vvey]=  Cast([vvey] as int)
      ,[vesy]=  Cast([vesy] as int)
      ,[vity]=  Cast([vity] as int)
      ,[vsaay]=  Cast([vsaay] as int)
      ,[vmuy]=  Cast([vmuy] as int)
      ,[vyht]=  Cast([vyht] as int)
      ,[venn]=  Cast([venn] as int)
      ,[vrun]=  Cast([vrun] as int)
      ,[vsun]=  Cast([vsun] as int)
      ,[vran]=  Cast([vran] as int)
      ,[vsan]=  Cast([vsan] as int)
      ,[vven]=  Cast([vven] as int)
      ,[vesn]=  Cast([vesn] as int)
      ,[vitn]=  Cast([vitn] as int)
      ,[vsaan]=  Cast([vsaan] as int)
      ,[vmun]=  Cast([vmun] as int)
      ,[vtyt]=  Cast([vtyt] as int)
      ,[ov79yc]=  Cast([ov79yc] as int)
      ,[ov79nc]=  Cast([ov79nc] as int)
      ,[yaen1]=  Cast([yaen1] as int)
      ,[yaru1]=  Cast([yaru1] as int)
      ,[yasu1]=  Cast([yasu1] as int)
      ,[yara1]=  Cast([yara1] as int)
      ,[yasa1]=  Cast([yasa1] as int)
      ,[yave1]=  Cast([yave1] as int)
      ,[yaes1]=  Cast([yaes1] as int)
      ,[yait1]=  Cast([yait1] as int)
      ,[yasaa1]=  Cast([yasaa1] as int)
      ,[yalat1]=  Cast([yalat1] as int)
      ,[yamuu1]=  Cast([yamuu1] as int)
      ,[yaen2]=  Cast([yaen2] as int)
      ,[yaru2]=  Cast([yaru2] as int)
      ,[yasu2]=  Cast([yasu2] as int)
      ,[yara2]=  Cast([yara2] as int)
      ,[yasa2]=  Cast([yasa2] as int)
      ,[yave2]=  Cast([yave2] as int)
      ,[yaes2]=  Cast([yaes2] as int)
      ,[yait2]=  Cast([yait2] as int)
      ,[yasaa2]=  Cast([yasaa2] as int)
      ,[yalat2]=  Cast([yalat2] as int)
      ,[yamuu2]=  Cast([yamuu2] as int)
      ,[yyen]=  Cast([yyen] as int)
      ,[yyru]=  Cast([yyru] as int)
      ,[yysu]=  Cast([yysu] as int)
      ,[yyra]=  Cast([yyra] as int)
      ,[yysa]=  Cast([yysa] as int)
      ,[yen]=  Cast([yen] as int)
      ,[yru]=  Cast([yru] as int)
      ,[ysu]=  Cast([ysu] as int)
      ,[yra]=  Cast([yra] as int)
      ,[ysa]=  Cast([ysa] as int)
      ,[yve]=  Cast([yve] as int)
      ,[yes]=  Cast([yes] as int)
      ,[yit]=  Cast([yit] as int)
      ,[ysaa]=  Cast([ysaa] as int)
      ,[ylat]=  Cast([ylat] as int)
      ,[ymuu]=  Cast([ymuu] as int)
      ,[enyy]=  Cast([enyy] as int)
      ,[ruyy]=  Cast([ruyy] as int)
      ,[suyy]=  Cast([suyy] as int)
      ,[rayy]=  Cast([rayy] as int)
      ,[sayy]=  Cast([sayy] as int)
      ,[veyy]=  Cast([veyy] as int)
      ,[esyy]=  Cast([esyy] as int)
      ,[ityy]=  Cast([ityy] as int)
      ,[saayy]=  Cast([saayy] as int)
      ,[layy]=  Cast([layy] as int)
      ,[muyy]=  Cast([muyy] as int)
      ,[yaen1n]=  Cast([yaen1n] as int)
      ,[yaru1n]=  Cast([yaru1n] as int)
      ,[yasu1n]=  Cast([yasu1n] as int)
      ,[yara1n]=  Cast([yara1n] as int)
      ,[yasa1n]=  Cast([yasa1n] as int)
      ,[yave1n]=  Cast([yave1n] as int)
      ,[yaes1n]=  Cast([yaes1n] as int)
      ,[yait1n]=  Cast([yait1n] as int)
      ,[yasaa1n]=  Cast([yasaa1n] as int)
      ,[yalat1n]=  Cast([yalat1n] as int)
      ,[yamuu1n]=  Cast([yamuu1n] as int)
      ,[yaen2n]=  Cast([yaen2n] as int)
      ,[yaru2n]=  Cast([yaru2n] as int)
      ,[yasu2n]=  Cast([yasu2n] as int)
      ,[yara2n]=  Cast([yara2n] as int)
      ,[yasa2n]=  Cast([yasa2n] as int)
      ,[yave2n]=  Cast([yave2n] as int)
      ,[yaes2n]=  Cast([yaes2n] as int)
      ,[yait2n]=  Cast([yait2n] as int)
      ,[yasaa2n]=  Cast([yasaa2n] as int)
      ,[yalat2n]=  Cast([yalat2n] as int)
      ,[yamuu2n]=  Cast([yamuu2n] as int)
      ,[yyenn]=  Cast([yyenn] as int)
      ,[yyrun]=  Cast([yyrun] as int)
      ,[yysun]=  Cast([yysun] as int)
      ,[yyran]=  Cast([yyran] as int)
      ,[yysan]=  Cast([yysan] as int)
      ,[yenn]=  Cast([yenn] as int)
      ,[yrun]=  Cast([yrun] as int)
      ,[ysun]=  Cast([ysun] as int)
      ,[yran]=  Cast([yran] as int)
      ,[ysan]=  Cast([ysan] as int)
      ,[yven]=  Cast([yven] as int)
      ,[yesn]=  Cast([yesn] as int)
      ,[yitn]=  Cast([yitn] as int)
      ,[ysaan]=  Cast([ysaan] as int)
      ,[ylatn]=  Cast([ylatn] as int)
      ,[ymuun]=  Cast([ymuun] as int)
      ,[ennn]=  Cast([ennn] as int)
      ,[runn]=  Cast([runn] as int)
      ,[sunn]=  Cast([sunn] as int)
      ,[rann]=  Cast([rann] as int)
      ,[sann]=  Cast([sann] as int)
      ,[vennn]=  Cast([vennn] as int)
      ,[esnn]=  Cast([esnn] as int)
      ,[itnn]=  Cast([itnn] as int)
      ,[saann]=  Cast([saann] as int)
      ,[lann]=  Cast([lann] as int)
      ,[munn]=  Cast([munn] as int)
      ,[asv]=  Cast([asv] as int)
      ,[arv]=  Cast([arv] as int)
      ,[asvrv]=  Cast([asvrv] as int)
      ,[ysv]=  Cast([ysv] as int)
      ,[yrv]=  Cast([yrv] as int)
      ,[ysvrv]=  Cast([ysvrv] as int)
      ,[sv]=  Cast([sv] as int)
      ,[rv]=  Cast([rv] as int)
      ,[svrv]=  Cast([svrv] as int)
      ,[aev]=  Cast([aev] as int)
      ,[aort]=  Cast([aort] as int)
      ,[aisl]=  Cast([aisl] as int)
      ,[amu]=  Cast([amu] as int)
      ,[aet]=  Cast([aet] as int)
      ,[aeos]=  Cast([aeos] as int)
      ,[akay]=  Cast([akay] as int)
      ,[yev]=  Cast([yev] as int)
      ,[yort]=  Cast([yort] as int)
      ,[yisl]=  Cast([yisl] as int)
      ,[ymu]=  Cast([ymu] as int)
      ,[yet]=  Cast([yet] as int)
      ,[yeos]=  Cast([yeos] as int)
      ,[ykay]=  Cast([ykay] as int)
      ,[ev]=  Cast([ev] as int)
      ,[ort]=  Cast([ort] as int)
      ,[isl]=  Cast([isl] as int)
      ,[mu]=  Cast([mu] as int)
      ,[et]=  Cast([et] as int)
      ,[eos]=  Cast([eos] as int)
      ,[kay]=  Cast([kay] as int)
      ,[ov89yc]=  Cast([ov89yc] as int)
      ,[ov89nc]=  Cast([ov89nc] as int)
      ,[ai]=  Cast([ai] as int)
      ,[rsb]=  Cast([rsb] as int)
      ,[ma]=  Cast([ma] as int)
      ,[yl]=  Cast([yl] as int)
      ,[bi]=  Cast([bi] as int)
      ,[ge]=  Cast([ge] as int)
      ,[fy]=  Cast([fy] as int)
      ,[ke]=  Cast([ke] as int)
      ,[ter]=  Cast([ter] as int)
      ,[ue]=  Cast([ue] as int)
      ,[eti]=  Cast([eti] as int)
      ,[hi]=  Cast([hi] as int)
      ,[yh]=  Cast([yh] as int)
      ,[mus]=  Cast([mus] as int)
      ,[ku]=  Cast([ku] as int)
      ,[tt]=  Cast([tt] as int)
      ,[ts]=  Cast([ts] as int)
      ,[li]=  Cast([li] as int)
      ,[ko]=  Cast([ko] as int)
      ,[yhd]=  Cast([yhd] as int)
      ,[ain]=  Cast([ain] as int)
      ,[rsbn]=  Cast([rsbn] as int)
      ,[man]=  Cast([man] as int)
      ,[yln]=  Cast([yln] as int)
      ,[bin]=  Cast([bin] as int)
      ,[gen]=  Cast([gen] as int)
      ,[fyn]=  Cast([fyn] as int)
      ,[ken]=  Cast([ken] as int)
      ,[tern]=  Cast([tern] as int)
      ,[uen]=  Cast([uen] as int)
      ,[etin]=  Cast([etin] as int)
      ,[hin]=  Cast([hin] as int)
      ,[yhn]=  Cast([yhn] as int)
      ,[musn]=  Cast([musn] as int)
      ,[kun]=  Cast([kun] as int)
      ,[ttn]=  Cast([ttn] as int)
      ,[tsn]=  Cast([tsn] as int)
      ,[lin]=  Cast([lin] as int)
      ,[kon]=  Cast([kon] as int)
      ,[yhdn]=  Cast([yhdn] as int)
      ,[tietop]=  Cast([tietop] as int)
      ,[tietok]=  Cast([tietok] as int)
      ,[tietoi]=  Cast([tietoi] as int)
      ,[verkko]=  Cast([verkko] as int)

      ,[kaytto] = CAST([kaytto] as nchar(1))
      ,[tietolahde]
      ,[rivinumero]
  FROM (
/*
  UNION ALL 
  --Aineisto 2.1
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype] =NULL
      ,[tunn]
      ,[edesi] =NULL
      ,[edala] =NULL
      ,[edyla] =NULL
      ,[edlisa] =NULL
      ,[edainep] =NULL
      ,[syesi] =NULL
      ,[syala] =NULL
      ,[syyla] =NULL
      ,[sylisa] =NULL
      ,[symamu] =NULL
      ,[sylukio] =NULL
      ,[syamm] =NULL
      ,[symuu] =NULL
      ,[keve] =NULL
      ,[keven] =NULL
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10] =NULL
      ,[kev10n] =NULL
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim] =NULL
      ,[kelaimn] =NULL
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn] =NULL
      ,[ilmtod] =NULL
      ,[ilmtodn] =NULL
      ,[aku] =NULL
      ,[mamukurs] =NULL
      ,[oppkurs] =NULL
      ,[muukurs] =NULL
      ,[akukurs] =NULL
      ,[kmamu] =NULL
      ,[kmamun] =NULL
      ,[syulkom] =NULL
      ,[syulkomn] =NULL
      ,[sykoti] =NULL
      ,[sykotin] =NULL
      ,[ika4e] =NULL
      ,[ika4en] =NULL
      ,[ika5e]
      ,[ika5en]
      ,[pid5v] =NULL
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe] =NULL
      ,[teho1] =NULL
      ,[teho2] =NULL
      ,[teho3] =NULL
      ,[teho4] =NULL
      ,[teho5] =NULL
      ,[teho6] =NULL
      ,[teho7] =NULL
      ,[teho8] =NULL
      ,[teho9] =NULL
      ,[teho10] =NULL
      ,[tehoy] =NULL
      ,[eipide] =NULL
      ,[eipid1] =NULL
      ,[eipid2] =NULL
      ,[eipid3] =NULL
      ,[eipid4] =NULL
      ,[eipid5] =NULL
      ,[eipid6] =NULL
      ,[eipid7] =NULL
      ,[eipid8] =NULL
      ,[eipid9] =NULL
      ,[eipid10] =NULL
      ,[eipidy] =NULL
      ,[ertuve] =NULL
      ,[ertuv1] =NULL
      ,[ertuv2] =NULL
      ,[ertuv3] =NULL
      ,[ertuv4] =NULL
      ,[ertuv5] =NULL
      ,[ertuv6] =NULL
      ,[ertuv7] =NULL
      ,[ertuv8] =NULL
      ,[ertuv9] =NULL
      ,[ertuv10] =NULL
      ,[ertuvy] =NULL
      ,[ertume] =NULL
      ,[ertum1] =NULL
      ,[ertum2] =NULL
      ,[ertum3] =NULL
      ,[ertum4] =NULL
      ,[ertum5] =NULL
      ,[ertum6] =NULL
      ,[ertum7] =NULL
      ,[ertum8] =NULL
      ,[ertum9] =NULL
      ,[ertum10] =NULL
      ,[ertumy] =NULL
      ,[tavove] =NULL
      ,[tavov1] =NULL
      ,[tavov2] =NULL
      ,[tavov3] =NULL
      ,[tavov4] =NULL
      ,[tavov5] =NULL
      ,[tavov6] =NULL
      ,[tavov7] =NULL
      ,[tavov8] =NULL
      ,[tavov9] =NULL
      ,[tavov10] =NULL
      ,[tavovy] =NULL
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen] =NULL
      ,[teho1n] =NULL
      ,[teho2n] =NULL
      ,[teho3n] =NULL
      ,[teho4n] =NULL
      ,[teho5n] =NULL
      ,[teho6n] =NULL
      ,[teho7n] =NULL
      ,[teho8n] =NULL
      ,[teho9n] =NULL
      ,[teho10n] =NULL
      ,[tehoyn] =NULL
      ,[eipiden] =NULL
      ,[eipid1n] =NULL
      ,[eipid2n] =NULL
      ,[eipid3n] =NULL
      ,[eipid4n] =NULL
      ,[eipid5n] =NULL
      ,[eipid6n] =NULL
      ,[eipid7n] =NULL
      ,[eipid8n] =NULL
      ,[eipid9n] =NULL
      ,[eipid10n] =NULL
      ,[eipidyn] =NULL
      ,[ertuven] =NULL
      ,[ertuv1n] =NULL
      ,[ertuv2n] =NULL
      ,[ertuv3n] =NULL
      ,[ertuv4n] =NULL
      ,[ertuv5n] =NULL
      ,[ertuv6n] =NULL
      ,[ertuv7n] =NULL
      ,[ertuv8n] =NULL
      ,[ertuv9n] =NULL
      ,[ertuv10n] =NULL
      ,[ertuvyn] =NULL
      ,[ertumen] =NULL
      ,[ertum1n] =NULL
      ,[ertum2n] =NULL
      ,[ertum3n] =NULL
      ,[ertum4n] =NULL
      ,[ertum5n] =NULL
      ,[ertum6n] =NULL
      ,[ertum7n] =NULL
      ,[ertum8n] =NULL
      ,[ertum9n] =NULL
      ,[ertum10n] =NULL
      ,[ertumyn] =NULL
      ,[tavoven] =NULL
      ,[tavov1n] =NULL
      ,[tavov2n] =NULL
      ,[tavov3n] =NULL
      ,[tavov4n] =NULL
      ,[tavov5n] =NULL
      ,[tavov6n] =NULL
      ,[tavov7n] =NULL
      ,[tavov8n] =NULL
      ,[tavov9n] =NULL
      ,[tavov10n] =NULL
      ,[tavovyn] =NULL
      ,[eipidec] =NULL
      ,[eipidpc] =NULL
      ,[eipidlc] =NULL
      ,[eipidyc] =NULL
      ,[ertuvec] =NULL
      ,[ertuvpc] =NULL
      ,[ertuvlc] =NULL
      ,[ertuvyc] =NULL
      ,[ertumec] =NULL
      ,[ertumpc] =NULL
      ,[ertumlc] =NULL
      ,[ertumyc] =NULL
      ,[muuec] =NULL
      ,[muupc] =NULL
      ,[muulc] =NULL
      ,[muuyc] =NULL
      ,[ovec] =NULL
      ,[ovpc] =NULL
      ,[ovlc] =NULL
      ,[ovyc] =NULL
      ,[sisae] =NULL
      ,[sisap] =NULL
      ,[sisal] =NULL
      ,[sisam] =NULL
      ,[sisay] =NULL
      ,[maeipide] =NULL
      ,[maeipidp] =NULL
      ,[maeipidl] =NULL
      ,[maeipidy] =NULL
      ,[maertuve] =NULL
      ,[maertuvp] =NULL
      ,[maertuvl] =NULL
      ,[maertuvy] =NULL
      ,[maertume] =NULL
      ,[maertump] =NULL
      ,[maertuml] =NULL
      ,[maertumy] =NULL
      ,[mamuue] =NULL
      ,[mamuup] =NULL
      ,[mamuul] =NULL
      ,[mamuuy] =NULL
      ,[maove] =NULL
      ,[maovp] =NULL
      ,[maovl] =NULL
      ,[maovy] =NULL
      ,[kueipide] =NULL
      ,[kueipidp] =NULL
      ,[kueipidl] =NULL
      ,[kueipidy] =NULL
      ,[kuertuve] =NULL
      ,[kuertuvp] =NULL
      ,[kuertuvl] =NULL
      ,[kuertuvy] =NULL
      ,[kuertume] =NULL
      ,[kuertump] =NULL
      ,[kuertuml] =NULL
      ,[kuertumy] =NULL
      ,[kumuue] =NULL
      ,[kumuup] =NULL
      ,[kumuul] =NULL
      ,[kumuuy] =NULL
      ,[kuove] =NULL
      ,[kuovp] =NULL
      ,[kuovl] =NULL
      ,[kuovy] =NULL
      ,[vieipide] =NULL
      ,[vieipidp] =NULL
      ,[vieipidl] =NULL
      ,[vieipidy] =NULL
      ,[viertuve] =NULL
      ,[viertuvp] =NULL
      ,[viertuvl] =NULL
      ,[viertuvy] =NULL
      ,[viertume] =NULL
      ,[viertump] =NULL
      ,[viertuml] =NULL
      ,[viertumy] =NULL
      ,[vimuue] =NULL
      ,[vimuup] =NULL
      ,[vimuul] =NULL
      ,[vimuuy] =NULL
      ,[viove] =NULL
      ,[viovp] =NULL
      ,[viovl] =NULL
      ,[viovy] =NULL
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo] =NULL
      ,[jopon] =NULL
      ,[kan17v] =NULL
      ,[muu17v] =NULL
      ,[op17v] =NULL
      ,[lukoko] =NULL
      ,[lukokon] =NULL
      ,[luib] =NULL
      ,[luibn] =NULL
      ,[reife] =NULL
      ,[reifen] =NULL
      ,[gymn] =NULL
      ,[gymnn] =NULL
      ,[lueb] =NULL
      ,[luebn] =NULL
      ,[lukio] =NULL
      ,[lukion] =NULL
      ,[opsamm] =NULL
      ,[opsammn] =NULL
      ,[muuamm] =NULL
      ,[muuammn] =NULL
      ,[amm] =NULL
      ,[ammn] =NULL
      ,[peain] =NULL
      ,[peainn] =NULL
      ,[luain] =NULL
      ,[luainn] =NULL
      ,[vapsiv] =NULL
      ,[vapsivn] =NULL
      ,[taiop] =NULL
      ,[taiopn] =NULL
      ,[muukoul] =NULL
      ,[muukouln] =NULL
      ,[muuop] =NULL
      ,[muuopn] =NULL
      ,[tehoec] =NULL
      ,[teho16c] =NULL
      ,[teho79c] =NULL
      ,[teholc] =NULL
      ,[tehoyc] =NULL
      ,[ertuec] =NULL
      ,[ertu16c] =NULL
      ,[ertu79c] =NULL
      ,[ertulc] =NULL
      ,[ertuyc] =NULL
      ,[eritec] =NULL
      ,[erit16c] =NULL
      ,[erit79c] =NULL
      ,[eritlc] =NULL
      ,[erityc] =NULL
      ,[inte4] =NULL
      ,[int164] =NULL
      ,[int794] =NULL
      ,[intl4] =NULL
      ,[inty4] =NULL
      ,[inte3] =NULL
      ,[int163] =NULL
      ,[int793] =NULL
      ,[intl3] =NULL
      ,[inty3] =NULL
      ,[inte2] =NULL
      ,[int162] =NULL
      ,[int792] =NULL
      ,[intl2] =NULL
      ,[inty2] =NULL
      ,[inte1] =NULL
      ,[int161] =NULL
      ,[int791] =NULL
      ,[intl1] =NULL
      ,[inty1] =NULL
      ,[inte0] =NULL
      ,[int160] =NULL
      ,[int790] =NULL
      ,[intl0] =NULL
      ,[inty0] =NULL
      ,[intey] =NULL
      ,[int16y] =NULL
      ,[int79y] =NULL
      ,[intly] =NULL
      ,[intyy] =NULL
      ,[yks160] =NULL
      ,[yks790] =NULL
      ,[yksl0] =NULL
      ,[yksy0] =NULL
      ,[yks161] =NULL
      ,[yks791] =NULL
      ,[yksl1] =NULL
      ,[yksy1] =NULL
      ,[yks162] =NULL
      ,[yks792] =NULL
      ,[yksl2] =NULL
      ,[yksy2] =NULL
      ,[yks164] =NULL
      ,[yks794] =NULL
      ,[yksl4] =NULL
      ,[yksy4] =NULL
      ,[yks16t] =NULL
      ,[yks79t] =NULL
      ,[ykslt] =NULL
      ,[yksyt] =NULL
      ,[yks16y] =NULL
      ,[yks79y] =NULL
      ,[yksly] =NULL
      ,[yksyy] =NULL
      ,[tehoosa] =NULL
      ,[ertuosa] =NULL
      ,[eritosa] =NULL
      ,[tehotuki] =NULL
      ,[ertutuki] =NULL
      ,[erittuki] =NULL
      ,[tehoavu] =NULL
      ,[ertuavu] =NULL
      ,[eritavu] =NULL
      ,[tehomuu] =NULL
      ,[ertumuu] =NULL
      ,[eritmuu] =NULL
      ,[alc] =NULL
      ,[ylc] =NULL
      ,[luc] =NULL
      ,[amc] =NULL
      ,[alkieli0] =NULL
      ,[alkieli1] =NULL
      ,[alkieli2] =NULL
      ,[alkieli3] =NULL
      ,[alkieli4] =NULL
      ,[alkieliy] =NULL
      ,[ylkieli0] =NULL
      ,[ylkieli1] =NULL
      ,[ylkieli2] =NULL
      ,[ylkieli3] =NULL
      ,[ylkieli4] =NULL
      ,[ylkieli5] =NULL
      ,[ylkieliy] =NULL
      ,[lukieli0] =NULL
      ,[lukieli1] =NULL
      ,[lukieli2] =NULL
      ,[lukieli3] =NULL
      ,[lukieli4] =NULL
      ,[lukieli5] =NULL
      ,[lukieli6] =NULL
      ,[lukieliy] =NULL
      ,[amkieli0] =NULL
      ,[amkieli1] =NULL
      ,[amkieli2] =NULL
      ,[amkieli3] =NULL
      ,[amkieli4] =NULL
      ,[amkieli5] =NULL
      ,[amkieli6] =NULL
      ,[amkieliy] =NULL
      ,[aleny] =NULL
      ,[alruy] =NULL
      ,[alsuy] =NULL
      ,[alray] =NULL
      ,[alsay] =NULL
      ,[alvey] =NULL
      ,[alesy] =NULL
      ,[ality] =NULL
      ,[alsaay] =NULL
      ,[almuy] =NULL
      ,[yleny] =NULL
      ,[ylruy] =NULL
      ,[ylsuy] =NULL
      ,[ylray] =NULL
      ,[ylsay] =NULL
      ,[ylvey] =NULL
      ,[ylesy] =NULL
      ,[ylity] =NULL
      ,[ylsaay] =NULL
      ,[yllaty] =NULL
      ,[ylmuy] =NULL
      ,[lueny] =NULL
      ,[luruy] =NULL
      ,[lusuy] =NULL
      ,[luray] =NULL
      ,[lusay] =NULL
      ,[luvey] =NULL
      ,[luesy] =NULL
      ,[luity] =NULL
      ,[lusaay] =NULL
      ,[lulaty] =NULL
      ,[lumuy] =NULL
      ,[ameny] =NULL
      ,[amruy] =NULL
      ,[amsuy] =NULL
      ,[amray] =NULL
      ,[amsay] =NULL
      ,[amvey] =NULL
      ,[amesy] =NULL
      ,[amity] =NULL
      ,[amsaay] =NULL
      ,[amlaty] =NULL
      ,[ammuy] =NULL
      ,[ov1c] =NULL
      ,[ov2c] =NULL
      ,[ov3c] =NULL
      ,[ov4c] =NULL
      ,[ov5c] =NULL
      ,[ov6c] =NULL
      ,[ov16yc] =NULL
      ,[ov16nc] =NULL
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1] =NULL
      ,[it1] =NULL
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2] =NULL
      ,[it2] =NULL
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3] =NULL
      ,[it3] =NULL
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4] =NULL
      ,[it4] =NULL
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5] =NULL
      ,[it5] =NULL
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6] =NULL
      ,[it6] =NULL
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy] =NULL
      ,[ity] =NULL
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn] =NULL
      ,[itn] =NULL
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1] =NULL
      ,[vit1] =NULL
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2] =NULL
      ,[vit2] =NULL
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3] =NULL
      ,[vit3] =NULL
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4] =NULL
      ,[vit4] =NULL
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5] =NULL
      ,[vit5] =NULL
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6] =NULL
      ,[vit6] =NULL
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy] =NULL
      ,[vity] =NULL
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn] =NULL
      ,[vitn] =NULL
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc] =NULL
      ,[ov79nc] =NULL
      ,[yaen1] =NULL
      ,[yaru1] =NULL
      ,[yasu1] =NULL
      ,[yara1] =NULL
      ,[yasa1] =NULL
      ,[yave1] =NULL
      ,[yaes1] =NULL
      ,[yait1] =NULL
      ,[yasaa1] =NULL
      ,[yalat1] =NULL
      ,[yamuu1] =NULL
      ,[yaen2] =NULL
      ,[yaru2] =NULL
      ,[yasu2] =NULL
      ,[yara2] =NULL
      ,[yasa2] =NULL
      ,[yave2] =NULL
      ,[yaes2] =NULL
      ,[yait2] =NULL
      ,[yasaa2] =NULL
      ,[yalat2] =NULL
      ,[yamuu2] =NULL
      ,[yyen] =NULL
      ,[yyru] =NULL
      ,[yysu] =NULL
      ,[yyra] =NULL
      ,[yysa] =NULL
      ,[yen] =NULL
      ,[yru] =NULL
      ,[ysu] =NULL
      ,[yra] =NULL
      ,[ysa] =NULL
      ,[yve] =NULL
      ,[yes] =NULL
      ,[yit] =NULL
      ,[ysaa] =NULL
      ,[ylat] =NULL
      ,[ymuu] =NULL
      ,[enyy] =NULL
      ,[ruyy] =NULL
      ,[suyy] =NULL
      ,[rayy] =NULL
      ,[sayy] =NULL
      ,[veyy] =NULL
      ,[esyy] =NULL
      ,[ityy] =NULL
      ,[saayy] =NULL
      ,[layy] =NULL
      ,[muyy] =NULL
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n] =NULL
      ,[yait1n] =NULL
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n] =NULL
      ,[yait2n] =NULL
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn] =NULL
      ,[yitn] =NULL
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn] =NULL
      ,[itnn] =NULL
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl] =NULL
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl] =NULL
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl] =NULL
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc] =NULL
      ,[ov89nc] =NULL
      ,[ai] =NULL
      ,[rsb] =NULL
      ,[ma] =NULL
      ,[yl] =NULL
      ,[bi] =NULL
      ,[ge] =NULL
      ,[fy] =NULL
      ,[ke] =NULL
      ,[ter] =NULL
      ,[ue] =NULL
      ,[eti] =NULL
      ,[hi] =NULL
      ,[yh] =NULL
      ,[mus] =NULL
      ,[ku] =NULL
      ,[tt] =NULL
      ,[ts] =NULL
      ,[li] =NULL
      ,[ko] =NULL
      ,[yhd] =NULL
      ,[ain] =NULL
      ,[rsbn] =NULL
      ,[man] =NULL
      ,[yln] =NULL
      ,[bin] =NULL
      ,[gen] =NULL
      ,[fyn] =NULL
      ,[ken] =NULL
      ,[tern] =NULL
      ,[uen] =NULL
      ,[etin] =NULL
      ,[hin] =NULL
      ,[yhn] =NULL
      ,[musn] =NULL
      ,[kun] =NULL
      ,[ttn] =NULL
      ,[tsn] =NULL
      ,[lin] =NULL
      ,[kon] =NULL
      ,[yhdn] =NULL
      ,[tietop] =NULL
      ,[tietok] =NULL
      ,[tietoi] =NULL
      ,[verkko] =NULL
      ,[kaytto] =NULL
      ,[tietolahde]
      ,[rivinumero]
  from dbo.sa_2_1_Peruskoulutiedosto_11
*/


--Historia-aineisto 8.3
--Historia-aineistossa 7-9 luokkien A1 ja A2 kielivalinnat on summattu, tässä näkymässä ne merkitään A1-kieliksi
    SELECT [tilv]
      ,[jarj] = null
      ,[tiedtype] = null
      ,[tunn]
      ,[edesi] = null
      ,[edala] = null
      ,[edyla] = null
      ,[edlisa] = null
      ,[edainep] = null
      ,[syesi] = null
      ,[syala] = null
      ,[syyla] = null
      ,[sylisa] = null
      ,[symamu] = null
      ,[sylukio] = null
      ,[syamm] = null
      ,[symuu] = null
      ,[keve] = null
      ,[keven] = null
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10] = null
      ,[kev10n] = null
      ,[kev] = null
      ,[kevn] = null
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim] = null
      ,[kelaimn] = null
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy] = null
      ,[oeriyn] = null
      ,[ilmtod] = null --eitod?
      ,[ilmtodn] = null --eitodn?
      ,[aku] = null
      ,[mamukurs] = null
      ,[oppkurs] = null
      ,[muukurs] = null
      ,[akukurs] = null
      ,[kmamu] = null
      ,[kmamun] = null
      ,[syulkom] = null
      ,[syulkomn] = null
      ,[sykoti] = null
      ,[sykotin] = null
      ,[ika4e] = null
      ,[ika4en] = null
      ,[ika5e] = null
      ,[ika5en] = null
      ,[pid5v] = null
      ,[ika6e] = null
      ,[ika6en] = null
      ,[ika7e] = null
      ,[ika7en] = null
      ,[ikae] = null
      ,[ikaen] = null
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe] = null
      ,[teho1] = null
      ,[teho2] = null
      ,[teho3] = null
      ,[teho4] = null
      ,[teho5] = null
      ,[teho6] = null
      ,[teho7] = null
      ,[teho8] = null
      ,[teho9] = null
      ,[teho10] = null
      ,[tehoy] = null
      ,[eipide] = null
      ,[eipid1] = null
      ,[eipid2] = null
      ,[eipid3] = null
      ,[eipid4] = null
      ,[eipid5] = null
      ,[eipid6] = null
      ,[eipid7] = null
      ,[eipid8] = null
      ,[eipid9] = null
      ,[eipid10] = null
      ,[eipidy] = null
      ,[ertuve] = null
      ,[ertuv1] = null
      ,[ertuv2] = null
      ,[ertuv3] = null
      ,[ertuv4] = null
      ,[ertuv5] = null
      ,[ertuv6] = null
      ,[ertuv7] = null
      ,[ertuv8] = null
      ,[ertuv9] = null
      ,[ertuv10] = null
      ,[ertuvy] = null
      ,[ertume] = null
      ,[ertum1] = null
      ,[ertum2] = null
      ,[ertum3] = null
      ,[ertum4] = null
      ,[ertum5] = null
      ,[ertum6] = null
      ,[ertum7] = null
      ,[ertum8] = null
      ,[ertum9] = null
      ,[ertum10] = null
      ,[ertumy] = null 
      ,[tavove] = null
      ,[tavov1] = null
      ,[tavov2] = null
      ,[tavov3] = null
      ,[tavov4] = null
      ,[tavov5] = null
      ,[tavov6] = null
      ,[tavov7] = null
      ,[tavov8] = null
      ,[tavov9] = null
      ,[tavov10] = null
      ,[tavovy] = null
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen] = null
      ,[teho1n] = null
      ,[teho2n] = null
      ,[teho3n] = null
      ,[teho4n] = null
      ,[teho5n] = null
      ,[teho6n] = null
      ,[teho7n] = null
      ,[teho8n] = null
      ,[teho9n] = null
      ,[teho10n] = null
      ,[tehoyn] = null
      ,[eipiden] = null
      ,[eipid1n] = null
      ,[eipid2n] = null
      ,[eipid3n] = null
      ,[eipid4n] = null
      ,[eipid5n] = null
      ,[eipid6n] = null
      ,[eipid7n] = null
      ,[eipid8n] = null
      ,[eipid9n] = null
      ,[eipid10n] = null
      ,[eipidyn] = null
      ,[ertuven] = null
      ,[ertuv1n] = null
      ,[ertuv2n] = null
      ,[ertuv3n] = null
      ,[ertuv4n] = null
      ,[ertuv5n] = null
      ,[ertuv6n] = null
      ,[ertuv7n] = null
      ,[ertuv8n] = null
      ,[ertuv9n] = null
      ,[ertuv10n] = null
      ,[ertuvyn] = null
      ,[ertumen] = null
      ,[ertum1n] = null
      ,[ertum2n] = null
      ,[ertum3n] = null
      ,[ertum4n] = null
      ,[ertum5n] = null
      ,[ertum6n] = null
      ,[ertum7n] = null
      ,[ertum8n] = null
      ,[ertum9n] = null
      ,[ertum10n] = null
      ,[ertumyn] = null
      ,[tavoven] = null
      ,[tavov1n] = null
      ,[tavov2n] = null
      ,[tavov3n] = null
      ,[tavov4n] = null
      ,[tavov5n] = null
      ,[tavov6n] = null
      ,[tavov7n] = null
      ,[tavov8n] = null
      ,[tavov9n] = null
      ,[tavov10n] = null
      ,[tavovyn] = null
      ,[eipidec] = null
      ,[eipidpc] = null
      ,[eipidlc] = null
      ,[eipidyc] = null
      ,[ertuvec] = null
      ,[ertuvpc] = null
      ,[ertuvlc] = null
      ,[ertuvyc] = null
      ,[ertumec] = null
      ,[ertumpc] = null
      ,[ertumlc] = null
      ,[ertumyc] = null
      ,[muuec] = null
      ,[muupc] = null
      ,[muulc] = null
      ,[muuyc] = null
      ,[ovec] = null
      ,[ovpc] = null
      ,[ovlc] = null
      ,[ovyc] = null
      ,[sisae] = null
      ,[sisap] = null
      ,[sisal] = null
      ,[sisam] = null
      ,[sisay] = null
      ,[maeipide] = null
      ,[maeipidp] = null
      ,[maeipidl] = null
      ,[maeipidy] = null
      ,[maertuve] = null
      ,[maertuvp] = null
      ,[maertuvl] = null
      ,[maertuvy] = null
      ,[maertume] = null
      ,[maertump] = null
      ,[maertuml] = null
      ,[maertumy] = null
      ,[mamuue] = null
      ,[mamuup] = null
      ,[mamuul] = null
      ,[mamuuy] = null
      ,[maove] = null
      ,[maovp] = null
      ,[maovl] = null
      ,[maovy] = null
      ,[kueipide] = null
      ,[kueipidp] = null
      ,[kueipidl] = null
      ,[kueipidy] = null
      ,[kuertuve] = null
      ,[kuertuvp] = null
      ,[kuertuvl] = null
      ,[kuertuvy] = null
      ,[kuertume] = null
      ,[kuertump] = null
      ,[kuertuml] = null
      ,[kuertumy] = null
      ,[kumuue] = null
      ,[kumuup] = null
      ,[kumuul] = null
      ,[kumuuy] = null
      ,[kuove] = null
      ,[kuovp] = null
      ,[kuovl] = null
      ,[kuovy] = null
      ,[vieipide] = null
      ,[vieipidp] = null
      ,[vieipidl] = null
      ,[vieipidy] = null
      ,[viertuve] = null
      ,[viertuvp] = null
      ,[viertuvl] = null
      ,[viertuvy] = null
      ,[viertume] = null
      ,[viertump] = null
      ,[viertuml] = null
      ,[viertumy] = null
      ,[vimuue] = null
      ,[vimuup] = null
      ,[vimuul] = null
      ,[vimuuy] = null
      ,[viove] = null
      ,[viovp] = null
      ,[viovl] = null
      ,[viovy] = null
      ,[ika61] = null
      ,[ika61n] = null
      ,[ika71] = null
      ,[ika71n] = null
      ,[ika81] = null
      ,[ika81n] = null
      ,[ika91] = null
      ,[ika91n] = null
      ,[ika1] = null
      ,[ika1n] = null
      ,[lykk]
      ,[lykkn]
      ,[jopo] = null
      ,[jopon] = null
      ,[kan17v] = null
      ,[muu17v] = null
      ,[op17v] = null
      ,[lukoko] = null
      ,[lukokon] = null
      ,[luib] = null
      ,[luibn] = null
      ,[reife] = null
      ,[reifen] = null
      ,[gymn] = null
      ,[gymnn] = null
      ,[lueb] = null
      ,[luebn] = null
      ,[lukio] = null
      ,[lukion] = null
      ,[opsamm] = null
      ,[opsammn] = null
      ,[muuamm] = null
      ,[muuammn] = null
      ,[amm] = null
      ,[ammn] = null
      ,[peain] = null
      ,[peainn] = null
      ,[luain] = null
      ,[luainn] = null
      ,[vapsiv] = null
      ,[vapsivn] = null
      ,[taiop] = null
      ,[taiopn] = null
      ,[muukoul] = null
      ,[muukouln] = null
      ,[muuop] = null
      ,[muuopn] = null
      ,[tehoec] = null
      ,[teho16c] = null
      ,[teho79c] = null
      ,[teholc] = null
      ,[tehoyc] = null
      ,[ertuec] = null
      ,[ertu16c] = null
      ,[ertu79c] = null
      ,[ertulc] = null
      ,[ertuyc] = null
      ,[eritec] = null
      ,[erit16c] = null
      ,[erit79c] = null
      ,[eritlc] = null
      ,[erityc] = null
      ,[inte4] = null
      ,[int164] = null
      ,[int794] = null
      ,[intl4] = null
      ,[inty4] = null
      ,[inte3] = null
      ,[int163] = null
      ,[int793] = null
      ,[intl3] = null
      ,[inty3] = null
      ,[inte2] = null
      ,[int162] = null
      ,[int792] = null
      ,[intl2] = null
      ,[inty2] = null
      ,[inte1] = null
      ,[int161] = null
      ,[int791] = null
      ,[intl1] = null
      ,[inty1] = null
      ,[inte0] = null
      ,[int160] = null
      ,[int790] = null
      ,[intl0] = null
      ,[inty0] = null
      ,[intey] = null
      ,[int16y] = null
      ,[int79y] = null
      ,[intly] = null
      ,[intyy] = null
      ,[yks160] = null
      ,[yks790] = null
      ,[yksl0] = null
      ,[yksy0] = null
      ,[yks161] = null
      ,[yks791] = null
      ,[yksl1] = null
      ,[yksy1] = null
      ,[yks162] = null
      ,[yks792] = null
      ,[yksl2] = null
      ,[yksy2] = null
      ,[yks164] = null
      ,[yks794] = null
      ,[yksl4] = null
      ,[yksy4] = null
      ,[yks16t] = null
      ,[yks79t] = null
      ,[ykslt] = null
      ,[yksyt] = null
      ,[yks16y] = null
      ,[yks79y] = null
      ,[yksly] = null
      ,[yksyy] = null
      ,[tehoosa] = null
      ,[ertuosa] = null
      ,[eritosa] = null
      ,[tehotuki] = null
      ,[ertutuki] = null
      ,[erittuki] = null
      ,[tehoavu] = null
      ,[ertuavu] = null
      ,[eritavu] = null
      ,[tehomuu] = null
      ,[ertumuu] = null
      ,[eritmuu] = null
      ,[alc] = null
      ,[ylc] = null
      ,[luc] = null
      ,[amc] = null
      ,[alkieli0] = null
      ,[alkieli1] = null
      ,[alkieli2] = null
      ,[alkieli3] = null
      ,[alkieli4] = null
      ,[alkieliy] = null
      ,[ylkieli0] = null
      ,[ylkieli1] = null
      ,[ylkieli2] = null
      ,[ylkieli3] = null
      ,[ylkieli4] = null
      ,[ylkieli5] = null
      ,[ylkieliy] = null
      ,[lukieli0] = null
      ,[lukieli1] = null
      ,[lukieli2] = null
      ,[lukieli3] = null
      ,[lukieli4] = null
      ,[lukieli5] = null
      ,[lukieli6] = null
      ,[lukieliy] = null
      ,[amkieli0] = null
      ,[amkieli1] = null
      ,[amkieli2] = null
      ,[amkieli3] = null
      ,[amkieli4] = null
      ,[amkieli5] = null
      ,[amkieli6] = null
      ,[amkieliy] = null
      ,[aleny] = null
      ,[alruy] = null
      ,[alsuy] = null
      ,[alray] = null
      ,[alsay] = null
      ,[alvey] = null
      ,[alesy] = null
      ,[ality] = null
      ,[alsaay] = null
      ,[almuy] = null
      ,[yleny] = null
      ,[ylruy] = null
      ,[ylsuy] = null
      ,[ylray] = null
      ,[ylsay] = null
      ,[ylvey] = null
      ,[ylesy] = null
      ,[ylity] = null
      ,[ylsaay] = null
      ,[yllaty] = null
      ,[ylmuy] = null
      ,[lueny] = null
      ,[luruy] = null
      ,[lusuy] = null
      ,[luray] = null
      ,[lusay] = null
      ,[luvey] = null
      ,[luesy] = null
      ,[luity] = null
      ,[lusaay] = null
      ,[lulaty] = null
      ,[lumuy] = null
      ,[ameny] = null
      ,[amruy] = null
      ,[amsuy] = null
      ,[amray] = null
      ,[amsay] = null
      ,[amvey] = null
      ,[amesy] = null
      ,[amity] = null
      ,[amsaay] = null
      ,[amlaty] = null
      ,[ammuy] = null
      ,[ov1c] = null
      ,[ov2c] = null
      ,[ov3c] = null
      ,[ov4c] = null
      ,[ov5c] = null
      ,[ov6c] = null
      ,[ov16yc] = null
      ,[ov16nc] = null
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1] = null
      ,[it1] = null
      ,[saa1]
      ,[mu1]
      ,[eopis1] = null
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2] = null
      ,[it2] = null
      ,[saa2]
      ,[mu2]
      ,[eopis2] = null
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3] = null
      ,[it3] = null
      ,[saa3]
      ,[mu3]
      ,[eopis3] = null
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4] = null
      ,[it4] = null
      ,[saa4]
      ,[mu4]
      ,[eopis4] = null
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5] = null
      ,[it5] = null
      ,[saa5]
      ,[mu5]
      ,[eopis5] = null
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6] = null
      ,[it6] = null
      ,[saa6]
      ,[mu6]
      ,[eopis6] = null
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy] = null
      ,[ity] = null
      ,[saay]
      ,[muy]
      ,[eopisy] = null
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn] = null
      ,[itn] = null
      ,[saan]
      ,[mun]
      ,[eopisn] = null
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1] = null
      ,[vit1] = null
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2] = null
      ,[vit2] = null
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3] = null
      ,[vit3] = null
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4] = null
      ,[vit4] = null
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5] = null
      ,[vit5] = null
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6] = null
      ,[vit6] = null
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy] = null
      ,[vity] = null
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn] = null
      ,[vitn] = null
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc] = null
      ,[ov79nc] = null
      ,[yaen1] = yaen
      ,[yaru1] = yaru
      ,[yasu1] = yasu
      ,[yara1] = yara
      ,[yasa1] = yasa
      ,[yave1] = yave
      ,[yaes1] = null
      ,[yait1] = null
      ,[yasaa1] = yasaa
      ,[yalat1] = yalat
      ,[yamuu1] = yamu
      ,[yaen2] = null
      ,[yaru2] = null
      ,[yasu2] = null
      ,[yara2] = null
      ,[yasa2] = null
      ,[yave2] = null
      ,[yaes2] = null
      ,[yait2] = null
      ,[yasaa2] = null
      ,[yalat2] = null
      ,[yamuu2] = null
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes] = null
      ,[yit] = null
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy] = null
      ,[ityy] = null
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n] = yaenn
      ,[yaru1n] = yarun
      ,[yasu1n] = yasun
      ,[yara1n] = yaran
      ,[yasa1n] = yasan
      ,[yave1n] = yaven
      ,[yaes1n] = null
      ,[yait1n] = null
      ,[yasaa1n] = yasaan
      ,[yalat1n] = yalatn
      ,[yamuu1n] = yamun
      ,[yaen2n] = null
      ,[yaru2n] = null
      ,[yasu2n] = null
      ,[yara2n] = null
      ,[yasa2n] = null
      ,[yave2n] = null
      ,[yaes2n] = null
      ,[yait2n] = null
      ,[yasaa2n] = null
      ,[yalat2n] = null
      ,[yamuu2n] = null
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn] = null
      ,[yitn] = null
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn] = null
      ,[itnn] = null
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv] = null
      ,[arv] = null
      ,[asvrv] = null
      ,[ysv] = null
      ,[yrv] = null
      ,[ysvrv] = null
      ,[sv] = null
      ,[rv] = null
      ,[svrv] = null
      ,[aev] = null
      ,[aort] = null
      ,[aisl] = null
      ,[amu] = null
      ,[aet] = null
      ,[aeos] = null
      ,[akay] = null
      ,[yev] = null
      ,[yort] = null
      ,[yisl] = null
      ,[ymu] = null
      ,[yet] = null
      ,[yeos] = null
      ,[ykay] = null
      ,[ev] = null
      ,[ort] = null
      ,[isl] = null
      ,[mu] = null
      ,[et] = null
      ,[eos] = null
      ,[kay] = null
      ,[ov89yc] = null
      ,[ov89nc] = null
      ,[ai] = null
      ,[rsb] = null
      ,[ma] = null--ma14m+ma14n+ma12m+ma12n+ma1m+ma1n+ma2m+ma2n+ma3m+ma3n
      ,[yl] = null
      ,[bi] = null--bi14m+bi14n+bi12m+bi12n+bi1m+bi1n+bi2m+bi2n+bi3m+bi3n
      ,[ge] = null--mt14m+mt14n+mt12m+mt12n+mt1m+mt1n+mt2m+mt2n+mt3m+mt3n
      ,[fy] = null--fy14m+fy14n+fy12m+fy12n+fy1m+fy1n+fy2m+fy2n+fy3m+fy3n
      ,[ke] = null--ke14m+ke14n+ke12m+ke12n+ke1m+ke1n+ke2m+ke2n+ke3m+ke3n
      ,[ter] = null
      ,[ue] = null
      ,[eti] = null
      ,[hi] = null
      ,[yh] = null
      ,[mus] = null
      ,[ku] = null
      ,[tt] = null--tt14m+tt14n+tt12m+tt12n+tt1m+tt1n+tt2m+tt2n+tt3m+tt3n
      ,[ts] = null--ts14m+ts14n+ts12m+ts12n+ts1m+ts1n+ts2m+ts2n+ts3m+ts3n
      ,[li] = null
      ,[ko] = null
      ,[yhd] = null
      ,[ain] = null
      ,[rsbn] = null
      ,[man] = null--ma14n+ma12n+ma1n+ma2n+ma3n
      ,[yln] = null
      ,[bin] = null--bi14n+bi12n+bi1n+bi2n+bi3n
      ,[gen] = null--mt14n+mt12n+mt1n+mt2n+mt3n
      ,[fyn] = null--fy14n+fy12n+fy1n+fy2n+fy3n
      ,[ken] = null--ke14n+ke12n+ke1n+ke2n+ke3n
      ,[tern] = null
      ,[uen] = null
      ,[etin] = null
      ,[hin] = null
      ,[yhn] = null
      ,[musn] = null
      ,[kun] = null
      ,[ttn] = null--tt14n+tt12n+tt1n+tt2n+tt3n
      ,[tsn] = null--ts14n+ts12n+ts1n+ts2n+ts3n
      ,[lin] = null
      ,[kon] = null
      ,[yhdn] = null
      ,[tietop] = null
      ,[tietok] = null
      ,[tietoi] = null
      ,[verkko] = null
      ,[kaytto] = null
      ,[tietolahde]=''R2.22_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_8_3_sopv_16]


UNION ALL

  SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]=''R2.22_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_12]
  UNION ALL
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]=''R2.22_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_13]
  UNION ALL
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]=''R2.22_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_14]
   UNION ALL
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]=''R2.22_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_15]
     UNION ALL
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]=''R2.22_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_16]
    UNION ALL
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]=''R2.22_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_17]

UNION ALL

SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]=''R2.22_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_18]

UNION ALL

SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu] = NULL
      ,[kmamun] = NULL
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm] = NULL
      ,[opsammn] = NULL
      ,[muuamm] = NULL
      ,[muuammn] = NULL
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]=''R2.22_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22_sopv_19]

  ) Aineistot



' 
GO
/****** Object:  View [dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
Select * into [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan] FROM [TK_H9098_CSC].[dbo].[TK_v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
Truncate table [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
Insert into [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
  Select * FROM [VipunenTK_SA].[dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+''0101'' as date)
      ,[sp] = CAST(kaikkivuodet.sp as nvarchar(10))
      ,[aikielir1] = CAST(kaikkivuodet.aikielir1 as nvarchar(10))
      ,[ikar1] = CAST(kaikkivuodet.ikar1 as nvarchar(10))
      ,[opmast] = CAST(kaikkivuodet.opmast as nvarchar(10))
	  ,[kaste_t2] = CAST(kaikkivuodet.kaste_t2 as nvarchar(10))
      ,[tutklaja] = CAST(kaikkivuodet.tutklaja as nvarchar(10))
      ,[opmopa] = CAST(kaikkivuodet.opmopa as nvarchar(10))
	  ,[iscfinarrow2013] = CAST(kaikkivuodet.iscfinarrow2013 as nvarchar(10))
      ,[tilvasmaak] = CAST(kaikkivuodet.tilvasmaak as varchar(2))
      ,[tol2008_m1] = CAST(kaikkivuodet.tol2008_m1 as nvarchar(20))
      ,[tol2008_m2] = CAST(kaikkivuodet.tol2008_m2 as nvarchar(20))
      ,[amm2001_m1] = CAST(kaikkivuodet.amm2001_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(kaikkivuodet.amm2001_m2 as nvarchar(20))
      ,[tsekt] = CAST(kaikkivuodet.tsekt as nvarchar(10))
      ,[tmaak] = CAST(kaikkivuodet.tmaak as nvarchar(10))
      ,[sose] = CAST(kaikkivuodet.sose as nvarchar(10))
      ,[lkm] = CAST(kaikkivuodet.lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tilvasmaak]=case tilvasmaak when ''20'' then ''01'' else tilvasmaak end
      ,[tol2008_m1]=''MITENNA''+Replace([tol2008_m1],'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace([tol2008_m2],'','',''.'')
      ,[amm2001_m1]=Case when amm2001_m1=''12'' then ''-1'' else ''MITENNA2001_''+Replace([amm2001_m1],'','',''.'') End --''MITENNA2001_''+Replace([amm2001_m1],'','',''.'')
      ,[amm2001_m2]=Case when left(amm2001_m2,2)=''12'' then ''-1'' else ''MITENNA2001_''+Replace([amm2001_m2],'','',''.'') End --''MITENNA2001_''+Replace([amm2001_m2],'','',''.'')
      ,[tsekt]
      ,[tmaak]=case tmaak when ''20'' then ''01'' else tmaak end
      ,[sose]
      ,[lkm]
      ,[tietolahde]=''R4_14_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14_sopv_11]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tilvasmaak]=case tilvasmaak when ''99'' then ''-1'' when ''20'' then ''01'' else tilvasmaak end
      ,[tol2008_m1]=''MITENNA''+Replace([tol2008_m1],'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace([tol2008_m2],'','',''.'')
      ,[amm2001_m1]=Case when amm2001_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2001_m1],'','',''.'') end
      ,[amm2001_m2]=Case when left(amm2001_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2001_m2],'','',''.'') end
      ,[tsekt]
      ,[tmaak]=case tmaak when ''20'' then ''01'' else tmaak end
      ,[sose]
      ,[lkm]
      ,[tietolahde]=''R4_14_2010_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14_2010_sopv_13]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace([tol2008_m1],'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace([tol2008_m2],'','',''.'')
      ,[amm2001_m1]=Case when amm2001_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2001_m1],'','',''.'') end
      ,[amm2001_m2]=Case when left(amm2001_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2001_m2],'','',''.'') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]=''R4_14_2011_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14_2011_sopv_13]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace([tol2008_m1],'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace([tol2008_m2],'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]=''R4_14a_2012_sopv_14''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14a_sopv_14]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]=''R4_14a_2012_sopv_15''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14a_sopv_15]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]=''R4_14a_2012_sopv_16''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14a_sopv_16]
  
UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]=''R4_14a_2012_sopv_17''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_14a_sopv_17]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja]
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]=''R4_14a_2012_sopv_18''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_14a_sopv_18]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja]
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]=''R4_14a_2012_sopv_19''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_19]


) kaikkivuodet



' 
GO
/****** Object:  View [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
Select * into [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan] FROM [VipunenTK_SA].[dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
Truncate table [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
Insert into [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
  Select * FROM [VipunenTK_SA].[dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+''0101'' as date)
      ,[ikar1] = CAST(kaikkivuodet.ikar1 as nvarchar(10))
      ,[opmast] = CAST(kaikkivuodet.opmast as nvarchar(10))
	  ,[kaste_t2] = CAST(kaikkivuodet.kaste_t2 as nvarchar(10))
      ,[tutklaja] = CAST(kaikkivuodet.tutklaja as nvarchar(10))
      ,[opmopa] = CAST(kaikkivuodet.opmopa as nvarchar(10))
	  ,[iscfinarrow2013] = CAST(kaikkivuodet.iscfinarrow2013 as nvarchar(10))
      ,[tol2008_m1] = CAST(kaikkivuodet.tol2008_m1 as nvarchar(20))
      ,[tol2008_m2] = CAST(kaikkivuodet.tol2008_m2 as nvarchar(20))
	  ,[tol2008] = CAST(kaikkivuodet.tol2008 as nvarchar(20))
      ,[amm2001_m1] = CAST(kaikkivuodet.amm2001_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(kaikkivuodet.amm2001_m2 as nvarchar(20))
      ,[tmaak] = CAST(kaikkivuodet.tmaak as nvarchar(10))
      ,[lkm] = CAST(kaikkivuodet.lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
 

SELECT [tilv]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tol2008_m1]=''MITENNA''+Replace([tol2008_m1],'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace([tol2008_m2],'','',''.'')
	  ,[tol2008]=''TOL''+tol2008
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]=''R4_14b_sopv_14''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14b_sopv_14]
UNION All
SELECT [tilv]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
	  ,[tol2008]=''TOL''+tol2008
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]=''R4_14b_sopv_15''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14b_sopv_15]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
	  ,[tol2008]=''TOL''+tol2008
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]=''R4_14b_sopv_16''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14b_sopv_16]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
	  ,[tol2008]=''TOL''+tol2008
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]=''R4_14b_sopv_17''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_14b_sopv_17]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja]
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
	  ,[tol2008]=''TOL''+tol2008
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]=''R4_14b_sopv_18''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_14b_sopv_18]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja]
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
	  ,[tol2008]=''TOL''+tol2008
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]=''R4_14b_sopv_19''
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_19]

) kaikkivuodet








' 
GO
/****** Object:  View [dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]'))
EXEC dbo.sp_executesql @statement = N'













CREATE VIEW [dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
Select * into [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh] FROM [TK_H9098_CSC].[dbo].[TK_v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
Truncate table [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
Insert into [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
  Select * FROM [VipunenTK_SA].[dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
*/
SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+''0101'' as date)
      ,[aikielir1] = CAST(kaikkivuodet.aikielir1 as nvarchar(10))
      ,[ika] = CAST(kaikkivuodet.ika as nvarchar(10))
      ,[tilvasmaak] = CAST(kaikkivuodet.tilvasmaak as nvarchar(10))
      ,[tol2008_m1] = CAST(kaikkivuodet.tol2008_m1 as nvarchar(20))
      ,[tol2008_m2] = CAST(kaikkivuodet.tol2008_m2 as nvarchar(20))
      ,[amm2001_m1] = CAST(kaikkivuodet.amm2001_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(kaikkivuodet.amm2001_m2 as nvarchar(20))
      ,[tmaak] = CAST(kaikkivuodet.tmaak as nvarchar(10))
      ,[lkm] = CAST(kaikkivuodet.lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]=case tilvasmaak when ''20'' then ''01'' else tilvasmaak end
      ,[tol2008_m1]=''MITENNA''+Replace([tol2008_m1],'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace([tol2008_m2],'','',''.'')
      ,[amm2001_m1]=Case when amm2001_m1=''12'' then ''-1'' else ''MITENNA2001_''+Replace([amm2001_m1],'','',''.'') End --''MITENNA2001_''+Replace([amm2001_m1],'','',''.'')
      ,[amm2001_m2]=Case when left(amm2001_m2,2)=''12'' then ''-1'' else ''MITENNA2001_''+Replace([amm2001_m2],'','',''.'') End --''MITENNA2001_''+Replace([amm2001_m2],'','',''.'')
      ,[tmaak]=case tmaak when ''20'' then ''01'' else tmaak end
      ,[lkm]
      ,[tietolahde]=''R4_15_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_11]
UNION ALL
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]= case tilvasmaak when ''99'' then ''-1'' when ''20'' then ''01'' else tilvasmaak end
      ,[tol2008_m1]=''MITENNA''+Replace([tol2008_m1],'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace([tol2008_m2],'','',''.'')
      ,[amm2001_m1]=Case when amm2001_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2001_m1],'','',''.'') end
      ,[amm2001_m2]=Case when left(amm2001_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2001_m2],'','',''.'') end
      ,[tmaak]=case tmaak when ''20'' then ''01'' else tmaak end
      ,[lkm]
      ,[tietolahde]=''R4_15_2010_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_2010_sopv_13]
UNION ALL
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace([tol2008_m1],'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace([tol2008_m2],'','',''.'')
      ,[amm2001_m1]=Case when amm2001_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2001_m1],'','',''.'') end
      ,[amm2001_m2]=Case when left(amm2001_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2001_m2],'','',''.'') end
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]=''R4_15_2011_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_2011_sopv_13]
UNION ALL
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace([tol2008_m1],'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace([tol2008_m2],'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]=''R4_15_2012_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_14]
UNION ALL
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]=''R4_15_2012_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_15]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]=''R4_15_2012_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_16]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]=''R4_15_2012_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_17]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]=''R4_15_2012_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_18]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]=''MITENNA''+Replace(isnull([tol2008_m1],28),'','',''.'')
      ,[tol2008_m2]=''MITENNA''+Replace(isnull([tol2008_m2],''28.0''),'','',''.'')
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)=''12'' then ''-1'' 
	  when substring(amm2010_m2,4,1)=0 then ''MITENNA2010_''++Replace(LEFT(amm2010_m2,3),'','',''.'')+RIGHT(amm2010_m2,1)
	  else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') end
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]=''R4_15_2012_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_19]
 
 
) kaikkivuodet







' 
GO
/****** Object:  View [dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [dbo].[v_sa_R4_16_Tyossakayvat_ammateittain] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_R4_16_Tyossakayvat_ammateittain]
Select * into [VipunenTK_DW].[dbo].[f_R4_16_Tyossakayvat_ammateittain] FROM [VipunenTK_SA].[dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]
Truncate table [VipunenTK_DW].[dbo].[f_R4_16_Tyossakayvat_ammateittain]
Insert into [VipunenTK_DW].[dbo].[f_R4_16_Tyossakayvat_ammateittain]
Select * FROM [VipunenTK_SA].[dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]
*/

SELECT [tilv] = CAST(tilv as nvarchar(4))
	  ,[tilv_date] = Cast(tilv+''0101'' as date)
      ,[sp] = CAST(sp as nvarchar(10))
      ,[aikielir1] = CAST(aikielir1 as nvarchar(10))
      ,[ika] = CAST(ika as nvarchar(10))
      ,[opmast] = CAST(opmast as nvarchar(10))
	  ,[kaste_t2] = CAST(kaste_t2 as nvarchar(10))
      ,[tutklaja] = CAST(tutklaja as nvarchar(10))
      ,[opmopa] = CAST(opmopa as nvarchar(10))
	  ,[iscfinarrow2013] = CAST(iscfinarrow2013 as nvarchar(10))
      ,[amm2001_m1] = CAST(amm2010_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(amm2010_m2 as nvarchar(20))
      ,[amm2001_m] = CAST(amm2010_m as nvarchar(20))
      ,[lkm] = CAST(lkm as int)
      ,[tietolahde] = CAST(tietolahde as nvarchar(10))
      ,[rivinumero] = CAST(rivinumero as int)
      ,[tmaak] = CAST(tmaak as nvarchar(10))
      ,[amm2001_mnim] = CAST(amm2010_nim as nvarchar(10))
  FROM 
(
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
	  ,[kaste_t2] 
      ,[tutklaja]
      ,[opmopa]=Case when opmopa=''999'' then ''-1'' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2010_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') End
      ,[amm2010_m2]=Case when left(amm2010_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') End
      ,[amm2010_m]=Case when Left(amm2010,2)=''99'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010],'','',''.'') End
      ,[lkm]
      ,[tietolahde]=''R4_16_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]=case tmaak when ''20'' then ''01'' else tmaak end
      ,[amm2010_nim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_11_H]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
	  ,[kaste_t2] 
      ,[tutklaja]
      ,[opmopa]=Case when opmopa=''999'' then ''-1'' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2010_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') End
      ,[amm2010_m2]=Case when left(amm2010_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') End
      ,[amm2010_m]=Case when Left(amm2010,1)=''X'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010],'','',''.'') End
      --,[amm2001_m]=''MITENNA2010_''+Replace([amm2010],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_16_2010_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]=case tmaak when ''20'' then ''01'' else tmaak end
      ,[amm2010_nim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_2010_sopv_13_H]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
	  ,[kaste_t2] 
      ,[tutklaja]
      ,[opmopa]=Case when opmopa=''999'' then ''-1'' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2010_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') End
      ,[amm2010_m2]=Case when left(amm2010_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') End
      ,[amm2010_m]=Case when Left(amm2010,1)=''X'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010],'','',''.'') End
      --,[amm2001_m]=''MITENNA2010_''+Replace([amm2010],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_16_2011_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_2011_sopv_13_H]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
	  ,[kaste_t2] 
      ,[tutklaja]
      ,[opmopa]=Case when opmopa=''999'' then ''-1'' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') End
      ,[amm2001_m2]=Case when left(amm2010_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') End
      --LÄHDEAINEISTOSSA PUUTTUU PISTEET AMMATTILUOKITUKSESTA, KORJAUS TEHDÄÄN ALLA
	  ,[amm2001_m]=Case 
					when amm2010=''99999'' then ''-1'' 
					else LEFT(''MITENNA2010_''+Replace([amm2010],'','',''.'')+''.....'',17) End
      ,[lkm]
      ,[tietolahde]=''R4_16_2011_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_14_H] 
  WHERE tilv!='''' AND tilv!=''asia''
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
	  ,[kaste_t2] 
      ,[tutklaja]
      ,[opmopa]=Case when opmopa=''999'' then ''-1'' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') End
      ,[amm2001_m2]=Case when left(amm2010_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') End
      --LÄHDEAINEISTOSSA PUUTTUU PISTEET AMMATTILUOKITUKSESTA, KORJAUS TEHDÄÄN ALLA
	  ,[amm2001_m]=Case 
					when amm2010=''99999'' then ''-1'' 
					else LEFT(''MITENNA2010_''+Replace([amm2010],'','',''.'')+''.....'',17) End
      ,[lkm]
      ,[tietolahde]=''R4_16_2011_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_15_H] 

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
	  ,[kaste_t2] 
      ,[tutklaja]
      ,[opmopa]=Case when opmopa=''999'' then ''-1'' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') End
      ,[amm2001_m2]=Case when left(amm2010_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') End
      --LÄHDEAINEISTOSSA PUUTTUU PISTEET AMMATTILUOKITUKSESTA, KORJAUS TEHDÄÄN ALLA
	  ,[amm2001_m]=Case 
					when amm2010=''99999'' then ''-1'' 
					else LEFT(''MITENNA2010_''+Replace([amm2010],'','',''.'')+''.....'',17) End
      ,[lkm]
      ,[tietolahde]=''R4_16_2011_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_16_H] 

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
	  ,[kaste_t2] 
      ,[tutklaja]
      ,[opmopa]=Case when opmopa=''999'' then ''-1'' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') End
      ,[amm2001_m2]=Case when left(amm2010_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') End
      --LÄHDEAINEISTOSSA PUUTTUU PISTEET AMMATTILUOKITUKSESTA, KORJAUS TEHDÄÄN ALLA
	  ,[amm2001_m]=Case 
					when amm2010=''99999'' then ''-1'' 
					else LEFT(''MITENNA2010_''+Replace([amm2010],'','',''.'')+''.....'',17) End
      ,[lkm]
      ,[tietolahde]=''R4_16_2011_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_17_H] 

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja]
      ,[opmopa]= NULL --Case when opmopa=''999'' then ''-1'' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') End
      ,[amm2001_m2]=Case when left(amm2010_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') End
      --LÄHDEAINEISTOSSA PUUTTUU PISTEET AMMATTILUOKITUKSESTA, KORJAUS TEHDÄÄN ALLA
	  ,[amm2001_m]=Case 
					when amm2010=''99999'' then ''-1'' 
					else LEFT(''MITENNA2010_''+Replace([amm2010],'','',''.'')+''.....'',17) End
      ,[lkm]
      ,[tietolahde]=''R4_16_2011_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_18]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja]
      ,[opmopa]= NULL --Case when opmopa=''999'' then ''-1'' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]=Case when amm2010_m1=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m1],'','',''.'') End
      ,[amm2001_m2]=Case when left(amm2010_m2,2)=''12'' then ''-1'' else ''MITENNA2010_''+Replace([amm2010_m2],'','',''.'') End
      --LÄHDEAINEISTOSSA PUUTTUU PISTEET AMMATTILUOKITUKSESTA, KORJAUS TEHDÄÄN ALLA
	  ,[amm2001_m]=Case 
					when amm2010=''99999'' then ''-1'' 
					else LEFT(''MITENNA2010_''+Replace([amm2010],'','',''.'')+''.....'',17) End
      ,[lkm]
      ,[tietolahde]=''R4_16_2011_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_19]

) kaikkivuodet




' 
GO
/****** Object:  View [dbo].[v_sa_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]'))
EXEC dbo.sp_executesql @statement = N'





/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_R4_17_Elakkeelle_siirt_ja_heidan_ammatti] AS

/******************

HUOM! SISÄLTÄÄ A- JA B-AINEISTON

******************/


SELECT [tilv] = CAST([tilv] AS nvarchar(4))
	  ,[tilv_date] = CAST(tilv+''0101'' as date)
      ,[lahde] = CAST([lahde] as nvarchar(10))
      ,[sp] = CAST([sp] as nvarchar(10))
      ,[aikielir1] = CAST([aikielir1] as nvarchar(10))
      ,[ika] = CAST([ika] as nvarchar(10))
      ,[elaji] = CAST([elaji] as nvarchar(10))
      ,[elk_koodi] = 
		CASE WHEN [lahde] = ''E'' THEN CAST([elaji] as nvarchar(10))      
		WHEN [lahde] = ''K'' THEN CAST(''100'' as nvarchar(10))     
      END
      ,[ptoim1r8x] = 
      CASE
          WHEN [ptoim1r8x] = 99 THEN CAST(''-1'' as nvarchar(10))
          ELSE CAST([ptoim1r8x] as nvarchar(10))
      END
      ,[tmaakx] = 
		CASE WHEN [tmaakx] = 99 THEN CAST(''-1'' as nvarchar(10))
		ELSE CAST([tmaakx] as nvarchar(10))
      END      
      ,[amm2001_m1x] = 
		CASE WHEN [amm2001_m1_x] = ''XX'' THEN CAST(''-1'' as nvarchar(10))
		ELSE CAST([amm2001_m1_x] as nvarchar(10))
      END
      ,[amm2001_m2x] = 
		CASE WHEN [amm2001_m2_x] LIKE ''%XX%'' THEN CAST(''-1'' as nvarchar(20))
		ELSE CAST([amm2001_m2_x] as nvarchar(20))
	  END
      ,[lkm] = CAST([lkm] as int)
      ,[tietolahde] = CAST([tietolahde] as nvarchar(50))
      ,[rivinumero] = CAST([rivinumero] as int)
      ,[tietojen_ajankohta] = CAST([tietojen_ajankohta] as nvarchar(10))
      ,[tiet_ak] = CAST(CAST([tilv] as int) - 1 AS nvarchar(4))
      ,[tiet_akdate] = CAST(CAST(CAST([tilv] as int) - 1 as nvarchar(10)) + ''0101'' as date)
      ,aineisto = CAST(''R4.17'' as nvarchar(8))

FROM      

(
SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1_x]
--      ,[amm2001_m2x]
      ,[amm2001_m2_x]=''MITENNA2001_''+Replace([amm2001_m2_x],'','',''.'')            
      ,[lkm]
      ,[tietolahde]=''R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
      
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_11]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1_x]
--      ,[amm2001_m2x]
      ,[amm2001_m2_x]=''MITENNA2010_''+Replace([amm2001_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_12]
 
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1_x]
--      ,[amm2001_m2x]
      ,[amm2001_m2_x]=''MITENNA2010_''+Replace([amm2001_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_13] 
 
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--      ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_14]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--      ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_15]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--      ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_16]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--      ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_17]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1_x]
--      ,[amm2001_m2x]
      ,[amm2001_m2_x]=''MITENNA2010_''+Replace([amm2001_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17b_Kuolleet_ja_heidan_ammatti_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_11]
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17b_Kuolleet_ja_heidan_ammatti_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_12]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17b_Kuolleet_ja_heidan_ammatti_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_13]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17b_Kuolleet_ja_heidan_ammatti_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_14]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17b_Kuolleet_ja_heidan_ammatti_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_15]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17b_Kuolleet_ja_heidan_ammatti_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_16]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17b_Kuolleet_ja_heidan_ammatti_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_17]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--      ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_18]
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17b_Kuolleet_ja_heidan_ammatti_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_18]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--      ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
FROM [TK_H9098_CSC].[dbo].[TK_K4_17a_sopv_19]
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]=''MITENNA2010_''+Replace([amm2010_m2_x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_17b_Kuolleet_ja_heidan_ammatti_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''1'' AS tietojen_ajankohta
FROM [TK_H9098_CSC].[dbo].[TK_K4_17b_sopv_19]


) kaikkivuodet




' 
GO
/****** Object:  View [dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]'))
EXEC dbo.sp_executesql @statement = N'







/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin] AS

/******************

HUOM! SISÄLTÄÄ A- JA B-AINEISTON

******************/


SELECT [tilv] = CAST([tilv] AS nvarchar(4))
	  ,[tilv_date] = CAST(tilv+''0101'' as date)
      ,[lahde] = CAST([lahde] as nvarchar(10))
      ,[sp] = CAST([sp] as nvarchar(10))
      ,[aikielir1] = CAST([aikielir1] as nvarchar(10))
      ,[ika] = CAST([ika] as nvarchar(10))
      ,[elaji] = CAST([elaji] as nvarchar(10))
      ,[elk_koodi] = 
		CASE WHEN [lahde] = ''E'' THEN CAST([elaji] as nvarchar(10))      
		WHEN [lahde] = ''K'' THEN CAST(''100'' as nvarchar(10))     
      END      
      ,[ptoim1r8_2x] = 
      CASE
          WHEN [ptoim1r8_2x] = 99 THEN CAST(''-1'' as nvarchar(10))
          ELSE CAST([ptoim1r8_2x] as nvarchar(10))
      END
      ,[tmaak2x] = 
		CASE WHEN [tmaak2x] = 99 THEN CAST(''-1'' as nvarchar(10))
		ELSE CAST([tmaak2x] as nvarchar(10))
      END      
      ,[amm2001_m1_2x] = 
		CASE WHEN [amm2001_m1_2x] = ''XX'' THEN CAST(''-1'' as nvarchar(10))
		ELSE CAST([amm2001_m1_2x] as nvarchar(10))
      END
      ,[amm2001_m2_2x] = 
		CASE WHEN [amm2001_m2_2x] LIKE ''%XX%'' THEN CAST(''-1'' as nvarchar(20))
		ELSE CAST([amm2001_m2_2x] as nvarchar(20))
	  END
      ,[lkm] = CAST([lkm] as int)
      ,[tietolahde] = CAST([tietolahde] as nvarchar(50))
      ,[rivinumero] = CAST([rivinumero] as int)
      ,[tietojen_ajankohta] = CAST([tietojen_ajankohta] as nvarchar(20))
      ,[tiet_ak] = CAST(CAST([tilv] as int) - 2 AS nvarchar(4))
      ,[tiet_akdate] = CAST(CAST(CAST([tilv] as int) - 2 as nvarchar(10)) + ''0101'' as date)   
      ,aineisto = CAST(''R4.18'' as nvarchar(8))         

FROM

(
SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]=''MITENNA2001_''+Replace([amm2001_m2_2x],'','',''.'')      
      ,[lkm]
      ,[tietolahde]=''sa_R4_18a_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_11]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]=''MITENNA2010_''+Replace([amm2001_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18a_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_12]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]=''MITENNA2010_''+Replace([amm2001_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18a_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_13]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18a_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_14]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18a_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_15]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18a_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_16] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18a_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_17] 
 
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]=''MITENNA2010_''+Replace([amm2001_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18b_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_11]
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]=''MITENNA2010_''+Replace([amm2001_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18b_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_12]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2001_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18b_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_13]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18b_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_14]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18b_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_15]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18b_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_16]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18b_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_17]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18a_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_18] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18b_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_18]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18a_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18a_sopv_19] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]=''MITENNA2010_''+Replace([amm2010_m2_2x],'','',''.'')
      ,[lkm]
      ,[tietolahde]=''R4_18b_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,''2'' AS tietojen_ajankohta  
FROM [TK_H9098_CSC].[dbo].[TK_K4_18b_sopv_19]

) kaikkivuodet




' 
GO
/****** Object:  View [dbo].[v_sa_R4_19_Tyollisten_ammattisiirtymat]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_R4_19_Tyollisten_ammattisiirtymat]'))
EXEC dbo.sp_executesql @statement = N'




/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_R4_19_Tyollisten_ammattisiirtymat] AS

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2001_m1]
      ,amm2001_m2 = 
			CASE WHEN amm2001_m2 = ''99999'' or amm2001_m2 = '''' THEN ''-1''
			ELSE ''MITENNA2001_'' + replace([amm2001_m2], '','', ''.'')
			END
      ,[ptoim1r7_2009]
      ,[tmaakr1_2009]
      ,[amm2001_m1_2009]
      ,[amm2001_m2_2009] = 
			CASE WHEN amm2001_m2_2009 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2001_'' + replace([amm2001_m2_2009], '','', ''.'')
			END
      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2005 THEN ''tilv+4''
		 WHEN tilv = 2008 THEN ''tilv+1''
		 ELSE ''-1''		 
		END

  FROM [TK_H9098_CSC].[dbo].[TK_R4_19_sopv_11]
  
UNION ALL
  
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2001_m1]
      ,amm2001_m2 = 
			CASE WHEN amm2001_m2 = ''99999'' or amm2001_m2 = '''' THEN ''-1''
			ELSE ''MITENNA2001_'' + replace([amm2001_m2], '','', ''.'')
			END
      ,[ptoim1r7_2010]
      ,[tmaakr1_2010]
      ,[amm2010_m1_2010]
      ,[amm2010_m2_2010] = 
			CASE WHEN amm2010_m2_2010 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2010_'' + replace([amm2010_m2_2010], '','', ''.'')
			END
      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2005 THEN ''tilv+5''
		 WHEN tilv = 2009 THEN ''tilv+1''
		 ELSE ''-1''		 
		END
      
  FROM [TK_H9098_CSC].[dbo].[TK_R4_19_sopv_12]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2001_m1] = CASE 
						WHEN tilv = 2006 then amm2001_m1
						when tilv = 2010 then amm2010_m1
						else ''-1''
					  END
      ,amm2001_m2 = 
			CASE 
				WHEN tilv = 2006 THEN 
					CASE
						WHEN amm2001_m2 = ''99999'' or amm2001_m2 = '''' THEN ''-1''
						ELSE ''MITENNA2001_'' + replace([amm2001_m2], '','', ''.'')
					END
				WHEN tilv = 2010 THEN
					CASE
						WHEN amm2010_m2 = ''99999'' or amm2010_m2 = '''' THEN ''-1''
						ELSE ''MITENNA2010_'' + replace([amm2010_m2], '','', ''.'')
					END
			END
      ,[ptoim1r7_2011]
      ,[tmaakr1_2011]
      ,[amm2010_m1_2011]
      ,[amm2010_m2_2011] = 
			CASE WHEN amm2010_m2_2011 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2010_'' + replace([amm2010_m2_2011], '','', ''.'')
			END
      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2006 THEN ''tilv+5''
		 WHEN tilv = 2010 THEN ''tilv+1''
		 ELSE ''-1''		 
		END

  FROM [TK_H9098_CSC].[dbo].[TK_R4_19_sopv_13]

  UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2001_m1] = CASE 
						WHEN tilv = 2007 then amm2001_m1
						when tilv = 2011 then amm2010_m1
						else ''-1''
					  END
      ,amm2001_m2 = 
			CASE 
				WHEN tilv = 2007 THEN 
					CASE
						WHEN amm2001_m2 = ''99999'' or amm2001_m2 = '''' THEN ''-1''
						ELSE ''MITENNA2001_'' + replace([amm2001_m2], '','', ''.'')
					END
				WHEN tilv = 2011 THEN
					CASE
						WHEN amm2010_m2 = ''99999'' or amm2010_m2 = '''' THEN ''-1''
						ELSE ''MITENNA2010_'' + replace([amm2010_m2], '','', ''.'')
					END
			END
      ,[ptoim1r7_2012]
      ,[tmaakr1_2012]
      ,[amm2010_m1_2012]
      ,[amm2010_m2_2012] = 
			CASE WHEN amm2010_m2_2012 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2010_'' + replace([amm2010_m2_2012], '','', ''.'')
			END
      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2007 THEN ''tilv+5''
		 WHEN tilv = 2011 THEN ''tilv+1''
		 ELSE ''-1''		 
		END

  FROM [TK_H9098_CSC].[dbo].[TK_R4_19_sopv_14]

    UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2001_m1] = CASE 
						WHEN tilv = 2008 then amm2001_m1
						when tilv = 2012 then amm2010_m1
						else ''-1''
					  END
      ,amm2001_m2 = 
			CASE 
				WHEN tilv = 2008 THEN 
					CASE
						WHEN amm2001_m2 = ''99999'' or amm2001_m2 = '''' THEN ''-1''
						ELSE ''MITENNA2001_'' + replace([amm2001_m2], '','', ''.'')
					END
				WHEN tilv = 2012 THEN
					CASE
						WHEN amm2010_m2 = ''99999'' or amm2010_m2 = '''' THEN ''-1''
						ELSE ''MITENNA2010_'' + replace([amm2010_m2], '','', ''.'')
					END
			END
      ,[ptoim1r7_2013]
      ,[tmaakr1_2013]
      ,[amm2010_m1_2013]
      ,[amm2010_m2_2013	  ] = 
			CASE WHEN amm2010_m2_2013 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2010_'' + replace([amm2010_m2_2013], '','', ''.'')
			END
      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2008 THEN ''tilv+5''
		 WHEN tilv = 2012 THEN ''tilv+1''
		 ELSE ''-1''		 
		END

  FROM [TK_H9098_CSC].[dbo].[TK_R4_19_sopv_15]


    UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2001_m1] = CASE 
						WHEN tilv = 2009 then amm2001_m1
						when tilv = 2013 then amm2010_m1
						else ''-1''
					  END
      ,amm2001_m2 = 
			CASE 
				WHEN tilv = 2009 THEN 
					CASE
						WHEN amm2001_m2 = ''99999'' or amm2001_m2 = '''' THEN ''-1''
						ELSE ''MITENNA2001_'' + replace([amm2001_m2], '','', ''.'')
					END
				WHEN tilv = 2013 THEN
					CASE
						WHEN amm2010_m2 = ''99999'' or amm2010_m2 = '''' THEN ''-1''
						ELSE ''MITENNA2010_'' + replace([amm2010_m2], '','', ''.'')
					END
			END
      ,[ptoim1r7_2014]
      ,[tmaakr1_2014]
      ,[amm2010_m1_2014]
      ,[amm2010_m2_2014] = 
			CASE WHEN amm2010_m2_2014 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2010_'' + replace([amm2010_m2_2014], '','', ''.'')
			END
      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2009 THEN ''tilv+5''
		 WHEN tilv = 2013 THEN ''tilv+1''
		 ELSE ''-1''		 
		END

  FROM [TK_H9098_CSC].[dbo].[TK_R4_19_sopv_16]




' 
GO
/****** Object:  View [dbo].[v_sa_R4_20_Tyollisten_aiemmat_ammatit]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_R4_20_Tyollisten_aiemmat_ammatit]'))
EXEC dbo.sp_executesql @statement = N'


/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW [dbo].[v_sa_R4_20_Tyollisten_aiemmat_ammatit] AS

SELECT [tilv]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2001_m1]
      ,amm2001_m2 = 
		CASE
			WHEN amm2001_m2 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2001_'' + replace([amm2001_m2], '','', ''.'')
		END
      ,[ptoim1r7_2004]
      ,[tmaakr1_2004]
      ,[amm2001_m1_2004]
      ,[amm2001_m2_2004] =
		CASE
			WHEN amm2001_m2_2004 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2001_'' + replace([amm2001_m2_2004], '','', ''.'')
		END
      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2009 THEN ''tilv-5''
		 ELSE ''-1''
		END
		      
  FROM [TK_H9098_CSC].[dbo].[TK_R4_20_sopv_11]
  
UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2001_m1]
      ,amm2001_m2 = 
		CASE
			WHEN amm2001_m2 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2010_'' + replace([amm2001_m2], '','', ''.'')
		END      
      ,[ptoim1r7_2005]
      ,[tmaakr1_2005]
      ,[amm2001_m1_2005]
      ,[amm2001_m2_2005] =
		CASE
			WHEN amm2001_m2_2005 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2001_'' + replace([amm2001_m2_2005], '','', ''.'')
		END
      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2010 THEN ''tilv-5''
		 ELSE ''-1''
		END      
      
  FROM [TK_H9098_CSC].[dbo].[TK_R4_20_sopv_12]  
  
UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2001_m1]
      ,amm2001_m2 = 
		CASE
			WHEN amm2001_m2 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2010_'' + replace([amm2001_m2], '','', ''.'')
		END
      
      ,[ptoim1r7_2006]
      ,[tmaakr1_2006]
      ,[amm2001_m1_2006]
      ,[amm2001_m2_2006] =
		CASE
			WHEN amm2001_m2_2006 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2001_'' + replace([amm2001_m2_2006], '','', ''.'')
		END

      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2011 THEN ''tilv-5''
		 ELSE ''-1''
		END      
      
  FROM [TK_H9098_CSC].[dbo].[TK_R4_20_sopv_13]

  UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2010_m1]
      ,amm2010_m2 = 
		CASE
			WHEN amm2010_m2 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2010_'' + replace([amm2010_m2], '','', ''.'')
		END
      
      ,[ptoim1r7_2007]
      ,[tmaakr1_2007]
      ,[amm2001_m1_2007]
      ,[amm2001_m2_2007] =
		CASE
			WHEN amm2001_m2_2007 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2001_'' + replace([amm2001_m2_2007], '','', ''.'')
		END

      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2012 THEN ''tilv-5''
		 ELSE ''-1''
		END      
      
  FROM [TK_H9098_CSC].[dbo].[TK_R4_20_sopv_14]

  UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2010_m1]
      ,amm2010_m2 = 
		CASE
			WHEN amm2010_m2 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2010_'' + replace([amm2010_m2], '','', ''.'')
		END
      
      ,[ptoim1r7_2008]
      ,[tmaakr1_2008]
      ,[amm2001_m1_2008]
      ,[amm2001_m2_2008] =
		CASE
			WHEN amm2001_m2_2008 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2001_'' + replace([amm2001_m2_2008], '','', ''.'')
		END

      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2013 THEN ''tilv-5''
		 ELSE ''-1''
		END      
      
  FROM [TK_H9098_CSC].[dbo].[TK_R4_20_sopv_15]

  UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ikar1] = ''5V'' + ikar1
      ,[tmaak] = ''MAAK'' + tmaak
      ,[amm2010_m1]
      ,amm2010_m2 = 
		CASE
			WHEN amm2010_m2 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2010_'' + replace([amm2010_m2], '','', ''.'')
		END
      
      ,[ptoim1r7_2009]
      ,[tmaakr1_2009]
      ,[amm2001_m1_2009]
      ,[amm2001_m2_2009] =
		CASE
			WHEN amm2001_m2_2009 = ''99999'' THEN ''-1''
			ELSE ''MITENNA2001_'' + replace([amm2001_m2_2009], '','', ''.'')
		END

      ,[lkm]
      ,suhteellinen_ajankohta_avain =  
		CASE 
		 WHEN tilv = 2014 THEN ''tilv-5''
		 ELSE ''-1''
		END      
      
  FROM [TK_H9098_CSC].[dbo].[TK_R4_20_sopv_16]


' 
GO
/****** Object:  View [dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat]    Script Date: 4.4.2019 18:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat]'))
EXEC dbo.sp_executesql @statement = N'



/*
drop table [VipunenTK_DW].[dbo].[sa_R4_23_Tyollisten_ammattisiirtymat]
select * into [VipunenTK_DW].[dbo].[sa_R4_23_Tyollisten_ammattisiirtymat] from VipunenTK_SA.[dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat]
*/


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat] AS


SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
      ,[amm2010_m2]
      ,[opmast_2]
	  ,[kaste_t2_2] = null
      ,[opmopa]
	  ,[iscfinarrow2013] = null
      ,[tutklaja]
      ,[opkelp]
      ,[ptoim1r9_s] = [ptoim1r9_2015]
      ,[tmaak_se] = [tmaak_2015]
      ,[tol2008_2_s] = [tol2008_2_2015]
      ,[amm2010_m2_s] = [amm2010_m2_2015]
      ,[opmast_2_s] = [opmast_2_2015]
	  ,[kaste_t2_2_s] = null
      ,[opmopa_s] = [opmopa_2015]
	  ,[iscfinarrow2013_s] = null
      ,[tutklaja_s] = [tutklaja_2015]
      ,[opkelp_s] = [opkelp_2015]
      ,[erik_s] = [erik_2015]
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2010 THEN ''tilv+5''
		 WHEN tilv = 2014 THEN ''tilv+1''
		 ELSE ''-1''		 
		END
	  ,[tietolahde]=''R4_23_sopv_17''
FROM [TK_H9098_CSC].[dbo].[TK_R4_23_sopv_17]

UNION ALL

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
      ,[amm2010_m2]
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja]
      ,[opkelp]
      ,[ptoim1r9_s] = [ptoim1r9_2016]
      ,[tmaak_se] = [tmaak_2016]
      ,[tol2008_2_s] = [tol2008_2_2016]
      ,[amm2010_m2_s] = [amm2010_m2_2016]
      ,[opmast_2_2016] = null
	  ,[kaste_t2_2_2016]
      ,[opmopa_2016] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2016]
      ,[tutklaja_s] = [tutklaja_2016]
      ,[opkelp_s] = [opkelp_2016]
      ,[erik_s] = [erik_2016]
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2011 THEN ''tilv+5''
		 WHEN tilv = 2015 THEN ''tilv+1''
		 ELSE ''-1''		 
		END
	  ,[tietolahde]=''R4_23_sopv_18''
FROM [TK_H9098_CSC].[dbo].[TK_R4_23_sopv_18]

UNION ALL

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
      ,[amm2010_m2]
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja]
      ,[opkelp]
      ,[ptoim1r9_s] = [ptoim1r9_2017]
      ,[tmaak_se] = [tmaak_2017]
      ,[tol2008_2_s] = [tol2008_2_2017]
      ,[amm2010_m2_s] = [amm2010_m2_2017]
      ,[opmast_2_2017] = null
	  ,[kaste_t2_2_2017]
      ,[opmopa_2017] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2017]
      ,[tutklaja_s] = [tutklaja_2017]
      ,[opkelp_s] = [opkelp_2017]
      ,[erik_s] = [erik_2017]
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2011 THEN ''tilv+5''
		 WHEN tilv = 2015 THEN ''tilv+1''
		 ELSE ''-1''		 
		END
	  ,[tietolahde]=''R4_23_sopv_19''
FROM [TK_H9098_CSC].[dbo].[TK_K4_23_sopv_19]








' 
GO
USE [ANTERO]