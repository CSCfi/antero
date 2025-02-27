USE [VipunenTK_SA]
GO
/****** Object:  View [dbo].[v_sa_2_4_Amm_koulutuksen_tutkinnot]    Script Date: 21.2.2018 16:33:08 ******/
DROP VIEW [dbo].[v_sa_2_4_Amm_koulutuksen_tutkinnot]
GO
/****** Object:  View [dbo].[v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 21.2.2018 16:33:08 ******/
DROP VIEW [dbo].[v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]
GO
/****** Object:  View [dbo].[v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 21.2.2018 16:33:08 ******/
DROP VIEW [dbo].[v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]
GO
/****** Object:  View [dbo].[v_sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 21.2.2018 16:33:08 ******/
DROP VIEW [dbo].[v_sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat]
GO
/****** Object:  View [dbo].[v_sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 21.2.2018 16:33:08 ******/
DROP VIEW [dbo].[v_sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]
GO
/****** Object:  View [dbo].[v_sa_2_21_Lukio_ammpk_opisk_tutk]    Script Date: 21.2.2018 16:33:08 ******/
DROP VIEW [dbo].[v_sa_2_21_Lukio_ammpk_opisk_tutk]
GO
/****** Object:  View [dbo].[v_sa_2_21_Lukio_ammpk_opisk_tutk]    Script Date: 21.2.2018 16:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*
select * into vipunentk_dw..sa_2_21_Lukio_ammpk_opisk_tutk from [dbo].[v_sa_2_21_Lukio_ammpk_opisk_tutk]

*/

CREATE VIEW [dbo].[v_sa_2_21_Lukio_ammpk_opisk_tutk] AS

SELECT
	   [tilv]= cast(kaikkivuodet.tilv as nvarchar(4))
	  ,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
      ,[perusjoukko] = cast(kaikkivuodet.perusjoukko as nvarchar(2))
      ,[aikielir1] = cast(kaikkivuodet.aikielir1 as nvarchar(2))
      ,[koulk] = cast(kaikkivuodet.koulk as nvarchar(6))
      ,[kmaak] = cast(kaikkivuodet.kmaak as nvarchar(2))
      ,[lkm] = cast(kaikkivuodet.lkm as int)
   	  ,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(20))
	  ,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_18'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_18]
  UNION ALL
  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_17'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_17]
  UNION ALL
  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_16'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_16]
  UNION ALL
  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_15'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_15]
  UNION ALL
  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak]
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_14'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_14]
   UNION ALL
  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak] = case 
					  when kmaak='20' then '01'
					  when left(kmaak,1)<>0 and len(kmaak)=1 then '0'+kmaak	
					  else kmaak
				 end
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_13'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_13]
  UNION ALL
  SELECT [tilv]
      ,[perusjoukko]
      ,[aikielir1]
      ,[koulk]
      ,[kmaak] = case 
					  when kmaak='20' then '01'
					  when left(kmaak,1)<>0 and len(kmaak)=1 then '0'+kmaak	
					  else kmaak
				 end
      ,[lkm]
	  ,[tietolahde] = 'TK_2_21_sopv_12'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_21_sopv_12]
  
  ) as kaikkivuodet










GO
/****** Object:  View [dbo].[v_sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 21.2.2018 16:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] AS
SELECT
	   [tilv]= cast(kaikkivuodet.tilv as nvarchar(4))
	  ,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	  ,[sp]= CAST(kaikkivuodet.sp as nvarchar (1))
      ,[syntv]= cast(kaikkivuodet.syntv as nvarchar(4))
      ,[aikielir1x]= cast (kaikkivuodet.aikielir1x as nvarchar(2))
      ,[tilvaskun]= cast (kaikkivuodet.tilvaskun as nvarchar(3))
      ,[tilvaskunx]= cast (kaikkivuodet.tilvaskunx as nvarchar(3))
      ,[sose_isa1]= cast (kaikkivuodet.sose_isa1 as nvarchar(1))
      ,[sose_aiti1]= cast (kaikkivuodet.sose_aiti1 as nvarchar(1))
      ,[sose_isa2]= cast (kaikkivuodet.sose_isa2 as nvarchar(2))
      ,[sose_aiti2]= cast (kaikkivuodet.sose_aiti2 as nvarchar(2))
      ,[koulk_isa]= cast (kaikkivuodet.koulk_isa as nvarchar(6))
      ,[koulk_aiti]= cast (kaikkivuodet.koulk_aiti as nvarchar(6))
      ,[tulo_isa]= cast (kaikkivuodet.tulo_isa as nvarchar(2))
      ,[tulo_aiti]= cast (kaikkivuodet.tulo_aiti as nvarchar(2))
      ,[klaji]= cast (kaikkivuodet.klaji as nvarchar(2))
      ,[ophal]= cast (kaikkivuodet.ophal as nvarchar(1))
      ,[koulk]= cast (kaikkivuodet.koulk as nvarchar(6))
      ,[kkieli]= cast (kaikkivuodet.kkieli as nvarchar(2))
      ,[kmaak]= cast (kaikkivuodet.kmaak as nvarchar(2))
      ,[alvv]= cast (kaikkivuodet.alvv as nvarchar(4))
      ,[olosyys]= cast (kaikkivuodet.olosyys as nvarchar(1))
      ,[uusi]= cast(kaikkivuodet.uusi as int)
      ,[opisk]= cast(kaikkivuodet.opisk as int)
      ,[tutk]= cast(kaikkivuodet.tutk as int)
   	  ,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	  ,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
      ,(CASE WHEN [uusi]= ''THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_12]
union all
SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
      ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_13]
union all
SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
       ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_14]
  union all
 SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
       ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_15]

   union all
 SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
       ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_16]

   union all
 SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
       ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_17]

   union all
 SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
       ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_18]
  
) as kaikkivuodet





GO
/****** Object:  View [dbo].[v_sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 21.2.2018 16:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v_sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat] AS


-- truncate table vipunentk_dw..sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat
-- insert into vipunentk_dw..sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat select * from v_sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat


SELECT
	tilv = CAST(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = Cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = cast(coalesce(nullif(kaikkivuodet.lahde , ''), '-1') as nvarchar(2))
	,tunn = cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
	/* vanha
	CASE WHEN lahde = 34 and tunn = '' THEN cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
			ELSE cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
			END   -- Ohjataan oppisopimuskoulutuksen lähteellä opjarj-muuttujan avain tyhjien arvojen tilalle - Lasse 26.5.2014

	*/
	,jarj = cast(coalesce(nullif(kaikkivuodet.jarj, ''), '-1') as nvarchar(10))
	,opjarj = cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
	,koulk = cast(coalesce(nullif(kaikkivuodet.koulk , ''), '-1') as nvarchar(6))
	,kkieli = cast(coalesce(nullif(kaikkivuodet.kkieli , ''), '-1') as nvarchar(2))
	,kkun = cast(coalesce(nullif(kaikkivuodet.kkun , ''), '-1') as nvarchar(3))
	,ophal = cast(coalesce(nullif(kaikkivuodet.ophal , ''), '-1') as nvarchar(2))
	,sp = cast(coalesce(nullif(kaikkivuodet.sp , ''), '-1') as nvarchar(2))
	,aikielir1 = cast(coalesce(nullif(kaikkivuodet.aikielir1 , ''), '-1') as nvarchar(2))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))
	,allk = cast(kaikkivuodet.allk as nvarchar(1))
	,olotamm = cast(kaikkivuodet.olotamm as nvarchar(1))
	,olosyys = cast(kaikkivuodet.olosyys as nvarchar(1))
	,aiopis = cast(coalesce(nullif(kaikkivuodet.aiopis , ''), '-1') as nvarchar(2))
	,kirikar1 = cast(coalesce(nullif(nullif(kaikkivuodet.kirikar1 , '') , 'XX'), '-1') as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tutklajl = cast(coalesce(nullif(kaikkivuodet.tutklajl , ''), '-1') as nvarchar(2))
	,aikoul = cast(coalesce(nullif(kaikkivuodet.aikoul , ''), '-1') as nvarchar(2))
	,tutalv = cast(coalesce(nullif(kaikkivuodet.tutalv , ''), '-1') as nvarchar(4))
	,tutalk = cast(coalesce(nullif(kaikkivuodet.tutalk , ''), '-1') as nvarchar(2))
	,tutklaja = cast(coalesce(nullif(kaikkivuodet.tutklaja , ''), '-1') as nvarchar(2))
	,tunim = cast(coalesce(nullif(kaikkivuodet.tunim , ''), '-1') as nvarchar(5))
	,sutunim = cast(coalesce(nullif(kaikkivuodet.sutunim , ''), '-1') as nvarchar(30))
	,rutunim = cast(coalesce(nullif(kaikkivuodet.rutunim , ''), '-1') as nvarchar(30))
	,koohj = cast(coalesce(nullif(kaikkivuodet.koohj , ''), '-1') as nvarchar(4))
	,sukoohj = cast(coalesce(nullif(kaikkivuodet.sukoohj , ''), '-1') as nvarchar(60))
	,rukoohj = cast(coalesce(nullif(kaikkivuodet.rukoohj , ''), '-1') as nvarchar(60))
	,tutktav = cast(coalesce(nullif(kaikkivuodet.tutktav , ''), '-1') as nvarchar(2))
	,tyov = cast(coalesce(nullif(kaikkivuodet.tyov , ''), '-1') as nvarchar(2))
	,rahoitus = cast(coalesce(nullif(kaikkivuodet.rahoitus , ''), '-1') as nvarchar(2))
	,alaika = cast(VipunenTK_SA.[dbo].RefineDateBegin(kaikkivuodet.alaika) as nvarchar(8))
	,loaika = cast(VipunenTK_SA.[dbo].RefineDateEnd(kaikkivuodet.loaika) as nvarchar(8))
	,tavoite =  cast(coalesce(nullif(kaikkivuodet.tavoite,''),'1')  as nvarchar(2))   -- HUOM! tässä aineistossa tulkitaan tyhjät tutkinnon tavoitteet tarkoituksella arvoon "1 - koko tutkinnon suorittaminen" kuutiomääritelmän mukaan -- Lasse
	,yrit = cast(coalesce(nullif(kaikkivuodet.yrit , ''), '-1') as nvarchar(2))
	,purku = cast(coalesce(nullif(kaikkivuodet.purku , ''), '-1') as nvarchar(2))
	,todis = cast(coalesce(nullif(kaikkivuodet.todis , ''), '-1') as nvarchar(2))
	,tol2008 = cast(coalesce(nullif(kaikkivuodet.tol2008 , ''), '-1') as nvarchar(5))
	,koko = cast(coalesce(nullif(kaikkivuodet.koko , ''), '-1') as nvarchar(2))
	,tyansek = cast(coalesce(nullif(kaikkivuodet.tyansek , ''), '-1') as nvarchar(2))
	,tilvasmaak = case	when len(tilvasmaak) = 1 then '0' + cast(kaikkivuodet.tilvasmaak as nvarchar(2))
						else cast(coalesce(nullif(kaikkivuodet.tilvasmaak , ''), '-1') as nvarchar(2))
				  end

	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as nvarchar(10))
FROM (

--Historia-aineisto
SELECT
	tilv
	, lahde = 
		case 
			when lahde=1 then '21'
			when lahde=2 and oppis=2 then '35'
			when lahde=2 and oppis=1 then '34'
			else '-1'
		end
	, tunn
	, jarj = op.koulutuksen_jarjestajakoodi
	, opjarj
	, koulk
	, kkieli = case kkielir1 when 'fs' then 'fi' else kkielir1 end
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis = 
		case 
			when ltrim(ika)='.' or alvv='9999' then '9'
			else
				case
					when cast(ika as int)-(cast(tilv as int)-cast(alvv as int))<25 then '1'
					else '2'
				end
		end
	, kirikar1 = 
		case 
			when ltrim(ika)='.' then '-1'
			else 
				case
					when cast(ika as int) between 15 and 19 then '15'
					when cast(ika as int) between 20 and 24 then '20'
					when cast(ika as int) between 25 and 29 then '25'
					when cast(ika as int) between 30 and 34 then '30'
					when cast(ika as int) between 35 and 39 then '35'
					when cast(ika as int) between 40 and 44 then '40'
					when cast(ika as int) between 45 and 49 then '45'
					when cast(ika as int) between 50 and 54 then '50'
					when cast(ika as int) between 55 and 59 then '55'
					when cast(ika as int) > 60 then '60'
					else '-1'
				end
		end
	, lkm
	, tutklajl = 
		case 
			when koulk = '301101' then '1'
			when koulk = '301102' then '2'--IB
			when koulk = '301103' then '3'--Reifeprüfung
			when koulk = '309901' then '4'--Gymnasieexamen
			when koulk = '301104' then '5'--EB
			else '-1'
		end
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim = null
	, sutunim = null
	, rutunim = null
	, koohj = null
	, sukoohj = null
	, rukoohj = null
	, tutktav
	, tyov
	, rahoitus
	, alaika = null
	, loaika = null
	, tavoite
	, yrit = null
	, purku = null
	, todis = null
	, tol2008 = null
	, koko = null
	, tyansek = null
	, tilvasmaak = asmaak
	,[tietolahde]='8_2_Historia_aineisto_opiskelijat'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_8_2_sopv_16] tk
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot op on op.oppilaitos_avain=tk.tunn
where lahde in (1,2) and tilv<2010

UNION ALL

SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika 
	, loaika 
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_11]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun =
		CASE 
			WHEN len(kkun) = 1 THEN '00' + kkun
			WHEN len(kkun) = 2 THEN '0' + kkun
			ELSE kkun
		END
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_11]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_11]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3d_Lukio_ja_amm_koulutuksen_opiskelijat_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3d_sopv_11]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_12]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_12]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_12]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3d_Lukio_ja_amm_koulutuksen_opiskelijat_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3d_sopv_12]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_113'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_13]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_13]

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_13]

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3d_Lukio_ja_amm_koulutuksen_opiskelijat_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3d_sopv_13]

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_14]

/* aineistot 14b, 14c rikki vielä -- Lasse 27.11.2014 
Otettu mukaan 20.1.2015 / Jarmo */
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_14]

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_14]
/* Otettu mukaan 20.1.2015 / Jarmo 
*/

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_15]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_15]

union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_15]
union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_16]
-- Tarjolla on myös TK_2_3e_sopv_15 mutta e-aineistoja ei ole aiempiakaan, joten sitä ei oteta mukaan. / CSC Jarmo 3.8.2015



union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_16]


union all
SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_16]

union all


SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3a_Lukio_ja_amm_koulutuksen_opiskelijat_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3a_sopv_17]

union all


SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3b_Lukio_ja_amm_koulutuksen_opiskelijat_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3b_sopv_17]


union all


SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_17]

union all


SELECT
	tilv
	, lahde
	, tunn
	, jarj
	, opjarj
	, koulk
	, kkieli
	, kkun
	, ophal
	, sp
	, aikielir1
	, alvv
	, allk
	, olotamm
	, olosyys
	, aiopis
	, kirikar1
	, lkm
	, tutklajl
	, aikoul
	, tutalv
	, tutalk
	, tutklaja
	, tunim
	, sutunim
	, rutunim
	, koohj
	, sukoohj
	, rukoohj
	, tutktav
	, tyov
	, rahoitus
	, alaika
	, loaika
	, tavoite
	, yrit
	, purku
	, todis
	, tol2008
	, koko
	, tyansek
	, tilvasmaak
	,[tietolahde]='2_3c_Lukio_ja_amm_koulutuksen_opiskelijat_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3c_sopv_18]


) kaikkivuodet




GO
/****** Object:  View [dbo].[v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 21.2.2018 16:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














CREATE VIEW [dbo].[v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat] AS


-- truncate table vipunentk_dw..sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat
-- insert into vipunentk_dw..sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat select * from v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat




SELECT
	tilv = CAST(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = Cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = cast(coalesce(nullif(kaikkivuodet.lahde , ''), '-1') as nvarchar(2))
	,jarj = cast(coalesce(nullif(kaikkivuodet.jarj, ''), '-1') as nvarchar(10))
	,opjarj = cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
	,kkieli = cast(coalesce(nullif(kaikkivuodet.kkieli , ''), '-1') as nvarchar(2))
	,koulk = cast(coalesce(nullif(kaikkivuodet.koulk , ''), '-1') as nvarchar(6))
	,kkun = cast(coalesce(nullif(kaikkivuodet.kkun , ''), '-1') as nvarchar(3))
	,ophal = cast(coalesce(nullif(kaikkivuodet.ophal , ''), '-1') as nvarchar(2))
	,sp = cast(coalesce(nullif(kaikkivuodet.sp , ''), '-1') as nvarchar(2))
	,aikielir1 = cast(coalesce(nullif(kaikkivuodet.aikielir1 , ''), '-1') as nvarchar(2))
	,tilvasmaak = cast(coalesce(nullif(kaikkivuodet.tilvasmaak , ''), '-1') as nvarchar(2))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))	
	,aiopis = cast(coalesce(nullif(kaikkivuodet.aiopis , ''), '-1') as nvarchar(2))
	,ika2 = cast(coalesce(nullif(kaikkivuodet.ika2, ''), '-1') as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,aikoul = cast(coalesce(nullif(kaikkivuodet.aikoul , ''), '-1') as nvarchar(2))
	,tutalv = cast(coalesce(nullif(kaikkivuodet.tutalv , ''), '-1') as nvarchar(4))
	,tutklaja = cast(coalesce(nullif(kaikkivuodet.tutklaja , ''), '-1') as nvarchar(2))
	,tunim = cast(coalesce(nullif(kaikkivuodet.tunim , ''), '-1') as nvarchar(255))
	,sutunim = cast(coalesce(nullif(kaikkivuodet.sutunim , ''), '-1') as nvarchar(255))
	,rutunim = cast(coalesce(nullif(kaikkivuodet.rutunim , ''), '-1') as nvarchar(255))
	,koohj = cast(coalesce(nullif(kaikkivuodet.koohj , ''), '-1') as nvarchar(100))
	,sukoohj = cast(coalesce(nullif(kaikkivuodet.sukoohj , ''), '-1') as nvarchar(100))
	,rukoohj = cast(coalesce(nullif(kaikkivuodet.rukoohj , ''), '-1') as nvarchar(100))
	,tutktav = cast(coalesce(nullif(kaikkivuodet.tutktav , ''), '-1') as nvarchar(2))
	,rahoitus = cast(coalesce(nullif(kaikkivuodet.rahoitus , ''), '-1') as nvarchar(2))
	,tavoite =  cast(coalesce(nullif(kaikkivuodet.tavoite,''),'-1')  as nvarchar(2))   -- HUOM! tässä aineistossa tulkitaan tyhjät tutkinnon tavoitteet tarkoituksella arvoon "1 - koko tutkinnon suorittaminen" kuutiomääritelmän mukaan -- Lasse
	,olosyys = cast(kaikkivuodet.olosyys as nvarchar(1))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as nvarchar(10))
FROM (
/* Ei oteta historiatietoja mukaan koska vuosilta 2011-2012 ei ole dataa
--Historia-aineisto
SELECT
	  [tilv]
      ,[lahde] = 
		case
			when lahde = '1' then '21'
			when lahde = '2' and oppis = '2' then '35'
			when lahde = '2' and oppis = '1' then '34'
			else '-1'
		end
      ,[jarj] = ot.koulutuksen_jarjestajakoodi
      ,[opjarj]
      ,[koulk]
      ,kkieli = case [kkielir1] when 'fs' then 'fi' else kkielir1 end
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak] = asmaak
      ,[alvv]
      ,[aiopis] = null
      ,ika2 = --ikä kirjoihintulovuonna
		case  
			when ltrim([ika])='.' or alvv='9999' then 'XX' 
			else 
				case 
					when cast(ltrim([ika]) as int)-(cast(tilv as int)-cast(alvv as int))>=60 then '60'
					else cast(cast(ltrim([ika]) as int)-(cast(tilv as int)-cast(alvv as int)) as varchar)
				end
		end
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim] = null
      ,[sutunim] = null
      ,[rutunim] = null
      ,[koohj] = null
      ,[sukoohj] = null
      ,[rukoohj] = null
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='8_2_Historia_opiskelijat'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_8_2_sopv_16] tk
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot ot on ot.oppilaitos_avain=tk.tunn
where lahde in (1,2) and tilv<2013

UNION ALL
*/
SELECT
	  [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_14]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_14]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_14]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_15]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_15]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_15]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_16]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_16]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_16]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_17]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_17]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_17]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak]
      ,[alvv]
      ,[aiopis]
      ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_18]

) kaikkivuodet




GO
/****** Object:  View [dbo].[v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 21.2.2018 16:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat] AS


-- truncate table vipunentk_dw..sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat
-- insert into vipunentk_dw..sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat select * from v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat


SELECT
	tilv = CAST(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = Cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = cast(coalesce(nullif(kaikkivuodet.lahde , ''), '-1') as nvarchar(2))
	,tunn = cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
	,jarj = cast(coalesce(nullif(kaikkivuodet.jarj, ''), '-1') as nvarchar(10))
	,opjarj = cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
	,opmast = cast(coalesce(nullif(kaikkivuodet.opmast , ''), '-1') as nvarchar(6))
	,opmala = cast(coalesce(nullif(kaikkivuodet.opmala , ''), '-1') as nvarchar(6))
	,kkieli = cast(coalesce(nullif(kaikkivuodet.kkieli , ''), '-1') as nvarchar(2))
	,kkun = cast(coalesce(nullif(kaikkivuodet.kkun , ''), '-1') as nvarchar(3))
	,ophal = cast(coalesce(nullif(kaikkivuodet.ophal , ''), '-1') as nvarchar(2))
	,tilvaskun = cast(coalesce(nullif(kaikkivuodet.tilvaskun , ''), '-1') as nvarchar(3))
	,tilvaskunx = cast(coalesce(nullif(kaikkivuodet.tilvaskunx , ''), '-1') as nvarchar(3))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))	
	,kirikar1 = cast(coalesce(nullif(kaikkivuodet.kirikar1 , ''), '-1') as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tutklajl = cast(coalesce(nullif(kaikkivuodet.tutklajl , ''), '-1') as nvarchar(2))
	,aikoul = cast(coalesce(nullif(kaikkivuodet.aikoul , ''), '-1') as nvarchar(2))
	,tutklaja = cast(coalesce(nullif(kaikkivuodet.tutklaja , ''), '-1') as nvarchar(2))
	,tutktav = cast(coalesce(nullif(kaikkivuodet.tutktav , ''), '-1') as nvarchar(2))
	,tyov = cast(coalesce(nullif(kaikkivuodet.tyov , ''), '-1') as nvarchar(2))
	,rahoitus = cast(coalesce(nullif(kaikkivuodet.rahoitus , ''), '-1') as nvarchar(2))
	,tavoite =  cast(coalesce(nullif(kaikkivuodet.tavoite,''),'1')  as nvarchar(2))   -- HUOM! tässä aineistossa tulkitaan tyhjät tutkinnon tavoitteet tarkoituksella arvoon "1 - koko tutkinnon suorittaminen" kuutiomääritelmän mukaan -- Lasse
	,yrit = cast(coalesce(nullif(kaikkivuodet.yrit , ''), '-1') as nvarchar(2))
	,olosyys = cast(kaikkivuodet.olosyys as nvarchar(1))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as nvarchar(10))
FROM (
SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[opmast]
      ,[opmala]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav]
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit]
      ,[olosyys]
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_2013_sopv_15]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[opmast]
      ,[opmala]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav]
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit]
      ,[olosyys]
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_2014_sopv_15]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[opmast]
      ,[opmala]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav]
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit]
      ,[olosyys]
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_sopv_16]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[opmast]
      ,[opmala]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav]
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit]
      ,[olosyys]
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_sopv_17]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[opmast] = NULL
      ,[opmala] = NULL
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav]
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit]
      ,[olosyys]
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_sopv_18]

) kaikkivuodet





GO
/****** Object:  View [dbo].[v_sa_2_4_Amm_koulutuksen_tutkinnot]    Script Date: 21.2.2018 16:33:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v_sa_2_4_Amm_koulutuksen_tutkinnot] AS

-- truncate table vipunentk_dw..sa_2_4_Amm_koulutuksen_tutkinnot
-- insert into vipunentk_dw..sa_2_4_Amm_koulutuksen_tutkinnot select * from v_sa_2_4_Amm_koulutuksen_tutkinnot

SELECT
	 tilv = CAST(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = Cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = CAST(kaikkivuodet.lahde as nvarchar(2))
	,tunn = cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
	
	/* vanha
	CASE WHEN lahde = 34 and tunn = '' THEN cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
			ELSE cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
			END   -- Ohjataan oppisopimuskoulutuksen lähteellä opjarj-muuttujan avain tyhjien arvojen tilalle - Lasse 26.5.2014
			*/
--	,tunn = CAST(kaikkivuodet.tunn as nvarchar(5))
	,jarj = CAST(kaikkivuodet.jarj as nvarchar(10))
	,opjarj = CAST(kaikkivuodet.opjarj as nvarchar(10))
	,koulk = CAST(kaikkivuodet.koulk as nvarchar(6))
	,tunim = CAST(kaikkivuodet.tunim as nvarchar(5))
	,sutunim = CAST(kaikkivuodet.sutunim as nvarchar(30))
	,rutunim = CAST(kaikkivuodet.rutunim as nvarchar(30))
	,koohj = CAST(kaikkivuodet.koohj as nvarchar(4))
	,sukoohj = CAST(kaikkivuodet.sukoohj as nvarchar(60))
	,rukoohj = CAST(kaikkivuodet.rukoohj as nvarchar(60))
	,tutklaja = CAST(kaikkivuodet.tutklaja as nvarchar(1))
	,tutktav = CAST(kaikkivuodet.tutktav as nvarchar(1))
	,kkieli = CAST(kaikkivuodet.kkieli as nvarchar(2))
	,kkun = CAST(kaikkivuodet.kkun as nvarchar(3))
	,ophal = CAST(coalesce(nullif(kaikkivuodet.ophal,''),'1') as nvarchar(2))
	,sp = CAST(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = CAST(kaikkivuodet.aikielir1 as nvarchar(2))
	,alvv = CAST(kaikkivuodet.alvv as nvarchar(4))
	,allk = CAST(kaikkivuodet.allk as nvarchar(1))
	,aiopis = CAST(kaikkivuodet.aiopis as nvarchar(1))
	,aikoul = CAST(kaikkivuodet.aikoul as nvarchar(1)) -- uusi sarake 2012

	--,kirikar1 = CAST(kaikkivuodet.kirikar1 as nvarchar(2))
	,kirikar1 = cast(coalesce(nullif(nullif(kaikkivuodet.kirikar1 , '') , 'XX'), '-1') as nvarchar(2))

	,suorpvm = CAST(kaikkivuodet.suorpvm as nvarchar(8))
	,lkm = CAST(kaikkivuodet.lkm as int)
	,tutalv = CAST(kaikkivuodet.tutalv as nvarchar(4))
	,tutalk = CAST(kaikkivuodet.tutalk as nvarchar(1))
	,hyvennen = CAST(kaikkivuodet.hyvennen as int)
	,hyvaik = CAST(kaikkivuodet.hyvaik as int)
	,suorkouaik = CAST(kaikkivuodet.suorkouaik as int) -- nimi muuttunut 2012
	,ovyht = CAST(kaikkivuodet.ovyht as int)
	,tyop = CAST(kaikkivuodet.tyop as int)
	,ammos = CAST(kaikkivuodet.ammos as int)
	,opintokok = CAST(kaikkivuodet.opintokok as int)
	,tyov = CAST(kaikkivuodet.tyov as nvarchar(1))
	,rahoitus = CAST(kaikkivuodet.rahoitus as nvarchar(1))
	,vayla = CAST(kaikkivuodet.vayla as nvarchar(1))
	,alaika = CAST(VipunenTK_SA.[dbo].RefineDateBegin(kaikkivuodet.alaika) as nvarchar(8))
	,loaika = CAST(VipunenTK_SA.[dbo].RefineDateEnd(kaikkivuodet.loaika) as nvarchar(8))
	,tavoite =  cast(coalesce(nullif(kaikkivuodet.tavoite,''),'1')  as nvarchar(2))   -- HUOM! tässä aineistossa tulkitaan tyhjät tutkinnon tavoitteet tarkoituksella arvoon "1 - koko tutkinnon suorittaminen" kuutiomääritelmän mukaan -- Lasse	

	--,toteuma_tutk  = CAST(kaikkivuodet.toteuma_tutk as nvarchar(1)) -- nimi muuttunut 2012
	
	,toteuma_tutk = 
	CASE 
		WHEN lahde = 32 THEN 1
		ELSE CAST(kaikkivuodet.toteuma_tutk as nvarchar(1))
	END        -- Opetussuunnitelmaperusteisen ammatillisen tutkinnon suorittaneet tulkitaan "suorittanut koko tutkinnon" -- 26.6.2014 Lasse

	,yrit = CAST(kaikkivuodet.yrit as nvarchar(1))
	,purku = CAST(kaikkivuodet.purku as nvarchar(1))
	,todis = CAST(kaikkivuodet.todis as nvarchar(1))
	,tol2008 = CAST(kaikkivuodet.tol2008 as nvarchar(5))
	,koko = CAST(kaikkivuodet.koko as nvarchar(1))
	,tyansek = CAST(kaikkivuodet.tyansek as nvarchar(1))
	,suorosat   = CAST(kaikkivuodet.suorosat as int)
	,tunn_opisk = cast(coalesce(nullif(kaikkivuodet.tunn_opisk , ''), '-1') as nvarchar(5))
	,jarj_opisk = cast(coalesce(nullif(kaikkivuodet.jarj_opisk , ''), '-1') as nvarchar(10))
	,kkun_opisk = cast(coalesce(nullif(kaikkivuodet.kkun_opisk , ''), '-1') as nvarchar(3))
	,tietolahde = CAST(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = CAST(kaikkivuodet.rivinumero as nvarchar(10))


  FROM (
  
--Historia-aineisto
select
	tilv = left(suoraika,4)
	,lahde = 
		case 
			when lahde=1 then '22'
			when lahde=2 and oppis=2 then '35'
			when lahde=2 and oppis=1 then '34'
			else '-1'
		end
	,tunn = oltunnus
	,jarj = op.koulutuksen_jarjestajakoodi
	,opjarj
	,koulk
	,tunim = null
	,sutunim = null
	,rutunim = null
	,koohj = null
	,sukoohj = null
	,rukoohj = null
	,tutklaja
	,tutktav = case when kouljat=1 and lahde=2 then '1' when kouljat=8 and lahde=2 then '2' when kouljat not in (1,8) and lahde=2 then '9' else '-1' end
	,kkieli = case kkielir1 when 'fs' then 'fi' else kkielir1 end
	,kkun
	,ophal = null
	,sp
	,aikielir1
	,alvv = case alvv when 'BBBB' then '9999' else alvv end
	,allk
	,aiopis = 
		case 
			when syntv='19XX' or alvv='BBBB' then '9'
			else
				case
					when cast(cast(left(suoraika,4) as int)-syntv as int)-(cast(left(suoraika,4) as int)-cast(alvv as int))<25 then '1'
					else '2'
				end
		end
	,aikoul = case when kouljat=1 and lahde=1 then '1' when kouljat=3 and lahde=1 then '2' else '-1' end
	,kirikar1 =
		case 
			when syntv='19XX' then '-1'
			else 
				case
					when cast(left(suoraika,4) as int)-syntv between 15 and 19 then '15'
					when cast(left(suoraika,4) as int)-syntv between 20 and 24 then '20'
					when cast(left(suoraika,4) as int)-syntv between 25 and 29 then '25'
					when cast(left(suoraika,4) as int)-syntv between 30 and 34 then '30'
					when cast(left(suoraika,4) as int)-syntv between 35 and 39 then '35'
					when cast(left(suoraika,4) as int)-syntv between 40 and 44 then '40'
					when cast(left(suoraika,4) as int)-syntv between 45 and 49 then '45'
					when cast(left(suoraika,4) as int)-syntv between 50 and 54 then '50'
					when cast(left(suoraika,4) as int)-syntv between 55 and 59 then '55'
					when cast(left(suoraika,4) as int)-syntv > 60 then '60'
					else '-1'
				end
		end
	,suorpvm = CONVERT (VARCHAR(8), suoraika, 112)
	,lkm
	,tutalv = null
	,tutalk = null
	,hyvennen = null
	,hyvaik = null
	,suorkouaik = null
	,ovyht = null
	,tyop = null
	,ammos = null
	,opintokok = null
	,tyov = null
	,rahoitus = null
	,vayla = null
	,alaika = null
	,loaika = null
	,tavoite = null
	,toteuma_tutk = 1 --aineistossa vain koko tutkinnon suorittaneet
	,yrit = null
	,purku = null
	,todis = null
	,tol2008 = null
	,koko = null
	,tyansek = null
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='8_1_Historia_aineisto_tutkinnot'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_8_1_sopv_16] tk
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot op on op.oppilaitos_avain=tk.oltunnus
WHERE lahde IN (1,2)

UNION ALL

select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	,null as aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='2_4a_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_11]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	,null as aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='2_4b_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_11]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	,null as aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='2_4c_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_11]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='2_4a_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_12]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='2_4b_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_12]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='2_4c_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_12]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	, suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	, toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='2_4d_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4d_sopv_12]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='2_4a_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_13]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(8), cast([alaika]+'01' as date), 112)
    ,[loaika]-- = CONVERT (VARCHAR(8), cast([loaika]+'01' as date), 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='2_4b_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_13]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='2_4c_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_13]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm = CONVERT (VARCHAR(8), suorpvm, 112)
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	, suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika-- = CONVERT(VARCHAR(8), alaika, 112)
	,loaika-- = CONVERT(VARCHAR(8), loaika, 112)
	,tavoite
	, toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,NULL AS suorosat
	,'-1' AS tunn_opisk
	,'-1' AS jarj_opisk
	,'-1' AS kkun_opisk
	,[tietolahde]='2_4d_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4d_sopv_13]

/* 14a, 14b ja 14c aineistot vielä rikki -- Lasse 27.11.2014
Otettu mukaan 20.1.2015 / Jarmo */

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4a_sopv_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_14]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(10), [alaika], 112)
    ,[loaika]-- = CONVERT (VARCHAR(10), [loaika], 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4b_sopv_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_14]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4c_sopv_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_14]
/* Otettu mukaan 20.1.2015 / Jarmo 
*/

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4a_sopv_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_15]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(10), [alaika], 112)
    ,[loaika]-- = CONVERT (VARCHAR(10), [loaika], 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4b_sopv_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_15]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4c_sopv_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_15]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4a_sopv_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_16]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(10), [alaika], 112)
    ,[loaika]-- = CONVERT (VARCHAR(10), [loaika], 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4b_sopv_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_16]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen
	,hyvaik
	,suorkouaik -- nimi muuttunut 2012
	,ovyht
	,tyop
	,ammos
	,opintokok
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4c_sopv_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_16]






union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4a_sopv_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_17]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(10), [alaika], 112)
    ,[loaika]-- = CONVERT (VARCHAR(10), [loaika], 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4b_sopv_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_17]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4c_sopv_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_17]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul = NULL -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4a_sopv_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4a_sopv_18]

union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
    ,[alaika]-- = CONVERT (VARCHAR(10), [alaika], 112)
    ,[loaika]-- = CONVERT (VARCHAR(10), [loaika], 112)
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4b_sopv_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4b_sopv_18]
union all
select
	tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,tunim
	,sutunim
	,rutunim
	,koohj
	,sukoohj
	,rukoohj
	,tutklaja
	,tutktav
	,kkieli
	,kkun
	,ophal
	,sp
	,aikielir1
	,alvv
	,allk
	,aiopis
	, aikoul -- uusi sarake 2012
	,kirikar1
	,suorpvm
	,lkm
	,tutalv
	,tutalk
	,hyvennen = NULL
	,hyvaik = NULL
	,suorkouaik = NULL
	,ovyht = NULL
	,tyop = NULL
	,ammos = NULL
	,opintokok = NULL
	,tyov
	,rahoitus
	,vayla
	,alaika
	,loaika
	,tavoite
	,toteuma_tutk -- nimi muuttunut 2012
	,yrit
	,purku
	,todis
	,tol2008
	,koko
	,tyansek
	,suorosat
	,tunn_opisk
	,jarj_opisk
	,kkun_opisk
	,[tietolahde]='2_4c_sopv_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4c_sopv_18]

) kaikkivuodet


GO

USE ANTERO