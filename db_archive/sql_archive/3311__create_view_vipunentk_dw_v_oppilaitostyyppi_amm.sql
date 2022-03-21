USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_oppilaitostyyppi_amm]    Script Date: 31.3.2020 12:16:01 ******/
DROP VIEW IF EXISTS [dbo].[v_oppilaitostyyppi_amm]
GO

/****** Object:  View [dbo].[v_oppilaitostyyppi_amm]    Script Date: 31.3.2020 12:16:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




/*
truncate table VipunenTK.dbo.d_oppilaitostyyppi_amm
insert into VipunenTK.dbo.d_oppilaitostyyppi_amm
select * from VipunenTK_DW.dbo.v_oppilaitostyyppi_amm
*/


CREATE VIEW [dbo].[v_oppilaitostyyppi_amm] AS
SELECT
	id,
	luotu,
	oppilaitostyyppi_koodi,
	oppilaitostyyppi,
	oppilaitostyyppi_SV,
	oppilaitostyyppi_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM dbo.d_oppilaitostyyppi_amm
UNION ALL
SELECT
	id,
	luotu,
	oppilaitostyyppi_koodi,
	oppilaitostyyppi,
	oppilaitostyyppi_SV,
	oppilaitostyyppi_EN,
	jarjestys,
	virhetilanne,
	poistettu,
	tietolahde,
	kommentti
FROM VipunenTK_lisatiedot..v_oppilaitostyyppi_amm
WHERE virhetilanne='K'








GO


USE [ANTERO]