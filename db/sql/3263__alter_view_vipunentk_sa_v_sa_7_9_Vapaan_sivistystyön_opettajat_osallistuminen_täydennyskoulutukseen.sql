USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 6.2.2020 12:34:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





















ALTER VIEW [dbo].[v_sa_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]
Select * into [VipunenTK_DW].[dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen] FROM [VipunenTK_SA].[dbo].[v_sa_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]
Truncate table [VipunenTK_DW].[dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]
Insert into [VipunenTK_DW].[dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]
Select *  FROM [VipunenTK_SA].[dbo].[v_sa_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[v_okieli] = Cast(kaikkivuodet.v_okieli as nvarchar(4))
      ,[v_virka] = Cast(kaikkivuodet.v_virka as nvarchar(4))
      ,[v_taydjo] = Cast(kaikkivuodet.v_taydjo as nvarchar(4))
      ,[v_taydeit] = Cast(kaikkivuodet.v_taydeit as nvarchar(4))
      ,[v_eitayd] = Cast(kaikkivuodet.v_eitayd as nvarchar(4))
      ,[v_tutktyo] = Cast(kaikkivuodet.v_tutktyo as nvarchar(3))
      ,[v_tutkoma] = Cast(kaikkivuodet.v_tutkoma as nvarchar(3))
      ,[v_pattyo] = Cast(kaikkivuodet.v_pattyo as nvarchar(3))
      ,[v_patoma] = Cast(kaikkivuodet.v_patoma as nvarchar(3))
      ,[v_henktyo] = Cast(kaikkivuodet.v_henktyo as nvarchar(3))
      ,[v_henkoma] = Cast(kaikkivuodet.v_henkoma as nvarchar(3))
      ,[v_muutyo] = Cast(kaikkivuodet.v_muutyo as nvarchar(3))
      ,[v_muuoma] = Cast(kaikkivuodet.v_muuoma as nvarchar(3))
	  ,[v_kanstyo] = Cast(kaikkivuodet.v_kanstyo as nvarchar(3))
      ,[v_kansoma] = Cast(kaikkivuodet.v_kansoma as nvarchar(3))
	  ,[v_kehsuu] = Cast(kaikkivuodet.v_kehsuu as nvarchar(3)) 
      ,[v_sp] = Cast(kaikkivuodet.v_sp as nvarchar(2))
      ,[v_maakunta] = Cast(kaikkivuodet.v_maakunta as nvarchar(2))
	  ,[v_ika] = Cast(kaikkivuodet.v_ika as nvarchar(10))
	  ,[v_mento1] = Cast(kaikkivuodet.v_mento1 as nvarchar(2))
	  ,[v_mento2] = Cast(kaikkivuodet.v_mento2 as nvarchar(2))
	  ,[v_mento3] = Cast(kaikkivuodet.v_mento3 as nvarchar(2))
	  ,[v_mento4] = Cast(kaikkivuodet.v_mento4 as nvarchar(2))
	  ,[v_tyonoh1] = Cast(kaikkivuodet.v_tyonoh1 as nvarchar(2))
	  ,[v_tyonoh2] = Cast(kaikkivuodet.v_tyonoh2 as nvarchar(2))
	  ,[v_tyonoh3] = Cast(kaikkivuodet.v_tyonoh3 as nvarchar(2))
	  ,[v_tunnit] = Cast(kaikkivuodet.v_tunnit as nvarchar(2))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  
  SELECT [tilv]
      ,[v_okieli]
      ,[v_virka]
      ,NULL AS [v_taydjo]
      ,NULL AS [v_taydeit]
      ,case v_tayd when 1 then 0 when 0 then 1 end AS [v_eitayd]
      ,[v_tutktyo]
      ,[v_tutkoma]
      ,[v_pattyo]
      ,[v_patoma]
      ,[v_henktyo]
      ,[v_henkoma]
      ,[v_muutyo]
      ,[v_muuoma]
	  ,[v_kanstyo]
	  ,[v_kansoma]
	  ,[v_kehsuu]
      ,[v_sp]
      ,[v_maakunta] = case v_maakunta when '99' then '-1' else v_maakunta end
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
	  ,v_mento1
	  ,v_mento2
	  ,v_mento3
	  ,v_mento4
	  ,v_tyonoh1
	  ,v_tyonoh2
	  ,v_tyonoh3
	  ,v_tunnit
      ,[tietolahde]='7_9_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_9_sopv_19]

  UNION ALL

  SELECT [tilv]
      ,[v_okieli]
      ,[v_virka]
      ,NULL AS [v_taydjo]
      ,NULL AS [v_taydeit]
      ,case v_tayd when 1 then 0 when 0 then 1 end AS [v_eitayd]
      ,[v_tutktyo]
      ,[v_tutkoma]
      ,[v_pattyo]
      ,[v_patoma]
      ,[v_henktyo]
      ,[v_henkoma]
      ,[v_muutyo]
      ,[v_muuoma]
	  ,[v_kanstyo]
	  ,[v_kansoma]
	  ,[v_kehsuu]
      ,[v_sp]
      ,[v_maakunta] = case v_maakunta when '99' then '-1' else v_maakunta end
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
	  ,v_mento1
	  ,v_mento2
	  ,v_mento3
	  ,v_mento4
	  ,v_tyonoh1
	  ,v_tyonoh2
	  ,v_tyonoh3
	  ,v_tunnit = null
      ,[tietolahde]='7_9_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_9_sopv_16]

  UNION ALL
  
  SELECT [tilv]
      ,[v_okieli]
      ,[v_virka]
      ,[v_taydjo]
      ,[v_taydeit]
      ,[v_eitayd]
      ,[v_tutktyo]
      ,[v_tutkoma]
      ,[v_pattyo]
      ,[v_patoma]
      ,[v_henktyo]
      ,[v_henkoma]
      ,[v_muutyo]
      ,[v_muuoma]
	  ,[v_kanstyo]
	  ,[v_kansoma]
	  ,[v_kehsuu]
      ,[v_sp]
      ,[v_maakunta] = case v_maakunta when '99' then '-1' else v_maakunta end
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
	  ,v_mento1 = null
	  ,v_mento2 = null
	  ,v_mento3 = null
	  ,v_mento4 = null
	  ,v_tyonoh1 = null
	  ,v_tyonoh2 = null
	  ,v_tyonoh3 = null
	  ,v_tunnit = null
      ,[tietolahde]='7_9_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_9_sopv_13]

  UNION ALL

  SELECT [tilv]
      ,[v_okieli]
      ,[v_virka]
      ,[v_taydjo]
      ,[v_taydeit]
      ,[v_eitayd]
      ,[v_tutktyo]
      ,[v_tutkoma]
      ,[v_pattyo]
      ,[v_patoma]
      ,[v_henktyo]
      ,[v_henkoma]
      ,[v_muutyo]
      ,[v_muuoma]
	  ,[v_kanstyo] = NULL
	  ,[v_kansoma] = NULL
	  ,[v_kehsuu]
      ,[v_sp]
      ,[v_maakunta] = case v_maakunta when '99' then '-1' else v_maakunta end
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
	  ,v_mento1 = null
	  ,v_mento2 = null
	  ,v_mento3 = null
	  ,v_mento4 = null
	  ,v_tyonoh1 = null
	  ,v_tyonoh2 = null
	  ,v_tyonoh3 = null
	  ,v_tunnit = null
	  ,[tietolahde]='7_9_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_9_sopv_12]


) kaikkivuodet





















GO


USE [ANTERO]