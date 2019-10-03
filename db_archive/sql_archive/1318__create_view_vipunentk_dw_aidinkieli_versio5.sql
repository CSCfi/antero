USE [VipunenTK_DW]
GO
/****** Object:  View [dbo].[v_aidinkieli_versio5]    Script Date: 9.3.2018 9:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_aidinkieli_versio5]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[v_aidinkieli_versio5] AS
/*
truncate table VipunenTK.dbo.d_aidinkieli_versio5
insert into VipunenTK.dbo.d_aidinkieli_versio5
select * from [VipunenTK_DW].dbo.[v_aidinkieli_versio5]

drop table VipunenTK.dbo.d_aidinkieli_versio5
select * into VipunenTK.dbo.d_aidinkieli_versio5 from [VipunenTK_DW].dbo.[v_aidinkieli_versio5]
*/

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
FROM dbo.d_aidinkieli_versio5
UNION ALL
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
FROM VipunenTK_lisatiedot..v_aidinkieli_versio5
WHERE virhetilanne=''K''


' 
GO
USE [ANTERO]