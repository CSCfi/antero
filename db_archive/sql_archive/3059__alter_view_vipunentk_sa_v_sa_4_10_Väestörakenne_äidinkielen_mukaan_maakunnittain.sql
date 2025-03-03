USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain]    Script Date: 5.5.2020 22:27:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













ALTER VIEW [dbo].[v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain] AS

/*
Drop table [VipunenTK_DW].[dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain]
Select * into [VipunenTK_DW].[dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain] FROM VipunenTK_SA.[dbo].[v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain]

Truncate table [VipunenTK_DW].[dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain]
Insert into [VipunenTK_DW].[dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
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
      ,[tietolahde]='TK_4_10_sopv_11'
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
      ,[tietolahde]='TK_4_10_sopv_12'
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
      ,[tietolahde]='TK_4_10_sopv_13'
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
      ,[tietolahde]='TK_4_10_sopv_14'
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
      ,[tietolahde]='TK_4_10_sopv_15'
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
      ,[tietolahde]='TK_4_10_sopv_16'
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
      ,[tietolahde]='TK_4_10_sopv_17'
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
      ,[tietolahde]='TK_4_10_sopv_18'
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
      ,[tietolahde]='TK_4_10_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, aikielir3)
FROM [TK_H9098_CSC].[dbo].[TK_K4_10_sopv_19]

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
      ,[tietolahde]='TK_4_10_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, asmaak, aikielir3)
FROM [TK_H9098_CSC].[dbo].[TK_K4_10_sopv_20]

) kaikkivuodet







GO


USE [ANTERO]