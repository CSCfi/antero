USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat]    Script Date: 25.6.2025 12.12.21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dbo].[v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat] AS

-- truncate table vipunentk_dw..sa_3_15_Lukio_ja_amm_tutk_mediaani_iat
-- insert into vipunentk_dw..sa_3_15_Lukio_ja_amm_tutk_mediaani_iat select * from v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat

--drop table vipunentk_dw.dbo.sa_3_15_Lukio_ja_amm_tutk_mediaani_iat
--select * into vipunentk_dw.dbo.sa_3_15_Lukio_ja_amm_tutk_mediaani_iat from v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat

SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = cast(kaikkivuodet.lahde as nvarchar(2))
	,tunn = CASE WHEN lahde = 34 and tunn = '' THEN cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
			ELSE cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
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
	--CASE
	--	WHEN lahde in ('22','23') THEN '1' --huom. LR, Kansainväliset ylioppilastutkinnot ja gymnasieexamen mukana
	--	ELSE cast(kaikkivuodet.ophal, rahoitus = null as nvarchar(1))
	--END
	,aikoul = cast(kaikkivuodet.aikoul as nvarchar(1))
	,koso = cast(kaikkivuodet.koso as nvarchar(1))
	,opso = cast(kaikkivuodet.opso as nvarchar(1))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int) --select count(*)

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
	,ophal, rahoitus = null
	,aikoul
	,koso = null
	,opso = null
	,[tietolahde]='3_15_sopv_12'
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
	,ophal, rahoitus = null
	,aikoul
	,koso = null
	,opso = null
	,[tietolahde]='3_15_sopv_13'
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
	,ophal, rahoitus = null
	,aikoul
	,koso = null
	,opso = null
	,[tietolahde]='3_15_2012_sopv_14'
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
	,ophal, rahoitus = null
	,aikoul
	,koso = null
	,opso = null
	,[tietolahde]='3_15_2013_sopv_14'
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
	,ophal, rahoitus = null
	,aikoul
	,koso = null
	,opso = null
	,[tietolahde]='3_15_sopv_15'
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
	,ophal, rahoitus = null
	,aikoul
	,koso = null
	,opso = null
	,[tietolahde]='3_15_sopv_16'
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
	,ophal, rahoitus = null
	,aikoul
	,koso = null
	,opso = null
	,[tietolahde]='3_15_sopv_17'
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
	,ophal, rahoitus = null
	,aikoul
	,koso = null
	,opso = null
	,[tietolahde]='3_15_sopv_18'
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
	,tutktav = NULL
	,ophal, rahoitus = null
	,aikoul
	,koso = null
	,opso = null
	,[tietolahde]='3_15_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_15_sopv_19]

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj = jarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk = '07'
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk = toteuma_tutk
	,tutklaja
	,tutktav = NULL
	,ophal, rahoitus
	,aikoul
	,koso
	,opso
	,[tietolahde]='2_4h_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_2019_sopv_21]
WHERE toteuma_tutk is not null

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj = jarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk = '07'
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk = toteuma_tutk
	,tutklaja
	,tutktav = NULL
	,ophal, rahoitus
	,aikoul
	,koso
	,opso
	,[tietolahde]='2_4h_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_2020_sopv_21]
WHERE toteuma_tutk is not null

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj = jarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk = '07'
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk = toteuma_tutk
	,tutklaja
	,tutktav = NULL
	,ophal, rahoitus
	,aikoul
	,koso
	,opso
	,[tietolahde]='2_4h_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_22]
WHERE toteuma_tutk is not null

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj = jarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk = '07'
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk = toteuma_tutk
	,tutklaja
	,tutktav = NULL
	,ophal, rahoitus
	,aikoul
	,koso
	,opso
	,[tietolahde]='2_4h_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_23]
WHERE toteuma_tutk is not null

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj = jarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk = '07'
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk = toteuma_tutk
	,tutklaja
	,tutktav = NULL
	,ophal, rahoitus
	,aikoul
	,koso
	,opso
	,[tietolahde]='2_4h_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_24]
WHERE toteuma_tutk is not null

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj = jarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk = '07'
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk = toteuma_tutk
	,tutklaja
	,tutktav = NULL
	,ophal, rahoitus
	,aikoul
	,koso
	,opso
	,[tietolahde]='2_4h_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_25]
WHERE toteuma_tutk is not null


) as kaikkivuodet

left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d on d.oppilaitos_avain = coalesce(nullif(coalesce(nullif(jarj, ''), opjarj), ''), tunn)



GO


