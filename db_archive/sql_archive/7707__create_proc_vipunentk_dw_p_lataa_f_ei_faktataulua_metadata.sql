use [VipunenTK_DW]
go

CREATE OR ALTER PROCEDURE dbo.p_lataa_f_ei_faktataulua_metadata AS 

/*
Tauluun [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri] lisättävä myös aineistot, joista on kuutio mutta ei faktataulua.
*/

SELECT '' as 'ei_faktataulua'

GO
