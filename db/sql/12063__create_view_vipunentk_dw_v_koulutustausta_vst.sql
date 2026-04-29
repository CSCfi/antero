USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_koulutustausta_vst]    Script Date: 29.4.2026 14.08.37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER  VIEW [dbo].[v_koulutustausta_vst] AS

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[koulutustausta_koodi]
      ,[koulutustausta]
      ,[koulutustausta_SV]
      ,[koulutustausta_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_DW].[dbo].[d_koulutustausta_vst]

UNION ALL

SELECT [id]
      ,[luotu]
      ,[alkaa]
      ,[paattyy]
      ,[koulutustausta_koodi]
      ,[koulutustausta]
      ,[koulutustausta_SV]
      ,[koulutustausta_EN]
      ,[jarjestys]
      ,[virhetilanne]
      ,[poistettu]
      ,[tietolahde]
      ,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[v_koulutustausta_vst]
WHERE virhetilanne = 'K'

GO


