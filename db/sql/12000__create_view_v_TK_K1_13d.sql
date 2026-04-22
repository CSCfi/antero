USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_TK_K1_13d] AS 

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
	,[kaste_t2]
	,[iscfibroad2013]
	,[jarj_opisk]
	,[jarj_tutk] = 
		case --hankintakoulutuksen järjestäjä ilman koodia (kaksi irtohavaintoa), jos suoritepäätöksen ulkopuolinen
			when [oppilaitos_tutk] = '1.2.246.562.10.71572806819' then '0858476-8'
			when [oppilaitos_tutk] = '1.2.246.562.10.94828349129' then '0244767-4' 
			else [jarj_tutk] 
		end
	,[oppilaitos_opisk]
	,[oppilaitos_tutk] = nullif([oppilaitos_tutk], 'NULL')
	,[toimipiste_opisk]
	,[toimipiste_tutk]
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
	
FROM [TK_H9098_CSC].[dbo].[TK_K1_13d_sopv_26] t

GO
