USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_esi_ja_perus_oppilaat_ja_paattaneet_valitaulu]    Script Date: 19.3.2025 19.24.00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_esi_ja_perus_oppilaat_ja_paattaneet_valitaulu] AS

-- Tutkintopoiminnassa osin eri logiikka kuin oppilaissa; ks. tarvittaessa vuosiluokka, rnk sekä huom-kohdat.
-- Lisää tarvittaessa koulutuksia vuosiluokkapäättelyyn ja -dimensioon.
-- Jäädytyksen jälkeen arch-palvelimella ladataan vain 1.8.vvvv-1 - 30.9.vvvv. Limittäisyys on luokalle jääneiden sekä 20.9. tilanteen raportoimiseksi, tiedot erotellaan livekannan sa-näkymässä.

DECLARE @alkuPvm as date, @loppuPvm as date, @tilastoPvm as date, @endOfLoop as date, @palvelinNimi as varchar(14)

SET @palvelinNimi = @@servername

IF @palvelinNimi like '%arch%'
BEGIN
	SET @alkuPvm = DATEFROMPARTS(right(db_name(),4)-1, 8, 1)
	SET @loppuPvm = EOMONTH(@alkuPvm)
	SET @tilastoPvm = DATEFROMPARTS(YEAR(@alkuPvm), 9, 20)
	SET @endOfLoop = DATEFROMPARTS(right(db_name(),4), 9, 30)
END
ELSE
BEGIN
	SET @alkuPvm = '2017-08-01' --lv. 2017/18 vain luparaporttia varten, rajataan pois kuutioista
	SET @loppuPvm = EOMONTH(@alkuPvm)
	SET @tilastoPvm = DATEFROMPARTS(YEAR(@alkuPvm), 9, 20)
	SET @endOfLoop = DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)
END


-- Alku- ja loppupäivämääristä riippumattomat tiedot temp-tauluihin

DROP TABLE IF EXISTS sa.temp_esi_ja_perusopetus_oo
DROP TABLE IF EXISTS sa.temp_esi_ja_perus_suorittaneet


-- Oppilaat
SELECT 
	COALESCE(ebib.alku, ooa.alku) as alku,
	COALESCE(ebib.alku, ooa2.alku) as alku2,
	CASE WHEN oo.alkamispaiva > COALESCE(ebib.alku, oo.alkamispaiva) THEN oo.alkamispaiva ELSE COALESCE(ebib.alku, oo.alkamispaiva) END as oo_alkamispaiva,
	et.alku as et_alku,
	et.loppu as et_loppu,
	ooa.alku as ooa_alku,
	ooa.loppu as ooa_loppu,
	ooa2.alku as ooa2_alku,
	ooa2.loppu as ooa2_loppu,
	oo.alkamispaiva,
	oo.paattymispaiva,
	ps.vahvistus_paiva,
	ps.suorituksen_alkamispaiva,
	ps.paatason_suoritus_id,
	ps.jaa_luokalle,
	ooa.tila as tila,
	ooa2.tila as ooa2_tila,
	vuosiluokka_tai_koulutus = 
		--oppilaissa vuosiluokka poimitaan vasta luupissa ja ohjataan puuttuessa koodiin 'x'; aikuisten alkuvaihe erotetaan k/e-muuttujalla; dimensiossa myös ryhmittelyt
		case 
			when ps.koulutusmoduuli_koodiarvo = 'explorer' and ps.suorituksen_tyyppi = 'internationalschoolpypvuosiluokka' then '001101'
			when ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkanursery' then '001101'
			when ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkaprimary' then right(ps.koulutusmoduuli_koodiarvo,1)
			when ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' then cast(cast(right(ps.koulutusmoduuli_koodiarvo,1) as int) + 5 as varchar)
			when ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaaranalkuvaihe') then '21' --ei löydy koulk
			else ps.koulutusmoduuli_koodiarvo
		end,
	ps.suorituksen_tyyppi,
	ps.suoritustapa_koodi,
	--huom. vuosiluokkasuorituksille katsottava myöhemmin erikseen
	suorituskieli = ps.suorituskieli_koodiarvo,
	muu_suorituskieli = ps.muut_suorituskielet_koodi,
	kielikylpykieli = ps.kielikylpykieli_koodi,
	ps.toimipiste_oid,
	--

	oo.oppilaitos_oid,
	oo.oppilaitos_kotipaikka,
	oo.koulutustoimija_oid,
	oo.opiskeluoikeus_oid,
	oo.koulutusmuoto,
	oo.vuosiluokkiin_sitoutumaton_opetus,

	erityisen_tuen_paatos = case when ooa2.erityisen_tuen_paatos = 1 or ooa.erityinen_tuki = 1 or ooa.hojks = 1 then 1 else 0 end ,
	erityinen_tuki_johdettu = 
		--TK-dimensio
		case 
			when ooa2.vaikeasti_vammainen = 1 or ooa.vaikeasti_vammainen = 1 then 'ertu_v'
			when ooa2.vammainen = 1 or ooa.vammainen = 1 or ooa.vammainen_ja_avustaja = 1 /*or ooa2.vammainen_ja_avustaja = 1*/ then 'ertu_m'
			when ooa2.erityisen_tuen_paatos = 1 or ooa.erityinen_tuki = 1 or ooa.hojks = 1 then 'ertu_muu'
			--tehostettu_tuki -> ertu_teho
			else 'ertu_eiei'
		end,
	ooa.joustava_perusopetus,
	koulukoti = case when ooa2.koulukoti = 1 or ooa.koulukoti = 1 then 1 else 0 end,
	ooa.kotiopetus,
	kuljetusetu = case when ooa2.kuljetusetu = 1 or ooa.kuljetusetu = 1 then 1 else 0 end,
	majoitusetu = case when ooa2.majoitusetu = 1 or ooa.majoitusetu = 1 then 1 else 0 end,
	pidennetty_oppivelvollisuus = case when ooa2.pidennetty_oppivelvollisuus = 1 or ooa.pidennetty_oppivelvollisuus = 1 then 1 else 0 end, 
	sisaoppilaitosmainen_majoitus = case when ooa2.sisaoppilaitosmainen_majoitus = 1 or ooa.sisaoppilaitosmainen_majoitus = 1 then 1 else 0 end, 
	ulkomailla = ooa.ulkomaanjakso,

	h.oppija_oid,
	h.aidinkieli,
	h.kotikunta,
	kansalaisuus = left(h.kansalaisuus, 3),
	h.syntymaaika,
	h.sukupuoli, 

	aikuisten_alkuvaihe_1_0 = case when ps.suorituksen_tyyppi = 'aikuistenperusopetuksenoppimaaranalkuvaihe' then 1 else 0 end,
	ps.koulutusmoduuli_koodiarvo,

	ooa2.erityisen_tuen_paatos_opiskelee_toiminta_alueittain,
	et.opiskelee_toiminta_alueittain

INTO sa.temp_esi_ja_perusopetus_oo

FROM sa.sa_koski_paatason_suoritus ps	
LEFT JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN sa.sa_koski_esiopetus_opiskeluoikeus_aikajakso ooa2 on ooa2.opiskeluoikeus_oid = oo.opiskeluoikeus_oid --and koulutusmuoto = 'esiopetus'
LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso_erityisen_tuen_paatos et on et.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
LEFT JOIN (
	SELECT 
		oo.opiskeluoikeus_oid, koulutusmoduuli_koodiarvo, ps.suorituksen_alkamispaiva as alku
	FROM sa.sa_koski_opiskeluoikeus oo
	LEFT JOIN sa.sa_koski_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	WHERE koulutusmuoto in ('europeanschoolofhelsinki', 'internationalschool')
) ebib on ebib.opiskeluoikeus_oid = ps.opiskeluoikeus_oid and ebib.koulutusmoduuli_koodiarvo = ps.koulutusmoduuli_koodiarvo

WHERE 
(
	ps.suorituksen_tyyppi in (
		'esiopetuksensuoritus',
		'perusopetuksenlisaopetus',
		'perusopetukseenvalmistavaopetus', 
		'aikuistenperusopetuksenoppimaara', 
		'aikuistenperusopetuksenoppimaaranalkuvaihe',
		'europeanschoolofhelsinkivuosiluokkanursery',
		'europeanschoolofhelsinkivuosiluokkaprimary',
		--'perusopetuksenvuosiluokka'
		'perusopetuksenoppimaara'
	)
	OR
	(
		ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' 
		and ps.koulutusmoduuli_koodiarvo != 'S5'
	)
	OR 
	(
		ps.suorituksen_tyyppi in (
			'internationalschoolpypvuosiluokka',
			'internationalschoolmypvuosiluokka'
		) 
		and ps.koulutusmoduuli_koodiarvo in ('explorer','1','2','3','4','5','6','7','8','9')
	)
)		 
AND oo.sisaltyy_opiskeluoikeuteen_oid is null
AND coalesce(ooa.kotiopetus, 0) = 0


-- Suorittaneet
SELECT  
	oo_alkamispaiva = CASE WHEN oo.alkamispaiva > COALESCE(ebib.alku, oo.alkamispaiva) THEN oo.alkamispaiva ELSE COALESCE(ebib.alku, oo.alkamispaiva) END,
	COALESCE(ebib.alku, ooa.alku) as alku,
	ooa.alku as ooa_alku,
	et.alku as et_alku,
	et.loppu as et_loppu,
	ooa.loppu as ooa_loppu,
	ps.vahvistus_paiva,
	ps.suorituksen_alkamispaiva,

	ps.paatason_suoritus_id,
	vuosiluokka_tai_koulutus = 
		case 
			when ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' then '201101' --rajauksessa 9lk
			when ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' then '201101' --rajauksessa 9lk
			when ps.suorituksen_tyyppi = 'aikuistenperusopetuksenoppimaaranalkuvaihe' then '20' --huom
			when ps.suorituksen_tyyppi = 'aikuistenperusopetuksenoppimaara' then '21'
			else ps.koulutusmoduuli_koodiarvo
		end,
	ps.suorituksen_tyyppi,
	ps.suoritustapa_koodi,
	suorituskieli = ps.suorituskieli_koodiarvo,
	muu_suorituskieli = ps.muut_suorituskielet_koodi,
	kielikylpykieli = ps.kielikylpykieli_koodi,
	ps.toimipiste_oid,

	oo.oppilaitos_oid,
	oo.oppilaitos_kotipaikka,
	oo.koulutustoimija_oid,
	oo.opiskeluoikeus_oid,
	oo.koulutusmuoto,
	oo.vuosiluokkiin_sitoutumaton_opetus,

	erityisen_tuen_paatos = case when ooa.erityinen_tuki = 1 or ooa.hojks = 1 then 1 else 0 end,
	erityinen_tuki_johdettu = 
		case 
			when ooa.vaikeasti_vammainen = 1 then 'ertu_v'
			when ooa.vammainen = 1 or ooa.vammainen_ja_avustaja = 1 then 'ertu_m'
			when ooa.erityinen_tuki = 1 or ooa.hojks = 1 then 'ertu_muu'
			--tehostettu_tuki -> ertu_teho
			else 'ertu_eiei'
		end,
	ooa.joustava_perusopetus,
	ooa.koulukoti,
	ooa.kotiopetus,
	ooa.kuljetusetu,
	ooa.majoitusetu,
	ooa.pidennetty_oppivelvollisuus,
	ooa.sisaoppilaitosmainen_majoitus,
	ulkomailla = ooa.ulkomaanjakso,
	
	h.oppija_oid,
	h.aidinkieli,
	h.kotikunta,
	kansalaisuus = left(h.kansalaisuus, 3),
	h.syntymaaika,
	h.sukupuoli,

	et.opiskelee_toiminta_alueittain

INTO sa.temp_esi_ja_perus_suorittaneet

FROM sa.sa_koski_paatason_suoritus ps
LEFT JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa.alku < ps.vahvistus_paiva --huom
LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso_erityisen_tuen_paatos et on et.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
LEFT JOIN (
	SELECT 
		oo.opiskeluoikeus_oid, koulutusmoduuli_koodiarvo, ps.suorituksen_alkamispaiva as alku
	FROM sa.sa_koski_opiskeluoikeus oo
	LEFT JOIN sa.sa_koski_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	WHERE koulutusmuoto in ('europeanschoolofhelsinki', 'internationalschool')
) ebib on ebib.opiskeluoikeus_oid = ps.opiskeluoikeus_oid and ebib.koulutusmoduuli_koodiarvo = ps.koulutusmoduuli_koodiarvo

WHERE ps.vahvistus_paiva is not null
AND (
	ps.suorituksen_tyyppi in (
		'perusopetuksenoppimaara', 
		'perusopetuksenlisaopetus', 
		'perusopetukseenvalmistavaopetus', 
		'aikuistenperusopetuksenoppimaara', 
		'aikuistenperusopetuksenoppimaaranalkuvaihe'
	) 
	OR 
	(
		ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka'
		and ps.koulutusmoduuli_koodiarvo = '9'
		and coalesce(ps.jaa_luokalle, 0) = 0
	)
	OR
	(
		ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower'
		and ps.koulutusmoduuli_koodiarvo = 'S4'
		and coalesce(ps.jaa_luokalle, 0) = 0
	)
) 
AND oo.sisaltyy_opiskeluoikeuteen_oid is null


--
TRUNCATE TABLE dbo.esi_ja_perus_oppilaat_ja_paattaneet_valitaulu

WHILE @alkuPvm <= @endOfLoop

BEGIN

	--oppilaat

	INSERT INTO dbo.esi_ja_perus_oppilaat_ja_paattaneet_valitaulu

	SELECT DISTINCT
	  
		[opisk]
		,[tutk]
	
		,[vuosi]
		,[kuukausi]
		,[oo_alkamispaiva]

		--ps
		,[paatason_suoritus_id]
		,[jaa_luokalle]
		,[vuosiluokka_tai_koulutus]
		,[suorituksen_tyyppi]
		,[suoritustapa] = [suoritustapa_koodi]
		,[vahvistus_paiva]
		,[suorituskieli]
		,[muu_suorituskieli]
		,[kielikylpykieli]
		,[toimipiste_oid]
	
		--oo
		,[oppilaitos_oid]
		,[oppilaitos_kotipaikka]
		,[koulutustoimija_oid]
		,[opiskeluoikeus_oid]
		,[koulutusmuoto]
		,[vuosiluokkiin_sitoutumaton_opetus] --livetieto, tyhjätään oppilailta muut paitsi kuluva lukuvuosi

		--ooa
		,erityisen_tuen_paatos
		,erityinen_tuki_johdettu 
		,joustava_perusopetus --jyräytyvä, ei haitanne
		,koulukoti
		,kuljetusetu --jyräytyvä, raportoidaan vain jäädytyksistä (tyhjätään oppilailta muut paitsi kuluva lukuvuosi)
		,majoitusetu --jyräytyvä, raportoidaan vain jäädytyksistä (tyhjätään oppilailta muut paitsi kuluva lukuvuosi)
		,pidennetty_oppivelvollisuus
		,sisaoppilaitosmainen_majoitus
		,ulkomailla --ei raportilla asti, huom. osalla ei myöskään aikajaksoja ulkomaanjakson aikaan
		,opiskelee_toiminta_alueittain

		--h
		,[oppija_oid]
		,[aidinkieli]
		,[kotikunta]
		,[kansalaisuus]
		,[ika]
		,[sukupuoli]

		--
		,[tilastopaiva_1_0]
		,[aikuisten_alkuvaihe_1_0]
		,[oppivelvollinen]
	
	FROM (

		SELECT 
			opisk = 1,
			tutk = null,

			vuosi = year(@alkuPvm),
			kuukausi = month(@alkuPvm),
			epo.oo_alkamispaiva,

			--huom.
			paatason_suoritus_id = coalesce(oa.paatason_suoritus_id, epo.paatason_suoritus_id),
			jaa_luokalle = coalesce(oa.jaa_luokalle, epo.jaa_luokalle),
			vuosiluokka_tai_koulutus = coalesce(nullif(epo.vuosiluokka_tai_koulutus, '201101'), oa.vuosiluokka, 'x'),
			epo.suorituksen_tyyppi,
			epo.suoritustapa_koodi,
			vahvistus_paiva = coalesce(oa.vahvistus_paiva_muokattu, epo.vahvistus_paiva),
			suorituskieli = coalesce(oa.suorituskieli, epo.suorituskieli),
			muu_suorituskieli = coalesce(oa.muu_suorituskieli, epo.muu_suorituskieli), 
			kielikylpykieli = coalesce(oa.kielikylpykieli, epo.kielikylpykieli),
			toimipiste_oid = coalesce(oa.toimipiste_oid, epo.toimipiste_oid),
			--

			epo.oppilaitos_oid,
			epo.oppilaitos_kotipaikka,
			epo.koulutustoimija_oid,
			epo.opiskeluoikeus_oid,
			epo.koulutusmuoto,
			epo.vuosiluokkiin_sitoutumaton_opetus,

			epo.erityisen_tuen_paatos,
			epo.erityinen_tuki_johdettu,
			epo.joustava_perusopetus,
			epo.koulukoti,
			epo.kotiopetus,
			epo.kuljetusetu,
			epo.majoitusetu,
			epo.pidennetty_oppivelvollisuus,
			epo.sisaoppilaitosmainen_majoitus,
			epo.ulkomailla,
				
			opiskelee_toiminta_alueittain =
				case 
					when epo.erityisen_tuen_paatos_opiskelee_toiminta_alueittain = 1 then 1
					when epo.opiskelee_toiminta_alueittain = 1
						and epo.et_alku <= @loppuPvm 
						and epo.et_alku <= epo.ooa_loppu
						and coalesce(epo.et_loppu, '9999-12-31') >= @alkuPvm 
						and coalesce(epo.et_loppu, '9999-12-31') >= CASE WHEN epo.ooa_alku > epo.alku THEN epo.alkamispaiva ELSE epo.alku END 
					then 1
					else 0
				end,

			epo.oppija_oid,
			epo.aidinkieli,
			epo.kotikunta,
			epo.kansalaisuus, 
			ika = year(@alkuPvm) - year(epo.syntymaaika),
			epo.sukupuoli,

			tilastopaiva_1_0 =	
				case 
					when month(@alkuPvm) = 9 
						and (
							(@tilastoPvm between CASE WHEN epo.ooa2_alku > epo.alku2 THEN epo.alkamispaiva ELSE epo.alku2 END and coalesce(epo.ooa2_loppu, '9999-12-31') and epo.ooa2_tila = 'lasna')
							or (@tilastoPvm between CASE WHEN epo.ooa_alku > epo.alku THEN epo.alkamispaiva ELSE epo.alku END and coalesce(epo.ooa_loppu, '9999-12-31') and epo.tila = 'lasna')
						)
					then 1 
					else 0 
				end,
			epo.aikuisten_alkuvaihe_1_0,
			oppivelvollinen = case when ov.oppija_oid is not null then 1 else 0 end
			
		FROM sa.temp_esi_ja_perusopetus_oo epo
		OUTER APPLY (
			--max vuosiluokka ja sen suorituskohtaiset taustatiedot
			select top 1
				ps.paatason_suoritus_id,
				ps.jaa_luokalle,
				vahvistus_paiva_muokattu = case when ps.vahvistus_paiva > epo.paattymispaiva then dateadd(day, -1, epo.paattymispaiva) else dateadd(day, -1, ps.vahvistus_paiva) end,
				suorituskieli = ps.suorituskieli_koodiarvo, 
				muu_suorituskieli = left(ps.muut_suorituskielet_koodi, 2), 
				kielikylpykieli = ps.kielikylpykieli_koodi, 
				ps.toimipiste_oid,
				vuosiluokka = ps.koulutusmoduuli_koodiarvo
			from sa.sa_koski_paatason_suoritus ps 
			where ps.opiskeluoikeus_oid = epo.opiskeluoikeus_oid
			and ps.suorituksen_tyyppi = 'perusopetuksenvuosiluokka'
			and ps.suorituksen_alkamispaiva <= @loppuPvm and coalesce(ps.vahvistus_paiva, '9999-12-31') >= @alkuPvm
			and ps.suorituksen_alkamispaiva <= epo.ooa_loppu and coalesce(ps.vahvistus_paiva, '9999-12-31') >= epo.ooa_alku
			order by ps.koulutusmoduuli_koodiarvo desc
		) oa
		LEFT JOIN sa.sa_oppivelvolliset_esi_ja_perusopetus ov on ov.oppija_oid = epo.oppija_oid and @alkuPvm BETWEEN ov.alkuPvm and ov.loppuPvm
		
		WHERE 1=1
		AND coalesce(epo.vahvistus_paiva, '9999-12-31') >= @alkuPvm
		AND (
			(CASE WHEN epo.ooa2_alku > epo.alku2 THEN epo.ooa2_alku ELSE epo.alku2 END <= @loppuPvm and coalesce(epo.ooa2_loppu, '9999-12-31') >= @alkuPvm AND epo.ooa2_tila = 'lasna')
			OR (CASE WHEN epo.ooa_alku > epo.alku THEN epo.ooa_alku ELSE epo.alku END <= @loppuPvm and coalesce(epo.ooa_loppu, '9999-12-31') >= @alkuPvm AND epo.tila = 'lasna')
		)
		AND NOT (
			epo.suorituksen_tyyppi = 'perusopetuksenlisaopetus' 
			and @alkupvm >= '2022-08-01'
		)		 
		--tuvaopiskelijat pois myös muista perusopetuksen koulutuksista
		AND NOT EXISTS (
			SELECT 1
			FROM sa.tuva_lasna_loma_jaksot tuvat 
			WHERE tuvat.oppija_oid = epo.oppija_oid
			and tuvat.alku <= @loppuPvm and tuvat.loppu >= @alkuPvm 
			and tuvat.alku <= epo.ooa_loppu and tuvat.loppu >= epo.ooa_alku
		)
		--vuosiluokattomat pois kesän ajalta ml. elokuun aikana päättyviltä, yleensä ed. lukuvuoden aikajaksoilta
		AND NOT (
			oa.vuosiluokka is null
			and epo.vuosiluokka_tai_koulutus = '201101'
			and (
				month(@alkuPvm) between 6 and 7
				or (
					month(@alkuPvm) = 8
					and epo.ooa_loppu < @loppuPvm
				)
			)
		)

	) q 

	
	--tutkinnot

	INSERT INTO dbo.esi_ja_perus_oppilaat_ja_paattaneet_valitaulu

	SELECT DISTINCT
	  
		[opisk]
		,[tutk]
	
		,[vuosi]
		,[kuukausi]
		,[oo_alkamispaiva]

		--ps
		,[paatason_suoritus_id]
		,[jaa_luokalle] = null
		,[vuosiluokka_tai_koulutus]
		,[suorituksen_tyyppi]
		,[suoritustapa] = [suoritustapa_koodi]
		,[vahvistus_paiva]
		,[suorituskieli]
		,[muu_suorituskieli]
		,[kielikylpykieli]
		,[toimipiste_oid]

		--oo
		,[oppilaitos_oid]
		,[oppilaitos_kotipaikka]
		,[koulutustoimija_oid]
		,[opiskeluoikeus_oid]
		,[koulutusmuoto]
		,[vuosiluokkiin_sitoutumaton_opetus]

		--ooa
		,erityisen_tuen_paatos
		,erityinen_tuki_johdettu 
		,joustava_perusopetus
		,koulukoti
		,kuljetusetu
		,majoitusetu
		,pidennetty_oppivelvollisuus
		,sisaoppilaitosmainen_majoitus
		,ulkomailla
		,opiskelee_toiminta_alueittain

		--h
		,[oppija_oid]
		,[aidinkieli]
		,[kotikunta]
		,[kansalaisuus]
		,[ika]
		,[sukupuoli]

		--
		,[tilastopaiva_1_0]
		,[aikuisten_alkuvaihe_1_0]
		,[oppivelvollinen]
	
	FROM (
	
		SELECT  

			opisk = null,
			tutk = 1,
		
			vuosi = year(@alkuPvm),
			kuukausi = month(@alkuPvm),
			epo.oo_alkamispaiva,

			epo.paatason_suoritus_id,
			epo.vuosiluokka_tai_koulutus,
			epo.suorituksen_tyyppi,
			epo.suoritustapa_koodi,
			epo.vahvistus_paiva,
			epo.suorituskieli,
			epo.muu_suorituskieli,
			epo.kielikylpykieli,
			epo.toimipiste_oid,

			epo.oppilaitos_oid,
			epo.oppilaitos_kotipaikka,
			epo.koulutustoimija_oid,
			epo.opiskeluoikeus_oid,
			epo.koulutusmuoto,
			epo.vuosiluokkiin_sitoutumaton_opetus,

			epo.erityisen_tuen_paatos,
			epo.erityinen_tuki_johdettu,
			epo.joustava_perusopetus,
			epo.koulukoti,
			epo.kotiopetus,
			epo.kuljetusetu,
			epo.majoitusetu,
			epo.pidennetty_oppivelvollisuus,
			epo.sisaoppilaitosmainen_majoitus,
			epo.ulkomailla,
		
			opiskelee_toiminta_alueittain =
				case 
					when epo.opiskelee_toiminta_alueittain = 1
						and epo.et_alku <= @loppuPvm 
						and epo.et_alku <= epo.ooa_loppu
						and epo.et_alku <= epo.vahvistus_paiva --huom
						and coalesce(epo.et_loppu, '9999-12-31') >= @alkuPvm 
						and coalesce(epo.et_loppu, '9999-12-31') >= CASE WHEN epo.ooa_alku > epo.alku THEN epo.ooa_alku ELSE epo.alku END  
					then 1
					else 0
				end,

			epo.oppija_oid,
			epo.aidinkieli,
			epo.kotikunta,
			epo.kansalaisuus,
			ika = year(@alkuPvm) - year(epo.syntymaaika),
			epo.sukupuoli,

			tilastopaiva_1_0 = null,
			aikuisten_alkuvaihe_1_0 = null,
			oppivelvollinen = case when ov.oppija_oid is not null then 1 else 0 end,
			
			--taustatiedot viimeisimmästä aikajaksosta suoritukseen nähden
			rnk = rank() over (partition by epo.opiskeluoikeus_oid order by CASE WHEN epo.ooa_alku > epo.alku THEN epo.ooa_alku ELSE epo.alku END desc) 

		FROM sa.temp_esi_ja_perus_suorittaneet epo
		LEFT JOIN sa.sa_oppivelvolliset_esi_ja_perusopetus ov on ov.oppija_oid = epo.oppija_oid and @alkuPvm BETWEEN ov.alkuPvm and ov.loppuPvm

		WHERE 1=1
		AND epo.vahvistus_paiva between @alkuPvm and @loppuPvm
		AND NOT (
			epo.suorituksen_tyyppi = 'perusopetuksenlisaopetus' 
			and @alkupvm >= '2022-08-01'
		)

	) q

	WHERE rnk = 1 
							

	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)
	SET @loppuPvm = EOMONTH(@alkuPvm)
	SET @tilastoPvm = DATEFROMPARTS(YEAR(@alkuPvm), 9, 20)

END


DROP TABLE IF EXISTS sa.temp_esi_ja_perusopetus_oo
DROP TABLE IF EXISTS sa.temp_esi_ja_perus_suorittaneet

GO
