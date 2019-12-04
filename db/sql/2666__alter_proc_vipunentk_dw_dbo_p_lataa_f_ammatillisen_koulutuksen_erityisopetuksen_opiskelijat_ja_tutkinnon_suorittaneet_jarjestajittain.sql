USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain]    Script Date: 4.12.2019 11:46:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain] AS

TRUNCATE TABLE [VipunenTK].[dbo].[f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain]

INSERT INTO [VipunenTK].[dbo].[f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain]
(
	[tilv]
    ,[lahde_id]
    ,[perusjoukko_id]
    ,[oppilaitoksen_taustatiedot_id]
    ,[alueluokitus_id]
    ,[koulutuksen_jarjestajan_oppilaitoksen_taustatiedot_id]
    ,[koulutuksen_jarjestajan_alueluokitus_id]
    ,[oppisopimus_oppilaitoksen_taustatiedot_id]
    ,[oppisopimus_alueluokitus_id]
    ,[koulutusluokitus_id]
    ,[ammatillisen_koulutuksen_koulutuslaji_id]
    ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id]
    ,[kieli_id]
    ,[kmaak]
    ,[lkm]
    ,[opiskelijan_oppilaitoksen_taustatiedot_id]
    ,[opiskelijan_alueluokitus_id]
    ,[opiskelijan_oppilaitoksen_oppilaitoksen_taustatiedot_id]
    ,[opiskelijan_oppilaitoksen_alueluokitus_id]
    ,[opiskelijan_olo_id]
	,[koulutuksen_jarjestamismuoto_id]
	,[opiskelijat]
	,[opiskelijat_lasna]
)

SELECT [tilv]
	  ,COALESCE(d1.id, -2) AS [lahde_id]
	  ,COALESCE(d2.id, -2) AS [perusjoukko_id]
	  ,COALESCE(d11.id, -2) AS [oppilaitoksen_taustatiedot_id]
	  ,CASE WHEN d11.id = -1 THEN -1 ELSE COALESCE(d12.id, -2) END AS [alueluokitus_id]
	  ,COALESCE(NULLIF(d3.id, -1), d5.id, -2) AS [koulutuksen_jarjestajan_oppilaitoksen_taustatiedot_id]
	  ,CASE WHEN COALESCE(NULLIF(d3.id, -1), d5.id) = -1 THEN -1 ELSE COALESCE(d4.id, d6.id, -2) END AS [koulutuksen_jarjestajan_alueluokitus_id]
	  ,COALESCE(d5.id, -2) AS [oppisopimus_oppilaitoksen_taustatiedot_id]
	  ,CASE WHEN d5.id = -1 THEN -1 ELSE COALESCE(d6.id, -2) END AS [oppisopimus_alueluokitus_id]
	  ,COALESCE(d7.id, -2) AS koulutusluokitus_id
	  ,COALESCE(d8.id, -2) AS ammatillisen_koulutuksen_koulutuslaji_id
      ,COALESCE(d9.id, -2) AS opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
	  ,COALESCE(d10.id, -2) AS kieli_id
	  ,kmaak
	  ,lkm
	  ,COALESCE(d13.id, -2) AS [opiskelijan_oppilaitoksen_taustatiedot_id]
	  ,CASE WHEN d13.id = -1 THEN -1 ELSE COALESCE(d14.id, -2) END AS [opiskelijan_alueluokitus_id]	  
	  ,COALESCE(d15.id, -2) AS [opiskelijan_oppilaitoksen_oppilaitoksen_taustatiedot_id]
	  ,CASE WHEN d15.id = -1 THEN -1 ELSE COALESCE(d16.id, -2) END AS [opiskelijan_oppilaitoksen_alueluokitus_id]
	  ,COALESCE(d17.id, -2) AS opiskelijan_olo_id
	  ,COALESCE(d18.id, -2) AS [koulutuksen_jarjestamismuoto_id]
	  ,CASE WHEN d2.perusjoukko_avain = '1' THEN f.lkm ELSE 0 END AS opiskelijat
	  ,CASE WHEN (f.olosyys in ('1') OR tilv < 2013) AND d2.perusjoukko_avain = '1' THEN f.lkm ELSE 0 END AS opiskelijat_lasna

FROM [VipunenTK_SA].[dbo].[v_sa_2_7_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain] f
LEFT JOIN [VipunenTK].[dbo].[d_lahde] d1 ON d1.lahde_koodi = f.lahde
LEFT JOIN [VipunenTK].[dbo].[d_perusjoukko] d2 ON d2.perusjoukko_avain = f.perusjoukko
LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d3 ON d3.oppilaitos_avain = f.jarj
LEFT JOIN (SELECT * FROM [VipunenTK].[dbo].[d_alueluokitus] WHERE kunta_koodi <> '-1') d4 ON d4.kunta_koodi = d3.sijaintikuntakoodi
LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d5 ON d5.oppilaitos_avain = f.opjarj
LEFT JOIN (SELECT * FROM [VipunenTK].[dbo].[d_alueluokitus] WHERE kunta_koodi <> '-1') d6 ON d6.kunta_koodi = d5.sijaintikuntakoodi
LEFT JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d7 ON d7.koulutus_koodi = f.koulk
LEFT JOIN [VipunenTK].[dbo].[d_ammatillisen_koulutuksen_koulutuslaji] d8 ON d8.ammatillisen_koulutuksen_koulutuslaji_koodi = f.tutklaja
LEFT JOIN [VipunenTK].[dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] d9 ON d9.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi = f.tutktav
LEFT JOIN [VipunenTK].[dbo].[d_kieli] d10 ON d10.kieli_koodi = f.kkieli
LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d11 ON d11.oppilaitos_avain = f.tunn
LEFT JOIN (SELECT * FROM [VipunenTK].[dbo].[d_alueluokitus] WHERE kunta_koodi <> '-1') d12 ON d12.kunta_koodi = d11.sijaintikuntakoodi
LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d13 ON d13.oppilaitos_avain = f.tunn_opisk
LEFT JOIN (SELECT * FROM [VipunenTK].[dbo].[d_alueluokitus] WHERE kunta_koodi <> '-1') d14 ON d14.kunta_koodi = d13.sijaintikuntakoodi
LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d15 ON d15.oppilaitos_avain = f.jarj_opisk
LEFT JOIN (SELECT * FROM [VipunenTK].[dbo].[d_alueluokitus] WHERE kunta_koodi <> '-1') d16 ON d16.kunta_koodi = d15.sijaintikuntakoodi
LEFT JOIN [VipunenTK].[dbo].[d_opiskelijan_olo] d17 ON d17.opiskelijan_olo_koodi = CASE WHEN f.olosyys = 9 THEN -1 ELSE f.olosyys END
LEFT JOIN [VipunenTK].[dbo].[d_koulutuksen_jarjestamismuoto] d18 ON d18.koulutuksen_jarjestamismuoto_koodi = CASE WHEN f.lahde in ('31','32','33','35') THEN '1' WHEN f.lahde in ('34') THEN '2' ELSE '-1' END


GO
USE [ANTERO]