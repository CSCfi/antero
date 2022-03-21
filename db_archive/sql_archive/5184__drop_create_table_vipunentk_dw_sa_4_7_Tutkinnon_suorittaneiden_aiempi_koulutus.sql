USE [VipunenTK_SA]
GO

Drop table [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
Select top 0 * into [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus] 
FROM VipunenTK_SA.[dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]

GO