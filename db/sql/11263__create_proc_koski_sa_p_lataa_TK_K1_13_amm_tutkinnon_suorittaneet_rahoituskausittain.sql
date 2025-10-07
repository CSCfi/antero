USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[p_lataa_TK_K1_13_amm_tutkinnon_suorittaneet_rahoituskausittain] AS

DROP TABLE IF EXISTS dbo.TK_K1_13_amm_tutkinnon_suorittaneet_rahoituskausittain

SELECT 
	[rahoituskausi]
    ,[tarkastelukausi]
    ,[tarkasteluvuosi]
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
    ,[alvv]
    ,[allk]
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
	
INTO dbo.TK_K1_13_amm_tutkinnon_suorittaneet_rahoituskausittain

FROM [dbo].[TK_amm_tutkinnot_rahoituskausittain]

WHERE rnk=1
AND rahoituskausi = '01.07.2023 - 30.06.2025' --HUOM. vain tuorein rahoituskausi
AND tarkastelukausi != '01.07.2025 - 30.06.2026' --HUOM. ei rahoituskauden jälkeistä tarkastelukautta

GO
