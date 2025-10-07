USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[p_lataa_TK_K1_12_amm_tutkinnot_rahoituskausittain] AS

--ks. HUOM, päivitä tarvittaessa vuodet

DROP TABLE IF EXISTS dbo.TK_K1_12_amm_tutkinnot_rahoituskausittain

SELECT 
	[rahoituskausi]
    --,[tarkastelukausi]
    --,[tarkasteluvuosi]
    ,[tutkinnon_suorituskausi]
    ,[tutkinnon_suoritusvuosi]
    ,[master_oppija]
    ,[opiskeluoikeus]
    ,[alkamispaiva]
    ,[ikar20]
    ,[aikielir1]
    --,[pvm]
    --,[maksuton]
    --,[oikeutta_maksuttomuuteen_pidennetty]
    ,[maksuttomuuden_piirissa]
    ,[maksuttomuuden_piirissa_simulointi]
    --,[alvv]
    --,[allk]
    ,[jarj_opisk]
    ,[jarjnimi_opisk]
    ,[jarj_tutk]
    ,[jarjnimi_tutk]
    ,[oppilaitos_opisk]
    ,[oppilaitos_tutk]
    ,[toimipiste_opisk]
    ,[toimipiste_tutk]
    ,[toteuma_tutk]
    ,[koulk]
    ,[oppis]
    ,[kustannusryhma]
    ,[rahoitus]
    ,[tyov]
    --,[rnk]
	
	--metatiedot; ei poimintaan
	,username = SUSER_NAME()
	,loadtime = GETDATE()
	
INTO dbo.TK_K1_12_amm_tutkinnot_rahoituskausittain

FROM [dbo].[TK_amm_tutkinnot_rahoituskausittain]

WHERE toteuma_tutk=1
AND rahoituskausi = '01.07.2023 - 30.06.2025' --HUOM. vain tuorein rahoituskausi
AND tutkinnon_suorituskausi != '01.07.2022 - 30.06.2023' --HUOM. ei rahoituskautta edeltävää suorituskautta

GO
