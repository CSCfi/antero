USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_amm_kesk_koottu]    Script Date: 26.5.2021 8:31:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










DROP PROCEDURE IF EXISTS [sa].[p_lataa_temp_amm_kesk_koottu]
GO


CREATE PROCEDURE [sa].[p_lataa_temp_amm_kesk_koottu] AS


DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_keskeytykset_kalenteri
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_kohortti
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_kierros1
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_alkamispaivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_opisk_paattymispaivat
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_kierros2
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_osaamispisteet
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_sarja_kytkin
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_sukupuolivaltaisuus
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_sopimusmuotoinen
DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_koottu

SELECT *, 
	eka_tarkastuspaiva_vp = DATEADD(MONTH, 6, MAX(paivays) OVER (PARTITION BY kohortti_vp)),
	eka_tarkastuspaiva_vn = DATEADD(MONTH, 6, MAX(paivays) OVER (PARTITION BY kohortti_vn)),
kohortti_fi = 
	case 
		when vuosipuolisko = 'H1'
			then CONCAT('1.1.', vuosi, ' - ', '30.6.', vuosi) 
		when vuosipuolisko = 'H2'
			then CONCAT('1.7.', vuosi, ' - ', '31.12.', vuosi) 			
			END
INTO Koski_SA.sa.temp_amm_keskeytykset_kalenteri
FROM(
SELECT *, 
CONCAT(vuosi, '-', vuosipuolisko) AS kohortti_vp,
CONCAT(vuosi, '-', vuosineljannes) AS kohortti_vn
FROM (SELECT [id]
      ,[kalenteri_avain]
      ,[paivays]
      ,[vuosi]
      ,[kuukausi]
      ,[paiva]
	  ,CASE WHEN kuukausi <= 6 THEN 'H1'
	  WHEN kuukausi >= 7 THEN 'H2'
	  END
	  AS vuosipuolisko
	  ,CASE WHEN kuukausi <= 3 THEN 'Q1'
	  WHEN kuukausi <=6 THEN 'Q2'
	  WHEN kuukausi <=9 THEN 'Q3'
	  WHEN kuukausi <=12 THEN 'Q4'
	  END
	  AS vuosineljannes
	  
  FROM [ANTERO].[dw].[d_kalenteri]
  WHERE vuosi BETWEEN 2018 AND YEAR(GETDATE())) q) q2


SELECT kohortti_vp, 
	sarja
INTO Koski_SA.sa.temp_amm_kesk_sarja_kytkin
FROM (
SELECT *,
	eka_mahdollinen_paiva = DATEADD(MONTH, sarja * 6, vika_paiva_vp)
FROM(
SELECT DISTINCT kohortti_vp ,
	eka_paiva_vp = MIN(paivays) OVER (PARTITION BY kohortti_vp),
	vika_paiva_vp = MAX(paivays) OVER (PARTITION BY kohortti_vp),
	sarja
FROM(
SELECT *, 
CONCAT(vuosi, '-', vuosipuolisko) AS kohortti_vp,
CONCAT(vuosi, '-', vuosineljannes) AS kohortti_vn
FROM (SELECT [id]
      ,[kalenteri_avain]
      ,[paivays]
      ,[vuosi]
      ,[kuukausi]
      ,[paiva]
	  ,CASE WHEN kuukausi <= 6 THEN 'H1'
	  WHEN kuukausi >= 7 THEN 'H2'
	  END
	  AS vuosipuolisko
	  ,CASE WHEN kuukausi <= 3 THEN 'Q1'
	  WHEN kuukausi <=6 THEN 'Q2'
	  WHEN kuukausi <=9 THEN 'Q3'
	  WHEN kuukausi <=12 THEN 'Q4'
	  END
	  AS vuosineljannes
	  
  FROM [ANTERO].[dw].[d_kalenteri]
  WHERE vuosi BETWEEN 2018 AND YEAR(GETDATE())) q) q2
	CROSS JOIN (SELECT 
				TOP 100 id - 1 AS sarja 
				FROM ANTERO.dw.d_kalenteri 
				WHERE id != -1) q1) q3 )q4
WHERE eka_mahdollinen_paiva <= GETDATE()



SELECT DISTINCT *
INTO Koski_SA.sa.temp_amm_opisk_kohortti
FROM(
SELECT oo.oppija_oid, 
	oo.opiskeluoikeus_oid,
	kal.kohortti_vp, 
	q2.alkamispaiva,
	oo.paattymispaiva,
	koulutusmuoto,
	suorituksen_tyyppi,
	viimeisin_tila,
	rnk = rank() over (partition by oo.oppija_oid, kal.kohortti_vp order by oo.alkamispaiva, q2.alkamispaiva, ps.suorituksen_tyyppi, oo.opiskeluoikeus_oid)
FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
LEFT JOIN Koski_SA.sa.temp_amm_keskeytykset_kalenteri as kal ON oo.alkamispaiva = kal.paivays
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN (SELECT opiskeluoikeus_oid, alku AS alkamispaiva FROM (
		SELECT oo.opiskeluoikeus_oid,
		alku,
		rnk = rank() over (partition by oo.opiskeluoikeus_oid order by ooa.alku)
		FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
		LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
		WHERE tila IN ('lasna', 'loma')) q1
		WHERE rnk = 1
		) q2 ON q2.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
WHERE YEAR(oo.alkamispaiva) >= 2018
AND YEAR(oo.alkamispaiva) <= YEAR(GETDATE())
AND viimeisin_tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'eronnut', 'katsotaaneronneeksi', 'valmistunut')
AND ps.suorituksen_tyyppi = 'ammatillinentutkinto'
AND koulutusmuoto = 'ammatillinenkoulutus' 
AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL)q
WHERE rnk = 1

SELECT DISTINCT *
INTO Koski_SA.sa.temp_amm_opisk_alkamispaivat
FROM(
SELECT DISTINCT oo.oppija_oid, 
	oo.opiskeluoikeus_oid,
	viimeisin_tila,
	q2.alkamispaiva,
	rnk = rank() over (partition by oo.oppija_oid order by q2.alkamispaiva, oo.alkamispaiva, ps.suorituksen_tyyppi, oo.opiskeluoikeus_oid)
FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
LEFT JOIN Koski_SA.sa.temp_amm_keskeytykset_kalenteri as kal ON oo.alkamispaiva = kal.paivays
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN (SELECT opiskeluoikeus_oid, alku AS alkamispaiva FROM (
		SELECT oo.opiskeluoikeus_oid, oo.viimeisin_tila,
		alku,
		rnk = rank() over (partition by oo.opiskeluoikeus_oid order by ooa.alku)
		FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
		LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
		WHERE tila IN ('lasna', 'loma')) q1
		WHERE rnk = 1
		) q2 ON q2.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
WHERE YEAR(oo.alkamispaiva) >= 2018
AND YEAR(oo.alkamispaiva) <= YEAR(GETDATE())
AND viimeisin_tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'eronnut', 'katsotaaneronneeksi', 'valmistunut')
AND ps.suorituksen_tyyppi = 'ammatillinentutkinto'
AND koulutusmuoto = 'ammatillinenkoulutus'
AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL)q

SELECT DISTINCT *
INTO Koski_SA.sa.temp_amm_opisk_paattymispaivat
FROM(
SELECT DISTINCT oo.oppija_oid, 
	oo.opiskeluoikeus_oid,
	viimeisin_tila,
	q2.paattymispaiva
	--rnk = rank() over (partition by oo.oppija_oid order by oo.paattymispaiva DESC)
FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN (SELECT opiskeluoikeus_oid, loppu AS paattymispaiva, rnk FROM (
		SELECT oo.opiskeluoikeus_oid, oo.viimeisin_tila, paattymispaiva as oopaattymispaiva,
		loppu,
		rnk = rank() over (partition by oo.opiskeluoikeus_oid order by ooa.loppu DESC)
		FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
		LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
		WHERE YEAR(oo.alkamispaiva) >= 2018
		) q1
		WHERE rnk = 1
		) q2 ON q2.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
WHERE viimeisin_tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'eronnut', 'katsotaaneronneeksi', 'valmistunut')
AND ps.suorituksen_tyyppi = 'ammatillinentutkinto'
AND koulutusmuoto = 'ammatillinenkoulutus'	
AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL	)q




SELECT DISTINCT
tutkinto_koodi
,vuosi
,CASE 
	WHEN sukupuoli = 2 AND osuus >= 0.90 THEN 'Naisia 90–100 %'
	WHEN sukupuoli = 2 AND osuus >= 0.60 THEN 'Naisia 60–90 %'
	WHEN sukupuoli = 2 AND osuus >= 0.40 THEN 'Naisia/miehiä 40–60 %'
	WHEN sukupuoli = 2 AND osuus >= 0.10 THEN 'Miehiä 60–90 %'
	WHEN sukupuoli = 2 AND osuus <  0.10 THEN 'Miehiä 90–100 %'
	WHEN sukupuoli = 1 AND osuus > 0.90 THEN 'Miehiä 90–100 %'
	WHEN sukupuoli = 1 AND osuus > 0.60 THEN 'Miehiä 60–90 %'
	WHEN sukupuoli = 1 AND osuus > 0.40 THEN 'Naisia/miehiä 40–60 %'
	WHEN sukupuoli = 1 AND osuus > 0.10 THEN 'Naisia 60–90 %'
	WHEN sukupuoli = 1 AND osuus <=  0.10 THEN 'Naisia 90–100 %'
	ELSE 'Tuntematon'
	END AS sukupuolivaltaisuus
,CASE 
	WHEN sukupuoli = 2 AND osuus >= 0.90 THEN 1
	WHEN sukupuoli = 2 AND osuus >= 0.60 THEN 2
	WHEN sukupuoli = 2 AND osuus >= 0.40 THEN 3
	WHEN sukupuoli = 2 AND osuus >= 0.10 THEN 4
	WHEN sukupuoli = 2 AND osuus <  0.10 THEN 5
	WHEN sukupuoli = 1 AND osuus > 0.90 THEN 5
	WHEN sukupuoli = 1 AND osuus > 0.60 THEN 4
	WHEN sukupuoli = 1 AND osuus > 0.40 THEN 3
	WHEN sukupuoli = 1 AND osuus > 0.10 THEN 2
	WHEN sukupuoli = 1 AND osuus <=  0.10 THEN 1
	ELSE 99
	END AS jarj_sukupuolivaltaisuus
--,rank() over (partition by tutkinto_koodi order by sukupuoli)
INTO Koski_SA.sa.temp_amm_sukupuolivaltaisuus
FROM(
SELECT
	tutkinto_koodi,
	sukupuoli,
    vuosi,
	osuus = lkm * 1.0 / SUM(lkm) OVER (PARTITION BY tutkinto_koodi, vuosi)
FROM(
SELECT
tutkinto_koodi,
sukupuoli,
vuosi,
lkm = COUNT(DISTINCT oppija_oid)
FROM (
SELECT oo.oppija_oid
,YEAR(oo.alkamispaiva) as vuosi
,sukupuoli = (CASE WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 0 THEN '2' WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 1 THEN '1' ELSE NULL END)
,	CASE 
		WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppimaara' THEN '301101'
		WHEN oo.koulutusmuoto = 'ibtutkinto' THEN '301102'
		WHEN oo.koulutusmuoto = 'diatutkinto' THEN '301103'
		WHEN oo.koulutusmuoto = 'lukiokoulutus' AND ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN '301101'
		WHEN ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN '301102'
		WHEN ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' THEN '301101'
		WHEN LEN(ps.koulutusmoduuli_koodiarvo) > 7 THEN NULL 
		ELSE COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo, '999904'), ps.tutkinto_koodiarvo) 
		END
		AS tutkinto_koodi

FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
LEFT JOIN Koski_SA.sa.sa_koski_henkilo h ON oo.oppija_oid = h.oppija_oid
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
WHERE YEAR(oo.alkamispaiva) >= 2018) q
WHERE sukupuoli IS NOT NULL
GROUP BY  tutkinto_koodi, sukupuoli, vuosi) q2
GROUP BY tutkinto_koodi, sukupuoli, vuosi, lkm) q3
WHERE tutkinto_koodi IS NOT NULL
ORDER BY  tutkinto_koodi




SELECT DISTINCT
	q.oppija_oid,

	q.opiskeluoikeus_oid,
 q.kohortti_vp,
	q.alkamispaiva,
	q.paattymispaiva,
	q.viimeisin_tila,
	q.alku_tarkastus,
	q.tarkastuspaiva,
	q.sarja,
	CASE
		WHEN viimeisin_tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 'Koulutus kesken'
		WHEN viimeisin_tila IN ('eronnut', 'katsotaaneronneeksi') THEN 'Eronnut'
		WHEN viimeisin_tila IN ('valmistunut') THEN 'Valmistunut'
		END
		AS lopputulema,
	ooa.tila,
	COALESCE(ooa.tila, q.viimeisin_tila) AS taso2,
	CASE 
		WHEN COALESCE(ooa.tila, q.viimeisin_tila) IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 'Koulutus kesken'
		WHEN COALESCE(ooa.tila, q.viimeisin_tila) IN ('eronnut', 'katsotaaneronneeksi') THEN 'Eronnut'
		WHEN COALESCE(ooa.tila, q.viimeisin_tila) IN ('valmistunut') THEN 'Valmistunut'
		END
		AS taso1
		,A_erityisopetus = 
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
				when ooa.tila IS NULL THEN NULL
				else -1
			end
		,A_erityisopetus_jossain = SUM(ooa.erityinen_tuki) OVER (PARTITION BY q.opiskeluoikeus_oid)
		,A_opintojen_rahoitus = ooa.opintojen_rahoitus
		,A_majoitus =
			case		
				when ooa.tila IS NULL THEN NULL			
				when ooa.majoitus = 1 then 2
				when ooa.sisaoppilaitosmainen_majoitus = 1 then 3
				when ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus = 1 then 4
				else 1
			end
INTO Koski_SA.sa.temp_amm_kesk_kierros1
	 FROM (
SELECT DISTINCT koh.oppija_oid,
	koh.opiskeluoikeus_oid,
	koh.alkamispaiva,
	viimeisin_tila,
	COALESCE(koh.paattymispaiva, '9999-01-01') AS paattymispaiva,
	koh.kohortti_vp,
	sarja  AS sarja,
	alku_tarkastus = CASE WHEN sarja IN (0, 1) THEN alkamispaiva
						ELSE DATEADD(month, (sarja - 1) * 6, alkamispaiva)
						END,
	tarkastuspaiva = DATEADD(month, sarja * 6, alkamispaiva)
	FROM Koski_SA.sa.temp_amm_opisk_kohortti koh
	LEFT JOIN Koski_SA.sa.temp_amm_kesk_sarja_kytkin kytkin ON kytkin.kohortti_vp = koh.kohortti_vp
	WHERE YEAR(alkamispaiva) >= 2018
	AND kytkin.kohortti_vp IS NOT NULL
	) q
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa 
	ON q.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid AND q.tarkastuspaiva BETWEEN ooa.alku AND ooa.loppu
LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON q.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
WHERE ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
ORDER BY opiskeluoikeus_oid, tarkastuspaiva


SELECT DISTINCT *, SUM(osaamispisteet_per_sarja) OVER (PARTITION BY opiskeluoikeus_oid ORDER BY sarja) AS osaamispisteet_kum
INTO Koski_SA.sa.temp_amm_kesk_osaamispisteet
FROM(
SELECT k1.[oppija_oid]
      ,k1.opiskeluoikeus_oid
      ,[sarja]
	  ,COALESCE(SUM(koulutusmoduuli_laajuus_arvo), 0) AS osaamispisteet_per_sarja	  
  FROM [Koski_SA].[sa].[temp_amm_kesk_kierros1] k1
  LEFT JOIN (SELECT [osasuoritus_id]
      ,[opiskeluoikeus_oid]
      ,[suorituksen_tyyppi]
      ,[koulutusmoduuli_laajuus_arvo]
      ,[vahvistus_paiva]
      ,[arviointi_arvosana_koodiarvo]
	  ,TRY_CAST([arviointi_arvosana_koodiarvo] AS int) AS numeroarviointi
	  ,CASE WHEN TRY_CAST([arviointi_arvosana_koodiarvo] AS int) IS NULL THEN 0
		ELSE 1 END AS kytkin_numeroarviointi
	 -- ,arvosanapaino = koulutusmoduuli_laajuus_arvo * arviointi_arvosana_koodiarvo
	  ,COALESCE(vahvistus_paiva, arviointi_paiva, nayton_arviointi_paiva) AS paivays
  FROM [Koski_SA].[sa].[sa_koski_osasuoritus]
  WHERE suorituksen_tyyppi = 'ammatillisentutkinnonosa'
  AND arviointi_hyvaksytty = 1
  AND koulutusmoduuli_laajuus_arvo IS NOT NULL) q1
	ON q1.opiskeluoikeus_oid = k1.opiskeluoikeus_oid
	AND q1.paivays BETWEEN k1.alku_tarkastus AND k1.tarkastuspaiva
GROUP BY [oppija_oid]
      ,k1.[opiskeluoikeus_oid]
	  ,sarja) r
ORDER BY opiskeluoikeus_oid, sarja




SELECT DISTINCT [opiskeluoikeus_oid]
      ,[sarja]
  --    ,paivat_sarja = MAX(paivat_sarja) OVER (PARTITION BY opiskeluoikeus_oid, sarja)
      ,paivat_lasna = SUM(paivat_lasna) OVER (PARTITION BY opiskeluoikeus_oid, sarja)
      ,paivat_koulutussopimus = SUM([paivat_koulutussopimus]) OVER (PARTITION BY opiskeluoikeus_oid, sarja)
      ,paivat_oppisopimus = SUM([paivat_oppisopimus]) OVER (PARTITION BY opiskeluoikeus_oid, sarja)
INTO  Koski_SA.sa.temp_amm_kesk_sopimusmuotoinen
FROM (
SELECT DISTINCT opiskeluoikeus_oid
	,ooa_id
	,sarja
	,paivat_sarja = DATEDIFF(D, alku_tarkastus, tarkastuspaiva)
	,paivat_lasna = DATEDIFF(D, ooa_alku, ooa_loppu) 
	,paivat_koulutussopimus = 
		CASE
			WHEN sopimusmuoto = 'Koulutussopimus' THEN DATEDIFF(D, sj_alku, sj_loppu)
			ELSE 0
			END
	,paivat_oppisopimus =
		CASE
			WHEN sopimusmuoto = 'Oppisopimus' THEN DATEDIFF(D, sj_alku, sj_loppu)
			ELSE 0
			END
FROM (
SELECT q.opiskeluoikeus_oid
	,alku_tarkastus
	,tarkastuspaiva
	,sarja
	,ooa_alku
	,ooa_loppu
	,ooa_id
	,CASE WHEN sopimusmuoto = 'Koulutuksen järjestäminen oppisopimuskoulutuksena' THEN 'Oppisopimus'
		ELSE sopimusmuoto
		END
		AS sopimusmuoto
 	  ,CASE
		WHEN sj.alku <= ooa_alku THEN ooa_alku
		ELSE sj.alku
		END AS sj_alku
	  ,CASE
		WHEN sj.loppu >= ooa_loppu THEN ooa_loppu
		ELSE sj.loppu
		END AS sj_loppu
FROM (
SELECT DISTINCT k1.[opiskeluoikeus_oid]
      ,[alku_tarkastus]
      ,[tarkastuspaiva]
	  ,sarja
	  ,CASE
		WHEN ooa.alku <= alku_tarkastus THEN alku_tarkastus
		ELSE ooa.alku
		END AS ooa_alku
	  ,CASE
		WHEN ooa.loppu >= tarkastuspaiva THEN tarkastuspaiva
		ELSE ooa.loppu
		END AS ooa_loppu
	  ,ooa_id
	  ,ooa.tila

  FROM [Koski_SA].[sa].[temp_amm_kesk_kierros1] k1
  LEFT JOIN (SELECT *, ROW_NUMBER() OVER (ORDER BY opiskeluoikeus_oid, alku) AS ooa_id FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso) ooa 
	ON k1.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	AND ((alku_tarkastus BETWEEN ooa.alku AND ooa.loppu) OR (tarkastuspaiva BETWEEN ooa.alku AND ooa.loppu))
	  WHERE ooa.tila IN ('lasna', 'loma', 'valmistunut')) q

  LEFT JOIN (SELECT * FROM Koski_SA.sa.sa_koski_ammatillisen_koulutuksen_sopimusjaksot 
	  WHERE sopimusmuoto != 'Koulutuksen järjestäminen oppilaitosmuotoisena'
	 -- AND sopimusmuoto IN ('Koulutussopimus', 'Oppisopimus', 'Koulutuksen järjestäminen oppisopimuskoulutuksena')
	 ) sj
	ON q.opiskeluoikeus_oid = sj.opiskeluoikeus_oid
		AND ((ooa_alku BETWEEN sj.alku AND sj.loppu) OR (ooa_loppu BETWEEN sj.alku AND sj.loppu))) q2 ) q3






SELECT DISTINCT * 
INTO Koski_SA.sa.temp_amm_kesk_kierros2
FROM(
 SELECT k1.oppija_oid,
		k1.kohortti_vp,
		A_opiskeluoikeus_oid = k1.opiskeluoikeus_oid, 
		A_alkamispaiva = k1.alkamispaiva,
		A_paattymispaiva = k1.paattymispaiva,
		--A_viimeisin_tila = k1.[viimeisin_tila],  
		A_lopputulema = k1.[lopputulema],
		A_taso1 = k1.taso1,
		A_taso2 = k1.taso2,
		k1.A_erityisopetus,
		A_erityisopetus_jossain =
			CASE
				WHEN k1.A_erityisopetus_jossain != 0 THEN 'Erityisopiskelija'
				WHEN k1.A_erityisopetus_jossain = 0 THEN 'Ei erityisopiskelija'
				ELSE NULL
				END,			
		k1.A_opintojen_rahoitus,
		k1.A_majoitus,
		B_opiskeluoikeus_oid = f1.opiskeluoikeus_oid,
		B_alkamispaiva = f1.alkamispaiva,
		B_paattymispaiva = f2.paattymispaiva,
		CASE
			WHEN f1.opiskeluoikeus_oid IS NULL THEN 'Ei uutta koulutusta'
			WHEN f1.viimeisin_tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 'Uusi koulutus kesken'
			WHEN f1.viimeisin_tila IN ('eronnut', 'katsotaaneronneeksi') THEN 'Eronnut uudesta koulutuksesta'
			WHEN f1.viimeisin_tila IN ('valmistunut') THEN 'Valmistunut uudesta koulutuksesta'
			END
			AS B_lopputulema,
		CASE 
			WHEN f1.opiskeluoikeus_oid IS NULL THEN 'Ei uutta koulutusta'
			WHEN ooa.tila IS NULL AND tarkastuspaiva < f1.alkamispaiva THEN 'Uusi koulutus ei alkanut'
			WHEN ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 'Uusi koulutus kesken'
			WHEN ooa.tila IS NULL 
				AND tarkastuspaiva > f2.paattymispaiva 
				AND f1.viimeisin_tila IN ('eronnut', 'katsotaaneronneeksi') THEN 'Eronnut uudesta koulutuksesta'
			WHEN ooa.tila IS NULL
				AND tarkastuspaiva > f2.paattymispaiva
				AND f1.viimeisin_tila IN ('valmistunut') THEN 'Valmistunut uudesta koulutuksesta'
			ELSE NULL END
			AS B_taso1,
		ooa.tila,
		sarja,
		alku_tarkastus,
		tarkastuspaiva,
		rnk2 = RANK() OVER (PARTITION BY k1.oppija_oid, k1.opiskeluoikeus_oid ORDER BY f1.rnk)
  FROM [Koski_SA].[sa].[temp_amm_kesk_kierros1] k1
  LEFT JOIN Koski_SA.sa.temp_amm_opisk_alkamispaivat f1 
	ON f1.oppija_oid = k1.oppija_oid
	AND f1.opiskeluoikeus_oid != k1.opiskeluoikeus_oid
	AND f1.alkamispaiva > k1.alkamispaiva
  LEFT JOIN Koski_SA.sa.temp_amm_opisk_paattymispaivat f2
	ON f1.opiskeluoikeus_oid = f2.opiskeluoikeus_oid
  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa
	ON f1.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	AND tarkastuspaiva BETWEEN ooa.alku AND ooa.loppu) q
WHERE rnk2 = 1


SELECT * 
  INTO Koski_SA.sa.temp_amm_kesk_koottu
  FROM(
SELECT DISTINCT k2.[oppija_oid]
	  ,rnk1 = RANK() over (partition by A_opiskeluoikeus_oid, k2.sarja, B_opiskeluoikeus_oid order by bps.osaamisala_koodiarvo)
	  ,rnk2 = RANK() over (partition by A_opiskeluoikeus_oid, k2.sarja  order by aps.osaamisala_koodiarvo)
	  ,rnk3 = RANK() over (partition by A_opiskeluoikeus_oid, k2.sarja  order by aps.koulutusmoduuli_koodiarvo DESC)

	  ,k2.kohortti_vp
	  ,kal.kohortti_fi
		,sukupuoli = (CASE WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 1 THEN '2' WHEN CAST(SUBSTRING(h.hetu,8,3) AS INT) % 2 = 0 THEN '1' ELSE NULL END)
		,aidinkieli = h.aidinkieli
		,ika = YEAR(tarkastuspaiva) - YEAR(h.syntymaaika)
		,ika_aloittaessa = YEAR(A_alkamispaiva) - YEAR(h.syntymaaika)
		,ika_paattyessa = 
			CASE WHEN A_lopputulema IN ('Valmistunut', 'Eronnut') THEN YEAR(A_paattymispaiva) - YEAR(h.syntymaaika)
			ELSE NULL END
		,kansalaisuus = LEFT(kansalaisuus, 3)


      ,[A_opiskeluoikeus_oid]
      ,[A_lopputulema]
      ,[A_taso1]
	  ,A_erityisopetus_jossain
	  ,A_alkamispaiva
	  ,A_paattymispaiva
	  ,A_koulutustoimija_oid = aoo.koulutustoimija_oid
	  ,A_oppilaitos_oid = aoo.oppilaitos_oid
	  ,A_toimipiste_oid = aps.toimipiste_oid
	  ,A_koulutusmuoto = aoo.koulutusmuoto
	  ,A_koulutusmoduuli_koodiarvo = aps.koulutusmoduuli_koodiarvo
	  ,A_osaamisala_koodiarvo = aps.osaamisala_koodiarvo
	  ,A_suorituskieli_koodiarvo = aps.suorituskieli_koodiarvo
	  ,A_suorituksen_tyyppi = aps.suorituksen_tyyppi
		,A_suorituksen_tyyppi_koodi = case when aps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1 else 2 end
		,A_muu_ammatillinen_koodi = case when aps.suorituksen_tyyppi = 'muuammatillinenkoulutus' then 1 else 0 end
	  ,A_tutkinto_koodi = CASE WHEN LEN(aps.koulutusmoduuli_koodiarvo) > 6 THEN NULL ELSE COALESCE(NULLIF(aps.koulutusmoduuli_koodiarvo, '999904'), aps.tutkinto_koodiarvo) END
	  ,A_erityisopetus
	  ,A_opintojen_rahoitus
	  ,A_majoitus
      ,[B_opiskeluoikeus_oid]
      ,[B_lopputulema]
      ,[B_taso1]
	  ,B_alkamispaiva
	  ,B_paattymispaiva
	  ,B_koulutustoimija_oid = boo.koulutustoimija_oid
	  ,B_oppilaitos_oid = boo.oppilaitos_oid
	  ,B_toimipiste_oid = bps.toimipiste_oid
	  ,B_koulutusmuoto = boo.koulutusmuoto
	  ,B_koulutusmoduuli_koodiarvo = bps.koulutusmoduuli_koodiarvo
	  ,B_osaamisala_koodiarvo = bps.osaamisala_koodiarvo
	  ,B_suorituskieli_koodiarvo = bps.suorituskieli_koodiarvo
	  ,B_suorituksen_tyyppi = bps.suorituksen_tyyppi
		,B_suorituksen_tyyppi_koodi = case when bps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1 else 2 end
		,B_muu_ammatillinen_koodi = case when bps.suorituksen_tyyppi = 'muuammatillinenkoulutus' then 1 else 0 end
	  ,CASE 
		WHEN boo.koulutusmuoto = 'lukiokoulutus' AND bps.suorituksen_tyyppi = 'lukionoppimaara' THEN '301101'
		WHEN boo.koulutusmuoto = 'ibtutkinto' THEN '301102'
		WHEN boo.koulutusmuoto = 'diatutkinto' THEN '301103'
		WHEN boo.koulutusmuoto = 'lukiokoulutus' AND bps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN '301101'
		WHEN bps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND bps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') THEN '301102'
		WHEN bps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' THEN '301101'
		WHEN LEN(bps.koulutusmoduuli_koodiarvo) > 6 THEN NULL 
		ELSE COALESCE(NULLIF(bps.koulutusmoduuli_koodiarvo, '999904'), bps.tutkinto_koodiarvo) 
		END
		AS B_tutkinto_koodi
      ,k2.[sarja]
	  ,CASE
		WHEN A_lopputulema = 'Eronnut' THEN DATEDIFF(M, A_alkamispaiva, A_paattymispaiva)
		ELSE NULL END AS ero_ajankohta_kk
	  ,eroaminen_tapahtunut
	  ,valmistuminen_tapahtunut
	  ,kohortin_koko
	  ,alku_tarkastus
	  ,tarkastuspaiva
  FROM [Koski_SA].[sa].[temp_amm_kesk_kierros2] k2
  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus aoo ON aoo.opiskeluoikeus_oid = k2.A_opiskeluoikeus_oid
  LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus aps ON aps.opiskeluoikeus_oid = k2.A_opiskeluoikeus_oid
  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus boo ON boo.opiskeluoikeus_oid = k2.B_opiskeluoikeus_oid
  LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus bps ON bps.opiskeluoikeus_oid = k2.B_opiskeluoikeus_oid
  LEFT JOIN Koski_SA.sa.sa_koski_henkilo h ON k2.oppija_oid = h.oppija_oid
  LEFT JOIN (
		SELECT 
		oppija_oid, opiskeluoikeus_oid, sarja, taso1,
		eroaminen_tapahtunut = RANK() OVER (PARTITION BY opiskeluoikeus_oid, taso1 ORDER BY sarja)
		  FROM [Koski_SA].[sa].[temp_amm_kesk_kierros1]
		  WHERE taso1 = 'Eronnut') erot 
			ON erot.opiskeluoikeus_oid = A_opiskeluoikeus_oid AND erot.sarja = k2.sarja
  LEFT JOIN (
		SELECT  
		oppija_oid, opiskeluoikeus_oid, sarja, taso1,
		valmistuminen_tapahtunut = RANK() OVER (PARTITION BY opiskeluoikeus_oid, taso1 ORDER BY sarja)
		  FROM [Koski_SA].[sa].[temp_amm_kesk_kierros1]
		  WHERE taso1 = 'Valmistunut') valm
			ON valm.opiskeluoikeus_oid = A_opiskeluoikeus_oid AND valm.sarja = k2.sarja
  LEFT JOIN (
		SELECT kohortti_vp AS kohortti_k, COUNT(DISTINCT oppija_oid) AS kohortin_koko
			FROM [Koski_SA].[sa].[temp_amm_kesk_kierros1]
			GROUP BY kohortti_vp) kkoko
			ON k2.kohortti_vp = kkoko.kohortti_k
  LEFT JOIN Koski_SA.sa.temp_amm_keskeytykset_kalenteri kal ON k2.kohortti_vp = kal.kohortti_vp
WHERE (B_opiskeluoikeus_oid IS NULL
OR bps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus')	
AND aps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus')q
WHERE rnk1 = 1 AND rnk2 = 1 AND rnk3 = 1

DROP TABLE IF EXISTS Koski_SA.sa.temp_koski_perusaste_keskiarvot

SELECT * INTO Koski_SA.sa.temp_koski_perusaste_keskiarvot FROM (
SELECT f.oppija_oid, f.keskiarvo, f2.keskiarvo_lukuaineet FROM (
  SELECT f.oppija_oid
      ,cast(avg(cast(f.arvosana as decimal(10,5))) as decimal(10,5)) as 'keskiarvo'
  FROM (
	SELECT d.oppija_oid, f.koulutusmoduuli_koodiarvo, max(f.arviointi_arvosana_koodiarvo) as 'arvosana' FROM [Koski_SA].[sa].[sa_koski_osasuoritus] f
	left join [Koski_SA].[sa].[sa_koski_opiskeluoikeus] d on d.opiskeluoikeus_oid = f.opiskeluoikeus_oid
	left join [Koski_SA].[sa].[sa_koski_paatason_suoritus] d2 on d2.paatason_suoritus_id = f.paatason_suoritus_id
	where		f.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava' 
			and f.arviointi_arvosana_koodiarvo not in ('S', 'H', 'O') 
			and f.arviointi_arvosana_koodiarvo is not null 
			and d2.vahvistus_paiva is not null 
			and d2.suorituksen_tyyppi = 'perusopetuksenoppimaara'
			and f.koulutusmoduuli_pakollinen = 1
	group by d.oppija_oid, f.koulutusmoduuli_koodiarvo) f
  group by f.oppija_oid) f
  left join (
SELECT f.oppija_oid
      ,cast(avg(cast(f.arvosana as decimal(10,5))) as decimal(10,5)) as 'keskiarvo_lukuaineet'
  FROM (
	SELECT d.oppija_oid, f.koulutusmoduuli_koodiarvo, max(f.arviointi_arvosana_koodiarvo) as 'arvosana' FROM [Koski_SA].[sa].[sa_koski_osasuoritus] f
	left join [Koski_SA].[sa].[sa_koski_opiskeluoikeus] d on d.opiskeluoikeus_oid = f.opiskeluoikeus_oid
	left join [Koski_SA].[sa].[sa_koski_paatason_suoritus] d2 on d2.paatason_suoritus_id = f.paatason_suoritus_id
	where		f.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava' 
			and f.arviointi_arvosana_koodiarvo not in ('S', 'H', 'O') 
			and f.arviointi_arvosana_koodiarvo is not null 
			and f.koulutusmoduuli_koodiarvo not in ('MU', 'KS', 'LI', 'KO', 'KU') 
			and d2.vahvistus_paiva is not null 
			and d2.suorituksen_tyyppi = 'perusopetuksenoppimaara' 
			and f.koulutusmoduuli_pakollinen = 1
	group by d.oppija_oid, f.koulutusmoduuli_koodiarvo) f
  group by f.oppija_oid) f2 on f2.oppija_oid = f.oppija_oid) q



DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_keskiarvot

SELECT DISTINCT k1.oppija_oid
	,peruskoulu_keskiarvo = ka.keskiarvo
	,peruskoulu_keskiarvo_lukuaineet = ka.keskiarvo_lukuaineet
	,peruskoulu_keskiarvo_kategoria =
		CASE 
			WHEN ka.keskiarvo IS NULL THEN 'Tieto puuttuu'
			WHEN ka.keskiarvo >= 9.5 THEN '9,5 - 10'
			WHEN ka.keskiarvo < 9.5 AND ka.keskiarvo >= 9.0 THEN '9,0 - 9,5'
			WHEN ka.keskiarvo < 9.0 AND ka.keskiarvo >= 8.5 THEN '8,5 - 9,0'
			WHEN ka.keskiarvo < 8.5 AND ka.keskiarvo >= 8.0 THEN '8,0 - 8,5'
			WHEN ka.keskiarvo < 8.0 AND ka.keskiarvo >= 7.5 THEN '7,5 - 8,0'
			WHEN ka.keskiarvo < 7.5 AND ka.keskiarvo >= 7.0 THEN '7,0 - 7,5'
			WHEN ka.keskiarvo < 7.0 AND ka.keskiarvo >= 6.5 THEN '6,5 - 7,0'
			WHEN ka.keskiarvo < 6.5 AND ka.keskiarvo >= 6.0 THEN '6,0 - 6,5'
			WHEN ka.keskiarvo < 6.0 AND ka.keskiarvo >= 5.5 THEN '5,5 - 6,0'
			WHEN ka.keskiarvo < 5.5 AND ka.keskiarvo >= 5.0 THEN '5,0 - 5,5'
			WHEN ka.keskiarvo < 5.0 AND ka.keskiarvo >= 4.5 THEN '4,5 - 5,0'
			WHEN ka.keskiarvo < 4.5 AND ka.keskiarvo >= 4.0 THEN '4,0 - 4,5'
			ELSE 'Tieto puuttuu'
			END
	,jarj_peruskoulu_keskiarvo_kategoria =
		CASE 
			WHEN ka.keskiarvo IS NULL THEN 99
			WHEN ka.keskiarvo >= 9.5 THEN 1
			WHEN ka.keskiarvo < 9.5 AND ka.keskiarvo >= 9.0 THEN 2
			WHEN ka.keskiarvo < 9.0 AND ka.keskiarvo >= 8.5 THEN 3
			WHEN ka.keskiarvo < 8.5 AND ka.keskiarvo >= 8.0 THEN 4
			WHEN ka.keskiarvo < 8.0 AND ka.keskiarvo >= 7.5 THEN 5
			WHEN ka.keskiarvo < 7.5 AND ka.keskiarvo >= 7.0 THEN 6
			WHEN ka.keskiarvo < 7.0 AND ka.keskiarvo >= 6.5 THEN 7
			WHEN ka.keskiarvo < 6.5 AND ka.keskiarvo >= 6.0 THEN 8
			WHEN ka.keskiarvo < 6.0 AND ka.keskiarvo >= 5.5 THEN 9
			WHEN ka.keskiarvo < 5.5 AND ka.keskiarvo >= 5.0 THEN 10
			WHEN ka.keskiarvo < 5.0 AND ka.keskiarvo >= 4.5 THEN 11
			WHEN ka.keskiarvo < 4.5 AND ka.keskiarvo >= 4.0 THEN 12
			ELSE 99
			END
	,peruskoulu_keskiarvo_lukuaineet_kategoria =
		CASE 
			WHEN ka.keskiarvo_lukuaineet IS NULL THEN 'Tieto puuttuu'
			WHEN ka.keskiarvo_lukuaineet >= 9.5 THEN '9,5 - 10'
			WHEN ka.keskiarvo_lukuaineet < 9.5 AND ka.keskiarvo_lukuaineet >= 9.0 THEN '9,0 - 9,5'
			WHEN ka.keskiarvo_lukuaineet < 9.0 AND ka.keskiarvo_lukuaineet >= 8.5 THEN '8,5 - 9,0'
			WHEN ka.keskiarvo_lukuaineet < 8.5 AND ka.keskiarvo_lukuaineet >= 8.0 THEN '8,0 - 8,5'
			WHEN ka.keskiarvo_lukuaineet < 8.0 AND ka.keskiarvo_lukuaineet >= 7.5 THEN '7,5 - 8,0'
			WHEN ka.keskiarvo_lukuaineet < 7.5 AND ka.keskiarvo_lukuaineet >= 7.0 THEN '7,0 - 7,5'
			WHEN ka.keskiarvo_lukuaineet < 7.0 AND ka.keskiarvo_lukuaineet >= 6.5 THEN '6,5 - 7,0'
			WHEN ka.keskiarvo_lukuaineet < 6.5 AND ka.keskiarvo_lukuaineet >= 6.0 THEN '6,0 - 6,5'
			WHEN ka.keskiarvo_lukuaineet < 6.0 AND ka.keskiarvo_lukuaineet >= 5.5 THEN '5,5 - 6,0'
			WHEN ka.keskiarvo_lukuaineet < 5.5 AND ka.keskiarvo_lukuaineet >= 5.0 THEN '5,0 - 5,5'
			WHEN ka.keskiarvo_lukuaineet < 5.0 AND ka.keskiarvo_lukuaineet >= 4.5 THEN '4,5 - 5,0'
			WHEN ka.keskiarvo_lukuaineet < 4.5 AND ka.keskiarvo_lukuaineet >= 4.0 THEN '4,0 - 4,5'
			ELSE 'Tieto puuttuu'
			END
	,jarj_peruskoulu_keskiarvo_lukuaineet_kategoria =
		CASE 
			WHEN ka.keskiarvo_lukuaineet IS NULL THEN 99
			WHEN ka.keskiarvo_lukuaineet >= 9.5 THEN 1
			WHEN ka.keskiarvo_lukuaineet < 9.5 AND ka.keskiarvo_lukuaineet >= 9.0 THEN 2
			WHEN ka.keskiarvo_lukuaineet < 9.0 AND ka.keskiarvo_lukuaineet >= 8.5 THEN 3
			WHEN ka.keskiarvo_lukuaineet < 8.5 AND ka.keskiarvo_lukuaineet >= 8.0 THEN 4
			WHEN ka.keskiarvo_lukuaineet < 8.0 AND ka.keskiarvo_lukuaineet >= 7.5 THEN 5
			WHEN ka.keskiarvo_lukuaineet < 7.5 AND ka.keskiarvo_lukuaineet >= 7.0 THEN 6
			WHEN ka.keskiarvo_lukuaineet < 7.0 AND ka.keskiarvo_lukuaineet >= 6.5 THEN 7
			WHEN ka.keskiarvo_lukuaineet < 6.5 AND ka.keskiarvo_lukuaineet >= 6.0 THEN 8
			WHEN ka.keskiarvo_lukuaineet < 6.0 AND ka.keskiarvo_lukuaineet >= 5.5 THEN 9
			WHEN ka.keskiarvo_lukuaineet < 5.5 AND ka.keskiarvo_lukuaineet >= 5.0 THEN 10
			WHEN ka.keskiarvo_lukuaineet < 5.0 AND ka.keskiarvo_lukuaineet >= 4.5 THEN 11
			WHEN ka.keskiarvo_lukuaineet < 4.5 AND ka.keskiarvo_lukuaineet >= 4.0 THEN 12
			ELSE 99
			END
	,keskiarvo_kvintiili = 
		CASE
			WHEN ka.keskiarvo IS NULL THEN 'Tieto puuttuu'
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.8 THEN '5. kvintiili'
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.6 THEN '4. kvintiili'
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.4 THEN '3. kvintiili'
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.2 THEN '2. kvintiili'
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.0 THEN '1. kvintiili'
			ELSE 'Tieto puuttuu' END
	,jarj_keskiarvo_kvintiili = 
		CASE
			WHEN ka.keskiarvo IS NULL THEN 9
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.8 THEN 1
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.6 THEN 2
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.4 THEN 3
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.2 THEN 4
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.0 THEN 5
			ELSE 9 END
	,keskiarvo_lukuaineet_kvintiili = 
		CASE
			WHEN ka.keskiarvo_lukuaineet IS NULL THEN 'Tieto puuttuu'
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.8 THEN '5. kvintiili'
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.6 THEN '4. kvintiili'
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.4 THEN '3. kvintiili'
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.2 THEN '2. kvintiili'
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.0 THEN '1. kvintiili'
			ELSE 'Tieto puuttuu' END
	,jarj_keskiarvo_lukuaineet_kvintiili = 
		CASE
			WHEN ka.keskiarvo_lukuaineet IS NULL THEN 9
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.8 THEN 1
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.6 THEN 2
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.4 THEN 3
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.2 THEN 4
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.0 THEN 5
			ELSE 9 END
INTO Koski_SA.sa.temp_amm_kesk_keskiarvot
FROM Koski_SA.sa.temp_amm_kesk_kierros1 k1
LEFT JOIN Koski_SA.sa.temp_koski_perusaste_keskiarvot ka ON ka.oppija_oid = k1.oppija_oid
WHERE ka.oppija_oid IS NOT NULL



DROP TABLE IF EXISTS Koski_SA.sa.temp_amm_kesk_priorisoitu_tilanne

SELECT DISTINCT
 kohortti_vp
 ,[oppija_oid]
 ,A_opiskeluoikeus_oid
 ,sarja
 ,priorisoitu_tilanne_koodi
 ,priorisoitu_tilanne = 
		CASE
			WHEN priorisoitu_tilanne_koodi = 1 THEN 'Valmistunut alkuperäisestä tutkinnosta'
			WHEN priorisoitu_tilanne_koodi = 2 THEN 'Valmistunut toisesta ammatillisesta tutkinnosta'
			WHEN priorisoitu_tilanne_koodi = 3 THEN 'Jatkaa alkuperäisessä tutkinnossa'
			WHEN priorisoitu_tilanne_koodi = 4 THEN 'Jatkaa toisessa amm. tutkinnossa'
			WHEN priorisoitu_tilanne_koodi = 5 THEN 'Jatkaa VALMA-koulutuksessa'
			WHEN priorisoitu_tilanne_koodi = 6 THEN 'Jatkaa TELMA-koulutuksessa'
			WHEN priorisoitu_tilanne_koodi = 7 THEN 'Jatkaa muussa ammatillisessa koulutuksessa'
			WHEN priorisoitu_tilanne_koodi = 8 THEN 'Keskeyttänyt ammatillisen koulutuksen' 
			ELSE 'Tieto puuttuu' END
 ,vaihtanut_jarjestajaa
INTO Koski_SA.sa.temp_amm_kesk_priorisoitu_tilanne
FROM(
SELECT
 kohortti_vp
 ,[oppija_oid]
 ,A_opiskeluoikeus_oid
 ,sarja
 ,priorisoitu_tilanne_koodi = MIN(priorisoitu_tilanne_koodi)
 ,vaihtanut_jarjestajaa = MIN(vaihtanut_jarjestajaa)
FROM(
SELECT 
 q1.kohortti_vp
 ,q1.[oppija_oid]
 ,A_opiskeluoikeus_oid
 ,sarja
 ,tarkastuspaiva
 ,priorisoitu_tilanne_koodi = 
		CASE
			WHEN A_taso1 = 'Valmistunut' OR (valm.koulutusmoduuli_koodiarvo = A_koulutusmoduuli_koodiarvo and valm.vahvistus_paiva BETWEEN q1.A_alkamispaiva AND tarkastuspaiva) then 1
			WHEN A_koulutusmoduuli_koodiarvo != valm.koulutusmoduuli_koodiarvo and valm.vahvistus_paiva BETWEEN q1.A_alkamispaiva AND tarkastuspaiva THEN 2
			WHEN A_taso1 = 'Koulutus kesken' OR (q1.A_koulutusmoduuli_koodiarvo = ps.koulutusmoduuli_koodiarvo AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut')) THEN 3
			WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') AND q1.A_koulutusmoduuli_koodiarvo != ps.koulutusmoduuli_koodiarvo THEN 4
		--	WHEN ps.suorituksen_tyyppi in ('valma', 'telma') AND ooa.tila IN ('lasna', 'loma') THEN 5
			WHEN ps.suorituksen_tyyppi in ('valma') AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 5
			WHEN ps.suorituksen_tyyppi in ('telma') AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 6
			WHEN ps.suorituksen_tyyppi in ('muuammatillinenkoulutus','tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus') THEN 7
			WHEN B_taso1 = 'Ei uutta koulutusta' OR oo.koulutusmuoto != 'ammatillinenkoulutus' OR oo.opiskeluoikeus_oid IS NULL OR ooa.tila is NULL THEN 8 ELSE 99 END
 ,vaihtanut_jarjestajaa =
		CASE
			WHEN A_taso1 = 'Valmistunut' then 0
			WHEN A_koulutustoimija_oid = valm.koulutustoimija_oid AND valm.koulutusmoduuli_koodiarvo = A_koulutusmoduuli_koodiarvo and valm.vahvistus_paiva BETWEEN q1.A_alkamispaiva AND tarkastuspaiva THEN 1
			WHEN A_koulutustoimija_oid != valm.koulutustoimija_oid AND valm.koulutusmoduuli_koodiarvo = A_koulutusmoduuli_koodiarvo and valm.vahvistus_paiva BETWEEN q1.A_alkamispaiva AND tarkastuspaiva THEN 1
			WHEN A_koulutustoimija_oid = valm.koulutustoimija_oid AND valm.koulutusmoduuli_koodiarvo != A_koulutusmoduuli_koodiarvo and valm.vahvistus_paiva BETWEEN q1.A_alkamispaiva AND tarkastuspaiva then 0
			WHEN A_koulutustoimija_oid != valm.koulutustoimija_oid AND valm.koulutusmoduuli_koodiarvo != A_koulutusmoduuli_koodiarvo and valm.vahvistus_paiva BETWEEN q1.A_alkamispaiva AND tarkastuspaiva then 1
			WHEN A_taso1 = 'Koulutus kesken' then 0
			WHEN A_koulutustoimija_oid = oo.koulutustoimija_oid AND q1.A_koulutusmoduuli_koodiarvo = ps.koulutusmoduuli_koodiarvo AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') then 0
			WHEN A_koulutustoimija_oid != oo.koulutustoimija_oid AND q1.A_koulutusmoduuli_koodiarvo = ps.koulutusmoduuli_koodiarvo AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') then 1
			WHEN A_koulutustoimija_oid = oo.koulutustoimija_oid AND q1.A_koulutusmoduuli_koodiarvo != ps.koulutusmoduuli_koodiarvo AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') then 0
			WHEN A_koulutustoimija_oid != oo.koulutustoimija_oid AND q1.A_koulutusmoduuli_koodiarvo != ps.koulutusmoduuli_koodiarvo AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') then 1
			--WHEN A_koulutustoimija_oid = oo.koulutustoimija_oid AND ps.suorituksen_tyyppi in ('valma', 'telma') AND ooa.tila IN ('lasna', 'loma') then 0
			--WHEN A_koulutustoimija_oid != oo.koulutustoimija_oid AND ps.suorituksen_tyyppi in ('valma', 'telma') AND ooa.tila IN ('lasna', 'loma') then 1
			WHEN A_koulutustoimija_oid = oo.koulutustoimija_oid AND ps.suorituksen_tyyppi in ('valma') AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 0
			WHEN A_koulutustoimija_oid != oo.koulutustoimija_oid AND ps.suorituksen_tyyppi in ('valma') AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 1
			WHEN A_koulutustoimija_oid = oo.koulutustoimija_oid AND ps.suorituksen_tyyppi in ('telma') AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 0
			WHEN A_koulutustoimija_oid != oo.koulutustoimija_oid AND ps.suorituksen_tyyppi in ('telma') AND ooa.tila IN ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut') THEN 1
			WHEN A_koulutustoimija_oid = oo.koulutustoimija_oid AND ps.suorituksen_tyyppi in ('muuammatillinenkoulutus','tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus') then 0
			WHEN A_koulutustoimija_oid != oo.koulutustoimija_oid AND ps.suorituksen_tyyppi in ('muuammatillinenkoulutus','tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus') then 1
			else 1 END

  FROM [Koski_SA].[sa].[temp_amm_kesk_koottu] q1
  LEFT JOIN (SELECT oo.oppija_oid, oo.opiskeluoikeus_oid, koulutustoimija_oid, koulutusmoduuli_koodiarvo, vahvistus_paiva
				FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
				LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
				WHERE ps.suorituksen_tyyppi = 'ammatillinentutkinto'
				AND oo.viimeisin_tila = 'valmistunut'
				AND ps.vahvistus_paiva is not null) valm ON valm.oppija_oid = q1.oppija_oid  AND valm.opiskeluoikeus_oid != q1.A_opiskeluoikeus_oid
  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo 
	ON oo.oppija_oid = q1.oppija_oid  AND oo.opiskeluoikeus_oid != q1.A_opiskeluoikeus_oid
  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa 
	ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid AND q1.tarkastuspaiva BETWEEN ooa.alku AND COALESCE(ooa.loppu, '9999-01-01')
  LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps 
	ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
  WHERE oo.opiskeluoikeus_oid is null or (oo.sisaltyy_opiskeluoikeuteen_oid IS NULL AND ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus')) q2
	GROUP BY  kohortti_vp
 ,[oppija_oid]
 ,A_opiskeluoikeus_oid
 ,sarja) q3








GO


USE ANTERO