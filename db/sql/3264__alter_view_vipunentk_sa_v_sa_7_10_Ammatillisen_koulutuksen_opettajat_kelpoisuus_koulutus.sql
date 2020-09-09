USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]    Script Date: 21.2.2020 22:24:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



























ALTER VIEW [dbo].[v_sa_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
Select * into [VipunenTK_DW].[dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus] FROM [VipunenTK_SA].[dbo].[v_sa_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
Truncate table [VipunenTK_DW].[dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
Insert into [VipunenTK_DW].[dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
  Select * FROM [VipunenTK_SA].[dbo].[v_sa_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[a_okieli] = Cast(kaikkivuodet.a_okieli as nvarchar(2))
	  ,[a_virka] = Cast(kaikkivuodet.a_virka as nvarchar(2))
      ,[a_aste] = Cast(kaikkivuodet.a_aste as nvarchar(2))
	  ,[a_kelpo] = Cast(kaikkivuodet.a_kelpo as nvarchar(2))
	  ,[a_tyos] = Cast(kaikkivuodet.a_tyos as nvarchar(2))
      ,[a_g16] = Cast(kaikkivuodet.a_g16 as nvarchar(2))
      ,[a_g17] = Cast(kaikkivuodet.a_g17 as nvarchar(2))
      ,[a_g18] = Cast(kaikkivuodet.a_g18 as nvarchar(2))
      ,[a_g19] = Cast(kaikkivuodet.a_g19 as nvarchar(2))
      ,[a_g20] = Cast(kaikkivuodet.a_g20 as nvarchar(2))
      ,[a_g21] = Cast(kaikkivuodet.a_g21 as nvarchar(2))
      ,[a_g22] = Cast(kaikkivuodet.a_g22 as nvarchar(2))
      ,[a_h6] = Cast(kaikkivuodet.a_h6 as nvarchar(2))
      ,[a_h7] = Cast(kaikkivuodet.a_h7 as nvarchar(2))
      ,[a_h8] = Cast(kaikkivuodet.a_h8 as nvarchar(2))
      ,[a_h9] = Cast(kaikkivuodet.a_h9 as nvarchar(2))
      ,[a_h10] = Cast(kaikkivuodet.a_h10 as nvarchar(2))
	  ,[a_h10_valm] = Cast(kaikkivuodet.a_h10_valm as nvarchar(2))
      ,[a_h11] = Cast(kaikkivuodet.a_h11 as nvarchar(2))
      ,[a_h1] = Cast(kaikkivuodet.a_h1 as nvarchar(2))
      ,[a_h2] = Cast(kaikkivuodet.a_h2 as nvarchar(2))
      ,[a_h3] = Cast(kaikkivuodet.a_h3 as nvarchar(2))
      ,[a_h4] = Cast(kaikkivuodet.a_h4 as nvarchar(2))
	  --,[a_h5] = Cast(kaikkivuodet.a_h5 as nvarchar(2))
	  ,[a_kelp2] = Cast(kaikkivuodet.a_kelp2 as nvarchar(2))
	  ,[a_k1] = Cast(kaikkivuodet.a_k1 as nvarchar(2))
      ,[a_k2] = Cast(kaikkivuodet.a_k2 as nvarchar(2))
      ,[a_k3] = Cast(kaikkivuodet.a_k3 as nvarchar(2))
      ,[a_k4] = Cast(kaikkivuodet.a_k4 as nvarchar(2))
	  ,[a_k5] = Cast(kaikkivuodet.a_k5 as nvarchar(2))
	  ,[a_k6] = Cast(kaikkivuodet.a_k6 as nvarchar(2))
	  ,[a_ala] = Cast(kaikkivuodet.a_ala108 as nvarchar(2))
      ,[a_aine] = Cast(kaikkivuodet.a_aine108 as nvarchar(3))
	  ,[a_ala2] = Cast(kaikkivuodet.a_ala208 as nvarchar(2))
      ,[a_aine2] = Cast(kaikkivuodet.a_aine208 as nvarchar(3))
	  ,[a_ala3] = Cast(kaikkivuodet.a_ala308 as nvarchar(2))
      ,[a_aine3] = Cast(kaikkivuodet.a_aine308 as nvarchar(3))
	  ,[a_sp] = Cast(kaikkivuodet.a_sp as nvarchar(3))
	  ,[a_ika] = Cast(kaikkivuodet.a_ika as nvarchar(10))
      --,[a_koulk] = Cast(kaikkivuodet.a_koulk as nvarchar(6))
      --,[a_oppil] = Cast(kaikkivuodet.a_oppil as nvarchar(2))
      --,[a_eioppilkm] = Cast(kaikkivuodet.a_eioppilkm as nvarchar(2))
      --,[a_oppilkm] = Cast(kaikkivuodet.a_oppilkm as nvarchar(2))
      --,[a_ykieli] = Cast(kaikkivuodet.a_ykieli as nvarchar(2))
      --,[a_ymkunta] = CAST(kaikkivuodet.a_ymkunta as varchar(2))
      ,[a_maakunta] = CAST(kaikkivuodet.a_maakunta as nvarchar(2))
	  ,[a_osa1] = CAST(kaikkivuodet.a_osa1 as nvarchar(2))
	  ,[a_osa2] = CAST(kaikkivuodet.a_osa2 as nvarchar(2))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(20))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  
    SELECT [tilv]
      ,[a_okieli]
	  ,[a_virka] = case a_virka when '4' then '7' when '5' then '4' when '6' then '5' when '7' then '6' else a_virka end --kuvaus korjattu
      ,[a_aste]
	  ,[a_kelpo]
	  ,[a_tyos]
      ,[a_g16] = a_erit
      ,[a_g17] = a_opint
      ,[a_g18] = case when a_valm2 = 1 then 1 else 0 end
      ,[a_g19] = case when a_valm2 = 2 then 1 else 0 end
      ,[a_g20] = null
      ,[a_g21] = null
      ,[a_g22] = null
      ,[a_h6] = case when a_kelpo = 1 or a_k1 = 1 then 1 else 0 end
      ,[a_h7] = case when a_kelpo = 2 or a_k2 = 1 then 1 else 0 end
      ,[a_h8] = case when a_kelpo = 3 or a_k3 = 1 then 1 else 0 end
      ,[a_h9] = case when a_kelpo = 4 or a_k4 = 1 then 1 else 0 end
      ,[a_h10_valm] = case when a_kelpo = 5 or a_k5 = 1 then 1 else 0 end
	  ,[a_h10] = case when a_kelpo = 6 or a_k6 = 1 then 1 else 0 end
      ,[a_h11] = case a_kelp1 when 1 then 0 when 0 then 1 end
      ,[a_h1] = coalesce(a_p1,0)
      ,[a_h2] = coalesce(a_p2,0)
      ,[a_h3] = coalesce(a_p3,0)
      ,[a_h4] = null
	  --,[a_h5] = null
	  ,[a_kelp2]
	  ,[a_k1] = coalesce(a_k1,0)
      ,[a_k2] = coalesce(a_k2,0)
      ,[a_k3] = coalesce(a_k3,0)
      ,[a_k4] = coalesce(a_k4,0)
	  ,[a_k5] = coalesce(a_k5,0)
	  ,[a_k6] = coalesce(a_k6,0)
      ,[a_ala108] = case when a_ala1 is null or a_ala1 = '11' then '99' else right('0'+rtrim(a_ala1), 2) end --iscfibroad
      ,[a_aine108] = rtrim(a_aine1)
	  ,[a_ala208] = case when a_ala2 is null or a_ala2 = '11' then '99' else right('0'+rtrim(a_ala2), 2) end --iscfibroad
	  ,[a_aine208] = rtrim(a_aine2)
	  ,[a_ala308] = case when a_ala3 is null or a_ala3 = '11' then '99' else right('0'+rtrim(a_ala3), 2) end --iscfibroad
	  ,[a_aine308] = rtrim(a_aine3)
	  ,[a_sp]
	  ,[a_ika] = case [a_ika]
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
      --,[a_koulk]
      --,[a_oppil]
      --,[a_eioppilkm]
      --,[a_oppilkm]
      --,[a_ykieli]
      --,[a_ymkunta] = case a_ymkunta when '99' then '-1' when '20' then '01' else a_ymkunta end
      ,[a_maakunta] = case a_maakunta when '99' then '-1' when '20' then '01' else a_maakunta end
	  ,a_osa1
	  ,a_osa2
      ,[tietolahde]='7_10_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K7_10_sopv_19]

  UNION ALL

  SELECT [tilv]
      ,[a_okieli]
	  ,[a_virka] = case a_virka when '7' then '8' when '8' then '9' when '9' then '0' else a_virka end --väliaikainen
      ,[a_aste] = case a_aste when '13' then '14' when '14' then '13' else a_aste end --väliaikainen
	  ,[a_kelpo] = case a_kelpo when '5' then '6' else a_kelpo end --väliaikainen
	  ,[a_tyos]
      ,[a_g16] = a_erit
      ,[a_g17] = null
      ,[a_g18] = case when a_valm2 = 1 then 1 else 0 end
      ,[a_g19] = case when a_valm2 = 2 then 1 else 0 end
      ,[a_g20] = null
      ,[a_g21] = null
      ,[a_g22] = null
      ,[a_h6] = case when a_kelpo = 1 or a_k1 = 1 then 1 else 0 end
      ,[a_h7] = case when a_kelpo = 2 or a_k2 = 1 then 1 else 0 end
      ,[a_h8] = case when a_kelpo = 3 or a_k3 = 1 then 1 else 0 end
      ,[a_h9] = case when a_kelpo = 4 or a_k4 = 1 then 1 else 0 end
	  ,[a_h10_valm] = null
      ,[a_h10] = case when a_kelpo = 5 or a_k5 = 1 then 1 else 0 end --väliaikainen
      ,[a_h11] = case a_kelp1 when 1 then 0 when 0 then 1 end
      ,[a_h1] = a_p1
      ,[a_h2] = a_p2
      ,[a_h3] = a_p3
      ,[a_h4] = null
	  --,[a_h5] = null
	  ,[a_kelp2]
	  ,[a_k1]
      ,[a_k2]
      ,[a_k3]
      ,[a_k4]
	  ,[a_k5] = null
	  ,[a_k6] = a_k5 --väliaikainen
      ,[a_ala108] = a_ala1
      ,[a_aine108] = case a_aine1 when '00' then '99' else a_aine1 end
	  ,[a_ala208] = a_ala2
	  ,[a_aine208] = a_aine2
	  ,[a_ala308] = a_ala3
	  ,[a_aine308] = a_aine3
	  ,[a_sp]
	  ,[a_ika] = case [a_ika]
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
      --,[a_koulk]
      --,[a_oppil]
      --,[a_eioppilkm]
      --,[a_oppilkm]
      --,[a_ykieli]
      --,[a_ymkunta] = case a_ymkunta when '99' then '-1' when '20' then '01' else a_ymkunta end
      ,[a_maakunta] = case a_maakunta when '99' then '-1' when '20' then '01' else a_maakunta end
	  ,a_osa1
	  ,a_osa2
      ,[tietolahde]='7_10_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K7_10_sopv_16]

  UNION ALL
  
  SELECT [tilv]
      ,[a_okieli]
	  ,[a_virka]
      ,[a_aste]
	  ,[a_kelpo] = null
	  ,[a_tyos] = case 
					when a_tyos1 = 1 then 1
					when a_tyos1 = 0 and a_tyos2 = 0 and a_tyos3 = 1 then 2
					when a_tyos1 = 0 and a_tyos2 = 1 and a_tyos3 = 0 then 3
					else -1
				  end
      ,[a_g16]
      ,[a_g17]
      ,[a_g18] = case when a_g18=1 or a_g20=1 or a_g21=1 or a_g22=1 then 1 else 0 end
      ,[a_g19]
      ,[a_g20]
      ,[a_g21]
      ,[a_g22]
      ,[a_h6]
      ,[a_h7]
      ,[a_h8]
      ,[a_h9]
	  ,[a_h10_valm] = null
      ,[a_h10]
      ,[a_h11]
      ,[a_h1]
      ,[a_h2]
      ,[a_h3]
      ,[a_h4]
	  --,[a_h5] = null
	  ,[a_kelp2] = null
	  ,[a_k1] = null
      ,[a_k2] = null
      ,[a_k3] = null
      ,[a_k4] = null
	  ,[a_k5] = null
	  ,[a_k6] = null
      ,[a_ala108]
      ,[a_aine108] = case a_aine108 when '00' then '99' else a_aine108 end
	  ,a_ala208
	  ,a_aine208
	  ,a_ala308
	  ,a_aine308
	  ,[a_sp]
	  ,[a_ika] = case [a_ika]
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
      --,[a_koulk]
      --,[a_oppil]
      --,[a_eioppilkm]
      --,[a_oppilkm]
      --,[a_ykieli]
      --,[a_ymkunta] = case a_ymkunta when '99' then '-1' when '20' then '01' else a_ymkunta end
      ,[a_maakunta] = case a_maakunta when '99' then '-1' when '20' then '01' else a_maakunta end
	  ,a_osa1 = null
	  ,a_osa2 = case when a_tyos5=1 then 1 else null end
      ,[tietolahde]='7_10_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K7_10_sopv_13]

  UNION ALL

  SELECT [tilv]
      ,[a_okieli]
	  ,[a_virka]
      ,[a_aste]
	  ,[a_kelpo] = null
	  ,[a_tyos] = case 
					when a_tyos1 = 1 then 1
					when a_tyos1 = 0 and a_tyos2 = 0 and a_tyos3 = 1 then 2
					when a_tyos1 = 0 and a_tyos2 = 1 and a_tyos3 = 0 then 3
					else -1
				  end
      ,[a_g16]
      ,[a_g17]
      ,[a_g18] = case when a_g18=1 or a_g20=1 or a_g21=1 or a_g22=1 then 1 else 0 end
      ,[a_g19]
      ,[a_g20]
      ,[a_g21]
      ,[a_g22]
      ,[a_h6] = NULL
      ,[a_h7] = NULL
      ,[a_h8] = NULL
      ,[a_h9] = NULL
      ,[a_h10] = NULL
	  ,[a_h10_valm] = null
      ,[a_h11] = case a_h5 when 1 then 0 when 0 then 1 end
      ,[a_h1]
      ,[a_h2]
      ,[a_h3]
      ,[a_h4]
	  --,[a_h5]
	  ,[a_kelp2] = null
	  ,[a_k1] = null
      ,[a_k2] = null
      ,[a_k3] = null
      ,[a_k4] = null
	  ,[a_k5] = null
	  ,[a_k6] = null
      ,[a_ala108]
      ,[a_aine108] = case a_aine108 when '00' then '99' else a_aine108 end
	  ,a_ala208
	  ,a_aine208
	  ,a_ala308
	  ,a_aine308
	  ,[a_sp]
	  ,[a_ika]= case [a_ika]
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
      --,[a_koulk]
      --,[a_oppil] = NULL
      --,[a_koulk_jarj_eioppilkm]
      --,[a_koulk_jarj_oppilkm]
      --,[a_ykieli]
      --,[a_ymkunta] = case a_ymkunta when '99' then '-1' when '20' then '01' else a_ymkunta end
      ,[a_maakunta] = case a_maakunta when '99' then '-1' when '20' then '01' else a_maakunta end
	  ,a_osa1 = null
	  ,a_osa2 = case when a_tyos5=1 then 1 else null end
      ,[tietolahde]='7_10_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K7_10_sopv_12]


) kaikkivuodet



























GO


USE [ANTERO]