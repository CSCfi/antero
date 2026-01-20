USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 23.6.2025 12.17.38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dbo].[v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat] AS

-- truncate table vipunentk_dw..sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat
-- insert into vipunentk_dw..sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat select * from v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat

-- drop table vipunentk_dw.dbo.sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat
-- select * into vipunentk_dw.dbo.sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat from v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat

SELECT
	tilv = CAST(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = Cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = cast(coalesce(nullif(kaikkivuodet.lahde , ''), '-1') as nvarchar(2))
	,tunn = cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
	,jarj = cast(coalesce(nullif(kaikkivuodet.jarj, ''), '-1') as nvarchar(10))
	,opjarj = cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
	,koulk = cast(coalesce(nullif(kaikkivuodet.koulk , ''), '-1') as nvarchar(6))
	,opmast = cast(coalesce(nullif(kaikkivuodet.opmast , ''), '-1') as nvarchar(6))
	,kaste_t2 = cast(coalesce(nullif(kaikkivuodet.kaste_t2 , ''), '-1') as nvarchar(6))
	,opmala = cast(coalesce(nullif(kaikkivuodet.opmala , ''), '-1') as nvarchar(6))
	,iscfibroad2013 = cast(coalesce(nullif(kaikkivuodet.iscfibroad2013 , ''), '-1') as nvarchar(6))
	,kkieli = cast(coalesce(nullif(kaikkivuodet.kkieli , ''), '-1') as nvarchar(2))
	,kkun = cast(coalesce(nullif(kaikkivuodet.kkun , ''), '-1') as nvarchar(3))
	--Huom. tilv21 alkaen aineiston (2, 3) <-> d_hallinnonala2 (3, 2):
	,ophal = cast(
		case 
			--lukio
			when lahde < 30 then 
				case 
					when coalesce(coalesce(d.koulutuksen_jarjestajan_korvaavakoodi,d.koulutuksen_jarjestajakoodi), '') = '0145076-7' --'Ålands Landskapsregering'
					then '3' --Muiden hallinnonalojen alainen koulutus
					else '1' --Opetushallinto, pl. työvoimakoulutus
				end
			--amm
			when ophal = '1' then '1'
			when ophal = '3' then '2' --Opetushallinto, työvoimakoulutus
			when ophal = '2' 
				and tilv < 2021
				and (
					rahoitus = '10'
					or (
						coalesce(tunn, '') not in ('90018', '30049') --'Pohjois-Kalotin koulutuskeskus
						and coalesce(coalesce(d.koulutuksen_jarjestajan_korvaavakoodi, d.koulutuksen_jarjestajakoodi), '') not in (
							'0145076-7', '2153105-4', '150622-3', '0909306-3' --'Ålands Landskapsregering','Poliisiammattikorkeakoulu','Rikosseuraamusalan Koulutuskeskus','Pelastusopisto'
						)
					)
				)
				then '2'
			when ophal = '2' then '3'
			else '-1'
		end 
		as nvarchar(2)
	)
	,tilvaskun = cast(coalesce(nullif(kaikkivuodet.tilvaskun , ''), '-1') as nvarchar(3))
	,tilvaskunx = cast(coalesce(nullif(kaikkivuodet.tilvaskunx , ''), '-1') as nvarchar(3))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))	
	,ika2 = cast(coalesce(nullif(kaikkivuodet.ika2 , ''), '-1') as nvarchar(2))
	,kirikar1 = cast(coalesce(nullif(kaikkivuodet.kirikar1 , ''), '-1') as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tutklajl = cast(coalesce(nullif(kaikkivuodet.tutklajl , ''), '-1') as nvarchar(2))
	,aikoul = cast(coalesce(nullif(kaikkivuodet.aikoul , ''), '-1') as nvarchar(2))
	,tutklaja = cast(coalesce(nullif(kaikkivuodet.tutklaja , ''), '-1') as nvarchar(2))
	,tutktav = cast(coalesce(nullif(kaikkivuodet.tutktav , ''), '-1') as nvarchar(2))
	,tyov = cast(coalesce(nullif(kaikkivuodet.tyov , ''), '-1') as nvarchar(2))
	,rahoitus = cast(cast(coalesce(nullif(kaikkivuodet.rahoitus , ''), '-1') as int) as nvarchar(2))
	,tavoite =  cast(coalesce(nullif(kaikkivuodet.tavoite,''),'1')  as nvarchar(2))   -- HUOM! tässä aineistossa tulkitaan tyhjät tutkinnon tavoitteet tarkoituksella arvoon "1 - koko tutkinnon suorittaminen" kuutiomääritelmän mukaan -- Lasse
	,yrit = cast(coalesce(nullif(kaikkivuodet.yrit , ''), '-1') as nvarchar(2))
	,olosyys = cast(kaikkivuodet.olosyys as nvarchar(1))
	,koso = cast(kaikkivuodet.koso as nvarchar(1))
	,opso = cast(kaikkivuodet.opso as nvarchar(1))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as nvarchar(10))
FROM (
SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk] = null
	  ,[opmast]
	  ,[kaste_t2] 
      ,[opmala]
	  ,[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[ika2] = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_2013_sopv_15_H]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk] = null
	  ,[opmast]
	  ,[kaste_t2] 
      ,[opmala]
	  ,[iscfibroad2013] 
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[ika2] = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_2014_sopv_15_H]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk] = null
	  ,[opmast]
	  ,[kaste_t2]
      ,[opmala]
	  ,[iscfibroad2013] 
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[ika2] = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_sopv_16_H]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk] = null
	  ,[opmast]
	  ,[kaste_t2] 
      ,[opmala]
	  ,[iscfibroad2013] 
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[ika2] = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_sopv_17_H]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk] = null
	  ,[opmast] = NULL
	  ,[kaste_t2]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[ika2] = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_sopv_18]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk] = null
	  ,[opmast] = NULL
	  ,[kaste_t2]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[ika2] = null
	  ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit] = NULL
      ,[olosyys]
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_3h_sopv_19]

union all

--tiedot aineistosta K2.4h tilastovuodesta 2019 alkaen
SELECT
	   f.[tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj] = jarj
      ,f.[koulk]
	  ,[opmast] = NULL
	  ,d.[kaste_t2]
      ,[opmala] = NULL
	  ,d.[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,ika2 =	case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
	  ,kirikar1 =	case 
						when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
						when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
					end
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit] = NULL
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_2019_sopv_21] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_5_sopv_20 d on d.koulk = f.koulk

union all

SELECT
	   f.[tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj] = jarj
      ,f.[koulk]
	  ,[opmast] = NULL
	  ,d.[kaste_t2]
      ,[opmala] = NULL
	  ,d.[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,ika2 =	case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
	  ,kirikar1 =	case 
						when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
						when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
					end
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit] = NULL
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_2020_sopv_21] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_5_sopv_21 d on d.koulk = f.koulk

union all

SELECT
	   f.[tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj] = jarj
      ,f.[koulk]
	  ,[opmast] = NULL
	  ,d.[kaste_t2]
      ,[opmala] = NULL
	  ,d.[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,ika2 =	case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
	  ,kirikar1 =	case 
						when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
						when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
					end
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit] = NULL
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_22] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_5_sopv_22 d on d.koulk = f.koulk --päivitä vuosi kaikkiin: tietolahde, f, d

union all

SELECT
	   f.[tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj] = jarj
      ,f.[koulk]
	  ,[opmast] = NULL
	  ,d.[kaste_t2]
      ,[opmala] = NULL
	  ,d.[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,ika2 =	case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
	  ,kirikar1 =	case 
						when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
						when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
					end
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit] = NULL
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_23] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_5_sopv_23 d on d.koulk = f.koulk --päivitä vuosi kaikkiin: tietolahde, f, d

union all

SELECT
	   f.[tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj] = jarj
      ,f.[koulk]
	  ,[opmast] = NULL
	  ,d.[kaste_t2]
      ,[opmala] = NULL
	  ,d.[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,ika2 =	case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
	  ,kirikar1 =	case 
						when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
						when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
					end
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit] = NULL
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_24] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_5_sopv_24 d on d.koulk = f.koulk --päivitä vuosi kaikkiin: tietolahde, f, d

union all

SELECT
	   f.[tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj] = jarj
      ,f.[koulk]
	  ,[opmast] = NULL
	  ,d.[kaste_t2]
      ,[opmala] = NULL
	  ,d.[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,ika2 =	case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
	  ,kirikar1 =	case 
						when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast((cast(alvv as int) - cast(syntv as int)) / 5 * 5 as nvarchar(2))
						when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
					end
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav] = NULL
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit] = NULL
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_25] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_5_sopv_25 d on d.koulk = f.koulk --päivitä vuosi kaikkiin: tietolahde, f, d

) kaikkivuodet

left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d on d.oppilaitos_avain = coalesce(nullif(coalesce(nullif(jarj, ''), opjarj), ''), tunn)


GO


