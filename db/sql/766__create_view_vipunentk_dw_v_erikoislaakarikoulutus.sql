USE [VipunenTK_DW]
GO
/****** Object:  View [dbo].[v_erikoislaakarikoulutus]    Script Date: 14.9.2017 13:58:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_erikoislaakarikoulutus]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_erikoislaakarikoulutus] AS  
SELECT [id]
,[alkaa]
,[paattyy]
,[erikoislaakarikoulutus_koodi]
,[erikoislaakarikoulutus]
,[erikoislaakarikoulutus_SV]
,[erikoislaakarikoulutus_EN]
,[jarjestys]
,[tietolahde]
FROM [dbo].[d_erikoislaakarikoulutus]
UNION
SELECT [id]
,[alkaa]
,[paattyy]
,[erikoislaakarikoulutus_koodi]
,[erikoislaakarikoulutus]
,[erikoislaakarikoulutus_SV]
,[erikoislaakarikoulutus_EN]
,[jarjestys]
,[tietolahde]
FROM [VipunenTK_lisatiedot].[dbo].[v_erikoislaakarikoulutus]
WHERE virhetilanne=''K''

' 
GO

USE [ANTERO]