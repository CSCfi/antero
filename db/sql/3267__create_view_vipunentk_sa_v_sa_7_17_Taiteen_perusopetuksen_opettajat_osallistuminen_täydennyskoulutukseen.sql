USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 25.2.2020 20:25:10 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
GO

/****** Object:  View [dbo].[v_sa_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 25.2.2020 20:25:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
























CREATE VIEW [dbo].[v_sa_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Select * into [VipunenTK_DW].[dbo].[f_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen] FROM [VipunenTK_SA].[dbo].[v_sa_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Truncate table [VipunenTK_DW].[dbo].[f_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Insert into [VipunenTK_DW].[dbo].[7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Select * FROM [VipunenTK_SA].[dbo].[v_sa_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[t_okieli] = Cast(kaikkivuodet.t_okieli as nvarchar(4))
      ,[t_virka] = Cast(kaikkivuodet.t_virka as nvarchar(4))
      ,[t_tayd] = Cast(kaikkivuodet.t_tayd as nvarchar(4))
      ,[t_tayd_oa] = Cast(kaikkivuodet.t_tayd_oa as nvarchar(4))
      ,[t_tutktyo] = Cast(kaikkivuodet.t_tutktyo as nvarchar(3))
      ,[t_tutkoma] = Cast(kaikkivuodet.t_tutkoma as nvarchar(3))
      ,[t_pattyo] = Cast(kaikkivuodet.t_pattyo as nvarchar(3))
      ,[t_patoma] = Cast(kaikkivuodet.t_patoma as nvarchar(3))
      ,[t_henktyo] = Cast(kaikkivuodet.t_henktyo as nvarchar(3))
      ,[t_henkoma] = Cast(kaikkivuodet.t_henkoma as nvarchar(3))
      ,[t_muutyo] = Cast(kaikkivuodet.t_muutyo as nvarchar(3))
      ,[t_muuoma] = Cast(kaikkivuodet.t_muuoma as nvarchar(3))
	  ,[t_kanstyo] = Cast(kaikkivuodet.t_kanstyo as nvarchar(3))
      ,[t_kansoma] = Cast(kaikkivuodet.t_kansoma as nvarchar(3))
	  ,[t_kehsuu] = Cast(kaikkivuodet.t_kehsuu as nvarchar(3)) 
      ,[t_sp] = Cast(kaikkivuodet.t_sp as nvarchar(2))
      ,[t_maakunta] = Cast(kaikkivuodet.t_maakunta as nvarchar(2))
	  ,[t_ika] = Cast(kaikkivuodet.t_ika as nvarchar(10))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)

FROM (
  
  SELECT [tilv]
      ,[t_okieli]
      ,[t_virka]
      ,[t_tayd]
	  ,[t_tayd_oa]
      ,[t_tutktyo]
      ,[t_tutkoma]
      ,[t_pattyo]
      ,[t_patoma]
      ,[t_henktyo]
      ,[t_henkoma]
      ,[t_muutyo]
      ,[t_muuoma]
	  ,[t_kanstyo]
	  ,[t_kansoma]
	  ,[t_kehsuu]
      ,[t_sp]
      ,[t_maakunta]
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
      ,[tietolahde]='7_17_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_17_sopv_19]

  --union all

) kaikkivuodet


GO

USE [ANTERO]