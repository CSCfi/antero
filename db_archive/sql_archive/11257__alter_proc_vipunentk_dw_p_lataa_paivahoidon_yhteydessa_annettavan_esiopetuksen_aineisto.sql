USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]    Script Date: 6.10.2025 10.55.38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER PROCEDURE [dbo].[p_lataa_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] AS

TRUNCATE TABLE [VipunenTK].[dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]

INSERT INTO [VipunenTK].[dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]

SELECT [tilv]
      ,[jarj]
	  ,COALESCE(d1.[id], -2) AS oppilaitoksen_taustatiedot_id
	  ,COALESCE(d2.[id], -2) AS alueluokitus_id
	  ,COALESCE(d1b.[id], -2) AS oppilaitoksen_taustatiedot_historia_id
	  ,COALESCE(d2b.[id], -2) AS alueluokitus_historia_id
      ,COALESCE(d3.[id], -2) AS tiedonantajatyyppi_id
	  ,COALESCE(d12.[id], -1) AS opetuskieli_id
      ,[popy]
	  ,popyn
      ,[jmamu]
      ,[psisa]
      ,[jmamusisa]
      ,[pteho]
      ,[pertu]
      ,[pertuv]
      ,[pertum]
      ,[ptehoerop]
      ,[pviertu]
      ,[pviertuv]
      ,[pviertum]
      ,[pvimuut]
      ,[pviop]
      ,[pkuertu]
      ,[pkuertuv]
      ,[pkuertum]
      ,[pkumuut]
      ,[pkuop]
      ,[ppid5v]
      ,[pmuu5v]
      ,[pop5v]
      ,[apip1]
      ,[apip2]
      ,[apip39]
      ,[apipy]
      ,[oma3s]
      ,[osto3s]
      ,[avust3s]
      ,[syk3s]
      ,[oma4s]
      ,[osto4s]
      ,[avust4s]
      ,[syk4s]
      ,[omams]
      ,[ostoms]
      ,[avustms]
      ,[sykms]
      ,[omays]
      ,[ostoys]
      ,[avustys]
      ,[sykys]
      ,[oma3k]
      ,[osto3k]
      ,[avust3k]
      ,[kev3k]
      ,[oma4k]
      ,[osto4k]
      ,[avust4k]
      ,[kev4k]
      ,[omamk]
      ,[ostomk]
      ,[avustmk]
      ,[kevmk]
      ,[omayk]
      ,[ostoyk]
      ,[avustyk]
      ,[kevyk]
      ,CASE WHEN [pesis] = 1 THEN 2 WHEN [pesis] = 2 THEN 1 ELSE -1 END AS pesis_kylla_ei_id
	  ,COALESCE(d5.[id], -1) AS pesis_alueluokitus_id
      ,CASE WHEN [kesis] = 1 THEN 2 WHEN [kesis] = 2 THEN 1 ELSE -1 END AS kesis_kylla_ei_id
	  ,COALESCE(d7.[id], -1) AS kesis_alueluokitus_id
      ,CASE WHEN [perops] = 1 THEN 2 WHEN [perops] = 2 THEN 1 ELSE -1 END AS perops_kylla_ei_id
	  ,COALESCE(d9.[id], -1) AS perops_alueluokitus_id
      ,CASE WHEN [apips] = 1 THEN 2 WHEN [apips] = 2 THEN 1 ELSE -1 END AS apips_kylla_ei_id
	  ,COALESCE(d11.[id], -1) AS apips_alueluokitus_id
      ,[luontipvm]
  FROM [VipunenTK_SA]..[v_sa_2_18_Paivahoidossa_jarjestettava_esiopetus] f
  LEFT JOIN [VipunenTK]..[d_oppilaitoksen_taustatiedot] d1 ON f.jarj = d1.oppilaitos_avain
  LEFT JOIN [VipunenTK]..[d_oppilaitoksen_taustatiedot_historia] d1b ON f.jarj = d1b.oppilaitos_avain AND Cast(f.tilv+'0101' as date) between d1b.alkaa and d1b.paattyy
  LEFT JOIN [VipunenTK]..[d_alueluokitus] d2 ON d1.sijaintikuntakoodi = d2.kunta_koodi
  LEFT JOIN [VipunenTK]..[d_alueluokitus] d2b ON d1b.sijaintikuntakoodi = d2b.kunta_koodi
  LEFT JOIN [VipunenTK]..[d_opetuksen_jarjestajan_tiedoantajatyyppi] d3 ON f.tiedtype = d3.tiedonantajatyyppi_koodi
  LEFT JOIN [VipunenTK]..[d_oppilaitoksen_taustatiedot] d4 ON f.pesisjarj = d4.oppilaitos_avain
  LEFT JOIN [VipunenTK]..[d_alueluokitus] d5 ON d4.sijaintikuntakoodi = d5.kunta_koodi
  LEFT JOIN [VipunenTK]..[d_oppilaitoksen_taustatiedot] d6 ON f.kesisjarj = d6.oppilaitos_avain
  LEFT JOIN [VipunenTK]..[d_alueluokitus] d7 ON d6.sijaintikuntakoodi = d7.kunta_koodi
  LEFT JOIN [VipunenTK]..[d_oppilaitoksen_taustatiedot] d8 ON f.peropsjarj = d8.oppilaitos_avain
  LEFT JOIN [VipunenTK]..[d_alueluokitus] d9 ON d8.sijaintikuntakoodi = d9.kunta_koodi
  LEFT JOIN [VipunenTK]..[d_oppilaitoksen_taustatiedot] d10 ON f.apipsjarj = d10.oppilaitos_avain
  LEFT JOIN [VipunenTK]..[d_alueluokitus] d11 ON d10.sijaintikuntakoodi = d11.kunta_koodi
  LEFT JOIN [VipunenTK]..[d_opetuskieli] d12 ON d12.opetuskieli_koodi = f.vkieli



GO


