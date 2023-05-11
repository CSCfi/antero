USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_alueluokitus_nykytila_koodiaeikorvattu]    Script Date: 11.5.2023 19:51:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[v_alueluokitus_nykytila_koodiaeikorvattu] AS

-- CSC Jarmo 24.3.2014

-- Palautetaan dimension nykytila
-- HUOM [VipunenTK].[dbo].[d_alueluokitus_historia] pitää olla olemassa
-- Näkymän avaimena on alueluokitus_avain
-- Kenttien luotu, alkaa ja paattyy tietoja ei enää tarvita hauissa
--
-- Select * from VipunenTK..[v_alueluokitus_nykytila_koodiaeikorvattu]

SELECT [id]
      --,[luotu]
      --,[alkaa]
      --,[paattyy]
      ,d.[alueluokitus_avain]
      ,d.[kunta_koodi]
      ,[viimeisin_tilv]
      ,[liitoskunta_koodi]
      ,[kunta]
      ,[kunta_SV]
      ,[kunta_EN]
      ,[maakunta_koodi]
      ,[maakunta]
      ,[maakunta_SV]
      ,[maakunta_EN]
      ,[avi_koodi]
      ,[avi]
      ,[avi_SV]
      ,[avi_EN]
      ,[ely_koodi]
      ,[ely]
      ,[ely_SV]
      ,[ely_EN]
      ,[seutukunta_koodi]
      ,[seutukunta]
      ,[seutukunta_SV]
      ,[seutukunta_EN]
      ,[suuralue_koodi]
      ,[suuralue]
      ,[suuralue_SV]
      ,[suuralue_EN]
      ,[kuntaryhma_koodi]
      ,[kuntaryhma]
      ,[kuntaryhma_SV]
      ,[kuntaryhma_EN]
      ,[laani_koodi]
      ,[laani]
      ,[laani_SV]
      ,[laani_EN]
      ,[tyovoima_elinkeinokeskus_koodi]
      ,[tyovoima_elinkeinokeskus]
      ,[tyovoima_elinkeinokeskus_SV]
      ,[tyovoima_elinkeinokeskus_EN]
      ,[kielisuhde_koodi]
      ,[kielisuhde]
      ,[kielisuhde_SV]
      ,[kielisuhde_EN]
      ,[mannersuomi_ahvenanmaa_koodi]
      ,[mannersuomi_ahvenanmaa]
      ,[mannersuomi_ahvenanmaa_SV]
      ,[mannersuomi_ahvenanmaa_EN]
      ,[SCD_alkaa]
      ,[SCD_paattyy]
      ,[jarjestys]
      ,[jarjestys_maakunta]
      ,[jarjestys_avi]
      ,[jarjestys_ely]
      ,[jarjestys_seutukunta]
      ,[jarjestys_suuralue]
      ,[jarjestys_kuntaryhma]
      ,[jarjestys_laani]
      ,[jarjestys_tyovoima_elinkeinokeskus]
      ,[jarjestys_kielisuhde]
      ,[jarjestys_mannersuomi_ahvenanmaa]
      ,[virhetilanne]
      ,[tietolahde]
      ,[hyvinvointialue_koodi]
      ,[hyvinvointialue]
      ,[hyvinvointialue_SV]
      ,[hyvinvointialue_EN]
      ,[jarjestys_hyvinvointialue]

FROM [VipunenTK].[dbo].[d_alueluokitus_historia] d

JOIN ( 
	Select 
		alueluokitus_avain
		,viimeinen_paattyy = max(paattyy)
	from [VipunenTK].[dbo].[d_alueluokitus_historia] 
	group by alueluokitus_avain
 ) 
d_paattyy ON d_paattyy.alueluokitus_avain = d.alueluokitus_avain

WHERE d.paattyy = d_paattyy.viimeinen_paattyy


GO


