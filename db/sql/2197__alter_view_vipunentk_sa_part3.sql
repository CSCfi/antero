USE [VipunenTK_SA]
GO
/****** Object:  View [dbo].[v_sa_4_9_Vaestorakenne_kunnittain]    Script Date: 4.4.2019 18:10:22 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_4_9_Vaestorakenne_kunnittain]
GO
/****** Object:  View [dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]    Script Date: 4.4.2019 18:10:22 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
GO
/****** Object:  View [dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]    Script Date: 4.4.2019 18:10:22 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
GO
/****** Object:  View [dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_testaus]    Script Date: 4.4.2019 18:10:22 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_testaus]
GO
/****** Object:  View [dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]    Script Date: 4.4.2019 18:10:22 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]
GO
/****** Object:  View [dbo].[v_sa_4_21_Vaestoennuste]    Script Date: 4.4.2019 18:10:22 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_4_21_Vaestoennuste]
GO
/****** Object:  View [dbo].[v_sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 4.4.2019 18:10:22 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]
GO
/****** Object:  View [dbo].[v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]    Script Date: 4.4.2019 18:10:22 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]
GO
/****** Object:  View [dbo].[v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain]    Script Date: 4.4.2019 18:10:22 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain]
GO
/****** Object:  View [dbo].[v_sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]    Script Date: 4.4.2019 18:10:22 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]
GO
/****** Object:  View [dbo].[v_sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]    Script Date: 4.4.2019 18:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]'))
EXEC dbo.sp_executesql @statement = N'









CREATE VIEW [dbo].[v_sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen] AS

/*
Drop table [VipunenTK_DW].[dbo].[sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]
Select * into [VipunenTK_DW].[dbo].[sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen] FROM VipunenTK_SA.[dbo].[v_sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]

Truncate table [VipunenTK_DW].[dbo].[sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]
Insert into [VipunenTK_DW].[dbo].[sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+''0101'' as date)
      ,[sp] = CAST(kaikkivuodet.sp as nvarchar(10))
      ,[aikielir1] = CAST(kaikkivuodet.aikielir1 as nvarchar(2))
      ,[asmaak] = CAST(kaikkivuodet.asmaak as nvarchar(2))
      ,[asema] = CAST( CASE
		WHEN kaikkivuodet.asema = '''' THEN ''99'' 
		WHEN kaikkivuodet.asema = '' '' THEN ''99'' 
		WHEN kaikkivuodet.asema = ''bl'' THEN ''99'' 
		ELSE kaikkivuodet.asema
		END as nvarchar(10))
      ,[lkm] = CAST(kaikkivuodet.lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_1_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_11]

UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_1_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_12]

UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_1_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_13]

UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_1_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_14]

UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_1_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_15]

UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_1_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_16]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_1_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_17]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_1_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_18]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[asmaak]
      ,[asema]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_1_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_1_sopv_19]

) kaikkivuodet










' 
GO
/****** Object:  View [dbo].[v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain]    Script Date: 4.4.2019 18:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain]'))
EXEC dbo.sp_executesql @statement = N'











CREATE VIEW [dbo].[v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain] AS

/*
Drop table [VipunenTK_DW].[dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain]
Select * into [VipunenTK_DW].[dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain] FROM VipunenTK_SA.[dbo].[v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain]

Truncate table [VipunenTK_DW].[dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain]
Insert into [VipunenTK_DW].[dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+''0101'' as date)
      ,[asmaak] = CAST(kaikkivuodet.asmaak as nvarchar(2))
      ,[aikielir3] = CAST(kaikkivuodet.aikielir3 as nvarchar(2))
      ,[kansalr1] = CAST(kaikkivuodet.kansalr1 as nvarchar(10))
      ,[eumaa] = CAST(kaikkivuodet.eumaa as nvarchar(2))
      ,[etamaa] = CAST(kaikkivuodet.etamaa as nvarchar(2))
      ,[ika0]
      ,[ika1]
      ,[ika2]
      ,[ika3]
      ,[ika4]
      ,[ika5]
      ,[ika6]
      ,[ika7]
      ,[ika8]
      ,[ika9]
      ,[ika10]
      ,[ika11]
      ,[ika12]
      ,[ika13]
      ,[ika14]
      ,[ika15]
      ,[ika16]
      ,[ika17]
      ,[ika18]
      ,[ika19]
      ,[ika20]
      ,[ika21]
      ,[ika22]
      ,[ika23]
      ,[ika24]
      ,[ika25]
      ,[ika26]
      ,[ika27]
      ,[ika28]
      ,[ika29]
      ,[ika30]
      ,[ika31]
      ,[ika32]
      ,[ika33]
      ,[ika34]
      ,[ika35]
      ,[ika36]
      ,[ika37]
      ,[ika38]
      ,[ika39]
      ,[ika40]
      ,[ika41]
      ,[ika42]
      ,[ika43]
      ,[ika44]
      ,[ika45]
      ,[ika46]
      ,[ika47]
      ,[ika48]
      ,[ika49]
      ,[ika50]
      ,[ika51]
      ,[ika52]
      ,[ika53]
      ,[ika54]
      ,[ika55]
      ,[ika56]
      ,[ika57]
      ,[ika58]
      ,[ika59]
      ,[ika60]
      ,[ika61]
      ,[ika62]
      ,[ika63]
      ,[ika64]
      ,[ika65]
      ,[ika66]
      ,[ika67]
      ,[ika68]
      ,[ika69]
      ,[ika70]
      ,[ika71]
      ,[ika72]
      ,[ika73]
      ,[ika74]
      ,[ika75]
      ,[ika76]
      ,[ika77]
      ,[ika78]
      ,[ika79]
      ,[ika80]
      ,[ika81]
      ,[ika82]
      ,[ika83]
      ,[ika84]
      ,[ika85]
      ,[ika86]
      ,[ika87]
      ,[ika88]
      ,[ika89]
      ,[ika90]
      ,[ika91]
      ,[ika92]
      ,[ika93]
      ,[ika94]
      ,[ika95]
      ,[ika96]
      ,[ika97]
      ,[ika98]
      ,[ika99]
      ,[ika100_]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (

SELECT [tilv]
      ,[asmaak]
      ,[aikielir3]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[ika0]
      ,[ika1]
      ,[ika2]
      ,[ika3]
      ,[ika4]
      ,[ika5]
      ,[ika6]
      ,[ika7]
      ,[ika8]
      ,[ika9]
      ,[ika10]
      ,[ika11]
      ,[ika12]
      ,[ika13]
      ,[ika14]
      ,[ika15]
      ,[ika16]
      ,[ika17]
      ,[ika18]
      ,[ika19]
      ,[ika20]
      ,[ika21]
      ,[ika22]
      ,[ika23]
      ,[ika24]
      ,[ika25]
      ,[ika26]
      ,[ika27]
      ,[ika28]
      ,[ika29]
      ,[ika30]
      ,[ika31]
      ,[ika32]
      ,[ika33]
      ,[ika34]
      ,[ika35]
      ,[ika36]
      ,[ika37]
      ,[ika38]
      ,[ika39]
      ,[ika40]
      ,[ika41]
      ,[ika42]
      ,[ika43]
      ,[ika44]
      ,[ika45]
      ,[ika46]
      ,[ika47]
      ,[ika48]
      ,[ika49]
      ,[ika50]
      ,[ika51]
      ,[ika52]
      ,[ika53]
      ,[ika54]
      ,[ika55]
      ,[ika56]
      ,[ika57]
      ,[ika58]
      ,[ika59]
      ,[ika60]
      ,[ika61]
      ,[ika62]
      ,[ika63]
      ,[ika64]
      ,[ika65]
      ,[ika66]
      ,[ika67]
      ,[ika68]
      ,[ika69]
      ,[ika70]
      ,[ika71]
      ,[ika72]
      ,[ika73]
      ,[ika74]
      ,[ika75]
      ,[ika76]
      ,[ika77]
      ,[ika78]
      ,[ika79]
      ,[ika80]
      ,[ika81]
      ,[ika82]
      ,[ika83]
      ,[ika84]
      ,[ika85]
      ,[ika86]
      ,[ika87]
      ,[ika88]
      ,[ika89]
      ,[ika90]
      ,[ika91]
      ,[ika92]
      ,[ika93]
      ,[ika94]
      ,[ika95]
      ,[ika96]
      ,[ika97]
      ,[ika98]
      ,[ika99]
      ,[ika100_]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_10_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, aikielir3)
  FROM [TK_H9098_CSC].[dbo].[TK_4_10_sopv_11]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[aikielir3]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[ika0]
      ,[ika1]
      ,[ika2]
      ,[ika3]
      ,[ika4]
      ,[ika5]
      ,[ika6]
      ,[ika7]
      ,[ika8]
      ,[ika9]
      ,[ika10]
      ,[ika11]
      ,[ika12]
      ,[ika13]
      ,[ika14]
      ,[ika15]
      ,[ika16]
      ,[ika17]
      ,[ika18]
      ,[ika19]
      ,[ika20]
      ,[ika21]
      ,[ika22]
      ,[ika23]
      ,[ika24]
      ,[ika25]
      ,[ika26]
      ,[ika27]
      ,[ika28]
      ,[ika29]
      ,[ika30]
      ,[ika31]
      ,[ika32]
      ,[ika33]
      ,[ika34]
      ,[ika35]
      ,[ika36]
      ,[ika37]
      ,[ika38]
      ,[ika39]
      ,[ika40]
      ,[ika41]
      ,[ika42]
      ,[ika43]
      ,[ika44]
      ,[ika45]
      ,[ika46]
      ,[ika47]
      ,[ika48]
      ,[ika49]
      ,[ika50]
      ,[ika51]
      ,[ika52]
      ,[ika53]
      ,[ika54]
      ,[ika55]
      ,[ika56]
      ,[ika57]
      ,[ika58]
      ,[ika59]
      ,[ika60]
      ,[ika61]
      ,[ika62]
      ,[ika63]
      ,[ika64]
      ,[ika65]
      ,[ika66]
      ,[ika67]
      ,[ika68]
      ,[ika69]
      ,[ika70]
      ,[ika71]
      ,[ika72]
      ,[ika73]
      ,[ika74]
      ,[ika75]
      ,[ika76]
      ,[ika77]
      ,[ika78]
      ,[ika79]
      ,[ika80]
      ,[ika81]
      ,[ika82]
      ,[ika83]
      ,[ika84]
      ,[ika85]
      ,[ika86]
      ,[ika87]
      ,[ika88]
      ,[ika89]
      ,[ika90]
      ,[ika91]
      ,[ika92]
      ,[ika93]
      ,[ika94]
      ,[ika95]
      ,[ika96]
      ,[ika97]
      ,[ika98]
      ,[ika99]
      ,[ika100_]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_10_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, aikielir3)
  FROM [TK_H9098_CSC].[dbo].[TK_4_10_sopv_12]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[aikielir3]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[ika0]
      ,[ika1]
      ,[ika2]
      ,[ika3]
      ,[ika4]
      ,[ika5]
      ,[ika6]
      ,[ika7]
      ,[ika8]
      ,[ika9]
      ,[ika10]
      ,[ika11]
      ,[ika12]
      ,[ika13]
      ,[ika14]
      ,[ika15]
      ,[ika16]
      ,[ika17]
      ,[ika18]
      ,[ika19]
      ,[ika20]
      ,[ika21]
      ,[ika22]
      ,[ika23]
      ,[ika24]
      ,[ika25]
      ,[ika26]
      ,[ika27]
      ,[ika28]
      ,[ika29]
      ,[ika30]
      ,[ika31]
      ,[ika32]
      ,[ika33]
      ,[ika34]
      ,[ika35]
      ,[ika36]
      ,[ika37]
      ,[ika38]
      ,[ika39]
      ,[ika40]
      ,[ika41]
      ,[ika42]
      ,[ika43]
      ,[ika44]
      ,[ika45]
      ,[ika46]
      ,[ika47]
      ,[ika48]
      ,[ika49]
      ,[ika50]
      ,[ika51]
      ,[ika52]
      ,[ika53]
      ,[ika54]
      ,[ika55]
      ,[ika56]
      ,[ika57]
      ,[ika58]
      ,[ika59]
      ,[ika60]
      ,[ika61]
      ,[ika62]
      ,[ika63]
      ,[ika64]
      ,[ika65]
      ,[ika66]
      ,[ika67]
      ,[ika68]
      ,[ika69]
      ,[ika70]
      ,[ika71]
      ,[ika72]
      ,[ika73]
      ,[ika74]
      ,[ika75]
      ,[ika76]
      ,[ika77]
      ,[ika78]
      ,[ika79]
      ,[ika80]
      ,[ika81]
      ,[ika82]
      ,[ika83]
      ,[ika84]
      ,[ika85]
      ,[ika86]
      ,[ika87]
      ,[ika88]
      ,[ika89]
      ,[ika90]
      ,[ika91]
      ,[ika92]
      ,[ika93]
      ,[ika94]
      ,[ika95]
      ,[ika96]
      ,[ika97]
      ,[ika98]
      ,[ika99]
      ,[ika100_]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_10_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, aikielir3)
  FROM [TK_H9098_CSC].[dbo].[TK_4_10_sopv_13]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[aikielir3]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[ika0]
      ,[ika1]
      ,[ika2]
      ,[ika3]
      ,[ika4]
      ,[ika5]
      ,[ika6]
      ,[ika7]
      ,[ika8]
      ,[ika9]
      ,[ika10]
      ,[ika11]
      ,[ika12]
      ,[ika13]
      ,[ika14]
      ,[ika15]
      ,[ika16]
      ,[ika17]
      ,[ika18]
      ,[ika19]
      ,[ika20]
      ,[ika21]
      ,[ika22]
      ,[ika23]
      ,[ika24]
      ,[ika25]
      ,[ika26]
      ,[ika27]
      ,[ika28]
      ,[ika29]
      ,[ika30]
      ,[ika31]
      ,[ika32]
      ,[ika33]
      ,[ika34]
      ,[ika35]
      ,[ika36]
      ,[ika37]
      ,[ika38]
      ,[ika39]
      ,[ika40]
      ,[ika41]
      ,[ika42]
      ,[ika43]
      ,[ika44]
      ,[ika45]
      ,[ika46]
      ,[ika47]
      ,[ika48]
      ,[ika49]
      ,[ika50]
      ,[ika51]
      ,[ika52]
      ,[ika53]
      ,[ika54]
      ,[ika55]
      ,[ika56]
      ,[ika57]
      ,[ika58]
      ,[ika59]
      ,[ika60]
      ,[ika61]
      ,[ika62]
      ,[ika63]
      ,[ika64]
      ,[ika65]
      ,[ika66]
      ,[ika67]
      ,[ika68]
      ,[ika69]
      ,[ika70]
      ,[ika71]
      ,[ika72]
      ,[ika73]
      ,[ika74]
      ,[ika75]
      ,[ika76]
      ,[ika77]
      ,[ika78]
      ,[ika79]
      ,[ika80]
      ,[ika81]
      ,[ika82]
      ,[ika83]
      ,[ika84]
      ,[ika85]
      ,[ika86]
      ,[ika87]
      ,[ika88]
      ,[ika89]
      ,[ika90]
      ,[ika91]
      ,[ika92]
      ,[ika93]
      ,[ika94]
      ,[ika95]
      ,[ika96]
      ,[ika97]
      ,[ika98]
      ,[ika99]
      ,[ika100_]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_10_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, aikielir3)
  FROM [TK_H9098_CSC].[dbo].[TK_4_10_sopv_14]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[aikielir3]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[ika0]
      ,[ika1]
      ,[ika2]
      ,[ika3]
      ,[ika4]
      ,[ika5]
      ,[ika6]
      ,[ika7]
      ,[ika8]
      ,[ika9]
      ,[ika10]
      ,[ika11]
      ,[ika12]
      ,[ika13]
      ,[ika14]
      ,[ika15]
      ,[ika16]
      ,[ika17]
      ,[ika18]
      ,[ika19]
      ,[ika20]
      ,[ika21]
      ,[ika22]
      ,[ika23]
      ,[ika24]
      ,[ika25]
      ,[ika26]
      ,[ika27]
      ,[ika28]
      ,[ika29]
      ,[ika30]
      ,[ika31]
      ,[ika32]
      ,[ika33]
      ,[ika34]
      ,[ika35]
      ,[ika36]
      ,[ika37]
      ,[ika38]
      ,[ika39]
      ,[ika40]
      ,[ika41]
      ,[ika42]
      ,[ika43]
      ,[ika44]
      ,[ika45]
      ,[ika46]
      ,[ika47]
      ,[ika48]
      ,[ika49]
      ,[ika50]
      ,[ika51]
      ,[ika52]
      ,[ika53]
      ,[ika54]
      ,[ika55]
      ,[ika56]
      ,[ika57]
      ,[ika58]
      ,[ika59]
      ,[ika60]
      ,[ika61]
      ,[ika62]
      ,[ika63]
      ,[ika64]
      ,[ika65]
      ,[ika66]
      ,[ika67]
      ,[ika68]
      ,[ika69]
      ,[ika70]
      ,[ika71]
      ,[ika72]
      ,[ika73]
      ,[ika74]
      ,[ika75]
      ,[ika76]
      ,[ika77]
      ,[ika78]
      ,[ika79]
      ,[ika80]
      ,[ika81]
      ,[ika82]
      ,[ika83]
      ,[ika84]
      ,[ika85]
      ,[ika86]
      ,[ika87]
      ,[ika88]
      ,[ika89]
      ,[ika90]
      ,[ika91]
      ,[ika92]
      ,[ika93]
      ,[ika94]
      ,[ika95]
      ,[ika96]
      ,[ika97]
      ,[ika98]
      ,[ika99]
      ,[ika100_]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_10_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, aikielir3)
  FROM [TK_H9098_CSC].[dbo].[TK_4_10_sopv_15]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[aikielir3]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[ika0]
      ,[ika1]
      ,[ika2]
      ,[ika3]
      ,[ika4]
      ,[ika5]
      ,[ika6]
      ,[ika7]
      ,[ika8]
      ,[ika9]
      ,[ika10]
      ,[ika11]
      ,[ika12]
      ,[ika13]
      ,[ika14]
      ,[ika15]
      ,[ika16]
      ,[ika17]
      ,[ika18]
      ,[ika19]
      ,[ika20]
      ,[ika21]
      ,[ika22]
      ,[ika23]
      ,[ika24]
      ,[ika25]
      ,[ika26]
      ,[ika27]
      ,[ika28]
      ,[ika29]
      ,[ika30]
      ,[ika31]
      ,[ika32]
      ,[ika33]
      ,[ika34]
      ,[ika35]
      ,[ika36]
      ,[ika37]
      ,[ika38]
      ,[ika39]
      ,[ika40]
      ,[ika41]
      ,[ika42]
      ,[ika43]
      ,[ika44]
      ,[ika45]
      ,[ika46]
      ,[ika47]
      ,[ika48]
      ,[ika49]
      ,[ika50]
      ,[ika51]
      ,[ika52]
      ,[ika53]
      ,[ika54]
      ,[ika55]
      ,[ika56]
      ,[ika57]
      ,[ika58]
      ,[ika59]
      ,[ika60]
      ,[ika61]
      ,[ika62]
      ,[ika63]
      ,[ika64]
      ,[ika65]
      ,[ika66]
      ,[ika67]
      ,[ika68]
      ,[ika69]
      ,[ika70]
      ,[ika71]
      ,[ika72]
      ,[ika73]
      ,[ika74]
      ,[ika75]
      ,[ika76]
      ,[ika77]
      ,[ika78]
      ,[ika79]
      ,[ika80]
      ,[ika81]
      ,[ika82]
      ,[ika83]
      ,[ika84]
      ,[ika85]
      ,[ika86]
      ,[ika87]
      ,[ika88]
      ,[ika89]
      ,[ika90]
      ,[ika91]
      ,[ika92]
      ,[ika93]
      ,[ika94]
      ,[ika95]
      ,[ika96]
      ,[ika97]
      ,[ika98]
      ,[ika99]
      ,[ika100_]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_10_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, aikielir3)
  FROM [TK_H9098_CSC].[dbo].[TK_4_10_sopv_16]

   UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[aikielir3]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[ika0]
      ,[ika1]
      ,[ika2]
      ,[ika3]
      ,[ika4]
      ,[ika5]
      ,[ika6]
      ,[ika7]
      ,[ika8]
      ,[ika9]
      ,[ika10]
      ,[ika11]
      ,[ika12]
      ,[ika13]
      ,[ika14]
      ,[ika15]
      ,[ika16]
      ,[ika17]
      ,[ika18]
      ,[ika19]
      ,[ika20]
      ,[ika21]
      ,[ika22]
      ,[ika23]
      ,[ika24]
      ,[ika25]
      ,[ika26]
      ,[ika27]
      ,[ika28]
      ,[ika29]
      ,[ika30]
      ,[ika31]
      ,[ika32]
      ,[ika33]
      ,[ika34]
      ,[ika35]
      ,[ika36]
      ,[ika37]
      ,[ika38]
      ,[ika39]
      ,[ika40]
      ,[ika41]
      ,[ika42]
      ,[ika43]
      ,[ika44]
      ,[ika45]
      ,[ika46]
      ,[ika47]
      ,[ika48]
      ,[ika49]
      ,[ika50]
      ,[ika51]
      ,[ika52]
      ,[ika53]
      ,[ika54]
      ,[ika55]
      ,[ika56]
      ,[ika57]
      ,[ika58]
      ,[ika59]
      ,[ika60]
      ,[ika61]
      ,[ika62]
      ,[ika63]
      ,[ika64]
      ,[ika65]
      ,[ika66]
      ,[ika67]
      ,[ika68]
      ,[ika69]
      ,[ika70]
      ,[ika71]
      ,[ika72]
      ,[ika73]
      ,[ika74]
      ,[ika75]
      ,[ika76]
      ,[ika77]
      ,[ika78]
      ,[ika79]
      ,[ika80]
      ,[ika81]
      ,[ika82]
      ,[ika83]
      ,[ika84]
      ,[ika85]
      ,[ika86]
      ,[ika87]
      ,[ika88]
      ,[ika89]
      ,[ika90]
      ,[ika91]
      ,[ika92]
      ,[ika93]
      ,[ika94]
      ,[ika95]
      ,[ika96]
      ,[ika97]
      ,[ika98]
      ,[ika99]
      ,[ika100_]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_10_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, aikielir3)
FROM [TK_H9098_CSC].[dbo].[TK_4_10_sopv_17]
 
UNION ALL

SELECT [tilv]
      ,[asmaak]
      ,[aikielir3]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[ika0]
      ,[ika1]
      ,[ika2]
      ,[ika3]
      ,[ika4]
      ,[ika5]
      ,[ika6]
      ,[ika7]
      ,[ika8]
      ,[ika9]
      ,[ika10]
      ,[ika11]
      ,[ika12]
      ,[ika13]
      ,[ika14]
      ,[ika15]
      ,[ika16]
      ,[ika17]
      ,[ika18]
      ,[ika19]
      ,[ika20]
      ,[ika21]
      ,[ika22]
      ,[ika23]
      ,[ika24]
      ,[ika25]
      ,[ika26]
      ,[ika27]
      ,[ika28]
      ,[ika29]
      ,[ika30]
      ,[ika31]
      ,[ika32]
      ,[ika33]
      ,[ika34]
      ,[ika35]
      ,[ika36]
      ,[ika37]
      ,[ika38]
      ,[ika39]
      ,[ika40]
      ,[ika41]
      ,[ika42]
      ,[ika43]
      ,[ika44]
      ,[ika45]
      ,[ika46]
      ,[ika47]
      ,[ika48]
      ,[ika49]
      ,[ika50]
      ,[ika51]
      ,[ika52]
      ,[ika53]
      ,[ika54]
      ,[ika55]
      ,[ika56]
      ,[ika57]
      ,[ika58]
      ,[ika59]
      ,[ika60]
      ,[ika61]
      ,[ika62]
      ,[ika63]
      ,[ika64]
      ,[ika65]
      ,[ika66]
      ,[ika67]
      ,[ika68]
      ,[ika69]
      ,[ika70]
      ,[ika71]
      ,[ika72]
      ,[ika73]
      ,[ika74]
      ,[ika75]
      ,[ika76]
      ,[ika77]
      ,[ika78]
      ,[ika79]
      ,[ika80]
      ,[ika81]
      ,[ika82]
      ,[ika83]
      ,[ika84]
      ,[ika85]
      ,[ika86]
      ,[ika87]
      ,[ika88]
      ,[ika89]
      ,[ika90]
      ,[ika91]
      ,[ika92]
      ,[ika93]
      ,[ika94]
      ,[ika95]
      ,[ika96]
      ,[ika97]
      ,[ika98]
      ,[ika99]
      ,[ika100_]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_10_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, aikielir3)
FROM [TK_H9098_CSC].[dbo].[TK_4_10_sopv_18]
 
UNION ALL

SELECT [tilv]
      ,[asmaak]
      ,[aikielir3]
      ,[kansalr1]
      ,[eumaa]
      ,[etamaa]
      ,[ika0]
      ,[ika1]
      ,[ika2]
      ,[ika3]
      ,[ika4]
      ,[ika5]
      ,[ika6]
      ,[ika7]
      ,[ika8]
      ,[ika9]
      ,[ika10]
      ,[ika11]
      ,[ika12]
      ,[ika13]
      ,[ika14]
      ,[ika15]
      ,[ika16]
      ,[ika17]
      ,[ika18]
      ,[ika19]
      ,[ika20]
      ,[ika21]
      ,[ika22]
      ,[ika23]
      ,[ika24]
      ,[ika25]
      ,[ika26]
      ,[ika27]
      ,[ika28]
      ,[ika29]
      ,[ika30]
      ,[ika31]
      ,[ika32]
      ,[ika33]
      ,[ika34]
      ,[ika35]
      ,[ika36]
      ,[ika37]
      ,[ika38]
      ,[ika39]
      ,[ika40]
      ,[ika41]
      ,[ika42]
      ,[ika43]
      ,[ika44]
      ,[ika45]
      ,[ika46]
      ,[ika47]
      ,[ika48]
      ,[ika49]
      ,[ika50]
      ,[ika51]
      ,[ika52]
      ,[ika53]
      ,[ika54]
      ,[ika55]
      ,[ika56]
      ,[ika57]
      ,[ika58]
      ,[ika59]
      ,[ika60]
      ,[ika61]
      ,[ika62]
      ,[ika63]
      ,[ika64]
      ,[ika65]
      ,[ika66]
      ,[ika67]
      ,[ika68]
      ,[ika69]
      ,[ika70]
      ,[ika71]
      ,[ika72]
      ,[ika73]
      ,[ika74]
      ,[ika75]
      ,[ika76]
      ,[ika77]
      ,[ika78]
      ,[ika79]
      ,[ika80]
      ,[ika81]
      ,[ika82]
      ,[ika83]
      ,[ika84]
      ,[ika85]
      ,[ika86]
      ,[ika87]
      ,[ika88]
      ,[ika89]
      ,[ika90]
      ,[ika91]
      ,[ika92]
      ,[ika93]
      ,[ika94]
      ,[ika95]
      ,[ika96]
      ,[ika97]
      ,[ika98]
      ,[ika99]
      ,[ika100_]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_10_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, aikielir3)
FROM [TK_H9098_CSC].[dbo].[TK_K4_10_sopv_19]

) kaikkivuodet






' 
GO
/****** Object:  View [dbo].[v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]    Script Date: 4.4.2019 18:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan] AS

/*
Drop table [VipunenTK_DW].[dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]
Select * into [VipunenTK_DW].[dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan] FROM VipunenTK_SA.[dbo].[v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]

Truncate table [VipunenTK_DW].[dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]
Insert into [VipunenTK_DW].[dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+''0101'' as date)
      ,[asmaak] = CAST(kaikkivuodet.asmaak as nvarchar(2))
      ,[koulk] = CAST(kaikkivuodet.koulk as nvarchar(6))
      ,[ulosmuutto] = CAST(kaikkivuodet.ulosmuutto as int)
      ,[sisaanmuutto] = CAST(kaikkivuodet.sisaanmuutto as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (

SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_11_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_11]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_11_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_12]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_11_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_13]

--UNION ALL
--SELECT [tilv]
--      ,[asmaak]
--      ,[koulk]
--      ,[sisaanmuutto]
--      ,[ulosmuutto]
--      ,[luontipvm]
--      ,[tietolahde]=''TK_4_11_sopv_14''
--      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
--FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_14]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_11_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_15]

UNION ALL
SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_11_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_16]

UNION ALL

SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_11_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_17]

UNION ALL

SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_11_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_18]

UNION ALL

SELECT [tilv]
      ,[asmaak]
      ,[koulk]
      ,[sisaanmuutto]
      ,[ulosmuutto]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_11_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_11_sopv_19]


) kaikkivuodet





' 
GO
/****** Object:  View [dbo].[v_sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 4.4.2019 18:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]'))
EXEC dbo.sp_executesql @statement = N'












CREATE VIEW [dbo].[v_sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] AS
SELECT
	tilv= cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+''0101'' as date)
    ,aineisto = cast(kaikkivuodet.aineisto as nvarchar(2))
    ,sp= cast(kaikkivuodet.sp as nvarchar(1))
    ,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
    ,syntv= cast(kaikkivuodet.syntv as nvarchar(4))
    ,tilvasmaak= cast(kaikkivuodet.tilvasmaak as nvarchar(3))
    ,kansalr1= cast(kaikkivuodet.kansalr1 as nvarchar(1))
    ,pohjmaa = cast(kaikkivuodet.pohjmaa as nvarchar(1))
    ,eumaa= cast(kaikkivuodet.eumaa as nvarchar(1))
    ,etamaa = cast(kaikkivuodet.etamaa as nvarchar(1))
    ,suorv = cast(kaikkivuodet.suorv as nvarchar(4))
    ,suormaak = cast(kaikkivuodet.suormaak as nvarchar(2))
    ,koulk = cast(kaikkivuodet.koulk as nvarchar(6))
    ,kouljat = cast(kaikkivuodet.kouljat as nvarchar(1))
    ,oppis = cast(kaikkivuodet.oppis as nvarchar(1))
    ,tutklaja_tr = cast(kaikkivuodet.tutklaja_tr as nvarchar(1))
    ,[ptoim1r6]= cast(kaikkivuodet.ptoim1r6 as nvarchar(2))
    ,[amm2001]= cast(kaikkivuodet.amm2001 as nvarchar(2))
    ,[amm2010]= cast(kaikkivuodet.amm2010 as nvarchar(2))
    ,[tsekt]= cast(kaikkivuodet.tsekt as nvarchar(2))
    ,[lkm]= cast(kaikkivuodet.lkm as int)
    ,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
    ,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  ,(CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,(CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] 
      ,[amm2010]= NULL
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]=''4_2a_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_11]
union all
SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001]= NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]=''4_2a_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_12]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]=''4_2a_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_13]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]=''4_2a_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_14]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]=''4_2a_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_15]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]=''4_2a_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_16]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]=''4_2a_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_17]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]=''4_2a_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_18]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]=NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2b_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_11]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	   ,(CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2b_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_12]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	   ,(CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2b_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_13]
   union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2b_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_14]
   union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2b_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_15]
   union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2b_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_16]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2b_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_17]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2b_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_18]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2c_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_12]
  union all

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2c_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_13]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2c_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_14]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2c_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_15]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2c_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_16]
  union all
  SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2c_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_17]

union all

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  , (CASE WHEN [syntv] = ''BBBB'' THEN ''''
      ELSE [syntv] END) AS syntv
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  , (CASE WHEN [suorv] = ''BBBB'' THEN ''''
      ELSE [suorv] END) AS suorv
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2c_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_18]

union all

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  ,[syntv]
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,[suorv]
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]
      ,[tsekt]
      ,[lkm]
      ,[tietolahde]=''4_2a_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_2a_sopv_19]

union all

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  ,[syntv]
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,[suorv]
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]= NULL
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2b_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_2b_sopv_19]
union all

SELECT [tilv]
      ,[aineisto]
      ,[sp]
      ,[aikielir1]
	  ,[syntv]
      ,[tilvasmaak]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
	  ,[suorv] 
      ,[suormaak]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r6]
      ,[amm2001] = NULL
      ,[amm2010]= NULL
      ,[tsekt]= NULL
      ,[lkm]
      ,[tietolahde]=''4_2c_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_2c_sopv_19]

) as kaikkivuodet

  



' 
GO
/****** Object:  View [dbo].[v_sa_4_21_Vaestoennuste]    Script Date: 4.4.2019 18:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_4_21_Vaestoennuste]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_sa_4_21_Vaestoennuste] AS


SELECT [ennv]
      ,[tilvaskun]
      ,[sp]
      ,[ika2] = 
				case 
					when ltrim([ika2]) between 95 and 99 then ltrim([ika2])+''v2''
					else ltrim([ika2])
				end
      ,[lkm]
	  ,[Ennustemalli]=''Ennuste 2015''

      
  FROM [TK_H9098_CSC].[dbo].[TK_4_21_sopv_15]

Union ALL

/*
Luetaan Tilastokeskuksen rajapinnan kautta haettu data osaksi näkymää. Muutetaan sukupuoli ja ikä vastaamaan luokituksia.
*/

select
	[ennv] = Vuosi
	,[tilvaskun] = ''-1''
	,[sp] = 
			case 
				when Sukupuoli=''Miehet'' then 1 
				when Sukupuoli=''Naiset'' then 2 
			end
	,[ika2] = 
			case
				when ltrim([Ika]) in (''95'',''96'',''97'',''98'',''99'') then ltrim([Ika])+''v2''
				when ltrim([Ika])=''100-'' then ''100''
				else ltrim([Ika]) 
			end
	,[lkm]
	,[Ennustemalli]

FROM [VipunenTK_SA].[dbo].[sa_api_vaestoennuste]
Where Sukupuoli <> ''Sukupuolet yhteensä'' and Ika <> ''Ikäluokat yhteensä''



' 
GO
/****** Object:  View [dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]    Script Date: 4.4.2019 18:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]'))
EXEC dbo.sp_executesql @statement = N'










CREATE VIEW [dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] AS
SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+''0101'' as date)
	,aineisto = cast(kaikkivuodet.aineisto as nvarchar(2))
	,tilvasmaak = cast(coalesce(nullif(kaikkivuodet.tilvasmaak,''''),''-1'') as nvarchar(2))
	,aiopis = cast(coalesce(nullif(kaikkivuodet.aiopis,''9''),''-1'') as nvarchar(2))
	,suorv = cast(kaikkivuodet.suorv as nvarchar(4))
	,tutkmaak = cast(coalesce(nullif(kaikkivuodet.tutkmaak,''''),''-1'') as nvarchar(2))
	,jarj = cast(coalesce(nullif(kaikkivuodet.jarj,''''),''-1'') as nvarchar(10))
	,tunn = cast(coalesce(nullif(kaikkivuodet.tunn,''''),''-1'') as nvarchar(5))
	,akk = cast(coalesce(nullif(left(kaikkivuodet.akk,2),''''),''-1'') as nvarchar(2))
	,koulk = cast(coalesce(nullif(kaikkivuodet.koulk,''''),''-1'') as nvarchar(6))
	,kouljat = cast(coalesce(nullif(kaikkivuodet.kouljat,''''),''-1'') as nvarchar(2))
	,oppis = cast(coalesce(nullif(kaikkivuodet.oppis,''''),''-1'') as nvarchar(2))
	,tutklaja_tr = cast(coalesce(nullif(kaikkivuodet.tutklaja_tr,''''),''-1'') as nvarchar(2))
	,ptoim1r2 = cast(coalesce(nullif(kaikkivuodet.ptoim1r2,''''),''-1'') as nvarchar(2))
	,maassaolo = cast(coalesce(nullif(kaikkivuodet.maassaolo,''''),''-1'') as nvarchar(2))
	,amas = cast(coalesce(nullif(kaikkivuodet.amas,''''),''-1'') as nvarchar(2))
	,amm2010 = cast(coalesce(nullif(kaikkivuodet.amm2010,''''),''-1'') as nvarchar(5))
	,lkm = cast(kaikkivuodet.lkm as int)
	,eu_etamaat = cast(coalesce(nullif(kaikkivuodet.eu_etamaat,''''),''-1'') as nvarchar(2))
	,aikielir1 = cast(coalesce(nullif(kaikkivuodet.aikielir1,''''),''-1'') as nvarchar(2))
	,mosa = cast(coalesce(nullif(kaikkivuodet.mosa,''''),''-1'') as nvarchar(2))

	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2] = coalesce(nullif([ptoim1r2],''''),99)
      ,[maassaolo]
      ,[amas]
      ,[amm2010] = NULL
      ,[lkm]
	  ,''-1'' AS eu_etamaat
	  ,''-1'' AS aikielir1
	  ,''-1'' AS mosa
      ,[tietolahde]=''4_3_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_3_sopv_11]
union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2] = coalesce(nullif([ptoim1r2],''''),99)
      ,[maassaolo]
      ,[amas]
      ,[amm2010] = NULL
      ,[lkm]
	  ,''-1'' AS eu_etamaat
	  ,''-1'' AS aikielir1
	  ,''-1'' AS mosa
      ,[tietolahde]=''K4_3_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_12]
union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2] = coalesce(nullif([ptoim1r2],''''),99)
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,''-1'' AS eu_etamaat
	  ,''-1'' AS aikielir1
	  ,''-1'' AS mosa
      ,[tietolahde]=''K4_3_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_13]
  union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2] = coalesce(nullif([ptoim1r2],''''),99)
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,''-1'' AS eu_etamaat
	  ,''-1'' AS aikielir1
	  ,''-1'' AS mosa
      ,[tietolahde]=''K4_3_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_14]

union all

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2] =     /* sopv_15 sisältää virheellisesti pääasiallisen toiminnan arvoja maasta muuttaneille, sovittu työjaostossa että korjataan vain näkymään arvoon muu tai tuntematon - Lasse R. 18.10.2016 */
		CASE
			WHEN maassaolo = 2 THEN 99
			ELSE coalesce(nullif([ptoim1r2],''''),99)
		END
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]=''K4_3_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_15]

union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]=''K4_3_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_16]

  
union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]=''K4_3_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_17]

union all

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]=''K4_3_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_18]

union all

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
	  ,eu_etamaat
	  ,aikielir1
	  ,mosa = CAST(mosa as varchar(2))
      ,[tietolahde]=''K4_3_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_19]

) as kaikkivuodet











' 
GO
/****** Object:  View [dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_testaus]    Script Date: 4.4.2019 18:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_testaus]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_testaus] AS
SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+''0101'' as date)
	,aineisto = cast(kaikkivuodet.aineisto as nvarchar(2))
	,tilvasmaak = cast(kaikkivuodet.tilvasmaak as nvarchar(2))
	,aiopis = cast(kaikkivuodet.aiopis as nvarchar(2))
	,suorv = cast(kaikkivuodet.suorv as nvarchar(4))
	,tutkmaak = cast(kaikkivuodet.tutkmaak as nvarchar(2))
	,jarj = cast(kaikkivuodet.jarj as nvarchar(10))
	,tunn = cast(kaikkivuodet.tunn as nvarchar(5))
	,akk = cast(left(kaikkivuodet.akk,2) as nvarchar(2))
	,koulk = cast(kaikkivuodet.koulk as nvarchar(6))
	,kouljat = cast(kaikkivuodet.kouljat as nvarchar(2))
	,oppis = cast(kaikkivuodet.oppis as nvarchar(2))
	,tutklaja_tr = cast(kaikkivuodet.tutklaja_tr as nvarchar(2))
	,ptoim1r2 = cast(kaikkivuodet.ptoim1r2 as nvarchar(2))
	,maassaolo = cast(kaikkivuodet.maassaolo as nvarchar(2))
	,amas = cast(kaikkivuodet.amas as nvarchar(2))
	,amm2010 = cast(kaikkivuodet.amm2010 as nvarchar(5))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010] = NULL
      ,[lkm]
      ,[tietolahde]=''4_3_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_4_3_sopv_11]
union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010] = NULL
      ,[lkm]
      ,[tietolahde]=''K4_3_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_12]
union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
      ,[tietolahde]=''K4_3_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_13]
  union all
SELECT [tilv]
      ,[aineisto]
      ,[tilvasmaak]
      ,[aiopis]
      ,[suorv]
      ,[tutkmaak]
      ,[jarj]
      ,[tunn]
      ,[akk]
      ,[koulk]
      ,[kouljat]
      ,[oppis]
      ,[tutklaja_tr]
      ,[ptoim1r2]
      ,[maassaolo]
      ,[amas]
      ,[amm2010]
      ,[lkm]
      ,[tietolahde]=''K4_3_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K4_3_sopv_14]



) as kaikkivuodet





' 
GO
/****** Object:  View [dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]    Script Date: 4.4.2019 18:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]'))
EXEC dbo.sp_executesql @statement = N'











CREATE VIEW [dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus] AS

/*
Drop table [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
Select * into [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus] FROM VipunenTK_SA.[dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
Truncate table [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
Insert into [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
*/

SELECT [tilv] = CAST(kaikkivuodet.suorv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.suorv+''0101'' as date)
      ,[suorv]
      ,[suorlk]
      ,[suorituskausikoodi] = Cast([suorv]+Case when [suorlk] in (''1'', ''2'') then suorlk else ''2'' end as varchar(8))
      ,[koulk] = Cast(koulk as nvarchar(6))
      ,[alvv]
      ,[allk]
      ,[aloituskausikoodi] = Cast(case when len(alvv)<4 then ''-1'' else alvv+Case when allk in (''1'', ''2'') then allk else ''2'' end end as varchar(8))
      ,[oppis] = cast([oppis] as nvarchar(2))
      ,[tutklaja] = cast([tutklaja] as nvarchar(2))
      ,[tutktav] = cast([tutktav] as nvarchar(2))
      ,[aikoul] = Cast([aikoul] as nvarchar(2))
      ,[sp] = Cast(sp as nvarchar(10))
      ,[aikielir1] = cast([aikielir1] as nvarchar(2))
      ,[syntv]
	  ,ika = cast(case when len(replace(syntv,''x'',''''))<4 then -1 else cast(suorv as int) - cast(syntv as int) end as nvarchar(10))
	  --syntv sai myös arvon 19XX, jolloin iäksi asetetaan tuntematon
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      --,[luontipvm]
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM ( 


  SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_7_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_11]

UNION ALL
SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_7_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_12]

UNION ALL
SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_7_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_13]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_7_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_14]

UNION ALL
SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_7_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_15]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] = case when syntv = ''193.'' or syntv = ''197.'' then ''-1'' else syntv end
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_7_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
  FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_16]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] = case when syntv = ''193.'' or syntv = ''197.'' then ''-1'' else syntv end
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_7_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_17]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] = case when syntv = ''193.'' or syntv = ''197.'' then ''-1'' else syntv end
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_7_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_4_7_sopv_18]

UNION ALL

SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv] 
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
      ,[tietolahde]=''TK_4_7_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K4_7_sopv_19]

) kaikkivuodet














' 
GO
/****** Object:  View [dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]    Script Date: 4.4.2019 18:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]'))
EXEC dbo.sp_executesql @statement = N'










CREATE VIEW [dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus] AS

/*
Drop table [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
Select * into [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus] FROM VipunenTK_SA.[dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
Truncate table [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
Insert into [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+''0101'' as date)
      ,[suorv]
      ,[suorlk]
      ,[suorituskausikoodi] = Cast([suorv]+Case when [suorlk] in (''1'', ''2'') then suorlk else ''2'' end as varchar(8))
      ,[koulk] = Cast(koulk as nvarchar(6))
      ,[alvv]
      ,[allk]
      ,[aloituskausikoodi] = Cast(case when len(alvv)<4 then ''-1'' else alvv+Case when allk in (''1'', ''2'') then allk else ''2'' end end as varchar(8))
      ,[oppis] = cast([oppis] as nvarchar(2))
      ,[tutklaja] = cast([tutklaja] as nvarchar(2))
      ,[tutktav] = cast([tutktav] as nvarchar(2))
      ,[aikoul] = Cast([aikoul] as nvarchar(2))
      ,[sp] = Cast(sp as nvarchar(10))
      ,[aikielir1] = cast([aikielir1] as nvarchar(2))
      ,[syntv]
	  ,ika = cast(case 
					when len(replace(syntv,''x'',''''))<4 then -1 
					when len(replace(suorv,''x'',''''))<4 then -1 
					else cast(suorv as int) - cast(syntv as int) end as nvarchar(10))
	  --syntv sai myös arvon 19XX, jolloin iäksi asetetaan tuntematon
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      --,[luontipvm]
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM ( 

--Aineistot ovat kumulatiivisia. Uusin riittää.
SELECT [suorv]
      ,[suorlk]
      ,[koulk]
      ,[alvv]
      ,[allk]
      ,[oppis]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[sp]
      ,[aikielir1]
      ,[syntv]
      ,[lulkm]
      ,[lukoulk]
      ,[lusuorv]
      ,[luaikoul]
      ,[ammlkm]
      ,[ammkoulk]
      ,[ammsuorv]
      ,[ammoppis]
      ,[ammtutklaja]
      ,[ammtutktav]
      ,[opistlkm]
      ,[opistkoulk]
      ,[opistsuorv]
      ,[ammkalkm]
      ,[ammkakoulk]
      ,[ammkasuorv]
      ,[amklkm]
      ,[amkkoulk]
      ,[amksuorv]
      ,[amkaikoul]
      ,[akklkm]
      ,[akkkoulk]
      ,[akksuorv]
      ,[ylamklkm]
      ,[ylamkkoulk]
      ,[ylamksuorv]
      ,[ykklkm]
      ,[ykkkoulk]
      ,[ykksuorv]
      ,[laakerlkm]
      ,[laakerkoulk]
      ,[laakersuorv]
      ,[lislkm]
      ,[liskoulk]
      ,[lissuorv]
      ,[tohtlkm]
      ,[tohtkoulk]
      ,[tohtsuorv]
      ,[lkm]
      ,[luontipvm]
	  ,tilv = (select max(lusuorv) FROM [TK_H9098_CSC].[dbo].[TK_K4_8_sopv_19])
      ,[tietolahde]=''TK_4_8_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY koulk)
FROM [TK_H9098_CSC].[dbo].[TK_K4_8_sopv_19]

 ) kaikkivuodet


' 
GO
/****** Object:  View [dbo].[v_sa_4_9_Vaestorakenne_kunnittain]    Script Date: 4.4.2019 18:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_4_9_Vaestorakenne_kunnittain]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[v_sa_4_9_Vaestorakenne_kunnittain] AS

-- truncate table vipunentk_dw..sa_4_9_Vaestorakenne_kunnittain
-- insert into vipunentk_dw..sa_4_9_Vaestorakenne_kunnittain select * from v_sa_4_9_Vaestorakenne_kunnittain

SELECT
	 tilv = cast(kaikkivuodet.tilv as varchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+''0101'' as date)
	,sp = cast(kaikkivuodet.sp as varchar(1))
	,tilvaskun = cast(kaikkivuodet.tilvaskun as varchar(3))
	,aikielir2 = cast(kaikkivuodet.aikielir2 as varchar(2))
	,kansalr1 = cast(kaikkivuodet.kansalr1 as varchar(1))
	,mosa = cast(kaikkivuodet.mosa as varchar(1))
	,pohjmaa = cast(kaikkivuodet.pohjmaa as varchar(1))
	,eumaa = cast(kaikkivuodet.eumaa as varchar(1))
	,etamaa = cast(kaikkivuodet.etamaa as varchar(1))
	,ika0 = cast(kaikkivuodet.ika0 as int)
	,ika1 = cast(kaikkivuodet.ika1 as int)
	,ika2 = cast(kaikkivuodet.ika2 as int)
	,ika3 = cast(kaikkivuodet.ika3 as int)
	,ika4 = cast(kaikkivuodet.ika4 as int)
	,ika5 = cast(kaikkivuodet.ika5 as int)
	,ika6 = cast(kaikkivuodet.ika6 as int)
	,ika7 = cast(kaikkivuodet.ika7 as int)
	,ika8 = cast(kaikkivuodet.ika8 as int)
	,ika9 = cast(kaikkivuodet.ika9 as int)
	,ika10 = cast(kaikkivuodet.ika10 as int)
	,ika11 = cast(kaikkivuodet.ika11 as int)
	,ika12 = cast(kaikkivuodet.ika12 as int)
	,ika13 = cast(kaikkivuodet.ika13 as int)
	,ika14 = cast(kaikkivuodet.ika14 as int)
	,ika15 = cast(kaikkivuodet.ika15 as int)
	,ika16 = cast(kaikkivuodet.ika16 as int)
	,ika17 = cast(kaikkivuodet.ika17 as int)
	,ika18 = cast(kaikkivuodet.ika18 as int)
	,ika19 = cast(kaikkivuodet.ika19 as int)
	,ika20 = cast(kaikkivuodet.ika20 as int)
	,ika21 = cast(kaikkivuodet.ika21 as int)
	,ika22 = cast(kaikkivuodet.ika22 as int)
	,ika23 = cast(kaikkivuodet.ika23 as int)
	,ika24 = cast(kaikkivuodet.ika24 as int)
	,ika25 = cast(kaikkivuodet.ika25 as int)
	,ika26 = cast(kaikkivuodet.ika26 as int)
	,ika27 = cast(kaikkivuodet.ika27 as int)
	,ika28 = cast(kaikkivuodet.ika28 as int)
	,ika29 = cast(kaikkivuodet.ika29 as int)
	,ika30 = cast(kaikkivuodet.ika30 as int)
	,ika31 = cast(kaikkivuodet.ika31 as int)
	,ika32 = cast(kaikkivuodet.ika32 as int)
	,ika33 = cast(kaikkivuodet.ika33 as int)
	,ika34 = cast(kaikkivuodet.ika34 as int)
	,ika35 = cast(kaikkivuodet.ika35 as int)
	,ika36 = cast(kaikkivuodet.ika36 as int)
	,ika37 = cast(kaikkivuodet.ika37 as int)
	,ika38 = cast(kaikkivuodet.ika38 as int)
	,ika39 = cast(kaikkivuodet.ika39 as int)
	,ika40 = cast(kaikkivuodet.ika40 as int)
	,ika41 = cast(kaikkivuodet.ika41 as int)
	,ika42 = cast(kaikkivuodet.ika42 as int)
	,ika43 = cast(kaikkivuodet.ika43 as int)
	,ika44 = cast(kaikkivuodet.ika44 as int)
	,ika45 = cast(kaikkivuodet.ika45 as int)
	,ika46 = cast(kaikkivuodet.ika46 as int)
	,ika47 = cast(kaikkivuodet.ika47 as int)
	,ika48 = cast(kaikkivuodet.ika48 as int)
	,ika49 = cast(kaikkivuodet.ika49 as int)
	,ika50 = cast(kaikkivuodet.ika50 as int)
	,ika51 = cast(kaikkivuodet.ika51 as int)
	,ika52 = cast(kaikkivuodet.ika52 as int)
	,ika53 = cast(kaikkivuodet.ika53 as int)
	,ika54 = cast(kaikkivuodet.ika54 as int)
	,ika55 = cast(kaikkivuodet.ika55 as int)
	,ika56 = cast(kaikkivuodet.ika56 as int)
	,ika57 = cast(kaikkivuodet.ika57 as int)
	,ika58 = cast(kaikkivuodet.ika58 as int)
	,ika59 = cast(kaikkivuodet.ika59 as int)
	,ika60 = cast(kaikkivuodet.ika60 as int)
	,ika61 = cast(kaikkivuodet.ika61 as int)
	,ika62 = cast(kaikkivuodet.ika62 as int)
	,ika63 = cast(kaikkivuodet.ika63 as int)
	,ika64 = cast(kaikkivuodet.ika64 as int)
	,ika65 = cast(kaikkivuodet.ika65 as int)
	,ika66 = cast(kaikkivuodet.ika66 as int)
	,ika67 = cast(kaikkivuodet.ika67 as int)
	,ika68 = cast(kaikkivuodet.ika68 as int)
	,ika69 = cast(kaikkivuodet.ika69 as int)
	,ika70 = cast(kaikkivuodet.ika70 as int)
	,ika71 = cast(kaikkivuodet.ika71 as int)
	,ika72 = cast(kaikkivuodet.ika72 as int)
	,ika73 = cast(kaikkivuodet.ika73 as int)
	,ika74 = cast(kaikkivuodet.ika74 as int)
	,ika75 = cast(kaikkivuodet.ika75 as int)
	,ika76 = cast(kaikkivuodet.ika76 as int)
	,ika77 = cast(kaikkivuodet.ika77 as int)
	,ika78 = cast(kaikkivuodet.ika78 as int)
	,ika79 = cast(kaikkivuodet.ika79 as int)
	,ika80 = cast(kaikkivuodet.ika80 as int)
	,ika81 = cast(kaikkivuodet.ika81 as int)
	,ika82 = cast(kaikkivuodet.ika82 as int)
	,ika83 = cast(kaikkivuodet.ika83 as int)
	,ika84 = cast(kaikkivuodet.ika84 as int)
	,ika85 = cast(kaikkivuodet.ika85 as int)
	,ika86 = cast(kaikkivuodet.ika86 as int)
	,ika87 = cast(kaikkivuodet.ika87 as int)
	,ika88 = cast(kaikkivuodet.ika88 as int)
	,ika89 = cast(kaikkivuodet.ika89 as int)
	,ika90 = cast(kaikkivuodet.ika90 as int)
	,ika91 = cast(kaikkivuodet.ika91 as int)
	,ika92 = cast(kaikkivuodet.ika92 as int)
	,ika93 = cast(kaikkivuodet.ika93 as int)
	,ika94 = cast(kaikkivuodet.ika94 as int)
	,ika95 = cast(kaikkivuodet.ika95 as int)
	,ika96 = cast(kaikkivuodet.ika96 as int)
	,ika97 = cast(kaikkivuodet.ika97 as int)
	,ika98 = cast(kaikkivuodet.ika98 as int)
	,ika99 = cast(kaikkivuodet.ika99 as int)
	,ika100_ = cast(kaikkivuodet.ika100_ as int)
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]=''4_9_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_11]
UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]=''4_9_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_12]

UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]=''4_9_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_13]

UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]=''4_9_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_14]

UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]=''4_9_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_15]

UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]=''4_9_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_16]

UNION ALL
	SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]=''4_9_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_17]

UNION ALL

SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]=''4_9_sopv_18''
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_4_9_sopv_18]

UNION ALL

SELECT
	 tilv
	,sp
	,tilvaskun
	,aikielir2
	,kansalr1
	,mosa
	,pohjmaa
	,eumaa
	,etamaa
	,ika0
	,ika1
	,ika2
	,ika3
	,ika4
	,ika5
	,ika6
	,ika7
	,ika8
	,ika9
	,ika10
	,ika11
	,ika12
	,ika13
	,ika14
	,ika15
	,ika16
	,ika17
	,ika18
	,ika19
	,ika20
	,ika21
	,ika22
	,ika23
	,ika24
	,ika25
	,ika26
	,ika27
	,ika28
	,ika29
	,ika30
	,ika31
	,ika32
	,ika33
	,ika34
	,ika35
	,ika36
	,ika37
	,ika38
	,ika39
	,ika40
	,ika41
	,ika42
	,ika43
	,ika44
	,ika45
	,ika46
	,ika47
	,ika48
	,ika49
	,ika50
	,ika51
	,ika52
	,ika53
	,ika54
	,ika55
	,ika56
	,ika57
	,ika58
	,ika59
	,ika60
	,ika61
	,ika62
	,ika63
	,ika64
	,ika65
	,ika66
	,ika67
	,ika68
	,ika69
	,ika70
	,ika71
	,ika72
	,ika73
	,ika74
	,ika75
	,ika76
	,ika77
	,ika78
	,ika79
	,ika80
	,ika81
	,ika82
	,ika83
	,ika84
	,ika85
	,ika86
	,ika87
	,ika88
	,ika89
	,ika90
	,ika91
	,ika92
	,ika93
	,ika94
	,ika95
	,ika96
	,ika97
	,ika98
	,ika99
	,ika100_
	,lkm
	,[tietolahde]=''4_9_sopv_19''
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_9_sopv_19]

) as kaikkivuodet







' 
GO
USE [ANTERO]