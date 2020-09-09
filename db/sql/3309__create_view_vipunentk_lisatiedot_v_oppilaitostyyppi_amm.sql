USE [VipunenTK_lisatiedot]
GO

/****** Object:  View [dbo].[v_oppilaitostyyppi_amm]    Script Date: 31.3.2020 12:01:17 ******/
DROP VIEW IF EXISTS [dbo].[v_oppilaitostyyppi_amm]
GO

/****** Object:  View [dbo].[v_oppilaitostyyppi_amm]    Script Date: 31.3.2020 12:01:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





/*
truncate table VipunenTK_DW.dbo.d_oppilaitostyyppi_amm
insert into VipunenTK_DW.dbo.d_oppilaitostyyppi_amm
select * from [VipunenTK_lisatiedot].[dbo].[v_oppilaitostyyppi_amm]
*/



CREATE VIEW [dbo].[v_oppilaitostyyppi_amm] AS
SELECT 

	[id]
	,[luotu]
	,[oppilaitostyyppi_koodi]
	,[oppilaitostyyppi]
	,[oppilaitostyyppi_SV]
	,[oppilaitostyyppi_EN]
	,[jarjestys]
	,[virhetilanne]
	,[poistettu]
	,[tietolahde]
	,[kommentti]


FROM [VipunenTK_lisatiedot].[dbo].[oppilaitostyyppi_amm]
--WHERE virhetilanne = 'E'









GO


USE [ANTERO]