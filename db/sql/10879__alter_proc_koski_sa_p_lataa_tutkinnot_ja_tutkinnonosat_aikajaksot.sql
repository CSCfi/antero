USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot]    Script Date: 31.7.2025 10.32.36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



IF @@SERVERNAME like '%pvipu%'
EXEC (
'
ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot] AS

DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]

;WITH cte AS (
	SELECT
		 ooa.opiskeluoikeus_oid
		,alku
		,loppu
		,opintojen_rahoitus --= case when tila = ''lasna'' then opintojen_rahoitus end
	FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
)

SELECT
	oo.master_oid
	,oo.opiskeluoikeus_oid as opiskeluoikeus_oid
	,oo.alkamispaiva
	,case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then 1 else 0 end as sisaltyy_toiseen
	,oo.oppilaitos_oid
	,oo.koulutustoimija_oid

	,ooa.tila
	,ooa.alku
	,ooa.loppu
	,oppisopimus = ooa.oppisopimus_jossain_paatason_suorituksessa
	,coalesce(ooa.opintojen_rahoitus, ooa2.opintojen_rahoitus, ooa3.opintojen_rahoitus, ooa4.opintojen_rahoitus, ooa5.opintojen_rahoitus, ooa6.opintojen_rahoitus) as opintojen_rahoitus_koodi
	,CASE
		WHEN (erityinen_tuki=1 or hojks=1) and vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in (''telma'',''valma'') THEN 2						--Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht
		WHEN (erityinen_tuki=1 or hojks=1) and vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in (''telma'',''valma'') THEN 3							--Erityisopiskelija ilman erit. tehtävää; valmentava
		WHEN vaativan_erityisen_tuen_erityinen_tehtava=1 and ps.suorituksen_tyyppi not in (''telma'',''valma'') and vaikeasti_vammainen=0 and vammainen_ja_avustaja=0 THEN 4	--Erit. tuen tehtävä; tutk.joht; erityisopiskelija
		WHEN ps.suorituksen_tyyppi not in (''telma'',''valma'') and vaikeasti_vammainen=1 THEN 5																				--Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
		WHEN ps.suorituksen_tyyppi not in (''telma'',''valma'') and vammainen_ja_avustaja=1 THEN 6																				--Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
		WHEN vaativan_erityisen_tuen_erityinen_tehtava=1 and ps.suorituksen_tyyppi in (''telma'',''valma'') and vaikeasti_vammainen=0 and vammainen_ja_avustaja=0 THEN 7		--Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
		WHEN ps.suorituksen_tyyppi in (''telma'',''valma'') and vaikeasti_vammainen=1 THEN 8																					--Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
		WHEN ps.suorituksen_tyyppi in (''telma'',''valma'') and vammainen_ja_avustaja=1 THEN 9																					--Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
		WHEN erityinen_tuki=0 THEN 1																																			--Ei erityisopiskelija
		ELSE 9
	 END as erityisopetus_koodi
	 ,ooa.vankilaopetuksessa

INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]

FROM sa.sa_koski_opiskeluoikeus oo
INNER JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
INNER JOIN (
	select
		opiskeluoikeus_oid
		,suorituksen_tyyppi
	from (
		select distinct 
			opiskeluoikeus_oid
			,suorituksen_tyyppi
			,rnk=rank() over (partition by opiskeluoikeus_oid order by suorituksen_tyyppi,osaamisala_koodiarvo,koulutusmoduuli_koodiarvo)
		from sa.sa_koski_paatason_suoritus
	) q
	where rnk=1
) ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN sa.sa_koski_opiskeluoikeus oo2 ON oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and oo2.koulutustoimija_oid != oo.koulutustoimija_oid
--puuttuva rahoitus otetaan edellisestä jaksosta
LEFT JOIN cte as ooa2 on ooa2.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and DATEDIFF(DAY,ooa2.loppu, ooa.alku) = 1
LEFT JOIN cte as ooa3 on ooa3.opiskeluoikeus_oid = ooa2.opiskeluoikeus_oid and DATEDIFF(DAY,ooa3.loppu, ooa2.alku) = 1
LEFT JOIN cte as ooa4 on ooa4.opiskeluoikeus_oid = ooa3.opiskeluoikeus_oid and DATEDIFF(DAY,ooa4.loppu, ooa3.alku) = 1
--jos ei löydy edellisistä niin katsotaan myöhemmistä
LEFT JOIN cte as ooa5 on ooa5.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and DATEDIFF(DAY,ooa.loppu, ooa5.alku) = 1
LEFT JOIN cte as ooa6 on ooa6.opiskeluoikeus_oid = ooa5.opiskeluoikeus_oid and DATEDIFF(DAY,ooa5.loppu, ooa6.alku) = 1

WHERE oo.koulutusmuoto = ''ammatillinenkoulutus''
'
)

GO
