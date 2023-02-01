USE [VipunenTK_SA]
GO

drop table if exists VipunenTK_DW.dbo.sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan
go

/****** Object:  View [dbo].[v_sa_4_2d_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan]    Script Date: 17.1.2023 20:30:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

select top 0 * 
into VipunenTK_DW.dbo.sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan 
from [v_sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan]
go