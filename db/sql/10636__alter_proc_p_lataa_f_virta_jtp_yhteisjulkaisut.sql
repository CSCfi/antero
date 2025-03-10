USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_jtp_yhteisjulkaisut]    Script Date: 10.3.2025 9.10.34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER    PROCEDURE [dw].[p_lataa_f_virta_jtp_yhteisjulkaisut]
AS

TRUNCATE TABLE ANTERO.dw.f_virta_jtp_yhteisjulkaisut

INSERT INTO ANTERO.dw.f_virta_jtp_yhteisjulkaisut
SELECT 
	d21.tilastovuosi as tilastovuosi,
	f.julkaisunTunnus,
	f.yhteisjulkaisuId,
	d2.id as d_virtajtpsektori_id,
	d3.id as d_organisaatioluokitus_id,
	d20.id as d_organisaatioluokitus_yhteistyo_id,
	d5.id as d_julkaisufoorumitaso_id,
	d4.id as d_julkaisutyyppi_id,
	d6.id as d_julkaisun_kansainvalisyys_id,
	d7.id as d_kansainvalinen_yhteisjulkaisu_id,
	d1.id as d_tieteenala_id,
	d8.id as d_ohjauksenala_id,
	d9.id as d_koulutusala_1995_id,
	d10.id as d_koulutusala_2002_id,
	d12.id as d_kytkin_yj_shp_id,
	d13.id as d_kytkin_yj_tutk_id,
	d14.id as d_kytkin_yj_muu_tutk_id,
	d15.id as d_kytkin_yj_yr_id,
	d16.id as d_kytkin_rinnakkaistallennettu_id,
	d17.id as d_avoinsaatavuus_id,
	f.lukumaara,
	d18.id as d_julkaisufoorumitaso_vanha_id,
	d19.id as d_julkaisufoorumitaso_uusi_id,
	NULL as 'YO_HTV_opetusTKI',
	NULL as 'YO_IV_HTV',
	NULL as 'Ammattikorkeakoulu_HTV_opetustki',
	'yhteisjulkaisut' as aineisto,
	GETDATE() as loadtime,
	SUSER_NAME() as username,
	'ETL: p_lataa_f_virta_jtp_yhteisjulkaisut' as source
FROM dw.f_virta_jtp_tilasto f
LEFT JOIN ANTERO.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN ANTERO.dw.d_virtajtpsektori d2 ON d2.id=f.d_virtajtpsektori_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatio_id
LEFT JOIN ANTERO.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d5 ON d5.id=f.d_julkaisufoorumitaso_id
LEFT JOIN ANTERO.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN ANTERO.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=f.d_kansainvalinen_yhteisjulkaisu_id
LEFT JOIN ANTERO.dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN ANTERO.dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala95_id
LEFT JOIN ANTERO.dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala02_id
LEFT JOIN ANTERO.dw.d_kytkin d12 on d12.id = d_yhteisjulkaisuSHPKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d13 on d13.id = d_yhteisjulkaisuTutkimuslaitosKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d14 on d14.id = d_yhteisjulkaisuMuuKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d15 on d15.id = d_yhteisjulkaisuYritysKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d16 on d16.id = d_rinnakkaistallennusKytkin_id
LEFT JOIN ANTERO.dw.d_avoinsaatavuus d17 on d17.id = d_avoinSaatavuus_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d18 ON d18.id=f.d_julkaisufoorumitaso_vanha_id --new
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d19 ON d19.id=f.d_julkaisufoorumitaso_uusi_id --new
CROSS JOIN ANTERO.dw.f_virta_jtp_tilasto as f2
INNER JOIN ANTERO.dw.d_organisaatioluokitus d20 on d20.id=f2.d_organisaatio_id
LEFT JOIN (
	SELECT 
		yhteisjulkaisuId, MIN(tilastovuosi) as tilastovuosi
	FROM dw.f_virta_jtp_tilasto f
	GROUP BY yhteisjulkaisuId
) d21 on f.yhteisjulkaisuId = d21.yhteisjulkaisuId
WHERE f.yhteisjulkaisuId = f2.yhteisjulkaisuId and  f.lukumaara>0 AND f.yhteisjulkaisuId <> '0'

UNION ALL

SELECT 
	CASE WHEN f.yhteisjulkaisuId = '0' THEN f.tilastovuosi ELSE d21.tilastovuosi END as tilastovuosi,
	f.julkaisunTunnus,
	f.yhteisjulkaisuId,
	d2.id as d_virtajtpsektori_id,
	d3.id as d_organisaatioluokitus_id,
	NULL as d_organisaatioluokitus_yhteistyo_id,
	d5.id as d_julkaisufoorumitaso_id,
	d4.id as d_julkaisutyyppi_id,
	d6.id as d_julkaisun_kansainvalisyys_id,
	d7.id as d_kansainvalinen_yhteisjulkaisu_id,
	d1.id as d_tieteenala_id,
	d8.id as d_ohjauksenala_id,
	d9.id as d_koulutusala_1995_id,
	d10.id as d_koulutusala_2002_id,
	d12.id as d_kytkin_yj_shp_id,
	d13.id as d_kytkin_yj_tutk_id,
	d14.id as d_kytkin_yj_muu_tutk_id,
	d15.id as d_kytkin_yj_yr_id,
	d16.id as d_kytkin_rinnakkaistallennettu_id,
	d17.id as d_avoinsaatavuus_id,
	f.lukumaara,
	d18.id as d_julkaisufoorumitaso_vanha_id,
	d19.id as d_julkaisufoorumitaso_uusi_id,
	NULL as 'YO_HTV_opetusTKI',
	NULL as 'YO_IV_HTV',
	NULL as 'Ammattikorkeakoulu_HTV_opetustki',
	'ulkomainen_organisaatio' as aineisto,
	GETDATE() as loadtime,
	SUSER_NAME() as username,
	'ETL: p_lataa_f_virta_jtp_yhteisjulkaisut' as source
FROM dw.f_virta_jtp_tilasto f
LEFT JOIN ANTERO.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN ANTERO.dw.d_virtajtpsektori d2 ON d2.id=f.d_virtajtpsektori_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatio_id
LEFT JOIN ANTERO.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d5 ON d5.id=f.d_julkaisufoorumitaso_id
LEFT JOIN ANTERO.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN ANTERO.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=f.d_kansainvalinen_yhteisjulkaisu_id
LEFT JOIN ANTERO.dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN ANTERO.dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala95_id
LEFT JOIN ANTERO.dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala02_id
LEFT JOIN ANTERO.dw.d_kytkin d12 on d12.id = d_yhteisjulkaisuSHPKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d13 on d13.id = d_yhteisjulkaisuTutkimuslaitosKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d14 on d14.id = d_yhteisjulkaisuMuuKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d15 on d15.id = d_yhteisjulkaisuYritysKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d16 on d16.id = d_rinnakkaistallennusKytkin_id
LEFT JOIN ANTERO.dw.d_avoinsaatavuus d17 on d17.id = d_avoinSaatavuus_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d18 ON d18.id=f.d_julkaisufoorumitaso_vanha_id --new
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d19 ON d19.id=f.d_julkaisufoorumitaso_uusi_id --new
LEFT JOIN (
	SELECT 
		yhteisjulkaisuId, MIN(tilastovuosi) as tilastovuosi
	FROM dw.f_virta_jtp_tilasto f
	GROUP BY yhteisjulkaisuId
) d21 on f.yhteisjulkaisuId = d21.yhteisjulkaisuId
WHERE d7.id = 2 and f.lukumaara > 0

UNION ALL

SELECT DISTINCT
	CASE WHEN f.yhteisjulkaisuId = '0' THEN f.tilastovuosi ELSE d21.tilastovuosi END as tilastovuosi,
	f.julkaisunTunnus,
	f.yhteisjulkaisuId,
	d2.id as d_virtajtpsektori_id,
	d3.id as d_organisaatioluokitus_id,
	d3.id as d_organisaatioluokitus_yhteistyo_id,
	d5.id as d_julkaisufoorumitaso_id,
	d4.id as d_julkaisutyyppi_id,
	d6.id as d_julkaisun_kansainvalisyys_id,
	d7.id as d_kansainvalinen_yhteisjulkaisu_id,
	d1.id as d_tieteenala_id,
	d8.id as d_ohjauksenala_id,
	d9.id as d_koulutusala_1995_id,
	d10.id as d_koulutusala_2002_id,
	d12.id as d_kytkin_yj_shp_id,
	d13.id as d_kytkin_yj_tutk_id,
	d14.id as d_kytkin_yj_muu_tutk_id,
	d15.id as d_kytkin_yj_yr_id,
	d16.id as d_kytkin_rinnakkaistallennettu_id,
	d17.id as d_avoinsaatavuus_id,
	f.lukumaara,
	d18.id as d_julkaisufoorumitaso_vanha_id,
	d19.id as d_julkaisufoorumitaso_uusi_id,
	NULL as 'YO_HTV_opetusTKI',
	NULL as 'YO_IV_HTV',
	NULL as 'Ammattikorkeakoulu_HTV_opetustki',
	'ulkomainen_organisaatio_oma_org' as aineisto,
	GETDATE() as loadtime,
	SUSER_NAME() as username,
	'ETL: p_lataa_f_virta_jtp_yhteisjulkaisut' as source
FROM dw.f_virta_jtp_tilasto f
LEFT JOIN ANTERO.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN ANTERO.dw.d_virtajtpsektori d2 ON d2.id=f.d_virtajtpsektori_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatio_id
LEFT JOIN ANTERO.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d5 ON d5.id=f.d_julkaisufoorumitaso_id
LEFT JOIN ANTERO.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN ANTERO.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=f.d_kansainvalinen_yhteisjulkaisu_id
LEFT JOIN ANTERO.dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN ANTERO.dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala95_id
LEFT JOIN ANTERO.dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala02_id
LEFT JOIN ANTERO.dw.d_kytkin d12 on d12.id = d_yhteisjulkaisuSHPKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d13 on d13.id = d_yhteisjulkaisuTutkimuslaitosKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d14 on d14.id = d_yhteisjulkaisuMuuKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d15 on d15.id = d_yhteisjulkaisuYritysKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d16 on d16.id = d_rinnakkaistallennusKytkin_id
LEFT JOIN ANTERO.dw.d_avoinsaatavuus d17 on d17.id = d_avoinSaatavuus_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d18 ON d18.id=f.d_julkaisufoorumitaso_vanha_id --new
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d19 ON d19.id=f.d_julkaisufoorumitaso_uusi_id --new
LEFT JOIN (
	SELECT 
		yhteisjulkaisuId, MIN(tilastovuosi) as tilastovuosi
	FROM dw.f_virta_jtp_tilasto f
	GROUP BY yhteisjulkaisuId
) d21 on f.yhteisjulkaisuId = d21.yhteisjulkaisuId
WHERE d7.id = 2 and f.lukumaara > 0

UNION ALL

SELECT 
	CASE WHEN f.yhteisjulkaisuId = '0' THEN f.tilastovuosi ELSE d21.tilastovuosi END as tilastovuosi,
	f.julkaisunTunnus,
	f.yhteisjulkaisuId,
	d2.id as d_virtajtpsektori_id,
	d3.id as d_organisaatioluokitus_id,
	NULL as d_organisaatioluokitus_yhteistyo_id,
	d5.id as d_julkaisufoorumitaso_id,
	d4.id as d_julkaisutyyppi_id,
	d6.id as d_julkaisun_kansainvalisyys_id,
	d7.id as d_kansainvalinen_yhteisjulkaisu_id,
	d1.id as d_tieteenala_id,
	d8.id as d_ohjauksenala_id,
	d9.id as d_koulutusala_1995_id,
	d10.id as d_koulutusala_2002_id,
	d12.id as d_kytkin_yj_shp_id,
	d13.id as d_kytkin_yj_tutk_id,
	d14.id as d_kytkin_yj_muu_tutk_id,
	d15.id as d_kytkin_yj_yr_id,
	d16.id as d_kytkin_rinnakkaistallennettu_id,
	d17.id as d_avoinsaatavuus_id,
	f.lukumaara,
	d18.id as d_julkaisufoorumitaso_vanha_id,
	d19.id as d_julkaisufoorumitaso_uusi_id,
	NULL as 'YO_HTV_opetusTKI',
	NULL as 'YO_IV_HTV',
	NULL as 'Ammattikorkeakoulu_HTV_opetustki',
	'yritys' as aineisto,
	GETDATE() as loadtime,
	SUSER_NAME() as username,
	'ETL: p_lataa_f_virta_jtp_yhteisjulkaisut' as source
FROM dw.f_virta_jtp_tilasto f
LEFT JOIN ANTERO.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN ANTERO.dw.d_virtajtpsektori d2 ON d2.id=f.d_virtajtpsektori_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatio_id
LEFT JOIN ANTERO.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d5 ON d5.id=f.d_julkaisufoorumitaso_id
LEFT JOIN ANTERO.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN ANTERO.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=f.d_kansainvalinen_yhteisjulkaisu_id
LEFT JOIN ANTERO.dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN ANTERO.dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala95_id
LEFT JOIN ANTERO.dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala02_id
LEFT JOIN ANTERO.dw.d_kytkin d12 on d12.id = d_yhteisjulkaisuSHPKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d13 on d13.id = d_yhteisjulkaisuTutkimuslaitosKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d14 on d14.id = d_yhteisjulkaisuMuuKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d15 on d15.id = d_yhteisjulkaisuYritysKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d16 on d16.id = d_rinnakkaistallennusKytkin_id
LEFT JOIN ANTERO.dw.d_avoinsaatavuus d17 on d17.id = d_avoinSaatavuus_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d18 ON d18.id=f.d_julkaisufoorumitaso_vanha_id --new
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d19 ON d19.id=f.d_julkaisufoorumitaso_uusi_id --new
LEFT JOIN (
	SELECT 
		yhteisjulkaisuId, MIN(tilastovuosi) as tilastovuosi
	FROM dw.f_virta_jtp_tilasto f
	GROUP BY yhteisjulkaisuId
) d21 on f.yhteisjulkaisuId = d21.yhteisjulkaisuId
WHERE d15.kytkin_koodi = 1 and f.lukumaara > 0

UNION ALL

SELECT DISTINCT
	CASE WHEN f.yhteisjulkaisuId = '0' THEN f.tilastovuosi ELSE d21.tilastovuosi END as tilastovuosi,
	f.julkaisunTunnus,
	f.yhteisjulkaisuId,
	d2.id as d_virtajtpsektori_id,
	d3.id as d_organisaatioluokitus_id,
	d3.id as d_organisaatioluokitus_yhteistyo_id,
	d5.id as d_julkaisufoorumitaso_id,
	d4.id as d_julkaisutyyppi_id,
	d6.id as d_julkaisun_kansainvalisyys_id,
	d7.id as d_kansainvalinen_yhteisjulkaisu_id,
	d1.id as d_tieteenala_id,
	d8.id as d_ohjauksenala_id,
	d9.id as d_koulutusala_1995_id,
	d10.id as d_koulutusala_2002_id,
	d12.id as d_kytkin_yj_shp_id,
	d13.id as d_kytkin_yj_tutk_id,
	d14.id as d_kytkin_yj_muu_tutk_id,
	d15.id as d_kytkin_yj_yr_id,
	d16.id as d_kytkin_rinnakkaistallennettu_id,
	d17.id as d_avoinsaatavuus_id,
	f.lukumaara,
	d18.id as d_julkaisufoorumitaso_vanha_id,
	d19.id as d_julkaisufoorumitaso_uusi_id,
	NULL as 'YO_HTV_opetusTKI',
	NULL as 'YO_IV_HTV',
	NULL as 'Ammattikorkeakoulu_HTV_opetustki',
	'yritys_oma_org' as aineisto,
	GETDATE() as loadtime,
	SUSER_NAME() as username,
	'ETL: p_lataa_f_virta_jtp_yhteisjulkaisut' as source
FROM dw.f_virta_jtp_tilasto f
LEFT JOIN ANTERO.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN ANTERO.dw.d_virtajtpsektori d2 ON d2.id=f.d_virtajtpsektori_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatio_id
LEFT JOIN ANTERO.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d5 ON d5.id=f.d_julkaisufoorumitaso_id
LEFT JOIN ANTERO.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN ANTERO.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=f.d_kansainvalinen_yhteisjulkaisu_id
LEFT JOIN ANTERO.dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN ANTERO.dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala95_id
LEFT JOIN ANTERO.dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala02_id
LEFT JOIN ANTERO.dw.d_kytkin d12 on d12.id = d_yhteisjulkaisuSHPKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d13 on d13.id = d_yhteisjulkaisuTutkimuslaitosKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d14 on d14.id = d_yhteisjulkaisuMuuKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d15 on d15.id = d_yhteisjulkaisuYritysKytkin_id
LEFT JOIN ANTERO.dw.d_kytkin d16 on d16.id = d_rinnakkaistallennusKytkin_id
LEFT JOIN ANTERO.dw.d_avoinsaatavuus d17 on d17.id = d_avoinSaatavuus_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d18 ON d18.id=f.d_julkaisufoorumitaso_vanha_id --new
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d19 ON d19.id=f.d_julkaisufoorumitaso_uusi_id --new
LEFT JOIN (
	SELECT 
		yhteisjulkaisuId, MIN(tilastovuosi) as tilastovuosi
	FROM dw.f_virta_jtp_tilasto f
	GROUP BY yhteisjulkaisuId
) d21 on f.yhteisjulkaisuId = d21.yhteisjulkaisuId
WHERE d15.kytkin_koodi = 1 and f.lukumaara > 0

UNION ALL

SELECT
	f.vuosi,
	NULL, --julkaisunTunnus
	NULL, --yhteisjulkaisuId
	2,
	d3.id,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	d21.id,
	d25.id,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	case when d23.id in ('1','2','3','4') then henkilotyovuosi else 0 end as 'YO_HTV_opetusTKI',
	case when d23.id = '4' then henkilotyovuosi else 0 end as 'YO_IV_HTV',
	NULL as 'Ammattikorkeakoulu_HTV_opetustki',
	'htv' as aineisto,
	GETDATE() as loadtime,
	SUSER_NAME() as username,
	'ETL: p_lataa_f_virta_jtp_yhteisjulkaisut' as source
FROM ANTERO.dw.f_yo_henkilon_tyo f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 on d3.id = f.d_yliopisto_id
LEFT JOIN ANTERO.dw.d_tieteenala d21 on d21.id=f.d_tieteenala_id
LEFT JOIN ANTERO.dw.d_yo_henkilostoryhma d22 on d22.id=f.d_henkilostoryhma_id
LEFT JOIN ANTERO.dw.d_yo_tutkijanuravaihe d23 on d23.id=f.d_tutkijanuravaihe_id
LEFT JOIN ANTERO.dw.d_ohjauksenala d25 on d25.id=f.d_ohjauksenala_id

UNION ALL

SELECT
	f.vuosi,
	NULL, --julkaisunTunnus
	NULL, --yhteisjulkaisuId
	3,
	d3.id,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	d21.id,
	d25.id,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL as 'YO_HTV_opetusTKI',
	NULL as 'YO_IV_HTV',
	case when d22.koodi in ('2','1') then henkilotyovuosi else 0 end as 'Ammattikorkeakoulu_HTV_opetustki',
	'htv' as aineisto,
	GETDATE() as loadtime,
	SUSER_NAME() as username,
	'ETL: p_lataa_f_virta_jtp_yhteisjulkaisut' as source
FROM ANTERO.dw.f_amk_henkilon_tyo f
LEFT JOIN antero.dw.d_organisaatioluokitus d3 on d3.id=f.d_amk_id
LEFT JOIN ANTERO.dw.d_tieteenala d21 on d21.id=f.d_tieteenala_id
LEFT JOIN ANTERO.dw.d_amk_tehtavanjaottelu d22 on d22.id=f.d_tehtavanjaottelu
LEFT JOIN ANTERO.dw.d_ohjauksenala d25 on d25.id=f.d_ohjauksenala_id

GO

USE [ANTERO]