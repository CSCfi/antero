USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_55_op]    Script Date: 24.4.2024 12:48:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_55_op] as

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_55_op' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			f.vuosi as tilastovuosi,
			d2.organisaatio_nykyinen_koodi as organisaatio_koodi,
			d2.oppilaitostyyppi_koodi,
			CAST(SUM(CASE WHEN f.suorittanut55 = 1 THEN f.suorittanut55 ELSE 0 END) as float) / CAST(SUM(case when f.lasna_syksy_edellinen=1 or f.lasna_kevat=1 then 1 else 0 end) as float) as arvo,
			'yli_55_op' as indikaattori 
		FROM [ANTERO].[dw].[f_virta_otp_55_tilasto] f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatio_id
		WHERE f.vuosi >= 2018 and d2.oppilaitostyyppi_koodi in ('41','42')
		GROUP BY vuosi, organisaatio_nykyinen_koodi, d2.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN fb.suorittanut55 = 1 THEN fb.suorittanut55 ELSE 0 END) as float) / CAST(SUM(case when fb.lasna_syksy_edellinen=1 or fb.lasna_kevat=1 then 1 else 0 end) as float) as arvo_sektori
		FROM [ANTERO].[dw].[f_virta_otp_55_tilasto] fb
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2b on d2b.id = fb.d_organisaatio_id
		WHERE fb.vuosi = f.tilastovuosi and d2b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi
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
	
IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_55_op') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END
	
GO

USE [ANTERO]
