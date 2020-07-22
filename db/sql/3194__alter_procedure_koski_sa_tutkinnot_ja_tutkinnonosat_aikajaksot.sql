USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot]    Script Date: 22.7.2020 16:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot] AS

DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]

;WITH cte AS (
	SELECT
		 ooa.opiskeluoikeus_oid
		,alku
		,loppu
		,opintojen_rahoitus
	FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
)

--INSERT INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]

SELECT

	 oo.oppija_oid
	,oo.opiskeluoikeus_oid as opiskeluoikeus_oid
	,oo.alkamispaiva
	,case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then 1 else 0 end as sisaltyy_toiseen
	,oo.oppilaitos_oid
	,oo.koulutustoimija_oid
	--12.5.2019 diaarinumero haettava data-kentän jsonista, per mikkonen email pe 10.5.2019 11.21
	--16.5.2019 siivotaan välilyönnit diaarinumeroista (uloin replace)
	--,coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) as tutkinto_koodi
	,ps.diaarinumero as diaarinumero
	,NULL /* replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo */ as diaarinumero_tutkinto_koodi

	,/* case
		when ps.osaamisala_koodiarvo is null then replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo
		else replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo+'_'+ps.osaamisala_koodiarvo
	 end */ NULL as diaarinumero_tutkinto_osaamisala_koodi

	,ooa.tila
	,ooa.alku
	,ooa.loppu
	,ooa.oppisopimus_jossain_paatason_suorituksessa AS oppisopimus
	,coalesce(ooa.opintojen_rahoitus, ooa2.opintojen_rahoitus, ooa3.opintojen_rahoitus, ooa4.opintojen_rahoitus, ooa5.opintojen_rahoitus, ooa6.opintojen_rahoitus) as opintojen_rahoitus_koodi

	,CASE
		WHEN (erityinen_tuki=1 or hojks=1) and vaativan_erityisen_tuen_erityinen_tehtava=0 and suorituksen_tyyppi not in ('telma','valma') THEN 2						--Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht
		WHEN (erityinen_tuki=1 or hojks=1) and vaativan_erityisen_tuen_erityinen_tehtava=0 and suorituksen_tyyppi in ('telma','valma') THEN 3							--Erityisopiskelija ilman erit. tehtävää; valmentava
		WHEN vaativan_erityisen_tuen_erityinen_tehtava=1 and suorituksen_tyyppi not in ('telma','valma') and vaikeasti_vammainen=0 and vammainen_ja_avustaja=0 THEN 4	--Erit. tuen tehtävä; tutk.joht; erityisopiskelija
		WHEN suorituksen_tyyppi not in ('telma','valma') and vaikeasti_vammainen=1 THEN 5																				--Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
		WHEN suorituksen_tyyppi not in ('telma','valma') and vammainen_ja_avustaja=1 THEN 6																				--Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
		WHEN vaativan_erityisen_tuen_erityinen_tehtava=1 and suorituksen_tyyppi in ('telma','valma') and vaikeasti_vammainen=0 and vammainen_ja_avustaja=0 THEN 7		--Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
		WHEN suorituksen_tyyppi in ('telma','valma') and vaikeasti_vammainen=1 THEN 8																					--Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
		WHEN suorituksen_tyyppi in ('telma','valma') and vammainen_ja_avustaja=1 THEN 9																					--Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
		WHEN erityinen_tuki=0 THEN 1																																	--Ei erityisopiskelija
		ELSE 9
	 END as erityisopetus_koodi
	 ,ooa.vankilaopetuksessa
	 ,ps.paatason_suoritus_id

INTO [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]

FROM sa.sa_koski_opiskeluoikeus oo
INNER JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
INNER JOIN (select distinct opiskeluoikeus_oid,paatason_suoritus_id,suorituksen_tyyppi,diaarinumero = replace(replace(replace(replace(substring(data,CHARINDEX('"perusteenDiaarinumero": ',data)+26,15),'}',''),'"',''),',',''),' ','') from sa.sa_koski_paatason_suoritus) ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN sa.sa_koski_opiskeluoikeus oo2 ON oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and oo.sisaltyy_opiskeluoikeuteen_oid is not null
--LEFT JOIN dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo, '999904'), ps.tutkinto_koodiarvo)
--puuttuva rahoitus otetaan edellisestä läsnäolojaksosta AP 20.6.2019
LEFT JOIN cte as ooa2 on ooa2.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and DATEDIFF(DAY,ooa2.loppu, ooa.alku) = 1
LEFT JOIN cte as ooa3 on ooa3.opiskeluoikeus_oid = ooa2.opiskeluoikeus_oid and DATEDIFF(DAY,ooa3.loppu, ooa2.alku) = 1
LEFT JOIN cte as ooa4 on ooa4.opiskeluoikeus_oid = ooa3.opiskeluoikeus_oid and DATEDIFF(DAY,ooa4.loppu, ooa3.alku) = 1
--jos ei löydy edellisistä niin katsotaan myöhemmistä
LEFT JOIN cte as ooa5 on ooa5.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and DATEDIFF(DAY,ooa.loppu, ooa5.alku) = 1
LEFT JOIN cte as ooa6 on ooa6.opiskeluoikeus_oid = ooa5.opiskeluoikeus_oid and DATEDIFF(DAY,ooa5.loppu, ooa6.alku) = 1

WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'
--AND (kl.tutkintotyyppi_koodi IN ('02','19','20') OR koulutusmoduuli_koodiarvo IN ('999901','999903')) --AP 17.10.2019 valma ja telma mukaan
--AND (ps.suorituksen_tyyppi <> 'nayttotutkintoonvalmistavakoulutus') --jhe 17.5.2019 Juhon meili:"Eli sun pitää pudottaa sieltä pois kaikki päätason suoritukset, joiden tyyppi on "nayttotutkintoonvalmistavakoulutus". Niistä ei tarvi katsoa ollenkaan osasuorituksia."


GO
USE [ANTERO]