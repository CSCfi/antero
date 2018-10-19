USE [Antero]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_koski_opiskelijavuodet_cultures]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dw].v_koski_opiskelijavuodet_cultures AS
SELECT 1 AS a'
GO
ALTER VIEW [dw].[v_koski_opiskelijavuodet_cultures]
AS
SELECT        d_organisaatioluokitus_jarj.organisaatio_koodi AS ytunnus, ko.opiskelijavuodet, d_kytkin_oppisopimuskoulutus.kytkin_fi AS osa_aikaisuus_fi, d_kytkin_oppisopimuskoulutus.kytkin_en AS osa_aikaisuus_en, 
                         d_kytkin_oppisopimuskoulutus.kytkin_sv AS osa_aikaisuus_sv, ko.vuosi, REPLACE(cal.kuukausi_fi, 'kuu', '') AS kk_fi, cal.kuukausi_fi, cal.kuukausi_sv, cal.kuukausi_en, 'Missing data' AS kustannusryhma_en, 
                         'Information saknas' AS kustannusryhma_sv, 'Tieto puuttuu' AS tutkintotyyppiryhma_fi, 'Missing data' AS tutkintotyyppiryhma_en, 'Information saknas' AS tutkintotyyppiryhma_sv, 
                         dw.d_koulutusluokitus.tutkintotyyppi_fi, dw.d_koulutusluokitus.tutkintotyyppi_en, dw.d_koulutusluokitus.tutkintotyyppi_sv, d_kytkin_oppisopimuskoulutus.kytkin_fi AS oppisopimuskoulutus_kytkin_fi, 
                         d_kytkin_oppisopimuskoulutus.kytkin_sv AS oppisopimuskoulutus_kytkin_sv, d_kytkin_oppisopimuskoulutus.kytkin_en AS oppisopimuskoulutus_kytkin_en, ko.d_erityisopetus_id AS erityisopetus_id, 
                         dw.d_majoitus.majoitus_nimi_fi AS majoitus_fi, dw.d_majoitus.majoitus_nimi_en AS majoitus_en, dw.d_majoitus.majoitus_nimi_sv AS majoitus_sv, d_kytkin_vankilaopetus.kytkin_fi AS vankilaopetus_kytkin_fi, 
                         d_kytkin_vankilaopetus.kytkin_sv AS vankilaopetus_kytkin_sv, d_kytkin_vankilaopetus.kytkin_en AS vankilaopetus_kytkin_en, d_kytkin_henkilostokoulutus.kytkin_fi AS henkilostokoulutus_kytkin_fi, 
                         d_kytkin_henkilostokoulutus.kytkin_sv AS henkilostokoulutus_kytkin_sv, d_kytkin_henkilostokoulutus.kytkin_en AS henkilostokoulutus_kytkin_en, 
                         d_kytkin_tyovoimakoulutus.kytkin_fi AS tyovoimakoulutus_kytkin_fi, d_kytkin_tyovoimakoulutus.kytkin_sv AS tyovoimakoulutus_kytkin_sv, d_kytkin_tyovoimakoulutus.kytkin_en AS tyovoimakoulutus_kytkin_en, 
                         dw.d_koulutusluokitus.koulutusluokitus_fi, dw.d_koulutusluokitus.koulutusluokitus_sv, dw.d_koulutusluokitus.koulutusluokitus_en, d_organisaatioluokitus_oppilaitos.organisaatio_fi AS oppilaitos_fi, 
                         d_organisaatioluokitus_oppilaitos.organisaatio_sv AS oppilaitos_sv, d_organisaatioluokitus_oppilaitos.organisaatio_en AS oppilaitos_en, d_alueluokitus_oppilaitos.kunta_fi AS oppilaitoksen_kunta_fi, 
                         d_alueluokitus_oppilaitos.kunta_sv AS oppilaitoksen_kunta_sv, d_alueluokitus_oppilaitos.kunta_en AS oppilaitoksen_kunta_en, d_alueluokitus_oppilaitos.avi_fi AS oppilaitos_avi_fi, 
                         d_alueluokitus_oppilaitos.avi_sv AS oppilaitos_avi_sv, d_alueluokitus_oppilaitos.avi_en AS oppilaitos_avi_en, d_alueluokitus_oppilaitos.ely_fi AS oppilaitos_ely_fi, 
                         d_alueluokitus_oppilaitos.ely_sv AS oppilaitos_ely_sv, d_alueluokitus_oppilaitos.ely_en AS oppilaitos_ely_en, d_alueluokitus_oppilaitos.maakunta_fi AS oppilaitos_maakunta_fi, 
                         d_alueluokitus_oppilaitos.maakunta_sv AS oppilaitos_maakunta_sv, d_alueluokitus_oppilaitos.maakunta_en AS oppilaitos_maakunta_en, d_alueluokitus_jarj.kunta_fi AS jarjestajan_kunta_fi, 
                         d_alueluokitus_jarj.kunta_sv AS jarjestajan_kunta_sv, d_alueluokitus_jarj.kunta_en AS jarjestajan_kunta_en, d_alueluokitus_jarj.avi_fi AS jarjestajan_avi_fi, d_alueluokitus_jarj.avi_sv AS jarjestajan_avi_sv, 
                         d_alueluokitus_jarj.avi_en AS jarjestajan_avi_en, d_alueluokitus_jarj.ely_fi AS jarjestajan_ely_fi, d_alueluokitus_jarj.ely_sv AS jarjestajan_ely_sv, d_alueluokitus_jarj.ely_en AS jarjestajan_ely_en, 
                         d_alueluokitus_jarj.maakunta_fi AS jarjestajan_maakunta_fi, d_alueluokitus_jarj.maakunta_sv AS jarjestajan_maakunta_sv, d_alueluokitus_jarj.maakunta_en AS jarjestajan_maakunta_en, dw.d_ika.ika_fi AS ika, 
                         dw.d_ika.ikaryhma3_fi, dw.d_ika.ikaryhma3_sv, dw.d_ika.ikaryhma3_en, dw.d_kieli.kieli_fi, dw.d_kieli.kieli_sv, dw.d_kieli.kieli_en, dw.d_sukupuoli.sukupuoli_fi, dw.d_sukupuoli.sukupuoli_sv, 
                         dw.d_sukupuoli.sukupuoli_en, ko.d_kalenteri_id, cal.kuukausi, CASE WHEN ko.vuosi = year(getdate()) THEN 1 ELSE 0 END AS cy_flag, CASE WHEN cal.kuukausi < month(getdate()) 
                         THEN 1 ELSE 0 END AS cm_flag
FROM            dw.f_koski_opiskelijavuodet AS ko INNER JOIN
                         dw.d_sukupuoli ON ko.d_sukupuoli_id = dw.d_sukupuoli.id INNER JOIN
                         dw.d_kieli ON ko.d_kieli_aidinkieli_id = dw.d_kieli.id INNER JOIN
                         dw.d_ika ON ko.d_ika_id = dw.d_ika.id INNER JOIN
                         dw.d_koulutusluokitus ON ko.d_koulutusluokitus_id = dw.d_koulutusluokitus.id INNER JOIN
                         dw.d_organisaatioluokitus AS d_organisaatioluokitus_oppilaitos ON ko.d_organisaatioluokitus_oppilaitos_id = d_organisaatioluokitus_oppilaitos.id INNER JOIN
                         dw.d_kytkin AS d_kytkin_oppisopimuskoulutus ON ko.d_kytkin_oppisopimuskoulutus_id = d_kytkin_oppisopimuskoulutus.id INNER JOIN
                         dw.d_kytkin AS d_kytkin_vankilaopetus ON ko.d_kytkin_vankilaopetus_id = d_kytkin_vankilaopetus.id INNER JOIN
                         dw.d_kytkin AS d_kytkin_henkilostokoulutus ON ko.d_kytkin_henkilostokoulutus_id = d_kytkin_henkilostokoulutus.id INNER JOIN
                         dw.d_kytkin AS d_kytkin_tyovoimakoulutus ON ko.d_kytkin_tyovoimakoulutus_id = d_kytkin_tyovoimakoulutus.id INNER JOIN
                         dw.d_alueluokitus AS d_alueluokitus_oppilaitos ON d_organisaatioluokitus_oppilaitos.kunta_koodi = d_alueluokitus_oppilaitos.kunta_koodi INNER JOIN
                         dw.d_organisaatioluokitus AS d_organisaatioluokitus_jarj ON ko.d_organisaatioluokitus_jarj_id = d_organisaatioluokitus_jarj.id INNER JOIN
                         dw.d_alueluokitus AS d_alueluokitus_jarj ON d_organisaatioluokitus_jarj.kunta_koodi = d_alueluokitus_jarj.kunta_koodi INNER JOIN
                         dw.d_kalenteri AS cal ON ko.d_kalenteri_id = cal.id INNER JOIN
                         dw.d_kytkin AS d_kytkin_osa_aikaisuus ON ko.d_osa_aikaisuus_id = d_kytkin_osa_aikaisuus.id INNER JOIN
                         dw.d_majoitus ON ko.d_majoitus_id = dw.d_majoitus.id

GO
