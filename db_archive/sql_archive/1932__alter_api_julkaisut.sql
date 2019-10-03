USE [ANTERO]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [api].[julkaisut] AS


SELECT
Tilastovuosi
,julkaisunTunnus
,[Koodit Sektori]
,[Sektori]
,[Sektor]
,[Sector]
,[Koodit Organisaatio]
,[Organisaatio]
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
,[Koodit Julkaisufoorumitaso 2011-2014]
,[Julkaisufoorumitaso 2011-2014]
,[Julkaisufoorumitaso 2011-2014SV]
,[Julkaisufoorumitaso 2011-2014EN]
,[Koodit Julkaisufoorumitaso 2015->]
,[Julkaisufoorumitaso 2015->]
,[Julkaisufoorumitaso 2015->SV]
,[Julkaisufoorumitaso 2015->EN]
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
,[JufoTunnus]
,[lukumaara]
,defaultorder

--oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset

--,2000000000+ROW_NUMBER() OVER(ORDER BY [julkaisunTunnus] ASC) as defaultorder

FROM

(


SELECT f.tilastovuosi AS "Tilastovuosi"
  ,[julkaisunTunnus] as 'julkaisunTunnus'
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv as 'Sektor'
  ,d2.virtajtpsektori_en as 'Sector'
  ,d3.organisaatio_koodi as 'Koodit Organisaatio'
  ,d3.organisaatio_fi as 'Organisaatio'
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
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv as 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en as 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
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
  ,f.jufoid as 'JufoTunnus'
  ,f.lukumaara

  --oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset

  ,1000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.id ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.id) as defaultorder


FROM dw.f_virta_jtp_tilasto f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN dw.d_virtajtpsektori d2 ON d2.id=f.d_virtajtpsektori_id
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatio_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=f.d_julkaisufoorumitaso_id
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=f.d_kansainvalinen_yhteisjulkaisu_id
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala95_id
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala02_id
LEFT JOIN dw.d_kytkin d12 on d12.id = d_yhteisjulkaisuSHPKytkin_id
LEFT JOIN dw.d_kytkin d13 on d13.id = d_yhteisjulkaisuTutkimuslaitosKytkin_id
LEFT JOIN dw.d_kytkin d14 on d14.id = d_yhteisjulkaisuMuuKytkin_id
LEFT JOIN dw.d_kytkin d15 on d15.id = d_yhteisjulkaisuYritysKytkin_id
LEFT JOIN dw.d_kytkin d16 on d16.id = d_rinnakkaistallennusKytkin_id
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = d_avoinSaatavuus_id
LEFT JOIN dw.d_julkaisufoorumitaso d18 on d18.id = d_julkaisufoorumitaso_vanha_id
LEFT JOIN dw.d_julkaisufoorumitaso d19 on d19.id = d_julkaisufoorumitaso_uusi_id

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.yo_tunnus as 'Koodit Organisaatio'
  ,d3.yo_nimi_fi as 'Organisaatio'
  ,d3.yo_nimi_sv
  ,d3.yo_nimi_en
  ,null as 'Koodit Ammattikorkeakoulu'
  ,NULL as 'Ammattikorkeakoulu'
  ,d3.yo_tunnus as 'Koodit Yliopisto'
  ,d3.yo_nimi_fi as 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv as 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en as 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
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
  ,null as 'jufoid'
  ,f.julkaisujen_maara

   --oletusjärjestys sorttausta varten, 2000000000+ lajittelee alikyselyn tulokset
   ,2000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.id ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.id) as defaultorder

FROM dw.f_yo_julkaisut_f_i f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN dw.d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Yliopisto')
LEFT JOIN dw.d_yo d3 ON d3.id=f.d_yliopisto_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala_id
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=-1
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1
LEFT join dw.d_julkaisufoorumitaso d18 on d18.id = -1
LEFT join dw.d_julkaisufoorumitaso d19 on d19.id = -1
where d4.julkaisutyyppi_koodi<>'H2'

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.amk_tunnus as 'Koodit Organisaatio'
  ,d3.amk_nimi_fi as 'Organisaatio'
  ,d3.amk_nimi_sv
  ,d3.amk_nimi_en
  ,d3.amk_tunnus as 'Koodit Ammattikorkeakoulu'
  ,d3.amk_nimi_fi as 'Ammattikorkeakoulu'
  ,NULL as 'Koodit Yliopisto'
  ,NULL as 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv as 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en as 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
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
  ,null as 'jufoid'
  ,f.julkaisujen_maara

   --oletusjärjestys sorttausta varten, 3000000000+ lajittelee alikyselyn tulokset
  ,3000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.id ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.id) as defaultorder


FROM dw.f_amk_julkaisut_f_i f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN dw.d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Ammattikorkeakoulu')
LEFT JOIN dw.d_amk d3 ON d3.id=f.d_amk_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=-1
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala_id
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1
LEFT join dw.d_julkaisufoorumitaso d18 on d18.id = -1
LEFT join dw.d_julkaisufoorumitaso d19 on d19.id = -1
where d4.julkaisutyyppi_koodi<>'H2'


UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.yo_tunnus as 'Koodit Organisaatio'
  ,d3.yo_nimi_fi as 'Organisaatio'
  ,d3.yo_nimi_sv
  ,d3.yo_nimi_en
  ,null as 'Koodit Ammattikorkeakoulu'
  ,NULL as 'Ammattikorkeakoulu'
  ,d3.yo_tunnus as 'Koodit Yliopisto'
  ,d3.yo_nimi_fi as 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv as 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en as 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
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
  ,null as 'jufoid'
  ,f.h21

  --oletusjärjestys sorttausta varten, 4000000000+ lajittelee alikyselyn tulokset
  ,4000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.julkaisutyyppi_koodi ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.d_koulutusala_id) as defaultorder

FROM dw.f_yo_keksintoilmoitukset f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN dw.d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Yliopisto')
LEFT JOIN dw.d_yo d3 ON d3.id=f.d_yliopisto_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.julkaisutyyppi_koodi='H2'
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala_id
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=-1
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1
LEFT join dw.d_julkaisufoorumitaso d18 on d18.id = -1
LEFT join dw.d_julkaisufoorumitaso d19 on d19.id = -1

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.amk_tunnus as 'Koodit Organisaatio'
  ,d3.amk_nimi_fi as 'Organisaatio'
  ,d3.amk_nimi_sv
  ,d3.amk_nimi_en
  ,d3.amk_tunnus as 'Koodit Ammattikorkeakoulu'
  ,d3.amk_nimi_fi as 'Ammattikorkeakoulu'
  ,NULL as 'Koodit Yliopisto'
  ,NULL as 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv as 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en as 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
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
  ,null as 'jufoid'
  ,f.h21

  --oletusjärjestys sorttausta varten, 5000000000+ lajittelee alikyselyn tulokset

  ,5000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.julkaisutyyppi_koodi ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.d_tieteenala_id) as defaultorder

FROM dw.f_amk_keksintoilmoitukset f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN dw.d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Ammattikorkeakoulu')
LEFT JOIN dw.d_amk d3 ON d3.id=f.d_amk_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.julkaisutyyppi_koodi='H2'
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=-1
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala_id
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1
LEFT join dw.d_julkaisufoorumitaso d18 on d18.id = -1
LEFT join dw.d_julkaisufoorumitaso d19 on d19.id = -1

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.amk_tunnus as 'Koodit Organisaatio'
  ,d3.amk_nimi_fi as 'Organisaatio'
  ,d3.amk_nimi_sv
  ,d3.amk_nimi_en
  ,d3.amk_tunnus as 'Koodit Ammattikorkeakoulu'
  ,d3.amk_nimi_fi as 'Ammattikorkeakoulu'
  ,NULL as 'Koodit Yliopisto'
  ,NULL as 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv as 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en as 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,case when d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 then (select top 1 paatieteenala_koodi from antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) else d1.paatieteenala_koodi end as 'Koodit Päätieteenala'
  ,case when d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 then (select top 1 paatieteenala_nimi_fi from antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) else d1.paatieteenala_nimi_fi end as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
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
  ,null as 'jufoid'
  ,f.julkaisujen_maara
  --oletusjärjestys sorttausta varten, 6000000000+ lajittelee alikyselyn tulokset

  ,6000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.id ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.id) as defaultorder

FROM dw.f_amk_julkaisut_a_e f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN dw.d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Ammattikorkeakoulu')
LEFT JOIN dw.d_amk d3 ON d3.id=f.d_amk_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=-1
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala_id
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1
LEFT join dw.d_julkaisufoorumitaso d18 on d18.id = -1
LEFT join dw.d_julkaisufoorumitaso d19 on d19.id = -1
WHERE vuosi in (2010,2011)

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.yo_tunnus as 'Koodit Organisaatio'
  ,d3.yo_nimi_fi as 'Organisaatio'
  ,d3.yo_nimi_sv
  ,d3.yo_nimi_en
  ,null as 'Koodit Ammattikorkeakoulu'
  ,NULL as 'Ammattikorkeakoulu'
  ,d3.yo_tunnus as 'Koodit Yliopisto'
  ,d3.yo_nimi_fi as 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv as 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en as 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,case when d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 then (select top 1 paatieteenala_koodi from antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) else d1.paatieteenala_koodi end as 'Koodit Päätieteenala'
  ,case when d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 then (select top 1 paatieteenala_nimi_fi from antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) else d1.paatieteenala_nimi_fi end as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
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
  ,null as 'jufoid'
  ,f.julkaisujen_maara
  --oletusjärjestys sorttausta varten, 7000000000+ lajittelee alikyselyn tulokset

  ,7000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.id ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.id) as defaultorder

FROM dw.f_yo_julkaisut_a_e f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN dw.d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Yliopisto')
LEFT JOIN dw.d_yo d3 ON d3.id=f.d_yliopisto_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala_id
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=-1
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1
LEFT join dw.d_julkaisufoorumitaso d18 on d18.id = -1
LEFT join dw.d_julkaisufoorumitaso d19 on d19.id = -1
WHERE vuosi = 2010


) a
where a.lukumaara>0






GO
USE [ANTERO]

