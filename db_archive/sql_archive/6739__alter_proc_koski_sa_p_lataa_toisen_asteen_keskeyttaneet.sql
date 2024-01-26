USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_toisen_asteen_keskeyttaneet]    Script Date: 8.12.2022 9:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_toisen_asteen_keskeyttaneet] AS


DROP TABLE IF EXISTS Koski_SA.sa.temp_toisen_asteen_erot_alku
DROP TABLE IF EXISTS Koski_SA.sa.temp_toisen_asteen_erot
DROP TABLE IF EXISTS Koski_SA.dbo.toisen_asteen_keskeyttaneet

-- Poimitaan kaikki keskeyttäneet toiselta asteelta ja katsotaan viimeinen läsnäolopäivä

SELECT DISTINCT *
INTO Koski_SA.sa.temp_toisen_asteen_erot_alku

FROM (

	SELECT DISTINCT
	oo.oppija_oid
	,oo.opiskeluoikeus_oid
	,oo.koulutustoimija_oid
	,oo.oppilaitos_oid
	,kl.koulutusalataso1_koodi
	,kl.koulutusalataso2_koodi
	,kl.koulutusalataso3_koodi
	,kl.tutkintotyyppi_koodi
	,koulutusmoduuli_koodiarvo
	,koulutusmuoto
	,viimeisin_tila
	,viimeinen_lasna = ooa.loppu
	,CASE
		WHEN ps.suorituksen_tyyppi = 'luva' OR oo.tuva_jarjestamislupa = 'lukio' THEN 'Aineopiskelija (ei tutkintotavoitetta)'
		WHEN ps.suorituksen_tyyppi LIKE 'internati%' THEN 'Ulkomainen tutkinto'
		WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe', 'diavalmistavavaihe') THEN 'Ulkomainen tutkinto' 
		WHEN ps.[oppimaara] = 'nuortenops' THEN 'Nuorten oppimäärä'
		WHEN ps.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppimäärä'
		WHEN ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Aineopiskelija (ei tutkintotavoitetta)'
		WHEN ps.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
		WHEN oo.koulutusmuoto = 'ammatillinenkoulutus' OR oo.tuva_jarjestamislupa = 'ammatillinen'  THEN 'Ammatillinen'
		ELSE 'Ei tietoa' END
	AS oppimaara
	,tarkastuspaiva = DATEADD(MONTH, 3, ooa.loppu)
	,rnk = rank() over (partition by oo.opiskeluoikeus_oid order by ooa.loppu DESC)

	FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo

	LEFT JOIN (SELECT * FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso WHERE tila IN ('lasna', 'loma')) ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on ps.koulutusmoduuli_koodiarvo = kl.koulutusluokitus_koodi

	WHERE (
		oo.koulutusmuoto IN ('ammatillinenkoulutus', 'diatutkinto', 'ibtutkinto', 'lukiokoulutus', 'luva')
		OR oo.tuva_jarjestamislupa IN ('lukio', 'ammatillinen')
		OR ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka'
		OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12'))
	)
	AND ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
	AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
											
) q1

WHERE rnk = 1 AND viimeisin_tila IN ('katsotaaneronneeksi', 'eronnut')



SELECT DISTINCT * 
INTO Koski_SA.dbo.toisen_asteen_keskeyttaneet

FROM (

	SELECT oppija_oid, opiskeluoikeus_oid, viimeinen_lasna, vuosi, kuukausi, 
		jatkaa_kj = MAX(jatkaa_kj), 
		jatkaa_oppilaitos = MAX(jatkaa_oppilaitos),
		jatkaa_tutkintotyyppi = MAX(jatkaa_tutkintotyyppi),
		jatkaa_ammatillinen = MAX(jatkaa_ammatillinen),
		jatkaa_yleissivistava = MAX(jatkaa_yleissivistava),
		jatkaa_valmentava = MAX(jatkaa_valmentava),
		jatkaa_lukio_valmentava = MAX(jatkaa_lukio_valmentava),
		jatkaa_amm_valmentava = MAX(jatkaa_amm_valmentava),
		jatkaa_muu_ammatillinen = MAX(jatkaa_muu_ammatillinen),
		jatkaa_amm_tutkintokoulutus = MAX(jatkaa_amm_tutkintokoulutus),
		jatkaa_oppimaara = MAX(jatkaa_oppimaara),
		vaihto_oppimaara = MAX(vaihto_oppimaara),
		jatkaa_aikuistenops = MAX(jatkaa_aikuistenops),
		jatkaa_nuortenops = MAX(jatkaa_nuortenops),
		jatkaa_lukioaine = MAX(jatkaa_lukioaine),
		jatkaa_lukio_ulkomainen = MAX(jatkaa_lukio_ulkomainen),
		keskeyttaminen_vaiheittainen_koodi = MIN(keskeyttaminen_vaiheittainen_koodi)
	
	FROM (

		SELECT DISTINCT
			erot.oppija_oid
			,erot.opiskeluoikeus_oid
			,viimeinen_lasna
			,vuosi = YEAR(viimeinen_lasna)
			,kuukausi = MONTH(viimeinen_lasna)
			,jatkaa_kj = case when q1.opiskeluoikeus_oid is null then 0 when erot.koulutustoimija_oid = q1.koulutustoimija_oid then 1 else 0 end
			,jatkaa_oppilaitos = case when q1.opiskeluoikeus_oid is null then 0 when erot.oppilaitos_oid = q1.oppilaitos_oid then 1 else 0 end
			,jatkaa_tutkintotyyppi = case when q1.opiskeluoikeus_oid is null then 0 when erot.tutkintotyyppi_koodi = q1.tutkintotyyppi_koodi /*kaikki valmentava samaa*/ then 1 else 0 end
			,jatkaa_ammatillinen = case when q1.opiskeluoikeus_oid is null then 0 else ammatillinen end
			,jatkaa_yleissivistava = case when q1.opiskeluoikeus_oid is null then 0 else yleissivistava end
			,jatkaa_valmentava = case when q1.opiskeluoikeus_oid is null then 0 when amm_valmentava = 1 or lukio_valmentava = 1 then 1 else 0 end
			,jatkaa_amm_valmentava = case when q1.opiskeluoikeus_oid is null then 0 else amm_valmentava end
			,jatkaa_lukio_valmentava = case when q1.opiskeluoikeus_oid is null then 0 else lukio_valmentava end
			,jatkaa_muu_ammatillinen = case when q1.opiskeluoikeus_oid is null then 0 else muu_ammatillinen end
			,jatkaa_amm_tutkintokoulutus = case when q1.opiskeluoikeus_oid is null then 0 else amm_tutkintokoulutus end
			,jatkaa_oppimaara = case when q1.opiskeluoikeus_oid is null then 0 when q1.oppimaara = erot.oppimaara then 1 else 0 end
			,vaihto_oppimaara = case when q1.opiskeluoikeus_oid is null then 0 when q1.oppimaara != erot.oppimaara then 1 else 0 end
			,jatkaa_aikuistenops = case when q1.opiskeluoikeus_oid is null then 0 when erot.oppimaara = 'Aikuisten oppimäärä' then 1 else 0 end
			,jatkaa_nuortenops = case when q1.opiskeluoikeus_oid is null then 0 when erot.oppimaara = 'Nuorten oppimäärä' then 1 else 0 end
			,jatkaa_lukioaine = case when q1.opiskeluoikeus_oid is null then 0 when erot.oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' then 1 else 0 end
			,jatkaa_lukio_ulkomainen = case when q1.opiskeluoikeus_oid is null then 0 when erot.oppimaara = 'Ulkomainen tutkinto' then 1 else 0 end
			,keskeyttaminen_vaiheittainen_koodi =
				case 
					when erot.koulutusmoduuli_koodiarvo = q1.koulutusmoduuli_koodiarvo then 1
					when erot.koulutusalataso3_koodi = q1.koulutusalataso3_koodi then 2
					when erot.koulutusalataso2_koodi = q1.koulutusalataso2_koodi then 3
					when erot.koulutusalataso1_koodi = q1.koulutusalataso1_koodi then 4
					when erot.koulutusmuoto = q1.koulutusmuoto then 5
					when q1.opiskeluoikeus_oid IS NOT NULL AND erot.koulutusmuoto != q1.koulutusmuoto then 7
					when q1.opiskeluoikeus_oid IS NULL then 9
					else 99 
				end

		FROM Koski_SA.sa.temp_toisen_asteen_erot_alku erot

		LEFT JOIN (

			SELECT oo.oppija_oid 
				,oo.opiskeluoikeus_oid
				,ooa.alku
				,oo.koulutusmuoto
				,loppu = COALESCE(ooa.loppu, '9999-01-01')
				,oo.koulutustoimija_oid
				,oo.oppilaitos_oid
				,kl.koulutusalataso1_koodi
				,kl.koulutusalataso2_koodi
				,kl.koulutusalataso3_koodi
				,ps.koulutusmoduuli_koodiarvo
				,kl.tutkintotyyppi_koodi
				,ammatillinen = case when oo.koulutusmuoto = 'ammatillinenkoulutus' OR oo.tuva_jarjestamislupa = 'ammatillinen' then 1 else 0 end
				,yleissivistava = 
					case 
						when oo.koulutusmuoto IN ('diatutkinto', 'ibtutkinto', 'lukiokoulutus', 'luva')
							OR oo.tuva_jarjestamislupa = 'lukio'
							OR ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka'
							OR ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12') 
						then 1 
						else 0 
					end
				,oppimaara = 
					CASE
						WHEN ps.suorituksen_tyyppi = 'luva' OR oo.tuva_jarjestamislupa = 'lukio' THEN 'Aineopiskelija (ei tutkintotavoitetta)'
						WHEN ps.suorituksen_tyyppi LIKE 'internati%' THEN 'Ulkomainen tutkinto'
						WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe', 'diavalmistavavaihe') THEN 'Ulkomainen tutkinto' 
						WHEN ps.[oppimaara] = 'nuortenops' THEN 'Nuorten oppimäärä'
						WHEN ps.[oppimaara] = 'aikuistenops' THEN 'Aikuisten oppimäärä'
						WHEN ps.suorituksen_tyyppi = 'lukionoppiaineenoppimaara' THEN 'Aineopiskelija (ei tutkintotavoitetta)'
						WHEN ps.[oppimaara] = 'Ulkomainen tutkinto' THEN 'Ulkomainen tutkinto'
						WHEN oo.koulutusmuoto = 'ammatillinenkoulutus' OR oo.tuva_jarjestamislupa = 'ammatillinen' THEN 'Ammatillinen'
						ELSE 'Ei tietoa' 
					END
				,amm_valmentava = case when ps.suorituksen_tyyppi in ('valma', 'telma') OR oo.tuva_jarjestamislupa = 'ammatillinen' then 1 else 0 end
				,lukio_valmentava = case when oo.koulutusmuoto = 'luva' OR oo.tuva_jarjestamislupa = 'lukio' then 1 else 0 end
				,muu_ammatillinen = case when ps.suorituksen_tyyppi in ('muuammatillinenkoulutus','tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus') then 1 else 0 end
				,amm_tutkintokoulutus = case when ps.suorituksen_tyyppi IN ('ammatillinentutkinto', 'ammatillinentutkintoosittainen') then 1 else 0 end
				--,kytkin_uusi = 1

			FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo

			LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa ON ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on ps.koulutusmoduuli_koodiarvo = kl.koulutusluokitus_koodi

			WHERE (
				koulutusmuoto IN ('ammatillinenkoulutus', 'diatutkinto', 'ibtutkinto', 'lukiokoulutus', 'luva')
				OR oo.tuva_jarjestamislupa IN ('lukio', 'ammatillinen')
				OR ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka'
				OR ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12')
			)
			AND ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
			AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
			AND ooa.tila IN ('lasna', 'loma', 'valmistunut')

		) q1

		ON erot.oppija_oid = q1.oppija_oid 
			AND erot.opiskeluoikeus_oid != q1.opiskeluoikeus_oid
			AND (viimeinen_lasna <= q1.loppu AND tarkastuspaiva >= q1.alku)

	) q2

	GROUP BY oppija_oid, opiskeluoikeus_oid, viimeinen_lasna, vuosi, kuukausi

) q3


DROP TABLE IF EXISTS Koski_SA.sa.temp_toisen_asteen_erot_alku
