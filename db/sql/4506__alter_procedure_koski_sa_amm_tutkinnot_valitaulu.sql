USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_amm_tutkinnot_valitaulu]    Script Date: 25.3.2021 17:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_amm_tutkinnot_valitaulu] @alkuPvm2 as date = '2018-01-01', @loppuPvm2 as date = NULL AS

DECLARE @year int, @alkupvm as date, @loppupvm as date
SET @year = YEAR(@alkuPvm2)

SET @alkupvm=@alkuPvm2
IF @loppuPvm2 is null SET @loppuPvm = EOMONTH(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)) ELSE SET @loppupvm=@loppuPvm2

--EXEC [sa].[p_lataa_amm_paatason_suoritus]


WHILE @year <= year(@loppuPvm)

BEGIN

	DELETE FROM [dbo].[amm_tutkinnot_valitaulu] WHERE vuosi = @year


	;WITH
	lasna_paivat AS (
		SELECT
			opiskeluoikeus_oid
			,paivat = sum(datediff(day,alku,loppu)+1)
		FROM sa.sa_koski_opiskeluoikeus_aikajakso ooa	
		WHERE tila in ('lasna','valmistunut','loma')
		GROUP BY opiskeluoikeus_oid
	)

	,hylatyt_loma_paivat AS (
		SELECT 
			opiskeluoikeus_oid
			,paivat = sum(case when datediff(day,tila_alkanut,loppu)+1 > 28 then datediff(day,tila_alkanut,loppu)+1-28 else 0 end)
		FROM (
			SELECT 
				opiskeluoikeus_oid
				,tila_alkanut
				,loppu = max(loppu)
			FROM sa.sa_koski_opiskeluoikeus_aikajakso ooa	
			WHERE tila = 'loma'
			GROUP BY opiskeluoikeus_oid,tila_alkanut
		) Q
		GROUP BY opiskeluoikeus_oid
	)

	,opso_koso_paivat AS (
		SELECT 
			paatason_suoritus_id
			,sopimusmuoto
			,paivat = sum(paivat)
		FROM (
			SELECT distinct 
				sj.paatason_suoritus_id
				,sopimusmuoto = case when sopimusmuoto like '%oppisopimu%' then 1 when sopimusmuoto = 'Koulutussopimus' then 2 else 0 end
				,alku
				,paivat = datediff(day,alku,coalesce(loppu,ps.vahvistus_paiva)) + 1
			FROM [Koski_SA].[sa].[sa_koski_ammatillisen_koulutuksen_sopimusjaksot] sj
			LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps on ps.paatason_suoritus_id = sj.paatason_suoritus_id
			WHERE 1=1
		) k
		WHERE sopimusmuoto in (1,2)
		GROUP BY paatason_suoritus_id, sopimusmuoto
	)

	INSERT INTO [dbo].[amm_tutkinnot_valitaulu] 

	SELECT 

		 vuosi = year(ps.vahvistus_paiva)
		,kuukausi = month(ps.vahvistus_paiva)
		,sukupuoli = 
			case 
				when cast(substring(h.hetu,8,3) as int) % 2 = 1 then '1' 
				when cast(substring(h.hetu,8,3) as int) % 2 = 0 then '2' 
				else null 
			end
		,aidinkieli = h.aidinkieli
		,ika = year(ps.vahvistus_paiva) - year(h.syntymaaika) 
		,kansalaisuus = left(kansalaisuus, 3)
		,erityisopetus = 
			case				
				when (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma') then 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
				when (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma') then 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
				when ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 then 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
				when ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vaikeasti_vammainen = 1 then 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
				when ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vammainen_ja_avustaja = 1 then 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
				when ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi in ('telma','valma') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 then 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
				when ps.suorituksen_tyyppi in ('telma','valma') and ooa.vaikeasti_vammainen = 1 then 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
				when ps.suorituksen_tyyppi in ('telma','valma') and ooa.vammainen_ja_avustaja = 1 then 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
				when ooa.erityinen_tuki = 0 then 1 --Ei erityisopiskelija
				else -1
			end
		,ooa.opintojen_rahoitus
		,majoitus =
			case					
				when ooa.majoitus = 1 then 2
				when ooa.sisaoppilaitosmainen_majoitus = 1 then 3
				when ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus = 1 then 4
				else 1
			end
		,ps.tutkinto_koodi
		,ps.osaamisala_koodiarvo
		,ps.suorituskieli_koodiarvo
		,ps.toimipiste_oid
		,oo.oppilaitos_oid
		,koulutustoimija_oid = coalesce(oo2.koulutustoimija_oid, oo.koulutustoimija_oid)
		,henkilostokoulutus = oo.lisatiedot_henkilostokoulutus
		,ps.suorituksen_tyyppi
		,opiskeluoikeus_pv = hyv_pv.paivat - coalesce(hyl_pv.paivat,0)
		,oppisopimus_pv = case when os_ks.sopimusmuoto = 1 then os_ks.paivat end
		,koulutussopimus_pv = case when os_ks.sopimusmuoto = 2 then os_ks.paivat end
		,oo.oppija_oid
		,oo.opiskeluoikeus_oid
		
	FROM [sa].[sa_koski_opiskeluoikeus] oo
	LEFT JOIN sa.sa_koski_opiskeluoikeus oo2 on oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and oo.sisaltyy_opiskeluoikeuteen_oid is not null
	LEFT JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
	LEFT JOIN sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ps.rnk = 1
	LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and (case when ps.vahvistus_paiva > coalesce(oo.paattymispaiva,'9999-12-31') then oo.paattymispaiva else ps.vahvistus_paiva end) between ooa.alku and ooa.loppu
	--läsnäolopäivät
	LEFT JOIN (select * from lasna_paivat) hyv_pv on hyv_pv.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	--lomapäivät
	LEFT JOIN (select * from hylatyt_loma_paivat) hyl_pv on hyl_pv.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	--opso- ja koso-päivät
	LEFT JOIN (select * from opso_koso_paivat) os_ks on os_ks.paatason_suoritus_id = ps.paatason_suoritus_id

	WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'
	AND ps.vahvistus_paiva is not null
	AND year(ps.vahvistus_paiva) = @year AND ps.vahvistus_paiva <= @loppuPvm
	--kuoriopiskeluoikeudet pois
	AND NOT EXISTS (select 1 from sa.sa_koski_opiskeluoikeus sa where sa.sisaltyy_opiskeluoikeuteen_oid is not null and sa.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid)

	SET @year = @year + 1

END