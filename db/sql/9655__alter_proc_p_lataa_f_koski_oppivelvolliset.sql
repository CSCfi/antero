USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_oppivelvolliset]    Script Date: 27.2.2024 12:26:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dw].[p_lataa_f_koski_oppivelvolliset] AS

/*
- Oppivelvollisen määritelmä:
- 1. Henkilö ei ole suorittanut perusopetuksen päättötodistusta ennen 1.1.2021
- 2. Henkilön kotikunta on Suomessa, mutta ei ole Ahvenanmaa
- 3. Henkilö ei ole syntynyt ennen vuotta 2004
- Seuraavat rajaukset tarkasteluajankohdan mukaan
- 4. Henkilö ei ole 18-vuotias
- 5. Henkilö ei ole suorittanut toisen asteen tutkintoa 
*/

--Lisätty pari muuttujaa ja lisäpoiminta hv-raportin erityistarpeisiin. Samalla karsittu päätason suorituksia prioriteetin perusteella. JS 31.1.2023

DECLARE @alkuPvm as date

SET @alkuPvm = '2021-01-01'

-- Tehdään-temp tauluun esirajaukset määritelmän kohtien 1-3 mukaan

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset]

SELECT * INTO [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] FROM (

	SELECT 
		 h.[oppija_oid]
		,[syntymaaika]
		,[aidinkieli]
		,[kansalaisuus] = LEFT([kansalaisuus], 3)
		,[sukupuoli]
		,[kotikunta]
		,ts.vahvistus_paiva as tutkinto_suoritettu
		,ov.loppuPvm as oppivelvollisuus_suoritettu
		,po.oppilaitos_oid as perusopetuksen_oppilaitos_oid
		,po.vahvistus_paiva as perusopetus_suoritettu
	FROM [Koski_SA].[sa].[sa_koski_henkilo] h
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d on d.kunta_koodi = h.kotikunta
	-- Perusopetuksen ennen vuotta 2021 suorittaneet
	LEFT JOIN (
		SELECT DISTINCT 
			oo.oppija_oid
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
		WHERE ((ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara','perusopetuksenlisaopetus')) OR
			   (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') OR
			   (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S4')) AND 
			   YEAR(ps.vahvistus_paiva) < 2021 AND oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1) oo on oo.oppija_oid = h.oppija_oid
	-- Toisen asteen tutkinnon suorittaneet
	LEFT JOIN Koski_SA.sa.toisen_asteen_tutkinnot ts on ts.oppija_oid = h.oppija_oid and ts.rnk = 1
	-- Oppivelvollisuus suoritettu
	LEFT JOIN Koski_SA.sa.sa_oppivelvolliset ov on ov.oppija_oid = h.oppija_oid
	-- Perusopetuksen suorittaneet
	LEFT JOIN (
		SELECT DISTINCT 
			oo.oppija_oid, 
			oo.oppilaitos_oid, 
			oo.opiskeluoikeus_oid,
			vahvistus_paiva_min = MIN(ps.vahvistus_paiva) OVER(
					PARTITION BY oo.oppija_oid),
			ps.vahvistus_paiva
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		WHERE ps.vahvistus_paiva is not null and ((ps.suorituksen_tyyppi in('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara')) OR
		(ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') OR
		(ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S4'))) po on po.oppija_oid = h.oppija_oid AND po.vahvistus_paiva = po.vahvistus_paiva_min
	-- Rajaukset
	-- Ei ole syntynyt ennen vuotta 2004
	-- Kotikunta on Suomessa, mutta ei ole Ahvenanmaa
	-- Perusopetuksen päättötodistusta ei ole suoritettu ennen vuotta 2021
	WHERE YEAR(syntymaaika) >= 2004 
		AND d.maakunta_fi not in ('Ulkomaa' /*Jos koodistopalvelun versio*/, 'Ulkomaat' /*TK*/, 'Ahvenanmaa', 'Ei tiedossa (maakunta)', 'Tieto puuttuu') 
		AND h.turvakielto = 0 
		AND oo.oppija_oid is null
) f


-- Temp-tauluun tiedot oppivelvollisuuden suoritushetkestä

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvollisuus_suoritettu]

SELECT * INTO [Koski_SA].[sa].[temp_oppivelvollisuus_suoritettu] FROM (

	SELECT  
		f.oppija_oid,
		f.opiskeluoikeus_oid,
		f.koulutusmoduuli_koodiarvo,
		f.koulutusmuoto,
		f.suorituksen_tyyppi,
		f.vaativan_erityisen_tuen_erityinen_tehtava,
		f.oppivelvollisen_toiminta,
		f.oppivelvollisen_toiminta_min
	FROM (
		SELECT 
		f.oppija_oid,
		f.opiskeluoikeus_oid,
		f.koulutusmoduuli_koodiarvo,
		f.koulutusmuoto,
		f.suorituksen_tyyppi,
		f.vaativan_erityisen_tuen_erityinen_tehtava,
		CONCAT(f.oppivelvollisen_toiminta,'_', f.opiskeluoikeus_oid) as oppivelvollisen_toiminta,
		oppivelvollisen_toiminta_min = 
					MIN(CONCAT(f.oppivelvollisen_toiminta,'_',f.opiskeluoikeus_oid)) OVER (
						PARTITION BY f.oppija_oid)

	FROM (
		SELECT DISTINCT
			ov.oppija_oid,
			oo.koulutusmuoto,
			ps.suorituksen_tyyppi,
			ooa.opiskeluoikeus_oid,
			CASE
				WHEN aps.opiskeluoikeus_oid is not null THEN aps.tutkinto_koodi
				WHEN lps.tavoitetutkinto = 'Deutsche Internationale Abitur; Reifeprüfung' THEN '301103'
				WHEN lps.tavoitetutkinto = 'IB-tutkinto (International Baccalaureate)' THEN '301102'
				WHEN lps.tavoitetutkinto = 'Ylioppilastutkinto' THEN '301101'
				WHEN lps.tavoitetutkinto = 'EB-tutkinto (European Baccalaureate)' THEN '301104'
				WHEN lps.tavoitetutkinto = 'Ei tutkintotavoitetta' THEN '-1'
				ELSE ps.koulutusmoduuli_koodiarvo
			END as koulutusmoduuli_koodiarvo,
			ov.oppivelvollisuus_suoritettu,
			--huom. tässä eri luokitus kuin varsinaiselle oppivelvollisen toiminnalle jäljempänä, nykyisellään minimi ei sietäisi 2-numeroista koodia tässä. JS 14.3.2023
			CASE 
				WHEN ooy.tila_koodiarvo = 'valmistunut' THEN 0
				WHEN aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila in ('lasna', 'loma','valmistunut','hyvaksytystisuoritettu') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
				WHEN lps.tavoitetutkinto is not null and lps.tavoitetutkinto != 'Ei tutkintotavoitetta' and ooa.tila in ('lasna', 'loma','valmistunut','hyvaksytystisuoritettu') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
				WHEN ((ps.suorituksen_tyyppi in ('perusopetuksenoppimaara','aikuistenperusopetuksenoppimaara','aikuistenperusopetuksenoppimaaranalkuvaihe')) or 
					 (ps.suorituksen_tyyppi in ('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9')) or
					 (ps.suorituksen_tyyppi in ('europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') and ps.koulutusmoduuli_koodiarvo in ('P1','P2','P3','P4','P5','S1','S2','S3','S4'))) and 
					 ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 2
				WHEN (ps.suorituksen_tyyppi in ('esiopetuksensuoritus') or (ps.suorituksen_tyyppi = 'internationalschoolpypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = 'explorer') or (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkanursery')) and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
				WHEN ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 4
				WHEN ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 5
				WHEN ooa.tila in ('lasna', 'loma') THEN 6
				WHEN ooa.tila in ('valmistunut','hyvaksytystisuoritettu') THEN 7
				WHEN ooa.tila in ('katsotaaneronneeksi', 'eronnut') or (ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 0) THEN 8
				WHEN ooa.opiskeluoikeus_oid is null THEN 9
			END AS oppivelvollisen_toiminta,
			coalesce(ooa.vaativan_erityisen_tuen_erityinen_tehtava,0) as vaativan_erityisen_tuen_erityinen_tehtava
		FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.oppija_oid = ov.oppija_oid
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_ytr] ooy on oo.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid and ooy.alku = ov.oppivelvollisuus_suoritettu
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid AND ov.oppivelvollisuus_suoritettu BETWEEN ooa.alku AND ooa.loppu
		LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] lps on lps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
		LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] aps on aps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid 
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on (ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid or ps.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid)
		WHERE ov.oppivelvollisuus_suoritettu <= GETDATE() and oo.sisaltyy_opiskeluoikeuteen_oid is null) f ) f
	WHERE f.oppivelvollisen_toiminta = f.oppivelvollisen_toiminta_min
) f


TRUNCATE TABLE ANTERO.dw.f_koski_oppivelvolliset

WHILE @alkuPvm <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0) 
	OR --viimeisin opiskelutieto hv-kuutioon 1.8. - 1.12, ks. lopun if-ehto. JS 31.1.2023
	(@alkuPvm = DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), -1) and @alkuPvm between DATEFROMPARTS(YEAR(@alkuPvm), 8, 2) and DATEFROMPARTS(YEAR(@alkuPvm), 11, 30)) 

BEGIN
	
	-- Temp-taulu johon haetaan tieto tarkasteluvuoden aikana oppivelvollisten toiminnasta tarkasteluajanhetkellä
	-- 1: Oppivelvollisuus suoritettu: Suorittanut toiseen asteen tutkinnon
	-- 2: Oppivelvollisuus suoritettu: Täyttänyt 18-vuotta
	-- 3: Suorittaa oppivelvollisuutta: Tutkintoon johtavassa ammatillisessa koulutuksessa (päätellään koulutusmuodosta)
	-- 3(4): Suorittaa oppivelvollisuutta: Tutkintoon johtavassa lukiokoulutuksessa (päätellään koulutusmuodosta)
	-- 5: Suorittaa oppivelvollisuutta: Suorittaa perusopetuksen oppimäärää
	-- 6: Suorittaa oppivelvollisuutta: Esiopetuksessa
	-- 7: Suorittaa oppivelvollisuutta: Tutkintoon johtamattomassa koulutuksessa
	-- 8: Ei suorita oppivelvollisuutta: Vapautettu oppivelvollisuudesta
	-- 9: Ei suorita oppivelvollisuutta: Keskeyttänyt oppivelvollisuuden suorittamisen väliaikaisesti
	-- 10: Ei suorita oppivelvollisuutta: Tutkintoon johtamattomassa koulutuksessa (ei kelpaa oppivelvollisuuden suorittamiseen)
	-- 11: Ei suorita oppivelvollisuutta: Ei opiskeluoikeutta (edellisen opiskeluoikeuden tila 'valmistunut' tai 'hyvaksytystisuoritettu')
	-- 12(11): Ei suorita oppivelvollisuutta: Ei opiskeluoikeutta (edellisen opiskeluoikeuden tila 'eronnut' tai 'katsotaaneronneeksi') 
	-- 13(11): Ei suorita oppivelvollisuutta: Ei opiskeluoikeutta (ei aiempaa opiskeluoikeutta)

	-- VV 08/2022: Lisätty ehto. Jos henkilö on keskeyttänyt väliaikaisesti koulutuksen joka ei kelpaa oppivelvollisuuden suorittamiseen --> oppivelvollisen_toiminta = 11(10)

	DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_toiminta

	SELECT * INTO Koski_SA.sa.temp_oppivelvollisten_toiminta FROM (
		SELECT DISTINCT 
			f.oppija_oid,
			f.opiskeluoikeus_oid,
			f.tilastovuosi,
			f.tilastokuukausi,
			case when f.keskeyttanyt = 1 then null else f.koulutusmoduuli_koodiarvo end as koulutusmoduuli_koodiarvo,
			case when f.keskeyttanyt = 1 then null else f.koulutusmuoto end as koulutusmuoto,
			case when f.keskeyttanyt = 1 then null else f.suorituksen_tyyppi end as suorituksen_tyyppi,
			f.suorittanut_perusopetuksen_oppimaaran,
			f.perusopetuksen_oppimaara_suoritettu_pvm,
			f.vaativan_erityisen_tuen_erityinen_tehtava,
			oppivelvollisen_toiminta,
			oppivelvollisen_toiminta_min = 
				MIN(f.oppivelvollisen_toiminta) OVER (
					PARTITION BY f.oppija_oid, f.tilastovuosi, f.tilastokuukausi)

		FROM (
			SELECT DISTINCT
				tilastovuosi = YEAR(@alkuPvm),
				tilastokuukausi = MONTH(@alkuPvm),
				ooa.opiskeluoikeus_oid,
				CASE 
					WHEN aps.opiskeluoikeus_oid is not null THEN aps.tutkinto_koodi
					WHEN lps.tavoitetutkinto = 'Deutsche Internationale Abitur; Reifeprüfung' THEN '301103'
					WHEN lps.tavoitetutkinto = 'IB-tutkinto (International Baccalaureate)' THEN '301102'
					WHEN lps.tavoitetutkinto = 'Ylioppilastutkinto' THEN '301101'
					WHEN lps.tavoitetutkinto = 'EB-tutkinto (European Baccalaureate)' THEN '301104'
					WHEN lps.tavoitetutkinto = 'Ei tutkintotavoitetta' THEN '-1'
					ELSE ps.koulutusmoduuli_koodiarvo
				END AS koulutusmoduuli_koodiarvo,
				ps.suorituksen_tyyppi,
				oo.koulutusmuoto,
				ov.[oppija_oid],
				ov.perusopetus_suoritettu as perusopetuksen_oppimaara_suoritettu_pvm,
				CASE 
					WHEN ov.perusopetus_suoritettu is null or @alkuPvm < ov.perusopetus_suoritettu THEN 0
					ELSE 1
				END as suorittanut_perusopetuksen_oppimaaran,
				CASE
					WHEN @alkuPvm >= ov.tutkinto_suoritettu and ov.tutkinto_suoritettu <= DATEADD(year, 18, ov.syntymaaika) THEN 1
					WHEN @alkuPvm >= DATEADD(year, 18, ov.syntymaaika) THEN 2
					WHEN aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila in ('lasna', 'loma','valmistunut') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
					WHEN lps.tavoitetutkinto is not null and lps.tavoitetutkinto != 'Ei tutkintotavoitetta' and ooa.tila in ('lasna', 'loma','valmistunut') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
					WHEN ((ps.suorituksen_tyyppi in ('perusopetuksenoppimaara','aikuistenperusopetuksenoppimaara','aikuistenperusopetuksenoppimaaranalkuvaihe')) or 
						 (ps.suorituksen_tyyppi in('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9')) or
						 (ps.suorituksen_tyyppi in ('europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') and ps.koulutusmoduuli_koodiarvo in ('P1','P2','P3','P4','P5','S1','S2','S3','S4'))) and 
						 ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 5
					WHEN (ps.suorituksen_tyyppi in ('esiopetuksensuoritus') or (ps.suorituksen_tyyppi = 'internationalschoolpypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = 'explorer') or (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkanursery')) and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 6
					WHEN ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 7
					WHEN vov.vapautettu is not null THEN 8 
					WHEN ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 9
					WHEN kesk.peruttu = 0 THEN 10
					WHEN ooa.tila in ('lasna', 'loma') THEN 11
					WHEN ooa.tila in ('valmistunut','hyvaksytystisuoritettu') THEN 12
					WHEN ooa.tila in ('katsotaaneronneeksi', 'eronnut') or (ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 0) THEN 13
					WHEN ooa.opiskeluoikeus_oid is null THEN 14
				END AS oppivelvollisen_toiminta,
				CASE
					WHEN kesk.peruttu = 0 and ooa.opiskeluoikeus_oid is null THEN 1
					ELSE 0
				END as keskeyttanyt,
				coalesce(ooa.vaativan_erityisen_tuen_erityinen_tehtava,0) as vaativan_erityisen_tuen_erityinen_tehtava 
			FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
			LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.oppija_oid = ov.oppija_oid
			LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on 
					   ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa.alku <= @alkuPvm and ooa.loppu >= @alkuPvm
			LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
			LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] aps on aps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] lps on lps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			LEFT JOIN (
				SELECT 
					k.oppija_oid, 
					coalesce(kh.peruttu, k.peruttu) as peruttu, 
					MAX(coalesce(cast(left(kh.muutos_tehty,18) as datetime), cast(k.luotu as datetime))) OVER (PARTITION BY k.oppija_oid) as luotuMax,
					coalesce(cast(left(kh.muutos_tehty,18) as datetime), cast(k.luotu as datetime)) as luotu
				FROM [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytys] k
				LEFT JOIN [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytyshistoria] kh on kh.ov_keskeytys_uuid = k.uuid
				WHERE coalesce(kh.alku, k.alku) <= @alkuPvm and (coalesce(kh.loppu, k.loppu) > @alkuPvm or coalesce(kh.loppu, k.loppu) is null) and coalesce(case when cast(left(kh.muutos_tehty,18) as date) = cast(kh.luotu as date) and cast(left(kh.muutos_tehty,18) as date) > kh.alku then kh.alku else cast(left(kh.muutos_tehty,18) as date) end, cast(case when k.luotu > k.alku then k.alku else k.luotu end as date)) <= @alkuPvm
			) kesk on kesk.oppija_oid = ov.oppija_oid and kesk.luotu = kesk.luotuMax
			OUTER APPLY (
				SELECT 
					vov.oppija_oid, 
					MIN(vov.vapautettu) as vapautettu 
				FROM [Koski_SA].[sa].[sa_valpas_oppivelvollisuudesta_vapautetut] vov 
				WHERE vapautettu <= @alkuPvm and vov.oppija_oid = ov.oppija_oid and cast(vov.mitatoity as date) = cast('9999-01-01' as date)
				GROUP BY vov.oppija_oid
			) vov 
			WHERE CAST(CONCAT(YEAR(@alkuPvm),'-01-01') as date) < DATEADD(year, 18, ov.syntymaaika) 
			AND YEAR(@alkuPvm) >= YEAR(DATEADD(year, 16, ov.syntymaaika)) 
			AND (ov.tutkinto_suoritettu is null or YEAR(@alkuPvm) <= YEAR(ov.tutkinto_suoritettu)) 
			AND oo.sisaltyy_opiskeluoikeuteen_oid is null
			AND NOT EXISTS (
				SELECT * FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
				WHERE oo.koulutusmuoto != 'tuva'
				AND tuvat.oppija_oid = oo.oppija_oid
				AND @alkuPvm between tuvat.alku and tuvat.loppu
			)
				 
		) f 

	) f WHERE oppivelvollisen_toiminta = oppivelvollisen_toiminta_min;


	-- Faktataulun lataus

	INSERT INTO ANTERO.dw.f_koski_oppivelvolliset

	SELECT DISTINCT
		f.tilastovuosi,
		f.tilastokuukausi,
		@alkuPvm as ajankohta,

		f.oppija_oid,
		f.oppivelvollisen_toiminta,
		d10.id as d_kytkin_kelpaa_oppivelvollisuuden_suorittamiseen_id,
		
		coalesce(d1.id,-1) as d_organisaatioluokitus_oppilaitos_id,
		coalesce(d2.id,-1) as d_organisaatioluokitus_koulutuksen_jarjestaja_id,
		coalesce(d11.id,-1) as d_organisaatioluokitus_perusopetuksen_oppilaitos_id,
	
		f.syntymavuosi,
		coalesce(d3.id,-1) as d_sukupuoli_id,
		coalesce(d4.id,-1) as d_alueluokitus_id,
		coalesce(d5.id,-1) as d_kieli_id,
		coalesce(d6.id,-1) as d_kansalaisuus_id,
		d7.id as d_ika_id,
		d9.id as d_kytkin_suorittanut_perusopetuksen_oppimaaran_id,
		coalesce(d12.id,-1) as d_kalenteri_perusopetuksen_oppimaara_suoritettu_pvm_id,

		coalesce(d8.id, -1) as d_koulutusluokitus_id,
		coalesce(f.koulutusmuoto, '-1') as koulutusmuoto,
		coalesce(f.suorituksen_tyyppi, '-1') as suorituksen_tyyppi,
		coalesce(d13.id, -1) as d_kytkin_vaativa_erityinen_tuki_id,

		--hv
		ov_kuutioon = case when @alkuPvm > DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0) then 0 else 1 end,
		koulutusmuoto_hv = coalesce(f.koulutusmuoto_hv, '-1'),
		koulutusmoduuli_koodiarvo_hv = case when len(koulutusmoduuli_koodiarvo_hv) = 6 then koulutusmoduuli_koodiarvo_hv else '-1' end,
		suorituksen_tyyppi_hv = coalesce(f.suorituksen_tyyppi_hv, '-1'),
		oppivelvollisuuden_suorittamiseen_kelpaava_hv,
		ika_18_tarkasteluhetkella_hv,
		perusopetuksen_oppilaitos_oid_hv,
		loadtime = GETDATE(),
		username = suser_sname(),
		source = 'ETL: p_lataa_f_koski_oppivelvolliset'

	FROM (
		-- Oppivelvolliset, joilla on vähintään yksi opiskeluoikeus tarkasteluajanhetkellä
		SELECT 
			tilastovuosi = YEAR(@alkuPvm),
			tilastokuukausi = MONTH(@alkuPvm),
			ov.[oppija_oid],
			ovt.opiskeluoikeus_oid,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta = 3 and ovt.koulutusmuoto <> 'ammatillinenkoulutus' THEN 4
				WHEN ovt.oppivelvollisen_toiminta > 11 THEN 11
				ELSE ovt.oppivelvollisen_toiminta
			END as oppivelvollisen_toiminta,
			coalesce(oo.oppivelvollisuuden_suorittamiseen_kelpaava,0) as oppivelvollisuuden_suorittamiseen_kelpaava,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (8,12,13,14) THEN NULL
				ELSE oo.oppilaitos_oid
			END as oppilaitos_oid,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (8,12,13,14) THEN NULL
				ELSE oo.koulutustoimija_oid
			END as koulutustoimija_oid,
			CASE
				WHEN ovt.oppivelvollisen_toiminta in (8,12,13,14) THEN NULL
				ELSE ovt.koulutusmoduuli_koodiarvo
			END as koulutusmoduuli_koodiarvo,
			ika = YEAR(@alkuPvm) - YEAR(ov.syntymaaika),
			syntymavuosi = YEAR(ov.syntymaaika),
			ov.sukupuoli,
			ov.kansalaisuus,
			ov.aidinkieli,
			ov.kotikunta,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (8,12,13,14) THEN '-1'
				ELSE ovt.koulutusmuoto
			END as koulutusmuoto,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (8,12,13,14) THEN '-1'
				ELSE ovt.suorituksen_tyyppi
			END as suorituksen_tyyppi,
			ovt.suorittanut_perusopetuksen_oppimaaran,
			ovt.perusopetuksen_oppimaara_suoritettu_pvm,
			CASE 
				WHEN ov.perusopetus_suoritettu <= @alkuPvm THEN ov.perusopetuksen_oppilaitos_oid
				ELSE NULL
			END as perusopetuksen_oppilaitos_oid,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (8,12,13,14) THEN '0'
				ELSE ovt.vaativan_erityisen_tuen_erityinen_tehtava
			END as vaativan_erityisen_tuen_erityinen_tehtava,
			--hv
			koulutusmuoto_hv = case when ovt.oppivelvollisen_toiminta between 1 and 11 and ovt.oppivelvollisen_toiminta <> 8 then ovt.koulutusmuoto end,
			koulutusmoduuli_koodiarvo_hv = case when ovt.oppivelvollisen_toiminta between 1 and 11 and ovt.oppivelvollisen_toiminta <> 8 then ovt.koulutusmoduuli_koodiarvo end,
			suorituksen_tyyppi_hv = case when ovt.oppivelvollisen_toiminta between 1 and 11 and ovt.oppivelvollisen_toiminta <> 8 then ovt.suorituksen_tyyppi end,
			oppivelvollisuuden_suorittamiseen_kelpaava_hv = coalesce(oo.oppivelvollisuuden_suorittamiseen_kelpaava, 0),
			ika_18_tarkasteluhetkella_hv = case when dateadd(year, 18, ov.syntymaaika) <= @alkuPvm then 1 else 0 end,
			perusopetuksen_oppilaitos_oid_hv = ov.perusopetuksen_oppilaitos_oid,
			--karsitaan opiskeluoikeuksittain mahdolliset (alemmat) vuosiluokkasuoritukset, aikuisten oppimäärää suorittavien alkuvaiheen suoritus sekä ammatillista tutkintoa suorittavien osittainen suoritus. JS 31.1.2023
			ranki = rank() over (partition by ov.oppija_oid, ovt.opiskeluoikeus_oid order by ovt.suorituksen_tyyppi, ovt.koulutusmoduuli_koodiarvo desc)
		FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
		INNER JOIN [Koski_SA].[sa].[temp_oppivelvollisten_toiminta] ovt on ovt.oppija_oid = ov.oppija_oid
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on ovt.opiskeluoikeus_oid = oo.opiskeluoikeus_oid AND ovt.oppivelvollisen_toiminta not in (8,11,12,13)
		WHERE CAST(CONCAT(YEAR(@alkuPvm),'-01-01') as date) < DATEADD(year, 18, ov.syntymaaika) AND
			  YEAR(@alkuPvm) >= YEAR(DATEADD(year, 16, ov.syntymaaika)) AND
			  (ov.tutkinto_suoritettu is null or YEAR(@alkuPvm) <= YEAR(ov.tutkinto_suoritettu)) AND
			  ovt.oppivelvollisen_toiminta not in (1,2)

		UNION ALL

		SELECT DISTINCT  
			tilastovuosi = YEAR(@alkuPvm),
			tilastokuukausi = MONTH(@alkuPvm),
			ov.[oppija_oid],
			os.opiskeluoikeus_oid,
			ovt.oppivelvollisen_toiminta,
			coalesce(oo.oppivelvollisuuden_suorittamiseen_kelpaava,0) as oppivelvollisuuden_suorittamiseen_kelpaava,
			oo.oppilaitos_oid,
			oo.koulutustoimija_oid,
			os.koulutusmoduuli_koodiarvo,
			ika = YEAR(@alkuPvm) - YEAR(ov.syntymaaika),
			syntymavuosi = YEAR(ov.syntymaaika),
			ov.sukupuoli,
			ov.kansalaisuus,
			ov.aidinkieli,
			ov.kotikunta,
			os.koulutusmuoto,
			os.suorituksen_tyyppi,
			ovt.suorittanut_perusopetuksen_oppimaaran,
			ovt.perusopetuksen_oppimaara_suoritettu_pvm,
			CASE 
				WHEN ov.perusopetus_suoritettu <= @alkuPvm THEN ov.perusopetuksen_oppilaitos_oid
				ELSE NULL
			END as perusopetuksen_oppilaitos_oid,
			coalesce(os.vaativan_erityisen_tuen_erityinen_tehtava,0) as vaativan_erityisen_tuen_erityinen_tehtava,
			--hv
			koulutusmuoto_hv = case when ovt.oppivelvollisen_toiminta between 1 and 11 and ovt.oppivelvollisen_toiminta <> 8 then ovt.koulutusmuoto end,
			koulutusmoduuli_koodiarvo_hv = case when ovt.oppivelvollisen_toiminta between 1 and 11 and ovt.oppivelvollisen_toiminta <> 8 then ovt.koulutusmoduuli_koodiarvo end,
			suorituksen_tyyppi_hv = case when ovt.oppivelvollisen_toiminta between 1 and 11 and ovt.oppivelvollisen_toiminta <> 8 then ovt.suorituksen_tyyppi end,
			oppivelvollisuuden_suorittamiseen_kelpaava_hv = coalesce(oo2.oppivelvollisuuden_suorittamiseen_kelpaava, 0),
			ika_18_tarkasteluhetkella_hv = case when dateadd(year, 18, ov.syntymaaika) <= @alkuPvm then 1 else 0 end,
			perusopetuksen_oppilaitos_oid_hv = ov.perusopetuksen_oppilaitos_oid,
			--karsitaan opiskeluoikeuksittain mahdolliset (alemmat) vuosiluokkasuoritukset, aikuisten oppimäärää suorittavien alkuvaiheen suoritus sekä ammatillista tutkintoa suorittavien osittainen suoritus. JS 31.1.2023
			ranki = rank() over (partition by ov.oppija_oid, ovt.opiskeluoikeus_oid order by ovt.suorituksen_tyyppi, ovt.koulutusmoduuli_koodiarvo desc)
		FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
		INNER JOIN [Koski_SA].[sa].[temp_oppivelvollisten_toiminta] ovt on ovt.oppija_oid = ov.oppija_oid
		LEFT JOIN [Koski_SA].[sa].[temp_oppivelvollisuus_suoritettu] os on os.oppija_oid = ov.oppija_oid AND LEFT(os.oppivelvollisen_toiminta,1) != '9' --taulussa eri oppivelvollisen_toiminta (1-9). JS 14.3.2023
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid
		OUTER APPLY (
			select oppivelvollisuuden_suorittamiseen_kelpaava 
			from [Koski_SA].[sa].[sa_koski_opiskeluoikeus] 
			where opiskeluoikeus_oid = ovt.opiskeluoikeus_oid
		) oo2
		WHERE CAST(CONCAT(YEAR(@alkuPvm),'-01-01') as date) < DATEADD(year, 18, ov.syntymaaika) AND
			  YEAR(@alkuPvm) >= YEAR(DATEADD(year, 16, ov.syntymaaika)) AND
			  (ov.tutkinto_suoritettu is null or YEAR(@alkuPvm) <= YEAR(ov.tutkinto_suoritettu)) AND
			  ovt.oppivelvollisen_toiminta in (1,2)

	) f

	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d1 on d1.organisaatio_oid = f.oppilaitos_oid
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2 on d2.organisaatio_oid = f.koulutustoimija_oid
	LEFT JOIN [ANTERO].[dw].[d_sukupuoli] d3 on d3.sukupuoli_koodi = f.sukupuoli
	LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d4 on d4.kunta_koodi = f.kotikunta
	LEFT JOIN [ANTERO].[dw].[d_kieli] d5 on d5.kieli_koodi= f.aidinkieli
	LEFT JOIN [ANTERO].[dw].[d_maatjavaltiot2] d6 on d6.maatjavaltiot2_koodi = f.kansalaisuus
	LEFT JOIN [ANTERO].[dw].[d_ika] d7 on d7.ika_avain = f.ika
	LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d8 on d8.koulutusluokitus_koodi = f.koulutusmoduuli_koodiarvo
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d9 on d9.kytkin_koodi = f.suorittanut_perusopetuksen_oppimaaran
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d10 on d10.kytkin_koodi = f.oppivelvollisuuden_suorittamiseen_kelpaava
	LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d11 on d11.organisaatio_oid = f.perusopetuksen_oppilaitos_oid
	LEFT JOIN [ANTERO].[dw].[d_kalenteri] d12 on d12.kalenteri_avain = f.perusopetuksen_oppimaara_suoritettu_pvm
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d13 on d13.kytkin_koodi = f.vaativan_erityisen_tuen_erityinen_tehtava

	WHERE ranki=1

	
	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)
	
	IF @alkuPvm = DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE()), 0)
	SET @alkuPvm = DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), -1)

END

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset]
DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_toiminta
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvollisuus_suoritettu]


GO

USE [ANTERO]