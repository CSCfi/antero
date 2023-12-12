USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_oef_ammatti]    Script Date: 1.11.2023 16:57:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_oef_ammatti]
AS
SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[oef_ammattiryhma1_koodi]
      ,[oef_ammattiryhma1]
      ,[oef_ammattiryhma1_SV]
      ,[oef_ammattiryhma1_EN]
      ,[oef_ammattiryhma2_koodi]
      ,[oef_ammattiryhma2]
      ,[oef_ammattiryhma2_SV]
      ,[oef_ammattiryhma2_EN]
      ,[oef_ammatti_koodi]
      ,[oef_ammatti]
      ,[oef_ammatti_SV]
      ,[oef_ammatti_EN]
      ,[jarjestys_ammattiryhma1]
      ,[jarjestys_ammattiryhma2]
      ,[jarjestys_ammatti]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[oef_ammatti]


GO


