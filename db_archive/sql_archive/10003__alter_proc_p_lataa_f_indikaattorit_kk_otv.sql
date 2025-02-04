USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_otv]    Script Date: 23.8.2024 8:04:16 ******/
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

-- Ulkomaalaisten suorittamat amk-tutkinnot

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
			CAST(SUM(CASE WHEN d3.kansalaisuus_versio2 <> 'Suomi' THEN f.tutkinnot ELSE 0 END) as float) / CAST(SUM(f.tutkinnot) as float) as arvo,
			'ulk_amk' as indikaattori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1 ON d1.id = f.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.koulutusluokitus
		LEFT JOIN VipunenTK.dbo.d_kansalaisuus_versio2 d3 on d3.id = f.kansalaisuus_versio2_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi)
		WHERE tilastointivuosi >= 2018 AND d2.koulutusastetaso2_koodi = '62' and d4.oppilaitostyyppi_koodi = '41'
		GROUP BY tilastointivuosi, coalesce(d1.oppilaitoksen_korvaavakoodi,d1.oppilaitoskoodi), d2.koulutusastetaso2_koodi, d4.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN d3b.kansalaisuus_versio2 <> 'Suomi' THEN fb.tutkinnot ELSE 0 END) as float) / CAST(SUM(fb.tutkinnot) as float) as arvo_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] fb
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d1b ON d1b.id = fb.oppilaitos_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = fb.koulutusluokitus
		LEFT JOIN VipunenTK.dbo.d_kansalaisuus_versio2 d3b on d3b.id = fb.kansalaisuus_versio2_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4b on d4b.organisaatio_koodi = coalesce(d1b.oppilaitoksen_korvaavakoodi,d1b.oppilaitoskoodi)
		WHERE d2b.koulutusastetaso2_koodi = '72'  and d4b.oppilaitostyyppi_koodi = '41'
		and fb.tilastointivuosi = f.tilastovuosi and d4b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi
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
END

GO

USE [ANTERO]
