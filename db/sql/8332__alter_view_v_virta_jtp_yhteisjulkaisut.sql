USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_jtp_yhteisjulkaisut]    Script Date: 27.11.2023 13:18:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dw].[v_virta_jtp_yhteisjulkaisut] AS

SELECT
	f.tilastovuosi as Tilastovuosi,
	f.julkaisunTunnus,
	f.yhteisjulkaisuId,
	d1.virtajtpsektori_koodi as 'Koodit Sektori',
	d1.virtajtpsektori_fi as Sektori,
	d1.virtajtpsektori_sv as Sektor,
	d1.virtajtpsektori_en as Sector,
	d2.organisaatio_koodi as 'Koodit Organisaatio',
	d2.organisaatio_fi as Organisaatio,
	case when f.aineisto = 'yritys' then 'Yritykset' when f.aineisto = 'ulkomainen_organisaatio' then 'Ulkomaiset organisaatiot' else d3.organisaatio_fi end as Yhteistyo_org,
	d3.organisaatio_koodi as Yhteistyo_koodi,
	d2.organisaatio_sv as OrganisationSV,
	d2.organisaatio_en as OrganisationEN,
	case when d2.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' then d2.organisaatio_koodi else NULL end as 'Koodit Ammattikorkeakoulu',
	case when d2.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' then d2.organisaatio_fi else NULL end as Ammattikorkeakoulu,
	case when d2.oppilaitostyyppi_fi = 'Yliopistot' then d2.organisaatio_koodi else NULL end as 'Koodit Yliopisto',
	case when d2.oppilaitostyyppi_fi = 'Yliopistot' then d2.organisaatio_fi else NULL end as 'Yliopisto',
	d4.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso',
	d4.julkaisufoorumitaso_fi as Julkaisufoorumitaso,
	d4.julkaisufoorumitaso_sv as JulkaisufoorumitasoSV,
	d4.julkaisufoorumitaso_en as JulkaisufoorumitasoEN,
	d5.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka',
	d5.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka',
	d5.julkaisunpaaluokka_nimi_sv as 'Julkaisun pääluokkaSV',
	d5.julkaisunpaaluokka_nimi_en as 'Julkaisun pääluokkaEN',
	d5.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi',
	d5.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi',
	d5.julkaisutyyppi_nimi_sv as 'JulkaisutyyppiSV',
	d5.julkaisutyyppi_nimi_en as 'JulkaisutyyppiEN',
	d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys',
	d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys',
	d6.julkaisun_kansainvalisyys_sv as 'Julkaisun kansainvälisyysSV',
	d6.julkaisun_kansainvalisyys_en as 'Julkaisun kansainvälisyysEN',
	d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu',
	d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu',
	d7.kansainvalinen_yhteisjulkaisu_sv as 'Kansainvälinen yhteisjulkaisuSV',
	d7.kansainvalinen_yhteisjulkaisu_en as 'Kansainvälinen yhteisjulkaisuEN',
	case d8.paatieteenala_koodi when -1 then 9 else d8.paatieteenala_koodi end as 'Koodit Päätieteenala',
	d8.paatieteenala_nimi_fi as 'Päätieteenala',
	d8.paatieteenala_nimi_sv as 'PäätieteenalaSV',
	d8.paatieteenala_nimi_en as 'PäätieteenalaEN',
	case d8.tieteenala_koodi when -1 then 9999 else tieteenala_koodi end as 'Koodit Tieteenala',
	d8.tieteenala_nimi_fi as 'Tieteenala',
	d8.tieteenala_nimi_sv as 'TieteenalaSV',
	d8.tieteenala_nimi_en as 'TieteenalaEN',
	case d9.ohjauksenala_koodi when -1 then 99 else d9.ohjauksenala_koodi end as 'Koodit OKM ohjauksen ala',
	d9.ohjauksenala_nimi_fi as 'OKM ohjauksen ala',
	d9.ohjauksenala_nimi_sv as 'OKM ohjauksen alaSV',
	d9.ohjauksenala_nimi_en as 'OKM ohjauksen alaEN',
	case d10.koodi when -1 then 99 else d10.koodi end as [Koodit Koulutusala 95],
	d10.selite_fi as 'Koulutusala 95',
	d10.selite_sv as 'Utbildningsområde 95',
	d10.selite_en as 'Field of education 95',
	case d11.koodi when -1 then 99 else d11.koodi end as [Koodit Koulutusala 02],
	d11.selite_fi as 'Koulutusala 02',
	d11.selite_sv as 'Utbildningsområde 02',
	d11.selite_en as 'Field of education 02',
	d12.kytkin_fi as 'Yhteisjulk. yliop. sairaanhoitopiiri',
	d13.kytkin_fi as 'Yhteisjulk. valtion sektoritutkimuslaitos',
	d14.kytkin_fi as 'Yhteisjulk. muu kotim. tutkimusorganisaatio',
	d15.kytkin_fi as 'Yhteisjulkaisu yrityksen kanssa',
	d16.kytkin_fi as  'Julkaisu rinnakkaistallennettu',
	case d17.avoinsaatavuus_koodi when -1 then 9 else d17.avoinsaatavuus_koodi end as [Koodit Avoin saatavuus],
	d17.avoinsaatavuus_fi as 'Avoin saatavuus',
	f.lukumaara,
	f.Ammattikorkeakoulu_HTV_opetustki,
	f.YO_HTV_opetusTKI,
	f.YO_IV_HTV,
	d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha',
	d18.julkaisufoorumitaso_fi 'Julkaisufoorumitaso vanha luokitus',
	d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi',
	d19.julkaisufoorumitaso_fi 'Julkaisufoorumitaso uusi luokitus'

FROM ANTERO.dw.f_virta_jtp_yhteisjulkaisut f
LEFT JOIN ANTERO.dw.d_virtajtpsektori d1 on d1.id = f.d_virtajtpsektori_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatioluokitus_yhteistyo_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d4 on d4.id = f.d_julkaisufoorumitaso_id
LEFT JOIN ANTERO.dw.d_julkaisutyyppi d5 on d5.id = f.d_julkaisutyyppi_id
LEFT JOIN ANTERO.dw.d_julkaisun_kansainvalisyys d6 on d6.id = f.d_julkaisun_kansainvalisyys_id
LEFT JOIN ANTERO.dw.d_kansainvalinen_yhteisjulkaisu d7 on d7.id = f.d_kansainvalinen_yhteisjulkaisu_id
LEFT JOIN ANTERO.dw.d_tieteenala d8 on d8.id = f.d_tieteenala_id
LEFT JOIN ANTERO.dw.d_ohjauksenala d9 on d9.id = f.d_ohjauksenala_id
LEFT JOIN ANTERO.dw.d_koulutusala_1995 d10 on d10.id = f.d_koulutusala_1995_id
LEFT JOIN ANTERO.dw.d_koulutusala_2002 d11 on d11.id = f.d_koulutusala_2002_id
LEFT JOIN ANTERO.dw.d_kytkin d12 on d12.id = d_kytkin_yj_shp_id
LEFT JOIN ANTERO.dw.d_kytkin d13 on d13.id = d_kytkin_yj_tutk_id
LEFT JOIN ANTERO.dw.d_kytkin d14 on d14.id = d_kytkin_yj_muu_tutk_id
LEFT JOIN ANTERO.dw.d_kytkin d15 on d15.id = d_kytkin_yj_yr_id
LEFT JOIN ANTERO.dw.d_kytkin d16 on d16.id = d_kytkin_rinnakkaistallennettu_id
LEFT JOIN ANTERO.dw.d_avoinsaatavuus d17 on d17.id = f.d_avoinsaatavuus_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d18 on d18.id = f.d_julkaisufoorumitaso_vanha_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d19 on d19.id = f.d_julkaisufoorumitaso_uusi_id
GO

USE [ANTERO]