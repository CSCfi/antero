USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_haku_ja_valintatiedot]    Script Date: 10.12.2025 11.28.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_haku_ja_valintatiedot] as

-- temp-taulu

DROP TABLE IF EXISTS ANTERO.dw.temp_haku_ja_valinta_indikaattorit

SELECT f.*
INTO ANTERO.dw.temp_haku_ja_valinta_indikaattorit
FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f
INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatio_oppilaitos_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d3 on d3.id = f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN dw.d_maatjavaltiot2 d30 ON d30.id=f.d_maatjavaltiot_kansalaisuus_id
LEFT JOIN VipunenTK.dbo.d_valtio d28 ON d28.valtio_avain=d30.maatjavaltiot2_koodi
-- I sykli, ei kansainvälisiä opiskelijoita
WHERE d3.koodi = 1 and (f.pohjakoulutus_suomessa_priorisoitu = 1 or (f.pohjakoulutus_suomessa_priorisoitu is null and d28.maa = 'Suomi'))
AND koulutuksen_alkamisvuosi BETWEEN 2018 and YEAR(GETDATE()) - 1 and d2.oppilaitostyyppi_koodi in ('41','42')

-- Paikan vastaanottaneet samasta maakunnasta

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_haku_ja_valintatiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.koulutuksen_alkamisvuosi as tilastovuosi,
			d2.organisaatio_koodi,
			d2.oppilaitostyyppi_koodi,
			CAST(COUNT(DISTINCT CASE WHEN d4.maakunta_fi = d5.maakunta_fi and d5.maakunta_koodi <> -1 THEN f.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT f.henkilo_oid) as float) as arvo,
			'pv_sama_maak' as indikaattori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit f
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatio_oppilaitos_id
		LEFT JOIN ANTERO.dw.d_alueluokitus d4 on d4.id = f.d_alueluokitus_kotipaikka_id
		LEFT JOIN ANTERO.dw.d_alueluokitus d5 on d5.id = f.d_alueluokitus_hakukohde_id
		WHERE f.loadtime >= d1.vastaanottaneet and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
		GROUP BY f.koulutuksen_alkamisvuosi, d2.organisaatio_koodi, d2.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT
			CAST(COUNT(DISTINCT CASE WHEN d4b.maakunta_fi = d5b.maakunta_fi and d5b.maakunta_koodi <> -1 THEN fb.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT fb.henkilo_oid) as float) as arvo_sektori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit fb
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1b on d1b.id=fb.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2b on d2b.id = fb.d_organisaatio_oppilaitos_id
		LEFT JOIN ANTERO.dw.d_alueluokitus d4b on d4b.id = fb.d_alueluokitus_kotipaikka_id
		LEFT JOIN ANTERO.dw.d_alueluokitus d5b on d5b.id = fb.d_alueluokitus_hakukohde_id
		WHERE fb.loadtime >= d1b.vastaanottaneet and fb.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
		and d2b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi and fb.koulutuksen_alkamisvuosi = f.tilastovuosi
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

-- Paikan vastaanottaneita Uudeltamaalta

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_haku_ja_valintatiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.koulutuksen_alkamisvuosi as tilastovuosi,
			d2.organisaatio_koodi,
			d2.oppilaitostyyppi_koodi,
			CAST(COUNT(DISTINCT CASE WHEN d4.maakunta_fi = 'Uusimaa' THEN f.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT f.henkilo_oid) as float) as arvo,
			'pv_uusimaa' as indikaattori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit f
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatio_oppilaitos_id
		LEFT JOIN ANTERO.dw.d_alueluokitus d4 on d4.id = f.d_alueluokitus_kotipaikka_id
		WHERE f.loadtime >= d1.vastaanottaneet and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
		GROUP BY f.koulutuksen_alkamisvuosi, d2.organisaatio_koodi, d2.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT
			CAST(COUNT(DISTINCT CASE WHEN d4b.maakunta_fi = 'Uusimaa' THEN fb.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT fb.henkilo_oid) as float) as arvo_sektori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit fb
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1b on d1b.id=fb.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2b on d2b.id = fb.d_organisaatio_oppilaitos_id
		LEFT JOIN ANTERO.dw.d_alueluokitus d4b on d4b.id = fb.d_alueluokitus_kotipaikka_id
		WHERE fb.loadtime >= d1b.vastaanottaneet and fb.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
		and d2b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi and fb.koulutuksen_alkamisvuosi = f.tilastovuosi
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

-- Ensisijaiset hakijat suhteessa paikan vastaanottaneisiin

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_haku_ja_valintatiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.koulutuksen_alkamisvuosi as tilastovuosi,
			d2.organisaatio_koodi,
			d2.oppilaitostyyppi_koodi,
			CAST(COUNT(DISTINCT CASE WHEN f.hakutoive = 1 THEN f.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT CASE WHEN f.loadtime >= d1.vastaanottaneet and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN f.henkilo_oid ELSE NULL END) as float) as arvo,
			'ens_hakijat_pv' as indikaattori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit f
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatio_oppilaitos_id
		GROUP BY f.koulutuksen_alkamisvuosi, d2.organisaatio_koodi, d2.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT
			CAST(COUNT(DISTINCT CASE WHEN fb.hakutoive = 1 THEN fb.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT CASE WHEN fb.loadtime >= d1b.vastaanottaneet and fb.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN fb.henkilo_oid ELSE NULL END) as float) as arvo_sektori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit fb
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1b on d1b.id=fb.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2b on d2b.id = fb.d_organisaatio_oppilaitos_id
		WHERE d2b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi and fb.koulutuksen_alkamisvuosi = f.tilastovuosi
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

-- Ensikertalaiset paikan vastaanottaneet

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_haku_ja_valintatiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.koulutuksen_alkamisvuosi as tilastovuosi,
			d2.organisaatio_koodi,
			d2.oppilaitostyyppi_koodi,
			CAST(COUNT(DISTINCT CASE WHEN f.aidosti_ensikertainen = 1 THEN f.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT f.henkilo_oid) as float) as arvo,
			'aid_ensik' as indikaattori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit f
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatio_oppilaitos_id
		WHERE f.loadtime >= d1.vastaanottaneet and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
		GROUP BY f.koulutuksen_alkamisvuosi, d2.organisaatio_koodi, d2.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT
			CAST(COUNT(DISTINCT CASE WHEN fb.aidosti_ensikertainen = 1 THEN fb.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT fb.henkilo_oid) as float) as arvo_sektori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit fb
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1b on d1b.id=fb.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2b on d2b.id = fb.d_organisaatio_oppilaitos_id
		WHERE fb.loadtime >= d1b.vastaanottaneet and fb.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
		and d2b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi and fb.koulutuksen_alkamisvuosi = f.tilastovuosi
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

-- Avoimen väylän kautta valittujen osuus

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_haku_ja_valintatiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.koulutuksen_alkamisvuosi as tilastovuosi,
			d2.organisaatio_koodi,
			d2.oppilaitostyyppi_koodi,
			CAST(COUNT(DISTINCT CASE WHEN d5.koodi = 'av' THEN f.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT f.henkilo_oid) as float) as arvo,
			'avoin_vayla' as indikaattori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit f
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatio_oppilaitos_id
		LEFT JOIN ANTERO.dw.d_haku d4 on d4.id = f.d_haku_id
		LEFT JOIN ANTERO.dw.f_haku_ja_valinta_korkea_aste_valintatapajonot f2 on f2.henkilo_oid = f.henkilo_oid and f2.d_hakukohde_id = f.d_hakukohde_id and d4.haku_oid = f2.haku_oid
		LEFT JOIN ANTERO.dw.d_valintatapajono d5 on d5.id = f2.d_valintatapajono_id
		WHERE f.loadtime>=d1.valitut and f.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
		GROUP BY f.koulutuksen_alkamisvuosi, d2.organisaatio_koodi, d2.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT
			CAST(COUNT(DISTINCT CASE WHEN d5b.koodi = 'av' THEN fb.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT fb.henkilo_oid) as float) as arvo_sektori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit fb
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1b on d1b.id=fb.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2b on d2b.id = fb.d_organisaatio_oppilaitos_id
		LEFT JOIN ANTERO.dw.d_haku d4b on d4b.id = fb.d_haku_id
		LEFT JOIN ANTERO.dw.f_haku_ja_valinta_korkea_aste_valintatapajonot f2b on f2b.henkilo_oid = fb.henkilo_oid and f2b.d_hakukohde_id = fb.d_hakukohde_id and d4b.haku_oid = f2b.haku_oid
		LEFT JOIN ANTERO.dw.d_valintatapajono d5b on d5b.id = f2b.d_valintatapajono_id
		WHERE fb.loadtime>=d1b.valitut and fb.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
		and d2b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi and fb.koulutuksen_alkamisvuosi = f.tilastovuosi
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

-- Paikan vastaanottaneista alle 23 vuotiaita


MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_haku_ja_valintatiedot' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT
			f.koulutuksen_alkamisvuosi as tilastovuosi,
			d2.organisaatio_koodi,
			d2.oppilaitostyyppi_koodi,
			CAST(COUNT(DISTINCT CASE WHEN d4.ika_avain < 23 THEN f.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT f.henkilo_oid) as float) as arvo,
			'pv_23' as indikaattori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit f
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatio_oppilaitos_id
		LEFT JOIN ANTERO.dw.d_ika d4 on d4.id = f.d_ika_id
		WHERE f.loadtime >= d1.vastaanottaneet and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
		GROUP BY f.koulutuksen_alkamisvuosi, d2.organisaatio_koodi, d2.oppilaitostyyppi_koodi
	) f
	OUTER APPLY (
		SELECT
			CAST(COUNT(DISTINCT CASE WHEN d4b.ika_avain < 23 THEN fb.henkilo_oid ELSE NULL END) as float) / CAST(COUNT(DISTINCT fb.henkilo_oid) as float) as arvo_sektori
		FROM ANTERO.dw.temp_haku_ja_valinta_indikaattorit fb
		LEFT JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1b on d1b.id=fb.sa_haku_ja_valinta_vuosikello_korkea_aste_id
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2b on d2b.id = fb.d_organisaatio_oppilaitos_id
		LEFT JOIN ANTERO.dw.d_ika d4b on d4b.id = fb.d_ika_id
		WHERE fb.loadtime >= d1b.vastaanottaneet and fb.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
		and d2b.oppilaitostyyppi_koodi = f.oppilaitostyyppi_koodi and fb.koulutuksen_alkamisvuosi = f.tilastovuosi
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

DROP TABLE IF EXISTS ANTERO.dw.temp_haku_ja_valinta_indikaattorit

IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_haku_ja_valintatiedot') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END

GO
