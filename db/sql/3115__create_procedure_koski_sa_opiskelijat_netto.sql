USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_amm_opiskelijat_netto_valitaulu]    Script Date: 4.6.2020 17:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_amm_opiskelijat_netto_valitaulu]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_amm_opiskelijat_netto_valitaulu] AS' 
END
GO

/* 
KAKSI LUUPPIA. TOINEN KUUKAUSI KERRALLAAN, TOINEN KUUKAUDEN EKASTA PÄIVÄSTÄ VIIMEISEEN.
KAKSI TEMP-TAULUA. EKAAN HAETAAN KUUKAUDEN AIKANA OPISKELLEIDEN AIKAJAKSO- JA HENKILÖTIEDOT. TOISEEN KIRJOITETAAN KUUKAUDEN KUNKIN PÄIVÄN OPISKELIJAMÄÄRÄ.
*/

ALTER PROCEDURE [dbo].[p_lataa_amm_opiskelijat_netto_valitaulu] AS

declare @pvm_kk as date
declare @pvm_pv as date

SET @pvm_kk = '2018-01-01'

EXEC [sa].[p_lataa_amm_paatason_suoritus]

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
)

WHILE @pvm_kk <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0) --edellisen kuukauden eka päivä

BEGIN

	SET @pvm_pv = @pvm_kk

	DELETE FROM [dbo].[amm_opiskelijat_netto_valitaulu] WHERE vuosi = YEAR(@pvm_kk) and kuukausi = MONTH(@pvm_kk)

	SELECT 
		 oo.oppija_oid
		,ooa.alku
		,ooa.loppu
		,ooa.tila
		,sukupuoli = (CASE WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 1 THEN '2' WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 0 THEN '1' ELSE NULL END)
		,aidinkieli = h.aidinkieli
		,ika = YEAR(@pvm_kk) - YEAR(h.syntymaaika) 
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
		,oppisopimus = CASE WHEN ps.oppisopimusjaksojen_paivat > 0 THEN 1 ELSE 0 END
		,koulutussopimus = CASE WHEN ps.koulutussopimusjaksojen_paivat > 0 THEN 1 ELSE 0 END
		,ps.suorituksen_tyyppi
		,ps.toimipiste_oid
		,oo.oppilaitos_oid
		,oo.koulutustoimija_oid
		,henkilostokoulutus = oo.lisatiedot_henkilostokoulutus
		--,uusi = CASE WHEN (SELECT isSame FROM [dbo].[Same_month_and_year] (@pvm_kk, oo.alkamispaiva)) = 1 THEN 1 ELSE 0 END
		--,osa_aikaisuus = (CASE WHEN ooa.osa_aikaisuus = 100 OR ooa.osa_aikaisuus is NULL THEN 2 ELSE 1 END)
	
	INTO #taulu1

	FROM [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa
	JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
	JOIN sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and ps.rnk = 1

	WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'
	AND ooa.tila in ('lasna','loma')
	AND ooa.alku <= eomonth(@pvm_kk) and ooa.loppu >= @pvm_kk
	AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
	AND ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'


--kuukauden ekasta päivästä viimeiseen
WHILE @pvm_pv <= EOMONTH(@pvm_kk)

BEGIN
		
	INSERT INTO #taulu2

	SELECT 
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
		,oppisopimus
		,koulutussopimus
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,henkilostokoulutus
		,suorituksen_tyyppi
		,oppija_oid
	FROM #taulu1 t
	WHERE @pvm_pv between alku and loppu 
	and t.tila in ('lasna','loma')

	SET @pvm_pv = DATEADD(DAY, 1, @pvm_pv)

END

DROP TABLE #taulu1

SET @pvm_kk = DATEADD(MONTH, 1, @pvm_kk)

END


--KUUKAUSITTAISET TIEDOT VÄLITAULUUN
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
	,ka = count(oppija_oid) / count(distinct paiva)	
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
ORDER BY vuosi,kuukausi,ka DESC

DROP TABLE #taulu2
GO
/****** Object:  StoredProcedure [sa].[p_lataa_amm_paatason_suoritus]    Script Date: 4.6.2020 17:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_amm_paatason_suoritus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_amm_paatason_suoritus] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lataa_amm_paatason_suoritus] AS


DROP TABLE sa.sa_amm_paatason_suoritus

SELECT 
	 a.opiskeluoikeus_oid
	,a.suorituksen_tyyppi
	,tutkinto_koodi = CASE WHEN LEN(a.koulutusmoduuli_koodiarvo) > 6 THEN NULL ELSE COALESCE(NULLIF(a.koulutusmoduuli_koodiarvo, '999904'), a.tutkinto_koodiarvo) END
	,a.koulutusmoduuli_koodiarvo 
	,a.tutkinto_koodiarvo
	,a.osaamisala_koodiarvo
	,a.toimipiste_oid
	,a.koulutussopimusjaksojen_paivat
	,a.oppisopimusjaksojen_paivat
	,a.suorituskieli_koodiarvo
	,a.vahvistus_paiva
	,a.suorituksen_alkamispaiva
	,a.rnk 

INTO sa.sa_amm_paatason_suoritus

FROM 
(
	SELECT DISTINCT 
		 ps.opiskeluoikeus_oid
		,suorituksen_tyyppi
		,koulutusmoduuli_koodiarvo
		,tutkinto_koodiarvo
		,osaamisala_koodiarvo
		,toimipiste_oid
		,koulutussopimusjaksojen_paivat
		,oppisopimusjaksojen_paivat
		,suorituskieli_koodiarvo
		,vahvistus_paiva
		,suorituksen_alkamispaiva = CASE WHEN YEAR(suorituksen_alkamispaiva) < 1900 THEN NULL ELSE suorituksen_alkamispaiva END
		,RANK() OVER (PARTITION BY ps.opiskeluoikeus_oid ORDER BY suorituksen_tyyppi,osaamisala_koodiarvo,koulutusmoduuli_koodiarvo) as rnk 
	FROM sa.sa_koski_paatason_suoritus ps		
	JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
	WHERE oo.koulutusmuoto = 'ammatillinenkoulutus'	
	--AND ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
) a  

GO
USE [ANTERO]