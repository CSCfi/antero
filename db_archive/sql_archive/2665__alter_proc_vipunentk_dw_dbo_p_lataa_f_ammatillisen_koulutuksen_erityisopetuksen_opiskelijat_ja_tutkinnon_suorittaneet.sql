USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet]    Script Date: 4.12.2019 10:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[p_lataa_f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet] AS

TRUNCATE TABLE [VipunenTK].[dbo].[f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet]

INSERT INTO [VipunenTK].dbo.[f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet]
(
	[tilv]
	,[lahde_id]
	,[koulutuksen_jarjestamismuoto_id]
	,[perusjoukko_id]
	,[koulutusluokitus_id]
	,[ammatillisen_koulutuksen_koulutuslaji_id]
	,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id]
	,[kieli_id]
	,[kmaak]
	,[knuts2u]
	,[kkunryh]
	,[kely]
	,[kavi]
	,[sukupuoli_id]
	,[aidinkielir1_id]
	,[kansalaisuus_versio2_id]
	,[alvv]
	,[allk]
	,[olotamm_id]
	,[olosyys_id]
	,[aikuisopiskelija_id]
	,[erityisopetuksen_peruste_id]
	,[erityisoppilaan_opetusryhma_id]
	,[erityisopetus]
	,[ammos]
	,[opintokok]
	,[lkm]
	,[opiskelijat]
	,[opiskelijat_lasna]
)

SELECT [tilv]
      ,COALESCE(d4.id, -2) AS [lahde_id]
	  ,COALESCE(d13.id, -2) AS [koulutuksen_jarjestamismuoto_id]
      ,COALESCE(d12.id, -2) AS perusjoukko_id
      ,COALESCE(d1.id, -2) AS koulutusluokitus_id
      ,COALESCE(d6.id, -2) AS ammatillisen_koulutuksen_koulutuslaji_id
      ,COALESCE(d7.id, -2) AS opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
      ,COALESCE(d3.id, -2) AS kieli_id
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,COALESCE(d8.id, -2) AS sukupuoli_id
      ,COALESCE(d2.id, -2) AS [aidinkielir1_id]
      ,COALESCE(d9.id, -2) AS [kansalaisuus_versio2_id]
      ,[alvv]
      ,[allk]
      ,COALESCE(d15.id, -2) AS [olotamm_id]
      ,COALESCE(d14.id, -2) AS [olosyys_id]
      ,COALESCE(d10.id, -2) AS aikuisopiskelija_id
      ,COALESCE(d5.id, -2) AS erityisopetuksen_peruste_id
      ,COALESCE(d11.id, -2) AS erityisoppilaan_opetusryhma_id
	  ,[erityisopetus]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,COALESCE(f.lkm, 0) AS opiskelijat
	  ,CASE WHEN f.olosyys in ('1') THEN f.lkm ELSE 0 END AS opiskelijat_lasna

FROM 
(
	SELECT [tilv]
		  ,[lahde]
		  ,[perusjoukko]
		  ,[koulk]
		  ,[tutklaja]
		  ,[tutktav]
		  ,[kkieli]
		  ,[kmaak]
		  ,[knuts2u]
		  ,[kkunryh]
		  ,[kely]
		  ,[kavi]
		  ,[sp]
		  ,[aikielir1]
		  ,[kansalr2]
		  ,[alvv]
		  ,[allk]
		  ,CASE WHEN [olotamm] = '9' THEN '-1' ELSE [olotamm] END AS [olotamm]
		  ,CASE WHEN [olosyys] = '9' THEN '-1' ELSE [olosyys] END AS [olosyys]
		  ,[aiopis]
		  ,[erper]
		  ,[erryh]
		  ,[ammos]
		  ,[opintokok]
		  ,[lkm]
		  ,1 AS [erityisopetus]

	FROM [VipunenTK_SA].[dbo].[v_sa_2_6_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet]
  
	UNION ALL
  
	SELECT [tilv]
		  ,[lahde]
		  ,'1' AS [perusjoukko]
		  ,[koulk]
		  ,[tutklaja]
		  ,[tutktav]
		  ,[kkieli]
		  ,COALESCE(z.maakunta_koodi, '-1') AS [kmaak]
		  ,COALESCE(z.suuralue_koodi, '-1') AS [knuts2u]
		  ,COALESCE(z.kuntaryhma_koodi, '-1') AS [kkunryh]
		  ,COALESCE(z.ely_koodi, '-1') AS [kely]
		  ,COALESCE(z.avi_koodi, '-1') AS [kavi]
		  ,[sp]
		  ,[aikielir1]
		  ,'-1' AS [kansalr2]
		  ,[alvv]
		  ,[allk]
		  ,[olotamm]
		  ,[olosyys]
		  ,[aiopis]
		  ,'-1' AS [erper]
		  ,'-1' AS [erryh]
		  ,0 AS [ammos]
		  ,0 AS [opintokok]
		  ,SUM([lkm]) AS lkm
		  ,0 AS [erityisopetus]

	FROM [VipunenTK_SA].[dbo].[v_sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat] x
	INNER JOIN [VipunenTK].[dbo].[d_alueluokitus] z ON z.kunta_koodi = x.kkun
	WHERE lahde not in ('21', '22', '23')
	GROUP BY [tilv], [lahde], [koulk], [tutklaja], [tutktav], [kkieli], 
			z.maakunta_koodi, z.suuralue_koodi, z.kuntaryhma_koodi, z.ely_koodi, z.avi_koodi, 
			[sp], [aikielir1], [alvv], [allk], [olotamm], [olosyys], [aiopis]
  
	UNION ALL
  
	SELECT [tilv]
		,[lahde]
		,'2' AS [perusjoukko]
		,[koulk]
		,[tutklaja]
		,[tutktav]
		,[kkieli]
		,COALESCE(z.maakunta_koodi, '-1') AS [kmaak]
		,COALESCE(z.suuralue_koodi, '-1') AS [knuts2u]
		,COALESCE(z.kuntaryhma_koodi, '-1') AS [kkunryh]
		,COALESCE(z.ely_koodi, '-1') AS [kely]
		,COALESCE(z.avi_koodi, '-1') AS [kavi]
		,[sp]
		,[aikielir1]
		,'-1' AS [kansalr2]
		,[alvv]
		,[allk]
		,'-1' AS [olotamm]
		,'-1' AS [olosyys]
		,[aiopis]
		,'-1' AS [erper]
		,'-1' AS [erryh]
		,SUM([ammos]) AS ammos
		,SUM([opintokok]) AS opintokok
		,SUM([lkm]) AS lkm
		,0 AS [erityisopetus]

	FROM [VipunenTK_SA].[dbo].[v_sa_2_4_Amm_koulutuksen_tutkinnot] x
	INNER JOIN [VipunenTK].[dbo].[d_alueluokitus] z ON z.kunta_koodi = x.kkun
	WHERE lahde not in ('21', '22', '23') AND toteuma_tutk = '1'
	GROUP BY [tilv], [lahde], [koulk], [tutklaja], [tutktav], [kkieli], 
			z.maakunta_koodi, z.suuralue_koodi, z.kuntaryhma_koodi, z.ely_koodi, z.avi_koodi, 
			[sp], [aikielir1], [alvv], [allk], [aiopis]
	
	) f

	LEFT JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d1 ON d1.koulutus_koodi = f.koulk
	LEFT JOIN [VipunenTK].[dbo].[d_aidinkieli_versio1] d2 ON d2.aidinkieli_versio1_koodi = f.aikielir1
	LEFT JOIN [VipunenTK].[dbo].[d_kieli] d3 ON d3.kieli_koodi = f.kkieli
	LEFT JOIN [VipunenTK].[dbo].[d_lahde] d4 ON d4.lahde_koodi = f.lahde
	LEFT JOIN [VipunenTK].[dbo].[d_erityisopetuksen_peruste] d5 ON d5.erityisopetuksen_peruste_avain = f.erper
	LEFT JOIN [VipunenTK].[dbo].[d_ammatillisen_koulutuksen_koulutuslaji] d6 ON d6.ammatillisen_koulutuksen_koulutuslaji_koodi = f.tutklaja
	LEFT JOIN [VipunenTK].[dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] d7 ON d7.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi = f.tutktav
	LEFT JOIN [VipunenTK].[dbo].[d_sukupuoli] d8 ON d8.sukupuoli_koodi = f.sp
	LEFT JOIN [VipunenTK].[dbo].[d_kansalaisuus_versio2] d9 ON d9.kansalaisuus_versio2_koodi = f.kansalr2
	LEFT JOIN [VipunenTK].[dbo].[d_aikuisopiskelija] d10 ON d10.aikuisopiskelija_koodi = f.aiopis
	LEFT JOIN [VipunenTK].[dbo].[d_erityisoppilaan_opetusryhma] d11 ON d11.erityisoppilaan_opetusryhma_avain = f.erryh
	LEFT JOIN [VipunenTK].[dbo].[d_perusjoukko] d12 ON d12.perusjoukko_avain = f.perusjoukko
	LEFT JOIN [VipunenTK].[dbo].[d_koulutuksen_jarjestamismuoto] d13 ON d13.koulutuksen_jarjestamismuoto_koodi = CASE WHEN f.lahde in ('31','32','33','35') THEN '1' WHEN f.lahde in ('34') THEN '2' ELSE '-1' END
	LEFT JOIN [VipunenTK].[dbo].[d_opiskelijan_olo] d14 ON d14.opiskelijan_olo_koodi = f.olosyys
	LEFT JOIN [VipunenTK].[dbo].[d_opiskelijan_olo] d15 ON d15.opiskelijan_olo_koodi = f.olotamm

GO
USE [ANTERO]