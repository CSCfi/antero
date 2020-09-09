USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]    Script Date: 4.2.2020 14:33:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER VIEW [dbo].[v_sa_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]
Select * into [VipunenTK_DW].[dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja] FROM [VipunenTK_SA].[dbo].[v_sa_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]
Truncate table [VipunenTK_DW].[dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]
Insert into [VipunenTK_DW].[dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]
Select *  FROM [VipunenTK_SA].[dbo].[v_sa_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[l_okieli] = Cast(kaikkivuodet.l_okieli as nvarchar(2))
      ,[l_yopp21_22] = Cast(kaikkivuodet.l_yopp21_22 as nvarchar(2))
      ,[l_ykieli] = CAST(kaikkivuodet.l_ykieli as nvarchar(10))
	  ,[l_yomist] = CAST(kaikkivuodet.l_yomist as nvarchar(10)) 
      ,[l_ymkunta] = CAST(kaikkivuodet.l_ymkunta as varchar(2))
      ,[l_ykunryh] = CAST(kaikkivuodet.l_ykunryh as nvarchar(10))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  
  SELECT [tilv]
      ,[l_okieli]
      ,[l_yopp21_22]
      ,[l_ykieli]
      ,[l_yomist]
      ,[l_ymkunta] = case l_ymkunta when '99' then '-1' else l_ymkunta end
      ,[l_ykunryh] = case l_ykunryh when '9' then '-1' else l_ykunryh end
      ,[tietolahde]='7_5_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_5_sopv_19]

  UNION ALL
  
  SELECT [tilv]
      ,[l_okieli]
      ,[l_yopp21_22]
      ,[l_ykieli]
      ,[l_yomist]
      ,[l_ymkunta] = case l_ymkunta when '99' then '-1' else l_ymkunta end
      ,[l_ykunryh] = case l_ykunryh when '9' then '-1' else l_ykunryh end
      ,[tietolahde]='7_5_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_5_sopv_16]

  UNION ALL
  
  SELECT [tilv]
      ,[l_okieli]
      ,[l_yopp21_22]
      ,[l_ykieli]
      ,[l_yomist]
      ,[l_ymkunta] = case l_ymkunta when '99' then '-1' else l_ymkunta end
      ,[l_ykunryh] = case l_ykunryh when '9' then '-1' else l_ykunryh end
      ,[tietolahde]='7_5_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_5_sopv_13]

  UNION ALL

  SELECT [tilv]
      ,[l_okieli]
      ,[l_yopp21_22]
      ,[l_ykieli]
      ,[l_yomist]
      ,[l_ymkunta] = case l_ymkunta when '99' then '-1' when '20' then '01' else l_ymkunta end
      ,[l_ykunryh] = case l_ykunryh when '9' then '-1' else l_ykunryh end
	  ,[tietolahde]='7_5_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_5_sopv_12]


) kaikkivuodet














GO


USE [ANTERO]