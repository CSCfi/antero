USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_henkilostotiedot_amk]    Script Date: 10.3.2025 8.21.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_henkilostotiedot_amk] as

-- Ulkomaalaisen opetus- ja tki- henkilöstön osuus

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_henkilostotiedot_amk' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			f.vuosi as tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			CAST(SUM(CASE WHEN d3.maatjavaltiot2_fi NOT IN ('Suomi', 'Tieto puuttuu') THEN f.henkilotyovuosi ELSE 0 END) as float) / CAST(SUM(f.henkilotyovuosi) as float) as arvo,
			'ulk_opetus_tki_henkilosto' as indikaattori
		FROM [ANTERO].[dw].[f_amk_henkilon_tyo] f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_amk_id 
		LEFT JOIN ANTERO.dw.d_amk_tehtavanjaottelu d2 on d2.id = f.d_tehtavanjaottelu
		LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d3 on d3.id = f.d_maa_id
		WHERE vuosi >= 2018 and d2.selite_fi in ('Opetushenkilökunta', 'T&K&I-toiminnan henkilökunta')
		GROUP BY vuosi, d1.organisaatio_nykyinen_koodi
	) f
	OUTER APPLY (
		SELECT 
			CAST(SUM(CASE WHEN d3b.maatjavaltiot2_fi NOT IN ('Suomi', 'Tieto puuttuu') THEN fb.henkilotyovuosi ELSE 0 END) as float) / CAST(SUM(fb.henkilotyovuosi) as float) as arvo_sektori
		FROM [ANTERO].[dw].[f_amk_henkilon_tyo] fb
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1b.id = fb.d_amk_id 
		LEFT JOIN ANTERO.dw.d_amk_tehtavanjaottelu d2b on d2b.id = fb.d_tehtavanjaottelu
		LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d3b on d3b.id = fb.d_maa_id
		WHERE d2b.selite_fi in ('Opetushenkilökunta', 'T&K&I-toiminnan henkilökunta') and fb.vuosi = f.tilastovuosi
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

-- Opiskelija opetushenkilöstö -suhde
-- HUOM. Mukana OTV-tietoja

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f2.opiskelijat / f.htv as arvo,
		s2.opiskelijat_sektori / s.htv_sektori as arvo_sektori,
		'opisk_opetus_henkilosto' as indikaattori ,
		'ETL: p_lataa_f_indikaattorit_kk_henkilostotiedot_amk' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			f.vuosi as tilastovuosi,
			d1.organisaatio_nykyinen_koodi as organisaatio_koodi,
			CAST(SUM(f.henkilotyovuosi) as float) as htv
		FROM [ANTERO].[dw].[f_amk_henkilon_tyo] f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_amk_id 
		LEFT JOIN ANTERO.dw.d_amk_tehtavanjaottelu d2 on d2.id = f.d_tehtavanjaottelu
		WHERE f.vuosi BETWEEN 2018 and (SELECT max(tilastointivuosi) FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat]) and d2.selite_fi = 'Opetushenkilökunta'
		GROUP BY f.vuosi, d1.organisaatio_nykyinen_koodi
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
		WHERE d3.lahde_koodi in ('-1','41','42') AND d2.oppilaitoskoodi NOT IN ('02557','10031','02358') AND 
		coalesce(d2.oppilaitoksen_korvaavakoodi,d2.oppilaitoskoodi) not in ('01029','01569','10102')  AND
		tilastointivuosi BETWEEN 2018 AND (SELECT MAX(vuosi) FROM [ANTERO].[dw].[f_amk_henkilon_tyo]) AND d4.koulutusastetaso2_koodi = '62' 
		GROUP BY tilastointivuosi, COALESCE(d2.oppilaitoksen_korvaavakoodi, d2.oppilaitoskoodi)
	) f2 on f.tilastovuosi = f2.tilastovuosi and f.organisaatio_koodi = f2.organisaatio_koodi
	OUTER APPLY (
		SELECT 
			CAST(SUM(fb.henkilotyovuosi) as float) as htv_sektori
		FROM [ANTERO].[dw].[f_amk_henkilon_tyo] fb
		LEFT JOIN ANTERO.dw.d_amk_tehtavanjaottelu d2b on d2b.id = fb.d_tehtavanjaottelu
		WHERE fb.vuosi = f.tilastovuosi and d2b.selite_fi = 'Opetushenkilökunta'
	) s
	OUTER APPLY (	
		SELECT 
			CAST(SUM(opiskelijat) as float) as opiskelijat_sektori
		FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] fb
		LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d2b ON d2b.id = fb.oppilaitos_id
		LEFT JOIN [VipunenTK].[dbo].d_lahde d3b ON d3b.id = fb.lahde_id
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d4b on d4b.koulutusluokitus_koodi = fb.koulutusluokitus
		WHERE d3b.lahde_koodi in ('-1','41','42') AND d2b.oppilaitoskoodi NOT IN ('02557','10031','02358') AND 
		coalesce(d2b.oppilaitoksen_korvaavakoodi,d2b.oppilaitoskoodi) not in ('01029','01569','10102')  AND
		fb.tilastointivuosi = f.tilastovuosi AND d4b.koulutusastetaso2_koodi = '62' 
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

IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_henkilostotiedot_amk') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END

GO

USE [ANTERO]