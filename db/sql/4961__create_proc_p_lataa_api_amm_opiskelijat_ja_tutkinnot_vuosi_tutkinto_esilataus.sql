USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto_esilataus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto_esilataus] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto_esilataus] AS

TRUNCATE TABLE [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto];

INSERT INTO [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]

SELECT 
	ROW_NUMBER() OVER(ORDER BY f.tilastovuosi
							  ,d1.koulutusluokitus_fi
							  ,d2.organisaatio_fi) as defaultorder
	,f.tilastovuosi
	,d1.koulutusluokitus_fi as tutkinto
	,d2.organisaatio_fi as koulutuksenJarjestaja
	,count(distinct case when f.uudet_opiskelijat = 1 then f.oppija_oid end) as uudetOpiskelijatLkm
	,count(distinct case when f.opiskelijat = 1 then f.oppija_oid end) as opiskelijatLkm
	,count(distinct case when f.tutkinnot = 1 then f.oppija_oid end) as tutkinnonSuorittaneetLkm 
	,d2.organisaatio_koodi as koodiKoulutuksenJarjestaja
	,d1.koulutusluokitus_koodi as koodiTutkinto
FROM (
	SELECT distinct
		tilastovuosi
		,d_koulutusluokitus_id
		,d_organisaatioluokitus_jarj_id
		,oppija_oid
		,opiskelijat = 1
		,uudet_opiskelijat = uusi
		,tutkinnot = 0
	FROM dw.f_koski_amm_opiskelijat

	UNION ALL

	SELECT distinct
		tilastovuosi
		,d_koulutusluokitus_id
		,d_organisaatioluokitus_jarj_id
		,oppija_oid
		,opiskelijat = 0
		,uudet_opiskelijat = 0
		,tutkinnot = 1
	FROM dw.f_koski_amm_tutkinnot ) f

LEFT JOIN dw.d_koulutusluokitus d1 ON d1.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_organisaatioluokitus d2 ON d2.id = f.d_organisaatioluokitus_jarj_id
GROUP BY 
f.tilastovuosi, 
d1.koulutusluokitus_fi, 
d2.organisaatio_fi,
d2.organisaatio_koodi,
d1.koulutusluokitus_koodi