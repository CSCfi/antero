USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_oppivelvolliset]    Script Date: 30.7.2025 7.28.44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_oppivelvolliset] AS

/*
- Oppivelvollisen määritelmä:
- 1. Henkilö ei ole suorittanut perusopetuksen päättötodistusta ennen 1.1.2021
- 2. Henkilö ei ole syntynyt ennen vuotta 2004
- Seuraavat rajaukset tarkasteluajankohdan mukaan
- 3. Henkilön kotikunta on Suomessa, mutta ei ole Ahvenanmaa (vaikuttaa toimintaan)
- 4. Henkilö ei ole 18-vuotias
- 5. Henkilö ei ole suorittanut toisen asteen tutkintoa 
*/

--Lisätty pari muuttujaa ja lisäpoiminta hv-raportin erityistarpeisiin. Samalla karsittu päätason suorituksia prioriteetin perusteella. JS 31.1.2023

DECLARE @alkuVuosi as int
DECLARE @loppuPvm as date
DECLARE @maxPvm as date

SET @alkuVuosi = 2021
SET @loppuPvm = DATEADD(day,1,EOMONTH(DATEADD(month,-1,GETDATE()))) -- Kuluvan kuukauden ensimmäinen päivä
SET @maxPvm = GREATEST(DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), -1),DATEADD(day,1,EOMONTH(DATEADD(month,-1,GETDATE()))))

-- Tehdään-temp tauluun esirajaukset määritelmän kohtien 1-2 mukaan

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset]

SELECT DISTINCT * INTO [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] FROM (

	SELECT
		h.master_oid
		,[syntymaaika]
		,[aidinkieli]
		,[kansalaisuus] = LEFT([kansalaisuus], 3)
		,[sukupuoli]
		,ov.pidennetty_oppivelvollisuus
		,MAX(DATEADD(day,1,ov.loppuPvm)) OVER (partition by h.master_oid) as oppivelvollisuus_paattynyt
		,ts.vahvistus_paiva as tutkinto_suoritettu
		,po.oppilaitos_oid as perusopetuksen_oppilaitos_oid
		,po.vahvistus_paiva as perusopetus_suoritettu
		,CASE
			WHEN pk.opiskelee_toiminta_alueittain = 1 THEN 1
			WHEN pk.oppiaineita_yksilollistetty_lkm >= 10 THEN 2
			WHEN pk.oppiaineita_yksilollistetty_lkm >= 5 THEN 3
			WHEN pk.oppiaineita_yksilollistetty_lkm >= 1 THEN 4
			WHEN pk.oppiaineita_yksilollistetty_lkm = 0 and pk.keskiarvo is not null THEN 5
			WHEN pk.master_oid is not null THEN 6
			ELSE -1
		END as perusopetuksen_oppimaaran_yksilollistaminen_hv
		,pk.vahvistus_paiva as perusopetuksen_oppimaaran_yksilollistaminen_vahvistus_paiva
	FROM Koski_SA.sa.sa_oppivelvolliset ov 
	LEFT JOIN [Koski_SA].[sa].[sa_koski_henkilo_master] h on ov.master_oid = h.master_oid
	-- Toisen asteen tutkinnon suorittaneet
	LEFT JOIN Koski_SA.sa.toisen_asteen_tutkinnot ts on ts.master_oid = h.master_oid and ts.rnk = 1
	-- Hakeutumisvelvollisille tieto perusopetuksen oppimaaran yksilollistamisesta
	LEFT JOIN Koski_SA.sa.perusopetuksen_paattotodistuksen_keskiarvot pk on pk.master_oid = h.master_oid and pk.rnk = 1
	-- Perusopetuksen suorittaneet
	LEFT JOIN (
		SELECT DISTINCT 
			oo.master_oid, 
			oo.oppilaitos_oid, 
			oo.opiskeluoikeus_oid,
			vahvistus_paiva_min = MIN(ps.vahvistus_paiva) OVER(
					PARTITION BY oo.master_oid),
			ps.vahvistus_paiva
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		WHERE ps.vahvistus_paiva is not null and ((ps.suorituksen_tyyppi in('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara')) OR
		(ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') OR
		(ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S4'))) po on po.master_oid = h.master_oid AND po.vahvistus_paiva = po.vahvistus_paiva_min		
) f
WHERE YEAR(@maxPvm) - YEAR(f.syntymaaika) >= 16 

-- Temp tauluun opiskelutiedot alku- ja loppupäivän väliltä

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvolliset_opiskelu]

SELECT DISTINCT
	ooa.opiskeluoikeus_oid,
	CASE 
		WHEN aps.opiskeluoikeus_oid is not null THEN aps.tutkinto_koodi
		WHEN lps.tavoitetutkinto = 'Deutsche Internationale Abitur; Reifeprüfung' THEN '301103'
		WHEN lps.tavoitetutkinto = 'IB-tutkinto (International Baccalaureate)' THEN '301102'
		WHEN lps.tavoitetutkinto = 'Ylioppilastutkinto' THEN '301101'
		WHEN lps.tavoitetutkinto = 'EB-tutkinto (European Baccalaureate)' THEN '301104'
		WHEN lps.tavoitetutkinto = 'Ei tutkintotavoitetta' THEN '-1'
		ELSE ps.koulutusmoduuli_koodiarvo
	END AS tutkinto_koodi,
	ps.suorituksen_tyyppi,
	oo.koulutusmuoto,
	ov.[master_oid],
	ov.perusopetus_suoritettu as perusopetuksen_oppimaara_suoritettu_pvm,

	ov.tutkinto_suoritettu,
	ov.syntymaaika,
	ov.oppivelvollisuus_paattynyt,
	oo.oppivelvollisuuden_suorittamiseen_kelpaava,

	aps.suorituksen_tyyppi as suorituksen_tyyppi_amm,
	lps.tavoitetutkinto as tavoitetutkinto_lukio,
	ps.koulutusmoduuli_koodiarvo,
	ooa.tila as ooa_tila, 
	ooa.alku as ooa_alku,
	ooa.loppu as ooa_loppu,

	CASE				
		WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') THEN 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
		WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') THEN 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
		WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
		WHEN ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 THEN 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
		WHEN ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 THEN 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
		WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
		WHEN ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 THEN 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
		WHEN ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 THEN 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
		WHEN ooa.erityinen_tuki = 0 THEN 1 --Ei erityisopiskelija
		ELSE -1
	END as erityisopetus
INTO [Koski_SA].[sa].[temp_oppivelvolliset_opiskelu]
FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.master_oid = ov.master_oid
LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on 
			ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa.alku <= @maxPvm and ooa.loppu >= CONCAT(@alkuVuosi, '-01-01')
LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] aps on aps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] lps on lps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.perusopetuksen_paattotodistuksen_keskiarvot pk on pk.master_oid = ov.master_oid and pk.rnk = 1
-- Vain alku- ja loppupäivän välisenä aikana oppivelvolliset 
INNER JOIN Koski_SA.sa.sa_oppivelvolliset ovv on ovv.master_oid = ov.master_oid and YEAR(ovv.alkuPvm) <= YEAR(@loppuPvm) AND YEAR(ovv.loppuPvm) >= @alkuVuosi
WHERE oo.sisaltyy_opiskeluoikeuteen_oid is null

-- Temp tauluun kotikuntahistoria alku- ja loppupäivän väliltä

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvolliset_kotikunta]

SELECT DISTINCT
	ov.master_oid, kh.muutto_pvm, kh.poismuutto_pvm, kh.kotikunta, d.mannersuomessa
INTO [Koski_SA].[sa].[temp_oppivelvolliset_kotikunta]
FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
LEFT JOIN [Koski_SA].[sa].[sa_koski_kotikuntahistoria] kh on kh.master_oid = ov.master_oid
LEFT JOIN ANTERO.dw.d_alueluokitus d on d.kunta_koodi = kh.kotikunta
WHERE @alkuVuosi <= YEAR(kh.poismuutto_pvm) and @maxPvm  >= kh.muutto_pvm

-- Temp-tauluun tiedot oppivelvollisuuden suoritushetkestä

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvollisuus_suoritettu]

SELECT * INTO [Koski_SA].[sa].[temp_oppivelvollisuus_suoritettu] FROM (

	SELECT  
		f.master_oid,
		f.opiskeluoikeus_oid,
		f.koulutusmoduuli_koodiarvo,
		f.koulutusmuoto,
		f.suorituksen_tyyppi,
		f.erityisopetus,
		f.kotikunta,
		f.oppivelvollisen_toiminta,
		f.oppivelvollisen_toiminta_min
	FROM (
		SELECT 
		f.master_oid,
		f.opiskeluoikeus_oid,
		f.koulutusmoduuli_koodiarvo,
		f.koulutusmuoto,
		f.suorituksen_tyyppi,
		f.erityisopetus,
		f.kotikunta,
		CONCAT(f.oppivelvollisen_toiminta,'_', f.opiskeluoikeus_oid) as oppivelvollisen_toiminta,
		oppivelvollisen_toiminta_min = 
					MIN(CONCAT(f.oppivelvollisen_toiminta,'_',f.opiskeluoikeus_oid)) OVER (
						PARTITION BY f.master_oid)

	FROM (
		SELECT DISTINCT
			ov.master_oid,
			oo.koulutusmuoto,
			ps.suorituksen_tyyppi,
			ooa.opiskeluoikeus_oid,
			kh.kotikunta,
			CASE
				WHEN aps.opiskeluoikeus_oid is not null THEN aps.tutkinto_koodi
				WHEN lps.tavoitetutkinto = 'Deutsche Internationale Abitur; Reifeprüfung' THEN '301103'
				WHEN lps.tavoitetutkinto = 'IB-tutkinto (International Baccalaureate)' THEN '301102'
				WHEN lps.tavoitetutkinto = 'Ylioppilastutkinto' THEN '301101'
				WHEN lps.tavoitetutkinto = 'EB-tutkinto (European Baccalaureate)' THEN '301104'
				WHEN lps.tavoitetutkinto = 'Ei tutkintotavoitetta' THEN '-1'
				ELSE ps.koulutusmoduuli_koodiarvo
			END as koulutusmoduuli_koodiarvo,
			ov.oppivelvollisuus_paattynyt,
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
			CASE				
				WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') THEN 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
				WHEN (ooa.erityinen_tuki = 1 or ooa.hojks = 1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') THEN 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
				WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
				WHEN ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 THEN 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
				WHEN ps.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 THEN 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
				WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 0 and ooa.vammainen_ja_avustaja = 0 THEN 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
				WHEN ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vaikeasti_vammainen = 1 THEN 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
				WHEN ps.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa.vammainen_ja_avustaja = 1 THEN 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
				WHEN ooa.erityinen_tuki = 0 THEN 1 --Ei erityisopiskelija
				ELSE -1
			END as erityisopetus 
		FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.master_oid = ov.master_oid
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_ytr] ooy on oo.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid and ooy.alku = ov.oppivelvollisuus_paattynyt
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid AND ov.oppivelvollisuus_paattynyt BETWEEN ooa.alku AND ooa.loppu
		LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] lps on lps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
		LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] aps on aps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid 
		LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on (ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid or ps.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid)
		LEFT JOIN [Koski_SA].[sa].[temp_oppivelvolliset_kotikunta] kh on kh.master_oid = ov.master_oid and ov.oppivelvollisuus_paattynyt BETWEEN kh.muutto_pvm and kh.poismuutto_pvm
		WHERE ov.oppivelvollisuus_paattynyt <= GETDATE() and oo.sisaltyy_opiskeluoikeuteen_oid is null) f ) f
	WHERE f.oppivelvollisen_toiminta = f.oppivelvollisen_toiminta_min
) f
WHERE LEFT(f.oppivelvollisen_toiminta,1) != '9'


TRUNCATE TABLE ANTERO.dw.f_koski_oppivelvolliset

WHILE @alkuVuosi <= YEAR(@loppuPvm)
	
BEGIN
	
	-- Temp-taulu johon haetaan tieto tarkasteluvuoden aikana oppivelvollisten toiminnasta tarkasteluajanhetkellä
	-- 1: Oppivelvollisuus suoritettu: Suorittanut toiseen asteen tutkinnon
	-- 2: Oppivelvollisuus suoritettu: Täyttänyt 18-vuotta
	-- 3: Kotikunta ei ole Manner-Suomessa
	-- 4: Suorittaa oppivelvollisuutta: Tutkintoon johtavassa ammatillisessa koulutuksessa (päätellään koulutusmuodosta)
	-- 4(5): Suorittaa oppivelvollisuutta: Tutkintoon johtavassa lukiokoulutuksessa (päätellään koulutusmuodosta)
	-- 6: Suorittaa oppivelvollisuutta: Suorittaa perusopetuksen oppimäärää
	-- 7: Suorittaa oppivelvollisuutta: Esiopetuksessa
	-- 8: Suorittaa oppivelvollisuutta: Tutkintoon johtamattomassa koulutuksessa
	-- 9: Ei suorita oppivelvollisuutta: Vapautettu oppivelvollisuudesta
	-- 10: Ei suorita oppivelvollisuutta: Keskeyttänyt oppivelvollisuuden suorittamisen väliaikaisesti
	-- 11: Ei suorita oppivelvollisuutta: Tutkintoon johtamattomassa koulutuksessa (ei kelpaa oppivelvollisuuden suorittamiseen)
	-- 12: Ei suorita oppivelvollisuutta: Ei opiskeluoikeutta (edellisen opiskeluoikeuden tila 'valmistunut' tai 'hyvaksytystisuoritettu')
	-- 13(12): Ei suorita oppivelvollisuutta: Ei opiskeluoikeutta (edellisen opiskeluoikeuden tila 'eronnut' tai 'katsotaaneronneeksi') 
	-- 14(12): Ei suorita oppivelvollisuutta: Ei opiskeluoikeutta (ei aiempaa opiskeluoikeutta)

	-- VV 08/2022: Lisätty ehto. Jos henkilö on keskeyttänyt väliaikaisesti koulutuksen joka ei kelpaa oppivelvollisuuden suorittamiseen --> oppivelvollisen_toiminta = 11(10)

	DROP TABLE IF EXISTS Koski_SA.sa.temp_oppivelvollisten_toiminta

	SELECT * INTO Koski_SA.sa.temp_oppivelvollisten_toiminta FROM (
		SELECT DISTINCT 
			f.master_oid,
			f.opiskeluoikeus_oid,
			f.tilastovuosi,
			f.tilastokuukausi,
			f.tilastopaiva,
			case when f.keskeyttanyt = 1 then null else f.koulutusmoduuli_koodiarvo end as koulutusmoduuli_koodiarvo,
			case when f.keskeyttanyt = 1 then null else f.koulutusmuoto end as koulutusmuoto,
			case when f.keskeyttanyt = 1 then null else f.suorituksen_tyyppi end as suorituksen_tyyppi,
			f.suorittanut_perusopetuksen_oppimaaran,
			f.perusopetuksen_oppimaara_suoritettu_pvm,
			f.erityisopetus,
			f.perusopetuksen_oppimaaran_yksilollistaminen,
			f.perusopetuksen_oppimaaran_yksilollistaminen_hv,
			f.kotikunta,
			oppivelvollisen_toiminta,
			oppivelvollisen_toiminta_min = 
				MIN(f.oppivelvollisen_toiminta) OVER (
					PARTITION BY f.master_oid, f.tilastopaiva)

		FROM (
			SELECT DISTINCT
				tilastovuosi = @alkuVuosi,
				tilastokuukausi = d.kuukausi,
				tilastopaiva = d.paivays,
				ovo.opiskeluoikeus_oid,
				ovo.tutkinto_koodi AS koulutusmoduuli_koodiarvo,
				ovo.suorituksen_tyyppi,
				ovo.koulutusmuoto,
				ov.[master_oid],
				ov.perusopetus_suoritettu as perusopetuksen_oppimaara_suoritettu_pvm,
				CASE 
					WHEN ov.perusopetus_suoritettu is null or d.paivays < ov.perusopetus_suoritettu THEN 0
					ELSE 1
				END as suorittanut_perusopetuksen_oppimaaran,
				CASE
					WHEN d.paivays >= ov.tutkinto_suoritettu and ov.tutkinto_suoritettu <= DATEADD(year, 18, ov.syntymaaika) and ov.oppivelvollisuus_paattynyt >= ov.tutkinto_suoritettu THEN 1
					WHEN d.paivays >= DATEADD(year, 18, ov.syntymaaika) and ov.oppivelvollisuus_paattynyt >= DATEADD(year, 18, ov.syntymaaika) THEN 2
					WHEN ov.oppivelvollisuus_paattynyt >= vov.vapautettu THEN 9
					WHEN d.paivays >= ov.oppivelvollisuus_paattynyt THEN 3 
					WHEN kh.mannersuomessa = 0 THEN 3.5
					WHEN ovo.suorituksen_tyyppi_amm = 'ammatillinentutkinto' and ovo.ooa_tila in ('lasna', 'loma','valmistunut') and ovo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 4
					WHEN ovo.tavoitetutkinto_lukio is not null and ovo.tavoitetutkinto_lukio != 'Ei tutkintotavoitetta' and ovo.ooa_tila in ('lasna', 'loma','valmistunut') and ovo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 5
					WHEN ((ovo.suorituksen_tyyppi in ('perusopetuksenoppimaara','aikuistenperusopetuksenoppimaara','aikuistenperusopetuksenoppimaaranalkuvaihe')) or 
						 (ovo.suorituksen_tyyppi in('internationalschoolpypvuosiluokka', 'internationalschoolmypvuosiluokka') and ovo.koulutusmoduuli_koodiarvo in ('1','2','3','4','5','6','7','8','9')) or
						 (ovo.suorituksen_tyyppi in ('europeanschoolofhelsinkivuosiluokkaprimary', 'europeanschoolofhelsinkivuosiluokkasecondarylower') and ovo.koulutusmoduuli_koodiarvo in ('P1','P2','P3','P4','P5','S1','S2','S3','S4'))) and 
						 ovo.ooa_tila in ('lasna', 'loma') and ovo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 6
					WHEN (ovo.suorituksen_tyyppi in ('esiopetuksensuoritus') or (ovo.suorituksen_tyyppi = 'internationalschoolpypvuosiluokka' and ovo.koulutusmoduuli_koodiarvo = 'explorer') or (ovo.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkanursery')) and ovo.ooa_tila in ('lasna', 'loma') and ovo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 7
					WHEN ovo.ooa_tila in ('lasna', 'loma') and ovo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 8
					WHEN ovo.ooa_tila = ('valiaikaisestikeskeytynyt') and ovo.oppivelvollisuuden_suorittamiseen_kelpaava = 1 THEN 10
					WHEN kesk.peruttu = 0 THEN 11
					WHEN ovo.ooa_tila in ('lasna', 'loma') THEN 12
					WHEN ovo.ooa_tila in ('valmistunut','hyvaksytystisuoritettu') THEN 13
					WHEN ovo.ooa_tila in ('katsotaaneronneeksi', 'eronnut') or (ovo.ooa_tila = ('valiaikaisestikeskeytynyt') and ovo.oppivelvollisuuden_suorittamiseen_kelpaava = 0) THEN 14
					WHEN ovo.ooa_alku is null THEN 15
					ELSE 15
				END AS oppivelvollisen_toiminta,
				CASE
					WHEN kesk.peruttu = 0 and ovo.opiskeluoikeus_oid is null THEN 1
					ELSE 0
				END as keskeyttanyt,
				ovo.erityisopetus,
				CASE
					WHEN d.paivays >= ov.perusopetuksen_oppimaaran_yksilollistaminen_vahvistus_paiva THEN ov.perusopetuksen_oppimaaran_yksilollistaminen_hv
					WHEN d.paivays < ov.perusopetuksen_oppimaaran_yksilollistaminen_vahvistus_paiva THEN -1
					ELSE 6
				END as perusopetuksen_oppimaaran_yksilollistaminen,
				ov.perusopetuksen_oppimaaran_yksilollistaminen_hv,
				kh.kotikunta
			FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
			LEFT JOIN [ANTERO].[dw].[d_kalenteri] d on d.vuosi = @alkuVuosi and ((d.paiva = 1 and d.paivays < GETDATE()) or (d.paivays = DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), -1) and d.kuukausi >= 8))
			LEFT JOIN [Koski_SA].[sa].[temp_oppivelvolliset_opiskelu] ovo on ov.master_oid = ovo.master_oid and d.paivays BETWEEN ovo.ooa_alku and ovo.ooa_loppu
			LEFT JOIN [Koski_SA].[sa].[temp_oppivelvolliset_kotikunta] kh on kh.master_oid = ov.master_oid and d.paivays BETWEEN kh.muutto_pvm and kh.poismuutto_pvm
			LEFT JOIN [Koski_SA].[sa].[sa_valpas_oppivelvollisuuden_keskeytys] kesk on kesk.master_oid = ov.master_oid and kesk.peruttu = 0 and d.paivays BETWEEN kesk.alku and coalesce(kesk.loppu,'9999-01-01')
			LEFT JOIN [Koski_SA].[sa].[sa_valpas_oppivelvollisuudesta_vapautetut] vov on vov.master_oid = ov.master_oid and vov.vapautettu <= d.paivays
			INNER JOIN Koski_SA.sa.sa_oppivelvolliset ovp on ovp.master_oid = ov.master_oid and @alkuVuosi BETWEEN YEAR(ovp.alkuPvm) AND YEAR(ovp.loppuPvm) 
			WHERE CAST(CONCAT(@alkuVuosi,'-01-01') as date) < DATEADD(year, 18, ov.syntymaaika) 
			AND @alkuVuosi >= YEAR(DATEADD(year, 16, ov.syntymaaika)) 
			AND (ov.tutkinto_suoritettu is null or @alkuVuosi <= YEAR(ov.tutkinto_suoritettu)) 
			AND NOT EXISTS (
				SELECT * FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
				WHERE ovo.koulutusmuoto != 'tuva'
				AND tuvat.master_oid = ov.master_oid
				AND d.paivays between tuvat.alku and tuvat.loppu
			)	 
		) f 

	) f WHERE oppivelvollisen_toiminta = oppivelvollisen_toiminta_min;


	-- Faktataulun lataus

	INSERT INTO ANTERO.dw.f_koski_oppivelvolliset

	SELECT 
		f.tilastovuosi,
		f.tilastokuukausi,
		f.tilastopaiva as ajankohta,

		f.master_oid,
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
		coalesce(d13.id, -1) as d_erityisopetus_id,
		coalesce(d14.id, -1) as d_pidennetty_oppivelvollisuus_id,
		coalesce(d15.id, -1) as d_perusopetuksen_oppimaaran_yksilollistaminen_id,

		--hv
		coalesce(d16.id, -1) as d_perusopetuksen_oppimaaran_yksilollistaminen_hv_id,
		coalesce(d17.id, -1) as d_erityisopetus_hv_id,
		ov_kuutioon = case when f.tilastopaiva > DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0) then 0 else 1 end,
		koulutusmuoto_hv = coalesce(f.koulutusmuoto_hv, '-1'),
		koulutusmoduuli_koodiarvo_hv = case when len(koulutusmoduuli_koodiarvo_hv) = 6 then koulutusmoduuli_koodiarvo_hv else '-1' end,
		suorituksen_tyyppi_hv = coalesce(f.suorituksen_tyyppi_hv, '-1'),
		oppivelvollisuuden_suorittamiseen_kelpaava_hv,
		ika_18_tarkasteluhetkella_hv,
		perusopetuksen_oppilaitos_oid_hv,
		kotikunta_hv,
		loadtime = GETDATE(),
		username = suser_sname(),
		source = 'ETL: p_lataa_f_koski_oppivelvolliset'

	FROM (
		-- Oppivelvolliset, joilla on vähintään yksi opiskeluoikeus tarkasteluajanhetkellä
		SELECT DISTINCT
			tilastovuosi,
			tilastokuukausi,
			tilastopaiva,
			ov.[master_oid],
			ovt.opiskeluoikeus_oid,
			cast(CASE
				WHEN ovt.oppivelvollisen_toiminta = 3.5 THEN 3
				WHEN ovt.oppivelvollisen_toiminta = 4 and ovt.koulutusmuoto <> 'ammatillinenkoulutus' THEN 5
				WHEN ovt.oppivelvollisen_toiminta > 12 THEN 12
				ELSE ovt.oppivelvollisen_toiminta
			END as int) as oppivelvollisen_toiminta,
			coalesce(oo.oppivelvollisuuden_suorittamiseen_kelpaava,0) as oppivelvollisuuden_suorittamiseen_kelpaava,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (13,14,15) THEN NULL
				ELSE oo.oppilaitos_oid
			END as oppilaitos_oid,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (13,14,15) THEN NULL
				ELSE oo.koulutustoimija_oid
			END as koulutustoimija_oid,
			CASE
				WHEN ovt.oppivelvollisen_toiminta in (13,14,15) THEN NULL
				ELSE ovt.koulutusmoduuli_koodiarvo
			END as koulutusmoduuli_koodiarvo,
			ika = tilastovuosi - YEAR(ov.syntymaaika),
			syntymavuosi = YEAR(ov.syntymaaika),
			ov.sukupuoli,
			ov.kansalaisuus,
			ov.aidinkieli,
			ovt.kotikunta,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (13,14,15) THEN '-1'
				ELSE ovt.koulutusmuoto
			END as koulutusmuoto,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (13,14,15) THEN '-1'
				ELSE ovt.suorituksen_tyyppi
			END as suorituksen_tyyppi,
			ovt.suorittanut_perusopetuksen_oppimaaran,
			ovt.perusopetuksen_oppimaara_suoritettu_pvm,
			CASE 
				WHEN ov.perusopetus_suoritettu <= tilastopaiva THEN ov.perusopetuksen_oppilaitos_oid
				ELSE NULL
			END as perusopetuksen_oppilaitos_oid,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (13,14,15) THEN 1
				ELSE ovt.erityisopetus
			END as erityisopetus,
			ov.pidennetty_oppivelvollisuus,
			ovt.perusopetuksen_oppimaaran_yksilollistaminen,
			--hv
			ovt.perusopetuksen_oppimaaran_yksilollistaminen_hv,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta in (13,14,15) THEN 1
				ELSE ovt.erityisopetus
			END as erityisopetus_hv,
			koulutusmuoto_hv = case when ovt.oppivelvollisen_toiminta between 1 and 12 and ovt.oppivelvollisen_toiminta <> 9 then ovt.koulutusmuoto end,
			koulutusmoduuli_koodiarvo_hv = case when ovt.oppivelvollisen_toiminta between 1 and 12 and ovt.oppivelvollisen_toiminta <> 9 then ovt.koulutusmoduuli_koodiarvo end,
			suorituksen_tyyppi_hv = case when ovt.oppivelvollisen_toiminta between 1 and 12 and ovt.oppivelvollisen_toiminta <> 9 then ovt.suorituksen_tyyppi end,
			oppivelvollisuuden_suorittamiseen_kelpaava_hv = coalesce(oo.oppivelvollisuuden_suorittamiseen_kelpaava, 0),
			ika_18_tarkasteluhetkella_hv = case when dateadd(year, 18, ov.syntymaaika) <= tilastopaiva then 1 else 0 end,
			perusopetuksen_oppilaitos_oid_hv = ov.perusopetuksen_oppilaitos_oid,
			kotikunta_hv = ovt.kotikunta,
			--karsitaan opiskeluoikeuksittain mahdolliset (alemmat) vuosiluokkasuoritukset, aikuisten oppimäärää suorittavien alkuvaiheen suoritus sekä ammatillista tutkintoa suorittavien osittainen suoritus. JS 31.1.2023
			ranki = rank() over (partition by ov.master_oid, ovt.opiskeluoikeus_oid order by ovt.suorituksen_tyyppi, ovt.koulutusmoduuli_koodiarvo desc)
		FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
		INNER JOIN [Koski_SA].[sa].[temp_oppivelvollisten_toiminta] ovt on ovt.master_oid = ov.master_oid
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on ovt.opiskeluoikeus_oid = oo.opiskeluoikeus_oid AND ovt.oppivelvollisen_toiminta not in (9,12,13,14)
		WHERE CAST(CONCAT(@alkuVuosi,'-01-01') as date) < DATEADD(year, 18, ov.syntymaaika) AND
			  @alkuVuosi >= YEAR(DATEADD(year, 16, ov.syntymaaika)) AND
			  (ov.tutkinto_suoritettu is null or @alkuVuosi <= YEAR(ov.tutkinto_suoritettu)) AND
			  ovt.oppivelvollisen_toiminta not in (1,2,3,9)
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
	LEFT JOIN [ANTERO].[dw].[d_erityisopetus] d13 on d13.erityisopetus_koodi = f.erityisopetus
	LEFT JOIN [ANTERO].[dw].[d_pidennetty_oppivelvollisuus] d14 on d14.koodi = f.pidennetty_oppivelvollisuus
	LEFT JOIN [ANTERO].[dw].[d_perusopetuksen_oppimaaran_yksilollistaminen] d15 on d15.koodi = f.perusopetuksen_oppimaaran_yksilollistaminen and d15.luokittelu = 2
	LEFT JOIN [ANTERO].[dw].[d_perusopetuksen_oppimaaran_yksilollistaminen] d16 on d16.koodi = f.perusopetuksen_oppimaaran_yksilollistaminen_hv and d16.luokittelu = 2
	LEFT JOIN [ANTERO].[dw].[d_erityisopetus] d17 on d17.erityisopetus_koodi = f.erityisopetus_hv
	WHERE ranki=1

	INSERT INTO ANTERO.dw.f_koski_oppivelvolliset

	SELECT 
		f.tilastovuosi,
		f.tilastokuukausi,
		f.tilastopaiva as ajankohta,

		f.master_oid,
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
		coalesce(d13.id, -1) as d_erityisopetus_id,
		coalesce(d14.id, -1) as d_pidennetty_oppivelvollisuus_id,
		coalesce(d15.id, -1) as d_perusopetuksen_oppimaaran_yksilollistaminen_id,

		--hv
		coalesce(d16.id, -1) as d_perusopetuksen_oppimaaran_yksilollistaminen_hv_id,
		coalesce(d17.id, -1) as d_erityisopetus_hv_id,
		ov_kuutioon = case when f.tilastopaiva > DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0) then 0 else 1 end,
		koulutusmuoto_hv = coalesce(f.koulutusmuoto_hv, '-1'),
		koulutusmoduuli_koodiarvo_hv = case when len(koulutusmoduuli_koodiarvo_hv) = 6 then koulutusmoduuli_koodiarvo_hv else '-1' end,
		suorituksen_tyyppi_hv = coalesce(f.suorituksen_tyyppi_hv, '-1'),
		oppivelvollisuuden_suorittamiseen_kelpaava_hv,
		ika_18_tarkasteluhetkella_hv,
		perusopetuksen_oppilaitos_oid_hv,
		kotikunta_hv,
		loadtime = GETDATE(),
		username = suser_sname(),
		source = 'ETL: p_lataa_f_koski_oppivelvolliset'

	FROM (

		SELECT DISTINCT  
			tilastovuosi,
			tilastokuukausi,
			tilastopaiva,
			ov.[master_oid],
			os.opiskeluoikeus_oid,
			cast(ovt.oppivelvollisen_toiminta as int) as oppivelvollisen_toiminta,
			coalesce(oo.oppivelvollisuuden_suorittamiseen_kelpaava,0) as oppivelvollisuuden_suorittamiseen_kelpaava,
			oo.oppilaitos_oid,
			oo.koulutustoimija_oid,
			os.koulutusmoduuli_koodiarvo,
			ika = tilastovuosi - YEAR(ov.syntymaaika),
			syntymavuosi = YEAR(ov.syntymaaika),
			ov.sukupuoli,
			ov.kansalaisuus,
			ov.aidinkieli,
			CASE 
				WHEN tilastopaiva >= ov.oppivelvollisuus_paattynyt THEN os.kotikunta
				ELSE ovt.kotikunta 
			END as kotikunta,
			os.koulutusmuoto,
			os.suorituksen_tyyppi,
			ovt.suorittanut_perusopetuksen_oppimaaran,
			ovt.perusopetuksen_oppimaara_suoritettu_pvm,
			CASE 
				WHEN ov.perusopetus_suoritettu <= tilastopaiva THEN ov.perusopetuksen_oppilaitos_oid
				ELSE NULL
			END as perusopetuksen_oppilaitos_oid,
			os.erityisopetus,
			ov.pidennetty_oppivelvollisuus,
			ovt.perusopetuksen_oppimaaran_yksilollistaminen,
			--hv
			ovt.perusopetuksen_oppimaaran_yksilollistaminen_hv,
			CASE 
				WHEN ovt.oppivelvollisen_toiminta = 9 THEN 1
				ELSE ovt.erityisopetus
			END as erityisopetus_hv,
			koulutusmuoto_hv = case when ovt.oppivelvollisen_toiminta between 1 and 12 and ovt.oppivelvollisen_toiminta <> 9 then ovt.koulutusmuoto end,
			koulutusmoduuli_koodiarvo_hv = case when ovt.oppivelvollisen_toiminta between 1 and 12 and ovt.oppivelvollisen_toiminta <> 9 then ovt.koulutusmoduuli_koodiarvo end,
			suorituksen_tyyppi_hv = case when ovt.oppivelvollisen_toiminta between 1 and 12 and ovt.oppivelvollisen_toiminta <> 9 then ovt.suorituksen_tyyppi end,
			oppivelvollisuuden_suorittamiseen_kelpaava_hv = coalesce(oo2.oppivelvollisuuden_suorittamiseen_kelpaava, 0),
			ika_18_tarkasteluhetkella_hv = case when dateadd(year, 18, ov.syntymaaika) <= tilastopaiva then 1 else 0 end,
			perusopetuksen_oppilaitos_oid_hv = ov.perusopetuksen_oppilaitos_oid,
			kotikunta_hv = coalesce(ovt.kotikunta,-1),
			--karsitaan opiskeluoikeuksittain mahdolliset (alemmat) vuosiluokkasuoritukset, aikuisten oppimäärää suorittavien alkuvaiheen suoritus sekä ammatillista tutkintoa suorittavien osittainen suoritus. JS 31.1.2023
			ranki = rank() over (partition by ov.master_oid, ovt.opiskeluoikeus_oid order by ovt.suorituksen_tyyppi, ovt.koulutusmoduuli_koodiarvo desc)
		FROM [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset] ov
		INNER JOIN [Koski_SA].[sa].[temp_oppivelvollisten_toiminta] ovt on ovt.master_oid = ov.master_oid
		LEFT JOIN [Koski_SA].[sa].[temp_oppivelvollisuus_suoritettu] os on os.master_oid = ov.master_oid
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.opiskeluoikeus_oid = os.opiskeluoikeus_oid
		OUTER APPLY (
			select oppivelvollisuuden_suorittamiseen_kelpaava 
			from [Koski_SA].[sa].[sa_koski_opiskeluoikeus] 
			where opiskeluoikeus_oid = ovt.opiskeluoikeus_oid
		) oo2
		WHERE CAST(CONCAT(@alkuVuosi,'-01-01') as date) < DATEADD(year, 18, ov.syntymaaika) AND
			  @alkuVuosi >= YEAR(DATEADD(year, 16, ov.syntymaaika)) AND
			  (ov.tutkinto_suoritettu is null or @alkuVuosi <= YEAR(ov.tutkinto_suoritettu)) AND
			  ovt.oppivelvollisen_toiminta in (1,2,3,9)

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
	LEFT JOIN [ANTERO].[dw].[d_erityisopetus] d13 on d13.erityisopetus_koodi = f.erityisopetus
	LEFT JOIN [ANTERO].[dw].[d_pidennetty_oppivelvollisuus] d14 on d14.koodi = f.pidennetty_oppivelvollisuus
	LEFT JOIN [ANTERO].[dw].[d_perusopetuksen_oppimaaran_yksilollistaminen] d15 on d15.koodi = f.perusopetuksen_oppimaaran_yksilollistaminen and d15.luokittelu = 2
	LEFT JOIN [ANTERO].[dw].[d_perusopetuksen_oppimaaran_yksilollistaminen] d16 on d16.koodi = f.perusopetuksen_oppimaaran_yksilollistaminen_hv and d16.luokittelu = 2
	LEFT JOIN [ANTERO].[dw].[d_erityisopetus] d17 on d17.erityisopetus_koodi = f.erityisopetus_hv
	WHERE ranki=1

	
	SET @alkuVuosi = @alkuVuosi + 1
	
END

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvolliset_esirajaukset]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvollisten_toiminta]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvollisuus_suoritettu]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvolliset_opiskelu]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_oppivelvolliset_kotikunta]

GO


