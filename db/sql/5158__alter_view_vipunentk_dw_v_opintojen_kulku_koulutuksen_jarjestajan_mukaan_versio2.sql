USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]    Script Date: 24.11.2021 21:38:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] AS
SELECT
	[id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN]
      ,[jarjestys_4bb]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM dbo.d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2
UNION ALL
SELECT
	[id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV]
      ,[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN]
      ,[jarjestys_4bb]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM VipunenTK_lisatiedot..v_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2
WHERE virhetilanne='K'




GO


