USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat]    Script Date: 27.5.2025 20.14.29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--drop table [VipunenTK_DW].dbo.sa_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat
--select * into [VipunenTK_DW].dbo.sa_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat from [VipunenTK_SA].[dbo].[v_sa_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat]

CREATE OR ALTER VIEW [dbo].[v_sa_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat] AS

SELECT
	 [tilv] = cast(kaikkivuodet.[tilv] as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.[tilv]+'0101' as date)
	,[lahde] = cast(coalesce(nullif(kaikkivuodet.[lahde],''),'-1') as nvarchar(2))
	,[sp] = cast(coalesce(nullif(kaikkivuodet.[sp],''),'-1') as nvarchar(2))
	,[ikar8] = cast(coalesce(nullif(nullif(kaikkivuodet.[ikar8],''), 'XX'), '-1') as nvarchar(2))
	,[ptoim1r6e] = cast(coalesce(nullif(kaikkivuodet.[ptoim1r6e],''),'-1') as nvarchar(2))
	,[sosee] = cast(coalesce(nullif(kaikkivuodet.[sosee],''),'-1') as nvarchar(2))
	,[tavoite] = cast(coalesce(nullif(kaikkivuodet.[tavoite],''),'-1') as nvarchar(2))
	,[tyov] = cast(coalesce(nullif(kaikkivuodet.[tyov],''),'-1') as nvarchar(2))
	,[kaste_t2_3] = cast(coalesce(nullif(kaikkivuodet.[kaste_t2_3],''),'-1') as nvarchar(2))
	,[iscfibroad2013] = cast(coalesce(nullif(kaikkivuodet.[iscfibroad2013],''),'-1') as nvarchar(2))
	,[koulk] = cast(coalesce(nullif(kaikkivuodet.[koulk],''),'-1') as nvarchar(6))
	,[koulknimi] = cast(coalesce(nullif(kaikkivuodet.[koulknimi],''),'Tieto puuttuu') as nvarchar(255))
	,[aiktutk] = cast(coalesce(nullif(kaikkivuodet.[aiktutk],''),'-1') as nvarchar(2))
	,[kaste_t2_tr] = cast(coalesce(nullif(kaikkivuodet.[kaste_t2_tr],''),'-1') as nvarchar(2))
	,[lkm] = cast(kaikkivuodet.[lkm] as int)
	,aineisto = cast(kaikkivuodet.aineisto as nvarchar(50))
	
FROM (

    SELECT 
		[tilv]
		,[lahde]
		,[ikar8]
		,[sp]
		,[kaste_t2_3]
		,[iscfibroad2013]
		,[koulk]
		,[koulknimi]
		,[tyov]
		,[tavoite]
		,[aiktutk]
		,[kaste_t2_tr]
		,[ptoim1r6e]
		,[sosee]
		,[lkm]
		,[aineisto] = '1.21c' 
		,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21c_sopv_25_2024]

	UNION ALL

    SELECT 
		[tilv]
		,[lahde]
		,[ikar8]
		,[sp]
		,[kaste_t2_3]
		,[iscfibroad2013]
		,[koulk]
		,[koulknimi]
		,[tyov]
		,[tavoite]
		,[aiktutk]
		,[kaste_t2_tr]
		,[ptoim1r6e]
		,[sosee]
		,[lkm]
		,[aineisto] = '1.21c' 
		,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21c_sopv_25_2023]

	UNION ALL

    SELECT 
		[tilv]
		,[lahde]
		,[ikar8]
		,[sp]
		,[kaste_t2_3]
		,[iscfibroad2013]
		,[koulk]
		,[koulknimi]
		,[tyov]
		,[tavoite]
		,[aiktutk]
		,[kaste_t2_tr]
		,[ptoim1r6e]
		,[sosee]
		,[lkm]
		,[aineisto] = '1.21c' 
		,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21c_sopv_25_2022]

	UNION ALL

    SELECT 
		[tilv]
		,[lahde]
		,[ikar8]
		,[sp]
		,[kaste_t2_3]
		,[iscfibroad2013]
		,[koulk]
		,[koulknimi]
		,[tyov]
		,[tavoite]
		,[aiktutk]
		,[kaste_t2_tr]
		,[ptoim1r6e]
		,[sosee]
		,[lkm]
		,[aineisto] = '1.21c' 
		,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21c_sopv_25_2021]

) as kaikkivuodet

GO
