USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_1_24_Jatkuva_oppiminen_tutk_joht_tai_kurssikoul_osallistuneet]    Script Date: 24.4.2023 11:28:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE OR ALTER VIEW [dbo].[v_sa_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet] AS

SELECT [tilv]
	,[ikar6]
	,[sp]
	,[tilvaskunryh]
	,[tutk]
	,[eitutk]
	,[ammko]
	,[heko]
	,[muuko]
	,[kaste_t0]
	,[soseh]
	,[ptoim1r9h]
	,[psaajah]
	,[painoaku]
	,[aineisto] = '1.23'
FROM [TK_H9098_CSC].[dbo].[TK_K1_23_sopv_22]

--UNION ALL

GO


