USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_TK_K1_12e] AS 

--UNION ALL

SELECT 
	varainhoitovuosi = right([rahoituskausi],4)+1
	,suoritusvuosi = [Tutkinnon_suoritusvuosi]
	,suorituskausi = [Tutkinnon_suorituskausi]
	,[rahoituskausi]
	,[ikar21]
	,[aikielir1]
	,[maksuton_koulutus]
	,[jarj_opisk]
	,[jarj_tutk] = nullif([jarj_tutk], 'NULL')
	,[tutk]
    ,[pohjakoulutus]
    ,[korkein_pohjakoulutus]
	,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_12e_sopv_26_2025] t

GO
