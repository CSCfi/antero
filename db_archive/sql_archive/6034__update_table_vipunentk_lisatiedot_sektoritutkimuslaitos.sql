/****** Script for SelectTopNRows command from SSMS  ******/

use VipunenTK_lisatiedot
go

update [dbo].[sektoritutkimuslaitos]
set [sektoritutkimuslaitos] = 'Ruokavirasto'
    ,[sektoritutkimuslaitos_SV] = 'Livsmedelsverket'
    ,[sektoritutkimuslaitos_EN] = 'Finnish Food Authority'
where [sektoritutkimuslaitos_avain] = '00228'
