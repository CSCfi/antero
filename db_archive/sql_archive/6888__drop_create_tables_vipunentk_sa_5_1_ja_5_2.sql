USE [VipunenTK_SA]
GO

Drop table [VipunenTK_DW].[dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]
Select top 0 * into [VipunenTK_DW].[dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain] 
FROM VipunenTK_SA.[dbo].[v_sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]

Drop table [VipunenTK_DW].[dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
Select top 0 * into [VipunenTK_DW].[dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain] 
FROM VipunenTK_SA.[dbo].[v_sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
