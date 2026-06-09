USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan]    Script Date: 10.10.2025 13.08.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












--drop table VipunenTK_DW.dbo.sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan
--select * into VipunenTK_DW.dbo.sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan from [dbo].[v_sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan]

ALTER VIEW [dbo].[v_sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan] AS

/*
JS 30.6.2023:
- Uudet opiskelijat, opiskelijat ja tutkinnot muodostettu ainakin toistaiseksi vasta näkymässä aineistotunnuksen perusteella.
- Rahoituslähdettä karkeistettiin (1 <-> perusluokituksen 1+2+3), selite tältä osin toistaiseksi kovakoodattu näkymässä.
*/ 

SELECT
	 [tilv] = cast(kaikkivuodet.[tilv] as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.[tilv]+'0101' as date)
	,[lahde] = cast(coalesce(nullif(kaikkivuodet.[lahde],''),'-1') as nvarchar(2))
	,[sp] = cast(coalesce(nullif(kaikkivuodet.[sp],''),'-1') as nvarchar(2))
	,[ikar7] = cast(coalesce(nullif(kaikkivuodet.[ikar7],''),'-1') as nvarchar(2))
	,[syntyp2] = cast(coalesce(nullif(kaikkivuodet.[syntyp2],''),'-1') as nvarchar(2))
	,[kansalr1] = cast(coalesce(nullif(kaikkivuodet.[kansalr1],''),'-1') as nvarchar(2))
	,[kaste_t2] = cast(coalesce(nullif(kaikkivuodet.[kaste_t2],''),'-1') as nvarchar(2))
	,[iscfi2013] = cast(coalesce(nullif(kaikkivuodet.[iscfi2013],''),'-1') as nvarchar(4))
    ,[rahlahde_v2] = cast(coalesce(nullif(kaikkivuodet.[rahlahde_v2],''),'-1') as nvarchar(2))
	,[kvopisk] = cast(coalesce(nullif(kaikkivuodet.kvopisk,''),'-1') as nvarchar(2))
    ,[ophal] = cast(coalesce(nullif(kaikkivuodet.[ophal],''),'-1') as nvarchar(2))
	,[alvv] = cast(coalesce(nullif(kaikkivuodet.[alvv],''),'-1') as nvarchar(4))
	,[allk] = cast(coalesce(nullif(kaikkivuodet.[allk],''),'-1') as nvarchar(2))
	,[lkm] = cast(kaikkivuodet.[lkm] as int)
	,aineisto = cast(kaikkivuodet.aineisto as nvarchar(50))
	
FROM (

	SELECT [tilv]
      ,[lahde]
      ,[ikar7]
      ,[sp]
      ,[syntyp2]
      ,[kansalr1]
      ,[kaste_t2]
      ,[iscfi2013]
      ,[rahlahde_v2]
	  ,[kvopisk] = '-1'
      ,[ophal]
      ,[alvv] = case when [alvv_v2] = '19' then '19XX' else [alvv_v2] end
      ,[allk]
      ,[lkm]
      ,aineisto = '2.8f'
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K2_8f_sopv_22]

	UNION ALL
	
	SELECT [tilv]
      ,[lahde]
      ,[ikar7]
      ,[sp]
      ,[syntyp2]
      ,[kansalr1]
      ,[kaste_t2]
      ,[iscfi2013]
      ,[rahlahde_v2]
	  ,[kvopisk] = '-1'
      ,[ophal]
      ,[alvv] = case when [alvv_v2] = '19' then '19XX' else [alvv_v2] end
      ,[allk]
      ,[lkm]
      ,aineisto = '2.9d'
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K2_9d_sopv_22]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar7]
      ,[sp]
      ,[syntyp2]
      ,[kansalr1]
      ,[kaste_t2]
      ,[iscfi2013]
      ,[rahlahde_v2]
	  ,[kvopisk] = '-1'
      ,[ophal]
      ,[alvv] = case when [alvv_v2] = '19' then '19XX' else [alvv_v2] end
      ,[allk]
      ,[lkm]
      ,aineisto = '2.8f'
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K2_8f_sopv_23]

	UNION ALL
	
	SELECT [tilv]
      ,[lahde]
      ,[ikar7]
      ,[sp]
      ,[syntyp2]
      ,[kansalr1]
      ,[kaste_t2]
      ,[iscfi2013]
      ,[rahlahde_v2]
	  ,[kvopisk] = '-1'
      ,[ophal]
      ,[alvv] = case when [alvv_v2] = '19' then '19XX' else [alvv_v2] end
      ,[allk]
      ,[lkm]
      ,aineisto = '2.9d'
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K2_9d_sopv_23]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar7]
      ,[sp]
      ,[syntyp2]
      ,[kansalr1]
      ,[kaste_t2]
      ,[iscfi2013]
      ,[rahlahde_v2]
	  ,kvopisk
      ,[ophal]
      ,[alvv] = case when [alvv_v2] = '19' then '19XX' else [alvv_v2] end
      ,[allk]
      ,[lkm]
      ,aineisto = '2.8f'
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K2_8f_sopv_24]

	UNION ALL
	
	SELECT [tilv]
      ,[lahde]
      ,[ikar7]
      ,[sp]
      ,[syntyp2]
      ,[kansalr1]
      ,[kaste_t2]
      ,[iscfi2013]
      ,[rahlahde_v2]
	  ,kvopisk
      ,[ophal]
      ,[alvv] = case when [alvv_v2] = '19' then '19XX' else [alvv_v2] end
      ,[allk]
      ,[lkm]
      ,aineisto = '2.9d'
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K2_9d_sopv_24]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar7]
      ,[sp]
      ,[syntyp2]
      ,[kansalr1]
      ,[kaste_t2]
      ,[iscfi2013]
      ,[rahlahde_v2]
	  ,kvopisk
      ,[ophal]
      ,[alvv] = case when [alvv_v2] = '19' then '19XX' else [alvv_v2] end
      ,[allk]
      ,[lkm]
      ,aineisto = '2.8f'
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K2_8f_sopv_25]

	UNION ALL
	
	SELECT [tilv]
      ,[lahde]
      ,[ikar7]
      ,[sp]
      ,[syntyp2]
      ,[kansalr1]
      ,[kaste_t2]
      ,[iscfi2013]
      ,[rahlahde_v2]
	  ,kvopisk
      ,[ophal]
      ,[alvv] = case when [alvv_v2] = '19' then '19XX' else [alvv_v2] end
      ,[allk]
      ,[lkm]
      ,aineisto = '2.9d'
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K2_9d_sopv_25]

) as kaikkivuodet

GO


