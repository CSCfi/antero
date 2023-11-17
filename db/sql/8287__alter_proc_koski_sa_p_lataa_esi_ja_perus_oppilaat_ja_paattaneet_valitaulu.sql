USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_esi_ja_perus_oppilaat_ja_paattaneet_valitaulu]    Script Date: 15.11.2023 15:27:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_esi_ja_perus_oppilaat_ja_paattaneet_valitaulu] AS

/*
- Tutkintopoiminnassa osin eri logiikka kuin oppilaissa; ks. tarvittaessa vuosiluokka, ranki sekä huom-kohdat.
- Lisää tarvittaessa koulutuksia vuosiluokkapäättelyyn ja -dimensioon.
- Osa tiedoista raportoidaan oppilaille vain kuluvalta lukuvuodelta; rajaukset alustetaan faktalatauksessa ja toteutetaan näkymässä.
*/

DECLARE @alkuPvm as date, @loppuPvm as date, @tilastoPvm as date, @endOfLoop as date, @palvelinpaate as varchar(4)

-- Jäädytyksen jälkeen ..arch-palvelimella ladataan vain 1.10.vvvv-1 - 30.9.vvvv.
SET @palvelinpaate = (select right(@@servername,4))
IF @palvelinpaate = 'arch'
BEGIN
	SET @alkuPvm = DATEFROMPARTS(right(db_name(),4)-1, 10, 1)
	SET @loppuPvm = EOMONTH(@alkuPvm)
	SET @tilastoPvm = DATEFROMPARTS(right(db_name(),4), 9, 20)
	SET @endOfLoop = EOMONTH(@tilastoPvm)
END
ELSE
BEGIN
	SET @alkuPvm = '2017-08-01' --'2019-08-01'
	SET @loppuPvm = EOMONTH(@alkuPvm)
	SET @tilastoPvm = DATEFROMPARTS(YEAR(@alkuPvm), 9, 20)
	SET @endOfLoop = DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)
END


TRUNCATE TABLE dbo.esi_ja_perus_oppilaat_ja_paattaneet_valitaulu

WHILE @alkuPvm <= @endOfLoop

BEGIN

	INSERT INTO dbo.esi_ja_perus_oppilaat_ja_paattaneet_valitaulu

	SELECT DISTINCT
	  
		[opisk]
		,[tutk]
	
		,[vuosi]
		,[kuukausi]
		,[oo_alkamispaiva]

		--ps
		,[paatason_suoritus_id]
		,[vuosiluokka_tai_koulutus]
		,[suorituksen_tyyppi]
		,[suoritustapa] = [suoritustapa_koodi]
		,[suorituskieli]
		,[muu_suorituskieli]
		,[kielikylpykieli] = [kielikylpykieli_koodi]
		--,jaa_luokalle --jyräytyvä, tarvittaessa purettava päätason suorituksesta
		,[toimipiste_oid]
	
		--oo
		,[oppilaitos_oid]
		,[koulutustoimija_oid]
		,[opiskeluoikeus_oid]
		,[koulutusmuoto]
		,[vuosiluokkiin_sitoutumaton_opetus] --livetieto, tyhjätään oppilailta muut paitsi kuluva lukuvuosi

		--ooa
		,erityisen_tuen_paatos
		,erityinen_tuki_johdettu 
		,joustava_perusopetus --jyräytyvä, ei haitanne
		,koulukoti
		,kuljetusetu --jyräytyvä, tyhjätään oppilailta muut paitsi kuluva lukuvuosi
		,pidennetty_oppivelvollisuus --jyräytyvä, ei haitanne
		,sisaoppilaitosmainen_majoitus
		,tehostettu_tuki --nullattu, mahdollista tulevaisuuden raportointia varten kuitenkin logiikka yhä alla
		,ulkomailla --ei raportilla asti, huom. osalla ei myöskään aikajaksoja ulkomaanjakson aikaan
		,opiskelee_toiminta_alueittain

		--h
		,[oppija_oid]
		,[aidinkieli]
		,[kansalaisuus]
		,[ika]
		,[sukupuoli]

		--
		,[tilastopaiva_1_0]
		,[aikuisten_alkuvaihe_1_0]
	
	FROM (
	  
		--opiskelijat
		SELECT 

			opisk = 1
			,tutk = null

			,vuosi = year(@alkuPvm)
			,kuukausi = month(@alkuPvm)
			,oo_alkamispaiva = CASE WHEN oo.alkamispaiva > COALESCE(ebib.alku, oo.alkamispaiva) THEN oo.alkamispaiva ELSE COALESCE(ebib.alku, oo.alkamispaiva) END

			,ps.paatason_suoritus_id
			--koulutuksen tarkin taso; oppilaissa aikuisten alkuvaihe erotetaan k/e-muuttujalla; dimensiossa myös karkeammat ryhmittelyt
			,vuosiluokka_tai_koulutus = 
				case 
					when ps.koulutusmoduuli_koodiarvo = 'explorer' and ps.suorituksen_tyyppi = 'internationalschoolpypvuosiluokka' then '001101'
					when ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkanursery' THEN '001101'
					WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkaprimary' THEN RIGHT(ps.koulutusmoduuli_koodiarvo,1)
					WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' THEN CAST(CAST(RIGHT(ps.koulutusmoduuli_koodiarvo,1) as int) + 5 as varchar)
					when ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaaranalkuvaihe') then '21' --ei löydy koulk
					--when ps.suorituksen_tyyppi in (
					--	'esiopetuksensuoritus', --001101 / 001102
					--	'internationalschoolpypvuosiluokka', --1-9
					--	'internationalschoolmypvuosiluokka', --1-9
					--	'perusopetuksenvuosiluokka', --1-9
					--	'perusopetuksenlisaopetus', --020075
					----	'tuvakoulutuksensuoritus', --999908
					--	'perusopetukseenvalmistavaopetus' --999905
					--) then 
					else ps.koulutusmoduuli_koodiarvo
				end 
			,ps.suorituksen_tyyppi
			,ps.suoritustapa_koodi
			,suorituskieli = ps.suorituskieli_koodiarvo
			,muu_suorituskieli = left(ps.muut_suorituskielet_koodi,2)
			,ps.kielikylpykieli_koodi
			,ps.toimipiste_oid

			,oo.oppilaitos_oid
			,oo.koulutustoimija_oid
			,oo.opiskeluoikeus_oid
			,oo.koulutusmuoto
			,oo.vuosiluokkiin_sitoutumaton_opetus

			,erityisen_tuen_paatos = case when ooa2.erityisen_tuen_paatos = 1 or ooa.erityinen_tuki = 1 or ooa.hojks = 1 then 1 else 0 end 
			,erityinen_tuki_johdettu = 
			--TK-dimensio
				case 
					when ooa2.vaikeasti_vammainen = 1 or ooa.vaikeasti_vammainen = 1 then 'ertu_v'
					when ooa2.vammainen = 1 or ooa.vammainen = 1 or ooa.vammainen_ja_avustaja = 1 /*or ooa2.vammainen_ja_avustaja = 1*/ then 'ertu_m'
					when ooa2.erityisen_tuen_paatos = 1 or ooa.erityinen_tuki = 1 or ooa.hojks = 1 then 'ertu_muu'
					--tehostettu_tuki -> ertu_teho
					else 'ertu_eiei'
				end
			,ooa.joustava_perusopetus
			,koulukoti = case when ooa2.koulukoti = 1 or ooa.koulukoti = 1 then 1 else 0 end 
			,ooa.kotiopetus /*= 
				case 
					when kj.kotiopetus_alku <= @loppuPvm 
						and kj.kotiopetus_alku <= coalesce(ooa.loppu, '9999-12-31')
						and coalesce(kj.kotiopetus_loppu, '9999-12-31') >= @alkuPvm 
						and coalesce(kj.kotiopetus_loppu, '9999-12-31') >= CASE WHEN ooa.alku > COALESCE(ebib.alku, ooa.alku) THEN oo.alkamispaiva ELSE COALESCE(ebib.alku, ooa.alku) END
					then 1
					else 0
				end*/
			,kuljetusetu = case when ooa2.kuljetusetu = 1 or ooa.kuljetusetu = 1 then 1 else 0 end 
			,pidennetty_oppivelvollisuus = case when ooa2.pidennetty_oppivelvollisuus = 1 or ooa.pidennetty_oppivelvollisuus = 1 then 1 else 0 end 
			,sisaoppilaitosmainen_majoitus = case when ooa2.sisaoppilaitosmainen_majoitus = 1 or ooa.sisaoppilaitosmainen_majoitus = 1 then 1 else 0 end 
			,tehostettu_tuki = null
				/*case 
					when tj.alku <= @loppuPvm 
						and tj.alku <= coalesce(ooa.loppu, '9999-12-31')
						and coalesce(tj.loppu, '9999-12-31') >= @alkuPvm 
						and coalesce(tj.loppu, '9999-12-31') >= CASE WHEN ooa.alku > COALESCE(ebib.alku, ooa.alku) THEN oo.alkamispaiva ELSE COALESCE(ebib.alku, ooa.alku) END
					then 1
					else 0
				end*/
			,ulkomailla = ooa.ulkomaanjakso /*
				case 
					when uj.alku <= @loppuPvm 
						and uj.alku <= coalesce(ooa.loppu, '9999-12-31')
						and coalesce(uj.loppu, '9999-12-31') >= @alkuPvm 
						and coalesce(uj.loppu, '9999-12-31') >= CASE WHEN ooa.alku > COALESCE(ebib.alku, ooa.alku) THEN oo.alkamispaiva ELSE COALESCE(ebib.alku, ooa.alku) END
					then 1
					else 0
				end*/
			,opiskelee_toiminta_alueittain =
				case 
					when ooa2.erityisen_tuen_paatos_opiskelee_toiminta_alueittain = 1 then 1
					when et.opiskelee_toiminta_alueittain = 1
						and et.alku <= @loppuPvm 
						and et.alku <= coalesce(ooa.loppu, '9999-12-31')
						and coalesce(et.loppu, '9999-12-31') >= @alkuPvm 
						and coalesce(et.loppu, '9999-12-31') >= CASE WHEN ooa.alku > COALESCE(ebib.alku, ooa.alku) THEN oo.alkamispaiva ELSE COALESCE(ebib.alku, ooa.alku) END 
					then 1
					else 0
				end

			,h.oppija_oid
			,h.aidinkieli
			,kansalaisuus = left(h.kansalaisuus, 3)
			,ika = year(@alkuPvm) - year(h.syntymaaika)
			,h.sukupuoli 

			,tilastopaiva_1_0 =	
				case 
					when month(@alkuPvm) = 9 
						and (
							(@tilastoPvm between CASE WHEN ooa2.alku > COALESCE(ebib.alku, ooa2.alku) THEN oo.alkamispaiva ELSE COALESCE(ebib.alku, ooa2.alku) END and coalesce(ooa2.loppu, '9999-12-31') and ooa2.tila = 'lasna')
							or (@tilastoPvm between CASE WHEN ooa.alku > COALESCE(ebib.alku, ooa.alku) THEN oo.alkamispaiva ELSE COALESCE(ebib.alku, ooa.alku) END and coalesce(ooa.loppu, '9999-12-31') and ooa.tila = 'lasna')
						)
					then 1 
					else 0 
				end	
			,aikuisten_alkuvaihe_1_0 = case when ps.suorituksen_tyyppi = 'aikuistenperusopetuksenoppimaaranalkuvaihe' then 1 else 0 end
	  
			--päälle jääneet vuosiluokat pois
			,ranki = 
				case 
					when ps.suorituksen_tyyppi <> 'perusopetuksenvuosiluokka' then 1 
					else rank() over(partition by oo.oppija_oid, ps.suorituksen_tyyppi order by ps.koulutusmoduuli_koodiarvo desc)
				end
		
		FROM sa.sa_koski_paatason_suoritus ps	
		LEFT JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
		LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_esiopetus_opiskeluoikeus_aikajakso ooa2 on ooa2.opiskeluoikeus_oid = oo.opiskeluoikeus_oid --and koulutusmuoto = 'esiopetus'
		--LEFT JOIN sa.sa_koski_tehostetun_tuen_jaksot tj on tj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		--LEFT JOIN sa.sa_koski_ulkomaanjaksot uj on uj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		--LEFT JOIN sa.sa_koski_perusopetuksen_kotiopetusjaksot kj on kj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso_erityisen_tuen_paatos et on et.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
		LEFT JOIN (
			SELECT 
				oo.opiskeluoikeus_oid, koulutusmoduuli_koodiarvo, ps.suorituksen_alkamispaiva as alku
			FROM sa.sa_koski_opiskeluoikeus oo
			LEFT JOIN sa.sa_koski_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
			WHERE koulutusmuoto in ('europeanschoolofhelsinki', 'internationalschool')
		) ebib on ebib.opiskeluoikeus_oid = ps.opiskeluoikeus_oid and ebib.koulutusmoduuli_koodiarvo = ps.koulutusmoduuli_koodiarvo
		
		WHERE 1=1 --@alkupvm >= '2020-08-01' 
		AND coalesce(ps.vahvistus_paiva, '9999-12-31') >= @alkuPvm
		AND (
			ps.suorituksen_tyyppi in (
				'esiopetuksensuoritus',
				--'perusopetuksenlisaopetus',
				'perusopetukseenvalmistavaopetus', 
				'aikuistenperusopetuksenoppimaara', 
				'aikuistenperusopetuksenoppimaaranalkuvaihe',
				'europeanschoolofhelsinkivuosiluokkanursery',
				'europeanschoolofhelsinkivuosiluokkaprimary'
			)
			OR
			(
				ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo <> 'S5'
			)
			OR 
			(
				ps.suorituksen_tyyppi in (
					'internationalschoolpypvuosiluokka',
					'internationalschoolmypvuosiluokka'
				) 
				and ps.koulutusmoduuli_koodiarvo in ('explorer','1','2','3','4','5','6','7','8','9')
			)
			OR 
			(
				ps.suorituksen_tyyppi = 'perusopetuksenvuosiluokka' 
				and ps.suorituksen_alkamispaiva <= @loppuPvm --rankia varten
			)
			--1.8.2022 alkaen TUVA, jota ei raportoida perusopetuksen yhteydessä
			OR
			(
				ps.suorituksen_tyyppi = 'perusopetuksenlisaopetus' 
				and @alkupvm < '2022-08-01' 
			)
		)		 
		AND (
			(CASE WHEN ooa2.alku > COALESCE(ebib.alku, ooa2.alku) THEN ooa2.alku ELSE COALESCE(ebib.alku, ooa2.alku) END <= @loppuPvm and coalesce(ooa2.loppu, '9999-12-31') >= @alkuPvm AND ooa2.tila = 'lasna')
			OR (CASE WHEN ooa.alku > COALESCE(ebib.alku, ooa.alku) THEN ooa.alku ELSE COALESCE(ebib.alku, ooa.alku) END <= @loppuPvm and coalesce(ooa.loppu, '9999-12-31') >= @alkuPvm AND ooa.tila = 'lasna')
		)
		--tuvaopiskelijat pois myös muista perusopetuksen koulutuksista
		AND NOT EXISTS (
			SELECT * FROM sa.tuva_lasna_loma_jaksot tuvat 
			WHERE tuvat.oppija_oid = oo.oppija_oid
			and tuvat.alku <= @loppuPvm and tuvat.loppu >= @alkuPvm 
			and tuvat.alku <= ooa.loppu and tuvat.loppu >= ooa.alku
		)
		AND oo.sisaltyy_opiskeluoikeuteen_oid is null
		AND ooa.kotiopetus = 0


		UNION ALL

	
		--tutkinnot
		SELECT  

			opisk = null
			,tutk = 1
		
			,vuosi = year(@alkuPvm)
			,kuukausi = month(@alkuPvm)
			,oo_alkamispaiva = CASE WHEN oo.alkamispaiva > COALESCE(ebib.alku, oo.alkamispaiva) THEN oo.alkamispaiva ELSE COALESCE(ebib.alku, oo.alkamispaiva) END

			,ps.paatason_suoritus_id
			,vuosiluokka_tai_koulutus = 
				case 
					when ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' then '201101' --rajauksessa 9lk
					when ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' then '201101' --rajauksessa 9lk
					when ps.suorituksen_tyyppi = 'aikuistenperusopetuksenoppimaaranalkuvaihe' then '20' --huom
					when ps.suorituksen_tyyppi = 'aikuistenperusopetuksenoppimaara' then '21'
					else ps.koulutusmoduuli_koodiarvo
				end
			,ps.suorituksen_tyyppi
			,ps.suoritustapa_koodi
			,suorituskieli = ps.suorituskieli_koodiarvo
			,muu_suorituskieli = left(ps.muut_suorituskielet_koodi,2)
			,ps.kielikylpykieli_koodi
			,ps.toimipiste_oid

			,oo.oppilaitos_oid
			,oo.koulutustoimija_oid
			,oo.opiskeluoikeus_oid
			,oo.koulutusmuoto
			,oo.vuosiluokkiin_sitoutumaton_opetus

			,erityisen_tuen_paatos = case when ooa.erityinen_tuki = 1 or ooa.hojks = 1 then 1 else 0 end
			,erityinen_tuki_johdettu = 
				case 
					when ooa.vaikeasti_vammainen = 1 then 'ertu_v'
					when ooa.vammainen = 1 or ooa.vammainen_ja_avustaja = 1 then 'ertu_m'
					when ooa.erityinen_tuki = 1 or ooa.hojks = 1 then 'ertu_muu'
					--tehostettu_tuki -> ertu_teho
					else 'ertu_eiei'
				end
			,ooa.joustava_perusopetus
			,ooa.koulukoti
			,ooa.kotiopetus /*= 
				case 
					when kj.kotiopetus_alku <= @loppuPvm 
						and kj.kotiopetus_alku <= ooa.loppu
						and kj.kotiopetus_alku <= ps.vahvistus_paiva --huom
						and coalesce(kj.kotiopetus_loppu,'9999-12-31') >= @alkuPvm 
						and coalesce(kj.kotiopetus_loppu,'9999-12-31') >= CASE WHEN ooa.alku > COALESCE(ebib.alku, ooa.alku) THEN ooa.alku ELSE COALESCE(ebib.alku, ooa.alku) END 
					then 1
					else 0
				end*/
			,ooa.kuljetusetu
			,ooa.pidennetty_oppivelvollisuus
			,ooa.sisaoppilaitosmainen_majoitus
			,tehostettu_tuki = null
				/*case 
					when tj.alku <= @loppuPvm 
						and tj.alku <= ooa.loppu
						and tj.alku <= ps.vahvistus_paiva --huom
						and coalesce(tj.loppu,'9999-12-31') >= @alkuPvm 
						and coalesce(tj.loppu,'9999-12-31') >= CASE WHEN ooa.alku > COALESCE(ebib.alku, ooa.alku) THEN ooa.alku ELSE COALESCE(ebib.alku, ooa.alku) END 
					then 1
					else 0
				end*/
			,ulkomailla = ooa.ulkomaanjakso /*
				case 
					when uj.alku <= @loppuPvm 
						and uj.alku <= ooa.loppu
						and uj.alku <= ps.vahvistus_paiva --huom
						and coalesce(uj.loppu,'9999-12-31') >= @alkuPvm 
						and coalesce(uj.loppu,'9999-12-31') >= CASE WHEN ooa.alku > COALESCE(ebib.alku, ooa.alku) THEN ooa.alku ELSE COALESCE(ebib.alku, ooa.alku) END 
					then 1
					else 0
				end*/
			,opiskelee_toiminta_alueittain =
				case 
					when et.opiskelee_toiminta_alueittain = 1
						and et.alku <= @loppuPvm 
						and et.alku <= ooa.loppu
						and et.alku <= ps.vahvistus_paiva --huom
						and coalesce(et.loppu, '9999-12-31') >= @alkuPvm 
						and coalesce(et.loppu, '9999-12-31') >= CASE WHEN ooa.alku > COALESCE(ebib.alku, ooa.alku) THEN ooa.alku ELSE COALESCE(ebib.alku, ooa.alku) END  
					then 1
					else 0
				end

			,h.oppija_oid
			,h.aidinkieli
			,kansalaisuus = left(h.kansalaisuus, 3)
			,ika = year(@alkuPvm) - year(h.syntymaaika)
			,h.sukupuoli

			,tilastopaiva_1_0 = null
			,aikuisten_alkuvaihe_1_0 = null

			--taustatiedot viimeisimmästä aikajaksosta suoritukseen nähden
			,ranki = rank() over(partition by oo.opiskeluoikeus_oid order by CASE WHEN ooa.alku > COALESCE(ebib.alku, ooa.alku) THEN ooa.alku ELSE COALESCE(ebib.alku, ooa.alku) END  desc) 
		
		FROM sa.sa_koski_paatason_suoritus ps
		LEFT JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
		LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa.alku <= ps.vahvistus_paiva --huom
		--LEFT JOIN sa.sa_koski_tehostetun_tuen_jaksot tj on tj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		--LEFT JOIN sa.sa_koski_ulkomaanjaksot uj on uj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		--LEFT JOIN sa.sa_koski_perusopetuksen_kotiopetusjaksot kj on kj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso_erityisen_tuen_paatos et on et.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
		LEFT JOIN (
			SELECT 
				oo.opiskeluoikeus_oid, koulutusmoduuli_koodiarvo, ps.suorituksen_alkamispaiva as alku
			FROM sa.sa_koski_opiskeluoikeus oo
			LEFT JOIN sa.sa_koski_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
			WHERE koulutusmuoto in ('europeanschoolofhelsinki', 'internationalschool')
		) ebib on ebib.opiskeluoikeus_oid = ps.opiskeluoikeus_oid and ebib.koulutusmoduuli_koodiarvo = ps.koulutusmoduuli_koodiarvo

		WHERE ps.vahvistus_paiva between @alkuPvm and @loppuPvm
		AND (
			ps.suorituksen_tyyppi in (
				'perusopetuksenoppimaara', 
				--'perusopetuksenlisaopetus', 
				'perusopetukseenvalmistavaopetus', 
				'aikuistenperusopetuksenoppimaara', 
				'aikuistenperusopetuksenoppimaaranalkuvaihe'
			) 
			OR 
			(
				ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka'
				and ps.koulutusmoduuli_koodiarvo = '9'
			)
			OR
			(
				ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower'
				and ps.koulutusmoduuli_koodiarvo = 'S4'
			)
			--1.8.2022 alkaen TUVA, jota ei raportoida perusopetuksen yhteydessä
			OR
			(
				ps.suorituksen_tyyppi = 'perusopetuksenlisaopetus' 
				and @alkupvm < '2022-08-01' 
			)
		) 
		AND oo.sisaltyy_opiskeluoikeuteen_oid is null
		AND ooa.kotiopetus = 0

	) q

	WHERE ranki = 1 
																	 

	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)
	SET @loppuPvm = EOMONTH(@alkuPvm)
	SET @tilastoPvm = DATEFROMPARTS(YEAR(@alkuPvm), 9, 20)

END


GO
