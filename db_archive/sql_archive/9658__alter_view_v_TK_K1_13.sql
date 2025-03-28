USE [ANTERO]
GO

/****** Object:  View [dw].[v_TK_K1_13]    Script Date: 28.2.2024 10:45:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_TK_K1_13] AS 

SELECT [tilv]
    ,[aineisto]
    ,[ika21] = [ikar21]
    ,[prioriteetti]
    ,[toteuma_tutk]
    ,[tyov]
    ,[jarj_opisk]
    ,[jarjnimi_opisk]
    ,[jarj_tutk] = jarj_opisk --Poimintaa muokattu sopv22, mutta ohjataan toistaiseksi rahoituksen saaja yhä tähän, jotta jatkolatauksessa käsittelyt toimii oikein päin. JS 28.2.2024
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
    ,[tutklaja]
    ,[alvv]
    ,[allk]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2h] = null
    ,[kaste_t2_avh] = null
    ,[kaste_t2ni_avh] = null
    ,[amash] = null
    ,[ptoim1r2_tilvseur]
    ,[maassaolo_tilvseur]
    ,[amas_tilvseur]
    ,[kaste_t2_tilvseur]
    ,[kaste_t2ni_tilvseur]
    ,[iscfibroad2013_tilvseur]
    ,[kala_t1ni_tilvseur]
    ,[tutk_suor_1]
    ,[tutk_suor_2]
    ,[tutk_suor_3]
    ,[tutk_suor_4]
    ,[tutk_osia_suor_1]
    ,[tutk_osia_suor_2]
    ,[tutk_osia_suor_3]
    ,[tutk_osia_suor_4]
    ,[tutk_suor_5]
    ,[tutk_suor_6]
    ,[tutk_suor_7]
    ,[tutk_suor_8]
    ,[tutk_osia_suor_5]
    ,[tutk_osia_suor_6]
    ,[tutk_osia_suor_7]
    ,[tutk_osia_suor_8]
    ,[lkm]
    ,[luontipvm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_13_sopv_24]

UNION ALL

SELECT [tilv]
    ,[aineisto]
    ,[ika21] = [ikar21]
    ,[prioriteetti]
    ,[toteuma_tutk]
    ,[tyov]
    ,[jarj_opisk]
    ,[jarjnimi_opisk]
    ,[jarj_tutk] = jarj_opisk --Poimintaa muokattu sopv22, mutta ohjataan toistaiseksi rahoituksen saaja yhä tähän, jotta jatkolatauksessa käsittelyt toimii oikein päin. JS 28.2.2024
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
    ,[tutklaja]
    ,[alvv]
    ,[allk]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2h] = null
    ,[kaste_t2_avh]
    ,[kaste_t2ni_avh]
    ,[amash] = null
    ,[ptoim1r2_tilvseur]
    ,[maassaolo_tilvseur]
    ,[amas_tilvseur]
    ,[kaste_t2_tilvseur]
    ,[kaste_t2ni_tilvseur]
    ,[iscfibroad2013_tilvseur]
    ,[kala_t1ni_tilvseur]
    ,[tutk_suor_1]
    ,[tutk_suor_2]
    ,[tutk_suor_3]
    ,[tutk_suor_4]
    ,[tutk_osia_suor_1]
    ,[tutk_osia_suor_2]
    ,[tutk_osia_suor_3]
    ,[tutk_osia_suor_4]
    ,[tutk_suor_5]
    ,[tutk_suor_6]
    ,[tutk_suor_7]
    ,[tutk_suor_8]
    ,[tutk_osia_suor_5]
    ,[tutk_osia_suor_6]
    ,[tutk_osia_suor_7]
    ,[tutk_osia_suor_8]
    ,[lkm]
    ,[luontipvm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_13_sopv_23]

UNION ALL

SELECT [tilv]
    ,[aineisto]
    ,[ika21] = [ikar21]
    ,[prioriteetti]
    ,[toteuma_tutk]
    ,[tyov]
    ,[jarj_opisk]
    ,[jarjnimi_opisk]
    ,[jarj_tutk] = jarj_opisk --Poimintaa muokattu sopv22, mutta ohjataan toistaiseksi rahoituksen saaja yhä tähän, jotta jatkolatauksessa käsittelyt toimii oikein päin. JS 28.2.2024
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
    ,[tutklaja]
    ,[alvv]
    ,[allk]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2h]
    ,[kaste_t2_avh]
    ,[kaste_t2ni_avh]
    ,[amash]
    ,[ptoim1r2_tilvseur]
    ,[maassaolo_tilvseur]
    ,[amas_tilvseur]
    ,[kaste_t2_tilvseur]
    ,[kaste_t2ni_tilvseur]
    ,[iscfibroad2013_tilvseur]
    ,[kala_t1ni_tilvseur]
    ,[tutk_suor_1]
    ,[tutk_suor_2]
    ,[tutk_suor_3]
    ,[tutk_suor_4]
    ,[tutk_osia_suor_1]
    ,[tutk_osia_suor_2]
    ,[tutk_osia_suor_3]
    ,[tutk_osia_suor_4]
    ,[tutk_suor_5]
    ,[tutk_suor_6]
    ,[tutk_suor_7]
    ,[tutk_suor_8]
    ,[tutk_osia_suor_5]
    ,[tutk_osia_suor_6]
    ,[tutk_osia_suor_7]
    ,[tutk_osia_suor_8]
    ,[lkm]
    ,[luontipvm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_13_sopv_22]

UNION ALL

SELECT [tilv]
    ,[aineisto]
    ,[ika21]
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
    ,[tutklaja]
    ,[alvv]
    ,[allk]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2h]
    ,[kaste_t2_avh]
    ,[kaste_t2ni_avh]
    ,[amash]
    ,[ptoim1r2_tilvseur]
    ,[maassaolo_tilvseur]
    ,[amas_tilvseur]
    ,[kaste_t2_tilvseur]
    ,[kaste_t2ni_tilvseur]
    ,[iscfibroad2013_tilvseur]
    ,[kala_t1ni_tilvseur]
    ,[tutk_suor_1]
    ,[tutk_suor_2]
    ,[tutk_suor_3]
    ,[tutk_suor_4]
    ,[tutk_osia_suor_1]
    ,[tutk_osia_suor_2]
    ,[tutk_osia_suor_3]
    ,[tutk_osia_suor_4]
    ,[tutk_suor_5]
    ,[tutk_suor_6]
    ,[tutk_suor_7]
    ,[tutk_suor_8]
    ,[tutk_osia_suor_5]
    ,[tutk_osia_suor_6]
    ,[tutk_osia_suor_7]
    ,[tutk_osia_suor_8]
    ,[lkm]
    ,[luontipvm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_13_sopv_21]

UNION ALL

SELECT [tilv]
    ,[aineisto]
    ,[ika21] = null
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
    ,[tutklaja]
    ,[alvv]
    ,[allk]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2h]
    ,[kaste_t2_avh]
    ,[kaste_t2ni_avh]
    ,[amash]
    ,[ptoim1r2_tilvseur]
    ,[maassaolo_tilvseur]
    ,[amas_tilvseur]
    ,[kaste_t2_tilvseur]
    ,[kaste_t2ni_tilvseur]
    ,[iscfibroad2013_tilvseur]
    ,[kala_t1ni_tilvseur]
    ,[tutk_suor_1]
    ,[tutk_suor_2]
    ,[tutk_suor_3]
    ,[tutk_suor_4]
    ,[tutk_osia_suor_1]
    ,[tutk_osia_suor_2]
    ,[tutk_osia_suor_3]
    ,[tutk_osia_suor_4]
    ,[tutk_suor_5]
    ,[tutk_suor_6]
    ,[tutk_suor_7]
    ,[tutk_suor_8]
    ,[tutk_osia_suor_5]
    ,[tutk_osia_suor_6]
    ,[tutk_osia_suor_7]
    ,[tutk_osia_suor_8]
    ,[lkm]
    ,[luontipvm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_13_sopv_20]
WHERE toteuma_tutk = 1 --myös (raportin) tilastovuosien 2017-18 osalta vain pisteissä huomioitavat eli tuolloin koko tutkinnot

UNION ALL

SELECT [tilv]
    ,[aineisto]
    ,[ika21] = null
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
    ,[tutklaja]
    ,[alvv]
    ,[allk]
    ,[kaste_t2_e]
    ,[kaste_t2ni_e]
    ,[ptoim1r2e]
    ,[kaste_t2_evj]
    ,[kaste_t2ni_evj]
    ,[amase]
    ,[ptoim1r2h]
    ,[kaste_t2_avh]
    ,[kaste_t2ni_avh]
    ,[amash]
    ,[ptoim1r2_tilvseur]
    ,[maassaolo_tilvseur]
    ,[amas_tilvseur]
    ,[kaste_t2_tilvseur]
    ,[kaste_t2ni_tilvseur]
    ,[iscfibroad2013_tilvseur]
    ,[kala_t1ni_tilvseur]
    ,[tutk_suor_1]
    ,[tutk_suor_2]
    ,[tutk_suor_3]
    ,[tutk_suor_4]
    ,[tutk_osia_suor_1]
    ,[tutk_osia_suor_2]
    ,[tutk_osia_suor_3]
    ,[tutk_osia_suor_4]
    ,[tutk_suor_5]
    ,[tutk_suor_6]
    ,[tutk_suor_7]
    ,[tutk_suor_8]
    ,[tutk_osia_suor_5]
    ,[tutk_osia_suor_6]
    ,[tutk_osia_suor_7]
    ,[tutk_osia_suor_8]
    ,[lkm]
    ,[luontipvm]
FROM [TK_H9098_CSC].[dbo].[TK_K1_13_sopv_19]
WHERE toteuma_tutk = 1 --myös (raportin) tilastovuosien 2017-18 osalta vain pisteissä huomioitavat eli tuolloin koko tutkinnot

GO
