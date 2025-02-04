USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_tavoiteaikatiedot]    Script Date: 24.4.2024 14:47:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE  [dw].[p_lataa_f_indikaattorit_kk_tavoiteaikatiedot] as

-- Tavoiteajassa tutkinnon suorittaneet:

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_tavoiteaikatiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT  
			d2.vuosi as tilastovuosi,
			d1.organisaatio_koodi,
			d1.oppilaitostyyppi_koodi,
			d3.koulutusastetaso2_koodi,
			CAST(COUNT(DISTINCT CASE WHEN apusarake_tavoiteajassavalmistunut = 1 THEN f.apusarake_henkilokoodi ELSE NULL END) as float) / CAST(COUNT(DISTINCT f.apusarake_henkilokoodi) as float) as 'arvo',
			CASE
				WHEN d3.koulutusastetaso2_koodi = '62' THEN 'tavoiteaika_amk'
				WHEN d3.koulutusastetaso2_koodi = '63' THEN 'tavoiteaika_a_kk'
				ELSE 'tavoiteaika_y_kk'
			END as indikaattori
		FROM ANTERO.dw.f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys f 
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
		LEFT JOIN ANTERO.dw.d_kalenteri d2 ON d2.id  = f.d_kalenteri_tutkinnon_suoritus_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d3 on d3.id = f.d_koulutusluokitus_id
		WHERE apusarake_rahoitusmalli = 1 and d2.vuosi >= 2018 and d1.oppilaitostyyppi_koodi in ('41','42') and d3.koulutusastetaso2_koodi in ('62', '63', '72')
		GROUP BY d2.vuosi, d1.organisaatio_koodi, d1.oppilaitostyyppi_koodi, d3.koulutusastetaso2_koodi
	) f
	OUTER APPLY (
		SELECT  
			CAST(COUNT(DISTINCT CASE WHEN apusarake_tavoiteajassavalmistunut = 1 THEN fb.apusarake_henkilokoodi ELSE NULL END) as float) / CAST(COUNT(DISTINCT fb.apusarake_henkilokoodi) as float) as 'arvo_sektori'
		FROM ANTERO.dw.f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys fb 
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1b.id = fb.d_organisaatioluokitus_id
		LEFT JOIN ANTERO.dw.d_kalenteri d2b ON d2b.id  = fb.d_kalenteri_tutkinnon_suoritus_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d3b on d3b.id = fb.d_koulutusluokitus_id
		WHERE d1b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi and d2b.vuosi = f.tilastovuosi and fb.apusarake_rahoitusmalli = 1 and f.koulutusastetaso2_koodi = d3b.koulutusastetaso2_koodi
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

-- Aiemmin suoritetut tutkinnot

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_tavoiteaikatiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT  
			d2.vuosi as tilastovuosi,
			d1.organisaatio_koodi,
			d1.oppilaitostyyppi_koodi,
			d3.koulutusastetaso1_koodi,
			CAST(COUNT(DISTINCT CASE WHEN f.apusarake_aiempitutkinto = 1 THEN f.apusarake_henkilokoodi ELSE NULL END) as float) / CAST(COUNT(DISTINCT f.apusarake_henkilokoodi) as float) as 'arvo',
			CASE
				WHEN d3.koulutusastetaso1_koodi = '6' THEN 'aiempi_a_kk'
				ELSE 'aiempi_y_kk'
			END as indikaattori
		FROM ANTERO.dw.f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys f 
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
		LEFT JOIN ANTERO.dw.d_kalenteri d2 ON d2.id  = f.d_kalenteri_tutkinnon_suoritus_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d3 on d3.id = f.d_koulutusluokitus_id
		WHERE apusarake_rahoitusmalli = 1 and d2.vuosi >= 2018 and d1.oppilaitostyyppi_koodi in ('41','42') and d3.koulutusastetaso2_koodi in ('62', '63', '72')
		GROUP BY d2.vuosi, d1.organisaatio_koodi, d3.koulutusastetaso1_koodi, d1.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT  
			CAST(COUNT(DISTINCT CASE WHEN fb.apusarake_aiempitutkinto = 1 THEN fb.apusarake_henkilokoodi ELSE NULL END) as float) / CAST(COUNT(DISTINCT fb.apusarake_henkilokoodi) as float) as 'arvo_sektori'
		FROM ANTERO.dw.f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys fb 
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1b.id = fb.d_organisaatioluokitus_id
		LEFT JOIN ANTERO.dw.d_kalenteri d2b ON d2b.id  = fb.d_kalenteri_tutkinnon_suoritus_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d3b on d3b.id = fb.d_koulutusluokitus_id
		WHERE d1b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi and d2b.vuosi = f.tilastovuosi and fb.apusarake_rahoitusmalli = 1 and f.koulutusastetaso1_koodi = d3b.koulutusastetaso1_koodi
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

IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_tavoiteaikatiedot') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END

GO

USE [ANTERO]
