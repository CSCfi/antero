USE [VipunenTK_lisatiedot]
GO
/****** Object:  View [dbo].[v_aidinkieli_versio5]    Script Date: 9.3.2018 9:08:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aidinkieli_versio5]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_aidinkieli_versio5] AS
SELECT
	id,
	luotu,
	aidinkieli_versio5_koodi,
	aidinkieli_versio5,
	aidinkieli_versio5_SV,
	aidinkieli_versio5_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot.dbo.aidinkieli_versio5


' 
GO
USE [ANTERO]