USE [VipunenTK_lisatiedot]
GO

DROP VIEW IF EXISTS [dbo].[v_opettajat_kelpoisuus_amm]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[v_opettajat_kelpoisuus_amm] AS
SELECT 

	[id]
	,[alkaa]
    ,[paattyy]
    ,[kelpoisuus_koodi]
    ,[kelpoisuus]
    ,[kelpoisuus_SV]
    ,[kelpoisuus_EN]
    ,[jarjestys]
    ,[virhetilanne]
    ,[poistettu]
    ,[tietolahde]
    ,[luotu]
    ,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[opettajat_kelpoisuus_amm]
--WHERE virhetilanne = 'E'









GO


USE [ANTERO]