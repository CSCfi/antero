USE [Koski_SA]
GO


/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 15.9.2020 8:35:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] @minVuosi int = 2018, @maxVuosi int = NULL AS



--4 ß
--Tutkintojen ja tutkinnon osien kustannusryhm‰n m‰‰r‰ytyminen
--Tutkinnon osan kustannusryhm‰ m‰‰r‰ytyy sen tutkinnon mukaisesti, johon tutkinnon osa tutkinnon perusteiden mukaisesti kuuluu.
--Ammatillisesta koulutuksesta annetun lain 13 ß:n 2 momentissa tarkoitetut yhteiset tutkinnon osat kuuluvat kuitenkin kustannusryhm‰‰n 1.

--Jos tutkinnon osa voi tutkinnon perusteiden mukaisesti kuulua useaan tutkintoon, jotka kuuluvat eri kustannusryhmiin,
--tutkinnon osan kustannusryhm‰ m‰‰r‰ytyy sen tutkinnon mukaisesti, jota opiskelija suorittaa.
--Jos opiskelijan tavoitteena on suorittaa vain tutkinnon osa tai osia, t‰ss‰ momentissa tarkoitettu tutkinnon osa kuuluu kustannusryhm‰‰n 1.

-- Erityist‰: nelj‰ll‰ tutkinnolla on kahteen kustannusryhm‰‰n kuuluvia osaamisaloja, joten niiden kustannusryhmi‰ ei haeta kr-taulusta,
-- ..poikkeavat osaamisalat liputetaan laatukontrollia varten sisemm‰ss‰ kyselyss‰, ulommassa kyselyss‰..
-- .. kovakoodataan poikkeukset tutkinnon varsinaisesta kustannusryhm‰st‰, case when t.osaamisala_koodiarvo in.....
-- 12.3 p‰ivitetty Sepon lis‰ykset poikkeaviin osaamisalakoodeihin, meili torstai 7. maaliskuuta 2019 15.09
-- 13.3 toimipiste_nimi pudotettu pois, sis‰lt‰‰ historiatietoa eli samalla oidilla voi olla useita nimiversioita, sotkee raportin
-- 2.4. kustannusryhm‰ liputettu poikkeavaksi jos ei suorita koko tutkintoa

TRUNCATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

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
	FROM koski_sa.sa.sa_koski_opiskeluoikeus
	WHERE koulutusmuoto = 'ammatillinenkoulutus'
	AND lisatiedot_koulutusvienti = 0
)

INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]

SELECT

	t.toimipiste_oid,
	t.oppilaitos_oid,
	t.koulutustoimija_oid,
	t.koulutustoimija_oid_hist,
	t.koulutustoimija_oid_pihvi,
	t.koulutustoimija_oid_pihvi_hist,
	t.opiskeluoikeus_oid,
	t.ylempi_opiskeluoikeus_oid,
	t.paatason_suoritus_id,
	coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi, koulutusmoduuli_koodiarvo) AS tutkinto_koodi, 
	NULL AS osaamisala_koodiarvo, --t.osaamisala_koodiarvo,
	NULL AS tutkinto_ja_osaamisala_koodi, --t.tutkinto_ja_osaamisala_koodi,
	atok.tutkinto_ja_osaamisala_koodi as eper_tutkinto_ja_osaamisala_koodi,

	t.diaarinumero,
	NULL as diaarinumero_tutkinto_koodi, -- t.diaarinumero+'_'+t.koulutusmoduuli_koodiarvo as diaarinumero_tutkinto_koodi,
	NULL as diaarinumero_tutkinto_ja_osaamisala_koodi, -- t.diaarinumero+'_'+t.tutkinto_ja_osaamisala_koodi  as diaarinumero_tutkinto_ja_osaamisala_koodi,
	t.suorituksen_tyyppi,

	case
		WHEN t.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN '1'
		else coalesce(sa1.kustannusryhma_koodi, sa2.kustannusryhma_koodi)
	end 
	AS kustannusryhma_koodi,

	atok.tutkinto_kustannusryhma_koodi AS alkup_kustannusryhmakoodi,
	t.suorittaa_koko_tutkintoa,
	kl.tutkintotyyppi_koodi,
	kl.tutkintotyyppi_fi,
	kl.koulutusluokitus_fi,
	t.vahvistus_paiva,
	t.vahvistus_paiva_muokattu
	,case
		WHEN t.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN '1'
		else coalesce(sa1.kustannusryhma_koodi, sa3.kustannusryhma_koodi)
	end 
	AS kustannusryhma_koodi_uusi

FROM   (

	SELECT distinct
			
		replace(replace(replace(replace(substring(data,CHARINDEX('"perusteenDiaarinumero": ',data)+26,15),'}',''),'"',''),',',''),' ','') as diaarinumero,
		ps.toimipiste_oid,
		oo.oppilaitos_oid,
		coalesce(so.koulutustoimija_oid, oo.koulutustoimija_oid) as koulutustoimija_oid,
		coalesce(so.vanha_koulutustoimija_oid, oo.vanha_koulutustoimija_oid) as koulutustoimija_oid_hist,
		case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.koulutustoimija_oid else oo2.koulutustoimija_oid end as koulutustoimija_oid_pihvi,
		case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then oo.vanha_koulutustoimija_oid else oo2.vanha_koulutustoimija_oid end as koulutustoimija_oid_pihvi_hist,
		ps.opiskeluoikeus_oid,
		oo.sisaltyy_opiskeluoikeuteen_oid as ylempi_opiskeluoikeus_oid,
		ps.paatason_suoritus_id,
		CASE
			WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1
			ELSE 0
		END 
		AS suorittaa_koko_tutkintoa,
		ps.koulutusmoduuli_koodiarvo,

		ps.osaamisala_koodiarvo,

		CASE
			WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo = '999904' THEN ps.tutkinto_koodiarvo
			WHEN ps.osaamisala_koodiarvo IS NULL and ps.koulutusmoduuli_koodiarvo <> '999904' THEN ps.koulutusmoduuli_koodiarvo
			WHEN ps.osaamisala_koodiarvo IS NOT NULL THEN ps.osaamisala_koodiarvo
		END AS tutkinto_ja_osaamisala_koodi,

		ps.suorituksen_tyyppi,
		ps.vahvistus_paiva,
			
		CASE
			WHEN ps.vahvistus_paiva < oo.alkamispaiva THEN oo.alkamispaiva
			WHEN ps.vahvistus_paiva > oo.paattymispaiva THEN oo.paattymispaiva
			ELSE ps.vahvistus_paiva
		END 
		AS vahvistus_paiva_muokattu

	FROM CTE AS oo
	LEFT JOIN CTE AS oo2 on oo2.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid
	LEFT JOIN koski_sa.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN CTE AS so ON so.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid --and so.opiskeluoikeus_oid is not null
	WHERE ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
	--AND year(ps.vahvistus_paiva) between @minVuosi and coalesce(@maxVuosi, 9999)
				

) AS t

LEFT JOIN (SELECT DISTINCT tutkinto_ja_osaamisala_koodi, tutkinto_kustannusryhma_koodi FROM dbo.kustannusryhma_tutkinto_ja_osaamisala) atok on atok.tutkinto_ja_osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi
LEFT JOIN ANTERO.sa.sa_amos_osaamisala_kustannusryhma sa1 on sa1.osaamisala_koodi = t.tutkinto_ja_osaamisala_koodi
LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = t.koulutusmoduuli_koodiarvo
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma sa2 on sa2.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)
LEFT JOIN ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi sa3 on sa3.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi)


GO

USE ANTERO
