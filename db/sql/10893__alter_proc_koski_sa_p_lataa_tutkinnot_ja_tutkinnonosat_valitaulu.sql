USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 31.7.2025 10.36.59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



IF @@SERVERNAME like '%pvipu%'
EXEC (
'
ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu] AS

TRUNCATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]

INSERT INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu] (
	vuosi
	,kuukausi
	,toimipiste_oid
	,oppilaitos_oid
	,oppilaitos_oid_pihvi
	,koulutustoimija_oid
	,koulutustoimija_oid_hist
	,koulutustoimija_oid_pihvi
	,koulutustoimija_oid_pihvi_hist
	,master_oid
	,opiskeluoikeus_oid
	,hankintakoulutus
	,alkamispaiva
	,paatason_suoritus_id
	,suoritustason_tunniste
	,koulutusmoduuli_koodiarvo
	,koulutusmoduuli_koodiarvo_numeerinen
	,diaarinumero
	,diaarinumero_tutkinnonosa_koodi
	,koulutusmoduuli_laajuus_arvo_alkup
	,tos_koulutusmoduuli_laajuus_arvo
	,koulutusmoduuli_laajuus_arvo
	,tutkinto_koodi
	,osaamisala_koodiarvo
	,diaarinumero_tutkinto_koodi
	,diaarinumero_tutkinto_ja_osaamisala_koodi
	,suorituskieli_koodiarvo
	,kustannusryhma_koodi
	,ep_usean_tutkinnon_tutkinnonosa
	,yhteinen_tutkinnon_osa
	,toisesta_tutkinnosta_sisallytetty_tutkinnonosa
	,suorittaa_koko_tutkintoa
	,arviointi_paiva
	,vahvistus_paiva
	,opintojen_rahoitus_koodi
	,suorituksen_tyyppi
	,oppisopimus_koodi
	,erityisopetus_koodi
	,vankilaopetus_koodi
	,paataso
	,duplikaatti
	,paallekkainen_tuva
	,duplikaatti_suorituskausittain
)

SELECT 
	year(ptkr.vahvistus_paiva) as vuosi,
	month(ptkr.vahvistus_paiva) as kuukausi,
	ptkr.toimipiste_oid, 
	ptkr.oppilaitos_oid,
	ptkr.oppilaitos_oid_pihvi,
	ptkr.koulutustoimija_oid,
	ptkr.koulutustoimija_oid_hist,
	ptkr.koulutustoimija_oid_pihvi,
	ptkr.koulutustoimija_oid_pihvi_hist,
	op.master_oid,
	ptkr.opiskeluoikeus_oid,
	case when ptkr.ylempi_opiskeluoikeus_oid is not null then 1 else 0 end as hankintakoulutus,
	coalesce(op2.alkamispaiva, op.alkamispaiva) as alkamispaiva,
	ptkr.paatason_suoritus_id,
	NULL AS suoritustason_tunniste,
	NULL AS koulutusmoduuli_koodiarvo,
	NULL AS koulutusmoduuli_koodiarvo_numeerinen,
	ptkr.diaarinumero,
	NULL as diaarinumero_tutkinnonosa_koodi,

	0 as koulutusmoduuli_laajuus_arvo_alkup,
	0 as tos_koulutusmoduuli_laajuus_arvo, 
	0 as koulutusmoduuli_laajuus_arvo,

	ptkr.tutkinto_koodi, 
	ptkr.osaamisala_koodiarvo,
	--ptkr.tutkinto_ja_osaamisala_koodi,
	ptkr.diaarinumero_tutkinto_koodi,
	ptkr.diaarinumero_tutkinto_ja_osaamisala_koodi,
	ptkr.suorituskieli_koodiarvo,

	ptkr.kustannusryhma_koodi,
	--ptkr.alkup_kustannusryhmakoodi, 

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
	,duplikaatti = 0
	,paallekkainen_tuva = 0
	,duplikaatti_suorituskausittain = 0

FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] as ptkr  
INNER JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op ON ptkr.opiskeluoikeus_oid = op.opiskeluoikeus_oid	AND ptkr.vahvistus_paiva_muokattu between op.alku and op.loppu
LEFT JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op2 ON op2.opiskeluoikeus_oid = ptkr.ylempi_opiskeluoikeus_oid	AND ptkr.vahvistus_paiva_muokattu_kuori between op2.alku and op2.loppu

WHERE 1=1
AND ptkr.tutkintotyyppi_koodi IN (''02'',''19'',''20'')
AND ptkr.suorituksen_tyyppi IN (''ammatillinentutkinto'',''ammatillinentutkintoosittainen'')
--kuorioikeudet pois
AND ptkr.opiskeluoikeus_oid NOT IN (select sisaltyy_opiskeluoikeuteen_oid from sa.sa_koski_opiskeluoikeus where koulutusmuoto = ''ammatillinenkoulutus'' and sisaltyy_opiskeluoikeuteen_oid is not null)
AND year(ptkr.vahvistus_paiva) >= 2018

UNION ALL

SELECT 
	year(tos.arviointi_paiva) as vuosi,
	month(tos.arviointi_paiva) as kuukausi,
	ptkr.toimipiste_oid, 
	ptkr.oppilaitos_oid,
	ptkr.oppilaitos_oid_pihvi,
	tos.koulutustoimija_oid,
	tos.koulutustoimija_oid_hist,
	ptkr.koulutustoimija_oid_pihvi,
	ptkr.koulutustoimija_oid_pihvi_hist,
	op.master_oid,
	tos.opiskeluoikeus_oid, 
	case when ptkr.ylempi_opiskeluoikeus_oid is not null then 1 else 0 end as hankintakoulutus,
	coalesce(op2.alkamispaiva, op.alkamispaiva) as alkamispaiva,
	tos.paatason_suoritus_id, 
	tos.suoritustason_tunniste,
	tos.koulutusmoduuli_koodiarvo,
	tos.koulutusmoduuli_koodiarvo_numeerinen,

	ptkr.diaarinumero,
	NULL as diaarinumero_tutkinnonosa_koodi,

	-- jhe 10.6.2019 vanhojen tutkintojen laajuudet haetaan diaarinumeron perusteella aputaulusta, tos-arvo jätetään vertailutiedoksi
	koulutusmoduuli_laajuus_arvo_alkup,
	tos.koulutusmoduuli_laajuus_arvo as tos_koulutusmoduuli_laajuus_arvo, 
	case 
		when vtl.diaarinumero is null then tos.koulutusmoduuli_laajuus_arvo 
		else vtl.tutkinnonosa_laajuus 
	end as koulutusmoduuli_laajuus_arvo,

	tos.koulutusmoduuli_koodiarvo_paataso as tutkinto_koodi, 
	osaamisala_max,--ptkr.osaamisala_koodiarvo
	--ptkr.tutkinto_ja_osaamisala_koodi,
	ptkr.diaarinumero_tutkinto_koodi,
	ptkr.diaarinumero_tutkinto_ja_osaamisala_koodi,
	ptkr.suorituskieli_koodiarvo,
	
	coalesce(
		case 
			when tos.yhteinen_tutkinnon_osa = 1 then ''1'' 
			when usean_tutkinnon_tutkinnonosa = 1 and usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 and tos.suorittaa_koko_tutkintoa = 0  then ''1''
			when usean_tutkinnon_tutkinnonosa = 1 and usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 1 and tos.suorittaa_koko_tutkintoa = 1  then coalesce(okr2.kustannusryhma_koodi, tkr2.kustannusryhma_koodi)
			when usean_tutkinnon_tutkinnonosa = 1 and usean_tutkinnon_tutkinnonosa_usea_kustannusryhma = 0 then tos.minimi_kustannusryhma
			when usean_tutkinnon_tutkinnonosa = 0 then tos.minimi_kustannusryhma
		end, 
		coalesce(case when tos.suorittaa_koko_tutkintoa = 0 then ''1'' end, okr2.kustannusryhma_koodi, tkr2.kustannusryhma_koodi)
	) as kustannusryhma_koodi, 
	
	--ptkr.alkup_kustannusryhmakoodi, 
	tos.usean_tutkinnon_tutkinnonosa,
	tos.yhteinen_tutkinnon_osa, 
	--tos.toisesta_tutkinnosta_sisallytetty_tutkinnonosa, 
	NULL AS toisesta_tutkinnosta_sisallytetty_tutkinnonosa,
	ptkr.suorittaa_koko_tutkintoa, 
	tos.arviointi_paiva, 
	ptkr.vahvistus_paiva

	,coalesce(op2.opintojen_rahoitus_koodi, op.opintojen_rahoitus_koodi) as opintojen_rahoitus_koodi

	,tos.suorituksen_tyyppi
	,coalesce(op2.oppisopimus, op.oppisopimus) as oppisopimus_koodi
	,coalesce(op.erityisopetus_koodi, op2.erityisopetus_koodi) as erityisopetus_koodi
	,coalesce(op.vankilaopetuksessa, op2.vankilaopetuksessa) as vankilaopetus_koodi

	,paataso = 0
	,duplikaatti = 0
	,paallekkainen_tuva = 0
	,duplikaatti_suorituskausittain = 0

FROM [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] tos
INNER JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op ON op.opiskeluoikeus_oid = tos.opiskeluoikeus_oid AND (tos.arviointi_paiva_muokattu between op.alku and op.loppu)
LEFT JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot] op2 ON op2.opiskeluoikeus_oid = tos.ylempi_opiskeluoikeus_oid AND tos.arviointi_paiva_muokattu_kuori between op2.alku and op2.loppu
INNER JOIN [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] ptkr ON ptkr.paatason_suoritus_id = tos.paatason_suoritus_id
LEFT JOIN [dbo].[vanhat_tutkinnot_laajuus_diaarinumerokohdistus] vtl on vtl.diaarinumero = ptkr.diaarinumero
--LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma okr on okr.osaamisala_koodi = coalesce(tos.osaamisala_johon_tutkinnonosa_kuuluu,'''') and year(tos.arviointi_paiva) between year(okr.alkupvm) and year(coalesce(okr.loppupvm,''9999-12-31''))
--LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = tos.tutkinto_johon_tutkinnonosa_kuuluu
--LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma tkr on tkr.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) and year(tos.arviointi_paiva) between year(tkr.alkupvm) and year(coalesce(tkr.loppupvm,''9999-12-31''))
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma okr2 on okr2.osaamisala_koodi = coalesce(ptkr.osaamisala_koodiarvo,'''') and year(tos.arviointi_paiva) between year(okr2.alkupvm) and year(coalesce(okr2.loppupvm,''9999-12-31''))
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl2 on kl2.koulutusluokitus_koodi = ptkr.tutkinto_koodi
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma tkr2 on tkr2.tutkinto_koodi = coalesce(kl2.uusi_eat_koodi, kl2.koulutusluokitus_koodi) and year(tos.arviointi_paiva) between year(tkr2.alkupvm) and year(coalesce(tkr2.loppupvm,''9999-12-31''))
--LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi tkr_u on tkr_u.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)
--kuorioikeudet pois
--WHERE ptkr.opiskeluoikeus_oid NOT IN (select sisaltyy_opiskeluoikeuteen_oid from sa.sa_koski_opiskeluoikeus where koulutusmuoto = ''ammatillinenkoulutus'' and sisaltyy_opiskeluoikeuteen_oid is not null)

WHERE tos.suorituksen_tyyppi IN (''ammatillinentutkinto'',''ammatillinentutkintoosittainen'')
'
)

GO
