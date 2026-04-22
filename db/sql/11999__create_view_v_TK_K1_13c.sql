USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_TK_K1_13c] AS 

--UNION ALL

SELECT 
	varainhoitovuosi = right([rahoituskausi], 4) + 1
	,suoritusvuosi = [Tutkinnon_suoritusvuosi]
	,suorituskausi = [Tutkinnon_suorituskausi]
	,[tilastokausi]
	,[tilastovuosi] = Tutkinnon_suoritusvuosi + 1
	,[rahoituskausi]
	,[ikar21]
	,[aikielir1]
	,[maksuton_koulutus]
	,[prioriteetti]
	,[toteuma_tutk]
	,[tyov]
	,[jarj_opisk]
	,[jarj_tutk]
	,[tutk]
	,[oppis]
	,[alvv]
	,[rahoitus]
	,[kaste_t2_e]
	,[ek_tyollinen]
	,[amase]
	--päätelty sijoittumistieto ei sellaisenaan mitä käytetään
	,jk_tyollinen_2kk = case when [jk_tyoll_opisk_2kk] in ('1', '2') then '1' else '2' end
	,jk_opisk = case when [opisk_syys] = 1 or [opisk_tammi] = 1 then '1' else '2' end
	
	,[lkm]

FROM [TK_H9098_CSC].[dbo].[TK_K1_13c_sopv_26] t

GO
