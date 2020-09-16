USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_6_Lukiokoulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 11.2.2020 12:53:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



















ALTER VIEW [dbo].[v_sa_7_6_Lukiokoulutuksen_opettajat_osallistuminen_täydennyskoulutukseen] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen]
Select * into [VipunenTK_DW].[dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen] FROM [VipunenTK_SA].[dbo].[v_sa_7_6_Lukiokoulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Truncate table [VipunenTK_DW].[dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen]
Select * into [VipunenTK_DW].[dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen]
  FROM [VipunenTK_SA].[dbo].[v_sa_7_6_Lukiokoulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[l_okieli] = Cast(kaikkivuodet.l_okieli as nvarchar(2))
      ,[l_virka] = Cast(kaikkivuodet.l_virka as nvarchar(2))
      ,[l_taydjo] = Cast(kaikkivuodet.l_taydjo as nvarchar(2))
      ,[l_taydeit] = Cast(kaikkivuodet.l_taydeit as nvarchar(2))
      ,[l_eitayd] = Cast(kaikkivuodet.l_eitayd as nvarchar(2))
      ,[l_tutktyo] = Cast(kaikkivuodet.l_tutktyo as nvarchar(4))
      ,[l_tutkoma] = Cast(kaikkivuodet.l_tutkoma as nvarchar(4))
      ,[l_pattyo] = Cast(kaikkivuodet.l_pattyo as nvarchar(4))
      ,[l_patoma] = Cast(kaikkivuodet.l_patoma as nvarchar(4))
      ,[l_henktyo] = Cast(kaikkivuodet.l_henktyo as nvarchar(4))
      ,[l_henkoma] = Cast(kaikkivuodet.l_henkoma as nvarchar(4))
      ,[l_muutyo] = Cast(kaikkivuodet.l_muutyo as nvarchar(4))
      ,[l_muuoma] = Cast(kaikkivuodet.l_muuoma as nvarchar(4))
      ,[l_kanstyo] = Cast(kaikkivuodet.l_kanstyo as nvarchar(4))
      ,[l_kansoma] = Cast(kaikkivuodet.l_kansoma as nvarchar(4))
      ,[l_kehsuu] = Cast(kaikkivuodet.l_kehsuu as nvarchar(2))
      ,[l_sp] = Cast(kaikkivuodet.l_sp as nvarchar(2))
      ,[l_maakunta]  = Cast(kaikkivuodet.l_maakunta as nvarchar(3))
      ,[l_ika] = Cast(kaikkivuodet.l_ika as nvarchar(10))
	  ,[l_mento1] = Cast(kaikkivuodet.l_mento1 as nvarchar(2))
	  ,[l_mento2] = Cast(kaikkivuodet.l_mento2 as nvarchar(2))
	  ,[l_mento3] = Cast(kaikkivuodet.l_mento3 as nvarchar(2))
	  ,[l_mento4] = Cast(kaikkivuodet.l_mento4 as nvarchar(2))
	  ,[l_tyonoh1] = Cast(kaikkivuodet.l_tyonoh1 as nvarchar(2))
	  ,[l_tyonoh2] = Cast(kaikkivuodet.l_tyonoh2 as nvarchar(2))
	  ,[l_tyonoh3] = Cast(kaikkivuodet.l_tyonoh3 as nvarchar(2))
	  ,[l_tunnit] = Cast(kaikkivuodet.l_tunnit as nvarchar(2))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (

  SELECT [tilv]
      ,[l_okieli]
      ,[l_virka]
      ,[l_taydjo] = null
      ,[l_taydeit] = null
      ,[l_eitayd] = case l_tayd when 1 then 0 when 0 then 1 else -1 end
      ,[l_tutktyo] 
      ,[l_tutkoma] 
      ,[l_pattyo] 
      ,[l_patoma] 
      ,[l_henktyo] 
      ,[l_henkoma] 
      ,[l_muutyo] 
      ,[l_muuoma] 
      ,[l_kanstyo] 
      ,[l_kansoma] 
      ,[l_kehsuu]
      ,[l_sp]
      ,[l_maakunta] = case l_maakunta when '99' then '-1' else l_maakunta end
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
	  ,l_mento1
	  ,l_mento2
	  ,l_mento3
	  ,l_mento4
	  ,l_tyonoh1
	  ,l_tyonoh2
	  ,l_tyonoh3
	  ,l_tunnit
      ,[tietolahde]='7_6_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_6_sopv_19]

  UNION ALL

  SELECT [tilv]
      ,[l_okieli]
      ,[l_virka]
      ,[l_taydjo] = null
      ,[l_taydeit] = null
      ,[l_eitayd] = case l_tayd when 1 then 0 when 0 then 1 else -1 end
      ,[l_tutktyo]
      ,[l_tutkoma]
      ,[l_pattyo]
      ,[l_patoma]
      ,[l_henktyo]
      ,[l_henkoma]
      ,[l_muutyo]
      ,[l_muuoma]
      ,[l_kanstyo]
      ,[l_kansoma]
      ,[l_kehsuu]
      ,[l_sp]
      ,[l_maakunta] = case l_maakunta when '99' then '-1' else l_maakunta end
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
	  ,l_mento1
	  ,l_mento2
	  ,l_mento3
	  ,l_mento4
	  ,l_tyonoh1
	  ,l_tyonoh2
	  ,l_tyonoh3
	  ,l_tunnit = null
      ,[tietolahde]='7_6_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_6_sopv_16]

  UNION ALL
  
  SELECT [tilv]
      ,[l_okieli]
      ,[l_virka]
      ,[l_taydjo]
      ,[l_taydeit]
      ,[l_eitayd]
      ,[l_tutktyo]
      ,[l_tutkoma]
      ,[l_pattyo]
      ,[l_patoma]
      ,[l_henktyo]
      ,[l_henkoma]
      ,[l_muutyo]
      ,[l_muuoma]
      ,[l_kanstyo]
      ,[l_kansoma]
      ,[l_kehsuu]
      ,[l_sp]
      ,[l_maakunta] = case l_maakunta when '99' then '-1' else l_maakunta end
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
	  ,l_mento1 = null
	  ,l_mento2 = null
	  ,l_mento3 = null
	  ,l_mento4 = null
	  ,l_tyonoh1 = null
	  ,l_tyonoh2 = null
	  ,l_tyonoh3 = null
	  ,l_tunnit = null
      ,[tietolahde]='7_6_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_6_sopv_13]

  UNION ALL

  SELECT [tilv]
      ,[l_okieli]
      ,[l_virka] = case l_virka 
					when '3' then '4'
					when '4' then '5'
					else l_virka
				   end
      ,[l_taydjo]
      ,[l_taydeit]
      ,[l_eitayd]
      ,[l_tutktyo]
      ,[l_tutkoma]
      ,[l_pattyo]
      ,[l_patoma]
      ,[l_henktyo]
      ,[l_henkoma]
      ,[l_muutyo]
      ,[l_muuoma]
      ,[l_kanstyo]
      ,[l_kansoma]
      ,[l_kehsuu]
      ,[l_sp]
      ,[l_maakunta] = case l_maakunta when '99' then '-1' when '20' then '01' else l_maakunta end
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
	  ,l_mento1 = null
	  ,l_mento2 = null
	  ,l_mento3 = null
	  ,l_mento4 = null
	  ,l_tyonoh1 = null
	  ,l_tyonoh2 = null
	  ,l_tyonoh3 = null
	  ,l_tunnit = null
      ,[tietolahde]='7_6_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_6_sopv_12]


) kaikkivuodet



















GO


USE [ANTERO]