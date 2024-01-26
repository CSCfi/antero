USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TK_K1_13_amm_tutkinnon_suorittaneet]    Script Date: 12.10.2023 14:26:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dbo].[p_lataa_TK_K1_13_amm_tutkinnon_suorittaneet]
GO



CREATE PROCEDURE [dbo].[p_lataa_TK_K1_13_amm_tutkinnon_suorittaneet] @vuosi int = null AS

DECLARE @vuosi2 as int = case when @vuosi is null then year(getdate())-1 else @vuosi end

IF NOT EXISTS (select top 1 suorv from dbo.TK_amm_tutkinnot where suorv=@vuosi2)
BEGIN
	exec dbo.p_lataa_TK_amm_tutkinnot @vuosi2
END

DROP TABLE IF EXISTS dbo.TK_K1_13_amm_tutkinnon_suorittaneet

SELECT 
	suorv

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

INTO dbo.TK_K1_13_amm_tutkinnon_suorittaneet
FROM dbo.TK_amm_tutkinnot
WHERE rnk = 1

GO
