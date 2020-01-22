USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]    Script Date: 22.1.2020 12:01:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER VIEW [dbo].[v_sa_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]
Select * into [VipunenTK_DW].[dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot] FROM [VipunenTK_SA].[dbo].[v_sa_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]
Truncate table [VipunenTK_DW].[dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]
Insert into [VipunenTK_DW].[dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]
Select *  FROM [VipunenTK_SA].[dbo].[v_sa_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[p_okieli] = Cast(kaikkivuodet.p_okieli as nvarchar(2))
      ,[p_olaste] = Cast(kaikkivuodet.p_olaste as nvarchar(2))
      ,[p_oluom] = Cast(kaikkivuodet.p_oluom as int)
      ,[p_yopp19] = Cast(kaikkivuodet.p_yopp19 as nvarchar(2))
      ,[p_ykieli] = CAST(kaikkivuodet.p_ykieli as nvarchar(10))
	  ,[p_yomist] = CAST(kaikkivuodet.p_yomist as nvarchar(10)) 
      ,[p_ymkunta] = CAST(kaikkivuodet.p_ymkunta as varchar(2))
      ,[p_ykunryh] = CAST(kaikkivuodet.p_ykunryh as nvarchar(10))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  
  SELECT [tilv]
      ,[p_okieli]
      ,[p_olaste]
      ,[p_oluom]
      ,[p_yopp19]
      ,[p_ykieli]
      ,[p_yomist]
      ,[p_ymkunta] = case p_ymkunta when '99' then '-1' else p_ymkunta end
      ,[p_ykunryh] = case p_ykunryh when '9' then '-1' else p_ykunryh end
      ,[tietolahde]='7_2_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_2_sopv_19]

  UNION ALL

  SELECT [tilv]
      ,[p_okieli]
      ,[p_olaste]
      ,[p_oluom]
      ,[p_yopp19]
      ,[p_ykieli]
      ,[p_yomist]
      ,[p_ymkunta] = case p_ymkunta when '99' then '-1' else p_ymkunta end
      ,[p_ykunryh] = case p_ykunryh when '9' then '-1' else p_ykunryh end
      ,[tietolahde]='7_2_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_2_sopv_16]

  UNION ALL
  
  SELECT [tilv]
      ,[p_okieli]
      ,[p_olaste]
      ,[p_oluom]
      ,[p_yopp19]
      ,[p_ykieli]
      ,[p_yomist]
      ,[p_ymkunta] = case p_ymkunta when '99' then '-1' else p_ymkunta end
      ,[p_ykunryh] = case p_ykunryh when '9' then '-1' else p_ykunryh end
      ,[tietolahde]='7_2_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_2_sopv_13]

  UNION ALL

  SELECT [tilv]
      ,[p_okieli]
      ,[p_olaste]
      ,[p_oluom]
      ,[p_yopp19]
      ,[p_ykieli]
      ,[p_yomist]
      ,[p_ymkunta] = case p_ymkunta when '99' then '-1' when '20' then '01' else p_ymkunta end
      ,[p_ykunryh] = case p_ykunryh when '9' then '-1' else p_ykunryh end
	  ,[tietolahde]='7_2_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_2_sopv_12]

) kaikkivuodet












GO


USE [ANTERO]