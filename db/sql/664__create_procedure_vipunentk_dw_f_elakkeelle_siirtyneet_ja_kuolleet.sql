USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18]    Script Date: 7.7.2017 13:56:49 ******/
DROP PROCEDURE IF EXISTS [dbo].[p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18]    Script Date: 7.7.2017 13:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18] AS' 
END
GO
ALTER PROCEDURE [dbo].[p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18] AS



Delete from VipunenTK.dbo.f_elakkeelle_siirtyneet_ja_kuolleet
Insert into VipunenTK.dbo.f_elakkeelle_siirtyneet_ja_kuolleet
	Select * from [VipunenTK_DW].[dbo].v_f_elakkeelle_siirtyneet_ja_kuolleet


GO
