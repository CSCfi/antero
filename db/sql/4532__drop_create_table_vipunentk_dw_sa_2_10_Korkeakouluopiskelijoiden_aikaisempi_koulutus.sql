USE [VipunenTK_SA]
GO

DROP TABLE IF EXISTS [VipunenTK_DW].[dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]
GO

SELECT TOP 0 * INTO [VipunenTK_DW].[dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]
FROM [VipunenTK_SA].[dbo].[v_sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]
GO