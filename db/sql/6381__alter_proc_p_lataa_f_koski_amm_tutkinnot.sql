USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_tutkinnot]    Script Date: 2.9.2022 8:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_tutkinnot] AS


DROP TABLE IF EXISTS dw.f_koski_amm_tutkinnot

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
	,d_kytkin_oppisopimuskoulutus_id = COALESCE(d7a.id,-1)
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
	,d_kieli_suorituskieli_id = COALESCE(d21.id,-1)
	,d_kytkin_muu_ammatillinen_id = COALESCE(d22.id, -1)
	,valmentava_koodi
	,oppisopimus_osuus
	,koulutussopimus_osuus
	,oppija_oid
	,opiskeluoikeus_oid
	,loadtime = GETDATE()

INTO dw.f_koski_amm_tutkinnot
	
FROM (
	
	SELECT distinct
		 vt.vuosi
		,kuukausi
		,sukupuoli
		,aidinkieli
		,ika
		,kansalaisuus
		,erityisopetus
		,opintojen_rahoitus
		,majoitus
		,oppis = case when oppis_osuus > 0 then 1 else 0 end
		,koulutuss = case when koulutussop_osuus > 0 then 1 else 0 end
		,vt.tutkinto_koodi
		,kustannusryhma = COALESCE(okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi)
		,osaamisala_koodiarvo
		,suorituskieli_koodiarvo
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid
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
		,oppisopimus_osuus = 
			case 
				when oppis_ja_koulutus.oppis_osuus <= 0 then '0 %'
				when oppis_ja_koulutus.oppis_osuus < 0.25 then '1–24 %'
				when oppis_ja_koulutus.oppis_osuus < 0.5 then '25–49 %'
				when oppis_ja_koulutus.oppis_osuus < 0.75 then '50–74 %'
				when oppis_ja_koulutus.oppis_osuus >= 0.75 then '75–100 %'
				else 'Tieto puuttuu'
			end
		,koulutussopimus_osuus = 
			case 
				when oppis_ja_koulutus.koulutussop_osuus <= 0 then '0 %'
				when oppis_ja_koulutus.koulutussop_osuus < 0.25 then '1–24 %'
				when oppis_ja_koulutus.koulutussop_osuus < 0.5 then '25–49 %'
				when oppis_ja_koulutus.koulutussop_osuus < 0.75 then '50–74 %'
				when oppis_ja_koulutus.koulutussop_osuus >= 0.75 then '75–100 %'
				else 'Tieto puuttuu'
			end
		,oppija_oid
		,vt.opiskeluoikeus_oid

	FROM Koski_SA.dbo.amm_tutkinnot_valitaulu vt
	LEFT JOIN sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = vt.osaamisala_koodiarvo
	LEFT JOIN sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = vt.tutkinto_koodi
	LEFT JOIN (
		SELECT 
			opiskeluoikeus_oid
			,vuosi
			,oppis_osuus = SUM(coalesce(oppisopimus_pv, 0) / nullif(cast(opiskeluoikeus_pv as float), 0))
			,koulutussop_osuus = SUM(coalesce(koulutussopimus_pv, 0) / nullif(cast(opiskeluoikeus_pv as float), 0))
		FROM Koski_SA.dbo.amm_tutkinnot_valitaulu
		GROUP BY opiskeluoikeus_oid,vuosi
	) oppis_ja_koulutus ON oppis_ja_koulutus.opiskeluoikeus_oid = vt.opiskeluoikeus_oid and oppis_ja_koulutus.vuosi = vt.vuosi

) k

LEFT JOIN d_kalenteri d1 ON d1.kalenteri_avain = CONCAT(k.vuosi,'-',RIGHT(CONCAT('0',k.kuukausi),2),'-01')
LEFT JOIN d_sukupuoli d2 ON d2.sukupuoli_koodi = k.sukupuoli
LEFT JOIN d_kieli d3 ON d3.kieli_koodi = k.aidinkieli
LEFT JOIN d_ika d4 ON d4.ika_avain = k.ika
LEFT JOIN d_erityisopetus d5 ON d5.erityisopetus_koodi = k.erityisopetus
LEFT JOIN d_majoitus d6 ON d6.majoitus_koodi = k.majoitus
LEFT JOIN d_kytkin d7a ON d7a.kytkin_koodi = k.oppis
LEFT JOIN d_kytkin d7b ON d7b.kytkin_koodi = k.koulutuss
LEFT JOIN d_kytkin d8 ON d8.kytkin_koodi = '-1'--k.vankilaopetus
LEFT JOIN d_kytkin d9 ON d9.kytkin_koodi = k.henkilostokoulutus
LEFT JOIN d_koulutusluokitus d11 ON d11.koulutusluokitus_koodi = k.tutkinto_koodi
LEFT JOIN d_organisaatioluokitus d12 ON d12.organisaatio_oid = k.oppilaitos_oid
LEFT JOIN d_organisaatioluokitus d13 ON d13.organisaatio_oid = k.koulutustoimija_oid
LEFT JOIN d_suorituksen_tyyppi d14 ON d14.koodi = k.suorituksen_tyyppi
LEFT JOIN d_ammatillisen_tutkinnon_kustannusryhma d15 ON d15.koodi = k.kustannusryhma
LEFT JOIN d_opintojenrahoitus d16 ON d16.koodi = k.opintojen_rahoitus
LEFT JOIN d_kytkin d10 ON d10.kytkin_koodi = d16.tyovoimakoulutus
LEFT JOIN d_osaamisala d17 ON d17.koodi = k.osaamisala_koodiarvo
LEFT JOIN d_organisaatioluokitus d18 ON d18.organisaatio_oid = k.toimipiste_oid
LEFT JOIN d_kytkin d19 ON d19.kytkin_koodi = '-1' --k.osa_aikaisuus
LEFT JOIN d_maatjavaltiot2 d20 ON d20.maatjavaltiot2_koodi = k.kansalaisuus
LEFT JOIN d_kieli d21 ON d21.kieli_koodi = k.suorituskieli_koodiarvo
LEFT JOIN d_kytkin d22 ON d22.kytkin_koodi = muu_ammatillinen
LEFT JOIN d_amm_sopimusjaksot d24 ON d24.koodi = (
	CASE
		WHEN k.oppis = 1 and k.koulutuss = 1 THEN '1_1'
		WHEN k.oppis = 1 and k.koulutuss = 0 THEN '1_2'
		WHEN k.oppis = 0 and k.koulutuss = 1 THEN '2_1'
		WHEN k.oppis = 0 and k.koulutuss = 0 THEN '2_2'
		ELSE '-1'
	END
)
