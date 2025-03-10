USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_taloustiedot]    Script Date: 10.3.2025 8.39.02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_taloustiedot] as

-- Rakennerahastojen osuus täydentävästä rahoituksesta

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_taloustiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			tilikausi as tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			CAST(SUM(CASE WHEN d2.tili_koodi in ('eakr', 'esr') THEN f.arvo ELSE 0 END) as float) / CAST(SUM(CASE WHEN d2.tili_taso1_fi in ('Kotimainen ulkopuolinen rahoitus', 'Ulkomainen ulkopuolinen rahoitus') THEN f.arvo ELSE 0 END) as float) as arvo,
			'rakennerah' as indikaattori
		FROM ANTERO.dw.f_amk_talous f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON f.d_amk_id = d1.id
		INNER JOIN ANTERO.dw.d_tili d2 ON f.d_tili_id = d2.id
		WHERE tilikausi >= 2018 and arvo <> 0
		GROUP BY tilikausi, d1.organisaatio_nykyinen_koodi
	) f
	OUTER APPLY (
		SELECT
			CAST(SUM(CASE WHEN d2b.tili_koodi in ('eakr', 'esr') THEN fb.arvo ELSE 0 END) as float) / CAST(SUM(CASE WHEN d2b.tili_taso1_fi in ('Kotimainen ulkopuolinen rahoitus', 'Ulkomainen ulkopuolinen rahoitus') THEN fb.arvo ELSE 0 END) as float) as arvo_sektori		
		FROM ANTERO.dw.f_amk_talous fb
		INNER JOIN ANTERO.dw.d_tili d2b ON fb.d_tili_id = d2b.id
		WHERE fb.arvo <> 0 and fb.tilikausi = f.tilastovuosi
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

-- Ulkopuolisen tk-rahoituksen määrä (miljoonaa euroa)

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_taloustiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			tilikausi as tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			ROUND(CAST(SUM(f.arvo) as float) / 1000000, 1) as arvo,
			'ulkop_tk_rahoitus' as indikaattori
		FROM ANTERO.dw.f_amk_talous f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON f.d_amk_id = d1.id
		INNER JOIN ANTERO.dw.d_tili d2 ON f.d_tili_id = d2.id
		WHERE d2.tili_taso1_fi in ('Ulkomainen ulkopuolinen rahoitus', 'Kotimainen ulkopuolinen rahoitus') AND f.tilikausi >= 2018
		GROUP BY tilikausi, d1.organisaatio_nykyinen_koodi
	) f
	OUTER APPLY (
		SELECT 
			SUM(arvo_sektori) as arvo_sektori --ROUND(AVG(fb.arvo_sektori),1) as arvo_sektori
		FROM (
			SELECT
				d1b.organisaatio_nykyinen_koodi,
				CAST(SUM(fb.arvo) as float) / 1000000 as arvo_sektori		
			FROM ANTERO.dw.f_amk_talous fb
			LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b ON fb.d_amk_id = d1b.id
			INNER JOIN ANTERO.dw.d_tili d2b ON fb.d_tili_id = d2b.id
			WHERE d2b.tili_taso1_fi in ('Ulkomainen ulkopuolinen rahoitus', 'Kotimainen ulkopuolinen rahoitus') AND fb.tilikausi = f.tilastovuosi
			GROUP BY d1b.organisaatio_nykyinen_koodi
		) fb
	) s
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED AND (target.arvo <> src.arvo OR target.arvo_sektori <> src.arvo_sektori)  THEN
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

-- Tutkimusmenot suhteessa liikevaihtoon

DECLARE @maxVuosi int

SET @maxVuosi = (SELECT MAX(tilastovuosi) FROM VipunenTK.[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_3_menot])

DROP TABLE IF EXISTS ANTERO.sa.sa_tutkimusmenot_liikevaihto_temp 

SELECT f.* INTO ANTERO.sa.sa_tutkimusmenot_liikevaihto_temp 
FROM (
	SELECT
		tilikausi as tilastovuosi,
		d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
		SUM(f.arvo) as liikevaihto,
		0 as tutkimusmenot,
		'tutkimusmenot_liikevaihto' as indikaattori
	FROM ANTERO.dw.f_yo_talous f
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON f.d_yo_id = d1.id
	INNER JOIN ANTERO.dw.d_tili d2 ON f.d_tili_id = d2.id
	WHERE d2.tili_koodi in ('yolaki49', 'valtio', 'okmperus', 'vtliiket', 'liiktuotot', 'muuttuot', 'vtmuutul', 'vtosuust', 'eurah', 'eusuora', 'eurahmuu', 'eumuut', 'eurahyrit', 'euyritys', 'kotirah', 'krahalt', 'kotiyritys', 'kyrityst', 'kotitalt', 'kotilahj', 'kunnat', 'kunnat3', 'muujulkh', 'sosturvarah', 'muuokm', 'muuokm3', 'muuvaltio', 'ulkmuu', 'muuulkmuurah', 'ulkyrity', 'muuulkyritys', 'vyhteiso', 'vottavoittelematon', 'BusinessFinland', 'BusinessFinland3', 'Akatemia', 'Akatemia3')
	and f.tilikausi BETWEEN 2018 AND @maxVuosi and f.konserni = 'E'
	GROUP BY tilikausi, d1.organisaatio_nykyinen_koodi

	UNION ALL

	SELECT 
		[tilastovuosi],
		coalesce(d.oppilaitoksen_korvaavakoodi,d.oppilaitoskoodi) as organisaatio_koodi,
		0 as liikevaihto,
		SUM(tutkimusmenot) * 1000 as tutkimusmenot,
		'tutkimusmenot_liikevaihto' as indikaattori
	FROM VipunenTK.[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_3_menot] f
	INNER JOIN VipunenTK.[dbo].d_oppilaitoksen_taustatiedot d ON d.id = f.oppilaitos_id
	WHERE tilastovuosi >= 2018
	GROUP BY [tilastovuosi],coalesce(d.oppilaitoksen_korvaavakoodi,d.oppilaitoskoodi)
) f

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_taloustiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.tilastovuosi,
			f.organisaatio_koodi,
			SUM(CAST(f.tutkimusmenot as float)) / SUM(CAST(f.liikevaihto as float)) as arvo,
			f.indikaattori
		FROM ANTERO.sa.sa_tutkimusmenot_liikevaihto_temp  f
		GROUP BY f.tilastovuosi, f.organisaatio_koodi, f.indikaattori
	) f
	OUTER APPLY (
		SELECT 
			SUM(CAST(fb.tutkimusmenot as float)) / SUM(CAST(fb.liikevaihto as float)) as arvo_sektori
		FROM ANTERO.sa.sa_tutkimusmenot_liikevaihto_temp fb
		WHERE fb.tilastovuosi = f.tilastovuosi
	) s
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED AND (target.arvo <> src.arvo OR target.arvo_sektori <> src.arvo_sektori)  THEN
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

DROP TABLE IF EXISTS ANTERO.sa.sa_tutkimusmenot_liikevaihto_temp 

-- Kotimaisten ja ulkomaisten yritysten tk-rahoitus 

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_taloustiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			tilikausi as tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			SUM(f.arvo) as arvo,
			'koti_ulkom_yritykset_tk' as indikaattori
		FROM ANTERO.dw.f_yo_talous f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON f.d_yo_id = d1.id
		INNER JOIN ANTERO.dw.d_tili d2 ON f.d_tili_id = d2.id
		WHERE (d2.tili_taso5_fi in ('Kotimaiset yritykset','Ulkomaiset yritykset') and tili_taso0_fi = 'Tutkimusmenot')
		and f.tilikausi >= 2018 
		GROUP BY tilikausi, d1.organisaatio_nykyinen_koodi
	) f
	OUTER APPLY (
		SELECT
			SUM(fb.arvo) as arvo_sektori
		FROM ANTERO.dw.f_yo_talous fb
		INNER JOIN ANTERO.dw.d_tili d2b ON fb.d_tili_id = d2b.id
		WHERE (d2b.tili_taso5_fi in ('Kotimaiset yritykset','Ulkomaiset yritykset') and d2b.tili_taso0_fi = 'Tutkimusmenot')
		and fb.tilikausi = f.tilastovuosi
	) s
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED AND (target.arvo <> src.arvo OR target.arvo_sektori <> src.arvo_sektori)  THEN
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

IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_taloustiedot') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END

GO

USE [ANTERO]