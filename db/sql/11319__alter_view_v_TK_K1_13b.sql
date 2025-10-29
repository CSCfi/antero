USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_TK_K1_13b] AS 

--HUOM. Lisää kohtaan toteuma uudet aineistot ylimmäksi, korvaa kohtaan estimaatti lähdetaulut uusilla.

--estimaatti

SELECT
	generoitu = 1
	,varainhoitovuosi = right([rahoituskausi],4)+2
	,rahoituskausi = concat('01.07.', right([rahoituskausi],4) - 1, ' - ', '30.06.', right([rahoituskausi],4) + 1)
	,tarkastelukausi = concat('01.07.', right([rahoituskausi],4) - 2 + kausi_nro, ' - ', '30.06.', right([rahoituskausi],4) - 1 + kausi_nro)
	,tarkasteluvuosi = Tutkinnon_suoritusvuosi + kausi_nro
	,suorituskausi = concat('01.07.', right([rahoituskausi],4) - 3 + kausi_nro, ' - ', '30.06.', right([rahoituskausi],4) - 2 + kausi_nro)
	,suoritusvuosi = Tutkinnon_suoritusvuosi + kausi_nro - 1
    ,[ikar21]
    ,[aikielir1]
    ,[prioriteetti]
    ,[toteuma_tutk]
    ,[tyov]
    ,[jarj_opisk]
    ,[jarjnimi_opisk]
    ,[jarj_tutk]
    ,[jarjnimi_tutk]
    ,[jarjmaak]
    ,[jarjmaaknimi]
    ,[tutkmaak]
    ,[tutkmaaknimi]
    ,[kaste_t2]
    ,[kaste_t2ni]
    ,[iscfibroad2013]
    ,[kala_t1ni]
    ,[oppis]
    ,[alvv]
    ,[allk]
    ,[rahoitus]
    ,[kustannusryhma]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[suorv_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2_tilv_07]
    ,[amas_tilv_07]
    ,[ptoim1r2_tilv_08]
    ,[amas_tilv_08]
    ,[ptoim1r2_tilv_09]
    ,[amas_tilv_09]
    ,[ptoim1r2_tilv_10]
    ,[amas_tilv_10]
    ,[ptoim1r2_tilv_11]
    ,[amas_tilv_11]
    ,[ptoim1r2_tilv_12]
    ,[amas_tilv_12]
    ,[ptoim1r2_tilvseur_01]
    ,[amas_tilvseur_01]
    ,[ptoim1r2_tilvseur_02]
    ,[amas_tilvseur_02]
    ,[ptoim1r2_tilvseur_03]
    ,[amas_tilvseur_03]
    ,[ptoim1r2_tilvseur_04]
    ,[amas_tilvseur_04]
    ,[ptoim1r2_tilvseur_05]
    ,[amas_tilvseur_05]
    ,[ptoim1r2_tilvseur_06]
    ,[amas_tilvseur_06]
    ,[opisk_kk]
    ,[opisk_syys]
    ,[opisk_tammi]
    ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_13b_sopv_25_2024]
CROSS APPLY (
	select kausi_nro = 1 
	union all
	select 2 
) ca
WHERE right([rahoituskausi],4) < year(getdate()) --viimeisin suorituskausi tuplana, kun alettu estimoida meneillään olevaa rahoituskautta

UNION ALL

SELECT 
	generoitu = 1
	,varainhoitovuosi = right([rahoituskausi],4)+1
	,[rahoituskausi]
	,tarkastelukausi
	,tarkasteluvuosi = Tutkinnon_suoritusvuosi+1
	,suorituskausi = Tutkinnon_suorituskausi
	,suoritusvuosi = Tutkinnon_suoritusvuosi
    ,[ikar21]
    ,[aikielir1]
    ,[prioriteetti]
    ,[toteuma_tutk]
    ,[tyov]
    ,[jarj_opisk]
    ,[jarjnimi_opisk]
    ,[jarj_tutk]
    ,[jarjnimi_tutk]
    ,[jarjmaak]
    ,[jarjmaaknimi]
    ,[tutkmaak]
    ,[tutkmaaknimi]
    ,[kaste_t2]
    ,[kaste_t2ni]
    ,[iscfibroad2013]
    ,[kala_t1ni]
    ,[oppis]
    ,[alvv]
    ,[allk]
    ,[rahoitus]
    ,[kustannusryhma]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[suorv_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2_tilv_07]
    ,[amas_tilv_07]
    ,[ptoim1r2_tilv_08]
    ,[amas_tilv_08]
    ,[ptoim1r2_tilv_09]
    ,[amas_tilv_09]
    ,[ptoim1r2_tilv_10]
    ,[amas_tilv_10]
    ,[ptoim1r2_tilv_11]
    ,[amas_tilv_11]
    ,[ptoim1r2_tilv_12]
    ,[amas_tilv_12]
    ,[ptoim1r2_tilvseur_01]
    ,[amas_tilvseur_01]
    ,[ptoim1r2_tilvseur_02]
    ,[amas_tilvseur_02]
    ,[ptoim1r2_tilvseur_03]
    ,[amas_tilvseur_03]
    ,[ptoim1r2_tilvseur_04]
    ,[amas_tilvseur_04]
    ,[ptoim1r2_tilvseur_05]
    ,[amas_tilvseur_05]
    ,[ptoim1r2_tilvseur_06]
    ,[amas_tilvseur_06]
    ,[opisk_kk]
    ,[opisk_syys]
    ,[opisk_tammi]
    ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_13b_sopv_25_2024] 
WHERE right([rahoituskausi],4) = year(getdate()) --uudempikin suorituskausi vanhalle kaudelle kunnes aletaan estimoida meneillään olevaa rahoituskautta

UNION ALL

SELECT 
	generoitu = 1
	,varainhoitovuosi = right([rahoituskausi],4)+1
	,[rahoituskausi]
	,tarkastelukausi
	,tarkasteluvuosi = Tutkinnon_suoritusvuosi+1
	,suorituskausi = Tutkinnon_suorituskausi
	,suoritusvuosi = Tutkinnon_suoritusvuosi
    ,[ikar21]
    ,[aikielir1]
    ,[prioriteetti]
    ,[toteuma_tutk]
    ,[tyov]
    ,[jarj_opisk]
    ,[jarjnimi_opisk]
    ,[jarj_tutk]
    ,[jarjnimi_tutk]
    ,[jarjmaak]
    ,[jarjmaaknimi]
    ,[tutkmaak]
    ,[tutkmaaknimi]
    ,[kaste_t2]
    ,[kaste_t2ni]
    ,[iscfibroad2013]
    ,[kala_t1ni]
    ,[oppis]
    ,[alvv]
    ,[allk]
    ,[rahoitus]
    ,[kustannusryhma]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[suorv_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2_tilv_07]
    ,[amas_tilv_07]
    ,[ptoim1r2_tilv_08]
    ,[amas_tilv_08]
    ,[ptoim1r2_tilv_09]
    ,[amas_tilv_09]
    ,[ptoim1r2_tilv_10]
    ,[amas_tilv_10]
    ,[ptoim1r2_tilv_11]
    ,[amas_tilv_11]
    ,[ptoim1r2_tilv_12]
    ,[amas_tilv_12]
    ,[ptoim1r2_tilvseur_01]
    ,[amas_tilvseur_01]
    ,[ptoim1r2_tilvseur_02]
    ,[amas_tilvseur_02]
    ,[ptoim1r2_tilvseur_03]
    ,[amas_tilvseur_03]
    ,[ptoim1r2_tilvseur_04]
    ,[amas_tilvseur_04]
    ,[ptoim1r2_tilvseur_05]
    ,[amas_tilvseur_05]
    ,[ptoim1r2_tilvseur_06]
    ,[amas_tilvseur_06]
    ,[opisk_kk]
    ,[opisk_syys]
    ,[opisk_tammi]
    ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_13b_sopv_25_2023] 
WHERE right([rahoituskausi],4) = year(getdate()) --vanhempi suorituskausi mukaan vain kunnes aletaan estimoida meneillään olevaa rahoituskautta


--toteuma

UNION ALL

SELECT
	generoitu = 0
	,varainhoitovuosi = right([rahoituskausi],4)+1
	,[rahoituskausi]
	,tarkastelukausi
	,tarkasteluvuosi = Tutkinnon_suoritusvuosi+1
	,suorituskausi = Tutkinnon_suorituskausi
	,suoritusvuosi = Tutkinnon_suoritusvuosi
    ,[ikar21]
    ,[aikielir1]
    ,[prioriteetti]
    ,[toteuma_tutk]
    ,[tyov]
    ,[jarj_opisk]
    ,[jarjnimi_opisk]
    ,[jarj_tutk]
    ,[jarjnimi_tutk]
    ,[jarjmaak]
    ,[jarjmaaknimi]
    ,[tutkmaak]
    ,[tutkmaaknimi]
    ,[kaste_t2]
    ,[kaste_t2ni]
    ,[iscfibroad2013]
    ,[kala_t1ni]
    ,[oppis]
    ,[alvv]
    ,[allk]
    ,[rahoitus]
    ,[kustannusryhma]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[suorv_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2_tilv_07]
    ,[amas_tilv_07]
    ,[ptoim1r2_tilv_08]
    ,[amas_tilv_08]
    ,[ptoim1r2_tilv_09]
    ,[amas_tilv_09]
    ,[ptoim1r2_tilv_10]
    ,[amas_tilv_10]
    ,[ptoim1r2_tilv_11]
    ,[amas_tilv_11]
    ,[ptoim1r2_tilv_12]
    ,[amas_tilv_12]
    ,[ptoim1r2_tilvseur_01]
    ,[amas_tilvseur_01]
    ,[ptoim1r2_tilvseur_02]
    ,[amas_tilvseur_02]
    ,[ptoim1r2_tilvseur_03]
    ,[amas_tilvseur_03]
    ,[ptoim1r2_tilvseur_04]
    ,[amas_tilvseur_04]
    ,[ptoim1r2_tilvseur_05]
    ,[amas_tilvseur_05]
    ,[ptoim1r2_tilvseur_06]
    ,[amas_tilvseur_06]
    ,[opisk_kk]
    ,[opisk_syys]
    ,[opisk_tammi]
    ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_13b_sopv_25_2024]

UNION ALL

SELECT 
	generoitu = 0
	,varainhoitovuosi = right([rahoituskausi],4)+1
	,[rahoituskausi]
	,tarkastelukausi
	,tarkasteluvuosi = Tutkinnon_suoritusvuosi+1
	,suorituskausi = Tutkinnon_suorituskausi
	,suoritusvuosi = Tutkinnon_suoritusvuosi
    ,[ikar21]
    ,[aikielir1]
    ,[prioriteetti]
    ,[toteuma_tutk]
    ,[tyov]
    ,[jarj_opisk]
    ,[jarjnimi_opisk]
    ,[jarj_tutk]
    ,[jarjnimi_tutk]
    ,[jarjmaak]
    ,[jarjmaaknimi]
    ,[tutkmaak]
    ,[tutkmaaknimi]
    ,[kaste_t2]
    ,[kaste_t2ni]
    ,[iscfibroad2013]
    ,[kala_t1ni]
    ,[oppis]
    ,[alvv]
    ,[allk]
    ,[rahoitus]
    ,[kustannusryhma]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[suorv_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2_tilv_07]
    ,[amas_tilv_07]
    ,[ptoim1r2_tilv_08]
    ,[amas_tilv_08]
    ,[ptoim1r2_tilv_09]
    ,[amas_tilv_09]
    ,[ptoim1r2_tilv_10]
    ,[amas_tilv_10]
    ,[ptoim1r2_tilv_11]
    ,[amas_tilv_11]
    ,[ptoim1r2_tilv_12]
    ,[amas_tilv_12]
    ,[ptoim1r2_tilvseur_01]
    ,[amas_tilvseur_01]
    ,[ptoim1r2_tilvseur_02]
    ,[amas_tilvseur_02]
    ,[ptoim1r2_tilvseur_03]
    ,[amas_tilvseur_03]
    ,[ptoim1r2_tilvseur_04]
    ,[amas_tilvseur_04]
    ,[ptoim1r2_tilvseur_05]
    ,[amas_tilvseur_05]
    ,[ptoim1r2_tilvseur_06]
    ,[amas_tilvseur_06]
    ,[opisk_kk]
    ,[opisk_syys]
    ,[opisk_tammi]
    ,[lkm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_13b_sopv_25_2023]

GO
