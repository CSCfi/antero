USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]    Script Date: 26.2.2020 20:59:13 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]
GO

/****** Object:  View [dbo].[v_sa_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]    Script Date: 26.2.2020 20:59:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


























CREATE VIEW [dbo].[v_sa_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]
Select * into [VipunenTK_DW].[dbo].[f_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine] FROM [VipunenTK_SA].[dbo].[v_sa_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]
Truncate table [VipunenTK_DW].[dbo].[f_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]
Insert into [VipunenTK_DW].[dbo].[f_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]
Select *  FROM [VipunenTK_SA].[dbo].[v_sa_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[t_okieli] = Cast(kaikkivuodet.t_okieli as nvarchar(4))
	  ,[t_tyos] = Cast(kaikkivuodet.t_tyos as nvarchar(3))
      ,[t_virka] = Cast(kaikkivuodet.t_virka as nvarchar(3))
      ,[t_kelp] = Cast(kaikkivuodet.t_kelp as nvarchar(3))
      ,[t_p1] = Cast(kaikkivuodet.t_p1 as nvarchar(3))
      ,[t_p2] = Cast(kaikkivuodet.t_p2 as nvarchar(3))
	  ,[t_otaso] = Cast(kaikkivuodet.t_otaso as nvarchar(3))
      ,[t_ala1] = Cast(kaikkivuodet.t_ala1 as nvarchar(3))
	  ,[t_aine1] = Cast(kaikkivuodet.t_aine1 as nvarchar(3))
      ,[t_sp] = Cast(kaikkivuodet.t_sp as nvarchar(2))
      ,[t_maakunta] = Cast(kaikkivuodet.t_maakunta as nvarchar(2))
	  ,[t_okunryh] =  Cast(kaikkivuodet.t_okunryh as nvarchar(2))
	  ,[t_ika] = Cast(kaikkivuodet.t_ika as nvarchar(10))
	  ,[t_osa1] = Cast(kaikkivuodet.t_osa1 as nvarchar(10))
	  ,[t_osa2] = Cast(kaikkivuodet.t_osa2 as nvarchar(10))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  
  SELECT [tilv]
      ,[t_okieli]
	  ,[t_tyos]
      ,[t_virka]
      ,[t_kelp]
      ,[t_p1] = coalesce(t_p1,0)
      ,[t_p2] = coalesce(t_p2,0)
	  ,[t_otaso]
      ,[t_ala1]
      ,[t_aine1]
      ,[t_sp]
      ,[t_maakunta]
      ,[t_okunryh]
      ,[t_ika] = case [t_ika]
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
	   ,[t_osa1]
	   ,[t_osa2]
      ,[tietolahde]='7_15_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K7_15_sopv_19]

  --UNION ALL

) kaikkivuodet



GO

USE [ANTERO]