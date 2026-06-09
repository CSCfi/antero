USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_d_maakunta]    Script Date: 19.1.2026 13.26.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_d_maakunta]
AS
SELECT id, [maakunta_koodi]
      ,[maakunta]
      ,[maakunta_SV]
      ,[maakunta_EN]
      ,[jarjestys_maakunta]
FROM [VipunenTK].[dbo].[d_alueluokitus]
WHERE kunta_koodi = '-1' and maakunta_koodi != '-1'

UNION ALL

SELECT id, [maakunta_koodi]
      ,[maakunta]
      ,[maakunta_SV]
      ,[maakunta_EN]
      ,[jarjestys_maakunta]
FROM [VipunenTK].[dbo].[d_alueluokitus]
WHERE id = -1

GO


