USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_taloustiedot]    Script Date: 17.4.2024 12:25:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_taloustiedot] as

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
			d3.organisaatio_nykyinen_koodi as organisaatio_koodi,
			CAST(SUM(CASE WHEN d2.tili_koodi in ('eakr', 'esr') THEN f.arvo ELSE 0 END) as float) / CAST(SUM(CASE WHEN d2.tili_taso1_fi in ('Kotimainen ulkopuolinen rahoitus', 'Ulkomainen ulkopuolinen rahoitus') THEN f.arvo ELSE 0 END) as float) as arvo,
			'rakennerah' as indikaattori
		FROM ANTERO.dw.f_amk_talous f
		LEFT JOIN ANTERO.dw.d_amk d1 ON f.d_amk_id = d1.id
		INNER JOIN ANTERO.dw.d_tili d2 ON f.d_tili_id = d2.id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 on d3.organisaatio_koodi = d1.amk_nykyinen_tunnus
		WHERE tilikausi >= 2018 and arvo <> 0
		GROUP BY tilikausi, d3.organisaatio_nykyinen_koodi
	) f
	OUTER APPLY (
		SELECT
			CAST(SUM(CASE WHEN d2b.tili_koodi in ('eakr', 'esr') THEN fb.arvo ELSE 0 END) as float) / CAST(SUM(CASE WHEN d2b.tili_taso1_fi in ('Kotimainen ulkopuolinen rahoitus', 'Ulkomainen ulkopuolinen rahoitus') THEN fb.arvo ELSE 0 END) as float) as arvo_sektori		
		FROM ANTERO.dw.f_amk_talous fb
		LEFT JOIN ANTERO.dw.d_amk d1b ON fb.d_amk_id = d1b.id
		INNER JOIN ANTERO.dw.d_tili d2b ON fb.d_tili_id = d2b.id
		WHERE fb.arvo <> 0 and fb.tilikausi = f.tilastovuosi
	) s
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED THEN
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
			d3.organisaatio_nykyinen_koodi as organisaatio_koodi,
			ROUND(CAST(SUM(f.arvo) as float) / 1000000, 1) as arvo,
			'ulkop_tk_rahoitus' as indikaattori
		FROM ANTERO.dw.f_amk_talous f
		LEFT JOIN ANTERO.dw.d_amk d1 ON f.d_amk_id = d1.id
		INNER JOIN ANTERO.dw.d_tili d2 ON f.d_tili_id = d2.id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 on d3.organisaatio_koodi = d1.amk_nykyinen_tunnus
		WHERE (d2.tili_taso5_fi in ('Muu EU-rahoitus', 'Muu ulkomainen rahoitus', 'Kansainväliset järjestöt', 'Ulkomaiset yritykset', 'Kunnat ja kuntainliitot') OR
		(d2.tili_taso0_fi = 'Tutkimusmenot' and d2.tili_taso5_fi = 'Kotimaiset yritykset') OR
		d2.tili_taso4_fi like '%ministeriö') AND f.tilikausi >= 2018
		GROUP BY tilikausi, d3.organisaatio_nykyinen_koodi
	) f
	OUTER APPLY (
		SELECT 
			SUM(arvo_sektori) as arvo_sektori --ROUND(AVG(fb.arvo_sektori),1) as arvo_sektori
		FROM (
			SELECT
				d3b.organisaatio_nykyinen_koodi,
				CAST(SUM(fb.arvo) as float) / 1000000 as arvo_sektori		
			FROM ANTERO.dw.f_amk_talous fb
			LEFT JOIN ANTERO.dw.d_amk d1b ON fb.d_amk_id = d1b.id
			INNER JOIN ANTERO.dw.d_tili d2b ON fb.d_tili_id = d2b.id
			LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3b on d3b.organisaatio_koodi = d1b.amk_nykyinen_tunnus
			WHERE (d2b.tili_taso5_fi in ('Muu EU-rahoitus', 'Muu ulkomainen rahoitus', 'Kansainväliset järjestöt', 'Ulkomaiset yritykset', 'Kunnat ja kuntainliitot') OR
			(d2b.tili_taso0_fi = 'Tutkimusmenot' and d2b.tili_taso5_fi = 'Kotimaiset yritykset') OR
			d2b.tili_taso4_fi like '%ministeriö') AND fb.tilikausi = f.tilastovuosi
			GROUP BY d3b.organisaatio_nykyinen_koodi
		) fb
	) s
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED THEN
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
