USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 15.9.2020 9:02:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu] AS


TRUNCATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]

INSERT INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]

SELECT 
	year(ptkr.vahvistus_paiva) as vuosi,
	month(ptkr.vahvistus_paiva) as kuukausi,
	ptkr.toimipiste_oid, 
	ptkr.oppilaitos_oid,
	ptkr.koulutustoimija_oid,
	ptkr.koulutustoimija_oid_hist,
	ptkr.koulutustoimija_oid_pihvi,
	ptkr.koulutustoimija_oid_pihvi_hist,
	op.oppija_oid,
	ptkr.opiskeluoikeus_oid,
	case when ptkr.ylempi_opiskeluoikeus_oid is not null then 1 else 0 end as hankintakoulutus,
	coalesce(op2.alkamispaiva, op.alkamispaiva) as alkamispaiva,
	ptkr.paatason_suoritus_id,
	NULL AS suoritustason_tunniste,
	NULL AS koulutusmoduuli_koodiarvo,
	NULL AS koulutusmoduuli_koodiarvo_numeerinen,
	ptkr.diaarinumero,
	NULL as diaarinumero_tutkinnonosa_koodi,

	-- jhe 10.6.2019 vanhojen tutkintojen laajuudet haetaan diaarinumeron perusteella Sepon aputaulusta, tos-arvo j‰tet‰‰n vertailutiedoksi
	0 as koulutusmoduuli_laajuus_arvo_alkup,
	0 as tos_koulutusmoduuli_laajuus_arvo, 
	0 as koulutusmoduuli_laajuus_arvo,

	ptkr.tutkinto_koodi, 
	ptkr.osaamisala_koodiarvo,
	ptkr.tutkinto_ja_osaamisala_koodi,
	ptkr.diaarinumero_tutkinto_koodi,
	ptkr.diaarinumero_tutkinto_ja_osaamisala_koodi,

	ptkr.kustannusryhma_koodi,
	ptkr.alkup_kustannusryhmakoodi, 

	NULL AS ep_usean_tutkinnon_tutkinnonosa,
	NULL AS yhteinen_tutkinnon_osa, 
	NULL AS toisesta_tutkinnosta_sisallytetty_tutkinnonosa, 
	ptkr.suorittaa_koko_tutkintoa, 
	NULL AS arviointi_paiva, 
	ptkr.vahvistus_paiva

	,coalesce(op2.opintojen_rahoitus_koodi, op.opintojen_rahoitus_koodi) as opintojen_rahoitus_koodi

	,ptkr.suorituksen_tyyppi
	,coalesce(op2.oppisopimus, op.oppisopimus) as oppisopimus_koodi
	,coalesce(op.erityisopetus_koodi, op2.erityisopetus_koodi) as erityisopetus_koodi
	,coalesce(op.vankilaopetuksessa, op2.vankilaopetuksessa) as vankilaopetus_koodi

	,paataso = 1
	,ptkr.kustannusryhma_koodi_uusi
FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] as ptkr  
INNER JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op ON ptkr.paatason_suoritus_id = op.paatason_suoritus_id		AND ptkr.vahvistus_paiva_muokattu between op.alku and op.loppu--AP 20.6.2019 n. 400 oidia tulee tuplana, koska kaksi p‰‰tason suoritus (kokotutkinto x2 tai koko+osittainen)
LEFT JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op2 ON op2.opiskeluoikeus_oid = ptkr.ylempi_opiskeluoikeus_oid	AND ptkr.vahvistus_paiva_muokattu between op2.alku and op2.loppu

WHERE 1=1
AND tutkintotyyppi_koodi IN ('02','19','20')
--kuorioikeudet pois
AND ptkr.opiskeluoikeus_oid NOT IN (select sisaltyy_opiskeluoikeuteen_oid from Koski_SA.sa.sa_koski_opiskeluoikeus where koulutusmuoto = 'ammatillinenkoulutus' and sisaltyy_opiskeluoikeuteen_oid is not null)
AND year(ptkr.vahvistus_paiva) >= 2018

UNION


SELECT distinct
	year(tos.arviointi_paiva) as vuosi,
	month(tos.arviointi_paiva) as kuukausi,
	ptkr.toimipiste_oid, 
	ptkr.oppilaitos_oid,
	tos.koulutustoimija_oid,
	tos.koulutustoimija_oid_hist,
	ptkr.koulutustoimija_oid_pihvi,
	ptkr.koulutustoimija_oid_pihvi_hist,
	op.oppija_oid,
	tos.opiskeluoikeus_oid, 
	case when ptkr.ylempi_opiskeluoikeus_oid is not null then 1 else 0 end as hankintakoulutus,
	coalesce(op2.alkamispaiva, op.alkamispaiva) as alkamispaiva,
	tos.paatason_suoritus_id, 
	tos.suoritustason_tunniste,
	tos.koulutusmoduuli_koodiarvo,
	tos.koulutusmoduuli_koodiarvo_numeerinen,

	op.diaarinumero,
	NULL as diaarinumero_tutkinnonosa_koodi, --op.diaarinumero+'_'+cast(tos.koulutusmoduuli_koodiarvo_numeerinen as varchar(25)) as diaarinumero_tutkinnonosa_koodi,

	-- jhe 10.6.2019 vanhojen tutkintojen laajuudet haetaan diaarinumeron perusteella Sepon aputaulusta, tos-arvo j‰tet‰‰n vertailutiedoksi
	koulutusmoduuli_laajuus_arvo_alkup,
	tos.koulutusmoduuli_laajuus_arvo as tos_koulutusmoduuli_laajuus_arvo, 
	case 
		when vtl.diaarinumero is null then tos.koulutusmoduuli_laajuus_arvo 
		else vtl.tutkinnonosa_laajuus 
	end as koulutusmoduuli_laajuus_arvo,

	tos.koulutusmoduuli_koodiarvo_paataso as tutkinto_koodi, 
	ptkr.osaamisala_koodiarvo,
	ptkr.tutkinto_ja_osaamisala_koodi,
	
	ptkr.diaarinumero_tutkinto_koodi,
	ptkr.diaarinumero_tutkinto_ja_osaamisala_koodi,
	
	coalesce(
		CASE 
			WHEN tos.yhteinen_tutkinnon_osa = 1 THEN '1' 
			WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 AND tos.suorittaa_koko_tutkintoa = 0  THEN '1'
			WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 AND tos.suorittaa_koko_tutkintoa = 1  THEN cast(ptkr.kustannusryhma_koodi as varchar)
			WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 0 THEN cast(tos.kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhmia as varchar)
			WHEN usean_tutkinnon_tutkinnonosa = 0 THEN coalesce(okr.kustannusryhma_koodi,tkr.kustannusryhma_koodi)
			ELSE coalesce(okr.kustannusryhma_koodi,tkr.kustannusryhma_koodi)
		END, 
		ptkr.kustannusryhma_koodi
	) AS kustannusryhma_koodi, 
	
	ptkr.alkup_kustannusryhmakoodi, 
	tos.usean_tutkinnon_tutkinnonosa,
	tos.yhteinen_tutkinnon_osa, 
	tos.toisesta_tutkinnosta_sisallytetty_tutkinnonosa, 
	ptkr.suorittaa_koko_tutkintoa, 
	tos.arviointi_paiva, 
	ptkr.vahvistus_paiva

	,coalesce(op2.opintojen_rahoitus_koodi, op.opintojen_rahoitus_koodi) as opintojen_rahoitus_koodi

	,tos.suorituksen_tyyppi
	,coalesce(op2.oppisopimus, op.oppisopimus) as oppisopimus_koodi
	,coalesce(op.erityisopetus_koodi, op2.erityisopetus_koodi) as erityisopetus_koodi
	,coalesce(op.vankilaopetuksessa, op2.vankilaopetuksessa) as vankilaopetus_koodi

	,paataso = 0
	,coalesce(
		CASE 
			WHEN tos.yhteinen_tutkinnon_osa = 1 THEN '1' 
			WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 AND tos.suorittaa_koko_tutkintoa = 0  THEN '1'
			WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 AND tos.suorittaa_koko_tutkintoa = 1  THEN cast(ptkr.kustannusryhma_koodi as varchar)
			WHEN usean_tutkinnon_tutkinnonosa = 1 AND usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 0 THEN cast(tos.kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhma_uusi as varchar)
			WHEN usean_tutkinnon_tutkinnonosa = 0 THEN coalesce(okr.kustannusryhma_koodi,tkr_u.kustannusryhma_koodi)
			ELSE coalesce(okr.kustannusryhma_koodi,tkr_u.kustannusryhma_koodi)
		END, 
		ptkr.kustannusryhma_koodi_uusi
	) AS kustannusryhma_koodi_uusi

FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] tos
INNER JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op ON op.paatason_suoritus_id = tos.paatason_suoritus_id		AND (tos.arviointi_paiva_muokattu between op.alku and op.loppu)
LEFT JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op2 ON op2.opiskeluoikeus_oid = tos.ylempi_opiskeluoikeus_oid	AND tos.arviointi_paiva_muokattu between op2.alku and op2.loppu
INNER JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] ptkr ON ptkr.paatason_suoritus_id = tos.paatason_suoritus_id
LEFT JOIN [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus] vtl on vtl.diaarinumero = op.diaarinumero
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma okr on okr.osaamisala_koodi = coalesce(tos.osaamisala_johon_tutkinnonosa_kuuluu,'')
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = tos.tutkinto_johon_tutkinnonosa_kuuluu
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma tkr on tkr.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi tkr_u on tkr_u.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)



GO


