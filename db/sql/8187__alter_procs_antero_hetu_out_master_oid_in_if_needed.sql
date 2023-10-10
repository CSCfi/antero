USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_sopimusmuotoinen_koulutus]    Script Date: 10.10.2023 15:50:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_sopimusmuotoinen_koulutus] AS

DROP TABLE IF EXISTS dw.f_koski_amm_sopimusmuotoinen_koulutus

SELECT 
--	 q.vuosi
	oppija_oid
	,opiskeluoikeus_oid
	,d_kalenteri_koul_alku_id = COALESCE(d27.id, -1)
	,d_kalenteri_koul_loppu_id = COALESCE(d28.id, -1)
	,d_sukupuoli_id = COALESCE(d2.id,-1)
	,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
	,d_ika_id = COALESCE(d4.id,-1)
	,d_maatjavaltiot2_kansalaisuus_id = COALESCE(d5.id,-1)
	,d_koulutusluokitus_id = COALESCE(d11.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d13.id,-1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d15.id, -1)
	,d_suorituksen_tyyppi_id = COALESCE(d14.id,-1)
--	,d_opintojenrahoitus_id = COALESCE(d16.id,-1)
	,d_osaamisala_id = COALESCE(d17.id,-1)
	,d_kieli_suorituskieli_id = COALESCE(d21.id, -1)
	,d_kytkin_muu_ammatillinen_id = COALESCE(d22.id, -1)
	,d_ytj_yritystieto_id = COALESCE(d23.id, -1)
	,d_toimialaluokitus2008_id = COALESCE(d24.id, -1)
	,d_alueluokitus_yrityksen_kunta_id = COALESCE(d29.id, -1)
	,d_kieli_yritys_id = COALESCE(d30.id, -1) 
	,d_kalenteri_sop_alku_id = COALESCE(d25.id, -1)
	,d_kalenteri_sop_loppu_id = COALESCE(d26.id, -1)
	,sopimusjakso_loppunut
	,sop_id
	,sijainti
	,sopimusmuoto
	,paivat
	,paivat_tarkastettu
	,[ensimmainen_sopimus] =
		CASE 
			WHEN [ensimmainen_sopimus] = 1 THEN 'Kyllä'
			ELSE 'Ei'
		END
	,[ensimmainen_sopimus_yritys] =
		CASE 
			WHEN [ensimmainen_sopimus_yritys] = 1 THEN 'Kyllä'
			ELSE 'Ei'
		END
	,[vahintaan_kaksi_sopimusta] =
		CASE 
			WHEN [vahintaan_kaksi_sopimusta] = 1 THEN 'Kyllä'
			ELSE 'Ei'
		END
	,[vahintaan_kaksi_sopimusta_yritys] =
		CASE 
			WHEN [vahintaan_kaksi_sopimusta_yritys] = 1 THEN 'Kyllä'
			ELSE 'Ei'
		END
	,[sopimusten_lkm_opiskeluoikeudessa]
	,[sopimusten_lkm_opiskeluoikeus_yritys]
	,[edellinen_sopimus] = COALESCE(q.edellinen_sopimus, 'Ei edellistä sopimusta')
	,[edellinen_sopimus_sama_yritys] = COALESCE(q.edellinen_sopimus_sama_yritys, 'Ei edellistä sopimusta')
	,[edellinen_sopimus_koso]
	,[edellinen_sopimus_opso]
	,[edellinen_sopimus_koso_yritys]
	,[edellinen_sopimus_opso_yritys]

INTO dw.f_koski_amm_sopimusmuotoinen_koulutus

FROM (
	SELECT -- TOP 1000 
		 vuosi = YEAR(sj.alku)
		,oo.oppija_oid
		,oo.alkamispaiva
		,COALESCE(oo.paattymispaiva, '9999-12-31') AS paattymispaiva
		,sj.[opiskeluoikeus_oid]
		,h.sukupuoli
		,h.aidinkieli
		,ika = YEAR(sj.alku) - YEAR(h.syntymaaika)
		,kansalaisuus = LEFT(kansalaisuus, 3)
		,oo.koulutustoimija_oid
		,oo.oppilaitos_oid
		,ps.toimipiste_oid
		,oo.koulutusmuoto
		,CASE 
			WHEN LEN(ps.koulutusmoduuli_koodiarvo) > 6 THEN NULL 
			ELSE COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo, '999904'), ps.tutkinto_koodiarvo) 
			END
			AS tutkinto_koodi
		,ps.koulutusmoduuli_koodiarvo
		,ps.osaamisala_koodiarvo	
		,ps.suorituskieli_koodiarvo
		,ps.vahvistus_paiva
		,suorituksen_tyyppi = ps.suorituksen_tyyppi
		,suorituksen_tyyppi_koodi = case when ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1 else 2 end
		,muu_ammatillinen_koodi = case when ps.suorituksen_tyyppi = 'muuammatillinenkoulutus' then 1 else 0 end
		,sop_id = sj.id
		,sopimusmuoto
		,yrityksen_kieli_koodi =
			CASE
				WHEN ytj.kieli_seloste = 'Suomi' THEN 'FI'
				WHEN ytj.kieli_seloste = 'Svenska' THEN 'SV'
				ELSE '-1' END
		,sj.ytunnus
		,sj.alku
		,sj.loppu
		,koulutus_paattynyt =
			CASE 
				WHEN oo.paattymispaiva IS NOT NULL 
					AND oo.paattymispaiva <= GETDATE() THEN 1
				ELSE 0 END

		,valmistunut =
			CASE
				WHEN ps.vahvistus_paiva IS NOT NULL
					AND ps.vahvistus_paiva <= GETDATE() THEN 1
				ELSE 0 END
		,sopimusjakso_loppunut =
			CASE
				WHEN sj.loppu IS NULL THEN 0
				WHEN sj.loppu <= GETDATE() THEN 1
				WHEN sj.loppu > GETDATE() THEN 0
				ELSE NULL END
		,sijainti
		,paivat
		,paivat_tarkastettu
		,[ensimmainen_sopimus]
		,[ensimmainen_sopimus_yritys]
		,[vahintaan_kaksi_sopimusta]
		,[vahintaan_kaksi_sopimusta_yritys]
		,[sopimusten_lkm_opiskeluoikeudessa]
		,[sopimusten_lkm_opiskeluoikeus_yritys]
		,[sopimuksen_jarjestys]
		,[sopimuksen_jarjestys_yritys]
		,[edellinen_sopimus]
		,[edellinen_sopimus_sama_yritys]
		,[edellinen_sopimus_koso]
		,[edellinen_sopimus_opso]
		,[edellinen_sopimus_koso_yritys]
		,[edellinen_sopimus_opso_yritys]
	FROM [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_yhdistetty] sj
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = sj.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON sj.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	LEFT JOIN Koski_SA.sa.sa_ytj_yritystiedot ytj ON sj.ytunnus = ytj.ytunnus
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo h ON h.oppija_oid = oo.oppija_oid 
	WHERE ps.suorituksen_tyyppi != 'nayttotutkintoonvalmistavakoulutus'
	AND oo.koulutusmuoto = 'ammatillinenkoulutus'

) Q

--LEFT JOIN dw.d_kalenteri d1 ON d1.kalenteri_avain = q.tilv_date
LEFT JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi = q.sukupuoli
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi = q.aidinkieli
LEFT JOIN dw.d_ika d4 ON d4.ika_avain = q.ika
LEFT JOIN dw.d_maatjavaltiot2 d5 ON d5.maatjavaltiot2_koodi = q.kansalaisuus
LEFT JOIN dw.d_koulutusluokitus d11 ON d11.koulutusluokitus_koodi = q.tutkinto_koodi
LEFT JOIN dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = q.oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = q.koulutustoimija_oid
LEFT JOIN dw.d_suorituksen_tyyppi d14 ON d14.koodi = q.suorituksen_tyyppi_koodi
LEFT JOIN dw.d_organisaatioluokitus d15 ON d15.organisaatio_oid = q.toimipiste_oid
--LEFT JOIN dw.d_opintojenrahoitus d16 ON d16.koodi = q.opintojen_rahoitus
LEFT JOIN dw.d_osaamisala d17 ON d17.koodi = q.osaamisala_koodiarvo
LEFT JOIN dw.d_organisaatioluokitus d18 ON d18.organisaatio_oid = q.toimipiste_oid
LEFT JOIN dw.d_kieli d21 ON d21.kieli_koodi = q.suorituskieli_koodiarvo
LEFT JOIN dw.d_kytkin d22 ON d22.kytkin_koodi = q.muu_ammatillinen_koodi
LEFT JOIN dw.d_ytj_yritystiedot d23 ON d23.ytunnus = q.ytunnus
LEFT JOIN dw.d_toimialaluokitus2008 d24 ON d23.toimiala_koodi = d24.toimiala_koodi
LEFT JOIN dw.d_kalenteri d25 ON d25.kalenteri_avain = q.alku
LEFT JOIN dw.d_kalenteri d26 ON d26.kalenteri_avain = q.loppu
LEFT JOIN dw.d_kalenteri d27 ON d27.kalenteri_avain = q.alkamispaiva
LEFT JOIN dw.d_kalenteri d28 ON d28.kalenteri_avain = q.paattymispaiva
LEFT JOIN dw.d_alueluokitus d29 ON d29.kunta_koodi = d23.kotipaikkakunta_koodi
LEFT JOIN dw.d_kieli d30 ON d30.kieli_koodi = q.yrityksen_kieli_koodi

GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_lukio_opiskelijat_laskentapaiva]    Script Date: 10.10.2023 15:50:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_lukio_opiskelijat_laskentapaiva] AS

DROP TABLE IF EXISTS ANTERO.dw.f_koski_lukio_opiskelijat_laskentapaiva

SELECT DISTINCT [opiskeluoikeus_oid]
		  ,YEAR(alkamispaiva) AS Aloitusvuosi
		  ,laskentapaiva
		  ,[sisaltyy_opiskeluoikeuteen_oid]
		  ,[oppija_oid]
		  ,[oppilaitos_oid]
		  ,[koulutustoimija_oid]
		  ,[koulutusmuoto]
		  ,[koulutusmoduuli_koodiarvo]
		  ,[alkamispaiva]
		  ,[paattymispaiva]
		  ,oppimaara
		  ,suorituksen_tyyppi
		  ,[toimipiste_oid]
		  ,[toimipiste_nimi]
		  ,Sukupuoli
		  ,Ika
		  ,aidinkieli
		,kansalaisuus
		,syntymaaika
		,majoitus
		,sisaoppilaitosmainen_majoitus
INTO ANTERO.dw.f_koski_lukio_opiskelijat_laskentapaiva
FROM(
SELECT [opiskeluoikeus_oid]
			,CAST(laskentapaiva AS date) AS laskentapaiva
		  ,[sisaltyy_opiskeluoikeuteen_oid]
		  ,alkamispaiva
		  ,[oppija_oid]
		  ,[oppilaitos_oid]
		  ,[oppilaitos_nimi]
		  ,[oppilaitos_kotipaikka]
		  ,[oppilaitosnumero]
		  ,[koulutustoimija_oid]
		  ,[koulutustoimija_nimi]
		  ,[koulutusmuoto]
		  ,[paattymispaiva]
		  ,[viimeisin_tila]
	--	  ,[koulutusmoduuli_koodiarvo]
		  ,[lisatiedot_henkilostokoulutus]
		  ,[lisatiedot_koulutusvienti]
		  ,[lahdejarjestelma_koodiarvo]
		  ,[vanha_koulutustoimija_oid]
		  ,[vanha_koulutustoimija_nimi]
		  ,oppimaara
		  ,suorituksen_tyyppi
		  ,[koulutusmoduuli_koodisto]
		  ,[koulutusmoduuli_koodiarvo]
		  ,[koulutusmoduuli_koulutustyyppi]
		  ,[koulutusmoduuli_laajuus_arvo]
		  ,[koulutusmoduuli_laajuus_yksikko]
		  ,[vahvistus_paiva]
		  ,[arviointi_arvosana_koodiarvo]
		  ,[arviointi_arvosana_koodisto]
		  ,[arviointi_hyvaksytty]
		  ,[arviointi_paiva]
		  ,[toimipiste_oid]
		  ,[toimipiste_nimi]  	
		  ,Sukupuoli
		  ,YEAR(laskentapaiva) - YEAR(syntymaaika) AS Ika
		 ,aidinkieli
		,kansalaisuus
		,syntymaaika
		,majoitus
		,sisaoppilaitosmainen_majoitus
		,rnk = rank() over (partition by opiskeluoikeus_oid, koulutustoimija_oid, laskentapaiva order by alkamispaiva, laskentapaiva, suorituksen_tyyppi)
	FROM (
		SELECT  oo.[opiskeluoikeus_oid]
		  ,oo.[sisaltyy_opiskeluoikeuteen_oid]
		  ,oo.alkamispaiva
		  ,ooa.tila_alkanut
		  ,ooa.loppu
		  ,oo.[oppija_oid]
		  ,oo.[oppilaitos_oid]
		  ,oo.[oppilaitos_nimi]
		  ,oo.[oppilaitos_kotipaikka]
		  ,oo.[oppilaitosnumero]
		  ,oo.[koulutustoimija_oid]
		  ,oo.[koulutustoimija_nimi]
		  ,oo.[koulutusmuoto]
		  ,oo.[paattymispaiva]
		  ,oo.[viimeisin_tila]
		  ,oo.[lisatiedot_henkilostokoulutus]
		  ,oo.[lisatiedot_koulutusvienti]
		  ,oo.[lahdejarjestelma_koodiarvo]
		  ,oo.[vanha_koulutustoimija_oid]
		  ,oo.[vanha_koulutustoimija_nimi]
		  ,CASE 
			WHEN suorituksen_tyyppi LIKE 'internati%' THEN 'Ulkomainen tutkinto' 
			WHEN suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe') THEN 'Ulkomainen tutkinto'
			ELSE ps.oppimaara END AS oppimaara
		  ,ps.suorituksen_tyyppi
		  ,ps.[koulutusmoduuli_koodisto]
		  ,ps.[koulutusmoduuli_koodiarvo]
		  ,ps.[koulutusmoduuli_koulutustyyppi]
		  ,ps.[koulutusmoduuli_laajuus_arvo]
		  ,ps.[koulutusmoduuli_laajuus_yksikko]
		  ,ps.[vahvistus_paiva]
		  ,ps.[arviointi_arvosana_koodiarvo]
		  ,ps.[arviointi_arvosana_koodisto]
		  ,ps.[arviointi_hyvaksytty]
		  ,ps.[arviointi_paiva]
		  ,ps.[toimipiste_oid]
		  ,ps.[toimipiste_nimi]
		  ,Sukupuoli = coalesce(h.sukupuoli, '-1')
--		  ,Ika = YEAR(ooa.tila_alkanut) - YEAR(henk.syntymaaika)
		  ,temp_table.laskentapaiva
		  ,CASE 
			WHEN (laskentapaiva > ooa.tila_alkanut AND ooa.loppu IS NULL AND ps.vahvistus_paiva IS NULL) THEN 1
			WHEN (laskentapaiva BETWEEN ooa.tila_alkanut AND ooa.loppu) THEN 1
			ELSE 0 END AS kytkin_laskentapaiva
		,CASE WHEN henk.aidinkieli IS NULL THEN '-1' ELSE henk.aidinkieli END AS aidinkieli
		,CASE WHEN henk.kansalaisuus IS NULL THEN '-1' ELSE henk.kansalaisuus END AS kansalaisuus
		,CASE WHEN henk.syntymaaika IS NULL THEN '-1' ELSE henk.syntymaaika END AS syntymaaika
		,ooa.majoitus
		,ooa.sisaoppilaitosmainen_majoitus
	  --INTO Koski_SA.sa.sa_lukio_uudet_opiskelijat
	  FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	  LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso AS ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	  LEFT JOIN Koski_SA.sa.sa_koski_henkilo AS henk ON oo.oppija_oid = henk.oppija_oid
	  CROSS JOIN (SELECT paivays AS laskentapaiva 
					FROM ANTERO.dw.d_kalenteri
					WHERE vuosi >= 2018
					AND vuosi <= YEAR(GETDATE())
					AND kuukausi = 9
					AND paiva = 20) AS temp_table
	  WHERE ((ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 
										'lukionoppimaara', 'diatutkintovaihe', 'luva', 'internationalschooldiplomavuosiluokka')
				OR
			(ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12'))))
	  AND ooa.tila = 'lasna'
	  ) q1
	  WHERE kytkin_laskentapaiva = 1
	  AND laskentapaiva <= GETDATE()
	) q2
	WHERE rnk = 1

GO
