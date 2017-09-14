USE [VipunenTK_lisatiedot]
GO
/****** Object:  View [dbo].[v_patevyyteen_tahtaavat_opinnot_amk]    Script Date: 14.9.2017 14:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_patevyyteen_tahtaavat_opinnot_amk]'))
EXEC dbo.sp_executesql @statement = N'
--select * into VipunenTK_DW.dbo.d_patevyyteen_tahtaavat_opinnot_amk from VipunenTK_lisatiedot.dbo.[v_patevyyteen_tahtaavat_opinnot_amk] where virhetilanne<>''K''

CREATE VIEW [dbo].[v_patevyyteen_tahtaavat_opinnot_amk] AS  
SELECT [id]
,[luotu]
,[alkaa]
,[paattyy]
,[patevyyteen_tahtaavat_opinnot_koodi]
,[patevyyteen_tahtaavat_opinnot]
,[patevyyteen_tahtaavat_opinnot_SV]
,[patevyyteen_tahtaavat_opinnot_EN]
,[jarjestys]
,[virhetilanne]
,[poistettu]
,[tietolahde]
,[kommentti]
FROM [VipunenTK_lisatiedot].[dbo].[patevyyteen_tahtaavat_opinnot_amk]


' 
GO

USE [ANTERO]