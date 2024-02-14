USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet]    Script Date: 19.12.2023 21:43:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_sa_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet] AS

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

UNION ALL

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
FROM [TK_H9098_CSC].[dbo].[TK_K1_23_sopv_23]

GO
