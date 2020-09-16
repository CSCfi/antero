USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]    Script Date: 11.2.2020 12:53:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER VIEW [dbo].[v_sa_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]
Select * into [VipunenTK_DW].[dbo].[f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine] FROM [VipunenTK_SA].[dbo].[v_sa_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]
Truncate table [VipunenTK_DW].[dbo].[f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]
Insert into [VipunenTK_DW].[dbo].[f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]
  Select * FROM [VipunenTK_SA].[dbo].[v_sa_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[l_okieli] = Cast(kaikkivuodet.l_okieli as nvarchar(2))
      ,[l_tyos1] = Cast(kaikkivuodet.l_tyos1 as nvarchar(2))
      ,[l_tyos2] = Cast(kaikkivuodet.l_tyos2 as nvarchar(2))
      ,[l_tyos3] = Cast(kaikkivuodet.l_tyos3 as nvarchar(2))
	  ,[l_tyos4] = Cast(kaikkivuodet.l_tyos4 as nvarchar(2))
      ,[l_tyos5] = Cast(kaikkivuodet.l_tyos5 as nvarchar(2))
	  ,[l_tyos] = Cast(kaikkivuodet.l_tyos as nvarchar(2))
      ,[l_virka] = Cast(kaikkivuodet.l_virka as nvarchar(2))
      ,[l_aste] = Cast(kaikkivuodet.l_aste as nvarchar(2))
      ,[l_k1] = Cast(kaikkivuodet.l_k1 as nvarchar(2))
      ,[l_k2] = Cast(kaikkivuodet.l_k2 as nvarchar(2))
      ,[l_k3] = Cast(kaikkivuodet.l_k3 as nvarchar(2))
      ,[l_k4] = Cast(kaikkivuodet.l_k4 as nvarchar(2))
      ,[l_k5] = Cast(kaikkivuodet.l_k5 as nvarchar(2))
      ,[l_k6] = Cast(kaikkivuodet.l_k6 as nvarchar(2))
      ,[l_k7] = Cast(kaikkivuodet.l_k7 as nvarchar(2))
      ,[l_k8] = Cast(kaikkivuodet.l_k8 as nvarchar(2))
      ,[l_k9] = Cast(kaikkivuodet.l_k9 as nvarchar(2))
      ,[l_k10] = Cast(kaikkivuodet.l_k10 as nvarchar(2))
      ,[l_k11] = Cast(kaikkivuodet.l_k11 as nvarchar(2))
      ,[l_aine] = Cast(kaikkivuodet.l_aine108 as nvarchar(2))
      ,[l_sp] = CAST(kaikkivuodet.l_sp as nvarchar(10))
      ,[l_maakunta] = CAST(kaikkivuodet.l_maakunta as varchar(2))
      ,[l_okunryh] = CAST(kaikkivuodet.l_okunryh as nvarchar(10))
      ,[l_ika] = CAST(kaikkivuodet.l_ika as nvarchar(10))
	  ,[l_kelpu] = CAST(kaikkivuodet.l_kelpu as nvarchar(10))
	  --,[l_kelp2] = CAST(kaikkivuodet.l_kelp2 as nvarchar(10))
	  ,[l_osa1] = CAST(kaikkivuodet.l_osa1 as nvarchar(10))
	  ,[l_osa2] = CAST(kaikkivuodet.l_osa2 as nvarchar(10))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  
    SELECT [tilv]
      ,[l_okieli]
      ,[l_tyos1] = NULL
      ,[l_tyos2] = NULL
      ,[l_tyos3] = NULL
	  ,[l_tyos4] = NULL
      ,[l_tyos5] = NULL
	  ,[l_tyos] 
      ,[l_virka]
      ,[l_aste] 
      ,[l_k1] = NULL
      ,[l_k2] = NULL
      ,[l_k3] = NULL
      ,[l_k4] = NULL
      ,[l_k5] = NULL
      ,[l_k6] = NULL
      ,[l_k7] = NULL
      ,[l_k8] = NULL
      ,[l_k9] = l_kelp2
      ,[l_k10] = NULL
      ,[l_k11] = NULL
      ,[l_aine108] = 
				case 
					when cast(l_aine1 as int) = 0 then '99' 
					else right('0' + rtrim(l_aine1), 2)
				end
      ,[l_sp]
      ,[l_maakunta] = 
				case 
					when l_maakunta='99' then '-1' 
					else right('0'+l_maakunta,2)
				end
      ,[l_okunryh] = case l_okunryh when '9' then '-1' else l_okunryh end
      ,[l_ika] = case [l_ika]
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
	  ,[l_kelpu] = l_kelp1
	  --,[l_kelp2]
	  ,l_osa1 
	  ,l_osa2 
      ,[tietolahde]='7_4_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_4_sopv_19]

  UNION ALL

  SELECT [tilv]
      ,[l_okieli]
      ,[l_tyos1] = NULL
      ,[l_tyos2] = NULL
      ,[l_tyos3] = NULL
	  ,[l_tyos4] = NULL
      ,[l_tyos5] = NULL
	  ,[l_tyos]
      ,[l_virka]
      ,[l_aste]
      ,[l_k1] = NULL
      ,[l_k2] = NULL
      ,[l_k3] = NULL
      ,[l_k4] = NULL
      ,[l_k5] = NULL
      ,[l_k6] = NULL
      ,[l_k7] = NULL
      ,[l_k8] = NULL
      ,[l_k9] = l_kelp2
      ,[l_k10] = NULL
      ,[l_k11] = NULL
      ,[l_aine108] = 
				case --sulautetaan muiden vuoden luokitukseen
					when l_aine1 in ('00','01','58','99') then '99'
					when l_aine1 = '12' then '55'
					when l_aine1 = '38' then '35'
					when cast(l_aine1 as int) < 12 then right('0' + cast((cast(l_aine1 as int) - 1) as nvarchar(2)), 2)
					when cast(l_aine1 as int) < 38 then right('0' + cast((cast(l_aine1 as int) - 2) as nvarchar(2)), 2)
					when cast(l_aine1 as int) < 58 then right('0' + cast((cast(l_aine1 as int) - 3) as nvarchar(2)), 2)
				end
      ,[l_sp]
      ,[l_maakunta] = 
				case 
					when l_maakunta='99' then '-1' 
					else right('0'+l_maakunta,2)
				end
      ,[l_okunryh] = case l_okunryh when '9' then '-1' else l_okunryh end
      ,[l_ika] = case [l_ika]
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
	  ,[l_kelpu] = l_kelp1
	  --,[l_kelp2]
	  ,l_osa1
	  ,l_osa2
      ,[tietolahde]='7_4_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_4_sopv_16]

  UNION ALL
  
  SELECT [tilv]
      ,[l_okieli]
      ,[l_tyos1]
      ,[l_tyos2]
      ,[l_tyos3]
	  ,[l_tyos4] = NULL
      ,[l_tyos5]
	  ,[l_tyos] = case 
					when l_tyos1 = 1 then 1
					when l_tyos1 = 0 and l_tyos2 = 0 and l_tyos3 = 1 then 2
					when l_tyos1 = 0 and l_tyos2 = 1 and l_tyos3 = 0 then 3
					else -1
				  end
      ,[l_virka]
      ,[l_aste]
      ,[l_k1]
      ,[l_k2]
      ,[l_k3]
      ,[l_k4]
      ,[l_k5]
      ,[l_k6]
      ,[l_k7]
      ,[l_k8]
      ,[l_k9] = null
      ,[l_k10]
      ,[l_k11]
      ,[l_aine108] = case when l_aine108 = '00' then '99' 
					when left(l_aine108,1)<>0 and len(l_aine108)=1 then '0'+l_aine108
					else l_aine108 end
      ,[l_sp]
      ,[l_maakunta] = 
				case 
					when l_maakunta='99' then '-1' 
					else right('0'+l_maakunta,2)
				end
      ,[l_okunryh] = case l_okunryh when '9' then '-1' else l_okunryh end
      ,[l_ika] = case [l_ika]
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
	  ,[l_kelpu]
	  --,[l_kelp2] = null
	  ,l_osa1 = null
	  ,l_osa2 = case when l_tyos5=1 then 1 else null end
      ,[tietolahde]='7_4_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_4_sopv_13]

  UNION ALL

  SELECT [tilv]
      ,[l_okieli]
      ,[l_tyos1]
      ,[l_tyos2]
      ,[l_tyos3]
      ,[l_tyos4]
      ,[l_tyos5]
	  ,[l_tyos] = case 
					when l_tyos1 = 1 then 1
					when l_tyos1 = 0 and l_tyos2 = 0 and l_tyos3 = 1 then 2
					when l_tyos1 = 0 and l_tyos2 = 1 and l_tyos3 = 0 then 3
					else -1
				  end
      ,[l_virka]
      ,[l_aste]
      ,[l_k1]
      ,[l_k2]
      ,[l_k3]
      ,[l_k4]
      ,[l_k5]
      ,[l_k6]
      ,[l_k7]
      ,[l_k8]
      ,[l_k9] = null
      ,[l_k10]
      ,[l_k11]
      ,[l_aine108] = case when l_aine108 = '00' then '99' 
					when left(l_aine108,1)<>0 and len(l_aine108)=1 then '0'+l_aine108
					else l_aine108 end
      ,[l_sp]
      ,[l_maakunta] = 
				case l_maakunta
					when '99' then '-1' 
					when '20' then '01'
					else right('0'+l_maakunta,2)
				end
      ,[l_okunryh] = case l_okunryh when '9' then '-1' else l_okunryh end
      ,[l_ika]=case [l_ika]
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
	  ,[l_kelpu] 
	  --,[l_kelp2] = null
	  ,l_osa1 = null
	  ,l_osa2 = case when l_tyos5=1 then 1 else null end
	  ,[tietolahde]='7_4_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_4_sopv_12]


) kaikkivuodet





























GO


USE [ANTERO]