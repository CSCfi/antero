USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_kaksois_ja_kolmoistutkinnot]    Script Date: 30.7.2025 7.56.51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_kaksois_ja_kolmoistutkinnot]
AS

DECLARE @alkuPvm as date
DECLARE @loppuPvm as date
DECLARE @tempPvm as date

SET @alkuPvm = '2018-01-01'
SET @loppuPvm = '2018-07-31'

EXEC [Koski_SA].[sa].[p_lataa_ytr_update]

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_lukio_kurssit]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_ammatillinen_tutkinnot_kaikki]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_lukio_oppimaarat_kaikki]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_yo_tutkinnot_kaikki]

SELECT 
	os.osasuoritus_id, 
	os.arviointi_paiva, 
	-- Huomioidaan laajuuden laskennassa kaikki paikalliset syventävät ja soveltavat kurssit
	CASE WHEN os.koulutusmoduuli_koodiarvo in ('PSY','PSO') THEN cast(os.osasuoritus_id as varchar) ELSE os.koulutusmoduuli_koodiarvo END as koulutusmoduuli_koodiarvo, 
	os.koulutusmoduuli_laajuus_arvo, 
	os.koulutusmoduuli_laajuus_yksikko, 
	oo.master_oid, 
	CASE WHEN os.koulutusmoduuli_koodisto = 'moduulikoodistolops2021' THEN 1 ELSE 2 END as koulutusmoduuli_koodisto_rnk
INTO [Koski_SA].[sa].[temp_lukio_kurssit]
FROM [Koski_SA].[sa].[sa_koski_osasuoritus] os
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on os.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
WHERE os.suorituksen_tyyppi in ('lukionvaltakunnallinenmoduuli','lukionkurssi','lukionpaikallinenopintojakso') and os.arviointi_hyvaksytty = 1
	
SELECT DISTINCT
	oo.master_oid,
	oo.opiskeluoikeus_oid,
	d2a.id as d_organisaatioluokitus_amm_id,
	d2b.id as d_organisaatioluokitus_koulutustoimija_amm_id,
	d.id as d_koulutusluokitus_amm_id,
	aps.vahvistus_paiva
INTO [Koski_SA].[sa].[temp_koski_ammatillinen_tutkinnot_kaikki]
FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] aps on aps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d on d.koulutusluokitus_koodi = aps.tutkinto_koodi
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2a on d2a.organisaatio_oid = oo.oppilaitos_oid
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2b on d2b.organisaatio_oid = oo.koulutustoimija_oid
WHERE aps.suorituksen_tyyppi = 'ammatillinentutkinto' and YEAR(aps.vahvistus_paiva) > 2017 and d.tutkintotyyppi_fi = 'Ammatilliset perustutkinnot'
	
SELECT DISTINCT
	oo.master_oid,
	oo.opiskeluoikeus_oid,
	d2a.id as d_organisaatioluokitus_lukio_id,
	d2b.id as d_organisaatioluokitus_koulutustoimija_lukio_id,
	lps.vahvistus_paiva
INTO [Koski_SA].[sa].[temp_koski_lukio_oppimaarat_kaikki]
FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] lps on lps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d2 on d2.paivays = lps.vahvistus_paiva
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2a on d2a.organisaatio_oid = oo.oppilaitos_oid
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2b on d2b.organisaatio_oid = oo.koulutustoimija_oid
WHERE lps.suorituksen_tyyppi = 'lukionoppimaara' and YEAR(lps.vahvistus_paiva) > 2017

SELECT DISTINCT
	ytr.master_oid,
	d_organisaatioluokitus_yo_id,
	d_organisaatioluokitus_koulutustoimija_yo_id,
	concat(left(ytr.tutkintokerta,4), case right(ytr.tutkintokerta,1) when 'S' then '-12-31' when 'K' then '-07-31' end) as vahvistus_paiva,
	ytr.koulutusmoduuli_koodiarvo as exam,
	ytr.tutkintokerta
INTO [Koski_SA].[sa].[temp_koski_yo_tutkinnot_kaikki]
FROM [Koski_SA].[sa].[sa_ytr_update]  ytr

TRUNCATE TABLE ANTERO.dw.f_koski_kaksois_ja_kolmoistutkinnot

WHILE getdate() > @loppuPvm

BEGIN

	-- Tilastokauden perusjoukko

	DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_yhdistelmatutkinnot]
	SELECT * INTO [Koski_SA].[sa].[temp_koski_yhdistelmatutkinnot]
	FROM (
		SELECT DISTINCT
			h.master_oid,
			CASE	
				WHEN h.kansalaisuus like '%246%' THEN '246'
				ELSE LEFT(h.kansalaisuus,3)
			END as kansalaisuus,
			h.aidinkieli,
			h.sukupuoli,
			YEAR(@alkuPvm)-YEAR(h.syntymaaika) as ika,
			1 as master_oid_tiedossa,
			1 hetu_tiedossa,
			concat(left(ytr.tutkintokerta,4), case right(ytr.tutkintokerta,1) when 'S' then '-12-31' when 'K' then '-07-31' end) as ytr_vahvistus_paiva
		FROM [Koski_SA].[sa].[sa_koski_henkilo_master] h
		LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo on h.master_oid = oo.master_oid
		LEFT JOIN [Koski_SA].[sa].[sa_amm_paatason_suoritus] aps on aps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN [Koski_SA].[sa].[sa_lukio_paatason_suoritus] lps on lps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN [Koski_SA].[sa].[sa_ytr_update] ytr on ytr.master_oid = h.master_oid and left(ytr.tutkintokerta,4) = YEAR(@alkuPvm) and 
												  case right(ytr.tutkintokerta,1) when 'S' then 12 when 'K' then 7 end = MONTH(@loppuPvm)
		LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d on d.koulutusluokitus_koodi = aps.tutkinto_koodi
		WHERE (aps.suorituksen_tyyppi = 'ammatillinentutkinto' and aps.vahvistus_paiva >= @alkuPvm and aps.vahvistus_paiva <= @loppuPvm and d.tutkintotyyppi_fi = 'Ammatilliset perustutkinnot') or  
			  (lps.suorituksen_tyyppi = 'lukionoppimaara' and lps.vahvistus_paiva >= @alkuPvm and lps.vahvistus_paiva <= @loppuPvm) or
			  ytr.master_oid is not null 
		) h

	-- Lukiokurssien laajuudet

	DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_lukio_kurssit]
	SELECT * INTO [Koski_SA].[sa].[temp_koski_lukio_kurssit]
	FROM (
		SELECT 
			lk.* 
		FROM [Koski_SA].[sa].[temp_lukio_kurssit] lk
		WHERE lk.arviointi_paiva <= @loppuPvm
	) f
	
	DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_lukio_kurssit_summa]
	SELECT * INTO [Koski_SA].[sa].[temp_koski_lukio_kurssit_summa] FROM (
		SELECT 
			master_oid, 
			d.id as d_opintojenlaajuusyksikko_id, 
			sum(koulutusmoduuli_laajuus_arvo) as kurssit
		FROM (
			SELECT 
				master_oid,
				-- Priorisoidaan moduulit kurssien edelle
				rnk =
					RANK() OVER (
							PARTITION BY master_oid, koulutusmoduuli_koodiarvo
							ORDER BY os.koulutusmoduuli_koodisto_rnk, os.arviointi_paiva DESC, os.osasuoritus_id
					),
				-- Laajuus opintopisteinä: 1 kurssi = 2 opintopistettä
				koulutusmoduuli_laajuus_arvo = CASE WHEN os.koulutusmoduuli_laajuus_yksikko = 4 THEN os.koulutusmoduuli_laajuus_arvo * 2 ELSE coalesce(os.koulutusmoduuli_laajuus_arvo,2) END,
				2 as koulutusmoduuli_laajuus_yksikko
			FROM [Koski_SA].[sa].[temp_koski_lukio_kurssit] os
		) k
		LEFT JOIN [ANTERO].[dw].[d_opintojenlaajuusyksikko] d on k.koulutusmoduuli_laajuus_yksikko = d.koodiarvo
		WHERE rnk = 1
		GROUP BY master_oid, d.id
	) k

	DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_ammatillinen_tutkinnot]
	DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_lukio_oppimaarat]
	DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_yo_tutkinnot]
	
	SELECT 
		aps.master_oid,
		aps.opiskeluoikeus_oid,
		aps.d_organisaatioluokitus_amm_id,
		aps.d_organisaatioluokitus_koulutustoimija_amm_id,
		aps.d_koulutusluokitus_amm_id,
		aps.vahvistus_paiva
	INTO [Koski_SA].[sa].[temp_koski_ammatillinen_tutkinnot]
	FROM [Koski_SA].[sa].[temp_koski_ammatillinen_tutkinnot_kaikki] aps
	WHERE aps.vahvistus_paiva <= @loppuPvm
	
	SELECT
		lps.master_oid,
		lps.opiskeluoikeus_oid,
		lps.d_organisaatioluokitus_lukio_id,
		lps.d_organisaatioluokitus_koulutustoimija_lukio_id,
		lps.vahvistus_paiva
	INTO [Koski_SA].[sa].[temp_koski_lukio_oppimaarat]
	FROM [Koski_SA].[sa].[temp_koski_lukio_oppimaarat_kaikki] lps
	WHERE lps.vahvistus_paiva <= @loppuPvm

	SELECT DISTINCT
		ytr.master_oid,
		ytr.d_organisaatioluokitus_yo_id,
		ytr.d_organisaatioluokitus_koulutustoimija_yo_id,
		ytr.vahvistus_paiva,
		ytr.exam
	INTO [Koski_SA].[sa].[temp_koski_yo_tutkinnot]
	FROM [Koski_SA].[sa].[temp_koski_yo_tutkinnot_kaikki] ytr
	WHERE case right(ytr.tutkintokerta,1) when 'S' then 12 when 'K' then 7 end <= MONTH(@loppuPvm) and left(ytr.tutkintokerta,4) <= YEAR(@alkuPvm)
	
	-- Faktataulun lataus

	INSERT INTO ANTERO.dw.f_koski_kaksois_ja_kolmoistutkinnot

	SELECT  
		d1a.id as d_kalenteri_id, 
		d1b.id as d_kalenteri_amm_id, 
		d1c.id as d_kalenteri_lukio_id, 
		d1d.id as d_kalenteri_yo_id, 
		h.master_oid,
		h.master_oid_tiedossa,
		h.hetu_tiedossa,
		coalesce(amm.d_koulutusluokitus_amm_id,'-1') as d_koulutusluokitus_amm_id,
		coalesce(d2.id,'-1') as d_ika_id,
		coalesce(d3.id,'-1') as d_kansalaisuus_id,
		coalesce(d4.id,'-1') as d_aidinkieli_id,
		coalesce(d5.id,'-1') as d_sukupuoli_id,
		coalesce(amm.d_organisaatioluokitus_amm_id,'-1') as d_organisaatioluokitus_amm_id,
		coalesce(luk.d_organisaatioluokitus_lukio_id,'-1') as d_organisaatioluokitus_lukio_id,
		coalesce(yot.d_organisaatioluokitus_yo_id,'-1') as d_organisaatioluokitus_yo_id,
		coalesce(amm.d_organisaatioluokitus_koulutustoimija_amm_id,'-1') as d_organisaatioluokitus_koulutustoimija_amm_id,
		coalesce(luk.d_organisaatioluokitus_koulutustoimija_lukio_id,'-1') as d_organisaatioluokitus_koulutustoimija_lukio_id,
		coalesce(yot.d_organisaatioluokitus_koulutustoimija_yo_id,'-1') as d_organisaatioluokitus_koulutustoimija_yo_id,
		kurssit.kurssit as suoritetut_kurssit_lukio,
		kurssit.d_opintojenlaajuusyksikko_id,
		CASE 
			WHEN d1b.vuosi = d1d.vuosi and d1b.lukukausi_fi = d1d.lukukausi_fi THEN 1
			ELSE 0
		END as kaksoistutkinto_sama_lk,
		CASE
			WHEN d1b.vuosi is null or d1d.vuosi is null THEN 0
			WHEN ABS(cast(concat(d1b.vuosi, case when d1b.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1d.vuosi, case when d1d.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 1  THEN 1
			ELSE 0
		END as kaksoistutkinto_1_lk,
		CASE
			WHEN d1b.vuosi is null or d1d.vuosi is null THEN 0
			WHEN ABS(cast(concat(d1b.vuosi, case when d1b.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1d.vuosi, case when d1d.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 1.5  THEN 1
			ELSE 0
		END as kaksoistutkinto_2_lk,
		CASE
			WHEN d1b.vuosi is null or d1d.vuosi is null THEN 0
			WHEN ABS(cast(concat(d1b.vuosi, case when d1b.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1d.vuosi, case when d1d.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 2  THEN 1
			ELSE 0
		END as kaksoistutkinto_3_lk,
		CASE 
			WHEN d1b.vuosi = d1d.vuosi and d1d.vuosi = d1c.vuosi and d1b.lukukausi_fi = d1d.lukukausi_fi and d1d.lukukausi_fi = d1c.lukukausi_fi THEN 1
			ELSE 0
		END as kolmoistutkinto_sama_lk,
		CASE
			WHEN d1b.vuosi is null or d1d.vuosi is null or d1c.vuosi is null THEN 0
			WHEN (ABS(cast(concat(d1b.vuosi, case when d1b.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1d.vuosi, case when d1d.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 1) and
				 (ABS(cast(concat(d1c.vuosi, case when d1c.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1d.vuosi, case when d1d.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 1) and
				 (ABS(cast(concat(d1b.vuosi, case when d1b.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1c.vuosi, case when d1c.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 1) THEN 1
			ELSE 0
		END as kolmoistutkinto_1_lk,
		CASE
			WHEN d1b.vuosi is null or d1d.vuosi is null or d1c.vuosi is null THEN 0
			WHEN (ABS(cast(concat(d1b.vuosi, case when d1b.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1d.vuosi, case when d1d.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 1.5) and
				 (ABS(cast(concat(d1c.vuosi, case when d1c.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1d.vuosi, case when d1d.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 1.5) and
				 (ABS(cast(concat(d1b.vuosi, case when d1b.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1c.vuosi, case when d1c.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 1.5) THEN 1
			ELSE 0
		END as kolmoistutkinto_2_lk,
		CASE
			WHEN d1b.vuosi is null or d1d.vuosi is null or d1c.vuosi is null THEN 0
			WHEN (ABS(cast(concat(d1b.vuosi, case when d1b.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1d.vuosi, case when d1d.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 2) and
				 (ABS(cast(concat(d1c.vuosi, case when d1c.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1d.vuosi, case when d1d.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 2) and
				 (ABS(cast(concat(d1b.vuosi, case when d1b.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1c.vuosi, case when d1c.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) < 2) THEN 1
			ELSE 0
		END as kolmoistutkinto_3_lk,
		CASE
			WHEN d1b.vuosi is null or d1d.vuosi is null THEN -1
			ELSE ABS(cast(concat(d1b.vuosi, case when d1b.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1d.vuosi, case when d1d.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) * 2
		END as amm_yo_ero,
		CASE
			WHEN d1b.vuosi is null or d1c.vuosi is null THEN -1
			ELSE ABS(cast(concat(d1b.vuosi, case when d1b.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1c.vuosi, case when d1c.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) * 2
		END as amm_lukio_ero,
		CASE
			WHEN d1c.vuosi is null or d1d.vuosi is null THEN -1
			ELSE ABS(cast(concat(d1c.vuosi, case when d1c.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float) - cast(concat(d1d.vuosi, case when d1d.lukukausi_fi = 'Syksy' then '.5' else '.0' end) as float)) * 2
		END as lukio_yo_ero,
		CASE
			WHEN d1b.vuosi = d1a.vuosi AND d1b.lukukausi_fi = d1a.lukukausi_fi THEN 1
			ELSE 0
		END as suorittanut_ammatillisen_perustutkinnon,
		CASE
			WHEN d1c.vuosi = d1a.vuosi AND d1c.lukukausi_fi = d1a.lukukausi_fi THEN 1
			ELSE 0
		END as suorittanut_lukion_oppimaaran,
		CASE
			WHEN d1d.vuosi = d1a.vuosi AND d1d.lukukausi_fi = d1a.lukukausi_fi THEN 1
			ELSE 0
		END as suorittanut_ylioppilastutkinnon,
		yot.exam as yo_aine_koodi,
		getdate() as loadtime,
		'etl: p_lataa_f_koski_kaksois_ja_kolmoistutkinnot' as source,
		suser_sname() as username
	FROM [Koski_SA].[sa].[temp_koski_yhdistelmatutkinnot] h
	LEFT JOIN [Koski_SA].[sa].[temp_koski_ammatillinen_tutkinnot] amm on amm.master_oid = h.master_oid
	LEFT JOIN [Koski_SA].[sa].[temp_koski_lukio_oppimaarat] luk on luk.master_oid = h.master_oid
	LEFT JOIN [Koski_SA].[sa].[temp_koski_yo_tutkinnot] yot on yot.master_oid = h.master_oid
	LEFT JOIN [ANTERO].[dw].[d_kalenteri] d1a on d1a.paivays = @alkuPvm
	LEFT JOIN [ANTERO].[dw].[d_kalenteri] d1b on d1b.paivays = amm.vahvistus_paiva
	LEFT JOIN [ANTERO].[dw].[d_kalenteri] d1c on d1c.paivays = luk.vahvistus_paiva
	LEFT JOIN [ANTERO].[dw].[d_kalenteri] d1d on d1d.paivays = h.ytr_vahvistus_paiva
	LEFT JOIN [ANTERO].[dw].[d_ika] d2 on d2.ika_avain = h.ika
	LEFT JOIN [ANTERO].[dw].[d_maatjavaltiot2] d3 on d3.maatjavaltiot2_koodi = h.kansalaisuus
	LEFT JOIN [ANTERO].[dw].[d_kieli] d4 on d4.kieli_koodi = h.aidinkieli
	LEFT JOIN [ANTERO].[dw].[d_sukupuoli] d5 on d5.sukupuoli_koodi = h.sukupuoli
	LEFT JOIN [Koski_SA].[sa].[temp_koski_lukio_kurssit_summa] kurssit on kurssit.master_oid = h.master_oid
	WHERE (d1a.lukukausi_fi = d1b.lukukausi_fi and d1a.vuosi = d1b.vuosi) or (d1a.lukukausi_fi = d1c.lukukausi_fi and d1a.vuosi = d1c.vuosi) or (d1a.lukukausi_fi = d1d.lukukausi_fi and d1a.vuosi = d1d.vuosi)
		
	SET @tempPvm = @alkuPvm
	SET @alkuPvm = DATEADD(DAY, 1, @loppuPvm)
	SET @loppuPvm = DATEADD(DAY,-1, DATEADD(YEAR,1,@tempPvm))

END

DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_ammatillinen_tutkinnot]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_lukio_oppimaarat]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_yo_tutkinnot]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_yhdistelmatutkinnot]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_lukio_kurssit]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_lukio_kurssit_summa]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_lukio_kurssit]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_ammatillinen_tutkinnot_kaikki]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_lukio_oppimaarat_kaikki]
DROP TABLE IF EXISTS [Koski_SA].[sa].[temp_koski_yo_tutkinnot_kaikki]

GO


