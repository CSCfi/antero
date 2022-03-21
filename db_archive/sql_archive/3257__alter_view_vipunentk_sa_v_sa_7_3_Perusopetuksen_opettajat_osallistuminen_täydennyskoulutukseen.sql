USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_3_Perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 30.1.2020 16:57:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















ALTER VIEW [dbo].[v_sa_7_3_Perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen]
Select * into [VipunenTK_DW].[dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen] FROM [VipunenTK_SA].[dbo].[v_sa_7_3_Perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Truncate table [VipunenTK_DW].[dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen]
Select * into [VipunenTK_DW].[dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen]
  FROM [VipunenTK_SA].[dbo].[v_sa_7_3_Perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[p_okieli] = Cast(kaikkivuodet.p_okieli as nvarchar(2))
      ,[p_virka] = Cast(kaikkivuodet.p_virka as nvarchar(2))
      ,[p_taydjo] = Cast(kaikkivuodet.p_taydjo as nvarchar(2))
      ,[p_taydeit] = Cast(kaikkivuodet.p_taydeit as nvarchar(2))
      ,[p_eitayd] = Cast(kaikkivuodet.p_eitayd as nvarchar(2))
      ,[p_tutktyo] = Cast(kaikkivuodet.p_tutktyo as nvarchar(4))
      ,[p_tutkoma] = Cast(kaikkivuodet.p_tutkoma as nvarchar(4))
      ,[p_pattyo] = Cast(kaikkivuodet.p_pattyo as nvarchar(4))
      ,[p_patoma] = Cast(kaikkivuodet.p_patoma as nvarchar(4))
      ,[p_henktyo] = Cast(kaikkivuodet.p_henktyo as nvarchar(4))
      ,[p_henkoma] = Cast(kaikkivuodet.p_henkoma as nvarchar(4))
      ,[p_muutyo] = Cast(kaikkivuodet.p_muutyo as nvarchar(4))
      ,[p_muuoma] = Cast(kaikkivuodet.p_muuoma as nvarchar(4))
      ,[p_kanstyo] = Cast(kaikkivuodet.p_kanstyo as nvarchar(4))
      ,[p_kansoma] = Cast(kaikkivuodet.p_kansoma as nvarchar(4))
      ,[p_kehsuu] = Cast(kaikkivuodet.p_kehsuu as nvarchar(2))
      ,[p_sp] = Cast(kaikkivuodet.p_sp as nvarchar(2))
      ,[p_maakunta]  = Cast(kaikkivuodet.p_maakunta as nvarchar(3))
      ,[p_ika] = Cast(kaikkivuodet.p_ika as nvarchar(10))
	  ,[p_mento1] = Cast(kaikkivuodet.p_mento1 as nvarchar(2))
	  ,[p_mento2] = Cast(kaikkivuodet.p_mento2 as nvarchar(2))
	  ,[p_mento3] = Cast(kaikkivuodet.p_mento3 as nvarchar(2))
	  ,[p_mento4] = Cast(kaikkivuodet.p_mento4 as nvarchar(2))
	  ,[p_tyonoh1] = Cast(kaikkivuodet.p_tyonoh1 as nvarchar(2))
	  ,[p_tyonoh2] = Cast(kaikkivuodet.p_tyonoh2 as nvarchar(2))
	  ,[p_tyonoh3] = Cast(kaikkivuodet.p_tyonoh3 as nvarchar(2))
	  ,[p_tunnit] = Cast(kaikkivuodet.p_tunnit as nvarchar(2))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  
  SELECT [tilv]
      ,[p_okieli]
      ,[p_virka] =	case 
						when p_virka in ('5','6') then '4'
						when p_virka in ('7','8','9','10') then cast(cast(p_virka as int)-2 as nvarchar(2))
						when p_virka = '99' then '9'
						else p_virka
					end
      ,[p_taydjo] = null
      ,[p_taydeit] = null
      ,[p_eitayd] = case p_tayd when 1 then 0 when 0 then 1 else -1 end
      ,[p_tutktyo]
      ,[p_tutkoma]
      ,[p_pattyo]
      ,[p_patoma]
      ,[p_henktyo]
      ,[p_henkoma]
      ,[p_muutyo]
      ,[p_muuoma]
      ,[p_kanstyo]
      ,[p_kansoma]
      ,[p_kehsuu]
      ,[p_sp]
      ,[p_maakunta] = case p_maakunta when '99' then '-1' else p_maakunta end
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
	  ,p_mento1
	  ,p_mento2
	  ,p_mento3
	  ,p_mento4
	  ,p_tyonoh1
	  ,p_tyonoh2
	  ,p_tyonoh3
	  ,p_tunnit
      ,[tietolahde]='7_3_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_3_sopv_19]

  UNION ALL

  SELECT [tilv]
      ,[p_okieli]
      ,[p_virka]
      ,[p_taydjo] = null
      ,[p_taydeit] = null
      ,[p_eitayd] = case p_tayd when 1 then 0 when 0 then 1 else -1 end
      ,[p_tutktyo]
      ,[p_tutkoma]
      ,[p_pattyo]
      ,[p_patoma]
      ,[p_henktyo]
      ,[p_henkoma]
      ,[p_muutyo]
      ,[p_muuoma]
      ,[p_kanstyo]
      ,[p_kansoma]
      ,[p_kehsuu]
      ,[p_sp]
      ,[p_maakunta] = case p_maakunta when '99' then '-1' else p_maakunta end
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
	  ,p_mento1
	  ,p_mento2
	  ,p_mento3
	  ,p_mento4
	  ,p_tyonoh1
	  ,p_tyonoh2
	  ,p_tyonoh3
	  ,p_tunnit = null
      ,[tietolahde]='7_3_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_3_sopv_16]

  UNION ALL
  
  SELECT [tilv]
      ,[p_okieli]
      ,[p_virka]
      ,[p_taydjo]
      ,[p_taydeit]
      ,[p_eitayd]
      ,[p_tutktyo]
      ,[p_tutkoma]
      ,[p_pattyo]
      ,[p_patoma]
      ,[p_henktyo]
      ,[p_henkoma]
      ,[p_muutyo]
      ,[p_muuoma]
      ,[p_kanstyo]
      ,[p_kansoma]
      ,[p_kehsuu]
      ,[p_sp]
      ,[p_maakunta] = case p_maakunta when '99' then '-1' else p_maakunta end
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
	  ,p_mento1 = null
	  ,p_mento2 = null
	  ,p_mento3 = null
	  ,p_mento4 = null
	  ,p_tyonoh1 = null
	  ,p_tyonoh2 = null
	  ,p_tyonoh3 = null
	  ,p_tunnit = null
      ,[tietolahde]='7_3_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_3_sopv_13]

  UNION ALL

  SELECT [tilv]
      ,[p_okieli]
      ,[p_virka]
      ,[p_taydjo]
      ,[p_taydeit]
      ,[p_eitayd]
      ,[p_tutktyo]
      ,[p_tutkoma]
      ,[p_pattyo]
      ,[p_patoma]
      ,[p_henktyo]
      ,[p_henkoma]
      ,[p_muutyo]
      ,[p_muuoma]
      ,[p_kanstyo]
      ,[p_kansoma]
      ,[p_kehsuu]
      ,[p_sp]
      ,[p_maakunta] = case p_maakunta when '99' then '-1' when '20' then '01' else p_maakunta end
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
	  ,p_mento1 = null
	  ,p_mento2 = null
	  ,p_mento3 = null
	  ,p_mento4 = null
	  ,p_tyonoh1 = null
	  ,p_tyonoh2 = null
	  ,p_tyonoh3 = null
	  ,p_tunnit = null
      ,[tietolahde]='7_3_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_3_sopv_12]


) kaikkivuodet
















GO


USE [ANTERO]