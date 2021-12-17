USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_amm_opiskelijat_netto_valitaulu]    Script Date: 14.12.2021 13:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
KAKSI SILMUKKAA: TOINEN KAUSI KERRALLAAN, TOINEN PÄIVÄ KERRALLAAN KAUDEN ALUSTA LOPPUUN.
KAKSI TEMP-TAULUA: EKAAN HAETAAN LUKUKAUDEN AIKANA OPISKELLEIDEN PERUSJOUKKO. TOISEEN KIRJOITETAAN PÄIVÄKOHTAISET TIEDOT.
*/

ALTER PROCEDURE [dbo].[p_lataa_amm_opiskelijat_netto_valitaulu] @alku as date = '2018-01-01', @loppu as date = null, @kk as int = 1   AS

DECLARE @pvm_alku as date
DECLARE @pvm_loppu as date
DECLARE @pvm_pv as date
DECLARE @pvm_vika as date
DECLARE @vali as int

SET @pvm_vika = CASE WHEN @loppu is null THEN EOMONTH(DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)) ELSE @loppu END
SET @vali = @kk
SET @pvm_alku = @alku
SET @pvm_loppu = EOMONTH(dateadd(month, @vali-1, @pvm_alku))


--EXEC [sa].[p_lataa_amm_paatason_suoritus]

TRUNCATE TABLE [dbo].[amm_opiskelijat_netto_valitaulu]

DROP TABLE IF EXISTS #taulu1
DROP TABLE IF EXISTS #taulu2

CREATE TABLE #taulu2 (
	vuosi int
	,kuukausi int
	,paiva int
	,sukupuoli varchar(1)
	,aidinkieli varchar(2)
	,ika varchar(3)
	,kansalaisuus varchar(25)
	,erityisopetus int
	,opintojen_rahoitus int
	,majoitus int
	,tutkinto_koodi char(6)
	,osaamisala_koodiarvo char(4)
	,suorituskieli_koodiarvo char(2)
	,oppisopimus int
	,koulutussopimus int
	,toimipiste_oid varchar(100)
	,oppilaitos_oid varchar(100)
	,koulutustoimija_oid varchar(100)
	,henkilostokoulutus int
	,suorituksen_tyyppi varchar(500)
	,oppija_oid varchar(100)
	,ika_oo_alk varchar(3)
	,ika_oo_alk_tarkka varchar(3)
	,oo_aloitusvuosi int
	,oo_aloituskuukausi int
	,ika_opsoj_alk varchar(3)
	,ika_opsoj_alk_tarkka varchar(3)
	,opsoj_aloitusvuosi int
	,opsoj_aloituskuukausi int

)


WHILE @pvm_alku < @pvm_vika 

BEGIN

	TRUNCATE TABLE #taulu2

	SELECT 
		oo.oppija_oid
		,oo.opiskeluoikeus_oid
		,ooa.alku
		,ooa.loppu
		,ooa.tila
		,sukupuoli = (CASE WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 1 THEN '1' WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 0 THEN '2' ELSE NULL END)
		,aidinkieli = h.aidinkieli
		,ika = YEAR(@pvm_alku) - YEAR(h.syntymaaika) 
		,kansalaisuus = LEFT(kansalaisuus, 3)
		,erityisopetus = 
			CASE				
				WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma') THEN 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
				WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma') THEN 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
				WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
				WHEN ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vaikeasti_vammainen = 1 THEN 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
				WHEN ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vammainen_ja_avustaja = 1 THEN 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
				WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi in ('telma','valma') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
				WHEN ps.suorituksen_tyyppi in ('telma','valma') and ooa.vaikeasti_vammainen = 1 THEN 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
				WHEN ps.suorituksen_tyyppi in ('telma','valma') and ooa.vammainen_ja_avustaja = 1 THEN 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
				WHEN ooa.erityinen_tuki = 0 THEN 1 --Ei erityisopiskelija
				ELSE -1
			END
		,opintojen_rahoitus
		,majoitus =
			CASE					
				WHEN ooa.majoitus = 1 THEN 2
				WHEN ooa.sisaoppilaitosmainen_majoitus = 1 THEN 3
				WHEN ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus = 1 THEN 4
				ELSE 1
			END
		,tutkinto_koodi = ps.tutkinto_koodi
		,ps.osaamisala_koodiarvo
		,ps.suorituskieli_koodiarvo
		,ps.suorituksen_tyyppi
		,ps.toimipiste_oid
		,oo.oppilaitos_oid
		,oo.koulutustoimija_oid
		,henkilostokoulutus = oo.lisatiedot_henkilostokoulutus
		,h.syntymaaika
		,ika_oo_alk = year(oo.alkamispaiva) - year(h.syntymaaika)
		,ika_oo_alk_tarkka = datediff(hour, h.syntymaaika, oo.alkamispaiva) / 8766
		,oo_aloitusvuosi = year(oo.alkamispaiva)
		,oo_aloituskuukausi = month(oo.alkamispaiva)
	INTO #taulu1

	FROM sa.sa_koski_opiskeluoikeus oo
	LEFT JOIN [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	LEFT JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
	LEFT JOIN sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 

	WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'
	AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
	AND ooa.tila in ('lasna','loma')
	AND ooa.alku <= @pvm_loppu AND ooa.loppu >= @pvm_alku
	AND ps.rnk = 1

	--jaksonsisäiset apukyselyt
	DROP TABLE IF EXISTS #sopimusjaksot
	DROP TABLE IF EXISTS #opsojaksot
	DROP TABLE IF EXISTS #kosojaksot

	select distinct 
		opiskeluoikeus_oid
		,sopimusmuoto = case when sopimusmuoto like '%oppisopimus%' then 'oppisopimus' else sopimusmuoto end
		,alku
		,loppu = coalesce(loppu,'9999-12-31')
	into #sopimusjaksot 
	from [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2]
	where alku <= @pvm_loppu and coalesce(loppu,'9999-12-31') >= @pvm_alku and alku <= coalesce(loppu,'9999-12-31')
		
	select * into #opsojaksot from #sopimusjaksot where sopimusmuoto = 'oppisopimus'
	select * into #kosojaksot from #sopimusjaksot where sopimusmuoto = 'Koulutussopimus'
	
	--jakson ekasta päivästä viimeiseen 
	SET @pvm_pv = @pvm_alku

	WHILE @pvm_pv <= @pvm_loppu

	BEGIN

		INSERT INTO #taulu2

		SELECT distinct
			 vuosi = YEAR(@pvm_pv)
			,kuukausi = MONTH(@pvm_pv)
			,paiva = DAY(@pvm_pv)
			,sukupuoli
			,aidinkieli
			,ika
			,kansalaisuus
			,erityisopetus
			,opintojen_rahoitus
			,majoitus
			,tutkinto_koodi
			,osaamisala_koodiarvo
			,suorituskieli_koodiarvo
			,oppisopimus = case when os.opiskeluoikeus_oid is not null then 1 else 0 end
			,koulutussopimus = case when ks.opiskeluoikeus_oid is not null then 1 else 0 end
			,toimipiste_oid
			,oppilaitos_oid
			,koulutustoimija_oid
			,henkilostokoulutus
			,suorituksen_tyyppi
			,oppija_oid
			,ika_oo_alk			
			,ika_oo_alk_tarkka	
			,oo_aloitusvuosi	
			,oo_aloituskuukausi
			,ika_opsoj_alk = year(os.alku) - year(t.syntymaaika)
			,ika_opsoj_alk_tarkka =	datediff(hour, t.syntymaaika, os.alku) / 8766
			,opsoj_aloitusvuosi = year(os.alku)
			,opsoj_aloituskuukausi = month(os.alku)
		FROM #taulu1 t
		LEFT JOIN #opsojaksot os on os.opiskeluoikeus_oid = t.opiskeluoikeus_oid and @pvm_pv between os.alku and os.loppu
		LEFT JOIN #kosojaksot ks on ks.opiskeluoikeus_oid = t.opiskeluoikeus_oid  and @pvm_pv between ks.alku and ks.loppu
		WHERE @pvm_pv between t.alku and t.loppu 

		SET @pvm_pv = DATEADD(DAY, 1, @pvm_pv)

	END

	DROP TABLE #taulu1
	DROP TABLE #sopimusjaksot
	DROP TABLE #opsojaksot
	DROP TABLE #kosojaksot

	--tiedot välitauluun
	INSERT INTO [dbo].[amm_opiskelijat_netto_valitaulu] 

	SELECT 
		vuosi 
		,kuukausi 
		,sukupuoli
		,aidinkieli
		,ika
		,kansalaisuus
		,erityisopetus
		,opintojen_rahoitus
		,majoitus
		,tutkinto_koodi
		,osaamisala_koodiarvo
		,suorituskieli_koodiarvo
		,oppisopimus
		,koulutussopimus
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,henkilostokoulutus 
		,suorituksen_tyyppi
		,ika_oo_alk
		,ika_oo_alk_tarkka
		,oo_aloitusvuosi
		,oo_aloituskuukausi
		,ika_opsoj_alk
		,ika_opsoj_alk_tarkka
		,opsoj_aloitusvuosi
		,opsoj_aloituskuukausi
		,ka = count(*) / (day(eomonth(datefromparts(vuosi, kuukausi, 1))) * 1.0)
	FROM #taulu2 t
	GROUP BY 
		vuosi
		,kuukausi
		,sukupuoli
		,aidinkieli
		,ika
		,kansalaisuus
		,erityisopetus
		,opintojen_rahoitus
		,majoitus
		,tutkinto_koodi
		,osaamisala_koodiarvo
		,suorituskieli_koodiarvo
		,oppisopimus
		,koulutussopimus
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,henkilostokoulutus 
		,suorituksen_tyyppi
		,ika_oo_alk
		,ika_oo_alk_tarkka
		,oo_aloitusvuosi
		,oo_aloituskuukausi
		,ika_opsoj_alk
		,ika_opsoj_alk_tarkka
		,opsoj_aloitusvuosi
		,opsoj_aloituskuukausi
	ORDER BY vuosi,kuukausi,ka DESC

	SET @pvm_alku = DATEADD(MONTH, @vali, @pvm_alku)
	SET @pvm_loppu = CASE WHEN @pvm_vika < EOMONTH(dateadd(month, @vali, @pvm_loppu)) THEN @pvm_vika ELSE EOMONTH(dateadd(month, @vali, @pvm_loppu)) END

END

DROP TABLE #taulu2
