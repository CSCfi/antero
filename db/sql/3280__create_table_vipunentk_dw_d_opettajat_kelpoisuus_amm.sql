USE [VipunenTK_DW]
GO

drop table if exists dbo.d_opettajat_kelpoisuus_amm
go

select * into dbo.d_opettajat_kelpoisuus_amm
FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_kelpoisuus_amm] WHERE virhetilanne = 'E'
go

USE [ANTERO]