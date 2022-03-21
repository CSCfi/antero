USE [VipunenTK_lisatiedot]
GO

UPDATE [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto]
SET aineisto_avain = 'TK_K2_3h'
WHERE aineisto_avain = 'TK_2_3h';

UPDATE [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri]
SET aineisto_avain = 'TK_K2_3h'
WHERE aineisto_avain = 'TK_2_3h';

UPDATE [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio]
SET aineisto_avain = 'TK_K2_3h'
WHERE aineisto_avain = 'TK_2_3h';

GO
USE [ANTERO]
