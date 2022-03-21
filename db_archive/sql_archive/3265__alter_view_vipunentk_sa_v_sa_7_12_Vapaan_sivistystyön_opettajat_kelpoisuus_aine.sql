USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]    Script Date: 6.2.2020 16:54:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

























ALTER VIEW [dbo].[v_sa_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]
Select * into [VipunenTK_DW].[dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine] FROM [VipunenTK_SA].[dbo].[v_sa_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]
Truncate table [VipunenTK_DW].[dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]
Insert into [VipunenTK_DW].[dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]
Select *  FROM [VipunenTK_SA].[dbo].[v_sa_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[v_okieli] = Cast(kaikkivuodet.v_okieli as nvarchar(4))
      ,[v_oltyp] = Cast(kaikkivuodet.v_oltyp as nvarchar(4))
      ,[v_tyos1] = Cast(kaikkivuodet.v_tyos1 as nvarchar(4))
      ,[v_tyos2] = Cast(kaikkivuodet.v_tyos2 as nvarchar(4))
      ,[v_tyos3] = Cast(kaikkivuodet.v_tyos3 as nvarchar(4))
      ,[v_tyos4] = Cast(kaikkivuodet.v_tyos4 as nvarchar(3))
      ,[v_tyos5] = Cast(kaikkivuodet.v_tyos5 as nvarchar(3))
	  ,[v_tyos] = Cast(kaikkivuodet.v_tyos as nvarchar(3))
      ,[v_virka] = Cast(kaikkivuodet.v_virka as nvarchar(3))
      ,[v_h1] = Cast(kaikkivuodet.v_h1 as nvarchar(3))
      ,[v_h2] = Cast(kaikkivuodet.v_h2 as nvarchar(3))
      ,[v_h3] = Cast(kaikkivuodet.v_h3 as nvarchar(3))
      ,[v_h4] = Cast(kaikkivuodet.v_h4 as nvarchar(3))
      ,[v_ala1] = Cast(kaikkivuodet.v_ala1 as nvarchar(3))
	  ,[v_aine1] = Cast(kaikkivuodet.v_aine1 as nvarchar(3)) 
      ,[v_sp] = Cast(kaikkivuodet.v_sp as nvarchar(2))
      ,[v_maakunta] = Cast(kaikkivuodet.v_maakunta as nvarchar(2))
	  ,[v_okunryh] =  Cast(kaikkivuodet.v_okunryh as nvarchar(2))
	  ,[v_ika] = Cast(kaikkivuodet.v_ika as nvarchar(10))
	  ,[v_osa1] = Cast(kaikkivuodet.v_osa1 as nvarchar(10))
	  ,[v_osa2] = Cast(kaikkivuodet.v_osa2 as nvarchar(10))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  
  SELECT [tilv]
      ,[v_okieli]
      ,[v_oltyp]
      ,NULL AS [v_tyos1]
      ,NULL AS [v_tyos2]
      ,NULL AS [v_tyos3]
      ,NULL AS [v_tyos4]
      ,NULL AS [v_tyos5]
	  ,[v_tyos]
      ,[v_virka]
      ,[v_h1] = v_kelp1
      ,[v_h2] = coalesce(v_p2,0) --tilapäinen
      ,[v_h3] = coalesce(v_p1,0) --tilapäinen
      ,NULL AS [v_h4]
      ,[v_ala1]
      ,[v_aine1]
      ,[v_sp]
      ,[v_maakunta]
      ,[v_okunryh]
      ,[v_ika] = case [v_ika]
	   when '01' then '30655v30'
	   when '02' then '19655v30'
	   when '03' then '19655v35'
	   when '04' then '19655v40'
	   when '05' then '19655v45'
	   when '06' then '19655v50'
	   when '07' then '55'
	   when '08' then '56'
	   when '09' then '57'
	   when '10' then '58'
	   when '11' then '59'
	   when '12' then '60'
	   when '13' then '61'
	   when '14' then '62'
	   when '15' then '63'
	   when '16' then '64'
	   when '17' then '19655v65'
	   else '-1'
	   end
	   ,v_osa1
	   ,v_osa2
      ,[tietolahde]='7_12_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K7_12_sopv_19]

  UNION ALL

  SELECT [tilv]
      ,[v_okieli]
      ,[v_oltyp]
      ,NULL AS [v_tyos1]
      ,NULL AS [v_tyos2]
      ,NULL AS [v_tyos3]
      ,NULL AS [v_tyos4]
      ,NULL AS [v_tyos5]
	  ,[v_tyos]
      ,[v_virka]
      ,[v_h1] = v_kelp1
      ,[v_h2] = v_p1
      ,[v_h3] = v_p2
      ,NULL AS [v_h4]
      ,[v_ala1]
      ,[v_aine1]
      ,[v_sp]
      ,[v_maakunta]
      ,[v_okunryh]
      ,[v_ika] = case [v_ika]
	   when '01' then '30655v30'
	   when '02' then '19655v30'
	   when '03' then '19655v35'
	   when '04' then '19655v40'
	   when '05' then '19655v45'
	   when '06' then '19655v50'
	   when '07' then '55'
	   when '08' then '56'
	   when '09' then '57'
	   when '10' then '58'
	   when '11' then '59'
	   when '12' then '60'
	   when '13' then '61'
	   when '14' then '62'
	   when '15' then '63'
	   when '16' then '64'
	   when '17' then '19655v65'
	   else '-1'
	   end
	   ,v_osa1
	   ,v_osa2
      ,[tietolahde]='7_12_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K7_12_sopv_16]

  UNION ALL
  
  SELECT [tilv]
      ,[v_okieli]
      ,[v_oltyp]
      ,[v_tyos1]
      ,[v_tyos2]
      ,[v_tyos3]
      ,[v_tyos4]
      ,[v_tyos5]
	  ,[v_tyos] = case 
					when v_tyos1 = 1 then 1
					when v_tyos1 = 0 and v_tyos2 = 0 and v_tyos3 = 1 then 2
					when v_tyos1 = 0 and v_tyos2 = 1 and v_tyos3 = 0 then 3
					else -1
				  end
      ,[v_virka]
      ,[v_h1]
      ,[v_h2]
      ,[v_h3]
      ,[v_h4]
      ,[v_ala1]
      ,[v_aine1]
      ,[v_sp]
      ,[v_maakunta]
      ,[v_okunryh]
      ,[v_ika] = case [v_ika]
	   when '01' then '30655v30'
	   when '02' then '19655v30'
	   when '03' then '19655v35'
	   when '04' then '19655v40'
	   when '05' then '19655v45'
	   when '06' then '19655v50'
	   when '07' then '55'
	   when '08' then '56'
	   when '09' then '57'
	   when '10' then '58'
	   when '11' then '59'
	   when '12' then '60'
	   when '13' then '61'
	   when '14' then '62'
	   when '15' then '63'
	   when '16' then '64'
	   when '17' then '19655v65'
	   else '-1'
	   end
	   ,v_osa1 = null
	   ,v_osa2 = case when v_tyos5=1 then 1 else null end
      ,[tietolahde]='7_12_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K7_12_sopv_13]

  UNION ALL

  SELECT [tilv]
      ,[v_okieli]
      ,[v_oltyp]
      ,[v_tyos1]
      ,[v_tyos2]
      ,[v_tyos3]
      ,[v_tyos4]
      ,[v_tyos5]
	  ,[v_tyos] = case 
					when v_tyos1 = 1 then 1
					when v_tyos1 = 0 and v_tyos2 = 0 and v_tyos3 = 1 then 2
					when v_tyos1 = 0 and v_tyos2 = 1 and v_tyos3 = 0 then 3
					else -1
				  end
      ,[v_virka]
      ,[v_h1]
      ,[v_h2]
      ,[v_h3]
      ,[v_h4]
      ,[v_ala1]
      ,[v_aine1]
      ,[v_sp]
      ,[v_maakunta]= case v_maakunta when '20' then '99' else v_maakunta end
      ,[v_okunryh]
      ,[v_ika] = case [v_ika]
	   when '01' then '30655v30'
	   when '02' then '19655v30'
	   when '03' then '19655v35'
	   when '04' then '19655v40'
	   when '05' then '19655v45'
	   when '06' then '19655v50'
	   when '07' then '55'
	   when '08' then '56'
	   when '09' then '57'
	   when '10' then '58'
	   when '11' then '59'
	   when '12' then '60'
	   when '13' then '61'
	   when '14' then '62'
	   when '15' then '63'
	   when '16' then '64'
	   when '17' then '19655v65'
	   else '-1'
	   end
	   ,v_osa1 = null
	   ,v_osa2 = case when v_tyos5=1 then 1 else null end
      ,[tietolahde]='7_12_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K7_12_sopv_12]


) kaikkivuodet

























GO


USE [ANTERO]