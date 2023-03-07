USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_oppivelvolliset]    Script Date: 7.3.2023 11:48:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_oppivelvolliset]
AS

--Tiedoksi loma-ajaksi (JS 06/2022):
--lisätty perusopetuksen suoritusvuosi ja -kausi (myös prod-suodattimiksi)
--testissä lisätty perusopetuksen suorittamisen oppilaitos ("_all_time"), jotta vastaavat aluetiedot näkyvät hv-luonnoksella esim. 1.1. ysiluokkalaisten hv-joukolle.
--testissä hv-näkymää varten on toistaiseksi eritytetty näkymä v_koski_oppivelvolliset_HV ja hv-kuutio latautuu osana h&v-livelatausta.

/*
- Oppivelvollisen määritelmä:
- 1. Henkilö ei ole suorittanut perusopetuksen päättötodistusta ennen 1.1.2021
- 2. Henkilön kotikunta on Suomessa, mutta ei ole Ahvenanmaa
- 3. Henkilö ei ole syntynyt ennen vuotta 2004
- Seuraavat rajaukset tarkasteluajankohdan mukaan
- 4. Henkilö ei ole 18-vuotias
- 5. Henkilö ei ole suorittanut toisen asteen tutkintoa 
*/

DECLARE @alkuPvm as date

SET @alkuPvm = '2021-01-01'

-- Tehdään-temp tauluun esirajaukset määritelmän kohtien 1-3 mukaan

TRUNCATE TABLE [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset]

INSERT INTO [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset]

SELECT 
	 h.[oppija_oid]
	,[syntymaaika]
	,[aidinkieli]
	,CASE 
		WHEN [kansalaisuus] like '%246%' THEN 246 
		ELSE LEFT([kansalaisuus],3) 
	END AS [kansalaisuus]
	,[sukupuoli]
	,[kotikunta]
	,ts.tutkinto_suoritettu
	,CASE 
		WHEN ts.tutkinto_suoritettu is null OR ts.tutkinto_suoritettu > DATEADD(YEAR,18,h.syntymaaika) THEN DATEADD(YEAR,18,h.syntymaaika)
		ELSE ts.tutkinto_suoritettu
	END as oppivelvollisuus_suoritettu
	,po.oppilaitos_oid as perusopetuksen_oppilaitos_oid
	,po.vahvistus_paiva as perusopetus_suoritettu
FROM [Koski_SA].[sa].[sa_koski_henkilo] h
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d on d.kunta_koodi = h.kotikunta
LEFT JOIN (
	SELECT DISTINCT 
		oo.oppija_oid
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	WHERE ((ps.suorituksen_tyyppi in('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara','perusopetuksenlisaopetus')) OR
		   ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') AND 
		   YEAR(ps.vahvistus_paiva) < 2021 AND oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1) oo on oo.oppija_oid = h.oppija_oid
LEFT JOIN (
	SELECT 
		oo.oppija_oid, 
		MIN(ps.vahvistus_paiva) as tutkinto_suoritettu
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	WHERE oo.paattymispaiva is not null AND oo.viimeisin_tila = 'valmistunut' AND
	      ((ps.suorituksen_tyyppi in('ammatillinentutkinto','ibtutkinto','lukionoppimaara','diatutkintovaihe')) OR
		  (ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' AND ps.koulutusmoduuli_koodiarvo = '12')) AND
		   oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1
	GROUP BY oo.oppija_oid) ts on ts.oppija_oid = h.oppija_oid
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
	ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9')) po on po.oppija_oid = h.oppija_oid AND po.vahvistus_paiva = po.vahvistus_paiva_min
-- Rajaukset
-- Ei ole syntynyt ennen vuotta 2004
-- Kotikunta on Suomessa, mutta ei ole Ahvenanmaa
-- Perusopetuksen päättötodistusta ei ole suoritettu ennen vuotta 2021
WHERE YEAR(syntymaaika) >= 2004 AND d.maakunta_fi not in ('Ulkomaat', 'Ahvenanmaa', 'Ei tiedossa (maakunta)') AND h.turvakielto = 0 AND oo.oppija_oid is null;


-- Temp-tauluun tiedot oppivelvollisuuden suoritushetkestä

TRUNCATE TABLE [Koski_SA].[sa].[temp_oppivelvollisuus_suoritettu]

INSERT INTO [Koski_SA].[sa].[temp_oppivelvollisuus_suoritettu]

SELECT  
	f.oppija_oid,
	f.opiskeluoikeus_oid,
	f.koulutusmoduuli_koodiarvo,
	f.koulutusmuoto,
	f.suorituksen_tyyppi,
	f.oppivelvollisen_toiminta,
	f.oppivelvollisen_toiminta_min
FROM (
	SELECT 
	f.oppija_oid,
	f.opiskeluoikeus_oid,
	f.koulutusmoduuli_koodiarvo,
	f.koulutusmuoto,
	f.suorituksen_tyyppi,
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
			WHEN lps.tavoitetutkinto = 'Ei tutkintotavoitetta' THEN '-1'
			ELSE ps.koulutusmoduuli_koodiarvo
		END as koulutusmoduuli_koodiarvo,
		ov.oppivelvollisuus_suoritettu,
		CASE 
			WHEN aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila in ('lasna', 'loma','valmistunut','hyvaksytystisuoritettu') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
			WHEN lps.tavoitetutkinto is not null and lps.tavoitetutkinto != 'Ei tutkintotavoitetta' and ooa.tila in ('lasna', 'loma','valmistunut','hyvaksytystisuoritettu') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 1
			WHEN ((ps.suorituksen_tyyppi in ('perusopetuksenoppimaara','aikuistenperusopetuksenoppimaara','aikuistenperusopetuksenoppimaaranalkuvaihe')) or 
				 (ps.suorituksen_tyyppi in('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9'))) and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 2
			WHEN (ps.suorituksen_tyyppi in ('esiopetuksensuoritus') or (ps.suorituksen_tyyppi = 'internationalschoolpypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = 'explorer')) and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
			WHEN ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 4
			WHEN ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 5
			WHEN ooa.tila in ('lasna', 'loma') THEN 6
			WHEN ooa.tila in ('valmistunut','hyvaksytystisuoritettu') THEN 7
			WHEN ooa.tila in ('katsotaaneronneeksi', 'eronnut') or (ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 0) THEN 8
			WHEN ooa.opiskeluoikeus_oid is null THEN 9
		END AS oppivelvollisen_toiminta
	FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
	LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.oppija_oid = ov.oppija_oid
	LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid AND ov.oppivelvollisuus_suoritettu BETWEEN ooa.alku AND ooa.loppu
	LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] lps on lps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] aps on aps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid 
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	WHERE ov.oppivelvollisuus_suoritettu <= GETDATE()) f ) f
WHERE f.oppivelvollisen_toiminta = f.oppivelvollisen_toiminta_min

TRUNCATE TABLE ANTERO.dw.f_koski_oppivelvolliset

WHILE @alkuPvm <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0)

BEGIN
	
	-- Temp-taulu johon haetaan tieto tarkasteluvuoden aikana oppivelvollisten toiminnasta tarkasteluajanhetkellä
	-- 1: Oppivelvollisuus suoritettu: Suorittanut toiseen asteen tutkinnon
	-- 2: Oppivelvollisuus suoritettu: Täyttänyt 18-vuotta
	-- 3: Suorittaa oppivelvollisuutta: Tutkintoon johtavassa ammatillisessa koulutuksessa (päätellään koulutusmuodosta)
	-- 3(4): Suorittaa oppivelvollisuutta: Tutkintoon johtavassa lukiokoulutuksessa (päätellään koulutusmuodosta)
	-- 5: Suorittaa oppivelvollisuutta: Suorittaa perusopetuksen oppimäärää
	-- 6: Suorittaa oppivelvollisuutta: Esiopetuksessa
	-- 7: Suorittaa oppivelvollisuutta: Tutkintoon johtamattomassa koulutuksessa
	-- 8: Ei suorita oppivelvollisuutta: Keskeyttänyt oppivelvollisuuden suorittamisen väliaikaisesti
	-- 9: Ei suorita oppivelvollisuutta: Tutkintoon johtamattomassa koulutuksessa (ei kelpaa oppivelvollisuuden suorittamiseen)
	-- 10: Ei suorita oppivelvollisuutta: Ei opiskeluoikeutta (edellisen opiskeluoikeuden tila 'valmistunut' tai 'hyvaksytystisuoritettu')
	-- 11(10): Ei suorita oppivelvollisuutta: Ei opiskeluoikeutta (edellisen opiskeluoikeuden tila 'eronnut' tai 'katsotaaneronneeksi') 
	-- 12(10): Ei suorita oppivelvollisuutta: Ei opiskeluoikeutta (ei aiempaa opiskeluoikeutta)

	-- VV 08/2022: Lisätty ehto. Jos henkilö on keskeyttänyt väliaikaisesti koulutuksen joka ei kelpaa oppivelvollisuuden suorittamiseen --> oppivelvollisen_toiminta = 11(10)

	TRUNCATE TABLE Koski_SA.sa.temp_oppivelvollisten_toiminta

	INSERT INTO Koski_SA.sa.temp_oppivelvollisten_toiminta
	
	SELECT * FROM (
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
					WHEN lps.tavoitetutkinto = 'Ei tutkintotavoitetta' THEN '-1'
					ELSE ps.koulutusmoduuli_koodiarvo
				END AS koulutusmoduuli_koodiarvo,
				ps.suorituksen_tyyppi,
				oo.koulutusmuoto,
				ov.[oppija_oid],
				po.perusopetuksen_oppimaara_suoritettu_pvm,
				CASE 
					WHEN po.perusopetuksen_oppimaara_suoritettu_pvm is null or @alkuPvm < po.perusopetuksen_oppimaara_suoritettu_pvm THEN 0
					ELSE 1
				END as suorittanut_perusopetuksen_oppimaaran,
				CASE 
					WHEN @alkuPvm >= ov.tutkinto_suoritettu and ov.tutkinto_suoritettu <= DATEADD(year, 18, ov.syntymaaika) THEN 1
					WHEN @alkuPvm >= DATEADD(year, 18, ov.syntymaaika) THEN 2
					WHEN aps.suorituksen_tyyppi = 'ammatillinentutkinto' and ooa.tila in ('lasna', 'loma','valmistunut') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
					WHEN lps.tavoitetutkinto is not null and lps.tavoitetutkinto != 'Ei tutkintotavoitetta' and ooa.tila in ('lasna', 'loma','valmistunut') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 3
					WHEN ((ps.suorituksen_tyyppi in ('perusopetuksenoppimaara','aikuistenperusopetuksenoppimaara','aikuistenperusopetuksenoppimaaranalkuvaihe')) or 
						 (ps.suorituksen_tyyppi in('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ps.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9'))) and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 5
					WHEN (ps.suorituksen_tyyppi in ('esiopetuksensuoritus') or (ps.suorituksen_tyyppi = 'internationalschoolpypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = 'explorer')) and ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 6
					WHEN ooa.tila in ('lasna', 'loma') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 7
					WHEN ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 8
					WHEN kesk.peruttu = 0 THEN 8
					WHEN ooa.tila in ('lasna', 'loma') THEN 9
					WHEN ooa.tila in ('valmistunut','hyvaksytystisuoritettu') THEN 10
					WHEN ooa.tila in ('katsotaaneronneeksi', 'eronnut') or (ooa.tila = ('valiaikaisestikeskeytynyt') and oo.oppivelvollisuuden_suorittamiseen_kelpaava = 0) THEN 11
					WHEN ooa.opiskeluoikeus_oid is null THEN 12
				END AS oppivelvollisen_toiminta,
				CASE
					WHEN kesk.peruttu = 0 and ooa.opiskeluoikeus_oid is null THEN 1
					ELSE 0
				END as keskeyttanyt
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
			LEFT JOIN (
				SELECT
					oo.oppija_oid,
					min(ps.vahvistus_paiva) as perusopetuksen_oppimaara_suoritettu_pvm
				FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
				LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
				WHERE ((ps.suorituksen_tyyppi in('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara')) OR
					  ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9')
				GROUP BY oo.oppija_oid
			) po on po.oppija_oid = ov.oppija_oid
			LEFT JOIN [Koski_SA].[sa].[sa_valpas_oppivelvollisuudesta_vapautetut] vov on vov.oppija_oid = ov.oppija_oid
			WHERE CAST(CONCAT(YEAR(@alkuPvm),'-01-01') as date) < DATEADD(year, 18, ov.syntymaaika) AND
				  YEAR(@alkuPvm) >= YEAR(DATEADD(year, 16, ov.syntymaaika)) AND
				  (ov.tutkinto_suoritettu is null or YEAR(@alkuPvm) <= YEAR(ov.tutkinto_suoritettu)) AND
				  (vov.vapautettu > CAST(CONCAT(YEAR(@alkuPvm),'-01-01') as date) OR 
				  (vov.vapautettu <= CAST(CONCAT(YEAR(@alkuPvm),'-01-01') as date) AND vov.mitatoity <= CAST(CONCAT(YEAR(@alkuPvm),'-01-01') as date)) OR 
				  vov.oppija_oid is null)
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
		--coalesce(d11b.id,-1) as d_organisaatioluokitus_perusopetuksen_oppilaitos_all_time_id,
	
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
		coalesce(f.suorituksen_tyyppi, '-1') as suorituksen_tyyppi
	FROM (
		-- Oppivelvolliset, joilla on vähintään yksi opiskeluoikeus tarkasteluajanhetkellä
		SELECT 
			tilastovuosi = YEAR(@alkuPvm),
			tilastokuukausi = MONTH(@alkuPvm),
			ov.[oppija_oid],
			ovt.opiskeluoikeus_oid,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta = 3 and ovt.koulutusmuoto <> 'ammatillinenkoulutus' THEN 4
				WHEN ovt.oppivelvollisen_toiminta > 10 THEN 10
				ELSE ovt.oppivelvollisen_toiminta
			END as oppivelvollisen_toiminta,
			coalesce(oo.oppivelvollisuuden_suorittamiseen_kelpaava,0) as oppivelvollisuuden_suorittamiseen_kelpaava,
			oo.oppilaitos_oid,
			oo.koulutustoimija_oid,
			CASE
				WHEN ovt.oppivelvollisen_toiminta in (10,11,12) THEN NULL
				ELSE ovt.koulutusmoduuli_koodiarvo
			END as koulutusmoduuli_koodiarvo,
			ika = YEAR(@alkuPvm) - YEAR(ov.syntymaaika),
			syntymavuosi = YEAR(ov.syntymaaika),
			ov.sukupuoli,
			ov.kansalaisuus,
			ov.aidinkieli,
			ov.kotikunta,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (10,11,12) THEN '-1'
				ELSE ovt.koulutusmuoto
			END as koulutusmuoto,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (10,11,12) THEN '-1'
				ELSE ovt.suorituksen_tyyppi
			END as suorituksen_tyyppi,
			ovt.suorittanut_perusopetuksen_oppimaaran,
			ovt.perusopetuksen_oppimaara_suoritettu_pvm,
			CASE 
				WHEN ov.perusopetus_suoritettu <= @alkuPvm THEN ov.perusopetuksen_oppilaitos_oid
				ELSE NULL
			END as perusopetuksen_oppilaitos_oid
			--[perusopetuksen_oppilaitos_oid_all_time] = ov.perusopetuksen_oppilaitos_oid
		FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
		INNER JOIN [Koski_SA].[sa].[temp_oppivelvollisten_toiminta] ovt on ovt.oppija_oid = ov.oppija_oid
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on ovt.opiskeluoikeus_oid = oo.opiskeluoikeus_oid AND ovt.oppivelvollisen_toiminta not in (10,11,12)
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
			END as perusopetuksen_oppilaitos_oid
			--[perusopetuksen_oppilaitos_oid_all_time] = ov.perusopetuksen_oppilaitos_oid
		FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
		INNER JOIN [Koski_SA].[sa].[temp_oppivelvollisten_toiminta] ovt on ovt.oppija_oid = ov.oppija_oid
		LEFT JOIN [Koski_SA].[sa].[temp_oppivelvollisuus_suoritettu] os on os.oppija_oid = ov.oppija_oid AND LEFT(os.oppivelvollisen_toiminta,1) != 9
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid
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
	--LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d11b on d11b.organisaatio_oid = f.perusopetuksen_oppilaitos_oid_all_time
	LEFT JOIN [ANTERO].[dw].[d_kalenteri] d12 on d12.kalenteri_avain = f.perusopetuksen_oppimaara_suoritettu_pvm
		
	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)

END

GO

USE [ANTERO]