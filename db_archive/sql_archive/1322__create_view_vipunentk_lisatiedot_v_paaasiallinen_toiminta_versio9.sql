USE [VipunenTK_lisatiedot]
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta_versio9]    Script Date: 9.3.2018 9:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_paaasiallinen_toiminta_versio9]'))
EXEC dbo.sp_executesql @statement = N'
/*
Drop table VipunenTK_DW.dbo.d_paaasiallinen_toiminta_versio9 
Select * into VipunenTK_DW.dbo.d_paaasiallinen_toiminta_versio9 from VipunenTK_lisatiedot.dbo.[v_paaasiallinen_toiminta_versio9] where virhetilanne<>''K''
Truncate table VipunenTK_DW.dbo.d_paaasiallinen_toiminta_versio9
Insert into VipunenTK_DW.dbo.d_paaasiallinen_toiminta_versio9
Select * from VipunenTK_lisatiedot.dbo.[v_paaasiallinen_toiminta_versio9] where virhetilanne<>''K''
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
FROM VipunenTK_lisatiedot.dbo.paaasiallinen_toiminta_versio9


' 
GO
USE [ANTERO]