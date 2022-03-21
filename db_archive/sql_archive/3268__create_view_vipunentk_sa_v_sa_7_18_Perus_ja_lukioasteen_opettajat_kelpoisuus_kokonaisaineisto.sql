USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]    Script Date: 31.3.2020 14:26:02 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]
GO

/****** Object:  View [dbo].[v_sa_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]    Script Date: 31.3.2020 14:26:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_sa_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]
Select * into [VipunenTK_DW].[dbo].[f_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto] FROM [VipunenTK_SA].[dbo].[v_sa_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]
Truncate table [VipunenTK_DW].[dbo].[f_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]
Insert into [VipunenTK_DW].[dbo].[f_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]
Select * FROM [VipunenTK_SA].[dbo].[v_sa_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
       ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	   ,[p_okieli] = Cast(kaikkivuodet.p_okieli as nvarchar(2))
       ,[p_oltyp] = Cast(kaikkivuodet.p_oltyp as nvarchar(2))
       ,[p_virka] = Cast(kaikkivuodet.p_virka as nvarchar(2))
       ,[p_aine] = Cast(kaikkivuodet.p_aine as nvarchar(2))
       ,[p_aine2] = Cast(kaikkivuodet.p_aine2 as nvarchar(2))
       ,[p_aine3] = Cast(kaikkivuodet.p_aine3 as nvarchar(2))
       ,[p_sp] = CAST(kaikkivuodet.p_sp as nvarchar(10))
       ,[p_maakunta] = CAST(kaikkivuodet.p_maakunta as varchar(2))
       ,[p_okunryh] = CAST(kaikkivuodet.p_okunryh as nvarchar(10))
       ,[p_ika] = CAST(kaikkivuodet.p_ika as nvarchar(10))
	   ,[p_kelpu] = CAST(kaikkivuodet.p_kelpu as nvarchar(10))
       ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
       ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  
  SELECT [tilv]
      ,[p_okieli]
      ,[p_oltyp]
      ,[p_virka] =	case						
						when p_virka in ('01','02','03','04') then cast(p_virka as int)
						when p_virka in ('05','06') then 4
						when p_virka in ('07','08','09','10') then cast(p_virka as int)-2
						else 9
					end
      ,[p_aine] = p_oppiaine1
	  ,[p_aine2] = p_oppiaine2
	  ,[p_aine3] = p_oppiaine3
      ,[p_sp]
      ,[p_maakunta]
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
      ,[tietolahde]='7_18_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_18_sopv_19]

  --union all

) kaikkivuodet




GO


USE [ANTERO]
