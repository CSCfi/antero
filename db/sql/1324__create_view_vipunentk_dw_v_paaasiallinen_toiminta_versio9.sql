USE [VipunenTK_DW]
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta_versio9]    Script Date: 9.3.2018 9:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_paaasiallinen_toiminta_versio9]'))
EXEC dbo.sp_executesql @statement = N'
/*
Drop table VipunenTK.dbo.d_paaasiallinen_toiminta_versio9
Select * into VipunenTK.dbo.d_paaasiallinen_toiminta_versio9 from VipunenTK_DW.[dbo].[v_paaasiallinen_toiminta_versio9]
Alter table VipunenTK.dbo.d_paaasiallinen_toiminta_versio9 add primary key (Id)
Truncate table VipunenTK.dbo.d_paaasiallinen_toiminta_versio9
Insert into VipunenTK.dbo.d_paaasiallinen_toiminta_versio9
  Select * from VipunenTK_DW.[dbo].[v_paaasiallinen_toiminta_versio9]
*/

CREATE VIEW [dbo].[v_paaasiallinen_toiminta_versio9] AS
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	paaasiallinen_toiminta_versio9_koodi,
	paaasiallinen_toiminta_versio9,
	paaasiallinen_toiminta_versio9_SV,
	paaasiallinen_toiminta_versio9_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM dbo.d_paaasiallinen_toiminta_versio9
UNION ALL
SELECT
	id,
	luotu,
	alkaa,
	paattyy,
	paaasiallinen_toiminta_versio9_koodi,
	paaasiallinen_toiminta_versio9,
	paaasiallinen_toiminta_versio9_SV,
	paaasiallinen_toiminta_versio9_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot..v_paaasiallinen_toiminta_versio9
WHERE virhetilanne=''K''


' 
GO
USE [ANTERO]