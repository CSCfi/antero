USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_tutkinnon_suorittaneet_vaihdossa]    Script Date: 23.8.2024 8:01:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_tutkinnon_suorittaneet_vaihdossa] as

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		coalesce(f2.vaihdossa_olleet,0) / f.tutkinnot as arvo,
		s.vaihdossa_olleet_sektori / s2.tutkinnot_sektori as arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_tutkinnon_suorittaneet_vaihdossa' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT   
			f.tilastointivuosi as tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			d1.oppilaitostyyppi_koodi,
			SUM(lukumaara) as tutkinnot,
			CASE
				WHEN d2.koulutusastetaso2_koodi = '62' THEN 'amk_vaihdossa'
				ELSE 'a_y_kk_vaihdossa'
			END as indikaattori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_avain = 'oppilaitos_' + f.oppilaitos
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_avain	= 'koulutus_' + f.koulutusluokitus
		WHERE f.tilastointivuosi BETWEEN 2018 and (select max(tilastovuosi) FROM ANTERO.[dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa])
		and d2.koulutusastetaso2_koodi in ('62', '63', '72')  and d1.oppilaitostyyppi_koodi in ('41','42')
		GROUP BY f.tilastointivuosi, d1.organisaatio_nykyinen_koodi, d1.oppilaitostyyppi_koodi, CASE WHEN d2.koulutusastetaso2_koodi = '62' THEN 'amk_vaihdossa' ELSE 'a_y_kk_vaihdossa' END
	) f
	LEFT JOIN (
		SELECT   
			f.tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			d1.oppilaitostyyppi_koodi,
			CAST(COUNT(DISTINCT f.opiskelijaavain) + SUM(f.lukumaara) as float) as vaihdossa_olleet
		FROM [ANTERO].[dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa] f 
		LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
		LEFT JOIN dw.d_koulutusluokitus d2 on d2.id	= f.d_koulutusluokitus_id
		WHERE f.tilastovuosi BETWEEN 2018 and (SELECT MAX(tilastointivuosi) FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot]) and 
		(d2.koulutusastetaso2_koodi in ('62', '63' ,'72')) and d1.oppilaitostyyppi_koodi in ('41','42')
		GROUP BY f.tilastovuosi, d1.organisaatio_nykyinen_koodi, d1.oppilaitostyyppi_koodi
	) f2 on f2.tilastovuosi = f.tilastovuosi and f2.organisaatio_koodi = f.organisaatio_koodi
	OUTER APPLY (
		SELECT   
			CAST(COUNT(DISTINCT fb.opiskelijaavain) + SUM(fb.lukumaara) as float) as vaihdossa_olleet_sektori
		FROM [ANTERO].[dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa] fb
		LEFT JOIN dw.d_organisaatioluokitus d1b on d1b.id = fb.d_organisaatioluokitus_id
		LEFT JOIN dw.d_koulutusluokitus d2b on d2b.id	= fb.d_koulutusluokitus_id
		WHERE (d2b.koulutusastetaso2_koodi in ('62', '63','72')) and d1b.oppilaitostyyppi_koodi in ('41','42') 
		and fb.tilastovuosi = f.tilastovuosi and d1b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi
	) s
	OUTER APPLY (
		SELECT   
			SUM(lukumaara) as tutkinnot_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] fb
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1b.organisaatio_avain = 'oppilaitos_' + fb.oppilaitos
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_avain	= 'koulutus_' + fb.koulutusluokitus
		WHERE d2b.koulutusastetaso2_koodi in ('62', '63', '72') 
		and fb.tilastointivuosi = f.tilastovuosi and d1b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi
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

IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_tutkinnon_suorittaneet_vaihdossa') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END


GO