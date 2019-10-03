USE [VipunenTK_DW]
GO
/****** Object:  View [dbo].[v_patevyyteen_tahtaavat_opinnot_amk]    Script Date: 14.9.2017 13:59:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_patevyyteen_tahtaavat_opinnot_amk]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_patevyyteen_tahtaavat_opinnot_amk] AS  
SELECT [id]
,[alkaa]
,[paattyy]
,[patevyyteen_tahtaavat_opinnot_koodi]
,[patevyyteen_tahtaavat_opinnot]
,[patevyyteen_tahtaavat_opinnot_SV]
,[patevyyteen_tahtaavat_opinnot_EN]
,[jarjestys]
,[tietolahde]
FROM [dbo].[d_patevyyteen_tahtaavat_opinnot_amk]
UNION
SELECT [id]
,[alkaa]
,[paattyy]
,[patevyyteen_tahtaavat_opinnot_koodi]
,[patevyyteen_tahtaavat_opinnot]
,[patevyyteen_tahtaavat_opinnot_SV]
,[patevyyteen_tahtaavat_opinnot_EN]
,[jarjestys]
,[tietolahde]
FROM [VipunenTK_lisatiedot].[dbo].[v_patevyyteen_tahtaavat_opinnot_amk]
WHERE virhetilanne=''K''

' 
GO

USE [ANTERO]