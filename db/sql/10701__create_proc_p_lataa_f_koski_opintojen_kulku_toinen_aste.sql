USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_opintojen_kulku_toinen_aste]    Script Date: 21.3.2025 13.56.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_koski_opintojen_kulku_toinen_aste] AS

/* PROSEDUURIN OSIOT */
-------------------------------------------------------------------------------------------------
-- 1. Tietojen alustus
-- 2. Tarkastelujaksojen lukumäärän määritys
-- 3. Koulutuksen aloittaneiden ja heidän taustatietojensa lataus 
-- 4. Aloitettujen koulutusten priorisointi 
-- 5. Tarkastelujaksojen määritys aloittaneille
-- 6. Aloittaneiden koulutustietojen lataus aloituspäivän ja viimeisen tarkasteluhetken väliltä
-- 7. Priorisoimattomien tilannetietojen lataus
-- 8. Faktataulun lataus ja tilanteiden priorisointi
-------------------------------------------------------------------------------------------------

-------------------------
/* 1. TIETOJEN ALUSTUS */
-------------------------
-- Aloitetun koulutuksen alkamispäivämäärän alaraja
DECLARE @alkuPvm date = '2018-01-01'
-- Aloitetun koulutuksen alkamispäivämäärän yläraja
DECLARE @loppuPvm date = '2018-06-30'
-- Viimeinen ajanhetki, jolta aloittaneiden koulutustietoja haetaan
DECLARE @loppuPvmFinal date = EOMONTH(DATEADD(MONTH, -1, GETDATE()))
-- Parametri määrittää tarkastelujaksojen maksimimäärän (5 vuotta)
DECLARE @tarkastelujaksot float = 11
-- Parametriin tallenetaan tarkastelujaksojen todellinen maksimi
DECLARE @maxjaksot int
-- Parametriin tallennetaan tarkastelujaksojen lopullinen määrä
DECLARE @jaksot int

-- Faktataulun tyhjäys
TRUNCATE TABLE dw.f_koski_opintojen_kulku_toinen_aste

-- Ylioppilastutkintosuoritusten tiedot temp-tauluun
DROP TABLE IF EXISTS Koski_SA.sa.temp_ylioppilastutkinnot
SELECT
	ooy.opiskeluoikeus_oid, 
	ooy.oppija_oid,
	ooy.alku,
	ooy.tila_koodiarvo as tila,
	d1a.id as d_koulutusluokitus_oppilaitos_id, 
	d1b.id as d_koulutusluokitus_koulutuksen_jarjestaja_id
INTO Koski_SA.sa.temp_ylioppilastutkinnot
FROM Koski_SA.sa.sa_koski_opiskeluoikeus_ytr ooy
LEFT JOIN Koski_SA.sa.sa_koski_ytr_tutkintokerran_suoritus tks on ooy.opiskeluoikeus_oid = tks.opiskeluoikeus_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1a on d1a.organisaatio_oid = tks.oppilaitos_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1a.ylaorganisaatio_oid = d1b.organisaatio_oid
WHERE tks.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid AND
YEAR(ooy.alku) = tks.vuosi and CASE WHEN MONTH(ooy.alku) < 8 THEN 'K' ELSE 'S' END = tks.vuodenaika_koodiarvo AND
ooy.alku BETWEEN @alkuPvm and @loppuPvmFinal

-- Lataus päätyy vasta kun @loppuPvm on suurempi kuin kuluva päivä
WHILE @loppuPvm <= GETDATE()

BEGIN	

	-----------------------------------------------
	/* 2. TARKASTELUJAKSOJEN LUKUMÄÄRÄN MÄÄRITYS */
	-----------------------------------------------
	-- Mahdolliset tarkastelujaksot koko kohortille pyöristettynä alaspäin lähimpään kokonaislukuun. 
	SET @maxjaksot = FLOOR(DATEDIFF(DAY, @loppuPvm, @loppuPvmFinal) / 365.25 * 2) + 1

	-- Jos mahdollisia tarkastelujaksoja on yhtä paljon tai enemmän mitä @tarkastelujaksot parametriin on määritetty, käytetään @tarkastelujaksot parametrin arvoa
	IF @maxjaksot >= @tarkastelujaksot
		SET @jaksot = @tarkastelujaksot;
	-- Jos mahdollisia tarkastelujaksoja on vähemmän mitä @tarkastelujaksot parametriin on määritetty, käytetään @maxjaksot parametrin arvoa
	ELSE
		SET @jaksot = @maxjaksot;

	---------------------------------------------------------------------
	/* 3. KOULUTUKSEN ALOITTANEIDEN JA HEIDÄN TAUSTATIETOJENSA LATAUS  */
	---------------------------------------------------------------------
	-- Pudotetaan varmuuden vuoksi aputaulut
	DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste_rajaukset
	DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste_kotikunta_mannersuomessa
	DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste

	-- Ladataan temp-tauluun ammatillisen koulutuksen, lukiokoulutuksen tai valmentavan koulutuksen aloittaneiden tiedot

	-- Ammatillisen koulutuksen aloittaneet määritetyn aikajakson aikana
	SELECT DISTINCT 
		oo.oppija_oid
		,oo.opiskeluoikeus_oid
		,oo.koulutusmuoto
		,oo.koulutustoimija_oid
		,oo.oppilaitos_oid
		,ps.toimipiste_oid
		,ps.suorituksen_tyyppi
		,koulutusmoduuli_koodiarvo = ps.tutkinto_koodi
		,oppimaara = -1
		,alkamispaiva = aika.alku 
		,ika = FLOOR(DATEDIFF(day, h.syntymaaika, aika.alku) / 365.25)
		,h.sukupuoli
		,LEFT(h.kansalaisuus, 3) as kansalaisuus
		,h.aidinkieli
		,suoritus_alku = ps.suorituksen_alkamispaiva
		-- Erotellaan koko tutkinto tutkinnon osista
		,CASE WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1 else 4 end as aloitettu_koulutus
	INTO Koski_SA.sa.temp_opintojen_kulku_toinen_aste_rajaukset 
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo 
	JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
	OUTER APPLY (
		SELECT 
			MIN(o.alku) alku
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] o
		WHERE o.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
		AND o.tila in ('lasna','loma')
	) aika
	WHERE 1=1
	AND	ps.suorituksen_tyyppi in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') 
	AND aika.alku between @alkuPvm and @loppuPvm
	-- Ei opiskeluoikeuksia, jotka sisältyvät muihin opiskeluoikeuksiin
	AND oo.sisaltyy_opiskeluoikeuteen_oid is null
	-- Ei huomioida henkilöitä, jotka ovat aloittaneet koulutuksen samaan aikaan kun he ovat läsnä tuvassa
	AND NOT EXISTS (
		SELECT 1 
		FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
		WHERE oo.koulutusmuoto != 'tuva'
		AND tuvat.oppija_oid = oo.oppija_oid
		AND aika.alku between tuvat.alku and tuvat.loppu
	)
	
	-- Lukiokoulutuksen aloittaneet määritetyn aikajakson aikana
	INSERT INTO Koski_SA.sa.temp_opintojen_kulku_toinen_aste_rajaukset 
	SELECT DISTINCT
		oo.oppija_oid
		,oo.opiskeluoikeus_oid
		,oo.koulutusmuoto
		,oo.koulutustoimija_oid
		,oo.oppilaitos_oid
		,ps.toimipiste_oid
		,ps.suorituksen_tyyppi
		,koulutusmoduuli_koodiarvo = ps.tavoitetutkinto_koodi
		,oppimaara = 
			CASE 
				WHEN ps.oppimaara = 'Nuorten oppimäärä' THEN 1
				WHEN ps.oppimaara = 'Aikuisten oppimäärä' THEN 2
				WHEN ps.oppimaara = 'Ulkomainen tutkinto' THEN 3
				WHEN ps.oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' THEN 4
				ELSE -1
			END
		,alkamispaiva = ps.alku
		,ika = FLOOR(DATEDIFF(day, h.syntymaaika, ps.alku) / 365.25)
		,h.sukupuoli
		,LEFT(h.kansalaisuus, 3) as kansalaisuus
		,h.aidinkieli
		,suoritus_alku = ps.alku
		,aloitettu_koulutus = 2 -- lukio
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo 
	JOIN Koski_SA.sa.sa_lukio_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
	WHERE 1=1
	-- Ei opiskeluoikeuksia, jotka sisältyvät muihin opiskeluoikeuksiin
	AND sisaltyy_opiskeluoikeuteen_oid is null
	-- Vain tutkintokoulutus
	AND	ps.tavoitetutkinto_koodi is not null 
	AND ps.alku between @alkuPvm and @loppuPvm
	AND ps.alku between ooa.alku and ooa.loppu
	AND ooa.tila in ('lasna','loma') 
	-- Ei huomioida henkilöitä, jotka ovat aloittaneet koulutuksen samaan aikaan kun he ovat läsnä tuvassa
	AND NOT EXISTS (
		SELECT 1 
		FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
		WHERE oo.koulutusmuoto != 'tuva'
		AND tuvat.oppija_oid = oo.oppija_oid
		AND ps.alku between tuvat.alku and tuvat.loppu
	)

	-- Valmentavan koulutuksen aloittaneet määritetyn aikajakson aikana
	INSERT INTO Koski_SA.sa.temp_opintojen_kulku_toinen_aste_rajaukset 
	SELECT DISTINCT
		oo.oppija_oid
		,oo.opiskeluoikeus_oid
		,oo.koulutusmuoto
		,oo.koulutustoimija_oid
		,oo.oppilaitos_oid
		,ps.toimipiste_oid
		,ps.suorituksen_tyyppi
		,ps.koulutusmoduuli_koodiarvo
		,oppimaara = -1
		,alkamispaiva = aika.alku
		,ika = FLOOR(DATEDIFF(day, h.syntymaaika, aika.alku) / 365.25)
		,h.sukupuoli
		,LEFT(h.kansalaisuus, 3) as kansalaisuus
		,h.aidinkieli
		,suoritus_alku = aika.alku
		,aloitettu_koulutus = 3 -- Valmentava
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo 
	JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
	OUTER APPLY (
		SELECT 
			MIN(o.alku) alku
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] o
		WHERE o.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
		AND o.tila = 'lasna'
	) aika
	WHERE 1=1
	-- Ei opiskeluoikeuksia, jotka sisältyvät muihin opiskeluoikeuksiin
	AND sisaltyy_opiskeluoikeuteen_oid is null
	AND aika.alku between @alkuPvm and @loppuPvm
	AND ooa.tila in ('lasna','loma') 
	-- Valmentavat koulutukset
	AND ps.suorituksen_tyyppi in (
		'telma',
		'valma',
		'luva',
		'tuvakoulutuksensuoritus',
		'perusopetuksenlisaopetus', 
		'vstmaahanmuuttajienkotoutumiskoulutus',
		'vstoppivelvollisillesuunnattukoulutus'		
	)
	-- Ei huomioida henkilöitä, jotka ovat aloittaneet muun kuin tuva-koulutuksen samaan aikaan kun he ovat läsnä tuvassa
	AND NOT EXISTS (
		SELECT 1 
		FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
		WHERE oo.koulutusmuoto != 'tuva'
		AND tuvat.oppija_oid = oo.oppija_oid
		AND aika.alku between tuvat.alku and tuvat.loppu
	)

	-- Indeksi temp-tauluun 
	CREATE NONCLUSTERED INDEX [NC_idx__temp_opintojen_kulku_toinen_aste_rajaukset] ON Koski_SA.sa.temp_opintojen_kulku_toinen_aste_rajaukset 
	(
		[oppija_oid],
		[opiskeluoikeus_oid]
	)
	INCLUDE (
		[koulutusmuoto],
		suorituksen_tyyppi,
		koulutusmoduuli_koodiarvo,
		alkamispaiva
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]

	-- Ladataan temp-tauluun oppija_oid-kohtaisesti tiedot aikajaksoista, jolloin henkilöt ovat asuneet Manner-Suomessa
	SELECT * INTO Koski_SA.sa.temp_opintojen_kulku_toinen_aste_kotikunta_mannersuomessa 
	FROM (
		SELECT DISTINCT
			r.oppija_oid, kh.muutto_pvm, kh.poismuutto_pvm, 1 as kotikunta_mannersuomessa
		FROM Koski_SA.sa.temp_opintojen_kulku_toinen_aste_rajaukset r
		LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.oppija_oid = r.oppija_oid
		LEFT JOIN Koski_SA.sa.sa_koski_kotikuntahistoria kh on kh.master_oid = h.master_oid
		LEFT JOIN ANTERO.dw.d_alueluokitus d on d.kunta_koodi = kh.kotikunta
		WHERE d.mannersuomessa = 1
	) f

	-----------------------------------------------
	/* 4. ALOITETTUJEN KOULUTUSTEN PRIORISOINTI  */
	-----------------------------------------------
	-- Ladataan temp-tauluun kaikki aloitetun koulutukset tiedot ja valitaan mitkä koulutuksista huomioidaan 
	SELECT DISTINCT
		f.oppija_oid,
		f.opiskeluoikeus_oid,
		@alkuPvm as alku,
		@loppuPvm as loppu,
		f.alkamispaiva,
		f.d_koulutusluokitus_alkuperainen_id,
		f.oppimaara,
		f.suorituksen_tyyppi,
		f.koulutusmuoto,
		f.d_organisaatioluokitus_koulutuksen_jarjestaja_alkuperainen_id,
		f.d_organisaatioluokitus_oppilaitos_alkuperainen_id,
		f.d_organisaatioluokitus_toimipiste_alkuperainen_id,
		f.aloitettu_koulutus,
		f.suorittanut_perusopetuksen,
		f.perusop_suor_aloitusvuoden_kevaana,
		f.oppivelvollinen_alkamispaivana,
		f.erityisopetus,
		f.ika,
		f.aidinkieli,
		f.kansalaisuus,
		f.sukupuoli
	INTO Koski_SA.sa.temp_opintojen_kulku_toinen_aste
	FROM (

		SELECT DISTINCT 
			f.oppija_oid,
			f.opiskeluoikeus_oid,
			f.koulutusmuoto,
			coalesce(d1a.id, -1) as d_organisaatioluokitus_koulutuksen_jarjestaja_alkuperainen_id,
			coalesce(d1b.id, -1) as d_organisaatioluokitus_oppilaitos_alkuperainen_id,
			coalesce(d1c.id, -1) as d_organisaatioluokitus_toimipiste_alkuperainen_id,
			f.suorituksen_tyyppi,
			f.alkamispaiva,
			coalesce(d2.id, -1) as d_koulutusluokitus_alkuperainen_id,
			f.oppimaara,
			f.aloitettu_koulutus,
			-- Suorittanut perusopetuksen ennen koulutuksen alkamista
			suorittanut_perusopetuksen = case when pk.vahvistus_paiva <= f.alkamispaiva then 1 else 0 end,
			-- Suorittanut perusopetuksen aloitusvuoden keväänä
			perusop_suor_aloitusvuoden_kevaana = case when YEAR(pk.vahvistus_paiva) = YEAR(f.alkamispaiva) and MONTH(pk.vahvistus_paiva) < 8 then 1 else 0 end,
			-- Oppivelvollinen alkamispäivänä. Tieto puuttuu, jos koulutus on aloitettu ennen laajennetun oppivelvollisuuden alkamista
			oppivelvollinen_alkamispaivana = case when f.alkamispaiva < '2021-08-01' then -1 when ov.oppija_oid is null then 0 else 1 end,
			eo.erityisopetus,
			f.ika,
			f.aidinkieli,
			f.kansalaisuus,
			f.sukupuoli,
			/* 
			Priorisoidaan aloitetut koulutukset alkamispäivän mukaan. 
			Priorisoinnit tehdään erikseen lukiokoulutukselle, valmentavalle koulutukselle ja ammatilliselle koulutukselle. 
			Koko tutkintoon johtava ammatillinen koulutus priorisoidaan tutkinnon osan/osien koulutuksen edelle.
			Yhdellä henkilöllä voi olla siis maksimissaan kolme aloitettua koulutusta yhdessä tarkastelujaksossa.
			*/
			ranki = 
				RANK() OVER (
					PARTITION BY 
						 f.oppija_oid
						,replace(f.aloitettu_koulutus,4,1)
					ORDER BY 
						 f.aloitettu_koulutus
						,f.alkamispaiva
						,f.opiskeluoikeus_oid
				),
			/* 
			Erillinen priorisointi suorituksen tyypille opiskeluoikeuden tarkkuudella
			Priorisoidaan alla listatut suorituksen tyypit muiden taakse. 
			*/
			ranki_st = 
				RANK() OVER (
					PARTITION BY 
						 f.oppija_oid
						,f.opiskeluoikeus_oid
						,f.aloitettu_koulutus
					ORDER BY 
						CASE 
							WHEN f.suorituksen_tyyppi in (
								'diavalmistavavaihe', 
								'preiboppimaara', 
								'internationalschoolmypvuosiluokka'
							) THEN 2 
							ELSE 1 
						END
						,coalesce(f.suoritus_alku, cast('9999-12-31' as date))
				)
		FROM Koski_SA.sa.temp_opintojen_kulku_toinen_aste_rajaukset f
		LEFT JOIN Koski_SA.sa.perusopetuksen_paattotodistuksen_keskiarvot pk on pk.oppija_oid = f.oppija_oid and pk.rnk = 1
		LEFT JOIN Koski_SA.sa.sa_oppivelvolliset ov on ov.oppija_oid = f.oppija_oid and f.alkamispaiva between ov.alkuPvm and ov.loppuPvm
		OUTER APPLY (
			SELECT
				erityisopetus =
					MAX(
						CASE				
							WHEN (ooa2.erityinen_tuki = 1 or ooa2.hojks = 1) and ooa2.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps2.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') THEN 2 --Erityisopiskelija ilman erit. tuen tehtävää; tutk. joht 
							WHEN (ooa2.erityinen_tuki = 1 or ooa2.hojks = 1) and ooa2.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps2.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') THEN 3 --Erityisopiskelija ilman erit. tehtävää; valmentava
							WHEN ooa2.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps2.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vaikeasti_vammainen = 0 and ooa2.vammainen_ja_avustaja = 0 THEN 4 --Erit. tuen tehtävä; tutk.joht; erityisopiskelija
							WHEN ps2.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vaikeasti_vammainen = 1 THEN 5 --Erit. tuen tehtävä; tutk.joht; vaikeasti vammainen
							WHEN ps2.suorituksen_tyyppi not in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vammainen_ja_avustaja = 1 THEN 6 --Erit. tuen tehtävä; tutk.joht; vammainen&avustaja
							WHEN ooa2.vaativan_erityisen_tuen_erityinen_tehtava = 1 and ps2.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vaikeasti_vammainen = 0 and ooa2.vammainen_ja_avustaja = 0 THEN 7 --Erit. tuen tehtävä; TELMA&VALMA; erityisopiskelija
							WHEN ps2.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vaikeasti_vammainen = 1 THEN 8 --Erit. tuen tehtävä; TELMA&VALMA; vaikeasti vammainen
							WHEN ps2.suorituksen_tyyppi in ('telma','valma','tuvakoulutuksensuoritus') and ooa2.vammainen_ja_avustaja = 1 THEN 9 --Erit. tuen tehtävä; TELMA&VALMA; vammainen&avustaja
							WHEN ooa2.erityinen_tuki = 0 THEN 1 --Ei erityisopiskelija
							ELSE -1
						END
					)
			FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa2
			LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps2 on ooa2.opiskeluoikeus_oid = ps2.opiskeluoikeus_oid
			WHERE ooa2.opiskeluoikeus_oid = f.opiskeluoikeus_oid
		) eo
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1a on d1a.organisaatio_oid = f.koulutustoimija_oid
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid = f.oppilaitos_oid
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1c on d1c.organisaatio_oid = f.toimipiste_oid
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.koulutusmoduuli_koodiarvo
	) f 
	WHERE ranki = 1 and ranki_st = 1

	---------------------------------------------------
	/* 5. TARKASTELUJAKSOJEN MÄÄRITYS ALOITTANEILLE  */
	---------------------------------------------------
	-- Temp-taulun pudotus
	DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste_tarkastelujaksot 

	-- Pudotettuun temp-tauluun tarkastelupäivämäärät opiskeluoikeuksittain
	SELECT
		*
	INTO Koski_SA.sa.temp_opintojen_kulku_toinen_aste_tarkastelujaksot 
	FROM (
	SELECT 
		ok.oppija_oid,
		ok.opiskeluoikeus_oid,
		ok.alkamispaiva,
		ok.aloitettu_koulutus,
		ok.suorituksen_tyyppi,
		DATEADD(MONTH, jaksot.n * 6, ok.alkamispaiva) AS tarkastelu_pvm,
		jaksot.n * 0.5 AS aika_vuosina
	FROM Koski_SA.sa.temp_opintojen_kulku_toinen_aste ok
	-- Tarkastelujaksojen generointi
	CROSS JOIN (
		SELECT TOP (@jaksot) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n
		-- Taululla ei ole merkitystä. Siinä on vain oltava @jaksot määrä rivejä 
		FROM ANTERO.dw.d_organisaatioluokitus
	) jaksot
	UNION ALL
	-- Edellisen kuukauden viimeinen päivä
	SELECT DISTINCT
		ok.oppija_oid,
		ok.opiskeluoikeus_oid,
		ok.alkamispaiva,
		ok.aloitettu_koulutus,
		ok.suorituksen_tyyppi,
		@loppuPvmFinal AS tarkastelu_pvm,
		NULL as aika_vuosina
	FROM Koski_SA.sa.temp_opintojen_kulku_toinen_aste ok
	) f

	---------------------------------------------------------------------------------------------------
	/* 6. ALOITTANEIDEN KOULUTUSTIETOJEN LATAUS ALOITUSPÄIVÄN JA VIIMEISEN TARKASTELUPÄIVÄN VÄLILTÄ  */
	---------------------------------------------------------------------------------------------------
	-- Temp-taulun pudotus
	DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste_opiskelutiedot
	
	/* 
	Ladataan pudotettuun temp-tauluun kaikkien kohorttiin kuuluvien lasna- ja lomajaksot sekä väliaikaiset keskeyttämiset alkamispäivästä 
	viimeiseen tarkastelupäivään (+ edellisen kuukauden loppu). Valmistumiset alkamispäivän ja edellisen kuukauden lopun väliltä.
	*/
	SELECT DISTINCT
		ov.opiskeluoikeus_oid as opiskeluoikeus_oid_alkuperainen,
		ooa.opiskeluoikeus_oid,
		CASE 
			WHEN aps.opiskeluoikeus_oid is not null THEN aps.tutkinto_koodi
			WHEN lps.tavoitetutkinto_koodi is not null THEN lps.tavoitetutkinto_koodi
			WHEN ooy.opiskeluoikeus_oid is not null THEN '301101'
			WHEN lps.tavoitetutkinto = 'Ei tutkintotavoitetta' THEN '-1'
			ELSE ps.koulutusmoduuli_koodiarvo
		END AS koulutusmoduuli_koodiarvo,
		oppimaara = 
			CASE 
				WHEN lps.oppimaara = 'Nuorten oppimäärä' THEN 1
				WHEN lps.oppimaara = 'Aikuisten oppimäärä' THEN 2
				WHEN lps.oppimaara = 'Ulkomainen tutkinto' THEN 3
				WHEN lps.oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' THEN 4
				ELSE -1
			END,
		coalesce(ps.suorituksen_tyyppi,'ylioppilastutkinto') as suorituksen_tyyppi,
		oo.koulutusmuoto,
		coalesce(ooy.d_koulutusluokitus_koulutuksen_jarjestaja_id,d1a.id,-1) as d_organisaatioluokitus_koulutuksen_jarjestaja_id,
		coalesce(d_koulutusluokitus_oppilaitos_id, d1b.id, -1) as d_organisaatioluokitus_oppilaitos_id,
		coalesce(d1c.id,-1) as d_organisaatioluokitus_toimipiste_id,
		coalesce(ooa.alku, ooy.alku) as alku,
		coalesce(ooa.loppu, ooy.alku) as loppu,
		CASE WHEN coalesce(ooa.tila,ooy.tila) = 'valmistunut' THEN 1 ELSE 0 END as valmistunut,
		-- Ammatillinen/lukio/valmentava/muu-jaottelu
		aloitettu_koulutus = 
			CASE
				WHEN aps.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1
				-- Huomioidaan vain tutkintotavoitteiset koulutukset + ylioppilastutkintosuoritukset
				WHEN (lps.opiskeluoikeus_oid is not null and lps.tavoitetutkinto <> 'Ei tutkintotavoitetta') or ooy.oppija_oid is not null THEN 2
				WHEN ps.suorituksen_tyyppi in ('telma','valma','luva','tuvakoulutuksensuoritus','perusopetuksenlisaopetus','vstmaahanmuuttajienkotoutumiskoulutus','vstoppivelvollisillesuunnattukoulutus') THEN 3
				WHEN aps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' THEN 4
				ELSE 5
			END
	INTO Koski_SA.sa.temp_opintojen_kulku_toinen_aste_opiskelutiedot
	FROM Koski_SA.sa.temp_opintojen_kulku_toinen_aste ov
	INNER JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on oo.oppija_oid = ov.oppija_oid and sisaltyy_opiskeluoikeuteen_oid is null
	-- Ylioppilastutkinnon suoritukset aloituspäivän ja edellisen kuukauden lopun väliltä.
	LEFT JOIN Koski_SA.sa.temp_ylioppilastutkinnot ooy on oo.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid and ooy.alku BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal
	-- Muut läsnäjaksot ja valmistumiset aloituspäivän ja edellisen kuukauden lopun väliltä.
	LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and 
		(
			(ov.alkamispaiva <= ooa.loppu and DATEADD(month,6*(@jaksot-1),ov.alkamispaiva) >= ooa.alku and ooa.tila in ('lasna', 'loma', 'valiaikaisestikeskeytynyt')) OR 
			(@loppuPvmFinal BETWEEN ooa.alku and ooa.loppu and ooa.tila in ('lasna', 'loma', 'valiaikaisestikeskeytynyt')) OR
			-- Ei lukion oppimäärän suorituksia eikä alkamispäivänä suoritettuja tutkintoja. 
			(ooa.alku BETWEEN DATEADD(day,1,ov.alkamispaiva) and @loppuPvmFinal and ooa.tila = 'valmistunut' and oo.koulutusmuoto <> 'lukiokoulutus')
		)
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid 
	LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] aps on aps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] lps on lps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1a on d1a.organisaatio_oid = oo.koulutustoimija_oid
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1b.organisaatio_oid = oo.oppilaitos_oid
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1c on d1c.organisaatio_oid = ps.toimipiste_oid
	WHERE 
	-- Lasna- ja lomajaksot sekä valmistumiset ja väliaikaiset keskeyttämiset.
	coalesce(ooa.tila, ooy.tila) in ('lasna', 'loma','valmistunut','valiaikaisestikeskeytynyt') and 
	-- Ammatilliset koulutukset (ei näyttötutkintoon johtava), valmentavat koulutukset ja lukiokoulutukset (vain tutkintoon johtava)
	(
		aps.suorituksen_tyyppi in ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') or 
		(ps.suorituksen_tyyppi in ('telma','valma','luva','tuvakoulutuksensuoritus','perusopetuksenlisaopetus','vstmaahanmuuttajienkotoutumiskoulutus','vstoppivelvollisillesuunnattukoulutus') and ooa.tila <> 'valmistunut')or
		(lps.opiskeluoikeus_oid is not null and lps.tavoitetutkinto <> 'Ei tutkintotavoitetta') or
		ooy.oppija_oid is not null
	)

	---------------------------------------------------
	/* 7. PRIORISOIMATTOMIEN TILANNETIETOJEN LATAUS  */
	---------------------------------------------------
	-- Pudotetaan temp-taulu
	DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste_tilanne

	/* 
	Ladataan pudotettuun temp-tauluun tarkastelujakson priorisoimattomat tilannetiedot sekä
	tieto oppivelvollisuudesta ja kotikunnasta
	*/
	SELECT
		opiskeluoikeus_oid_alkuperainen,
		aika_vuosina,
		valm_alk_koko_tutk_joht_koul,
		valm_muu_koko_tutk_joht_koul,
		jatk_alk_koko_tutk_joht_koul,
		jatk_muu_koko_tutk_joht_koul,
		jatk_alk_valm_koul,
		jatk_muu_valm_koul,
		valm_amm_tutk_osa_koul,
		jatk_amm_tutk_osa_koul,
		oppivelvollinen,
		kotikunta_mannersuomessa
	INTO Koski_SA.sa.temp_opintojen_kulku_toinen_aste_tilanne 

	FROM (

		SELECT 
			f.opiskeluoikeus_oid_alkuperainen,
			aika_vuosina,
			MAX(f.valm_alk_koko_tutk_joht_koul) as valm_alk_koko_tutk_joht_koul,
			MAX(f.valm_muu_koko_tutk_joht_koul) as valm_muu_koko_tutk_joht_koul,
			MAX(f.jatk_alk_koko_tutk_joht_koul) as jatk_alk_koko_tutk_joht_koul,
			MAX(f.jatk_muu_koko_tutk_joht_koul) as jatk_muu_koko_tutk_joht_koul,
			MAX(f.jatk_alk_valm_koul) as jatk_alk_valm_koul,
			MAX(f.jatk_muu_valm_koul) as jatk_muu_valm_koul,
			MAX(f.valm_amm_tutk_osa_koul) as valm_amm_tutk_osa_koul,
			MAX(f.jatk_amm_tutk_osa_koul) as jatk_amm_tutk_osa_koul,
			MAX(f.oppivelvollinen) as oppivelvollinen,
			MAX(f.kotikunta_mannersuomessa) as kotikunta_mannersuomessa
		FROM (

			SELECT
				tj.opiskeluoikeus_oid as opiskeluoikeus_oid_alkuperainen,
				coalesce(tj.aika_vuosina,99) as aika_vuosina,
				/* 
				Valmistunut alkuperäisestä koko tutkintoon johtavasta koulutuksesta. Koulutus tulkitaan alkuperäiseksi
				jos se on samalla sektorilla (lukio/ammatillinen) kuin alkuperäinen aloitettu koulutus.
				*/
				CASE 
					WHEN ot.valmistunut = 1 and tj.aloitettu_koulutus = 1 and ot.aloitettu_koulutus = 1 THEN 1
					WHEN ot.valmistunut = 1 and tj.aloitettu_koulutus = 2 and ot.aloitettu_koulutus = 2 THEN 1 
					ELSE 0
				END as valm_alk_koko_tutk_joht_koul,
				/* 
				Valmistunut muusta koko tutkintoon johtavasta koulutuksesta. Koulutus tulkitaan muuksi
				jos se on toisella sektorilla (lukio/ammatillinen) kuin alkuperäinen aloitettu koulutus.
				*/
				CASE 
					WHEN ot.valmistunut = 1 and tj.aloitettu_koulutus = 1 and ot.aloitettu_koulutus = 2 THEN 1
					WHEN ot.valmistunut = 1 and tj.aloitettu_koulutus = 2 and ot.aloitettu_koulutus = 1 THEN 1
					WHEN ot.valmistunut = 1 and tj.aloitettu_koulutus not in (1,2) and ot.aloitettu_koulutus in (1,2) THEN 1
					ELSE 0
				END as valm_muu_koko_tutk_joht_koul,
				/* 
				Jatkaa alkuperäisessä koko tutkintoon johtavassa koulutuksessa. Koulutus tulkitaan alkuperäiseksi
				jos se on samalla sektorilla (lukio/ammatillinen) kuin alkuperäinen aloitettu koulutus.
				*/
				CASE 
					WHEN ot.valmistunut = 0 and tj.aloitettu_koulutus = 1 and ot.aloitettu_koulutus = 1 THEN 1
					WHEN ot.valmistunut = 0 and tj.aloitettu_koulutus = 2 and ot.aloitettu_koulutus = 2 THEN 1
					ELSE 0
				END as jatk_alk_koko_tutk_joht_koul,
				/* 
				Jatkaa muussa koko tutkintoon johtavassa koulutuksessa. Koulutus tulkitaan muuksi
				jos se on toisella sektorilla (lukio/ammatillinen) kuin alkuperäinen aloitettu koulutus.
				*/
				CASE 
					WHEN ot.valmistunut = 0 and tj.aloitettu_koulutus = 1 and ot.aloitettu_koulutus = 2 THEN 1
					WHEN ot.valmistunut = 0 and tj.aloitettu_koulutus = 2 and ot.aloitettu_koulutus = 3 THEN 1
					WHEN ot.valmistunut = 0 and tj.aloitettu_koulutus not in (1,2) and ot.aloitettu_koulutus in (1,2) THEN 1
					ELSE 0
				END as jatk_muu_koko_tutk_joht_koul,
				/* 
				Jatkaa alkuperäisessä valmentavassa koulutuksessa. Koulutus tulkitaan alkuperäiseksi
				jos sillä on sama suorituksen tyyppi kuin alkuperäisellä aloitetulla koulutuksella.
				*/
				CASE 
					WHEN ot.valmistunut = 0 and tj.aloitettu_koulutus = 3 and tj.suorituksen_tyyppi = ot.suorituksen_tyyppi
						THEN 1 
					ELSE 0
				END as jatk_alk_valm_koul,
				/* 
				Jatkaa muussa valmentavassa koulutuksessa. Koulutus tulkitaan muuksi
				jos sillä on eri suorituksen tyyppi kuin alkuperäisellä aloitetulla koulutuksella.
				*/
				CASE 
					WHEN ot.valmistunut = 0 and tj.suorituksen_tyyppi <> ot.suorituksen_tyyppi and ot.suorituksen_tyyppi in ('luva','telma','valma','tuvakoulutuksensuoritus', 'perusopetuksenlisaopetus', 'vstmaahanmuuttajienkotoutumiskoulutus', 'vstoppivelvollisillesuunnattukoulutus')
						THEN 1
					ELSE 0
				END as jatk_muu_valm_koul,
				/*
				Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta. 
				Ei tuva-koulutuksen aikaisia valmistumisia.
				*/
				CASE 
					WHEN ot.valmistunut = 1 and ot.aloitettu_koulutus = 4 and tuvat.oppija_oid is null
						THEN 1 
					ELSE 0
				END as valm_amm_tutk_osa_koul, 
				-- Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa. 
				CASE 
					WHEN ot.valmistunut = 0 and ot.aloitettu_koulutus = 4
						THEN 1
					ELSE 0
				END as jatk_amm_tutk_osa_koul,
				-- Oppivelvollinen tarkasteluhetkellä. Tieto puuttuu, jos tarkasteluhetki on ennen laajennetun oppivelvollisuuden alkamista.
				CASE
					WHEN tj.tarkastelu_pvm < '2021-08-01' THEN -1
					WHEN ov.oppija_oid is not null THEN 1
					ELSE 0
				END as oppivelvollinen,
				-- Kotikunta Manner-Suomessa tarkasteluhetkellä
				coalesce(km.kotikunta_mannersuomessa,0) as kotikunta_mannersuomessa
			FROM Koski_SA.sa.temp_opintojen_kulku_toinen_aste_tarkastelujaksot tj
			LEFT JOIN Koski_SA.sa.temp_opintojen_kulku_toinen_aste_opiskelutiedot ot on tj.opiskeluoikeus_oid = ot.opiskeluoikeus_oid_alkuperainen and (tj.tarkastelu_pvm BETWEEN ot.alku and ot.loppu or (ot.valmistunut = 1 and ot.alku <= tj.tarkastelu_pvm))
			LEFT JOIN Koski_SA.sa.sa_oppivelvolliset ov on tj.oppija_oid = ov.oppija_oid and tj.tarkastelu_pvm between ov.alkuPvm and ov.loppuPvm
			LEFT JOIN Koski_SA.sa.temp_opintojen_kulku_toinen_aste_kotikunta_mannersuomessa km on km.oppija_oid = tj.oppija_oid and tj.tarkastelu_pvm between km.muutto_pvm and km.poismuutto_pvm
			LEFT JOIN Koski_SA.sa.tuva_lasna_loma_jaksot tuvat on tuvat.oppija_oid = tj.oppija_oid and ot.alku between tuvat.alku and tuvat.loppu
			WHERE 
			--Ei huomioida koulutuksia, jos henkilö on samaan aikaan tuva-koulutuksessa.
			NOT EXISTS (
				SELECT 1 
				FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
				WHERE ot.koulutusmuoto != 'tuva'
				AND (
						(
							ot.valmistunut = 0 AND
							tj.tarkastelu_pvm between tuvat.alku and tuvat.loppu
						) 
				)
				AND tuvat.oppija_oid = tj.oppija_oid
			)
		) f

		GROUP BY f.opiskeluoikeus_oid_alkuperainen, aika_vuosina

	) f

	--------------------------------------------------------
	/* 8. FAKTATAULUN LATAUS JA TILANTEIDEN PRIORISOINTI  */
	--------------------------------------------------------
	INSERT INTO dw.f_koski_opintojen_kulku_toinen_aste
	SELECT 
		oppija_oid,
		alku,
		loppu,
		opiskeluoikeus_oid_alkuperainen,
		opiskeluoikeus_oid,
		tilanne,
		tilanne_prio,
		aika_vuosina,
		suorituksen_tyyppi_alkuperainen,
		-- Tarkasteluhetken koulutustiedot ovat -1, jos priorisoitu tilanne on 98
		CASE WHEN tilanne_prio = 98 THEN '-1' ELSE suorituksen_tyyppi END as suorituksen_tyyppi,
		koulutusmuoto_alkuperainen,
		CASE WHEN tilanne_prio = 98 THEN '-1' ELSE koulutusmuoto END as koulutusmuoto,
		aloitettu_koulutus,
		d_sukupuoli_id,
		d_maatjavaltiot2_kansalaisuus_id,
		d_aidinkieli_id,
		d_ika_id,
		d_kytkin_suorittanut_perusopetuksen_id,
		d_kytkin_oppivelvollinen_id,
		d_kytkin_kotikunta_mannersuomessa_id,
		d_erityisopetus_aloitettu_koulutus_id,
		d_koulutusluokitus_alkuperainen_id,
		CASE WHEN tilanne_prio = 98 THEN -1 ELSE d_koulutusluokitus_id END as d_koulutusluokitus_id,
		d_kytkin_perusop_suor_aloitusvuoden_kevaana_id,
		d_kytkin_oppivelvollinen_alkamispaivana_id,
		oppimaara_alkuperainen,
		oppimaara,
		d_organisaatioluokitus_koulutuksen_jarjestaja_alkuperainen_id,
		d_organisaatioluokitus_oppilaitos_alkuperainen_id,
		d_organisaatioluokitus_toimipiste_alkuperainen_id,
		CASE WHEN tilanne_prio = 98 THEN -1 ELSE d_organisaatioluokitus_koulutuksen_jarjestaja_id END as d_organisaatioluokitus_koulutuksen_jarjestaja_id,
		CASE WHEN tilanne_prio = 98 THEN -1 ELSE d_organisaatioluokitus_oppilaitos_id END as d_organisaatioluokitus_oppilaitos_id,
		CASE WHEN tilanne_prio = 98 THEN -1 ELSE d_organisaatioluokitus_toimipiste_id END as d_organisaatioluokitus_toimipiste_id,
		d_kytkin_valm_alk_koko_tutk_joht_koul_id,
		d_kytkin_valm_muu_koko_tutk_joht_koul_id,
		d_kytkin_jatk_alk_koko_tutk_joht_koul_id,
		d_kytkin_jatk_muu_koko_tutk_joht_koul_id,
		d_kytkin_jatk_alk_valm_koul_id,
		d_kytkin_jatk_muu_valm_koul_id,
		d_kytkin_valm_amm_tutk_osa_koul_id,
		d_kytkin_jatk_amm_tutk_osa_koul_id,
		GETDATE() as loadtime,
		'ETL: p_lataa_f_koski_opintojen_kulku_toinen_aste' as source,
		SUSER_SNAME() as username

	FROM (

		SELECT
			s.oppija_oid,
			s.alku,
			s.loppu,
			s.opiskeluoikeus_oid_alkuperainen,
			s.opiskeluoikeus_oid,
			s.tilanne,
			-- Tilanteen priorisointi
			tilanne_prio = MIN(s.tilanne) OVER(PARTITION BY s.oppija_oid, s.aloitettu_koulutus, s.aika_vuosina),
			s.aika_vuosina,
			s.suorituksen_tyyppi_alkuperainen,
			s.suorituksen_tyyppi,
			s.koulutusmuoto_alkuperainen,
			s.koulutusmuoto,
			-- Yhdistetään ammatilliset koulutukset
			replace(s.aloitettu_koulutus,4,1) as aloitettu_koulutus,
			s.d_sukupuoli_id,
			s.d_maatjavaltiot2_kansalaisuus_id,
			s.d_aidinkieli_id,
			s.d_ika_id,
			s.d_kytkin_suorittanut_perusopetuksen_id,
			s.d_kytkin_oppivelvollinen_id,
			s.d_kytkin_kotikunta_mannersuomessa_id,
			s.d_erityisopetus_aloitettu_koulutus_id,
			s.d_koulutusluokitus_alkuperainen_id,
			s.d_koulutusluokitus_id,
			s.d_kytkin_perusop_suor_aloitusvuoden_kevaana_id,
			d_kytkin_oppivelvollinen_alkamispaivana_id,
			s.oppimaara_alkuperainen,
			s.oppimaara,
			s.d_organisaatioluokitus_koulutuksen_jarjestaja_alkuperainen_id,
			s.d_organisaatioluokitus_oppilaitos_alkuperainen_id,
			s.d_organisaatioluokitus_toimipiste_alkuperainen_id,
			s.d_organisaatioluokitus_koulutuksen_jarjestaja_id,
			s.d_organisaatioluokitus_oppilaitos_id,
			s.d_organisaatioluokitus_toimipiste_id,
			s.d_kytkin_valm_alk_koko_tutk_joht_koul_id,
			s.d_kytkin_valm_muu_koko_tutk_joht_koul_id,
			s.d_kytkin_jatk_alk_koko_tutk_joht_koul_id,
			s.d_kytkin_jatk_muu_koko_tutk_joht_koul_id,
			s.d_kytkin_jatk_alk_valm_koul_id,
			s.d_kytkin_jatk_muu_valm_koul_id,
			s.d_kytkin_valm_amm_tutk_osa_koul_id,
			s.d_kytkin_jatk_amm_tutk_osa_koul_id,
			-- Suorituksen tyypin priorisointi
			ranki_st = 
				RANK() OVER (
					PARTITION BY 
						s.opiskeluoikeus_oid_alkuperainen, 
						s.opiskeluoikeus_oid, 
						s.tilanne,
						s.aika_vuosina
					ORDER BY 
						-- Priorisoidaan alkuperäistä suorituksen tyyppiä
						CASE 
							WHEN s.suorituksen_tyyppi_alkuperainen = s.suorituksen_tyyppi THEN 1 
							ELSE 2 
						END, 
						-- Priorisoidaan muut suorituksen tyypit alla listattujen edelle
 						CASE
							WHEN s.suorituksen_tyyppi in ('diavalmistavavaihe', 'preiboppimaara', 'internationalschoolmypvuosiluokka', 'europeanschoolofhelsinkivuosiluokkaprimary') THEN 2 
							ELSE 1 
						END, 
						s.suorituksen_tyyppi
				)
		FROM (
			SELECT DISTINCT
				s1.oppija_oid,
				s1.alku,
				s1.loppu,
				tj.aika_vuosina,
				s1.aloitettu_koulutus,
				s1.opiskeluoikeus_oid as opiskeluoikeus_oid_alkuperainen,
				s2.opiskeluoikeus_oid,
				CASE
					/* 
					Suorittanut tutkinnon alkuperäisellä sektorilla (ammatillinen/lukio)
					*/
					WHEN s1.aloitettu_koulutus = 1 and s2.aloitettu_koulutus = 1 and s2.valmistunut = 1 THEN 1
					WHEN s1.aloitettu_koulutus = 2 and s2.aloitettu_koulutus = 2 and s2.valmistunut = 1 THEN 1
					/* 
					Suorittanut tutkinnon toisella sektorilla
					*/	
					WHEN s2.aloitettu_koulutus in (1,2) and s2.valmistunut = 1 THEN 2		
					-- Jatkaa alkuperäisellä sektorilla (koko tutkintoon johtava koulutus)
					WHEN s1.aloitettu_koulutus = 1 and s2.aloitettu_koulutus = 1 and s2.valmistunut = 0 THEN 3
					WHEN s1.aloitettu_koulutus = 2 and s2.aloitettu_koulutus = 2 and s2.valmistunut = 0 THEN 3
					-- Jatkaa toisella sektorilla (koko tutkintoon johtava koulutus)
					WHEN s2.aloitettu_koulutus in (1,2) and s2.valmistunut = 0 THEN 4
					-- Jatkaa alkuperäisessä valmentavassa koulutuksessa
					WHEN s1.aloitettu_koulutus = 3 and s2.aloitettu_koulutus = 3 and s1.suorituksen_tyyppi = s2.suorituksen_tyyppi and s2.valmistunut = 0 THEN 5
					-- Jatkaa toisessa valmentavassa koulutuksessa
					WHEN s2.aloitettu_koulutus = 3 and s2.valmistunut = 0 THEN 6
					-- Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta
					WHEN s2.aloitettu_koulutus = 4 and s2.valmistunut = 1 and tuvat.oppija_oid is null THEN 7
					-- Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa
					WHEN s2.aloitettu_koulutus = 4 and s2.valmistunut = 0 THEN 8	
					ELSE 98
				END as tilanne,
				s1.suorituksen_tyyppi as suorituksen_tyyppi_alkuperainen,
				s2.suorituksen_tyyppi,
				s1.koulutusmuoto as koulutusmuoto_alkuperainen,
				s2.koulutusmuoto,
				coalesce(d1.id, -1) as d_sukupuoli_id,
				coalesce(d2.id, -1) as d_maatjavaltiot2_kansalaisuus_id,
				coalesce(d3.id, -1) as d_aidinkieli_id,
				coalesce(d4.id, -1) as d_ika_id,
				coalesce(d5.id, -1) as d_kytkin_suorittanut_perusopetuksen_id,
				coalesce(d6.id, -1) as d_kytkin_oppivelvollinen_id,
				coalesce(d26.id, -1) as d_kytkin_kotikunta_mannersuomessa_id,
				coalesce(d25.id, -1) as d_erityisopetus_aloitettu_koulutus_id,
				s1.d_koulutusluokitus_alkuperainen_id,
				coalesce(d30.id, -1) as d_koulutusluokitus_id,
				coalesce(d28.id, -1) as d_kytkin_perusop_suor_aloitusvuoden_kevaana_id,
				coalesce(d29.id, -1) as d_kytkin_oppivelvollinen_alkamispaivana_id,
				coalesce(s1.oppimaara, -1) as oppimaara_alkuperainen,
				coalesce(s2.oppimaara, -1) as oppimaara,

				-- Organisaatiomuuttujat
				s1.d_organisaatioluokitus_koulutuksen_jarjestaja_alkuperainen_id,
				s1.d_organisaatioluokitus_oppilaitos_alkuperainen_id,
				s1.d_organisaatioluokitus_toimipiste_alkuperainen_id,
				s2.d_organisaatioluokitus_koulutuksen_jarjestaja_id,
				s2.d_organisaatioluokitus_oppilaitos_id,
				s2.d_organisaatioluokitus_toimipiste_id,

				-- Tilanteet ilman priorisointia
				d7.id as d_kytkin_valm_alk_koko_tutk_joht_koul_id,
				d8.id as d_kytkin_valm_muu_koko_tutk_joht_koul_id,
				d9.id as d_kytkin_jatk_alk_koko_tutk_joht_koul_id,
				d10.id as d_kytkin_jatk_muu_koko_tutk_joht_koul_id,
				d13.id as d_kytkin_jatk_alk_valm_koul_id,
				d14.id as d_kytkin_jatk_muu_valm_koul_id,
				d15.id as d_kytkin_valm_amm_tutk_osa_koul_id,
				d16.id as d_kytkin_jatk_amm_tutk_osa_koul_id
			-- Aloitushetki
			FROM Koski_SA.sa.temp_opintojen_kulku_toinen_aste s1
			-- Tarkasteluajankohtien tiedot
			LEFT JOIN Koski_SA.sa.temp_opintojen_kulku_toinen_aste_tarkastelujaksot tj on tj.opiskeluoikeus_oid = s1.opiskeluoikeus_oid
			LEFT JOIN Koski_SA.sa.temp_opintojen_kulku_toinen_aste_opiskelutiedot s2 on s1.opiskeluoikeus_oid = s2.opiskeluoikeus_oid_alkuperainen and (tj.tarkastelu_pvm BETWEEN s2.alku and s2.loppu or (s2.valmistunut = 1 and s2.alku <= tj.tarkastelu_pvm))
			-- Henkilötiedot
			LEFT JOIN dw.d_sukupuoli d1 on d1.sukupuoli_koodi = s1.sukupuoli
			LEFT JOIN dw.d_maatjavaltiot2 d2 on d2.maatjavaltiot2_koodi = s1.kansalaisuus
			LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = s1.aidinkieli
			LEFT JOIN dw.d_ika d4 on d4.ika_avain = s1.ika
			LEFT JOIN dw.d_kytkin d5 on d5.kytkin_koodi = s1.suorittanut_perusopetuksen
			LEFT JOIN ANTERO.dw.d_kytkin d28 on d28.kytkin_koodi = s1.perusop_suor_aloitusvuoden_kevaana
			LEFT JOIN ANTERO.dw.d_kytkin d29 on d29.kytkin_koodi = s1.oppivelvollinen_alkamispaivana
			-- Koulutusluokitus
			LEFT JOIN ANTERO.dw.d_koulutusluokitus d30 on d30.koulutusluokitus_koodi = s2.koulutusmoduuli_koodiarvo
			-- Muut
			LEFT JOIN dw.d_erityisopetus d25 on d25.erityisopetus_koodi = s1.erityisopetus
			-- Tilanteet ilman priorisointia
			LEFT JOIN Koski_SA.sa.temp_opintojen_kulku_toinen_aste_tilanne s3 on s1.opiskeluoikeus_oid = s3.opiskeluoikeus_oid_alkuperainen and s3.aika_vuosina = coalesce(tj.aika_vuosina,99)
			LEFT JOIN dw.d_kytkin d7 on d7.kytkin_koodi = s3.valm_alk_koko_tutk_joht_koul
			LEFT JOIN dw.d_kytkin d8 on d8.kytkin_koodi = s3.valm_muu_koko_tutk_joht_koul
			LEFT JOIN dw.d_kytkin d9 on d9.kytkin_koodi = s3.jatk_alk_koko_tutk_joht_koul
			LEFT JOIN dw.d_kytkin d10 on d10.kytkin_koodi = s3.jatk_muu_koko_tutk_joht_koul
			LEFT JOIN dw.d_kytkin d13 on d13.kytkin_koodi = s3.jatk_alk_valm_koul
			LEFT JOIN dw.d_kytkin d14 on d14.kytkin_koodi = s3.jatk_muu_valm_koul
			LEFT JOIN dw.d_kytkin d15 on d15.kytkin_koodi = s3.valm_amm_tutk_osa_koul
			LEFT JOIN dw.d_kytkin d16 on d16.kytkin_koodi = s3.jatk_amm_tutk_osa_koul
			LEFT JOIN dw.d_kytkin d6 on d6.kytkin_koodi = s3.oppivelvollinen
			LEFT JOIN dw.d_kytkin d26 on d26.kytkin_koodi = s3.kotikunta_mannersuomessa
			LEFT JOIN Koski_SA.sa.tuva_lasna_loma_jaksot tuvat on tuvat.oppija_oid = s1.oppija_oid and s2.alku between tuvat.alku and tuvat.loppu
			-- Ei huomioida koulutuksia, jos henkilö on samaan aikaan tuva-koulutuksessa.
			WHERE
			NOT EXISTS (
				SELECT 1 
				FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
				WHERE s2.koulutusmuoto != 'tuva'
				AND (
						(
							s2.valmistunut = 0 AND
							tj.tarkastelu_pvm between tuvat.alku and tuvat.loppu
						)
					)
				AND tuvat.oppija_oid = s1.oppija_oid
			)
		) s
	) s 
	WHERE s.tilanne = s.tilanne_prio and ranki_st = 1
	
	-- Alku- ja loppupäivämäärän kasvatus puolella vuodella
	SET @alkuPvm = DATEADD(DAY, 1, @loppuPvm)
	SET @loppuPvm = EOMONTH(DATEADD(MONTH, 6, @loppuPvm))

END

-- Temp-taulujen pudotus
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste_tilanne
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste_opiskelutiedot
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste_kotikunta_mannersuomessa
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste_rajaukset
DROP TABLE IF EXISTS Koski_SA.sa.temp_opintojen_kulku_toinen_aste_tarkastelujaksot
DROP TABLE IF EXISTS Koski_SA.sa.temp_ylioppilastutkinnot

GO

USE [ANTERO]