USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijat_netto]    Script Date: 21.2.2024 14:40:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijat_netto] AS

DROP TABLE IF EXISTS dw.f_koski_amm_opiskelijat_netto

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
	,d_kytkin_vankilaopetus_id = -1 --COALESCE(d8.id,-1)
	,d_kytkin_henkilostokoulutus_id = COALESCE(d9.id,-1)
	,d_kytkin_hankintakoulutus_id = COALESCE(d10.id,-1)
	,d_koulutusluokitus_id = COALESCE(d11.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d13.id,-1)
	,d_organisaatioluokitus_hk_jarj_id = COALESCE(d13b.id,-1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d18.id,-1)
	,d_kustannusryhma_id = COALESCE(d15.id,-1)
	,d_suorituksen_tyyppi_id = COALESCE(d14.id,-1)
	,d_opintojenrahoitus_id = COALESCE(d16.id,-1)
	,d_kytkin_koulutusvienti_id = COALESCE(d16b.id,-1)
	,d_kytkin_tyovoimakoulutus_id = -1 --COALESCE(d16c.id,-1)
	,d_osaamisala_id = COALESCE(d17.id,-1)
	,d_kieli_suorituskieli_id = COALESCE(d21.id, -1)
	,d_kytkin_muu_ammatillinen_id = COALESCE(d22.id, -1)

	,d_ika_oo_alk_id = COALESCE(d25.id, -1)
	,d_ika_oo_alk_tarkka_id = COALESCE(d26.id, -1)
	,d_ika_opsoj_alk_id = COALESCE(d27.id, -1)
	,d_ika_opsoj_alk_tarkka_id = COALESCE(d28.id, -1)
	,d_oo_aloitus_id = COALESCE(d29.id,-1)
	,d_opsoj_aloitus_id = COALESCE(d30.id,-1)

	,valmentava_koodi = MAX(valmentava_koodi)
	,uudet_opiskelijat = SUM(CASE WHEN uusi = 1 THEN ka ELSE 0 END)
	,opiskelijat = SUM(ka)
	,oppivelvollinen
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
		,koulutusvienti
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
		,hankintakoulutuksen_koulutustoimija_oid
		,hankintakoulutus
		,henkilostokoulutus
		,suorituksen_tyyppi = 
			case
				when suorituksen_tyyppi = 'ammatillinentutkinto' then 1	--koko tutkinto
				when suorituksen_tyyppi = 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus' then 3 --tutkinnon osaa pienempi
				else 2 --tutkinnon osa/osia
			end
		,muu_ammatillinen = case when suorituksen_tyyppi = 'muuammatillinenkoulutus' then 1 else 0 end
		,valmentava_koodi = 
			case
				when suorituksen_tyyppi = 'valma' then 1
				when suorituksen_tyyppi = 'telma' then 2
				when suorituksen_tyyppi = 'tuvakoulutuksensuoritus' then 3 --lähdetaulussa [tuva_jarjestamuslupa] = 'ammatillinen'
			end 
		,ika_oo_alk
		,ika_oo_alk_tarkka
		,ika_opsoj_alk
		,ika_opsoj_alk_tarkka
		,opsoj_aloitusvuosi
		,opsoj_aloituskuukausi
		,oo_aloitusvuosi
		,oo_aloituskuukausi
		,uusi = NULL
		,ka
		,sa.oppivelvollinen

	FROM Koski_SA.dbo.amm_opiskelijat_netto_valitaulu sa
	LEFT JOIN sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = sa.osaamisala_koodiarvo
	LEFT JOIN sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = sa.tutkinto_koodi

) k

LEFT JOIN dw.d_kalenteri d1 ON d1.kalenteri_avain = CONCAT(k.vuosi,'-',RIGHT(CONCAT('0',k.kuukausi),2),'-01')
LEFT JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi = k.sukupuoli
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi = k.aidinkieli
LEFT JOIN dw.d_ika d4 ON d4.ika_avain = k.ika
LEFT JOIN dw.d_erityisopetus d5 ON d5.erityisopetus_koodi = k.erityisopetus
LEFT JOIN dw.d_majoitus d6 ON d6.majoitus_koodi = k.majoitus
LEFT JOIN dw.d_kytkin d7 ON d7.kytkin_koodi = k.oppisopimus
LEFT JOIN dw.d_kytkin d7b ON d7b.kytkin_koodi = k.koulutussopimus
--LEFT JOIN dw.d_kytkin d8 ON d8.kytkin_koodi = '-1'--k.vankilaopetus
LEFT JOIN dw.d_kytkin d9 ON d9.kytkin_koodi = k.henkilostokoulutus
LEFT JOIN dw.d_kytkin d10 ON d10.kytkin_koodi = k.hankintakoulutus
LEFT JOIN dw.d_koulutusluokitus d11 ON d11.koulutusluokitus_koodi = k.tutkinto_koodi
LEFT JOIN dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = k.oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = k.koulutustoimija_oid
LEFT JOIN dw.d_organisaatioluokitus d13b ON d13b.organisaatio_oid = k.hankintakoulutuksen_koulutustoimija_oid
LEFT JOIN dw.d_suorituksen_tyyppi d14 ON d14.koodi = k.suorituksen_tyyppi
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d15 ON d15.koodi = k.kustannusryhma
LEFT JOIN dw.d_opintojenrahoitus d16 ON d16.koodi = k.opintojen_rahoitus
LEFT JOIN dw.d_kytkin d16b ON d16b.kytkin_koodi = k.koulutusvienti
--LEFT JOIN dw.d_kytkin d16c ON d16c.kytkin_koodi = '-1' --k.tyovoimakoulutus
LEFT JOIN dw.d_osaamisala d17 ON d17.koodi = k.osaamisala_koodiarvo
LEFT JOIN dw.d_organisaatioluokitus d18 ON d18.organisaatio_oid = k.toimipiste_oid
LEFT JOIN dw.d_kytkin d19 ON d19.kytkin_koodi = '-1' --k.osa_aikaisuus
LEFT JOIN dw.d_maatjavaltiot2 d20 ON d20.maatjavaltiot2_koodi = k.kansalaisuus
LEFT JOIN dw.d_kieli d21 ON d21.kieli_koodi = k.suorituskieli_koodiarvo
LEFT JOIN dw.d_kytkin d22 ON d22.kytkin_koodi = muu_ammatillinen
LEFT JOIN dw.d_amm_sopimusjaksot d24 ON d24.koodi = (
	CASE
		WHEN k.oppisopimus = 1 and k.koulutussopimus = 1 THEN '1_1'
		WHEN k.oppisopimus = 1 and k.koulutussopimus = 0 THEN '1_2'
		WHEN k.oppisopimus = 0 and k.koulutussopimus = 1 THEN '2_1'
		WHEN k.oppisopimus = 0 and k.koulutussopimus = 0 THEN '2_2'
		ELSE '-1'
	END
)
LEFT JOIN dw.d_ika d25 on d25.ika_avain = k.ika_oo_alk
LEFT JOIN dw.d_ika d26 on d26.ika_avain = k.ika_oo_alk_tarkka
LEFT JOIN dw.d_ika d27 on d27.ika_avain = k.ika_opsoj_alk
LEFT JOIN dw.d_ika d28 on d28.ika_avain = k.ika_opsoj_alk_tarkka
LEFT JOIN dw.d_kalenteri d29 on d29.kalenteri_avain = concat(k.oo_aloitusvuosi,'-',right(concat('0',k.oo_aloituskuukausi),2),'-01')
LEFT JOIN dw.d_kalenteri d30 on d30.kalenteri_avain = concat(k.opsoj_aloitusvuosi,'-',right(concat('0',k.opsoj_aloituskuukausi),2),'-01')

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
--,COALESCE(d8.id,-1)
,COALESCE(d9.id,-1)
,COALESCE(d10.id,-1)
,COALESCE(d11.id,-1)
,COALESCE(d12.id,-1)
,COALESCE(d13.id,-1)
,COALESCE(d13b.id,-1)
,COALESCE(d14.id,-1)
,COALESCE(d15.id,-1)
,COALESCE(d16.id,-1)
,COALESCE(d16b.id,-1)
--,COALESCE(d16c.id,-1)
,COALESCE(d17.id,-1)
,COALESCE(d18.id,-1)
,COALESCE(d19.id,-1)
,COALESCE(d20.id,-1)
,COALESCE(d21.id,-1)
,COALESCE(d22.id,-1)
,COALESCE(d24.id,-1)
,COALESCE(d25.id,-1)
,COALESCE(d26.id,-1)
,COALESCE(d27.id,-1)
,COALESCE(d28.id,-1)
,COALESCE(d29.id,-1)
,COALESCE(d30.id,-1)
,oppivelvollinen


GO

USE [ANTERO]