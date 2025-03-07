USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_esi_ja_perus_oppilaat_ja_paattaneet_valitaulu]    Script Date: 1.3.2022 14:32:21 ******/
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

DECLARE @alkuPvm as date, @loppuPvm as date, @tilastoPvm as date

SET @alkuPvm = '2017-08-01' --'2019-08-01'
SET @loppuPvm = EOMONTH(@alkuPvm)
SET @tilastoPvm = DATEFROMPARTS(YEAR(@alkuPvm), 9, 20)

TRUNCATE TABLE dbo.esi_ja_perus_oppilaat_ja_paattaneet_valitaulu

WHILE @alkuPvm <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)

BEGIN

	INSERT INTO dbo.esi_ja_perus_oppilaat_ja_paattaneet_valitaulu

	SELECT DISTINCT
	  
		[opisk]
		,[tutk]
	
		,[vuosi]
		,[kuukausi]

		--ps
		--,[koulutuskoodi]
		,[vuosiluokka_tai_koulutus]
		,[suorituksen_tyyppi]
		,[suoritustapa] = [suoritustapa_koodi]
		,[suorituskieli]
		,[muu_suorituskieli]
		,[kielikylpykieli] = [kielikylpykieli_koodi]
		--,jaa_luokalle --jyräytyvä, tarvittaessa puretaan päätason suorituksesta (alla kommentoituna ad hoc -poiminta)
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
		,kotiopetus
		,kuljetusetu --jyräytyvä, tyhjätään oppilailta muut paitsi kuluva lukuvuosi
		,pidennetty_oppivelvollisuus --jyräytyvä, ei haitanne
		,sisaoppilaitosmainen_majoitus
		,tehostettu_tuki
		,ulkomailla

		--h
		,[oppija_oid]
		,[aidinkieli]
		,[kansalaisuus]
		,[ika]
		,[sukupuoli]

		--
		,[tilastopaiva_1_0]
		,[aikuisten_alkuvaihe_1_0]
	
		/*
			--ei kattavia tai käytetään vain johdetussa erityisen tuen muuttujassa
			,majoitus 
			,majoitusetu
			,vaativan_erityisen_tuen_erityinen_tehtava
			,vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus
			,vaikeasti_vammainen
			,vammainen
			,vammainen_ja_avustaja
		*/
	
	FROM (
	  
		--opiskelijat
		SELECT 

			opisk = 1
			,tutk = null

			,vuosi = year(@alkuPvm)
			,kuukausi = month(@alkuPvm)

			/*
			,koulutuskoodi = 
				case 
					when ps.koulutusmoduuli_koodiarvo = 'explorer' and ps.suorituksen_tyyppi = 'internationalschoolpypvuosiluokka' then '001101'
					when ps.suorituksen_tyyppi in (
						'internationalschoolpypvuosiluokka',
						'internationalschoolmypvuosiluokka',
						'perusopetuksenvuosiluokka', 
						'aikuistenperusopetuksenoppimaara', 
						'aikuistenperusopetuksenoppimaaranalkuvaihe'
					) then '201101'
					when ps.suorituksen_tyyppi in (
						'esiopetuksensuoritus',  
						'perusopetuksenlisaopetus', 
						'perusopetukseenvalmistavaopetus'
					) then ps.koulutusmoduuli_koodiarvo
				end
			*/

			--koulutuksen tarkin taso; oppilaissa aikuisten alkuvaihe erotetaan k/e-muuttujalla; dimensiossa myös karkeammat ryhmittelyt
			,vuosiluokka_tai_koulutus = 
				case 
					when ps.koulutusmoduuli_koodiarvo = 'explorer' and ps.suorituksen_tyyppi = 'internationalschoolpypvuosiluokka' then '001101'
					when ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaaranalkuvaihe') then '21' --ei löydy koulk
					when ps.suorituksen_tyyppi in (
						'esiopetuksensuoritus', --001101 / 001102
						'internationalschoolpypvuosiluokka', --1-9
						'internationalschoolmypvuosiluokka', --1-9
						'perusopetuksenvuosiluokka', --1-9
						'perusopetuksenlisaopetus', --020075
						'perusopetukseenvalmistavaopetus' --999905
					) then ps.koulutusmoduuli_koodiarvo
				end 
			,ps.suorituksen_tyyppi
			,ps.suoritustapa_koodi
			,suorituskieli = ps.suorituskieli_koodiarvo
			,muu_suorituskieli = left(ps.muut_suorituskielet_koodi,2) --jonon eka, muut löytäisi tarvittaessa erottimella ";"
			,ps.kielikylpykieli_koodi
			--,jaa_luokalle
				/*case
					when ps.suorituksen_tyyppi = 'perusopetuksenvuosiluokka' and CHARINDEX('"jääLuokalle": true', ps.[data]) > 0
					then 1 
					else 0
				end*/
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
					when ooa.vaikeasti_vammainen = 1 then 'ertu_v'
					when ooa.vammainen = 1 or ooa.vammainen_ja_avustaja = 1 then 'ertu_m'
					when ooa2.erityisen_tuen_paatos = 1 or ooa.erityinen_tuki = 1 or ooa.hojks = 1 then 'ertu_muu'
					--tehostettu_tuki -> ertu_teho
					else 'ertu_eiei'
				end
			,ooa.joustava_perusopetus
			,ooa.koulukoti
			,kotiopetus = 
				case 
				when kj.kotiopetus_alku <= @loppuPvm 
					and kj.kotiopetus_alku <= ooa.loppu
					and coalesce(kj.kotiopetus_loppu,'9999-12-31') >= @alkuPvm 
					and coalesce(kj.kotiopetus_loppu,'9999-12-31') >= ooa.alku 
				then 1
				else 0
				end
			,ooa.kuljetusetu
			,pidennetty_oppivelvollisuus = case when ooa2.pidennetty_oppivelvollisuus = 1 or ooa.pidennetty_oppivelvollisuus = 1 then 1 else 0 end 
			,ooa.sisaoppilaitosmainen_majoitus
			,tehostettu_tuki = 
				case 
				when tj.alku <= @loppuPvm 
					and tj.alku <= ooa.loppu
					and coalesce(tj.loppu,'9999-12-31') >= @alkuPvm 
					and coalesce(tj.loppu,'9999-12-31') >= ooa.alku 
				then 1
				else 0
				end
			,ulkomailla = 
				case 
				when uj.alku <= @loppuPvm 
					and uj.alku <= ooa.loppu
					and coalesce(uj.loppu,'9999-12-31') >= @alkuPvm 
					and coalesce(uj.loppu,'9999-12-31') >= ooa.alku 
				then 1
				else 0
				end

			,h.oppija_oid
			,h.aidinkieli
			,kansalaisuus = left(h.kansalaisuus, 3)
			,ika = year(@alkuPvm) - year(h.syntymaaika)
			,h.sukupuoli 
			/* =	
				case 
					when cast(substring(h.hetu,8,3) as int) % 2 = 1 then '1' --m_koodi
					when cast(substring(h.hetu,8,3) as int) % 2 = 0 then '2' --n_koodi
				end
			*/

			,tilastopaiva_1_0 =	
				case 
					when month(@alkuPvm) = 9 
						and (@tilastoPvm between ooa.alku and ooa.loppu) 
						and ooa.tila = 'lasna'
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
		LEFT JOIN sa.sa_koski_esiopetus_opiskeluoikeus_aikajakso ooa2 on ooa2.opiskeluoikeus_oid = oo.opiskeluoikeus_oid --osa esiopetuksen erityisopetustiedoista eri taulussa
		LEFT JOIN sa.sa_koski_tehostetun_tuen_jaksot tj on tj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_ulkomaanjaksot uj on uj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_perusopetuksen_kotiopetusjaksot kj on kj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
		
		WHERE 1=1 --@alkupvm >= '2020-08-01' 
		AND coalesce(ps.vahvistus_paiva,'9999-12-31') >= @alkuPvm
		AND (
			ps.suorituksen_tyyppi in (
				'esiopetuksensuoritus',
				'perusopetuksenlisaopetus', 
				'perusopetukseenvalmistavaopetus', 
				'aikuistenperusopetuksenoppimaara', 
				'aikuistenperusopetuksenoppimaaranalkuvaihe'
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
		)		 
		AND (ooa.alku <= @loppuPvm and coalesce(ooa.loppu,'9999-12-31') >= @alkuPvm)
		AND ooa.tila = 'lasna'


		UNION ALL

	
		--tutkinnot
		SELECT  

			opisk = null
			,tutk = 1
		
			,vuosi = year(@alkuPvm)
			,kuukausi = month(@alkuPvm)

			,vuosiluokka_tai_koulutus = 
				case 
					when ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' then '201101' --rajauksessa 9lk
					when ps.suorituksen_tyyppi in (
						'perusopetuksenoppimaara', 
						'perusopetuksenlisaopetus', 
						'perusopetukseenvalmistavaopetus'
					) then ps.koulutusmoduuli_koodiarvo
					when ps.suorituksen_tyyppi = 'aikuistenperusopetuksenoppimaaranalkuvaihe' then '20' --huom
					when ps.suorituksen_tyyppi = 'aikuistenperusopetuksenoppimaara' then '21'
				end 
			,ps.suorituksen_tyyppi
			,ps.suoritustapa_koodi
			,suorituskieli = ps.suorituskieli_koodiarvo
			,muu_suorituskieli = left(ps.muut_suorituskielet_koodi,2) --jonon eka, muut löytäisi tarvittaessa erottimella ";"
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
					else 'ertu_eiei'
				end
			,ooa.joustava_perusopetus
			,ooa.koulukoti
			,kotiopetus = 
				case 
				when kj.kotiopetus_alku <= @loppuPvm 
					and kj.kotiopetus_alku <= ooa.loppu
					and kj.kotiopetus_alku <= ps.vahvistus_paiva --huom
					and coalesce(kj.kotiopetus_loppu,'9999-12-31') >= @alkuPvm 
					and coalesce(kj.kotiopetus_loppu,'9999-12-31') >= ooa.alku 
				then 1
				else 0
				end

			,ooa.kuljetusetu
			,ooa.pidennetty_oppivelvollisuus
			,ooa.sisaoppilaitosmainen_majoitus
			,tehostettu_tuki = 
				case 
				when tj.alku <= @loppuPvm 
					and tj.alku <= ooa.loppu
					and tj.alku <= ps.vahvistus_paiva --huom
					and coalesce(tj.loppu,'9999-12-31') >= @alkuPvm 
					and coalesce(tj.loppu,'9999-12-31') >= ooa.alku 
				then 1
				else 0
				end
			,ulkomailla = 
				case 
				when uj.alku <= @loppuPvm 
					and uj.alku <= ooa.loppu
					and uj.alku <= ps.vahvistus_paiva --huom
					and coalesce(uj.loppu,'9999-12-31') >= @alkuPvm 
					and coalesce(uj.loppu,'9999-12-31') >= ooa.alku 
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
			,ranki = rank() over(partition by oo.opiskeluoikeus_oid order by ooa.alku desc) 
		
		FROM sa.sa_koski_paatason_suoritus ps
		LEFT JOIN sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
		LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and ooa.alku <= ps.vahvistus_paiva --huom
		LEFT JOIN sa.sa_koski_tehostetun_tuen_jaksot tj on tj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_ulkomaanjaksot uj on uj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_perusopetuksen_kotiopetusjaksot kj on kj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
		
		WHERE ps.vahvistus_paiva between @alkuPvm and @loppuPvm
		AND (
			ps.suorituksen_tyyppi in (
				'perusopetuksenoppimaara', 
				'perusopetuksenlisaopetus', 
				'perusopetukseenvalmistavaopetus', 
				'aikuistenperusopetuksenoppimaara', 
				'aikuistenperusopetuksenoppimaaranalkuvaihe'
			) 
			OR (
				ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka'
				and ps.koulutusmoduuli_koodiarvo = '9'
			)
		) 

	) q

	WHERE ranki = 1

	SET @alkuPvm = DATEADD(MONTH, 1, @alkuPvm)
	SET @loppuPvm = EOMONTH(@alkuPvm)
	SET @tilastoPvm = DATEFROMPARTS(YEAR(@alkuPvm), 9, 20)

END

