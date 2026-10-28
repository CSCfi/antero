USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_otv]    Script Date: 16.10.2026 9.15.39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE  [dw].[p_lataa_f_indikaattorit_kk_otv] as

-- Tutkinnon suorittaneista yli 30 vuotiaita

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_otv' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			tilastointivuosi as tilastovuosi,
			coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi) as organisaatio_koodi,
			d4.oppilaitostyyppi_koodi,
			CAST(SUM(CASE WHEN d3.ika_int >= 30 THEN f.tutkinnot ELSE 0 END) as float) / CAST(SUM(f.tutkinnot) as float) as arvo,
			CASE
				WHEN d2.koulutusastetaso2_koodi = '62' THEN 'amk_30'
				ELSE 'y_kk_30'
			END as indikaattori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1 ON d1.id = f.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.koulutusluokitus
		LEFT JOIN VipunenTK.dbo.d_ika d3 on d3.id = f.ika_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi)
		WHERE tilastointivuosi >= 2018 AND d2.koulutusastetaso2_koodi in ('62','72') and d4.oppilaitostyyppi_koodi in ('41','42')
		and d4.organisaatio_koodi not in ('02557', '02633','10031')
		GROUP BY tilastointivuosi, coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi), d2.koulutusastetaso2_koodi, d4.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN d3b.ika_int >= 30 THEN fb.tutkinnot ELSE 0 END) as float) / CAST(SUM(fb.tutkinnot) as float) as arvo_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] fb
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1b ON d1b.id = fb.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = fb.koulutusluokitus
		LEFT JOIN VipunenTK.dbo.d_ika d3b on d3b.id = fb.ika_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4b on d4b.organisaatio_koodi = coalesce(d1b.oppilaitoksen_korvaavakoodi,d1b.oppilaitoskoodi)
		WHERE d2b.koulutusastetaso2_koodi in ('62','72') and d4b.oppilaitostyyppi_koodi in ('41','42')
		and fb.tilastointivuosi = f.tilastovuosi and d4b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi
		and d4b.organisaatio_koodi not in ('02557', '02633','10031')
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

-- Ylempien amk-tutkintojen suhde amk-tutkintoihin

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_otv' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			f.tilastointivuosi as tilastovuosi,
			coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi) as organisaatio_koodi,
			CAST(SUM(CASE WHEN d3.koulutusastetaso2_koodi = '71' THEN tutkinnot ELSE 0 END) as float) / CAST(SUM(CASE WHEN d3.koulutusastetaso2_koodi = '62' THEN tutkinnot ELSE 0 END) as float) as arvo,
			'yamk_amk' as indikaattori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1 ON d1.id = f.oppilaitos_id
		LEFT JOIN [VipunenTK].[dbo].d_lahde d2 ON d2.id = f.lahde_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d3 on d3.koulutusluokitus_koodi = f.koulutusluokitus
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi)
		WHERE d2.lahde_koodi in ('-1','41','42') AND d1.oppilaitoskoodi NOT IN ('02557','10031','02358') AND 
		coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi) not in ('01029','01569','10102')  AND
		f.tilastointivuosi >= 2018 and d4.oppilaitostyyppi_koodi = '41'
		GROUP BY f.tilastointivuosi, coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi)
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN d3b.koulutusastetaso2_koodi = '71' THEN fb.tutkinnot ELSE 0 END) as float) / CAST(SUM(CASE WHEN d3b.koulutusastetaso2_koodi = '62' THEN fb.tutkinnot ELSE 0 END) as float) as arvo_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] fb
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1b ON d1b.id = fb.oppilaitos_id
		LEFT JOIN [VipunenTK].[dbo].d_lahde d2b ON d2b.id = fb.lahde_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d3b on d3b.koulutusluokitus_koodi = fb.koulutusluokitus
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4b on d4b.organisaatio_koodi = coalesce(d1b.oppilaitoksen_korvaavakoodi,d1b.oppilaitoskoodi)
		WHERE d2b.lahde_koodi in ('-1','41','42') AND d1b.oppilaitoskoodi NOT IN ('02557','10031','02358') AND 
		coalesce(d1b.oppilaitoksen_korvaavakoodi,d1b.oppilaitoskoodi) not in ('01029','01569','10102')  AND
		d4b.oppilaitostyyppi_koodi = '41'
		and fb.tilastointivuosi = f.tilastovuosi
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

-- Kv-opiskelijoiden suorittamien amk-tutkintojen osuus

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_otv' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			tilastointivuosi as tilastovuosi,
			coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi) as organisaatio_koodi,
			d4.oppilaitostyyppi_koodi,
			CAST(SUM(CASE WHEN d5.kylla_ei = 'Kyllä' THEN f.tutkinnot ELSE 0 END) as float) / CAST(SUM(f.tutkinnot) as float) as arvo,
			'ulk_amk' as indikaattori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1 ON d1.id = f.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.koulutusluokitus
		LEFT JOIN VipunenTK.[dbo].d_kylla_ei d5 ON d5.id = f.kvopisk_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi)
		WHERE tilastointivuosi >= 2018 AND d2.koulutusastetaso2_koodi = '62' and d4.oppilaitostyyppi_koodi = '41'
		and d4.organisaatio_koodi not in ('02557', '02633','10031')
		GROUP BY tilastointivuosi, coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi), d2.koulutusastetaso2_koodi, d4.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN d5b.kylla_ei = 'Kyllä' THEN fb.tutkinnot ELSE 0 END) as float) / CAST(SUM(fb.tutkinnot) as float) as arvo_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] fb
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1b ON d1b.id = fb.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = fb.koulutusluokitus
		LEFT JOIN VipunenTK.[dbo].d_kylla_ei d5b ON d5b.id = fb.kvopisk_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4b on d4b.organisaatio_koodi = coalesce(d1b.oppilaitoksen_korvaavakoodi,d1b.oppilaitoskoodi)
		WHERE d2b.koulutusastetaso2_koodi = '62'  and d4b.oppilaitostyyppi_koodi = '41'
		and fb.tilastointivuosi = f.tilastovuosi and d4b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi
		and d4b.organisaatio_koodi not in ('02557', '02633','10031')
	) s
	WHERE s.arvo_sektori > 0
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

-- Kv-opiskelijoiden suorittamat tutkinnot ylemmät kk-tutkinnot

DECLARE @minVuosi int
DECLARE @maxVuosi int

SET @minVuosi = (
	SELECT MIN(f.tilastointivuosi) FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	LEFT JOIN VipunenTK.[dbo].d_kylla_ei d5 ON d5.id = f.kvopisk_id
	WHERE d5.kylla_ei in ('Kyllä', 'Ei')
	)

SET @maxVuosi = (
	SELECT MAX(f.tilastointivuosi) FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	LEFT JOIN VipunenTK.[dbo].d_kylla_ei d5 ON d5.id = f.kvopisk_id
	WHERE d5.kylla_ei in ('Kyllä', 'Ei')
	)

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_otv' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			tilastointivuosi as tilastovuosi,
			coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi) as organisaatio_koodi,
			d4.oppilaitostyyppi_koodi,
			CAST(SUM(CASE WHEN d5.kylla_ei = 'Kyllä' THEN f.tutkinnot ELSE 0 END) as float) / CAST(SUM(f.tutkinnot) as float) as arvo,
			'kv_y_kk' indikaattori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1 ON d1.id = f.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.koulutusluokitus
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi)
		LEFT JOIN VipunenTK.[dbo].d_kylla_ei d5 ON d5.id = f.kvopisk_id
		LEFT JOIN VipunenTk.[dbo].d_rahoituslahde d6 ON d6.id = f.rahoituslahde_id
		WHERE tilastointivuosi BETWEEN @minVuosi and @maxVuosi AND d2.koulutusastetaso2_koodi = '72' and d4.oppilaitostyyppi_koodi = '42'
		and d6.rahoituslahde_koodi <> 4 -- ei tilauskoulutusta
		GROUP BY tilastointivuosi, coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi), d4.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN d5b.kylla_ei = 'Kyllä' THEN fb.tutkinnot ELSE 0 END) as float) / CAST(SUM(fb.tutkinnot) as float) as arvo_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] fb
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1b ON d1b.id = fb.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = fb.koulutusluokitus
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4b on d4b.organisaatio_koodi = coalesce(d1b.oppilaitoksen_korvaavakoodi,d1b.oppilaitoskoodi)
		LEFT JOIN VipunenTK.[dbo].d_kylla_ei d5b ON d5b.id = fb.kvopisk_id
		LEFT JOIN VipunenTk.[dbo].d_rahoituslahde d6b ON d6b.id = fb.rahoituslahde_id
		WHERE d2b.koulutusastetaso2_koodi = '72'  and d4b.oppilaitostyyppi_koodi = '42'
		and fb.tilastointivuosi = f.tilastovuosi and d4b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi
		and d6b.rahoituslahde_koodi <> 4 -- ei tilauskoulutusta
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

-- Ylemmät kk-tutkinnot per alemmat kk-tutkinnot

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_otv' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			tilastointivuosi as tilastovuosi,
			coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi) as organisaatio_koodi,
			d4.oppilaitostyyppi_koodi,
			CAST(SUM(CASE WHEN d2.koulutusastetaso2_koodi = '72' THEN f.tutkinnot ELSE 0 END) as float) / CAST(SUM(CASE WHEN d2.koulutusastetaso2_koodi = '63' THEN f.tutkinnot ELSE 0 END) as float) as arvo,
			'y_kk_a_kk' indikaattori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1 ON d1.id = f.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.koulutusluokitus
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi)
		LEFT JOIN VipunenTk.[dbo].d_rahoituslahde d6 ON d6.id = f.rahoituslahde_id
		WHERE tilastointivuosi >= 2018 AND d2.koulutusastetaso2_koodi in ('63', '72') and d4.oppilaitostyyppi_koodi = '42'
		and d6.rahoituslahde_koodi <> 4 -- ei tilauskoulutusta
		GROUP BY tilastointivuosi, coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi),d4.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN d2b.koulutusastetaso2_koodi = '72' THEN fb.tutkinnot ELSE 0 END) as float) / CAST(SUM(CASE WHEN d2b.koulutusastetaso2_koodi = '63' THEN fb.tutkinnot ELSE 0 END) as float) as arvo_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] fb
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1b ON d1b.id = fb.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = fb.koulutusluokitus
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4b on d4b.organisaatio_koodi = coalesce(d1b.oppilaitoksen_korvaavakoodi,d1b.oppilaitoskoodi)
		LEFT JOIN VipunenTk.[dbo].d_rahoituslahde d6b ON d6b.id = fb.rahoituslahde_id
		WHERE d2b.koulutusastetaso2_koodi in ('63', '72') and d4b.oppilaitostyyppi_koodi = '42'
		and fb.tilastointivuosi = f.tilastovuosi and d4b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi
		and d6b.rahoituslahde_koodi <> 4 -- ei tilauskoulutusta
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

-- Tohtorin tutkinnot per ylemmät kk-tutkinnot

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_otv' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			tilastointivuosi as tilastovuosi,
			coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi) as organisaatio_koodi,
			d4.oppilaitostyyppi_koodi,
			CAST(SUM(CASE WHEN d2.koulutusastetaso2_koodi = '82' THEN f.tutkinnot ELSE 0 END) as float) / CAST(SUM(CASE WHEN d2.koulutusastetaso2_koodi = '72' THEN f.tutkinnot ELSE 0 END) as float) as arvo,
			'toht_y_kk' indikaattori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1 ON d1.id = f.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.koulutusluokitus
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi)
		LEFT JOIN VipunenTk.[dbo].d_rahoituslahde d6 ON d6.id = f.rahoituslahde_id
		WHERE tilastointivuosi >= 2018 AND d2.koulutusastetaso2_koodi in ('72', '82') and d4.oppilaitostyyppi_koodi = '42'
		and d6.rahoituslahde_koodi <> 4 -- ei tilauskoulutusta
		GROUP BY tilastointivuosi, coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi),d4.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN d2b.koulutusastetaso2_koodi = '82' THEN fb.tutkinnot ELSE 0 END) as float) / CAST(SUM(CASE WHEN d2b.koulutusastetaso2_koodi = '72' THEN fb.tutkinnot ELSE 0 END) as float) as arvo_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] fb
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1b ON d1b.id = fb.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = fb.koulutusluokitus
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4b on d4b.organisaatio_koodi = coalesce(d1b.oppilaitoksen_korvaavakoodi,d1b.oppilaitoskoodi)
		LEFT JOIN VipunenTk.[dbo].d_rahoituslahde d6b ON d6b.id = fb.rahoituslahde_id
		WHERE d2b.koulutusastetaso2_koodi in ('72', '82') and d4b.oppilaitostyyppi_koodi = '42'
		and fb.tilastointivuosi = f.tilastovuosi and d4b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi
		and d6b.rahoituslahde_koodi <> 4 -- ei tilauskoulutusta
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

-- Kansainvälisten tohtorintutkinto-opiskelijoiden osuus

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_otv' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			tilastointivuosi as tilastovuosi,
			coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi) as organisaatio_koodi,
			CAST(SUM(CASE WHEN d5.kylla_ei = 'Kyllä' THEN f.opiskelijat ELSE 0 END) as float) / CAST(SUM(f.opiskelijat) as float) as arvo,
			'kv_toht' indikaattori
		FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] f
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1 ON d1.id = f.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.koulutusluokitus
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi)
		LEFT JOIN VipunenTK.[dbo].d_kylla_ei d5 ON d5.id = f.kvopisk_id
		LEFT JOIN VipunenTk.[dbo].d_rahoituslahde d6 ON d6.id = f.rahoituslahde_id
		WHERE tilastointivuosi BETWEEN @minVuosi and @maxVuosi AND d2.koulutusastetaso2_koodi = '82' and d4.oppilaitostyyppi_koodi = '42'
		and d6.rahoituslahde_koodi <> 4 -- ei tilauskoulutusta
		GROUP BY tilastointivuosi, coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi)
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN d5b.kylla_ei = 'Kyllä' THEN fb.opiskelijat ELSE 0 END) as float) / CAST(SUM(fb.opiskelijat) as float) as arvo_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] fb
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1b ON d1b.id = fb.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = fb.koulutusluokitus
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4b on d4b.organisaatio_koodi = coalesce(d1b.oppilaitoksen_korvaavakoodi,d1b.oppilaitoskoodi)
		LEFT JOIN VipunenTK.[dbo].d_kylla_ei d5b ON d5b.id = fb.kvopisk_id
		LEFT JOIN VipunenTk.[dbo].d_rahoituslahde d6b ON d6b.id = fb.rahoituslahde_id
		WHERE d2b.koulutusastetaso2_koodi = '82'  and d4b.oppilaitostyyppi_koodi = '42'
		and fb.tilastointivuosi = f.tilastovuosi and d6b.rahoituslahde_koodi <> 4 -- ei tilauskoulutusta
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

IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_otv') = cast(getdate() as date)
BEGIN

	EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]

	DELETE ANTERO.dw.f_indikaattorit_kk_ohjauksen_ala
	WHERE tarkenne in ('otv_opiskelijat', 'otv_tutkinnot')

	INSERT INTO ANTERO.dw.f_indikaattorit_kk_ohjauksen_ala
	(
		tilastovuosi,
		organisaatio_koodi,
		okmohjauksenala_koodi,
		kv_opiskelija,
		tilauskoulutus,
		amk_opiskelijat,
		alempi_kk_opiskelijat,
		ylempi_kk_opiskelijat,
		tohtoriopiskelijat,
		tarkenne,
		loadtime,
		username,
		source
	)
	SELECT 
		tilastointivuosi as tilastovuosi,
		COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi) as organisaatio_koodi,
		d4.okmohjauksenala_koodi,
		CASE WHEN d5.kylla_ei_koodi = 'K' THEN 1 ELSE 0 END as kv_opiskelija,
		CASE WHEN d6.rahoituslahde_koodi = 4 THEN 1 ELSE 0 END as tilauskoulutus,
		SUM(CASE WHEN d4.koulutusastetaso2_koodi = '62' THEN opiskelijat ELSE 0 END) as amk_opiskelijat,
		SUM(CASE WHEN d4.koulutusastetaso2_koodi = '63' THEN opiskelijat ELSE 0 END) as alempi_kk_opiskelijat,
		SUM(CASE WHEN d4.koulutusastetaso2_koodi = '72' THEN opiskelijat ELSE 0 END) as ylempi_kk_opiskelijat,
		SUM(CASE WHEN d4.koulutusastetaso2_koodi = '82' THEN opiskelijat ELSE 0 END) as tohtoriopiskelijat,
		'otv_opiskelijat' as tarkenne,
		GETDATE() as loadtime,
		SUSER_SNAME() as username,
		'p_lataa_f_indikaattorit_kk_otv' as source
	FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] f
	LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d2 ON d2.id = f.oppilaitos_id
	LEFT JOIN [VipunenTK].[dbo].d_lahde d3 ON d3.id = f.lahde_id
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d4 on d4.koulutusluokitus_koodi = f.koulutusluokitus
	LEFT JOIN VipunenTK.[dbo].d_kylla_ei d5 ON d5.id = f.kvopisk_id
	LEFT JOIN VipunenTk.[dbo].d_rahoituslahde d6 ON d6.id = f.rahoituslahde_id
	WHERE d3.lahde_koodi in ('-1','41','42','51','52') AND d2.oppilaitoskoodi NOT IN ('02557','10031','02358') AND 
	coalesce(d2.oppilaitoksen_korvaavakoodi,d2.oppilaitoskoodi) not in ('01029','01569','10102') AND
	tilastointivuosi >= 2018 AND d4.koulutusastetaso2_koodi in ('62','63','72','82') 
	GROUP BY tilastointivuosi, COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi),d4.okmohjauksenala_koodi,
	CASE WHEN d5.kylla_ei_koodi = 'K' THEN 1 ELSE 0 END, CASE WHEN d6.rahoituslahde_koodi = 4 THEN 1 ELSE 0 END

	INSERT INTO ANTERO.dw.f_indikaattorit_kk_ohjauksen_ala
	(
		tilastovuosi,
		organisaatio_koodi,
		okmohjauksenala_koodi,
		ika_vahintaan_30,
		kv_opiskelija,
		tilauskoulutus,
		tohtorintutkinnot,
		amk_tutkinnot,
		ylemmat_amk_tutkinnot,
		alemmat_kk_tutkinnot,
		ylemmat_kk_tutkinnot,
		tarkenne,
		loadtime,
		username,
		source
	)

	SELECT 
		tilastointivuosi as tilastovuosi,
		COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi) as organisaatio_koodi,
		d4.okmohjauksenala_koodi,
		CASE WHEN d5.ika_int >= 30 THEN 1 ELSE 0 END as ika_vahintaan_30,
		CASE WHEN d6.kylla_ei_koodi = 'K' THEN 1 ELSE 0 END as kv_opiskelija,
		CASE WHEN d7.rahoituslahde_koodi = 4 THEN 1 ELSE 0 END as tilauskoulutus,
		SUM(CASE WHEN d4.koulutusastetaso2_koodi = '82' THEN tutkinnot ELSE 0 END) as tohtorintutkinnot,
		SUM(CASE WHEN d4.koulutusastetaso2_koodi = '62' THEN tutkinnot ELSE 0 END) as amk_tutkinnot,
		SUM(CASE WHEN d4.koulutusastetaso2_koodi = '71' THEN tutkinnot ELSE 0 END) as ylemmat_amk_tutkinnot,
		SUM(CASE WHEN d4.koulutusastetaso2_koodi = '63' THEN tutkinnot ELSE 0 END) as alemmat_kk_tutkinnot,
		SUM(CASE WHEN d4.koulutusastetaso2_koodi = '72' THEN tutkinnot ELSE 0 END) as ylemmat_kk_tutkinnot,
		'otv_tutkinnot' as tarkenne,
		GETDATE() as loadtime,
		SUSER_SNAME() as username,
		'p_lataa_f_indikaattorit_kk_otv' as source
	FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d2 ON d2.id = f.oppilaitos_id
	LEFT JOIN [VipunenTK].[dbo].d_lahde d3 ON d3.id = f.lahde_id
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d4 on d4.koulutusluokitus_koodi = f.koulutusluokitus
	LEFT JOIN VipunenTK.dbo.d_ika d5 on d5.id = f.ika_id
	LEFT JOIN VipunenTK.[dbo].d_kylla_ei d6 ON d6.id = f.kvopisk_id
	LEFT JOIN VipunenTk.[dbo].d_rahoituslahde d7 ON d7.id = f.rahoituslahde_id
	WHERE d3.lahde_koodi in ('-1','41','42','51','52') AND d2.oppilaitoskoodi NOT IN ('02557','10031','02358')  AND
	tilastointivuosi >= 2018 AND d4.koulutusastetaso2_koodi in ('62','63','71','72','82')
	GROUP BY tilastointivuosi, COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi), CASE WHEN d5.ika_int >= 30 THEN 1 ELSE 0 END, d4.okmohjauksenala_koodi,
	CASE WHEN d6.kylla_ei_koodi = 'K' THEN 1 ELSE 0 END, CASE WHEN d7.rahoituslahde_koodi = 4 THEN 1 ELSE 0 END
	
	BEGIN TRY
		EXEC msdb.dbo.sp_start_job @job_name = N'Tabular process Korkeakoulujen seurantaindikaattorit';
	END TRY
	BEGIN CATCH
		PRINT 'sp_start_job note: ' + ERROR_MESSAGE();
	END CATCH

END