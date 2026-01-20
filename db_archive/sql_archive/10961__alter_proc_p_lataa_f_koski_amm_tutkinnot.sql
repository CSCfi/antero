USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_tutkinnot]    Script Date: 30.7.2025 10.22.42 ******/
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
	,d_alueluokitus_kotikunta_id = COALESCE(d0.id,-1)
	,d_osa_aikaisuus_id = -1 --COALESCE(d19.id,-1)
	,d_erityisopetus_id = COALESCE(d5.id,-1)
	,d_majoitus_id = COALESCE(d6.id,-1)
	,d_kytkin_oppisopimuskoulutus_id = COALESCE(d7a.id,-1)
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
	,d_kytkin_tyovoimakoulutus_id = COALESCE(d16c.id,-1)
	,d_osaamisala_id = COALESCE(d17.id,-1)
	,d_tutkintonimike_id = COALESCE(d25.id,-1)
	,d_kieli_suorituskieli_id = COALESCE(d21.id,-1)
	,d_kytkin_muu_ammatillinen_id = COALESCE(d22.id, -1)
	,valmentava_koodi
	,oppisopimus_osuus
	,koulutussopimus_osuus
	,master_oid
	,opiskeluoikeus_oid
	,tutk
	,tutk_tt
	,oppivelvollinen
	,loadtime = GETDATE()

INTO dw.f_koski_amm_tutkinnot
	
FROM (
	
	SELECT DISTINCT
		vt.vuosi
		,kuukausi
		,vt.sukupuoli
		,vt.aidinkieli
		,ika
		,vt.kansalaisuus
		,vt.kotikunta
		,erityisopetus
		,opintojen_rahoitus
		,koulutusvienti
		,majoitus
		,oppis = case when oppis_osuus > 0 then 1 else 0 end
		,koulutuss = case when koulutussop_osuus > 0 then 1 else 0 end
		,vt.tutkinto_koodi
		,kustannusryhma = COALESCE(okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi)
		,osaamisala_koodiarvo
		,tutkintonimike_koodiarvo
		,suorituskieli_koodiarvo
		,toimipiste_oid_tt
		--hankintakoulutuksen rivit sekä hankkivan että todistuksen saavan järjestäjän mukaan (eri mittareihin)
		,oppilaitos_oid = case when oo_tt.tutk_tt = 1 then oppilaitos_oid_tt else oppilaitos_oid end
		,koulutustoimija_oid = case when oo_tt.tutk_tt = 1 then koulutustoimija_oid_tt else koulutustoimija_oid end
		,hankintakoulutuksen_koulutustoimija_oid = case when hankintakoulutus = 1 then koulutustoimija_oid_tt end
		--
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
				when suorituksen_tyyppi = 'tuvakoulutuksensuoritus' then 3
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
		,vt.master_oid
		,vt.opiskeluoikeus_oid
		--
		,tutk = coalesce(oo_tt.tutk, 1)
		,tutk_tt = coalesce(oo_tt.tutk_tt, 1)

		,oppivelvollinen = 
			CASE
				WHEN d26.mannersuomessa = 1 AND --Kotikunta Manner-Suomessa
					(oovap.vapautettu IS NULL OR (oovap.vapautettu > DATEFROMPARTS(vt.vuosi, vt.kuukausi, 1) AND oovap.mitatoity = '9999-01-01')) AND --Ei vapautusta oppivelvollisuudesta
					((vt.vuosi-YEAR(henk.syntymaaika) > 7 AND FLOOR(DATEDIFF(DAY, henk.syntymaaika, DATEFROMPARTS(vt.vuosi, vt.kuukausi, 1)) / 365.25) < 18) OR --Henkilö täyttää yli 7-vuotta, mutta on alle 18-vuotias
					(vt.vuosi-YEAR(henk.syntymaaika) = 7 AND DATEFROMPARTS(vt.vuosi, vt.kuukausi, 1) >= DATEFROMPARTS(vt.vuosi, 8, 1))) AND --Henkilö täyttää 7 vuotta ja opintovelvollisuus alkaa kyseisen vuoden elokuun alusta
					(spvm.tutkinto_suoritettu >= DATEFROMPARTS(vt.vuosi, vt.kuukausi, 1) OR spvm.tutkinto_suoritettu IS NULL) --Henkilö ei ole suorittanut ylioppilastutkintoa tai ammatillista tutkintoa
					THEN 1 
				ELSE 0
			END

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
	LEFT JOIN (select tutk=1, tutk_tt=0 union select tutk=0, tutk_tt=1) oo_tt on vt.hankintakoulutus = 1
	-- Ensimmäisen toisen asteen tutkinnon suorituspvm
	LEFT JOIN (
		SELECT
		oo.master_oid,
		MIN(COALESCE(ooy.alku,ps.vahvistus_paiva)) as tutkinto_suoritettu
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_ytr] ooy on oo.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid and ooy.tila_koodiarvo = 'valmistunut'
		WHERE ((ps.vahvistus_paiva is not null) AND
			((ps.suorituksen_tyyppi in('ammatillinentutkinto','ibtutkinto','diatutkintovaihe')) OR
			(ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' AND ps.koulutusmoduuli_koodiarvo = '12'))) OR
			(ooy.tila_koodiarvo = 'valmistunut')
		GROUP BY oo.master_oid
	) spvm on spvm.master_oid = vt.master_oid
	LEFT JOIN ANTERO.dw.d_alueluokitus d26 ON vt.kotikunta = d26.kunta_koodi
	LEFT JOIN Koski_SA.sa.sa_valpas_oppivelvollisuudesta_vapautetut oovap ON vt.master_oid = oovap.master_oid
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo_master AS henk ON vt.master_oid = henk.master_oid
) k

LEFT JOIN dw.d_alueluokitus d0 ON d0.alueluokitus_avain = 'kunta_' + k.kotikunta
LEFT JOIN dw.d_kalenteri d1 ON d1.kalenteri_avain = CONCAT(k.vuosi,'-',RIGHT(CONCAT('0',k.kuukausi),2),'-01')
LEFT JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi = k.sukupuoli
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi = k.aidinkieli
LEFT JOIN dw.d_ika d4 ON d4.ika_avain = k.ika
LEFT JOIN dw.d_erityisopetus d5 ON d5.erityisopetus_koodi = k.erityisopetus
LEFT JOIN dw.d_majoitus d6 ON d6.majoitus_koodi = k.majoitus
LEFT JOIN dw.d_kytkin d7a ON d7a.kytkin_koodi = k.oppis
LEFT JOIN dw.d_kytkin d7b ON d7b.kytkin_koodi = k.koulutuss
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
LEFT JOIN dw.d_kytkin d16c ON d16c.kytkin_koodi = d16.tyovoimakoulutus
LEFT JOIN dw.d_osaamisala d17 ON d17.koodi = k.osaamisala_koodiarvo
LEFT JOIN dw.d_organisaatioluokitus d18 ON d18.organisaatio_oid = k.toimipiste_oid_tt
--LEFT JOIN dw.d_kytkin d19 ON d19.kytkin_koodi = '-1' --k.osa_aikaisuus
LEFT JOIN dw.d_maatjavaltiot2 d20 ON d20.maatjavaltiot2_koodi = k.kansalaisuus
LEFT JOIN dw.d_kieli d21 ON d21.kieli_koodi = k.suorituskieli_koodiarvo
LEFT JOIN dw.d_kytkin d22 ON d22.kytkin_koodi = muu_ammatillinen
LEFT JOIN dw.d_amm_sopimusjaksot d24 ON d24.koodi = (
	CASE
		WHEN k.oppis = 1 and k.koulutuss = 1 THEN '1_1'
		WHEN k.oppis = 1 and k.koulutuss = 0 THEN '1_2'
		WHEN k.oppis = 0 and k.koulutuss = 1 THEN '2_1'
		WHEN k.oppis = 0 and k.koulutuss = 0 THEN '2_2'
		ELSE '-1'
	END
)
LEFT JOIN d_tutkintonimike d25 on d25.tutkintonimike_koodi = k.tutkintonimike_koodiarvo

GO


