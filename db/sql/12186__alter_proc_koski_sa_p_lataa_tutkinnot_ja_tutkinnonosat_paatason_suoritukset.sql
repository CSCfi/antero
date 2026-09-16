USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] @minVuosi int = 2018, @maxVuosi int = NULL AS

DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

;WITH CTE AS (
	SELECT
		opiskeluoikeus_oid
		,sisaltyy_opiskeluoikeuteen_oid
		,lisatiedot_koulutusvienti
		,koulutustoimija_oid
		,vanha_koulutustoimija_oid
		,oppilaitos_oid
		,alkamispaiva
		,paattymispaiva = COALESCE(paattymispaiva,'9999-12-31')
	FROM sa.sa_koski_opiskeluoikeus
	WHERE koulutusmuoto = 'ammatillinenkoulutus'
)

SELECT
	t.toimipiste_oid,
	t.oppilaitos_oid,
	t.oppilaitos_oid_pihvi,
	t.koulutustoimija_oid,
	t.koulutustoimija_oid_hist,
	t.koulutustoimija_oid_pihvi,
	t.koulutustoimija_oid_pihvi_hist,
	t.opiskeluoikeus_oid,
	t.ylempi_opiskeluoikeus_oid,
	t.paatason_suoritus_id,
	coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi, koulutusmoduuli_koodiarvo) AS tutkinto_koodi, 
	t.osaamisala_koodiarvo,

	t.diaarinumero,
	NULL as diaarinumero_tutkinto_koodi, -- t.diaarinumero+'_'+t.koulutusmoduuli_koodiarvo as diaarinumero_tutkinto_koodi,
	NULL as diaarinumero_tutkinto_ja_osaamisala_koodi, -- t.diaarinumero+'_'+t.tutkinto_ja_osaamisala_koodi  as diaarinumero_tutkinto_ja_osaamisala_koodi,
	t.suorituksen_tyyppi,
	t.suorituskieli_koodiarvo,

	case
		WHEN t.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN '1'
		else coalesce(sa1.kustannusryhma_koodi, sa2.kustannusryhma_koodi)
	end 
	AS kustannusryhma_koodi,

	t.suorittaa_koko_tutkintoa,
	kl.tutkintotyyppi_koodi,
	kl.tutkintotyyppi_fi,
	kl.koulutusluokitus_fi,
	t.vahvistus_paiva,
	t.vahvistus_paiva_muokattu
	,t.vahvistus_paiva_muokattu_kuori

INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

FROM   (

	SELECT DISTINCT
		diaarinumero = ps.perusteenDiaarinumero,
		ps.toimipiste_oid,
		oppilaitos_oid = coalesce(so.oppilaitos_oid, oo.oppilaitos_oid),
		oppilaitos_oid_pihvi = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.oppilaitos_oid else oo2.oppilaitos_oid end,
		koulutustoimija_oid = coalesce(so.koulutustoimija_oid, oo.koulutustoimija_oid),
		koulutustoimija_oid_hist = case when so.koulutustoimija_oid is null then oo.vanha_koulutustoimija_oid else so.vanha_koulutustoimija_oid end,--coalesce(so.vanha_koulutustoimija_oid, oo.vanha_koulutustoimija_oid),
		koulutustoimija_oid_pihvi = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.koulutustoimija_oid else oo2.koulutustoimija_oid end,
		koulutustoimija_oid_pihvi_hist = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.vanha_koulutustoimija_oid else oo2.vanha_koulutustoimija_oid end,
		ps.opiskeluoikeus_oid,
		ylempi_opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid,
		ps.paatason_suoritus_id,
		suorittaa_koko_tutkintoa = 
			CASE
				WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1
				ELSE 0
			END,
		ps.koulutusmoduuli_koodiarvo,
		ps.osaamisala_koodiarvo,
		tutkinto_ja_osaamisala_koodi = 
			CASE
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo = '999904' THEN ps.tutkinto_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo <> '999904' THEN ps.koulutusmoduuli_koodiarvo
				WHEN ps.osaamisala_koodiarvo IS NOT NULL THEN ps.osaamisala_koodiarvo
			END,
		ps.suorituksen_tyyppi,
		ps.suorituskieli_koodiarvo,
		ps.vahvistus_paiva,
		vahvistus_paiva_muokattu = 
			CASE
				WHEN ps.vahvistus_paiva < oo.alkamispaiva THEN oo.alkamispaiva
				WHEN ps.vahvistus_paiva > oo.paattymispaiva THEN oo.paattymispaiva
				ELSE ps.vahvistus_paiva
			END,
		vahvistus_paiva_muokattu_kuori = 
			CASE
				WHEN ps.vahvistus_paiva < so.alkamispaiva THEN so.alkamispaiva
				WHEN ps.vahvistus_paiva > so.paattymispaiva THEN so.paattymispaiva
				ELSE ps.vahvistus_paiva
			END,
		rnk = RANK() OVER (
			PARTITION BY paatason_suoritus_id 
			ORDER BY (case when ps.vahvistus_paiva between ps.osaamisala_alku and ps.osaamisala_loppu then ps.osaamisala_alku end) desc
				,(case when ps.osaamisala_loppu < ps.vahvistus_paiva then ps.osaamisala_loppu end) desc
				,(case when ps.osaamisala_alku < ps.vahvistus_paiva then ps.osaamisala_alku end) desc
				,ps.osaamisala_koodiarvo desc
				,(case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.koulutustoimija_oid else oo2.koulutustoimija_oid end)
		)

	FROM CTE AS oo
	LEFT JOIN CTE AS oo2 on oo2.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid and oo2.koulutustoimija_oid != oo.koulutustoimija_oid
	LEFT JOIN sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN CTE AS so ON so.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and so.koulutustoimija_oid != oo.koulutustoimija_oid
	WHERE ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'

) t
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma sa1 on sa1.osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi and year(vahvistus_paiva) between year(sa1.alkupvm)and year(coalesce(sa1.loppupvm,'9999-12-31'))
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = t.koulutusmoduuli_koodiarvo
LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma sa2 on sa2.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) and year(vahvistus_paiva) between year(sa2.alkupvm) and year(coalesce(sa2.loppupvm,'9999-12-31'))

WHERE rnk=1

GO
