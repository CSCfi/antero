USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]    Script Date: 31.3.2020 14:32:01 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto]
GO

/****** Object:  View [dbo].[v_sa_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]    Script Date: 31.3.2020 14:32:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v_sa_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto]
Select * into [VipunenTK_DW].[dbo].[f_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto] FROM [VipunenTK_SA].[dbo].[v_sa_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto]
Truncate table [VipunenTK_DW].[dbo].[f_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto]
Insert into [VipunenTK_DW].[dbo].[f_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto]
Select * FROM [VipunenTK_SA].[dbo].[v_sa_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
       ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	   ,[a_okieli] = Cast(kaikkivuodet.a_okieli as nvarchar(2))
       ,[a_oltyp] = Cast(kaikkivuodet.a_oltyp as nvarchar(2))
       ,[a_maakunta] = CAST(kaikkivuodet.a_maakunta as nvarchar(2))
       ,[a_h11] = Cast(kaikkivuodet.a_h11 as nvarchar(2)) -- 1-a_kelp1
	   ,[a_sp] = Cast(kaikkivuodet.a_sp as nvarchar(3))
	   ,[a_ika] = Cast(kaikkivuodet.a_ika as nvarchar(10))
	   ,[a_ala] = Cast(kaikkivuodet.a_ala1 as nvarchar(2))
       ,[a_aine] = Cast(kaikkivuodet.a_aine1 as nvarchar(3))
	   ,[a_ala2] = Cast(kaikkivuodet.a_ala2 as nvarchar(2))
       ,[a_aine2] = Cast(kaikkivuodet.a_aine2 as nvarchar(3))
	   ,[a_ala3] = Cast(kaikkivuodet.a_ala3 as nvarchar(2))
       ,[a_aine3] = Cast(kaikkivuodet.a_aine3 as nvarchar(3))
       ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(20))
       ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  
    SELECT [tilv]
      ,[a_okieli]
	  ,[a_oltyp]
      ,[a_h11] = case a_kelp1 when 1 then 0 when 0 then 1 end
      ,[a_ala1] = case when a_ala1 is null or a_ala1 = '11' then '99' else right('0'+rtrim(a_ala1), 2) end --iscfibroad
      ,[a_aine1] = rtrim(a_aine1)
	  ,[a_ala2] = case when a_ala2 is null or a_ala2 = '11' then '99' else right('0'+rtrim(a_ala2), 2) end --iscfibroad
	  ,[a_aine2] = rtrim(a_aine2)
	  ,[a_ala3] = case when a_ala3 is null or a_ala3 = '11' then '99' else right('0'+rtrim(a_ala3), 2) end --iscfibroad
	  ,[a_aine3] = rtrim(a_aine3)
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
      ,[a_maakunta] = case a_maakunta when '99' then '-1' when '20' then '01' else a_maakunta end
      ,[tietolahde]='7_19_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_19_sopv_19]

  --UNION ALL

) kaikkivuodet


GO

USE [ANTERO]