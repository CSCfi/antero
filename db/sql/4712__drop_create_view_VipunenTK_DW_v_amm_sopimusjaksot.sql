USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_amm_sopimusjaksot]    Script Date: 5.8.2021 14:17:48 ******/
DROP VIEW IF EXISTS [dbo].[v_amm_sopimusjaksot]
GO

/****** Object:  View [dbo].[v_amm_sopimusjaksot]    Script Date: 5.8.2021 14:17:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_amm_sopimusjaksot] AS
SELECT [id]
    ,[luotu]
    ,[alkaa]
    ,[paattyy]
    ,[koodi]
    ,[selite_fi]
    ,[selite_sv]
    ,[selite_en]
    ,[jarjestys_koodi]
    ,[virhetilanne]
    ,[tietolahde]
    ,[kommentti]
FROM [VipunenTK_DW].[dbo].[d_amm_sopimusjaksot]
UNION ALL
SELECT [id]
    ,[luotu]
    ,[alkaa]
    ,[paattyy]
    ,[koodi]
    ,[selite_fi]
    ,[selite_sv]
    ,[selite_en]
    ,[jarjestys_koodi]
    ,[virhetilanne]
    ,[tietolahde]
    ,[kommentti]
FROM VipunenTK_lisatiedot..[v_amm_sopimusjaksot]
WHERE virhetilanne='K'



GO


