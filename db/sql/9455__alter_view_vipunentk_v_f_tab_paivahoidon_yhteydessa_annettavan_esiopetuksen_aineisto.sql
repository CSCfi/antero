USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]    Script Date: 4.1.2024 14:22:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_f_tab_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] AS

SELECT [tilv] AS Tilastovuosi
      ,d1.[koulutuksen_jarjestaja] AS [Opetuksen järjestäjä]
	  ,d1.[koulutuksen_jarjestajan_kieli] AS [Opetuksen järjestäjän kieli]
	  ,d1.[koulutuksen_jarjestajan_omistajatyyppi] AS [Opetuksen järjestäjän omistajatyyppi]
      ,d2.[kunta] AS [Opetuksen järjestäjän kunta]
	  ,d2.[maakunta] AS [Opetuksen järjestäjän maakunta]
	  ,d2.[ely] AS [Opetuksen järjestäjän ELY]
	  ,d2.[avi] AS [Opetuksen järjestäjän AVI]
      ,d3.[tiedonantajatyyppi] AS [Opetuksen järjestäjän tiedonantajatyyppi]
      ,[popy] AS [Oppilaat]
	  ,popyn AS [Oppilaat (tytöt)]
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
      ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = [pesis_kylla_ei_id]) AS [Varhaiskasvatuksen yhteydessä tapahtuva esiopetus siirretty]
      ,d4.[kunta] AS [Siirretyn varhaiskasvatuksen esiopetuksen järjestäjän kunta]
	  ,d4.[maakunta] AS [Siirretyn varhaiskasvatuksen esiopetuksen järjestäjän maakunta]
	  ,d4.[ely] AS [Siirretyn varhaiskasvatuksen esiopetuksen järjestäjän ELY]
	  ,d4.[avi] AS [Siirretyn varhaiskasvatuksen esiopetuksen järjestäjän AVI]
      ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = [kesis_kylla_ei_id]) AS [Koulun yhteydessä tapahtuva esiopetus siirretty]
      ,d5.[kunta] AS [Siirretyn koulun esiopetuksen järjestäjän kunta]
	  ,d5.[maakunta] AS [Siirretyn koulun esiopetuksen järjestäjän maakunta]
	  ,d5.[ely] AS [Siirretyn koulun esiopetuksen järjestäjän ELY]
	  ,d5.[avi] AS [Siirretyn koulun esiopetuksen järjestäjän AVI]
      ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = [perops_kylla_ei_id]) AS [Kunta siirtänyt perusopetuksen järjestämisen toiselle kunnalle]
      ,d6.[kunta] AS [Siirretyn perusopetuksen järjestäjän kunta]
	  ,d6.[maakunta] AS [Siirretyn perusopetuksen järjestäjän maakunta]
	  ,d6.[ely] AS [Siirretyn perusopetuksen järjestäjän ELY]
	  ,d6.[avi] AS [Siirretyn perusopetuksen järjestäjän AVI]
      ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = [apips_kylla_ei_id]) AS [Aamu- ja iltapäivätoiminta siirretty]
      ,d7.[kunta] AS [Siirretyn aamu- ja iltapäivätoiminnan järjestäjän kunta]
	  ,d7.[maakunta] AS [Siirretyn aamu- ja iltapäivätoiminnan järjestäjän maakunta]
	  ,d7.[ely] AS [Siirretyn aamu- ja iltapäivätoiminnan järjestäjän ELY]
	  ,d7.[avi] AS [Siirretyn aamu- ja iltapäivätoiminnan järjestäjän AVI]
      ,[luontipvm]

	  --ruotsi
	  ,[tilv] AS Statistikår
	  ,d1.[koulutuksen_jarjestaja_SV] AS [Utbildningsanordnare]
	  ,d1.[koulutuksen_jarjestajan_kieli_SV] AS [Utbildningsanordnarens språk]
	  ,d1.[koulutuksen_jarjestajan_omistajatyyppi_SV] AS [Utbildningsanordnarens ägartyp]
      ,d2.[kunta_SV] AS [Utbildningsanordnarens kommun]
	  ,d2.[maakunta_SV] AS [Utbildningsanordnarens landskap]
      

	  --englanti
	  ,[tilv] AS [Statistical year]
	  ,d1.[koulutuksen_jarjestaja_EN] AS [Education provider]
	  ,d1.[koulutuksen_jarjestajan_kieli_EN] AS [Language of the education provider]
	  ,d1.[koulutuksen_jarjestajan_omistajatyyppi_EN] AS [Type of education provider owner]
      ,d2.[kunta_EN] AS [Municipality of the education provider]
	  ,d2.[maakunta_EN] AS [Region of the education provider]


	  --järjestys
	  ,d1.[jarjestys_koulutuksenjarjestaja]
	  ,d1.[jarjestys_koulutuksen_jarjestajan_kieli]
      ,d2.[jarjestys] AS [jarjestys_kunta]
      ,d2.[jarjestys_maakunta]
      ,d2.[jarjestys_avi]
      ,d2.[jarjestys_ely]
      ,d3.[jarjestys] AS [jarjestys_tiedonantajatyyppi]
      ,d4.[jarjestys] AS [jarjestys_pesis_kunta]
      ,d4.[jarjestys_maakunta] AS [jarjestys_pesis_maakunta]
      ,d4.[jarjestys_avi] AS [jarjestys_pesis_avi]
      ,d4.[jarjestys_ely] AS [jarjestys_pesis_ely]
      ,d5.[jarjestys] AS [jarjestys_kesis_kunta]
      ,d5.[jarjestys_maakunta] AS [jarjestys_kesis_maakunta]
      ,d5.[jarjestys_avi] AS [jarjestys_kesis_avi]
      ,d5.[jarjestys_ely] AS [jarjestys_kesis_ely]
      ,d6.[jarjestys] AS [jarjestys_perops_kunta]
      ,d6.[jarjestys_maakunta] AS [jarjestys_perops_maakunta]
      ,d6.[jarjestys_avi] AS [jarjestys_perops_avi]
      ,d6.[jarjestys_ely] AS [jarjestys_perops_ely]
      ,d7.[jarjestys] AS [jarjestys_apips_kunta]
      ,d7.[jarjestys_maakunta] AS [jarjestys_apips_maakunta]
      ,d7.[jarjestys_avi] AS [jarjestys_apips_avi]
      ,d7.[jarjestys_ely] AS [jarjestys_apips_ely]
  FROM [f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] f
  INNER JOIN [d_oppilaitoksen_taustatiedot] d1 ON f.oppilaitoksen_taustatiedot_id = d1.id
  INNER JOIN [d_alueluokitus] d2 ON f.alueluokitus_id = d2.id
  INNER JOIN [d_opetuksen_jarjestajan_tiedoantajatyyppi] d3 ON f.tiedonantajatyyppi_id = d3.id
  INNER JOIN [d_alueluokitus] d4 ON f.pesis_alueluokitus_id = d4.id
  INNER JOIN [d_alueluokitus] d5 ON f.kesis_alueluokitus_id = d5.id
  INNER JOIN [d_alueluokitus] d6 ON f.perops_alueluokitus_id = d6.id
  INNER JOIN [d_alueluokitus] d7 ON f.apips_alueluokitus_id = d7.id

GO

USE [ANTERO]