USE [VipunenTK_SA]
GO
/****** Object:  View [dbo].[v_sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]    Script Date: 4.4.2019 18:09:46 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]
GO
/****** Object:  View [dbo].[v_sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]    Script Date: 4.4.2019 18:09:46 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]
GO
/****** Object:  View [dbo].[v_sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]    Script Date: 4.4.2019 18:09:46 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]
GO
/****** Object:  View [dbo].[v_sa_3_2_Oppisopimuskoulutus_jatko_opinnot]    Script Date: 4.4.2019 18:09:46 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_3_2_Oppisopimuskoulutus_jatko_opinnot]
GO
/****** Object:  View [dbo].[v_sa_3_1b_Oppisopimuskoulutus]    Script Date: 4.4.2019 18:09:46 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_3_1b_Oppisopimuskoulutus]
GO
/****** Object:  View [dbo].[v_sa_3_1a_Oppisopimuskoulutus]    Script Date: 4.4.2019 18:09:46 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_3_1a_Oppisopimuskoulutus]
GO
/****** Object:  View [dbo].[v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat]    Script Date: 4.4.2019 18:09:46 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat]
GO
/****** Object:  View [dbo].[v_sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]    Script Date: 4.4.2019 18:09:46 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]
GO
/****** Object:  View [dbo].[v_sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]    Script Date: 4.4.2019 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]'))
EXEC dbo.sp_executesql @statement = N'









CREATE VIEW [dbo].[v_sa_3_14_Lukio_ja_amm_opisk_mediaani_iat] AS

-- truncate table vipunentk_dw..sa_3_14_Lukio_ja_amm_opisk_mediaani_iat
-- insert into vipunentk_dw..sa_3_14_Lukio_ja_amm_opisk_mediaani_iat select * from v_sa_3_14_Lukio_ja_amm_opisk_mediaani_iat

SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+''0101'' as date)
	,lahde = cast(kaikkivuodet.lahde as nvarchar(2))
	,tunn = CASE WHEN lahde = 34 and tunn = '''' THEN cast(coalesce(nullif(kaikkivuodet.opjarj, ''''), ''-1'')  as nvarchar(10))
			ELSE cast(coalesce(nullif(kaikkivuodet.tunn , ''''), ''-1'') as nvarchar(5))
			END   -- Ohjataan oppisopimuskoulutuksen lähteellä opjarj-muuttujan avain tyhjien arvojen tilalle - Lasse 26.5.2014	
	--,tunn = cast(kaikkivuodet.tunn as nvarchar(5))
	,jarj = cast(kaikkivuodet.jarj as nvarchar(10))
	,opjarj = cast(kaikkivuodet.opjarj as nvarchar(10))
	,koulk = cast(kaikkivuodet.koulk as nvarchar(6))
	,sp = cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
	,syntv = cast(kaikkivuodet.syntv as nvarchar(4))
	,synkk = cast(kaikkivuodet.synkk as nvarchar(2))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))
	,allk = cast(kaikkivuodet.allk as nvarchar(1))
	,lkm = cast(kaikkivuodet.lkm as int)
	,aikoul = cast(kaikkivuodet.aikoul as nvarchar(1))
	,tutklaja = cast(kaikkivuodet.tutklaja as nvarchar(1))
	,tutktav = cast(kaikkivuodet.tutktav as nvarchar(1))
	,ophal = coalesce(nullif(cast(kaikkivuodet.ophal as nvarchar(1)),''''), 1)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (
/*
--Historia-aineisto
SELECT
	 tilv
	,lahde = 
		case
			when lahde = ''1'' then ''21''
			when lahde = ''2'' and oppis = ''2'' then ''35''
			when lahde = ''2'' and oppis = ''1'' then ''34''
			else ''-1''
		end 
	,tunn
	,jarj = null
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv = null
	,synkk = null
	,alvv
	,allk
	,lkm
	,aikoul
	,tutklaja
	,tutktav
	,ophal
	,[tietolahde]=''8_2_Historia_opiskelijat''
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_8_2_sopv_16]
where tilv<2010 and lahde in (1,2)

UNION ALL
*/
SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,lkm
	,aikoul
	,tutklaja
	,tutktav
	,ophal
	,[tietolahde]=''3_14_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_14_sopv_12]
UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,lkm
	,aikoul
	,tutklaja
	,tutktav
	,ophal
	,[tietolahde]=''3_14_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_14_sopv_13]
UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,lkm
	,aikoul
	,tutklaja
	,tutktav
	,ophal
	,[tietolahde]=''3_14_2012_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_14_2012_sopv_14]
UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,lkm
	,aikoul
	,tutklaja
	,tutktav
	,ophal
	,[tietolahde]=''3_14_2013_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_14_2013_sopv_14]

UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,lkm
	,aikoul
	,tutklaja
	,tutktav
	,ophal
	,[tietolahde]=''3_14_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_14_sopv_15]

UNION ALL

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,lkm
	,aikoul
	,tutklaja
	,tutktav
	,ophal
	,[tietolahde]=''3_14_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_14_sopv_16]

UNION ALL

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,lkm
	,aikoul
	,tutklaja
	,tutktav
	,ophal
	,[tietolahde]=''3_14_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_14_sopv_17]

UNION ALL

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,lkm
	,aikoul
	,tutklaja
	,tutktav
	,ophal
	,[tietolahde]=''3_14_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_14_sopv_18]

UNION ALL

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,lkm
	,aikoul
	,tutklaja
	,tutktav
	,ophal
	,[tietolahde]=''3_14_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_14_sopv_19]

) as kaikkivuodet




' 
GO
/****** Object:  View [dbo].[v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat]    Script Date: 4.4.2019 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat]'))
EXEC dbo.sp_executesql @statement = N'








CREATE VIEW [dbo].[v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat] AS

-- truncate table vipunentk_dw..sa_3_15_Lukio_ja_amm_tutk_mediaani_iat
-- insert into vipunentk_dw..sa_3_15_Lukio_ja_amm_tutk_mediaani_iat select * from v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat


SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+''0101'' as date)
	,lahde = cast(kaikkivuodet.lahde as nvarchar(2))
	,tunn = CASE WHEN lahde = 34 and tunn = '''' THEN cast(coalesce(nullif(kaikkivuodet.opjarj, ''''), ''-1'')  as nvarchar(10))
			ELSE cast(coalesce(nullif(kaikkivuodet.tunn , ''''), ''-1'') as nvarchar(5))
			END   -- Ohjataan oppisopimuskoulutuksen lähteellä opjarj-muuttujan avain tyhjien arvojen tilalle - Lasse 26.5.2014

--	,tunn = cast(kaikkivuodet.tunn as nvarchar(5))
	,jarj = cast(kaikkivuodet.jarj as nvarchar(10))
	,opjarj = cast(kaikkivuodet.opjarj as nvarchar(10))
	,koulk = cast(kaikkivuodet.koulk as nvarchar(6))
	,sp = cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
	,syntv = cast(kaikkivuodet.syntv as nvarchar(4))
	,synkk = cast(kaikkivuodet.synkk as nvarchar(2))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))
	,allk = cast(kaikkivuodet.allk as nvarchar(1))
	,suorv = cast(kaikkivuodet.suorv as nvarchar(4))
	,suorkk = cast(kaikkivuodet.suorkk as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tutk = cast(kaikkivuodet.tutk as int)
	,tutklaja = cast(kaikkivuodet.tutklaja as nvarchar(1))
	,tutktav = cast(kaikkivuodet.tutktav as nvarchar(1))
	,ophal = 
		CASE
			WHEN lahde = 22 THEN ''1''
			WHEN lahde = 23 THEN ''1''    -- 13.5.2015 LR, Kansainväliset ylioppilastutkinnot ja gymnasieexamen, ohjattu opetushallinnon alaiseksi koulutukseksi
			ELSE cast(kaikkivuodet.ophal as nvarchar(1))
		END
	,aikoul = cast(kaikkivuodet.aikoul as nvarchar(1))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

	SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]=''3_15_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_12]
UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]=''3_15_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_13]
UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]=''3_15_2012_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_2012_sopv_14]

UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]=''3_15_2013_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_2013_sopv_14]

UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]=''3_15_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_15]

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]=''3_15_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_16]

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]=''3_15_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_17]

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]=''3_15_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_18]

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]=''3_15_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_15_sopv_19]

) as kaikkivuodet




' 
GO
/****** Object:  View [dbo].[v_sa_3_1a_Oppisopimuskoulutus]    Script Date: 4.4.2019 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_3_1a_Oppisopimuskoulutus]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_sa_3_1a_Oppisopimuskoulutus] AS

SELECT tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+''0101'' as date)
	,oppisryh = cast(kaikkivuodet.oppisryh as nvarchar(8))
	,sp =  cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
	,ikar2 = cast(kaikkivuodet.ikar2 as nvarchar(2))
	,opmala = cast(kaikkivuodet.opmala as nvarchar(1))
	,opmast = cast(kaikkivuodet.opmast as nvarchar(2))
	,iscfibroad2013=cast(kaikkivuodet.iscfibroad2013 as nvarchar(2))
    ,kaste_t2=cast(kaikkivuodet.kaste_t2 as nvarchar(2))
	,tutklaja = cast(kaikkivuodet.tutklaja as nvarchar(1))
	,kmaak = cast(kaikkivuodet.kmaak as nvarchar(2))
	,ptoim1r3 = cast(kaikkivuodet.ptoim1r3 as nvarchar(2))
	,amas = cast(kaikkivuodet.amas as nvarchar(1))
	,tyansek= cast(kaikkivuodet.tyansek as nvarchar(1))
	,tol2002 = cast(kaikkivuodet.tol2002 as nvarchar(1))
	,tol2008 = cast(kaikkivuodet.tol2008 as nvarchar(1))
	,koko = cast(kaikkivuodet.koko as nvarchar(1))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)

  FROM (
	SELECT
	[tilv]
      ,oppisryh
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002] = ''-1''
	  ,[tol2008] = ''-1''
      ,[koko]
      ,[lkm]

	,[tietolahde]=''3_1a_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_11_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002] = ''-1''
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]=''3_1a_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_12_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= ''-1''
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]=''3_1a_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_13_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= ''-1''
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]=''3_1a_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_14_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= ''-1''
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]=''3_1a_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_15_H]


union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= ''-1''
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]=''3_1a_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_16_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast] 
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= ''-1''
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]=''3_1a_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_17_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= ''-1''
	  ,[tol2008]
      ,[koko]
      ,[lkm] 

	,[tietolahde]=''3_1a_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_18]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
      ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[ptoim1r3]
      ,[amas]
      ,[tyansek]
      ,[tol2002]= ''-1''
	  ,[tol2008]
      ,[koko]
      ,[lkm] 
	  ,[tietolahde]=''3_1a_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1a_sopv_19]

) as kaikkivuodet








' 
GO
/****** Object:  View [dbo].[v_sa_3_1b_Oppisopimuskoulutus]    Script Date: 4.4.2019 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_3_1b_Oppisopimuskoulutus]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[v_sa_3_1b_Oppisopimuskoulutus] AS

SELECT tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+''0101'' as date)
	,oppisryh = cast(kaikkivuodet.oppisryh as nvarchar(8))
	,sp =  cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
	,ikar2 = cast(kaikkivuodet.ikar2 as nvarchar(2))
	,opmala = cast(kaikkivuodet.opmala as nvarchar(1))
	,opmast = cast(kaikkivuodet.opmast as nvarchar(2))
	,iscfibroad2013=cast(kaikkivuodet.iscfibroad2013 as nvarchar(2))
    ,kaste_t2=cast(kaikkivuodet.kaste_t2 as nvarchar(2))
	,tutklaja = cast(kaikkivuodet.tutklaja as nvarchar(1))
	,kmaak = cast(kaikkivuodet.kmaak as nvarchar(2))
	,kesto = cast(kaikkivuodet.kesto as nvarchar(2))
	,kestotot = cast(kaikkivuodet.kestotot as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)

  FROM (
	SELECT
	[tilv]
      ,oppisryh
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      ,[tietolahde]=''3_1b_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_11_H]
union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]=''3_1b_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_12_H]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]=''3_1b_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_13_H]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]=''3_1b_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_14_H]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]=''3_1b_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_15_H]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      	,[tietolahde]=''3_1b_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_16_H]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[opmast]
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      ,[tietolahde]=''3_1b_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_17_H]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      ,[tietolahde]=''3_1b_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_18]

union all

SELECT
	   [tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala] = NULL
      ,[opmast] = NULL
	  ,[iscfibroad2013]
	  ,[kaste_t2]
      ,[tutklaja]
      ,[kmaak]
      ,[kesto]
      ,[kestotot]
      ,[lkm]
      ,[tietolahde]=''3_1b_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_1b_sopv_19]


) as kaikkivuodet



' 
GO
/****** Object:  View [dbo].[v_sa_3_2_Oppisopimuskoulutus_jatko_opinnot]    Script Date: 4.4.2019 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_3_2_Oppisopimuskoulutus_jatko_opinnot]'))
EXEC dbo.sp_executesql @statement = N'









/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_3_2_Oppisopimuskoulutus_jatko_opinnot] AS

SELECT tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+''0101'' as date)
	,oppisryh = cast(kaikkivuodet.oppisryh as nvarchar(8))
	,sp =  cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
	,ikar2 = cast(kaikkivuodet.ikar2 as nvarchar(2))
	,opmala = cast(kaikkivuodet.opmala as nvarchar(1))
	,iscfibroad2013=cast(kaikkivuodet.iscfibroad2013 as nvarchar(2))
	,tutklaja = cast(kaikkivuodet.tutklaja as nvarchar(1))
	,kmaak = cast(kaikkivuodet.kmaak as nvarchar(2))
	,jopmast = cast(kaikkivuodet.jopmast as nvarchar(2))
	,jkaste_t2=cast(kaikkivuodet.jkaste_t2 as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
	,opmast = cast(kaikkivuodet.opmast as nvarchar(2))
	,jopmala = cast(kaikkivuodet.jopmala as nvarchar(1))
	,kaste_t2=cast(kaikkivuodet.kaste_t2 as nvarchar(2))
	,jiscfibroad2013=cast(kaikkivuodet.jiscfibroad as nvarchar(2))

  FROM (
	SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]=''3_2_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_11_H]

union all

	SELECT
	   [tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]=''3_2_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_12_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	   ,[tietolahde]=''3_2_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_13_H]

union all

SELECT
	[tilv]
      ,[oppisryh] 
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]=''3_2_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_14_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
	  ,[opmala]
      ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]=''3_2_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_15_H]
union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
      ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]=''3_2_sopv_16''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_16_H]
union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala]
	  ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast]
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]=''3_2_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] 
	  ,[jopmala]
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_17_H]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast] = NULL
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]=''3_2_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] = NULL
	  ,[jopmala] = NULL
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_18]

union all

SELECT
	[tilv]
      ,[oppisryh]
      ,[sp]
      ,[aikielir1]
      ,[ikar2]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[tutklaja]
      ,[kmaak]
      ,[jopmast] = NULL
	  ,[jkaste_t2]
      ,[lkm]
	  ,[tietolahde]=''3_2_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
	  ,[opmast] = NULL
	  ,[jopmala] = NULL
	  ,[kaste_t2]
      ,[jiscfibroad]
FROM [TK_H9098_CSC].[dbo].[TK_3_2_sopv_19]


) as kaikkivuodet


' 
GO
/****** Object:  View [dbo].[v_sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]    Script Date: 4.4.2019 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]'))
EXEC dbo.sp_executesql @statement = N'







CREATE VIEW [dbo].[v_sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat] AS

-- truncate table vipunentk_dw..sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat
-- insert into vipunentk_dw..sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat select * from v_sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat


SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+''0101'' as date)
	,lahde = cast(kaikkivuodet.lahde as nvarchar(2))
	,tunn = cast(kaikkivuodet.tunn as nvarchar(5))
	,jarj = cast(kaikkivuodet.jarj as nvarchar(10))
	,koulk = cast(kaikkivuodet.koulk as nvarchar(6))
	,koultyp = cast(kaikkivuodet.koultyp as nvarchar(1))
	,sp = cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
	,syntv = cast(kaikkivuodet.syntv as nvarchar(4))
	,synkk = cast(kaikkivuodet.synkk as nvarchar(2))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))
	,allk = cast(kaikkivuodet.allk as nvarchar(1))
	,alvv_kk = cast(kaikkivuodet.alvv_kk as nvarchar(4))
	,allk_kk = cast(kaikkivuodet.allk_kk as nvarchar(1))
	,suorv = cast(kaikkivuodet.suorv as nvarchar(4))
	,suorkk = cast(kaikkivuodet.suorkk as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

	SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]=''3_4_sopv_11''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_11]
UNION ALL 	SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]=''3_4_sopv_12''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_12]
UNION ALL 	SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]=''3_4_sopv_13''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)

FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_13]

UNION ALL 	SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]=''3_4_sopv_14''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_14]

UNION ALL 	SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]=''3_4_sopv_15''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_15]


UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]=''3_4_sopv_16''
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_16]

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]=''3_4_sopv_17''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_17]

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]=''3_4_sopv_18''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_18]

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]=''3_4_sopv_19''
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_4_sopv_19]

) as kaikkivuodet








' 
GO
/****** Object:  View [dbo].[v_sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]    Script Date: 4.4.2019 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]'))
EXEC dbo.sp_executesql @statement = N'









CREATE VIEW [dbo].[v_sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat] AS
SELECT [tilv] = CAST(tilv as nvarchar(4))
      ,[lahde] = CAST(COALESCE(NULLIF(lahde , ''''), ''-1'') as nvarchar(2))
      ,[kmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = kmaak), ''''), NULLIF(kmaak , ''''), ''-1'') as nvarchar(2))
      ,[jarj] = CAST(COALESCE(NULLIF(jarj, ''''), ''-1'') as nvarchar(10))
      ,[koulk] = CAST(COALESCE(NULLIF(koulk, ''''), ''-1'') as nvarchar(6))
      ,[ophal] = CAST(COALESCE(NULLIF(ophal, ''''), ''-1'') as nvarchar(2))
      ,[tutkmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = tutkmaak), ''''), NULLIF(tutkmaak , ''''), ''-1'') as nvarchar(2))
      ,[tutkjarj] = CAST(COALESCE(NULLIF(tutkjarj, ''''), ''-1'') as nvarchar(10))
      ,[tutkkoulk] = CAST(COALESCE(NULLIF(tutkkoulk, ''''), ''-1'') as nvarchar(6))
      ,[seurvkmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = seurvkmaak), ''''), NULLIF(seurvkmaak , ''''), ''-1'') as nvarchar(3))
      ,[seurvjarj] = CAST(COALESCE(NULLIF(seurvjarj, ''''), ''-1'') as nvarchar(10))
      ,[seurvkoulk] = CAST(COALESCE(NULLIF(seurvkoulk, ''''), ''-1'') as nvarchar(6))
      ,[lkm] = CAST(lkm as int)
	  ,tietolahde
FROM
(SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_7_sopv_11''
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_11]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_7_sopv_12''
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_12]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_7_sopv_13''
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_13]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_7_sopv_14''
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_14]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_7_sopv_15''
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_15]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_7_sopv_16''
  FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_16]
 UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_7_sopv_17''
FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_17]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_7_sopv_18''
FROM [TK_H9098_CSC].[dbo].[TK_3_7_sopv_18]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[kmaak]
      ,[jarj]
      ,[koulk]
      ,[ophal]
      ,[tutkmaak]
      ,[tutkjarj]
      ,[tutkkoulk]
      ,[seurvkmaak]
      ,[seurvjarj]
      ,[seurvkoulk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_7_sopv_19''
FROM [TK_H9098_CSC].[dbo].[TK_K3_7_sopv_19]  
  
) kaikkivuodet




' 
GO
/****** Object:  View [dbo].[v_sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]    Script Date: 4.4.2019 18:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]'))
EXEC dbo.sp_executesql @statement = N'













CREATE VIEW [dbo].[v_sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat] AS
SELECT [tilv] = CAST(tilv as nvarchar(4))
      ,[lahde] = CAST(COALESCE(NULLIF(lahde , ''''), ''-1'') as nvarchar(2))
      ,[alvv] = CAST(COALESCE(NULLIF(alvv , ''''), ''-1'') as int)
      ,[jarj] = CAST(COALESCE(NULLIF(jarj, ''''), ''-1'') as nvarchar(10))
      ,[opmala] = CAST(COALESCE(NULLIF(opmala, ''''), ''-1'') as nvarchar(2))
	  ,[iscfibroad2013] = CAST(COALESCE(NULLIF(iscfibroad2013, ''''), ''-1'') as nvarchar(2))
      ,[kmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = kmaak), ''''), NULLIF(kmaak , ''''), ''-1'') as nvarchar(2))
      ,[suorv] = CAST(COALESCE(NULLIF(suorv , ''''), ''-1'') as int)
      ,[suoropmala] = CAST(COALESCE(NULLIF(suoropmala, ''''), ''-1'') as nvarchar(2))
	  ,[suoriscfibroad2013] = CAST(COALESCE(NULLIF(suoriscfibroad2013, ''''), ''-1'') as nvarchar(2))
      ,[suortutk] = CAST(COALESCE(NULLIF(suortutk, ''''), ''-1'') as nvarchar(2))
      ,[lkm] = CAST(lkm as int)
	  ,tietolahde
FROM
(SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_8_2011_sopv_13''
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_2011_sopv_13_H]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_8_2012_sopv_13''
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_2012_sopv_13_H]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
	  ,[iscfibroad2013] = NULL
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013] = NULL
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_8_sopv_12''
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_12]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_8_sopv_15''
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_15_H]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_8_sopv_16''
  FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_16_H]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_8_sopv_17''
FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_17_H]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala] = NULL
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_8_sopv_18''
FROM [TK_H9098_CSC].[dbo].[TK_3_8_sopv_18]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      ,[suoropmala] = NULL
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
      ,[luontipvm]
	  ,tietolahde = ''3_8_sopv_19''
FROM [TK_H9098_CSC].[dbo].[TK_K3_8_sopv_19]  
  
) kaikkivuodet











' 
GO
USE [ANTERO]