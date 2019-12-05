USE [VipunenTK_DW]
GO

Drop table [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
Select top 0 * into [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh] 
FROM [VipunenTK_SA].[dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
GO
USE [ANTERO]