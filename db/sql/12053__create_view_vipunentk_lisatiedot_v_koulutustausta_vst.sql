USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_koulutustausta_vst]    Script Date: 29.4.2026 14.06.55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER VIEW [dbo].[v_koulutustausta_vst] AS

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
FROM [VipunenTK_lisatiedot].[dbo].[koulutustausta_vst]

GO


