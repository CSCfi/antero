USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_julkaisutiedot]    Script Date: 23.8.2024 8:12:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_julkaisutiedot] as

-- Avoimet julkaisut

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_julkaisutiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			d1.oppilaitostyyppi_koodi,
			CAST(SUM(CASE WHEN d2.avoinsaatavuus_koodi in (1,2) or d4.kytkin_koodi = 1 THEN f.lukumaara ELSE 0 END) as float) / CAST(SUM(f.lukumaara) as float) as arvo, 
			'avoimet_julk' as indikaattori
		FROM [ANTERO].[dw].[f_virta_jtp_tilasto] f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatio_id
		LEFT JOIN ANTERO.dw.d_avoinsaatavuus d2 on d2.id = f.d_avoinSaatavuus_id
		LEFT JOIN ANTERO.dw.d_julkaisutyyppi d3 on d3.id = f.d_julkaisutyyppi_id
		LEFT JOIN ANTERO.dw.d_kytkin d4 on d4.id = f.d_rinnakkaistallennusKytkin_id
		LEFT JOIN ANTERO.dw.d_virtajtpsektori d5 on d5.id = f.d_virtajtpsektori_id
		WHERE ((d3.julkaisunpaaluokka_koodi in ('A', 'C') and d5.virtajtpsektori_koodi = 1) or
		(d3.julkaisunpaaluokka_koodi in ('A', 'B', 'C', 'D', 'E') and d5.virtajtpsektori_koodi = 2)) and f.tilastovuosi >= 2018
		and d1.oppilaitostyyppi_koodi in ('41','42')
		GROUP BY tilastovuosi, d1.organisaatio_nykyinen_koodi, d1.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT
			CAST(SUM(CASE WHEN d2b.avoinsaatavuus_koodi in (1,2) or d4b.kytkin_koodi = 1 THEN fb.lukumaara ELSE 0 END) as float) / CAST(SUM(fb.lukumaara) as float) as arvo_sektori
		FROM [ANTERO].[dw].[f_virta_jtp_tilasto] fb
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1b.id = fb.d_organisaatio_id
		LEFT JOIN ANTERO.dw.d_avoinsaatavuus d2b on d2b.id = fb.d_avoinSaatavuus_id
		LEFT JOIN ANTERO.dw.d_julkaisutyyppi d3b on d3b.id = fb.d_julkaisutyyppi_id
		LEFT JOIN ANTERO.dw.d_kytkin d4b on d4b.id = fb.d_rinnakkaistallennusKytkin_id
		LEFT JOIN ANTERO.dw.d_virtajtpsektori d5b on d5b.id = fb.d_virtajtpsektori_id
		WHERE ((d3b.julkaisunpaaluokka_koodi in ('A', 'C') and d5b.virtajtpsektori_koodi = 1) or
		(d3b.julkaisunpaaluokka_koodi in ('A', 'B', 'C', 'D', 'E') and d5b.virtajtpsektori_koodi = 2)) 
		and fb.tilastovuosi = f.tilastovuosi and d1b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi
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

-- Kansainväliset yhteisjulkaisut

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_julkaisutiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			d1.oppilaitostyyppi_koodi,
			CAST(SUM(CASE WHEN d2.kansainvalinen_yhteisjulkaisu_koodi = 1 THEN f.lukumaara ELSE 0 END) as float) / CAST(SUM(f.lukumaara) as float) as arvo, 
			'kv_yj' as indikaattori
		FROM [ANTERO].[dw].[f_virta_jtp_tilasto] f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatio_id
		LEFT JOIN ANTERO.dw.d_kansainvalinen_yhteisjulkaisu d2 on d2.id = f.d_kansainvalinen_yhteisjulkaisu_id
		LEFT JOIN ANTERO.dw.d_julkaisutyyppi d3 on d3.id = f.d_julkaisutyyppi_id
		LEFT JOIN ANTERO.dw.d_kytkin d4 on d4.id = f.d_rinnakkaistallennusKytkin_id
		LEFT JOIN ANTERO.dw.d_virtajtpsektori d5 on d5.id = f.d_virtajtpsektori_id
		LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d6 on d6.id = f.d_julkaisufoorumitaso_id
		WHERE d3.julkaisunpaaluokka_koodi in ('A', 'C') and d5.virtajtpsektori_koodi = 1 and f.tilastovuosi >= 2018
		and d1.oppilaitostyyppi_koodi = '42' and d6.julkaisufoorumitaso_koodi in ('1', '2', '3')
		GROUP BY tilastovuosi, d1.organisaatio_nykyinen_koodi, d1.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT
			CAST(SUM(CASE WHEN d2b.kansainvalinen_yhteisjulkaisu_koodi = 1 THEN fb.lukumaara ELSE 0 END) as float) / CAST(SUM(fb.lukumaara) as float) as arvo_sektori 
		FROM [ANTERO].[dw].[f_virta_jtp_tilasto] fb
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1b.id = fb.d_organisaatio_id
		LEFT JOIN ANTERO.dw.d_kansainvalinen_yhteisjulkaisu d2b on d2b.id = fb.d_kansainvalinen_yhteisjulkaisu_id
		LEFT JOIN ANTERO.dw.d_julkaisutyyppi d3b on d3b.id = fb.d_julkaisutyyppi_id
		LEFT JOIN ANTERO.dw.d_kytkin d4b on d4b.id = fb.d_rinnakkaistallennusKytkin_id
		LEFT JOIN ANTERO.dw.d_virtajtpsektori d5b on d5b.id = fb.d_virtajtpsektori_id
		LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d6b on d6b.id = fb.d_julkaisufoorumitaso_id
		WHERE d3b.julkaisunpaaluokka_koodi in ('A', 'C') and d5b.virtajtpsektori_koodi = 1 
		and d1b.oppilaitostyyppi_koodi = '42' and d6b.julkaisufoorumitaso_koodi in ('1', '2', '3')
		and fb.tilastovuosi = f.tilastovuosi
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

-- Yhteisjulkaisut yritysten kanssa

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_julkaisutiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			s.year as tilastovuosi,
			CASE
				WHEN d.organisaatio_koodi is not null THEN d.organisaatio_koodi
				WHEN university like '%Lappeenranta%' THEN '01914'
			END as organisaatio_koodi,
			SUM(CAST(s.p_industry_collab as float)) / SUM(CAST(collab_p as float)) as arvo,
			'yj_yritykset' as indikaattori
		FROM ANTERO.[sa].[sa_cwts_leiden_ranking] s
		OUTER APPLY (
			SELECT 
				MAX(organisaatio_koodi) as organisaatio_koodi 
			FROM ANTERO.dw.d_organisaatioluokitus d
			WHERE d.organisaatio_en = s.university
		) d
		GROUP BY 
		s.year, CASE WHEN d.organisaatio_koodi is not null THEN d.organisaatio_koodi WHEN university like '%Lappeenranta%' THEN '01914' END
	) f
	OUTER APPLY (
		SELECT
			AVG(CAST(sb.pp_industry_collab as float)) as arvo_sektori 
		FROM ANTERO.[sa].[sa_cwts_leiden_ranking] sb
		WHERE f.tilastovuosi = sb.year
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

IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_julkaisutiedot') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END

GO

USE [ANTERO]

