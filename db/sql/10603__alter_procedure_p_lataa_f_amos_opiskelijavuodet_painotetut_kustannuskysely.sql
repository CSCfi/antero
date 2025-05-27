USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_kustannuskysely]    Script Date: 25.2.2025 16.12.36 ******/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_kustannuskysely] AS

/*
Tämän proseduurin avulla ladataan faktataulu f_amos_opiskelijavuodet_painotetut_kustannuskysely jäädytyskannassa. 
Taulusta saadaan tilastovuoden opiskelijavuosi-tiedot dwi*vipuarch22 Antero_master kannan näkymiin 
v_amos_opiskelijavuodet_painotetut_kustannuskysely_jarjestajakohtainen ja v_amos_opiskelijavuodet_painotetut_kustannuskysely_seurantaryhmat 
sekä vastaaviin kustannuskysely järjestäjäkohtainen ja seurantaryhmä raportteihin. 
Huom. fuusion jälkeen vanhalle järjestäjälle tulevia opiskelijavuosia ei yhdistetä kustannuskysely puolella uudelle järjestäjälle. 
*/

DECLARE @maxTilv int = CAST(right(db_name(),4) AS int) -- Muutettu hakemaan maxTilv jäädytyskannan nimestä, jossa oikea vuosi aina esiintyy. JK 25.2.2025

DROP TABLE IF EXISTS [dw].[f_amos_opiskelijavuodet_painotetut_kustannuskysely]

SELECT  
	tilastovuosi
	,d_organisaatioluokitus_jarj_id = case when year(coalesce(d2.voimaan_alkaen,'1900-01-01')) > f.tilastovuosi then f.d_organisaatioluokitus_jarj_hist_id else f.d_organisaatioluokitus_jarj_id end
	,d_koulutusluokitus_id
	,d_kustannusryhma_id
	,d_kytkin_oppisopimuskoulutus_id
	,d_kytkin_vankilaopetus_id
	,d_suorituksen_tyyppi_id
	-- Lisätty vuoden 2025 jäädytystä varten hylkäämisperusteiden samanaikaisten uudet koodit 10-12. JK 25.2.2025
	,[opiskelijavuodet_painottamaton] = [opiskelijavuodet_painottamaton] + (case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in ('2','3','4','10','11','12') then opiskelijavuodet_hylatyt else 0 end) 
	,[opiskelijavuodet_painotettu] = [opiskelijavuodet_painotettu_yhteensa] 
INTO [dw].[f_amos_opiskelijavuodet_painotetut_kustannuskysely]
FROM dw.f_amos_opiskelijavuodet_painotetut f
JOIN dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_jarj_hist_id
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d2 on d2.ytunnus_avain = d1.organisaatio_koodi
WHERE tilastovuosi = @maxTilv-1