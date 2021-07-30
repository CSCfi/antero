USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijat_netto]    Script Date: 13.7.2021 10:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijat_netto] AS


--INSERT INTO dw.f_koski_amm_opiskelijat (
--	 vuosi
--	,d_kalenteri_id
--	,d_sukupuoli_id
--	,d_kieli_aidinkieli_id
--	,d_ika_id
--	,d_osa_aikaisuus_id
--	,d_erityisopetus_id
--	,d_majoitus_id
--	,d_kytkin_oppisopimuskoulutus_id
--	,d_kytkin_vankilaopetus_id
--	,d_kytkin_henkilostokoulutus_id
--	,d_kytkin_tyovoimakoulutus_id
--	,d_koulutusluokitus_id
--	,d_organisaatioluokitus_oppilaitos_id
--	,d_organisaatioluokitus_jarj_id
--	,d_organisaatioluokitus_toimipiste_id
--	,d_kustannusryhma_id
--	,d_suorituksen_tyyppi_id
--	,d_opintojenrahoitus_id
--	,d_osaamisala_id
--	,uudet_opiskelijat_lkm_oppija
--	,opiskelijat_lkm_oppija
--	,uudet_opiskelijat_ka
--	,opiskelijat_ka
--	,loadtime
--)

DROP TABLE dw.f_koski_amm_opiskelijat_netto

SELECT
	 tilastovuosi = k.vuosi
	,d_kalenteri_id = COALESCE(d1.id,-1)
	,d_sukupuoli_id = COALESCE(d2.id,-1)
	,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
	,d_ika_id = COALESCE(d4.id,-1)
	,d_maatjavaltiot2_kansalaisuus_id = COALESCE(d20.id,-1)
	,d_osa_aikaisuus_id = COALESCE(d19.id,-1)
	,d_erityisopetus_id = COALESCE(d5.id,-1)
	,d_majoitus_id = COALESCE(d6.id,-1)
	,d_kytkin_oppisopimuskoulutus_id = COALESCE(d7.id,-1)
	,d_kytkin_koulutussopimus_id = COALESCE(d7b.id,-1)
	,d_amm_sopimusjaksot_id = COALESCE(d24.id,-1)
	,d_kytkin_vankilaopetus_id = COALESCE(d8.id,-1)
	,d_kytkin_henkilostokoulutus_id = COALESCE(d9.id,-1)
	,d_kytkin_tyovoimakoulutus_id = COALESCE(d10.id,-1)
	,d_koulutusluokitus_id = COALESCE(d11.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d13.id,-1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d18.id,-1)
	,d_kustannusryhma_id = COALESCE(d15.id,-1)
	,d_suorituksen_tyyppi_id = COALESCE(d14.id,-1)
	,d_opintojenrahoitus_id = COALESCE(d16.id,-1)
	,d_osaamisala_id = COALESCE(d17.id,-1)
	,d_kieli_suorituskieli_id = COALESCE(d21.id, -1)
	,uudet_opiskelijat = SUM(CASE WHEN uusi = 1 THEN ka ELSE 0 END)
	,opiskelijat = SUM(ka)
	,loadtime = GETDATE()

INTO dw.f_koski_amm_opiskelijat_netto
	
FROM (
	
	
	SELECT 
		 vuosi
		,kuukausi
		,sukupuoli
		,aidinkieli
		,ika
		,kansalaisuus
		,erityisopetus
		,opintojen_rahoitus
		,majoitus
		,oppisopimus
		,koulutussopimus
		,sa.tutkinto_koodi
		,kustannusryhma = COALESCE(okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi)
		,osaamisala_koodiarvo
		,suorituskieli_koodiarvo
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,henkilostokoulutus
		,suorituksen_tyyppi = case when suorituksen_tyyppi = 'ammatillinentutkinto' then 1 else 2 end
		,uusi = NULL
		,ka
	FROM Koski_SA.dbo.amm_opiskelijat_netto_valitaulu sa
	LEFT JOIN sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = sa.osaamisala_koodiarvo
	LEFT JOIN sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = sa.tutkinto_koodi

) k

LEFT JOIN d_kalenteri d1 ON d1.kalenteri_avain = CONCAT(k.vuosi,'-',RIGHT(CONCAT('0',k.kuukausi),2),'-01')
LEFT JOIN d_sukupuoli d2 ON d2.sukupuoli_koodi = k.sukupuoli
LEFT JOIN d_kieli d3 ON d3.kieli_koodi = k.aidinkieli
LEFT JOIN d_ika d4 ON d4.ika_avain = k.ika
LEFT JOIN d_erityisopetus d5 ON d5.erityisopetus_koodi = k.erityisopetus
LEFT JOIN d_majoitus d6 ON d6.majoitus_koodi = k.majoitus
LEFT JOIN d_kytkin d7 ON d7.kytkin_koodi = k.oppisopimus
LEFT JOIN d_kytkin d7b ON d7b.kytkin_koodi = k.koulutussopimus
LEFT JOIN d_kytkin d8 ON d8.kytkin_koodi = '-1'--k.vankilaopetus
LEFT JOIN d_kytkin d9 ON d9.kytkin_koodi = k.henkilostokoulutus
LEFT JOIN d_kytkin d10 ON d10.kytkin_koodi = '-1'--k.vankilaopetus
LEFT JOIN d_koulutusluokitus d11 ON d11.koulutusluokitus_koodi = k.tutkinto_koodi
LEFT JOIN d_organisaatioluokitus d12 ON d12.organisaatio_oid = k.oppilaitos_oid
LEFT JOIN d_organisaatioluokitus d13 ON d13.organisaatio_oid = k.koulutustoimija_oid
LEFT JOIN d_suorituksen_tyyppi d14 ON d14.koodi = k.suorituksen_tyyppi
LEFT JOIN d_ammatillisen_tutkinnon_kustannusryhma d15 ON d15.koodi = k.kustannusryhma
LEFT JOIN d_opintojenrahoitus d16 ON d16.koodi = k.opintojen_rahoitus
LEFT JOIN d_osaamisala d17 ON d17.koodi = k.osaamisala_koodiarvo
LEFT JOIN d_organisaatioluokitus d18 ON d18.organisaatio_oid = k.toimipiste_oid
LEFT JOIN d_kytkin d19 ON d19.kytkin_koodi = '-1' --k.osa_aikaisuus
LEFT JOIN d_maatjavaltiot2 d20 ON d20.maatjavaltiot2_koodi = k.kansalaisuus
LEFT JOIN d_kieli d21 ON d21.kieli_koodi = k.suorituskieli_koodiarvo
LEFT JOIN d_amm_sopimusjaksot d24 ON d24.koodi = (
	CASE
		WHEN k.oppisopimus = 1 and k.koulutussopimus = 1 THEN '1_1'
		WHEN k.oppisopimus = 1 and k.koulutussopimus = 0 THEN '1_2'
		WHEN k.oppisopimus = 0 and k.koulutussopimus = 1 THEN '2_1'
		WHEN k.oppisopimus = 0 and k.koulutussopimus = 0 THEN '2_2'
		ELSE '-1'
	END
)

GROUP BY 
k.vuosi
,COALESCE(d1.id,-1)
,COALESCE(d2.id,-1)
,COALESCE(d3.id,-1)
,COALESCE(d4.id,-1)
,COALESCE(d5.id,-1)
,COALESCE(d6.id,-1)
,COALESCE(d7.id,-1)
,COALESCE(d7b.id,-1)
,COALESCE(d8.id,-1)
,COALESCE(d9.id,-1)
,COALESCE(d10.id,-1)
,COALESCE(d11.id,-1)
,COALESCE(d12.id,-1)
,COALESCE(d13.id,-1)
,COALESCE(d14.id,-1)
,COALESCE(d15.id,-1)
,COALESCE(d16.id,-1)
,COALESCE(d17.id,-1)
,COALESCE(d18.id,-1)
,COALESCE(d19.id,-1)
,COALESCE(d20.id,-1)
,COALESCE(d21.id,-1)
,COALESCE(d24.id,-1)
