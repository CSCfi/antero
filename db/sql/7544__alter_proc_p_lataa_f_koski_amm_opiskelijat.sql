USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijat]    Script Date: 3.4.2023 12:33:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijat] AS


DROP TABLE IF EXISTS dw.f_koski_amm_opiskelijat

SELECT
	 tilastovuosi = k.vuosi
	,oo_alkamisajankohta = coalesce(cast(d1b.vuosi as varchar) + '/' + right('0' + cast(d1b.kuukausi as varchar), 2), '-1')
	,d_kalenteri_id = COALESCE(d1.id,-1)
	,d_kalenteri_oo_id = COALESCE(d1b.id,-1)
	,d_kytkin_oo_alkanut_kuussa_id = COALESCE(d25.id, -1)
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
	,d_kieli_suorituskieli_id = COALESCE(d21.id, -1)
	,d_kytkin_muu_ammatillinen_id = COALESCE(d22.id, -1)
	,k.oppija_oid
	,k.opiskeluoikeus_oid
	--,koulutustoimija_oid
	--,oppilaitos_oid
	,uusi
	,uusi_rahoitus
	,eronnut
    ,[jatkaa_kj]
    ,[jatkaa_oppilaitos]
    ,[jatkaa_tutkintotyyppi]
    ,[jatkaa_ammatillinen]
    ,[jatkaa_yleissivistava]
    ,[jatkaa_valmentava]
	,jatkaa_lukio_valmentava
	,jatkaa_amm_valmentava
	,jatkaa_muu_ammatillinen
	,jatkaa_amm_tutkintokoulutus
    ,d_keskeyttaminen_vaiheittainen_id = COALESCE(d23.id, -1)
	,valmentava_koodi
	,kotikunta_manner_suomessa
	,oppivelvollinen
	,loadtime = GETDATE()

INTO dw.f_koski_amm_opiskelijat
	
FROM (
	
	SELECT
		 sa.vuosi
		,sa.kuukausi
		,sa.op_alkamispaiva
		,oo_alkanut_kuussa = 
			case
				when year(sa.op_alkamispaiva) = sa.vuosi and month(sa.op_alkamispaiva) = sa.kuukausi then 1
				when year(sa.op_alkamispaiva) != sa.vuosi or month(sa.op_alkamispaiva) != sa.kuukausi then 0
			end
		,sa.sukupuoli
		,sa.aidinkieli
		,ika
		,sa.kansalaisuus
		,erityisopetus
		,sa.opintojen_rahoitus
		,sa.majoitus
		,sa.tutkinto_koodi
		,kustannusryhma = COALESCE(okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi)
		,osaamisala_koodiarvo
		,suorituskieli_koodiarvo
		,toimipiste_oid
		,sa.oppilaitos_oid
		,sa.koulutustoimija_oid
		,henkilostokoulutus
		,oppisopimus
		,koulutussopimus
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
		,uusi
		,uusi_rahoitus
		,sa.oppija_oid
		,sa.opiskeluoikeus_oid
		,eronnut = case when ero.opiskeluoikeus_oid Is null then 0 else 1 end
	    ,jatkaa_kj = COALESCE(ero.jatkaa_kj, 0)
        ,jatkaa_oppilaitos = COALESCE(ero.jatkaa_oppilaitos, 0)
        ,jatkaa_tutkintotyyppi = COALESCE(ero.jatkaa_tutkintotyyppi, 0)
        ,jatkaa_ammatillinen = COALESCE(ero.jatkaa_ammatillinen, 0)
        ,jatkaa_yleissivistava = COALESCE(ero.jatkaa_yleissivistava, 0)
        ,jatkaa_valmentava = COALESCE(ero.jatkaa_valmentava, 0)
		,jatkaa_lukio_valmentava = COALESCE(ero.jatkaa_lukio_valmentava, 0)
		,jatkaa_amm_valmentava = COALESCE(ero.jatkaa_amm_valmentava, 0)
		,jatkaa_muu_ammatillinen = COALESCE(ero.jatkaa_muu_ammatillinen, 0)
		,jatkaa_amm_tutkintokoulutus = COALESCE(ero.jatkaa_amm_tutkintokoulutus, 0)
        ,keskeyttaminen_vaiheittainen_koodi = COALESCE(ero.keskeyttaminen_vaiheittainen_koodi, -1)
		--CSCVIPUNEN-3345 15.3.2023
		,kotikunta_manner_suomessa = 
		CASE
			WHEN d26.maakunta_koodi IS NULL THEN -1
			WHEN (d26.maakunta_koodi IN ('21', '-1', '98')) THEN 0
			ELSE 1
		END
		,oppivelvollinen = 
		CASE
			WHEN ((d26.maakunta_koodi NOT IN ('21', '-1', '98') AND d26.maakunta_koodi IS NOT NULL) AND --Kotikunta Manner-Suomessa
				(oovap.vapautettu IS NULL OR (oovap.vapautettu > DATEFROMPARTS(sa.vuosi, sa.kuukausi, 1) AND oovap.mitatoity = '9999-01-01')) AND --Ei vapautusta oppivelvollisuudesta
				((sa.vuosi-YEAR(henk.syntymaaika) >= 7 AND FLOOR(DATEDIFF(DAY, henk.syntymaaika, DATEFROMPARTS(sa.vuosi, sa.kuukausi, 1)) / 365.25) < 18) OR --Henkilö on yli 7-vuotias, mutta alle 18-vuotias
				(sa.vuosi-YEAR(henk.syntymaaika) < 7 AND (ooa.pidennetty_oppivelvollisuus = 1 AND DATEFROMPARTS(sa.vuosi, sa.kuukausi, 1) BETWEEN ooa.alku AND ooa.loppu))) AND --Henkilö on alle 7-vuotias, mutta tarkastelupäivänä Koski-opiskeluoikeusdatan mukaan pidennetyn oppivelvollisuuden piirissä
				(spvm.tutkinto_suoritettu > DATEFROMPARTS(sa.vuosi, sa.kuukausi, 1) OR spvm.tutkinto_suoritettu IS NULL)) THEN 1 --Henkilö ei ole suorittanut ylioppilastutkintoa tai ammatillista tutkintoa
		ELSE 0
		END
		--CSCVIPUNEN-3345 15.3.2023

	FROM Koski_SA.dbo.amm_opiskelijat_valitaulu sa
	LEFT JOIN sa.sa_amos_osaamisala_kustannusryhma okr on okr.osaamisala_koodi = sa.osaamisala_koodiarvo
	LEFT JOIN sa.sa_amos_tutkinto_kustannusryhma tkr on tkr.tutkinto_koodi = sa.tutkinto_koodi
	LEFT JOIN Koski_SA.dbo.toisen_asteen_keskeyttaneet ero 
		on sa.opiskeluoikeus_oid = ero.opiskeluoikeus_oid
		AND sa.kuukausi = ero.kuukausi
		AND sa.vuosi = ero.vuosi
	--CSCVIPUNEN-3345 15.3.2023
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo AS henk ON sa.oppija_oid = henk.oppija_oid
	LEFT JOIN ANTERO.dw.d_alueluokitus d26 ON henk.kotikunta = d26.kunta_koodi
	LEFT JOIN Koski_SA.sa.sa_valpas_oppivelvollisuudesta_vapautetut oovap ON sa.oppija_oid = oovap.oppija_oid
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa ON sa.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid AND DATEFROMPARTS(sa.vuosi, sa.kuukausi, 1) BETWEEN ooa.alku AND ooa.loppu
	LEFT JOIN (
		SELECT
		oo.oppija_oid,
		MIN(ps.vahvistus_paiva) as tutkinto_suoritettu
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
		WHERE oo.paattymispaiva is not null AND oo.viimeisin_tila = 'valmistunut' AND
		((ps.suorituksen_tyyppi in('ammatillinentutkinto','ibtutkinto','lukionoppimaara','diatutkintovaihe')) OR
		(ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' AND ps.koulutusmoduuli_koodiarvo = '12')) AND
		oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1
		GROUP BY oo.oppija_oid
	) spvm on spvm.oppija_oid = sa.oppija_oid
	--CSCVIPUNEN-3345 15.3.2023

) k

LEFT JOIN d_kalenteri d1 ON d1.kalenteri_avain = CONCAT(k.vuosi,'-',RIGHT(CONCAT('0',k.kuukausi),2),'-01')
LEFT JOIN d_kalenteri d1b ON d1b.kalenteri_avain = k.op_alkamispaiva
LEFT JOIN d_sukupuoli d2 ON d2.sukupuoli_koodi = k.sukupuoli
LEFT JOIN d_kieli d3 ON d3.kieli_koodi = k.aidinkieli
LEFT JOIN d_ika d4 ON d4.ika_avain = k.ika
LEFT JOIN d_erityisopetus d5 ON d5.erityisopetus_koodi = k.erityisopetus
LEFT JOIN d_majoitus d6 ON d6.majoitus_koodi = k.majoitus
LEFT JOIN d_kytkin d7a ON d7a.kytkin_koodi = k.oppisopimus
LEFT JOIN d_kytkin d7b ON d7b.kytkin_koodi = k.koulutussopimus
LEFT JOIN d_kytkin d8 ON d8.kytkin_koodi = '-1' --k.vankilaopetus
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
		WHEN k.oppisopimus = 1 and k.koulutussopimus = 1 THEN '1_1'
		WHEN k.oppisopimus = 1 and k.koulutussopimus = 0 THEN '1_2'
		WHEN k.oppisopimus = 0 and k.koulutussopimus = 1 THEN '2_1'
		WHEN k.oppisopimus = 0 and k.koulutussopimus = 0 THEN '2_2'
		ELSE '-1'
	END
)
LEFT JOIN d_keskeyttaminen_vaiheittainen d23 ON d23.keskeyttaminen_vaiheittainen_koodi = k.keskeyttaminen_vaiheittainen_koodi
LEFT JOIN d_kytkin d25 ON d25.kytkin_koodi = k.oo_alkanut_kuussa


--GROUP BY 
--k.vuosi
--,COALESCE(d1.id,-1)
--,COALESCE(d2.id,-1)
--,COALESCE(d3.id,-1)
--,COALESCE(d4.id,-1)
--,COALESCE(d5.id,-1)
--,COALESCE(d6.id,-1)
--,COALESCE(d7.id,-1)
--,COALESCE(d8.id,-1)
--,COALESCE(d9.id,-1)
--,COALESCE(d10.id,-1)
--,COALESCE(d11.id,-1)
--,COALESCE(d12.id,-1)
--,COALESCE(d13.id,-1)
--,COALESCE(d14.id,-1)
--,COALESCE(d15.id,-1)
--,COALESCE(d16.id,-1)
--,COALESCE(d17.id,-1)
--,COALESCE(d18.id,-1)
--,COALESCE(d19.id,-1)
--,oppija_oid
--,uusi










GO


