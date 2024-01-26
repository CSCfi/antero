USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_kustannuskysely]    Script Date: 6.2.2023 16:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_kustannuskysely] AS


DECLARE @maxTilv int = (SELECT max(tilastovuosi) FROM dw.f_amos_opiskelijavuodet_painotetut)

DROP TABLE IF EXISTS [dw].[f_amos_opiskelijavuodet_painotetut_kustannuskysely]

SELECT  
	tilastovuosi
	,d_organisaatioluokitus_jarj_id = case when year(coalesce(d2.voimaan_alkaen,'1900-01-01')) > f.tilastovuosi then f.d_organisaatioluokitus_jarj_hist_id else f.d_organisaatioluokitus_jarj_id end
	,d_koulutusluokitus_id
	,d_kustannusryhma_id
	,d_kytkin_oppisopimuskoulutus_id
	,d_kytkin_vankilaopetus_id
	,d_suorituksen_tyyppi_id
	,[opiskelijavuodet_painottamaton] = [opiskelijavuodet_painottamaton] + (case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end)
	,[opiskelijavuodet_painotettu] = [opiskelijavuodet_painotettu_yhteensa] 
INTO [dw].[f_amos_opiskelijavuodet_painotetut_kustannuskysely]
FROM dw.f_amos_opiskelijavuodet_painotetut f
JOIN dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_jarj_hist_id
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d2 on d2.ytunnus_avain = d1.organisaatio_koodi
WHERE tilastovuosi = @maxTilv-1

