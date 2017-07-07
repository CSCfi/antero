USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_MKH_f_K3_16]    Script Date: 7.7.2017 13:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18] AS



Delete from VipunenTK.dbo.f_elakkeelle_siirtyneet_ja_kuolleet
Insert into VipunenTK.dbo.f_elakkeelle_siirtyneet_ja_kuolleet
	Select * from [VipunenTK_DW].[dbo].v_f_elakkeelle_siirtyneet_ja_kuolleet

