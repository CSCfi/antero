USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2]    Script Date: 14.3.2023 10:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER PROCEDURE [sa].[p_lataa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2] AS

--Lisätty välikirjoituksia sekä loppujoineihin indeksointi cpu-käytön alentamiseksi, koska venynyt toisinaan kilpailevien ajojen sattuessa. JS 14.3.2023

DROP TABLE IF EXISTS sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_1
DROP TABLE IF EXISTS sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_2
DROP TABLE IF EXISTS sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_3
DROP TABLE IF EXISTS sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_4
DROP TABLE IF EXISTS sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_5
DROP TABLE IF EXISTS sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2

--1
SELECT DISTINCT 
	[opiskeluoikeus_oid]
	,sopimusmuoto =
		CASE 
			WHEN sopimusmuoto = 'Koulutuksen järjestäminen oppisopimuskoulutuksena' THEN 'Oppisopimus'
			ELSE sopimusmuoto
		END
	,[paatason_suoritus_id]
	,[alku]
	,[loppu]
	,[sijainti]
	,[ytunnus]
INTO sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_1
FROM [sa].[sa_koski_ammatillisen_koulutuksen_sopimusjaksot]
WHERE sopimusmuoto NOT IN ('Oppilaitosmuotoinen koulutus', 'Koulutuksen järjestäminen oppilaitosmuotoisena')

--2
SELECT DISTINCT 
	* 
	,rnk_ytunnus = RANK() OVER (PARTITION BY opiskeluoikeus_oid, sopimusmuoto, alku, loppu, ytunnus ORDER BY sijainti DESC)
	,rnk_poimintatapa = RANK() OVER (PARTITION BY opiskeluoikeus_oid, sopimusmuoto, alku, loppu ORDER BY ytunnus DESC)
INTO sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_2
FROM sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_1

DROP TABLE IF EXISTS sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_1

--3
SELECT DISTINCT 
	id = ROW_NUMBER() over (order by opiskeluoikeus_oid, sopimusmuoto, alku, loppu, ytunnus, sijainti)
	,opiskeluoikeus_oid
	,paatason_suoritus_id
	,sopimusmuoto
	,alku
	,loppu
	,ytunnus
	,sijainti
INTO sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_3
FROM sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_2
WHERE NOT(ytunnus IS NULL AND rnk_poimintatapa != 1)
AND NOT(rnk_ytunnus != 1 AND sijainti IS NULL)

DROP TABLE IF EXISTS sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_2

--4
SELECT 
	sj.[opiskeluoikeus_oid]
	,sj.paatason_suoritus_id
	,[sopimusmuoto]
	,id
	,sj_alku = sj.[alku] 
	,sj_loppu = ca.loppu
	,ooa_alku = ooa.alku
	,ooa_loppu = ooa.loppu
	,sop_alku =
		CASE 
			WHEN ooa.alku > sj.alku THEN ooa.alku
			WHEN ooa.alku <= sj.alku THEN sj.alku
		END
	,sop_loppu =
		CASE
			WHEN ooa.loppu > sj.loppu THEN sj.loppu
			WHEN ooa.loppu <= sj.loppu THEN ooa.loppu
		END
	,[ytunnus]
	,[sijainti]
INTO sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_4
FROM [sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_3] sj
LEFT JOIN sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = sj.opiskeluoikeus_oid
CROSS APPLY (SELECT loppu=coalesce(sj.loppu, oo.paattymispaiva, '9999-12-31')) ca
LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa 
	ON sj.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	AND ooa.alku <= ca.loppu
	AND ooa.loppu >= sj.alku
WHERE ooa.tila IN ('lasna', 'loma', 'valmistunut')

DROP TABLE IF EXISTS sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_3

--5
SELECT
	id,
	opiskeluoikeus_oid,
	paatason_suoritus_id,
	sj_alku,
	sj_loppu,
	sopimusmuoto,
	ytunnus,
	sijainti,
	paivat = DATEDIFF(D, sj_alku, sj_loppu)+1,
	paivat_tarkastettu = DATEDIFF(D, sop_alku, sop_loppu)+1,
	rnk_jakso = row_number() over (partition by opiskeluoikeus_oid, sopimusmuoto, sj_alku order by sj_loppu desc)
INTO sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_5
FROM sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_4
WHERE sj_loppu >= sj_alku

DROP TABLE IF EXISTS sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_4

--
SELECT DISTINCT
	id,
	opiskeluoikeus_oid = cast(opiskeluoikeus_oid as varchar(50)),
	paatason_suoritus_id,
	alku = sj_alku,
	loppu = sj_loppu,
	sopimusmuoto,
	ytunnus,
	sijainti,
	paivat,
	paivat_tarkastettu = SUM(paivat_tarkastettu),
	sisaltyy_toiseen_jaksoon = NULL
INTO [sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2]
FROM sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_5
WHERE rnk_jakso=1
GROUP BY
	id,
	opiskeluoikeus_oid,
	paatason_suoritus_id,
	sj_alku,
	sj_loppu,
	sopimusmuoto,
	ytunnus,
	sijainti,
	paivat,
	rnk_jakso

DROP TABLE IF EXISTS sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2_valitaulu_5


--joineja/updatea varten, cpu-käytön pienentämiseksi
CREATE NONCLUSTERED INDEX [NC_amm_sj_siivottu2] ON sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2
(
	[opiskeluoikeus_oid],
	[ytunnus],
	[sopimusmuoto],
	[alku],
	[loppu]

) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


--päällekkäisten jaksojen yhdistäminen
INSERT INTO sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2

SELECT distinct
	sj.id
	,sj.opiskeluoikeus_oid
	,sj.paatason_suoritus_id
	,alku = ca1.MinValue
	,loppu = ca2.MaxValue
	,sj.sopimusmuoto
	,sj.ytunnus
	,sj.sijainti
	,paivat = datediff(d, ca1.minValue, ca2.MaxValue)+1
	,paivat_tarkastettu = datediff(d, ca1.minValue, ca2.MaxValue)+1
	,sisaltyy_toiseen_jaksoon=0
FROM [sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2] sj
JOIN sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2 sj2 on sj2.opiskeluoikeus_oid=sj.opiskeluoikeus_oid and sj2.ytunnus=sj.ytunnus and sj2.sopimusmuoto=sj.sopimusmuoto and sj2.alku between sj.alku and sj.loppu and sj2.loppu>sj.loppu 
LEFT JOIN sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2 sj3 on sj3.opiskeluoikeus_oid=sj.opiskeluoikeus_oid and sj3.ytunnus=sj.ytunnus and sj3.sopimusmuoto=sj.sopimusmuoto and sj3.alku between sj2.alku and sj2.loppu and sj3.loppu>sj2.loppu
LEFT JOIN sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2 sj4 on sj4.opiskeluoikeus_oid=sj.opiskeluoikeus_oid and sj4.ytunnus=sj.ytunnus and sj4.sopimusmuoto=sj.sopimusmuoto and sj4.alku between sj3.alku and sj3.loppu and sj4.loppu>sj3.loppu
CROSS APPLY (SELECT MIN(d) AS MinValue FROM (VALUES (sj.alku), (sj2.alku), (sj3.alku), (sj4.alku)) AS a(d)) ca1
CROSS APPLY (SELECT MAX(d) AS MaxValue FROM (VALUES (sj.loppu), (sj2.loppu), (sj3.loppu), (sj4.loppu)) AS a(d)) ca2


--toiseen jaksoon sisältyvien jaksojen liputus ja poisto
UPDATE 
	t1
SET 
	t1.sisaltyy_toiseen_jaksoon = case when t2.opiskeluoikeus_oid is null then 0 else 1 end
FROM sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2 t1
LEFT JOIN sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2 t2 on t2.opiskeluoikeus_oid=t1.opiskeluoikeus_oid and t2.sopimusmuoto=t1.sopimusmuoto and t2.ytunnus=t1.ytunnus and (t2.alku <= t1.alku and t2.loppu >= t1.loppu and not (t2.alku = t1.alku and t2.loppu = t1.loppu))

DELETE FROM [sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu2] WHERE sisaltyy_toiseen_jaksoon=1
