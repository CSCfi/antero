USE [VipunenTK_lisatiedot]
GO

/****** Object:  StoredProcedure [dbo].[lataa_jarjestajatiedot]    Script Date: 14.1.2026 17.08.36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














CREATE OR ALTER PROCEDURE [dbo].[lataa_jarjestajatiedot] AS

DELETE FROM  [VipunenTK_lisatiedot].[dbo].[jarjestaja] WHERE id > -1;

INSERT INTO [VipunenTK_lisatiedot].[dbo].[jarjestaja]
SELECT
       row_number() OVER(ORDER BY (SELECT NULL)) as id
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
	  ,[virhetilanne] = 'E'
      ,[tietolahde]
FROM [Vipunen_koodisto].[dbo].[v_koulutuksen_jarjestaja];

GO


