USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TK_K1_13_amm_tutkinnon_suorittaneet_rahoituskausittain]    Script Date: 8.2.2024 16:29:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_TK_K1_13_amm_tutkinnon_suorittaneet_rahoituskausittain] @rahoituskaudenPaattymisvuosi int = null AS

DECLARE @vuosi2 as int = case when @rahoituskaudenPaattymisvuosi is null then year(getdate()) else @rahoituskaudenPaattymisvuosi end

IF NOT EXISTS (select top 1 suorv from dbo.TK_amm_tutkinnot_rahoituskausittain where suorv=@vuosi2 and rnk=1)
BEGIN
	exec dbo.p_lataa_TK_amm_tutkinnot_rahoituskausittain @vuosi2
END

DROP TABLE IF EXISTS dbo.TK_K1_13_amm_tutkinnon_suorittaneet_rahoituskausittain

SELECT 
	rahoituskausi
	,suorv

	,master_oppija
	,oppija
	,opiskeluoikeus
	,aikielir1
	,alvv
	,alkk

	,jarj_opisk
	,jarjnimi_opisk
	,jarj_tutk
	,jarjnimi_tutk
	
	,tavoite
	,toteuma_tutk
	,koulk
	,oppis
	,kustannusryhma
	,rahoitus
	,tyov

INTO dbo.TK_K1_13_amm_tutkinnon_suorittaneet_rahoituskausittain
FROM dbo.TK_amm_tutkinnot_rahoituskausittain
WHERE rnk = 1

GO
