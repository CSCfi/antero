USE [VipunenTK_lisatiedot]
GO
/****** Object:  View [dbo].[v_erikoislaakarikoulutus]    Script Date: 14.9.2017 14:27:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_erikoislaakarikoulutus]'))
EXEC dbo.sp_executesql @statement = N'
-- select * into VipunenTK_DW.dbo.d_erikoislaakarikoulutus from VipunenTK_lisatiedot.dbo.[v_erikoislaakarikoulutus] where virhetilanne<>''K''

CREATE VIEW [dbo].[v_erikoislaakarikoulutus] AS  
SELECT [id]
,[luotu]
,[alkaa]
,[paattyy]
,[erikoislaakarikoulutus_koodi]
,[erikoislaakarikoulutus]
,[erikoislaakarikoulutus_SV]
,[erikoislaakarikoulutus_EN]
,[jarjestys]
,[virhetilanne]
,[poistettu]
,[tietolahde]
,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[erikoislaakarikoulutus]


' 
GO

USE [ANTERO]