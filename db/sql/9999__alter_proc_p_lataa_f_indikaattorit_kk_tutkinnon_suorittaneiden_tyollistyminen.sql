USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_tutkinnon_suorittaneiden_tyollistyminen]    Script Date: 23.8.2024 8:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_tutkinnon_suorittaneiden_tyollistyminen] as

-- Ulkomaalaisten tutkinnon suorittaneiden työllistyminen

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_tutkinnon_suorittaneiden_tyollistyminen' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.tilastointivuosi as tilastovuosi,
			COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi) as organisaatio_koodi,
			d5.oppilaitostyyppi_koodi,
			CAST(SUM(CASE WHEN d3.paaasiallinen_toiminta_okm_koodi = 1 THEN f.sijoittuminen_1v_tutkinnon_jalkeen else 0 end) as float) / CAST(SUM(f.sijoittuminen_1v_tutkinnon_jalkeen) as float) as 'arvo',
			CASE
				WHEN d1.Koulutusaste_taso2_koodi = '62' THEN 'ulk_amk_tyol'
				ELSE 'ulk_y_kk_tyol'
			END as indikaattori
		FROM VipunenTK.dbo.f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta f
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d1 on d1.id = koulutusluokitus_id
		LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2 on d2.id = oppilaitos_id
		LEFT JOIN VipunenTK.dbo.d_paaasiallinen_toiminta_okm d3 on d3.id = paaasiallinen_toiminta_okm_id
		LEFT JOIN VipunenTK.dbo.d_eu_etamaat d4 ON d4.id = f.eu_etamaat_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 on d5.organisaatio_koodi = COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi)
		WHERE d1.Koulutusaste_taso2_koodi in ('62', '72') and tilastointivuosi >= 2018 and d5.organisaatio_koodi not in ('02633', '10031')
		and sijoittuminen_1v_tutkinnon_jalkeen <> 0 AND d4.eu_etamaat <> 'Suomi' and d5.oppilaitostyyppi_koodi in ('41','42')
		GROUP BY tilastointivuosi, COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi), d1.Koulutusaste_taso2_koodi, d5.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT
			CAST(SUM(CASE WHEN d3b.paaasiallinen_toiminta_okm_koodi = 1 THEN fb.sijoittuminen_1v_tutkinnon_jalkeen else 0 end) as float) / CAST(SUM(fb.sijoittuminen_1v_tutkinnon_jalkeen) as float) as arvo_sektori
		FROM VipunenTK.dbo.f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta fb
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d1b on d1b.id = fb.koulutusluokitus_id
		LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2b on d2b.id = fb.oppilaitos_id
		LEFT JOIN VipunenTK.dbo.d_paaasiallinen_toiminta_okm d3b on d3b.id = fb.paaasiallinen_toiminta_okm_id
		LEFT JOIN VipunenTK.dbo.d_eu_etamaat d4b ON d4b.id = fb.eu_etamaat_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5b on d5b.organisaatio_koodi = COALESCE(d2b.oppilaitoksen_korvaavakoodi, d2b.oppilaitoskoodi)
		WHERE d1b.Koulutusaste_taso2_koodi in ('62', '72') and fb.sijoittuminen_1v_tutkinnon_jalkeen <> 0 AND d4b.eu_etamaat <> 'Suomi' 
		and fb.tilastointivuosi = f.tilastovuosi and d5b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi and d5b.organisaatio_koodi not in ('02633', '10031')
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

-- Ylemmän kk-tutkinnon suorittaneista Uudellemaalle sijoittuneet  

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_tutkinnon_suorittaneiden_tyollistyminen' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.tilastointivuosi as tilastovuosi,
			COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi) as organisaatio_koodi,
			CAST(SUM(CASE WHEN d6.maakunta = 'Uusimaa' THEN f.sijoittuminen_1v_tutkinnon_jalkeen else 0 end) as float) / CAST(SUM(f.sijoittuminen_1v_tutkinnon_jalkeen) as float) as 'arvo',
			'y_kk_tyol_uusimaa' as indikaattori
		FROM VipunenTK.dbo.f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta f
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d1 on d1.id = koulutusluokitus_id
		LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2 on d2.id = f.oppilaitos_id
		LEFT JOIN VipunenTK.dbo.d_paaasiallinen_toiminta_okm d3 on d3.id = f.paaasiallinen_toiminta_okm_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 on d5.organisaatio_koodi = COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi)
		LEFT JOIN VipunenTK.dbo.d_alueluokitus d6 on d6.id = f.asuinmaakunta_id
		WHERE d1.Koulutusaste_taso2_koodi = '72' and tilastointivuosi >= 2018 and d5.organisaatio_koodi not in ('02633', '10031')
		AND sijoittuminen_1v_tutkinnon_jalkeen <> 0  AND d3.paaasiallinen_toiminta_okm_koodi = 1 AND  d5.oppilaitostyyppi_koodi = '42'
		GROUP BY tilastointivuosi, COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi)
	) f
	OUTER APPLY (
		SELECT
			CAST(SUM(CASE WHEN d6b.maakunta = 'Uusimaa' THEN fb.sijoittuminen_1v_tutkinnon_jalkeen else 0 end) as float) / CAST(SUM(fb.sijoittuminen_1v_tutkinnon_jalkeen) as float) as arvo_sektori
		FROM VipunenTK.dbo.f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta fb
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d1b on d1b.id = fb.koulutusluokitus_id
		LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2b on d2b.id = fb.oppilaitos_id
		LEFT JOIN VipunenTK.dbo.d_paaasiallinen_toiminta_okm d3b on d3b.id = fb.paaasiallinen_toiminta_okm_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5b on d5b.organisaatio_koodi = COALESCE(d2b.oppilaitoksen_korvaavakoodi, d2b.oppilaitoskoodi)
		LEFT JOIN VipunenTK.dbo.d_alueluokitus d6b on d6b.id = fb.asuinmaakunta_id
		WHERE d1b.Koulutusaste_taso2_koodi = '72' and fb.sijoittuminen_1v_tutkinnon_jalkeen <> 0 and d3b.paaasiallinen_toiminta_okm_koodi = 1 
		and fb.tilastointivuosi = f.tilastovuosi and d5b.organisaatio_koodi not in ('02633', '10031')
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

IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_tutkinnon_suorittaneiden_tyollistyminen') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END

GO