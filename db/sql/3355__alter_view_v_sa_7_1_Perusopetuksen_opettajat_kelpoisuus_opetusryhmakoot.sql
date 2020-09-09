USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]    Script Date: 9.9.2020 20:52:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[v_sa_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]
Select * into [VipunenTK_DW].[dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot] FROM [VipunenTK_SA].[dbo].[v_sa_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]
Truncate table [VipunenTK_DW].[dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]
Insert into [VipunenTK_DW].[dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]
  Select * FROM [VipunenTK_SA].[dbo].[v_sa_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[p_okieli] = Cast(kaikkivuodet.p_okieli as nvarchar(2))
      ,[p_oltyp] = Cast(kaikkivuodet.p_oltyp as nvarchar(2))
      ,[p_tyos1] = Cast(kaikkivuodet.p_tyos1 as nvarchar(2))
      ,[p_tyos2] = Cast(kaikkivuodet.p_tyos2 as nvarchar(2))
      ,[p_tyos3] = Cast(kaikkivuodet.p_tyos3 as nvarchar(2))
	  ,[p_tyos4] = Cast(kaikkivuodet.p_tyos4 as nvarchar(2))
      ,[p_tyos5] = Cast(kaikkivuodet.p_tyos5 as nvarchar(2))
	  ,[p_tyos] = Cast(kaikkivuodet.p_tyos as nvarchar(2))
      ,[p_virka] = Cast(kaikkivuodet.p_virka as nvarchar(2))
      ,[p_aste] = Cast(kaikkivuodet.p_aste as nvarchar(2))
      ,[p_k1] = Cast(kaikkivuodet.p_k1 as nvarchar(2))
      ,[p_k2] = Cast(kaikkivuodet.p_k2 as nvarchar(2))
      ,[p_k3] = Cast(kaikkivuodet.p_k3 as nvarchar(2))
      ,[p_k4] = Cast(kaikkivuodet.p_k4 as nvarchar(2))
      ,[p_k5] = Cast(kaikkivuodet.p_k5 as nvarchar(2))
      ,[p_k6] = Cast(kaikkivuodet.p_k6 as nvarchar(2))
      ,[p_k7] = Cast(kaikkivuodet.p_k7 as nvarchar(2))
      ,[p_k8] = Cast(kaikkivuodet.p_k8 as nvarchar(2))
      ,[p_k9] = Cast(kaikkivuodet.p_k9 as nvarchar(2))
      ,[p_k10] = Cast(kaikkivuodet.p_k10 as nvarchar(2))
      ,[p_k11] = Cast(kaikkivuodet.p_k11 as nvarchar(2))
      ,[p_olaste] = Cast(kaikkivuodet.p_olaste as nvarchar(2))
      ,[p_oluom] = Cast(kaikkivuodet.p_oluom as int)
      ,[p_aine] = Cast(kaikkivuodet.p_aine108 as nvarchar(2))
      ,[p_sp] = CAST(kaikkivuodet.p_sp as nvarchar(10))
      ,[p_maakunta] = CAST(kaikkivuodet.p_maakunta as varchar(2))
      ,[p_okunryh] = CAST(kaikkivuodet.p_okunryh as nvarchar(10))
      ,[p_ika] = CAST(kaikkivuodet.p_ika as nvarchar(10))
	  ,[p_kelpu] = CAST(kaikkivuodet.p_kelpu as nvarchar(10))
	  --,[p_kelp2] = CAST(kaikkivuodet.p_kelp2 as nvarchar(10))
	  ,[p_osa1] = CAST(kaikkivuodet.p_osa1 as nvarchar(10))
	  ,[p_osa2] = CAST(kaikkivuodet.p_osa2 as nvarchar(10))
	  ,[p_opetus] = CAST(kaikkivuodet.p_opetus as nvarchar(10))
	  ,[p_resu1] = CAST(kaikkivuodet.p_resu1 as nvarchar(10))
      ,[p_resu2] = CAST(kaikkivuodet.p_resu2 as nvarchar(10))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  
  SELECT [tilv]
      ,[p_okieli]
      ,[p_oltyp]
      ,[p_tyos1] = NULL
      ,[p_tyos2] = NULL
      ,[p_tyos3] = NULL
	  ,[p_tyos4] = NULL
      ,[p_tyos5] = NULL
	  ,[p_tyos]
      ,[p_virka] =	case 
						when p_virka in ('5','6') then '4'
						when p_virka in ('7','8','9','10') then cast(cast(p_virka as int)-2 as nvarchar(2))
						when p_virka = '99' then '9'
						else p_virka
					end
      ,[p_aste]
      ,[p_k1] = NULL
      ,[p_k2] = NULL
      ,[p_k3] = NULL
      ,[p_k4] = NULL
      ,[p_k5] = NULL
      ,[p_k6] = NULL
      ,[p_k7] = NULL
      ,[p_k8] = NULL
      ,[p_k9] = p_kelp2
      ,[p_k10] = NULL
      ,[p_k11] = NULL
      ,[p_olaste] = right('0'+p_olaste,2)
      ,[p_oluom]
      ,[p_aine108] = case 
						when p_aine1 = '00' then '99' 
						else right('0'+p_aine1,2)
					 end
      ,[p_sp]
      ,[p_maakunta] = case p_maakunta
						when '99' then '-1' 
						when '20' then '01'
						else right('0'+p_maakunta,2)
					  end
      ,[p_okunryh] = case p_okunryh when '9' then '-1' else p_okunryh end
      ,[p_ika] = case [p_ika]
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
	  ,[p_kelpu] = p_kelp1
	  --,[p_kelp2]
	  ,[p_osa1]
	  ,[p_osa2]
	  ,[p_opetus]
	  ,[p_resu1]
      ,[p_resu2]
      ,[tietolahde]='7_1_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_1_sopv_19]

  UNION ALL

  SELECT [tilv]
      ,[p_okieli]
      ,[p_oltyp]
      ,[p_tyos1] = NULL
      ,[p_tyos2] = NULL
      ,[p_tyos3] = NULL
	  ,[p_tyos4] = NULL
      ,[p_tyos5] = NULL
	  ,[p_tyos]
      ,[p_virka]
      ,[p_aste]
      ,[p_k1] = NULL
      ,[p_k2] = NULL
      ,[p_k3] = NULL
      ,[p_k4] = NULL
      ,[p_k5] = NULL
      ,[p_k6] = NULL
      ,[p_k7] = NULL
      ,[p_k8] = NULL
      ,[p_k9] = p_kelp2
      ,[p_k10] = NULL
      ,[p_k11] = NULL
      ,[p_olaste] = right('0'+p_olaste,2)
      ,[p_oluom]
      ,[p_aine108] = case 
						when p_aine1 = '00' then '99' 
						else right('0'+p_aine1,2)
					 end
      ,[p_sp]
      ,[p_maakunta] = case p_maakunta
						when '99' then '-1' 
						when '20' then '01'
						else right('0'+p_maakunta,2)
					  end
      ,[p_okunryh] = case p_okunryh when '9' then '-1' else p_okunryh end
      ,[p_ika] = case [p_ika]
	   when '01' then '30655v30'
	   when '02' then '19655v30'
	   when '03' then '19655v35'
	   when '04' then '19655v40'
	   when '05' then '19655v45'
	   when '06' then '19655v50'
	   when '65' then '19655v65'
	   when '66' then '19655v65'
	   when '67' then '19655v65'
	   when '68' then '19655v65'
	   when '69' then '19655v65'
	   when '70' then '19655v65'
	   when '71' then '19655v65'
	   else coalesce([p_ika],'-1')
	   end
	  /* sopv16_vanha:
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
	   */
	  ,[p_kelpu] = p_kelp1
	  --,[p_kelp2]
	  ,[p_osa1]
	  ,[p_osa2]
	  ,[p_opetus]
	  ,[p_resu1]
      ,[p_resu2]
      ,[tietolahde]='7_1_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_1_sopv_16]

  UNION ALL
  
  SELECT [tilv]
      ,[p_okieli]
      ,[p_oltyp]
      ,[p_tyos1]
      ,[p_tyos2]
      ,[p_tyos3]
	  ,[p_tyos4] = NULL
      ,[p_tyos5]
	  ,[p_tyos] = case 
					when p_tyos1 = 1 then 1
					when p_tyos1 = 0 and p_tyos2 = 0 and p_tyos3 = 1 then 2
					when p_tyos1 = 0 and p_tyos2 = 1 and p_tyos3 = 0 then 3
					else -1
				  end
      ,[p_virka]
      ,[p_aste]
      ,[p_k1]
      ,[p_k2]
      ,[p_k3]
      ,[p_k4]
      ,[p_k5]
      ,[p_k6]
      ,[p_k7]
      ,[p_k8]
      ,[p_k9] = null
      ,[p_k10]
      ,[p_k11]
      ,[p_olaste] = right('0'+rtrim(p_olaste),2)
      ,[p_oluom] = right('0'+rtrim(p_oluom),2)
      ,[p_aine108] = case 
						when p_aine108 = '00' then '99' 
						else right('0'+rtrim(p_aine108),2) 
					 end
      ,[p_sp]
      ,[p_maakunta] = case 
						when p_maakunta='99' then '-1' 
						else right('0'+rtrim(p_maakunta),2)
					  end
      ,[p_okunryh] = case p_okunryh when '9' then '-1' else p_okunryh end
      ,[p_ika] = case [p_ika]
	   when '1 ' then '30655v30'
	   when '2 ' then '19655v30'
	   when '3 ' then '19655v35'
	   when '4 ' then '19655v40'
	   when '5 ' then '19655v45'
	   when '6 ' then '19655v50'
	   when '7 ' then '55'
	   when '8 ' then '56'
	   when '9 ' then '57'
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
	   /* sopv13_vanha:
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
	   */
	  ,[p_kelpu]
	  --,[p_kelp2] = null
	  ,[p_osa1] = null
	  ,[p_osa2] = case when p_tyos5=1 then 1 else null end
	  ,[p_opetus] = null
	  ,[p_resu1] = null
      ,[p_resu2] = null
      ,[tietolahde]='7_1_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_1_sopv_13]

  UNION ALL

  SELECT [tilv]
      ,[p_okieli]
      ,[p_oltyp]
      ,[p_tyos1]
      ,[p_tyos2]
      ,[p_tyos3]
      ,[p_tyos4]
      ,[p_tyos5]
	  ,[p_tyos] = case 
					when p_tyos1 = 1 then 1
					when p_tyos1 = 0 and p_tyos2 = 0 and p_tyos3 = 1 then 2
					when p_tyos1 = 0 and p_tyos2 = 1 and p_tyos3 = 0 then 3
					else -1
				  end
      ,[p_virka]
      ,[p_aste]
      ,[p_k1]
      ,[p_k2]
      ,[p_k3]
      ,[p_k4]
      ,[p_k5]
      ,[p_k6]
      ,[p_k7]
      ,[p_k8]
      ,[p_k9] = null
      ,[p_k10]
      ,[p_k11]
      ,[p_olaste] = right('0'+p_olaste,2)
      ,[p_oluom]
      ,[p_aine108] = case 
						when p_aine108 = '00' then '99' 
						else right('0'+p_aine108,2) 
					 end
      ,[p_sp]
      ,[p_maakunta] = case p_maakunta
						when '99' then '-1' 
						when '20' then '01'
						else right('0'+p_maakunta,2)
					  end
      ,[p_okunryh] = case p_okunryh when '9' then '-1' else p_okunryh end
      ,[p_ika]=case [p_ika]
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
	  ,[p_kelpu] 
	  --,[p_kelp2] = null
	  ,[p_osa1] = null
	  ,[p_osa2] = case when p_tyos5=1 then 1 else null end
	  ,[p_opetus] = null
	  ,[p_resu1] = null
      ,[p_resu2] = null
	  ,[tietolahde]='7_1_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_1_sopv_12]


) kaikkivuodet




GO


USE [ANTERO]