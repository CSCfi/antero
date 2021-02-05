USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_jtp_yhteisjulkaisut]    Script Date: 5.2.2021 10:30:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_virta_jtp_yhteisjulkaisut] AS





SELECT
Tilastovuosi
,julkaisunTunnus
,yhteisjulkaisuId
,[Koodit Sektori]
,[Sektori]
,[Sektor]
,[Sector]
,[Koodit Organisaatio]
,[Organisaatio]
,Yhteistyo_org
,Yhteistyo_koodi
,[OrganisationSV]
,[OrganisationEN]
,[Koodit Ammattikorkeakoulu]
,[Ammattikorkeakoulu]
,[Koodit Yliopisto]
,[Yliopisto]
,[Koodit Julkaisufoorumitaso]
,[Julkaisufoorumitaso]
,[JulkaisufoorumitasoSV]
,[JulkaisufoorumitasoEN]
,[Koodit Julkaisun pääluokka]
,[Julkaisun pääluokka]
,[Julkaisun pääluokkaSV]
,[Julkaisun pääluokkaEN]
,[Koodit Julkaisutyyppi]
,[Julkaisutyyppi]
,[JulkaisutyyppiSV]
,[JulkaisutyyppiEN]
,[Koodit Julkaisun kansainvälisyys]
,[Julkaisun kansainvälisyys]
,[Julkaisun kansainvälisyysSV]
,[Julkaisun kansainvälisyysEN]
,[Koodit Kansainvälinen yhteisjulkaisu]
,[Kansainvälinen yhteisjulkaisu]
,[Kansainvälinen yhteisjulkaisuSV]
,[Kansainvälinen yhteisjulkaisuEN]
,case [Koodit Päätieteenala] when -1 then 9 else [Koodit Päätieteenala] end as [Koodit Päätieteenala]
,[Päätieteenala]
,[PäätieteenalaSV]
,[PäätieteenalaEN]
,case [Koodit Tieteenala] when -1 then 9999 else [Koodit Tieteenala] end as [Koodit Tieteenala]
,[Tieteenala]
,[TieteenalaSV]
,[TieteenalaEN]
,case [Koodit OKM ohjauksen ala] when -1 then 99 else [Koodit OKM ohjauksen ala] end as [Koodit OKM ohjauksen ala]
,[OKM ohjauksen ala]
,[OKM ohjauksen alaSV]
,[OKM ohjauksen alaEN]
,case [Koodit Koulutusala 95] when -1 then 99 else [Koodit Koulutusala 95] end as [Koodit Koulutusala 95]
,[Koulutusala 95]
,[Utbildningsområde 95]
,[Field of education 95]
,case [Koodit Koulutusala 02] when -1 then 9 else [Koodit Koulutusala 02] end as [Koodit Koulutusala 02]
,[Koulutusala 02]
,[Utbildningsområde 02]
,[Field of education 02]
,[Yhteisjulk. yliop. sairaanhoitopiiri]
,[Yhteisjulk. valtion sektoritutkimuslaitos]
,[Yhteisjulk. muu kotim. tutkimusorganisaatio]
,[Yhteisjulkaisu yrityksen kanssa]
,[Julkaisu rinnakkaistallennettu]
,case [Koodit Avoin saatavuus] when -1 then 9 else [Koodit Avoin saatavuus] end as [Koodit Avoin saatavuus]
,[Avoin saatavuus]
,[lukumaara]
,[Ammattikorkeakoulu_HTV_opetustki]=NULL
,[YO_HTV_opetusTKI]=NULL
,[YO_IV_HTV]=NULL
,[Koodit Julkaisufoorumitaso_vanha]   --new
,[Julkaisufoorumitaso vanha luokitus] --new
,[Koodit Julkaisufoorumitaso_uusi]    --new
,[Julkaisufoorumitaso uusi luokitus]  --new


FROM

(

SELECT d21.tilastovuosi AS "Tilastovuosi"
  ,f.julkaisunTunnus as 'julkaisunTunnus'
  ,f.yhteisjulkaisuId as 'yhteisjulkaisuId'
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv as 'Sektor'
  ,d2.virtajtpsektori_en as 'Sector'
  ,d3.organisaatio_koodi as 'Koodit Organisaatio'
  ,d3.organisaatio_fi as 'Organisaatio'
  ,d20.organisaatio_fi as 'Yhteistyo_org'
  ,d20.organisaatio_koodi as 'Yhteistyo_koodi'
  ,d3.organisaatio_sv as 'OrganisationSV'
  ,d3.organisaatio_en as 'OrganisationEN'
  ,case when d3.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' then d3.organisaatio_koodi else NULL end as 'Koodit Ammattikorkeakoulu'
  ,case when d3.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' then d3.organisaatio_fi else NULL end as 'Ammattikorkeakoulu'
  ,case when d3.oppilaitostyyppi_fi = 'Yliopistot' then d3.organisaatio_koodi else NULL end as 'Koodit Yliopisto'
  ,case when d3.oppilaitostyyppi_fi = 'Yliopistot' then d3.organisaatio_fi else NULL end as 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv as 'JulkaisufoorumitasoSV'
  ,d5.julkaisufoorumitaso_en as 'JulkaisufoorumitasoEN'
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv as 'Julkaisun pääluokkaSV'
  ,d4.julkaisunpaaluokka_nimi_en as 'Julkaisun pääluokkaEN'
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv as 'JulkaisutyyppiSV'
  ,d4.julkaisutyyppi_nimi_en as 'JulkaisutyyppiEN'
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv as 'Julkaisun kansainvälisyysSV'
  ,d6.julkaisun_kansainvalisyys_en as 'Julkaisun kansainvälisyysEN'
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv as 'Kansainvälinen yhteisjulkaisuSV'
  ,d7.kansainvalinen_yhteisjulkaisu_en as 'Kansainvälinen yhteisjulkaisuEN'
  ,d1.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv as 'PäätieteenalaSV'
  ,d1.paatieteenala_nimi_en as 'PäätieteenalaEN'
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv as 'TieteenalaSV'
  ,d1.tieteenala_nimi_en as 'TieteenalaEN'
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv as 'OKM ohjauksen alaSV'
  ,d8.ohjauksenala_nimi_en as 'OKM ohjauksen alaEN'
  ,d9.koodi as 'Koodit Koulutusala 95'
  ,d9.selite_fi as 'Koulutusala 95'
  ,d9.selite_sv as 'Utbildningsområde 95'
  ,d9.selite_en as 'Field of education 95'
  ,d10.koodi as 'Koodit Koulutusala 02'
  ,d10.selite_fi as 'Koulutusala 02'
  ,d10.selite_sv as 'Utbildningsområde 02'
  ,d10.selite_en as 'Field of education 02'
  ,d12.kytkin_fi as 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi as 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi as 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi as 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
  ,f.lukumaara

  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha' --new
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  --new
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi'  --new
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  --new

FROM dw.f_virta_jtp_tilasto f
LEFT JOIN ANTERO.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN ANTERO.dw.d_virtajtpsektori d2 ON d2.id=f.d_virtajtpsektori_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatio_id
LEFT JOIN ANTERO.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d5 ON d5.id=f.d_julkaisufoorumitaso_id
LEFT JOIN ANTERO.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN ANTERO.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=f.d_kansainvalinen_yhteisjulkaisu_id
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala95_id
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala02_id
LEFT JOIN dw.d_kytkin d12 on d12.id = d_yhteisjulkaisuSHPKytkin_id
LEFT JOIN dw.d_kytkin d13 on d13.id = d_yhteisjulkaisuTutkimuslaitosKytkin_id
LEFT JOIN dw.d_kytkin d14 on d14.id = d_yhteisjulkaisuMuuKytkin_id
LEFT JOIN dw.d_kytkin d15 on d15.id = d_yhteisjulkaisuYritysKytkin_id
LEFT JOIN dw.d_kytkin d16 on d16.id = d_rinnakkaistallennusKytkin_id
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = d_avoinSaatavuus_id

LEFT JOIN dw.d_julkaisufoorumitaso d18 ON d18.id=f.d_julkaisufoorumitaso_vanha_id --new
LEFT JOIN dw.d_julkaisufoorumitaso d19 ON d19.id=f.d_julkaisufoorumitaso_uusi_id --new

CROSS JOIN dw.f_virta_jtp_tilasto as f2
inner join ANTERO.dw.d_organisaatioluokitus d20 on d20.id=f2.d_organisaatio_id

LEFT JOIN (SELECT 
	yhteisjulkaisuId, MIN(tilastovuosi) as tilastovuosi
FROM dw.f_virta_jtp_tilasto f
GROUP BY yhteisjulkaisuId) d21 on f.yhteisjulkaisuId = d21.yhteisjulkaisuId
WHERE f.yhteisjulkaisuId = f2.yhteisjulkaisuId
--and f.d_organisaatio_id <> f2.d_organisaatio_id

) a
where a.lukumaara>0 AND yhteisjulkaisuId<>'0'


UNION ALL

SELECT
Tilastovuosi
,julkaisunTunnus
,yhteisjulkaisuId
,[Koodit Sektori]
,[Sektori]
,[Sektor]
,[Sector]
,[Koodit Organisaatio]
,[Organisaatio]
,Yhteistyo_org
,Yhteistyo_koodi
,[OrganisationSV]
,[OrganisationEN]
,[Koodit Ammattikorkeakoulu]
,[Ammattikorkeakoulu]
,[Koodit Yliopisto]
,[Yliopisto]
,[Koodit Julkaisufoorumitaso]
,[Julkaisufoorumitaso]
,[JulkaisufoorumitasoSV]
,[JulkaisufoorumitasoEN]
,[Koodit Julkaisun pääluokka]
,[Julkaisun pääluokka]
,[Julkaisun pääluokkaSV]
,[Julkaisun pääluokkaEN]
,[Koodit Julkaisutyyppi]
,[Julkaisutyyppi]
,[JulkaisutyyppiSV]
,[JulkaisutyyppiEN]
,[Koodit Julkaisun kansainvälisyys]
,[Julkaisun kansainvälisyys]
,[Julkaisun kansainvälisyysSV]
,[Julkaisun kansainvälisyysEN]
,[Koodit Kansainvälinen yhteisjulkaisu]
,[Kansainvälinen yhteisjulkaisu]
,[Kansainvälinen yhteisjulkaisuSV]
,[Kansainvälinen yhteisjulkaisuEN]
,case [Koodit Päätieteenala] when -1 then 9 else [Koodit Päätieteenala] end as [Koodit Päätieteenala]
,[Päätieteenala]
,[PäätieteenalaSV]
,[PäätieteenalaEN]
,case [Koodit Tieteenala] when -1 then 9999 else [Koodit Tieteenala] end as [Koodit Tieteenala]
,[Tieteenala]
,[TieteenalaSV]
,[TieteenalaEN]
,case [Koodit OKM ohjauksen ala] when -1 then 99 else [Koodit OKM ohjauksen ala] end as [Koodit OKM ohjauksen ala]
,[OKM ohjauksen ala]
,[OKM ohjauksen alaSV]
,[OKM ohjauksen alaEN]
,case [Koodit Koulutusala 95] when -1 then 99 else [Koodit Koulutusala 95] end as [Koodit Koulutusala 95]
,[Koulutusala 95]
,[Utbildningsområde 95]
,[Field of education 95]
,case [Koodit Koulutusala 02] when -1 then 9 else [Koodit Koulutusala 02] end as [Koodit Koulutusala 02]
,[Koulutusala 02]
,[Utbildningsområde 02]
,[Field of education 02]
,[Yhteisjulk. yliop. sairaanhoitopiiri]
,[Yhteisjulk. valtion sektoritutkimuslaitos]
,[Yhteisjulk. muu kotim. tutkimusorganisaatio]
,[Yhteisjulkaisu yrityksen kanssa]
,[Julkaisu rinnakkaistallennettu]
,case [Koodit Avoin saatavuus] when -1 then 9 else [Koodit Avoin saatavuus] end as [Koodit Avoin saatavuus]
,[Avoin saatavuus]
,[lukumaara]
,[Ammattikorkeakoulu_HTV_opetustki]=NULL
,[YO_HTV_opetusTKI]=NULL
,[YO_IV_HTV]=NULL
,[Koodit Julkaisufoorumitaso_vanha]   --new
,[Julkaisufoorumitaso vanha luokitus] --new
,[Koodit Julkaisufoorumitaso_uusi]    --new
,[Julkaisufoorumitaso uusi luokitus]  --new

FROM

(

SELECT case when f.yhteisjulkaisuId = 0 then f.tilastovuosi else d20.tilastovuosi end AS "Tilastovuosi"
  ,f.julkaisunTunnus as 'julkaisunTunnus'
  ,f.yhteisjulkaisuId as 'yhteisjulkaisuId'
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv as 'Sektor'
  ,d2.virtajtpsektori_en as 'Sector'
  ,d3.organisaatio_koodi as 'Koodit Organisaatio'
  ,d3.organisaatio_fi as 'Organisaatio'
  ,'Ulkomaiset organisaatiot' as 'Yhteistyo_org'
  ,'12345' as 'Yhteistyo_koodi'
  ,d3.organisaatio_sv as 'OrganisationSV'
  ,d3.organisaatio_en as 'OrganisationEN'
  ,case when d3.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' then d3.organisaatio_koodi else NULL end as 'Koodit Ammattikorkeakoulu'
  ,case when d3.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' then d3.organisaatio_fi else NULL end as 'Ammattikorkeakoulu'
  ,case when d3.oppilaitostyyppi_fi = 'Yliopistot' then d3.organisaatio_koodi else NULL end as 'Koodit Yliopisto'
  ,case when d3.oppilaitostyyppi_fi = 'Yliopistot' then d3.organisaatio_fi else NULL end as 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv as 'JulkaisufoorumitasoSV'
  ,d5.julkaisufoorumitaso_en as 'JulkaisufoorumitasoEN'
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv as 'Julkaisun pääluokkaSV'
  ,d4.julkaisunpaaluokka_nimi_en as 'Julkaisun pääluokkaEN'
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv as 'JulkaisutyyppiSV'
  ,d4.julkaisutyyppi_nimi_en as 'JulkaisutyyppiEN'
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv as 'Julkaisun kansainvälisyysSV'
  ,d6.julkaisun_kansainvalisyys_en as 'Julkaisun kansainvälisyysEN'
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv as 'Kansainvälinen yhteisjulkaisuSV'
  ,d7.kansainvalinen_yhteisjulkaisu_en as 'Kansainvälinen yhteisjulkaisuEN'
  ,d1.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv as 'PäätieteenalaSV'
  ,d1.paatieteenala_nimi_en as 'PäätieteenalaEN'
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv as 'TieteenalaSV'
  ,d1.tieteenala_nimi_en as 'TieteenalaEN'
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv as 'OKM ohjauksen alaSV'
  ,d8.ohjauksenala_nimi_en as 'OKM ohjauksen alaEN'
  ,d9.koodi as 'Koodit Koulutusala 95'
  ,d9.selite_fi as 'Koulutusala 95'
  ,d9.selite_sv as 'Utbildningsområde 95'
  ,d9.selite_en as 'Field of education 95'
  ,d10.koodi as 'Koodit Koulutusala 02'
  ,d10.selite_fi as 'Koulutusala 02'
  ,d10.selite_sv as 'Utbildningsområde 02'
  ,d10.selite_en as 'Field of education 02'
  ,d12.kytkin_fi as 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi as 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi as 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi as 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
  ,f.lukumaara

  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha' --new
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  --new
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi'  --new
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  --new

FROM dw.f_virta_jtp_tilasto f
LEFT JOIN ANTERO.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN ANTERO.dw.d_virtajtpsektori d2 ON d2.id=f.d_virtajtpsektori_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatio_id
LEFT JOIN ANTERO.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN ANTERO.dw.d_julkaisufoorumitaso d5 ON d5.id=f.d_julkaisufoorumitaso_id
LEFT JOIN ANTERO.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN ANTERO.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=f.d_kansainvalinen_yhteisjulkaisu_id
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala95_id
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala02_id
LEFT JOIN dw.d_kytkin d12 on d12.id = d_yhteisjulkaisuSHPKytkin_id
LEFT JOIN dw.d_kytkin d13 on d13.id = d_yhteisjulkaisuTutkimuslaitosKytkin_id
LEFT JOIN dw.d_kytkin d14 on d14.id = d_yhteisjulkaisuMuuKytkin_id
LEFT JOIN dw.d_kytkin d15 on d15.id = d_yhteisjulkaisuYritysKytkin_id
LEFT JOIN dw.d_kytkin d16 on d16.id = d_rinnakkaistallennusKytkin_id
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = d_avoinSaatavuus_id
LEFT JOIN dw.d_julkaisufoorumitaso d18 ON d18.id=f.d_julkaisufoorumitaso_vanha_id --new
LEFT JOIN dw.d_julkaisufoorumitaso d19 ON d19.id=f.d_julkaisufoorumitaso_uusi_id --new

LEFT JOIN (SELECT 
	yhteisjulkaisuId, MIN(tilastovuosi) as tilastovuosi
FROM dw.f_virta_jtp_tilasto f
GROUP BY yhteisjulkaisuId) d20 on f.yhteisjulkaisuId = d20.yhteisjulkaisuId
WHERE d7.id = 2

) a
where a.lukumaara>0 


UNION ALL

SELECT
[Tilastovuosi]=f_amk_henkilon_tyo.vuosi
,NULL --julkaisunTunnus
,NULL --yhteisjulkaisuId
,NULL --[Koodit Sektori]
,[Sektori]='Ammattikorkeakoulu'
,[Sektor]='Yrkeshögskola'
,[Sector]='University of Applied Sciences'
,[Koodit Organisaatio]=d3.organisaatio_koodi
,[Organisaatio]=d3.organisaatio_fi
,NULL --Yhteistyo_org
,NULL --Yhteistyo_koodi
,[OrganisationSV]=d3.organisaatio_sv
,[OrganisationEN]=d3.organisaatio_en
,[Koodit Ammattikorkeakoulu]=d3.organisaatio_koodi
,[Ammattikorkeakoulu]=d3.organisaatio_fi
,NULL --[Koodit Yliopisto]
,NULL --[Yliopisto]
,NULL --[Koodit Julkaisufoorumitaso]
,NULL --[Julkaisufoorumitaso]
,NULL --[JulkaisufoorumitasoSV]
,NULL --[JulkaisufoorumitasoEN]
,NULL --[Koodit Julkaisun pääluokka]
,NULL --[Julkaisun pääluokka]
,NULL --[Julkaisun pääluokkaSV]
,NULL --[Julkaisun pääluokkaEN]
,NULL --[Koodit Julkaisutyyppi]
,NULL --[Julkaisutyyppi]
,NULL --[JulkaisutyyppiSV]
,NULL --[JulkaisutyyppiEN]
,NULL --[Koodit Julkaisun kansainvälisyys]
,NULL --[Julkaisun kansainvälisyys]
,NULL --[Julkaisun kansainvälisyysSV]
,NULL --[Julkaisun kansainvälisyysEN]
,NULL --[Koodit Kansainvälinen yhteisjulkaisu]
,NULL --[Kansainvälinen yhteisjulkaisu]
,NULL --[Kansainvälinen yhteisjulkaisuSV]
,NULL --[Kansainvälinen yhteisjulkaisuEN]
,[Koodit Päätieteenala]=d21.paatieteenala_koodi
,[Päätieteenala]=d21.paatieteenala_nimi_fi
,[PäätieteenalaSV]=d21.paatieteenala_nimi_sv
,[PäätieteenalaEN]=d21.paatieteenala_nimi_en
,NULL --case [Koodit Tieteenala] when -1 then 9999 else [Koodit Tieteenala] end as [Koodit Tieteenala]
,NULL --[Tieteenala]
,NULL --[TieteenalaSV]
,NULL --[TieteenalaEN]
,case when d25.ohjauksenala_koodi=-1 then 99 else d25.ohjauksenala_koodi end
,d25.ohjauksenala_nimi_fi --[OKM ohjauksen ala]
,NULL --[OKM ohjauksen alaSV]
,NULL --[OKM ohjauksen alaEN]
,NULL --case [Koodit Koulutusala 95] when -1 then 99 else [Koodit Koulutusala 95] end as [Koodit Koulutusala 95]
,NULL --[Koulutusala 95]
,NULL --[Utbildningsområde 95]
,NULL --[Field of education 95]
,NULL --case [Koodit Koulutusala 02] when -1 then 9 else [Koodit Koulutusala 02] end as [Koodit Koulutusala 02]
,NULL --[Koulutusala 02]
,NULL --[Utbildningsområde 02]
,NULL --[Field of education 02]
,NULL --[Yhteisjulk. yliop. sairaanhoitopiiri]
,NULL --[Yhteisjulk. valtion sektoritutkimuslaitos]
,NULL --[Yhteisjulk. muu kotim. tutkimusorganisaatio]
,NULL --[Yhteisjulkaisu yrityksen kanssa]
,NULL --[Julkaisu rinnakkaistallennettu]
,NULL --case [Koodit Avoin saatavuus] when -1 then 9 else [Koodit Avoin saatavuus] end as [Koodit Avoin saatavuus]
,NULL --[Avoin saatavuus]
,NULL --[lukumaara]
,case when d22.koodi in ('2','1') then henkilotyovuosi else 0 end as 'Ammattikorkeakoulu_HTV_opetustki'
,NULL --'YO_HTV_opetusTKI'
,NULL --'YO_IV_HTV'
,null --Koodit Julkaisufoorumitaso_vanha--new
,null --Julkaisufoorumitaso vanha luokitus --new
,null --Koodit Julkaisufoorumitaso_uusi  --new
,null --Julkaisufoorumitaso uusi luokitus  --new



from dw.f_amk_henkilon_tyo
left join antero.dw.d_amk d20 on d20.id=f_amk_henkilon_tyo.d_amk_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.organisaatio_koodi=d20.amk_tunnus
left join ANTERO.dw.d_tieteenala d21 on d21.id=f_amk_henkilon_tyo.d_tieteenala_id
left join ANTERO.dw.d_amk_tehtavanjaottelu d22 on d22.id=f_amk_henkilon_tyo.d_tehtavanjaottelu
left join ANTERO.dw.d_ohjauksenala d25 on d25.id=f_amk_henkilon_tyo.d_ohjauksenala_id

UNION ALL

SELECT
[Tilastovuosi]=f_yo_henkilon_tyo.vuosi
,NULL --julkaisunTunnus
,NULL --yhteisjulkaisuId
,NULL --[Koodit Sektori]
,[Sektori]='Yliopisto'
,[Sektor]='Universitet'
,[Sector]='University'
,[Koodit Organisaatio]=d3.organisaatio_koodi
,[Organisaatio]=d3.organisaatio_fi
,NULL --Yhteistyo_org
,NULL --Yhteistyo_koodi
,[OrganisationSV]=d3.organisaatio_sv
,[OrganisationEN]=d3.organisaatio_en
,NULL --[Koodit Ammattikorkeakoulu]
,NULL --[Ammattikorkeakoulu]
,[Koodit Yliopisto]=d3.organisaatio_koodi
,[Yliopisto]=d3.organisaatio_fi
,NULL --[Koodit Julkaisufoorumitaso]
,NULL --[Julkaisufoorumitaso]
,NULL --[JulkaisufoorumitasoSV]
,NULL --[JulkaisufoorumitasoEN]
,NULL --[Koodit Julkaisun pääluokka]
,NULL --[Julkaisun pääluokka]
,NULL --[Julkaisun pääluokkaSV]
,NULL --[Julkaisun pääluokkaEN]
,NULL --[Koodit Julkaisutyyppi]
,NULL --[Julkaisutyyppi]
,NULL --[JulkaisutyyppiSV]
,NULL --[JulkaisutyyppiEN]
,NULL --[Koodit Julkaisun kansainvälisyys]
,NULL --[Julkaisun kansainvälisyys]
,NULL --[Julkaisun kansainvälisyysSV]
,NULL --[Julkaisun kansainvälisyysEN]
,NULL --[Koodit Kansainvälinen yhteisjulkaisu]
,NULL --[Kansainvälinen yhteisjulkaisu]
,NULL --[Kansainvälinen yhteisjulkaisuSV]
,NULL --[Kansainvälinen yhteisjulkaisuEN]
,[Koodit Päätieteenala]=d21.paatieteenala_koodi
,[Päätieteenala]=d21.paatieteenala_nimi_fi
,[PäätieteenalaSV]=d21.paatieteenala_nimi_sv
,[PäätieteenalaEN]=d21.paatieteenala_nimi_en
,NULL --case [Koodit Tieteenala] when -1 then 9999 else [Koodit Tieteenala] end as [Koodit Tieteenala]
,NULL --[Tieteenala]
,NULL --[TieteenalaSV]
,NULL --[TieteenalaEN]
,case when d25.ohjauksenala_koodi=-1 then 99 else d25.ohjauksenala_koodi end 
,d25.ohjauksenala_nimi_fi
,NULL --[OKM ohjauksen alaSV]
,NULL --[OKM ohjauksen alaEN]
,NULL --case [Koodit Koulutusala 95] when -1 then 99 else [Koodit Koulutusala 95] end as [Koodit Koulutusala 95]
,NULL --[Koulutusala 95]
,NULL --[Utbildningsområde 95]
,NULL --[Field of education 95]
,NULL --case [Koodit Koulutusala 02] when -1 then 9 else [Koodit Koulutusala 02] end as [Koodit Koulutusala 02]
,NULL --[Koulutusala 02]
,NULL --[Utbildningsområde 02]
,NULL --[Field of education 02]
,NULL --[Yhteisjulk. yliop. sairaanhoitopiiri]
,NULL --[Yhteisjulk. valtion sektoritutkimuslaitos]
,NULL --[Yhteisjulk. muu kotim. tutkimusorganisaatio]
,NULL --[Yhteisjulkaisu yrityksen kanssa]
,NULL --[Julkaisu rinnakkaistallennettu]
,NULL --case [Koodit Avoin saatavuus] when -1 then 9 else [Koodit Avoin saatavuus] end as [Koodit Avoin saatavuus]
,NULL --[Avoin saatavuus]
,NULL --[lukumaara]
,NULL --'Ammattikorkeakoulu_HTV_opetustki'
,case when d23.id in ('1','2','3','4') then henkilotyovuosi else 0 end as 'YO_HTV_opetusTKI'
,case when d23.id='4' then henkilotyovuosi else 0 end as 'YO_IV_HTV'
,null --Koodit Julkaisufoorumitaso_vanha--new
,null --Julkaisufoorumitaso vanha luokitus --new
,null --Koodit Julkaisufoorumitaso_uusi  --new
,null --Julkaisufoorumitaso uusi luokitus  --new

from dw.f_yo_henkilon_tyo
left join antero.dw.d_yo d20 on d20.id=f_yo_henkilon_tyo.d_yliopisto_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.organisaatio_koodi=d20.yo_tunnus
left join ANTERO.dw.d_tieteenala d21 on d21.id=f_yo_henkilon_tyo.d_tieteenala_id
left join ANTERO.dw.d_yo_henkilostoryhma d22 on d22.id=f_yo_henkilon_tyo.d_henkilostoryhma_id
left join antero.dw.d_yo_tutkijanuravaihe d23 on d23.id=f_yo_henkilon_tyo.d_tutkijanuravaihe_id
left join ANTERO.dw.d_ohjauksenala d25 on d25.id=f_yo_henkilon_tyo.d_ohjauksenala_id





GO

USE [ANTERO]


