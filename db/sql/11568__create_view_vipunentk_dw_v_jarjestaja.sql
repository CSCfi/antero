USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_jarjestaja]    Script Date: 15.1.2026 14.26.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_jarjestaja] AS

SELECT [id]
      ,[koulutuksen_jarjestajakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[tilv]
      ,[korvaavakoodi]
      ,[koulutuksen_jarjestajaselite]
      ,[koulutuksen_jarjestajaselite_SV]
      ,[koulutuksen_jarjestajaselite_EN]
      ,[omistajatyyppikoodi]
      ,[omistajatyyppiselite]
      ,[omistajatyyppiselite_SV]
      ,[omistajatyyppiselite_EN]
      ,[koulutuksen_jarjestajan_kielikoodi]
      ,[koulutuksen_jarjestajan_kieliselite]
      ,[koulutuksen_jarjestajan_kieliselite_SV]
      ,[koulutuksen_jarjestajan_kieliselite_EN]
      ,[sijaintikuntakoodi]
      ,[jarjestys]
      ,[jarjestys_omistajatyyppi]
      ,[jarjestys_koulutuksen_jarjestajan_kieli]
      ,[virhetilanne]
      ,[tietolahde]
  FROM [VipunenTK_DW].[dbo].[d_jarjestaja]

UNION ALL

SELECT [id]
      ,[koulutuksen_jarjestajakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[tilv]
      ,[korvaavakoodi]
      ,[koulutuksen_jarjestajaselite]
      ,[koulutuksen_jarjestajaselite_SV]
      ,[koulutuksen_jarjestajaselite_EN]
      ,[omistajatyyppikoodi]
      ,[omistajatyyppiselite]
      ,[omistajatyyppiselite_SV]
      ,[omistajatyyppiselite_EN]
      ,[koulutuksen_jarjestajan_kielikoodi]
      ,[koulutuksen_jarjestajan_kieliselite]
      ,[koulutuksen_jarjestajan_kieliselite_SV]
      ,[koulutuksen_jarjestajan_kieliselite_EN]
      ,[sijaintikuntakoodi]
      ,[jarjestys]
      ,[jarjestys_omistajatyyppi]
      ,[jarjestys_koulutuksen_jarjestajan_kieli]
      ,[virhetilanne]
      ,[tietolahde]
  FROM [VipunenTK_lisatiedot].[dbo].[jarjestaja]
  WHERE virhetilanne='K'

GO


