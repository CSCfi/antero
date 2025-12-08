USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]    Script Date: 8.12.2025 12.21.21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











-- MR 31.10.2023: sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen, jolloin [tol2008_m1], [tol2008_m2], [amm2001_m1] ja [amm2001_m2] jäivät vain vanhemmille aineistoille.

ALTER   VIEW [dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
Select * into [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan] FROM [TK_H9098_CSC].[dbo].[TK_v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
Truncate table [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
Insert into [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
  Select * FROM [VipunenTK_SA].[dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[sp] = CAST(kaikkivuodet.sp as nvarchar(10))
      ,[aikielir1] = CAST(kaikkivuodet.aikielir1 as nvarchar(10))
      ,[ikar1] = CAST(kaikkivuodet.ikar1 as nvarchar(10))
      ,[opmast] = CAST(kaikkivuodet.opmast as nvarchar(10))
	  ,[kaste_t2] = CAST(kaikkivuodet.kaste_t2 as nvarchar(10))
      ,[tutklaja] = CAST(kaikkivuodet.tutklaja as nvarchar(10))
      ,[opmopa] = CAST(kaikkivuodet.opmopa as nvarchar(10))
	  ,[iscfinarrow2013] = CAST(kaikkivuodet.iscfinarrow2013 as nvarchar(10))
      ,[tilvasmaak] = CAST(kaikkivuodet.tilvasmaak as varchar(2))
      ,[tol2008_m1] = CAST(kaikkivuodet.tol2008_m1 as nvarchar(20))
      ,[tol2008_m2] = CAST(kaikkivuodet.tol2008_m2 as nvarchar(20))
	  ,[tol2008_oef] = CAST(kaikkivuodet.tol2008_oef as nvarchar(10))
      ,[amm2001_m1] = CAST(kaikkivuodet.amm2001_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(kaikkivuodet.amm2001_m2 as nvarchar(20))
	  ,[amm2010_oef1] = CAST(kaikkivuodet.amm2010_oef1 as nvarchar(20))
	  ,[amm2010_oef2] = CAST(kaikkivuodet.amm2010_oef2 as nvarchar(20))
      ,[tsekt] = CAST(kaikkivuodet.tsekt as nvarchar(10))
      ,[tmaak] = CAST(kaikkivuodet.tmaak as nvarchar(10))
      ,[sose] = CAST(kaikkivuodet.sose as nvarchar(10))
      ,[lkm] = CAST(kaikkivuodet.lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tilvasmaak]=case tilvasmaak when '20' then '01' else tilvasmaak end
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
	  ,[tol2008_oef]='-1'
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2001_'+Replace([amm2001_m1],',','.') End --'MITENNA2001_'+Replace([amm2001_m1],',','.')
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2001_'+Replace([amm2001_m2],',','.') End --'MITENNA2001_'+Replace([amm2001_m2],',','.')
	  ,[amm2010_oef1]='-1'
	  ,[amm2010_oef2]='-1'
      ,[tsekt]
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_14_sopv_11]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
      ,[tilvasmaak]=case tilvasmaak when '99' then '-1' when '20' then '01' else tilvasmaak end
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
	  ,[tol2008_oef]='-1'
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m1],',','.') end
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m2],',','.') end
	  ,[amm2010_oef1]='-1'
	  ,[amm2010_oef2]='-1'
      ,[tsekt]
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14_2010_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_14_2010_sopv_13]


-- uudella rakenteella
UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_13'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_13_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_14'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_14_O]


UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_15'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_15_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_16'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_16_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_17'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_17_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_18'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_18_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_19'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_19_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_20'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_20_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_21'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_21_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_22'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_22_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_23'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_23]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_24'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_24]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
      ,[tilvasmaak]
      ,[tol2008_m1]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
      ,[tol2008_m2]='-1'  -- sopv 23 aineistossa Mitenna luokitus vaihtui OEF luokitukseen
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_sopv_25'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14a_sopv_25]


) kaikkivuodet








GO


