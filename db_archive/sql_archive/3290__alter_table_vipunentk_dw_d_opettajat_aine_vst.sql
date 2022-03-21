USE [VipunenTK_DW]
GO

drop table if exists dbo.d_opettajat_aine_vst
go

select * into dbo.d_opettajat_aine_vst
FROM VipunenTK_lisatiedot.[dbo].[v_opettajat_aine_vst] WHERE virhetilanne = 'E'
go

USE [ANTERO]