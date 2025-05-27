USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_henkilostotiedot_yliopisto]    Script Date: 10.3.2025 8.28.12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_henkilostotiedot_yliopisto] as


-- Opiskelija opetus- ja tutkimushenkilöstö -suhde
-- HUOM. Mukana OTV-tietoja

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f2.opiskelijat / f.htv as arvo,
		s2.opiskelijat_sektori / s.htv_sektori as arvo_sektori,
		'opisk_opetus_tutkimus_henkilosto' as indikaattori ,
		'ETL: p_lataa_f_indikaattorit_kk_henkilostotiedot_yliopisto' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			f.vuosi as tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			CAST(SUM(f.henkilotyovuosi) as float) as htv
		FROM [ANTERO].[dw].[f_yo_henkilon_tyo] f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_yliopisto_id
		LEFT JOIN ANTERO.dw.d_yo_tehtavanjaottelu d2 on d2.id = f.d_tehtavanjaottelu_id
		LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d3 on d3.id = f.d_kansalaisuus_id
		WHERE vuosi BETWEEN 2018 and (SELECT max(tilastointivuosi) FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]) and d2.selite_fi = 'Opetus- ja tutkimushenkilökunta'
		GROUP BY vuosi, d1.organisaatio_nykyinen_koodi
	) f
	LEFT JOIN (
		SELECT 
			tilastointivuosi as tilastovuosi,
			COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi) as organisaatio_koodi,
			CAST(SUM(opiskelijat) as float) as opiskelijat
		FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] f
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d2 ON d2.id = f.oppilaitos_id
		LEFT JOIN [VipunenTK].[dbo].d_lahde d3 ON d3.id = f.lahde_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d4 on d4.koulutusluokitus_koodi = f.koulutusluokitus
		WHERE d3.lahde_koodi in ('-1','51','52') AND d2.oppilaitoskoodi NOT IN ('02557','10031','02358')  AND
		tilastointivuosi BETWEEN 2018 AND (SELECT MAX(vuosi) FROM [ANTERO].[dw].[f_yo_henkilon_tyo]) AND d4.koulutusastetaso2_koodi in ('63', '72') 
		GROUP BY tilastointivuosi, COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi)
	) f2 on f.tilastovuosi = f2.tilastovuosi and f.organisaatio_koodi = f2.organisaatio_koodi
	OUTER APPLY (
		SELECT 
			CAST(SUM(fb.henkilotyovuosi) as float) as htv_sektori
		FROM [ANTERO].[dw].[f_yo_henkilon_tyo] fb
		LEFT JOIN ANTERO.dw.d_yo_tehtavanjaottelu d2b on d2b.id = fb.d_tehtavanjaottelu_id
		WHERE fb.vuosi = f.tilastovuosi and d2b.selite_fi = 'Opetus- ja tutkimushenkilökunta'
	) s
	OUTER APPLY (	
		SELECT 
			CAST(SUM(opiskelijat) as float) as opiskelijat_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] fb
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d2b ON d2b.id = fb.oppilaitos_id
		LEFT JOIN [VipunenTK].[dbo].d_lahde d3b ON d3b.id = fb.lahde_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d4b on d4b.koulutusluokitus_koodi = fb.koulutusluokitus
		WHERE d3b.lahde_koodi in ('-1','51','52') AND d2b.oppilaitoskoodi NOT IN ('02557','10031','02358') and
		fb.tilastointivuosi = f.tilastovuosi AND d4b.koulutusastetaso2_koodi in ('63','72') 
	) s2
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED AND (target.arvo <> src.arvo OR target.arvo_sektori <> src.arvo_sektori) THEN
	UPDATE SET
		target.[arvo] = src.arvo,
		target.[arvo_sektori] = src.arvo_sektori,
		target.[source] = src.source,
		target.loadtime = GETDATE(),
		target.username = SUSER_NAME()
WHEN NOT MATCHED THEN
	INSERT (
		tilastovuosi,
		organisaatio_koodi,
		arvo,
		arvo_sektori,
		indikaattori,
		source,
		loadtime,
		username
	)
	VALUES (
		src.tilastovuosi,src. organisaatio_koodi, src.arvo, src.arvo_sektori, src.indikaattori, src.source,
		src.loadtime,
		src.username
	);

-- Tohtorin tutkinnot per IV htv
-- HUOM. Mukana OTV-tietoja

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f2.tutkinnot / f.htv as arvo,
		s2.tutkinnot_sektori / s.htv_sektori as arvo_sektori,
		'toht_per_iv' as indikaattori ,
		'ETL: p_lataa_f_indikaattorit_kk_henkilostotiedot_yliopisto' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			f.vuosi as tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi, 
			CAST(SUM(f.henkilotyovuosi) as float) as htv
		FROM [ANTERO].[dw].[f_yo_henkilon_tyo] f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_yliopisto_id
		LEFT JOIN ANTERO.dw.d_yo_tutkijanuravaihe d2 on d2.id=f.d_tutkijanuravaihe_id
		WHERE vuosi BETWEEN 2018 and (SELECT max(tilastointivuosi) FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot]) and d2.koodi = '4'
		GROUP BY vuosi, d1.organisaatio_nykyinen_koodi
	) f
	LEFT JOIN (
		SELECT 
			tilastointivuosi as tilastovuosi,
			COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi) as organisaatio_koodi,
			CAST(SUM(tutkinnot) as float) as tutkinnot
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d2 ON d2.id = f.oppilaitos_id
		LEFT JOIN [VipunenTK].[dbo].d_lahde d3 ON d3.id = f.lahde_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d4 on d4.koulutusluokitus_koodi = f.koulutusluokitus
		WHERE d3.lahde_koodi in ('-1','51','52') AND d2.oppilaitoskoodi NOT IN ('02557','10031','02358')  AND
		tilastointivuosi BETWEEN 2018 AND (SELECT MAX(vuosi) FROM [ANTERO].[dw].[f_yo_henkilon_tyo]) AND d4.koulutusastetaso2_koodi = '82' 
		GROUP BY tilastointivuosi, COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi)
	) f2 on f.tilastovuosi = f2.tilastovuosi and f.organisaatio_koodi = f2.organisaatio_koodi
	OUTER APPLY (
		SELECT 
			CAST(SUM(fb.henkilotyovuosi) as float) as htv_sektori
		FROM [ANTERO].[dw].[f_yo_henkilon_tyo] fb
		LEFT JOIN ANTERO.dw.d_yo_tutkijanuravaihe d2b on d2b.id=fb.d_tutkijanuravaihe_id
		WHERE fb.vuosi = f.tilastovuosi and d2b.koodi = '4'
	) s
	OUTER APPLY (	
		SELECT 
			CAST(SUM(tutkinnot) as float) as tutkinnot_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] fb
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d2b ON d2b.id = fb.oppilaitos_id
		LEFT JOIN [VipunenTK].[dbo].d_lahde d3b ON d3b.id = fb.lahde_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d4b on d4b.koulutusluokitus_koodi = fb.koulutusluokitus
		WHERE d3b.lahde_koodi in ('-1','51','52') AND d2b.oppilaitoskoodi NOT IN ('02557','10031','02358') and
		fb.tilastointivuosi = f.tilastovuosi AND d4b.koulutusastetaso2_koodi = '82' 
	) s2
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED AND (target.arvo <> src.arvo OR target.arvo_sektori <> src.arvo_sektori) THEN
	UPDATE SET
		target.[arvo] = src.arvo,
		target.[arvo_sektori] = src.arvo_sektori,
		target.[source] = src.source,
		target.loadtime = GETDATE(),
		target.username = SUSER_NAME()
WHEN NOT MATCHED THEN
	INSERT (
		tilastovuosi,
		organisaatio_koodi,
		arvo,
		arvo_sektori,
		indikaattori,
		source,
		loadtime,
		username
	)
	VALUES (
		src.tilastovuosi,src. organisaatio_koodi, src.arvo, src.arvo_sektori, src.indikaattori, src.source,
		src.loadtime,
		src.username
	);

-- Ulkomaalaisen opetus- ja tutkimushenkilökunnan osuus uraportaat I-II

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_henkilostotiedot_yliopisto' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			f.vuosi as tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			CAST(SUM(CASE WHEN d3.maatjavaltiot2_fi NOT IN ('Suomi', 'Tieto puutuu') THEN f.henkilotyovuosi ELSE 0 END) as float) / CAST(SUM(f.henkilotyovuosi) as float) as arvo,
			'ulk_opetus_i_ii' as indikaattori
		FROM [ANTERO].[dw].[f_yo_henkilon_tyo] f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_yliopisto_id
		LEFT JOIN ANTERO.dw.d_yo_tehtavanjaottelu d2 on d2.id = f.d_tehtavanjaottelu_id
		LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d3 on d3.id = f.d_kansalaisuus_id
		LEFT JOIN ANTERO.dw.d_yo_tutkijanuravaihe d5 on d5.id=f.d_tutkijanuravaihe_id
		WHERE vuosi >= 2018 and d2.selite_fi in ('Opetus- ja tutkimushenkilökunta') and d5.koodi in (1,2)
		GROUP BY vuosi, d1.organisaatio_nykyinen_koodi
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN d3b.maatjavaltiot2_fi NOT IN ('Suomi', 'Tieto puuttuu') THEN fb.henkilotyovuosi ELSE 0 END) as float) / CAST(SUM(fb.henkilotyovuosi) as float) as arvo_sektori
		FROM [ANTERO].[dw].[f_yo_henkilon_tyo] fb
		LEFT JOIN ANTERO.dw.d_yo_tehtavanjaottelu d2b on d2b.id = fb.d_tehtavanjaottelu_id
		LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d3b on d3b.id = fb.d_kansalaisuus_id
		LEFT JOIN ANTERO.dw.d_yo_tutkijanuravaihe d5b on d5b.id=fb.d_tutkijanuravaihe_id
		WHERE d2b.selite_fi in ('Opetus- ja tutkimushenkilökunta')  and d5b.koodi in (1,2) and fb.vuosi = f.tilastovuosi
	) s
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED AND (target.arvo <> src.arvo OR target.arvo_sektori <> src.arvo_sektori) THEN
	UPDATE SET
		target.[arvo] = src.arvo,
		target.[arvo_sektori] = src.arvo_sektori,
		target.[source] = src.source,
		target.loadtime = GETDATE(),
		target.username = SUSER_NAME()
WHEN NOT MATCHED THEN
	INSERT (
		tilastovuosi,
		organisaatio_koodi,
		arvo,
		arvo_sektori,
		indikaattori,
		source,
		loadtime,
		username
	)
	VALUES (
		src.tilastovuosi,src. organisaatio_koodi, src.arvo, src.arvo_sektori, src.indikaattori, src.source,
		src.loadtime,
		src.username
	);

-- Ulkomaalaisen opetus- ja tutkimushenkilökunnan osuus uraportaat III-IV

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_henkilostotiedot_yliopisto' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			f.vuosi as tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			CAST(SUM(CASE WHEN d3.maatjavaltiot2_fi NOT IN ('Suomi', 'Tieto puutuu') THEN f.henkilotyovuosi ELSE 0 END) as float) / CAST(SUM(f.henkilotyovuosi) as float) as arvo,
			'ulk_opetus_iii_iv' as indikaattori
		FROM [ANTERO].[dw].[f_yo_henkilon_tyo] f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_yliopisto_id
		LEFT JOIN ANTERO.dw.d_yo_tehtavanjaottelu d2 on d2.id = f.d_tehtavanjaottelu_id
		LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d3 on d3.id = f.d_kansalaisuus_id
		LEFT JOIN ANTERO.dw.d_yo_tutkijanuravaihe d5 on d5.id=f.d_tutkijanuravaihe_id
		WHERE vuosi >= 2018 and d2.selite_fi in ('Opetus- ja tutkimushenkilökunta') and d5.koodi in (3,4)
		GROUP BY vuosi, d1.organisaatio_nykyinen_koodi
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN d3b.maatjavaltiot2_fi NOT IN ('Suomi', 'Tieto puuttuu') THEN fb.henkilotyovuosi ELSE 0 END) as float) / CAST(SUM(fb.henkilotyovuosi) as float) as arvo_sektori
		FROM [ANTERO].[dw].[f_yo_henkilon_tyo] fb 
		LEFT JOIN ANTERO.dw.d_yo_tehtavanjaottelu d2b on d2b.id = fb.d_tehtavanjaottelu_id
		LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d3b on d3b.id = fb.d_kansalaisuus_id
		LEFT JOIN ANTERO.dw.d_yo_tutkijanuravaihe d5b on d5b.id=fb.d_tutkijanuravaihe_id
		WHERE d2b.selite_fi in ('Opetus- ja tutkimushenkilökunta')  and d5b.koodi in (3,4) and fb.vuosi = f.tilastovuosi
	) s
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED AND (target.arvo <> src.arvo OR target.arvo_sektori <> src.arvo_sektori) THEN
	UPDATE SET
		target.[arvo] = src.arvo,
		target.[arvo_sektori] = src.arvo_sektori,
		target.[source] = src.source,
		target.loadtime = GETDATE(),
		target.username = SUSER_NAME()
WHEN NOT MATCHED THEN
	INSERT (
		tilastovuosi,
		organisaatio_koodi,
		arvo,
		arvo_sektori,
		indikaattori,
		source,
		loadtime,
		username
	)
	VALUES (
		src.tilastovuosi,src. organisaatio_koodi, src.arvo, src.arvo_sektori, src.indikaattori, src.source,
		src.loadtime,
		src.username
	);

-- Ulkopuolinen tutkimusrahoitus per opetus- ja tutkimushenkilöstön htv

DECLARE @maxVuosi int

SET @maxVuosi = (SELECT MAX(tilikausi) FROM ANTERO.dw.f_yo_talous)

DROP TABLE IF EXISTS ANTERO.sa.sa_ulkop_rahoitus_opetus_tutkimus_htv_temp 

SELECT f.* INTO ANTERO.sa.sa_ulkop_rahoitus_opetus_tutkimus_htv_temp 
FROM (
	SELECT 
		f.vuosi as tilastovuosi,
		d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
		SUM(f.henkilotyovuosi) as htv,
		0 as ulkopuolinen_rahoitus,
		'ulkop_rahoitus_opetus_tutkimus_htv' as indikaattori
	FROM [ANTERO].[dw].[f_yo_henkilon_tyo] f
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_yliopisto_id
	LEFT JOIN ANTERO.dw.d_yo_tehtavanjaottelu d2 on d2.id = f.d_tehtavanjaottelu_id
	LEFT JOIN ANTERO.dw.d_yo_tutkijanuravaihe d5 on d5.id=f.d_tutkijanuravaihe_id
	WHERE vuosi BETWEEN 2018 and @maxVuosi and d2.selite_fi in ('Opetus- ja tutkimushenkilökunta') and d5.koodi BETWEEN 1 and 5
	GROUP BY vuosi, d1.organisaatio_nykyinen_koodi

	UNION ALL

	SELECT
		tilikausi as tilastovuosi,
		d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
		0 as htv,
		SUM(f.arvo) as ulkopuolinen_rahoitus,
		'ulkop_rahoitus_opetus_tutkimus_htv' as indikaattori
	FROM ANTERO.dw.f_yo_talous f
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON f.d_yo_id = d1.id
	INNER JOIN ANTERO.dw.d_tili d2 ON f.d_tili_id = d2.id
	WHERE d2.tili_taso0_fi = 'Tutkimusmenot' and d2.tili_taso1_fi in ('Perusrahoitus', 'Ulkomainen ulkopuolinen rahoitus', 'Kotimainen ulkopuolinen rahoitus') 
	AND f.tilikausi >= 2018
	GROUP BY tilikausi, d1.organisaatio_nykyinen_koodi
) f

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_henkilostotiedot_yliopisto' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.tilastovuosi,
			f.organisaatio_koodi,
			ROUND(SUM(CAST(f.ulkopuolinen_rahoitus as float)) / SUM(CAST(f.htv as float)),2) as arvo,
			f.indikaattori
		FROM ANTERO.sa.sa_ulkop_rahoitus_opetus_tutkimus_htv_temp f
		GROUP BY f.tilastovuosi, f.organisaatio_koodi, f.indikaattori
	) f
	OUTER APPLY (
		SELECT 
			ROUND(SUM(CAST(fb.ulkopuolinen_rahoitus as float)) / SUM(CAST(fb.htv as float)),2) as arvo_sektori
		FROM ANTERO.sa.sa_ulkop_rahoitus_opetus_tutkimus_htv_temp fb
		WHERE fb.tilastovuosi = f.tilastovuosi
	) s
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED AND (target.arvo <> src.arvo OR target.arvo_sektori <> src.arvo_sektori) THEN
	UPDATE SET
		target.[arvo] = src.arvo,
		target.[arvo_sektori] = src.arvo_sektori,
		target.[source] = src.source,
		target.loadtime = GETDATE(),
		target.username = SUSER_NAME()
WHEN NOT MATCHED THEN
	INSERT (
		tilastovuosi,
		organisaatio_koodi,
		arvo,
		arvo_sektori,
		indikaattori,
		source,
		loadtime,
		username
	)
	VALUES (
		src.tilastovuosi,src. organisaatio_koodi, src.arvo, src.arvo_sektori, src.indikaattori, src.source,
		src.loadtime,
		src.username
	);

DROP TABLE IF EXISTS ANTERO.sa.sa_ulkop_rahoitus_opetus_tutkimus_htv_temp 

IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_henkilostotiedot_yliopisto') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END

GO

USE [ANTERO]