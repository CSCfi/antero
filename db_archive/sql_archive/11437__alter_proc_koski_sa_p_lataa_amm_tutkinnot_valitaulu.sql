USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_amm_tutkinnot_valitaulu] @alkuPvm2 as date = '2018-01-01', @loppuPvm2 as date = NULL AS

DECLARE @year int, @alkupvm as date, @loppupvm as date
SET @year = YEAR(@alkuPvm2)

SET @alkupvm = @alkuPvm2
IF @loppuPvm2 is null SET @loppuPvm = EOMONTH(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)) ELSE SET @loppupvm=@loppuPvm2


TRUNCATE TABLE [dbo].[amm_tutkinnot_valitaulu]

WHILE @year <= year(@loppuPvm)

BEGIN

	--DELETE FROM [dbo].[amm_tutkinnot_valitaulu] WHERE vuosi = @year

	DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_lasna_paivat
	DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_hylatyt_loma_paivat
	DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_opso_koso_paivat

	SELECT
		opiskeluoikeus_oid
		,paivat = sum(datediff(day, alku, case when loppu > @loppuPvm then @loppupvm else loppu end) + 1)
	INTO Koski_SA.sa.temp_amm_tutkinnot_lasna_paivat
	FROM sa.sa_koski_opiskeluoikeus_aikajakso ooa	
	WHERE tila in ('lasna', 'valmistunut', 'loma')
	GROUP BY opiskeluoikeus_oid

	SELECT 
		opiskeluoikeus_oid
		,paivat 
			= sum(
				case 
					when datediff(day, tila_alkanut, case when loppu > @loppuPvm then @loppupvm else loppu end) + 1 > 28 
					then datediff(day, tila_alkanut, case when loppu > @loppuPvm then @loppupvm else loppu end) + 1 - 28 
					else 0 
				end
			)
	INTO Koski_SA.sa.temp_amm_tutkinnot_hylatyt_loma_paivat
	FROM (
		SELECT 
			opiskeluoikeus_oid
			,tila_alkanut
			,loppu = max(loppu)
		FROM sa.sa_koski_opiskeluoikeus_aikajakso ooa	
		WHERE tila = 'loma'
		GROUP BY opiskeluoikeus_oid, tila_alkanut
	) Q
	GROUP BY opiskeluoikeus_oid
	
	SELECT 
		opiskeluoikeus_oid
		,sopimusmuoto
		,paivat = sum(paivat)
	INTO Koski_SA.sa.temp_amm_tutkinnot_opso_koso_paivat
	FROM (
		SELECT distinct 
			sj.opiskeluoikeus_oid
			,sopimusmuoto = case when sopimusmuoto like '%oppisopimu%' then 1 when sopimusmuoto = 'Koulutussopimus' then 2 else 0 end
			,alku
			,paivat = datediff(day, alku, case when loppu > @loppuPvm then @loppupvm else loppu end) + 1
		FROM [sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2] sj
		LEFT JOIN sa.sa_amm_paatason_suoritus ps on ps.paatason_suoritus_id = sj.paatason_suoritus_id
		WHERE rnk = 1
	) k
	WHERE sopimusmuoto in (1,2)
	GROUP BY opiskeluoikeus_oid, sopimusmuoto


	INSERT INTO [dbo].[amm_tutkinnot_valitaulu] 

	SELECT 
		 vuosi = year(ps.vahvistus_paiva)
		,kuukausi = month(ps.vahvistus_paiva)
		,h.sukupuoli
		,h.aidinkieli
		,ika = year(ps.vahvistus_paiva) - year(h.syntymaaika) 
		,kansalaisuus = left(kansalaisuus, 3)
		,h.kotikunta
		,erityisopetus = 
			case				
				when (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') then 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
				when (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') then 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
				when ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 then 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
				when ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 then 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
				when ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 then 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
				when ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 then 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
				when ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 then 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
				when ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 then 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
				when ooa.erityinen_tuki = 0 then 1 --Ei erityisopiskelija
				else -1
			end
		,ooa.opintojen_rahoitus
		,koulutusvienti = coalesce(oo2.lisatiedot_koulutusvienti, oo.lisatiedot_koulutusvienti)
		,majoitus =
			case					
				when ooa.majoitus = 1 then 2
				when ooa.sisaoppilaitosmainen_majoitus = 1 then 3
				when ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus = 1 then 4
				else 1
			end
		,ps.tutkinto_koodi
		,pso.osaamisala_koodiarvo
		,pst.tutkintonimike_koodiarvo
		,ps.suorituskieli_koodiarvo
		,toimipiste_oid_tt = ps.toimipiste_oid
		,oppilaitos_oid_tt = oo.oppilaitos_oid
		,koulutustoimija_oid_tt = oo.koulutustoimija_oid
		,toimipiste_oid = coalesce(oo2.toimipiste_oid, ps.toimipiste_oid)
		,oppilaitos_oid = coalesce(oo2.oppilaitos_oid, oo.oppilaitos_oid)
		,koulutustoimija_oid = coalesce(oo2.koulutustoimija_oid, oo.koulutustoimija_oid)
		,hankintakoulutus = case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then 1 else 0 end
		,henkilostokoulutus = coalesce(oo2.lisatiedot_henkilostokoulutus, oo.lisatiedot_henkilostokoulutus)
		,ps.suorituksen_tyyppi
		,opiskeluoikeus_pv = hyv_pv.paivat - coalesce(hyl_pv.paivat,0)
		,oppisopimus_pv = case when os_ks.sopimusmuoto = 1 then os_ks.paivat end
		,koulutussopimus_pv = case when os_ks.sopimusmuoto = 2 then os_ks.paivat end
		,oo.master_oid
		,oo.opiskeluoikeus_oid
		
	FROM [sa].[sa_koski_opiskeluoikeus] oo
	LEFT JOIN (
		select
			o.opiskeluoikeus_oid
			,lisatiedot_koulutusvienti
			,lisatiedot_henkilostokoulutus
			,koulutustoimija_oid
			,oppilaitos_oid
			,toimipiste_oid
		from sa.sa_koski_opiskeluoikeus o
		join sa.sa_amm_paatason_suoritus p on p.opiskeluoikeus_oid = o.opiskeluoikeus_oid and p.rnk = 1
	) oo2 on oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid and oo.sisaltyy_opiskeluoikeuteen_oid is not null
	LEFT JOIN sa.sa_koski_henkilo_master h on h.master_oid = oo.master_oid
	LEFT JOIN sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ps.rnk = 1
	OUTER APPLY (
		SELECT 
			MIN(pso.osaamisala_koodiarvo) as osaamisala_koodiarvo
		FROM sa.sa_koski_paatason_suoritus_osaamisala pso
		WHERE pso.paatason_suoritus_id = ps.paatason_suoritus_id
	) pso
	LEFT JOIN sa.sa_koski_paatason_suoritus_tutkintonimike pst on pst.paatason_suoritus_id = ps.paatason_suoritus_id
	LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa 
		on ooa.opiskeluoikeus_oid = coalesce(oo2.opiskeluoikeus_oid, oo.opiskeluoikeus_oid)
		and (case when ps.vahvistus_paiva > coalesce(oo.paattymispaiva, '9999-12-31') then oo.paattymispaiva else ps.vahvistus_paiva end) between ooa.alku and ooa.loppu
	--läsnäolopäivät
	LEFT JOIN Koski_SA.sa.temp_amm_tutkinnot_lasna_paivat hyv_pv on hyv_pv.opiskeluoikeus_oid = coalesce(oo2.opiskeluoikeus_oid, oo.opiskeluoikeus_oid)
	--lomapäivät
	LEFT JOIN Koski_SA.sa.temp_amm_tutkinnot_hylatyt_loma_paivat hyl_pv on hyl_pv.opiskeluoikeus_oid = coalesce(oo2.opiskeluoikeus_oid, oo.opiskeluoikeus_oid)
	--opso- ja koso-päivät
	LEFT JOIN Koski_SA.sa.temp_amm_tutkinnot_opso_koso_paivat os_ks on os_ks.opiskeluoikeus_oid = coalesce(oo2.opiskeluoikeus_oid, oo.opiskeluoikeus_oid)

	WHERE (oo.koulutusmuoto = 'ammatillinenkoulutus' OR oo.tuva_jarjestamislupa = 'ammatillinen')
	AND ps.vahvistus_paiva is not null
	AND year(ps.vahvistus_paiva) = @year AND ps.vahvistus_paiva <= @loppuPvm
	--kuoriopiskeluoikeudet pois
	AND NOT EXISTS (
		select 1 
		from sa.sa_koski_opiskeluoikeus sa 								
		where sa.sisaltyy_opiskeluoikeuteen_oid is not null 
		and sa.sisaltyy_opiskeluoikeuteen_oid = oo.opiskeluoikeus_oid
	)

	SET @year = @year + 1

END

DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_lasna_paivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_hylatyt_loma_paivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_tutkinnot_opso_koso_paivat

GO
