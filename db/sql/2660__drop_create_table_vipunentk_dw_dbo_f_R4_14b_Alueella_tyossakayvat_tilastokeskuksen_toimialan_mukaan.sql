USE [VipunenTK_SA]
GO

DROP TABLE [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan];
GO

SELECT TOP 0 * INTO [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
FROM [VipunenTK_SA].[dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan];
GO

USE [ANTERO]