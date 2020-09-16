USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 14.2.2020 15:30:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





















ALTER VIEW [dbo].[v_sa_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Select * into [VipunenTK_DW].[dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen] FROM [VipunenTK_SA].[dbo].[v_sa_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Truncate table [VipunenTK_DW].[dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Insert into [VipunenTK_DW].[dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Select *  FROM [VipunenTK_SA].[dbo].[v_sa_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
      ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
	  ,[a_okieli] = Cast(kaikkivuodet.a_okieli as nvarchar(2))
      ,[a_virka] = Cast(kaikkivuodet.a_virka as nvarchar(2))
      ,[a_aste] = Cast(kaikkivuodet.a_aste as nvarchar(2))
      ,[a_ala108] = Cast(kaikkivuodet.a_ala108 as nvarchar(2))
      ,[a_taydjo] = Cast(kaikkivuodet.a_taydjo as nvarchar(2))
      ,[a_taydeit] = Cast(kaikkivuodet.a_taydeit as nvarchar(2))
      ,[a_eitayd] = Cast(kaikkivuodet.a_eitayd as nvarchar(2))
      ,[a_tutktyo] = Cast(kaikkivuodet.a_tutktyo as nvarchar(3))
      ,[a_tutkoma] = Cast(kaikkivuodet.a_tutkoma as nvarchar(3))
      ,[a_pattyo] = Cast(kaikkivuodet.a_pattyo as nvarchar(3))
      ,[a_patoma] = Cast(kaikkivuodet.a_patoma as nvarchar(3))
      ,[a_henktyo] = Cast(kaikkivuodet.a_henktyo as nvarchar(3))
      ,[a_henkoma] = Cast(kaikkivuodet.a_henkoma as nvarchar(3))
      ,[a_muutyo] = Cast(kaikkivuodet.a_muutyo as nvarchar(3))
      ,[a_muuoma] = Cast(kaikkivuodet.a_muuoma as nvarchar(3))
      ,[a_kanstyo] = Cast(kaikkivuodet.a_kanstyo as nvarchar(3))
      ,[a_kansoma] = Cast(kaikkivuodet.a_kansoma as nvarchar(3))
      ,[a_kehsuu] = Cast(kaikkivuodet.a_kehsuu as nvarchar(2))
      ,[tyojakp] = Cast(kaikkivuodet.tyojakp as nvarchar(3))
      ,[eityojak] = Cast(kaikkivuodet.eityojak as nvarchar(2))
      ,[tyojakeit] = Cast(kaikkivuodet.tyojakeit as nvarchar(2))
      ,[a_sp] = Cast(kaikkivuodet.a_sp as nvarchar(2))
      ,[a_maakunta] = Cast(kaikkivuodet.a_maakunta as nvarchar(2))
	  ,[a_ika] = Cast(kaikkivuodet.a_ika as nvarchar(10))
	  ,[a_mento1] = Cast(kaikkivuodet.a_mento1 as nvarchar(2))
	  ,[a_mento2] = Cast(kaikkivuodet.a_mento2 as nvarchar(2))
	  ,[a_mento3] = Cast(kaikkivuodet.a_mento3 as nvarchar(2))
	  ,[a_mento4] = Cast(kaikkivuodet.a_mento4 as nvarchar(2))
	  ,[a_tyonoh1] = Cast(kaikkivuodet.a_tyonoh1 as nvarchar(2))
	  ,[a_tyonoh2] = Cast(kaikkivuodet.a_tyonoh2 as nvarchar(2))
	  ,[a_tyonoh3] = Cast(kaikkivuodet.a_tyonoh3 as nvarchar(2))
	  ,a_tyojak = Cast(kaikkivuodet.a_tyojak as nvarchar(2))
	  ,a_tyojak1 = Cast(kaikkivuodet.a_tyojak1 as nvarchar(2))
	  ,a_tyojak2 = Cast(kaikkivuodet.a_tyojak2 as nvarchar(2))
	  ,a_tyojak3 = Cast(kaikkivuodet.a_tyojak3 as nvarchar(2))
	  ,a_tyojak4 = Cast(kaikkivuodet.a_tyojak4 as nvarchar(2))
	  ,a_tyopk = Cast(kaikkivuodet.a_tyopk as nvarchar(2))
	  ,a_tyopk1 = Cast(kaikkivuodet.a_tyopk1 as nvarchar(2))
	  ,a_tyopk2 = Cast(kaikkivuodet.a_tyopk2 as nvarchar(2))
	  ,a_tyopk3 = Cast(kaikkivuodet.a_tyopk3 as nvarchar(2))
	  ,a_tyopk4 = Cast(kaikkivuodet.a_tyopk4 as nvarchar(2))	  
	  ,a_tunnit = Cast(kaikkivuodet.a_tunnit as nvarchar(2))
	  ,a_tunnit_amm1 = Cast(kaikkivuodet.a_tunnit_amm1 as nvarchar(2))
	  ,a_tunnit_amm2 = Cast(kaikkivuodet.a_tunnit_amm2 as nvarchar(2))
	  ,a_tunnit_amm3 = Cast(kaikkivuodet.a_tunnit_amm3 as nvarchar(2))
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (

    SELECT [tilv]
      ,[a_okieli]
      ,[a_virka] = case a_virka when '4' then '7' when '5' then '4' when '6' then '5' when '7' then '6' else a_virka end --kuvaus korjattu
      ,[a_aste]
      ,[a_ala108] = case when a_ala1 is null or a_ala1 = '11' then '99' else right('0'+rtrim(a_ala1), 2) end --iscfibroad
      ,[a_taydjo] = null
      ,[a_taydeit] = null
      ,[a_eitayd] = case a_tayd when 1 then 0 when 0 then 1 else -1 end
      ,[a_tutktyo]
      ,[a_tutkoma]
      ,[a_pattyo]
      ,[a_patoma]
      ,[a_henktyo]
      ,[a_henkoma]
      ,[a_muutyo]
      ,[a_muuoma]
      ,[a_kanstyo]
      ,[a_kansoma]
      ,[a_kehsuu]
      ,[tyojakp] = a_tyojakp
      ,[eityojak] = null
      ,[tyojakeit] = null
      ,[a_sp]
      ,[a_maakunta] = case a_maakunta when '99' then '-1' else a_maakunta end
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
	  ,a_mento1
	  ,a_mento2
	  ,a_mento3
	  ,a_mento4
	  ,a_tyonoh1
	  ,a_tyonoh2
	  ,a_tyonoh3
	  ,a_tyojak
	  ,a_tyojak1 = coalesce(a_tyojak1,0)
	  ,a_tyojak2 = coalesce(a_tyojak2,0)
	  ,a_tyojak3 = coalesce(a_tyojak3,0)
	  ,a_tyojak4 = coalesce(a_tyojak4,0)
	  ,a_tyopk
	  ,a_tyopk1 = coalesce(a_tyopk1,0)
	  ,a_tyopk2 = coalesce(a_tyopk2,0)
	  ,a_tyopk3 = coalesce(a_tyopk3,0)
	  ,a_tyopk4 = coalesce(a_tyopk4,0)
	  ,a_tunnit
	  ,a_tunnit_amm1
	  ,a_tunnit_amm2
	  ,a_tunnit_amm3
	  ,[tietolahde]='7_8_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_8_sopv_19]

  UNION ALL

  SELECT [tilv]
      ,[a_okieli]
      ,[a_virka] = case a_virka when '7' then '8' when '8' then '9' when '9' then '0' else a_virka end --väliaikainen
      ,[a_aste] = case a_aste when '13' then '14' when '14' then '13' else a_aste end --väliaikainen
      ,[a_ala108] = a_ala1
      ,[a_taydjo] = null
      ,[a_taydeit] = null
      ,[a_eitayd] = case a_tayd when 1 then 0 when 0 then 1 else -1 end
      ,[a_tutktyo]
      ,[a_tutkoma]
      ,[a_pattyo]
      ,[a_patoma]
      ,[a_henktyo]
      ,[a_henkoma]
      ,[a_muutyo]
      ,[a_muuoma]
      ,[a_kanstyo]
      ,[a_kansoma]
      ,[a_kehsuu]
      ,[tyojakp] = a_tyojakp
      ,[eityojak] = null
      ,[tyojakeit] = null
      ,[a_sp]
      ,[a_maakunta] = case a_maakunta when '99' then '-1' else a_maakunta end
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
	  ,a_mento1
	  ,a_mento2
	  ,a_mento3
	  ,a_mento4
	  ,a_tyonoh1
	  ,a_tyonoh2
	  ,a_tyonoh3
	  ,a_tyojak
	  ,a_tyojak1
	  ,a_tyojak2
	  ,a_tyojak3
	  ,a_tyojak4
	  ,a_tyopk
	  ,a_tyopk1
	  ,a_tyopk2
	  ,a_tyopk3
	  ,a_tyopk4
	  ,a_tunnit = null
	  ,a_tunnit_amm1 = null
	  ,a_tunnit_amm2 = null
	  ,a_tunnit_amm3 = null
	  ,[tietolahde]='7_8_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_8_sopv_16]

  UNION ALL
  
  SELECT [tilv]
      ,[a_okieli]
      ,[a_virka]
      ,[a_aste]
      ,[a_ala108]
      ,[a_taydjo]
      ,[a_taydeit]
      ,[a_eitayd]
      ,[a_tutktyo]
      ,[a_tutkoma]
      ,[a_pattyo]
      ,[a_patoma]
      ,[a_henktyo]
      ,[a_henkoma]
      ,[a_muutyo]
      ,[a_muuoma]
      ,[a_kanstyo]
      ,[a_kansoma]
      ,[a_kehsuu]
      ,[tyojakp]
      ,[eityojak]
      ,[tyojakeit]
      ,[a_sp]
      ,[a_maakunta] = case a_maakunta when '99' then '-1' else a_maakunta end
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
	  ,a_mento1 = null
	  ,a_mento2 = null
	  ,a_mento3 = null
	  ,a_mento4 = null
	  ,a_tyonoh1 = null
	  ,a_tyonoh2 = null
	  ,a_tyonoh3 = null
	  ,a_tyojak = null
	  ,a_tyojak1 = null
	  ,a_tyojak2 = null
	  ,a_tyojak3 = null
	  ,a_tyojak4 = null
	  ,a_tyopk = null
	  ,a_tyopk1 = null
	  ,a_tyopk2 = null
	  ,a_tyopk3 = null
	  ,a_tyopk4 = null
	  ,a_tunnit = null
	  ,a_tunnit_amm1 = null
	  ,a_tunnit_amm2 = null
	  ,a_tunnit_amm3 = null
      ,[tietolahde]='7_8_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_8_sopv_13]

  UNION ALL

  SELECT [tilv]
      ,[a_okieli]
      ,[a_virka]
      ,[a_aste]
      ,[a_ala108]
      ,[a_taydjo]
      ,[a_taydeit]
      ,[a_eitayd]
      ,[a_tutktyo]
      ,[a_tutkoma]
      ,[a_pattyo]
      ,[a_patoma]
      ,[a_henktyo]
      ,[a_henkoma]
      ,[a_muutyo]
      ,[a_muuoma]
      ,[a_kanstyo] = NULL
      ,[a_kansoma] = NULL
      ,[a_kehsuu]
      ,[tyojakp]
      ,[eityojak]
      ,[tyojakeit]
      ,[a_sp]
      ,[a_maakunta] = case a_maakunta when '99' then '-1' when '20' then '01' else a_maakunta end
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
	  ,a_mento1 = null
	  ,a_mento2 = null
	  ,a_mento3 = null
	  ,a_mento4 = null
	  ,a_tyonoh1 = null
	  ,a_tyonoh2 = null
	  ,a_tyonoh3 = null
	  ,a_tyojak = null
	  ,a_tyojak1 = null
	  ,a_tyojak2 = null
	  ,a_tyojak3 = null
	  ,a_tyojak4 = null
	  ,a_tyopk = null
	  ,a_tyopk1 = null
	  ,a_tyopk2 = null
	  ,a_tyopk3 = null
	  ,a_tyopk4 = null
	  ,a_tunnit = null
	  ,a_tunnit_amm1 = null
	  ,a_tunnit_amm2 = null
	  ,a_tunnit_amm3 = null
	  ,[tietolahde]='7_8_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_7_8_sopv_12]


) kaikkivuodet





















GO


USE [ANTERO]