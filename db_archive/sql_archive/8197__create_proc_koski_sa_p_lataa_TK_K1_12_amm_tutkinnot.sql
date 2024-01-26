USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TK_K1_12_amm_tutkinnot]    Script Date: 12.10.2023 13:32:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dbo].[p_lataa_TK_K1_12_amm_tutkinnot]
GO



CREATE PROCEDURE [dbo].[p_lataa_TK_K1_12_amm_tutkinnot] @vuosi int = null AS

DECLARE @vuosi2 as int = case when @vuosi is null then year(getdate())-1 else @vuosi end

IF NOT EXISTS (select top 1 suorv from dbo.TK_amm_tutkinnot where suorv=@vuosi2)
BEGIN
	exec dbo.p_lataa_TK_amm_tutkinnot @vuosi2
END

DROP TABLE IF EXISTS dbo.TK_K1_12_amm_tutkinnot

SELECT distinct
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

INTO dbo.TK_K1_12_amm_tutkinnot
FROM dbo.TK_amm_tutkinnot
WHERE toteuma_tutk=1

GO
