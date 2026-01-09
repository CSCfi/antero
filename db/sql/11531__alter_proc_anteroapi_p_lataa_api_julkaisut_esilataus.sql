USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_julkaisut_esilataus]    Script Date: 9.1.2026 8.29.24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_julkaisut_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_julkaisut];

INSERT INTO AnteroAPI.dw.[api_julkaisut]

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
,CASE  [Koodit Päätieteenala] WHEN -1 THEN 9 ELSE [Koodit Päätieteenala] END AS [Koodit Päätieteenala]
,[Päätieteenala]
,[PäätieteenalaSV]
,[PäätieteenalaEN]
,CASE  [Koodit Tieteenala] WHEN -1 THEN 9999 ELSE [Koodit Tieteenala] END AS [Koodit Tieteenala]
,[Tieteenala]
,[TieteenalaSV]
,[TieteenalaEN]
,CASE  [Koodit OKM ohjauksen ala] WHEN -1 THEN 99 ELSE [Koodit OKM ohjauksen ala] END AS [Koodit OKM ohjauksen ala]
,[OKM ohjauksen ala]
,[OKM ohjauksen alaSV]
,[OKM ohjauksen alaEN]
,CASE  [Koodit Koulutusala 95] WHEN -1 THEN 99 ELSE [Koodit Koulutusala 95] END AS [Koodit Koulutusala 95]
,[Koulutusala 95]
,[Utbildningsområde 95]
,[Field of education 95]
,CASE  [Koodit Koulutusala 02] WHEN -1 THEN 9 ELSE [Koodit Koulutusala 02] END AS [Koodit Koulutusala 02]
,[Koulutusala 02]
,[Utbildningsområde 02]
,[Field of education 02]
,[Yhteisjulk. yliop. sairaanhoitopiiri]
,[Yhteisjulk. valtion sektoritutkimuslaitos]
,[Yhteisjulk. muu kotim. tutkimusorganisaatio]
,[Yhteisjulkaisu yrityksen kanssa]
,[Julkaisu rinnakkaistallennettu]
,CASE  [Koodit Avoin saatavuus] WHEN -1 THEN 9 ELSE [Koodit Avoin saatavuus] END AS [Koodit Avoin saatavuus]
,[Avoin saatavuus]
,[JufoTunnus]
,sum([lukumaara]) as lukumaara
--,defaultorder

--oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset

--,ROW_NUMBER() OVER(ORDER BY [julkaisunTunnus] ASC) AS offset
FROM

(


SELECT DISTINCT f.tilastovuosi AS "Tilastovuosi"
  ,[julkaisunTunnus] AS 'julkaisunTunnus'
  ,d2.virtajtpsektori_koodi AS 'Koodit Sektori'
  ,d2.virtajtpsektori_fi AS 'Sektori'
  ,d2.virtajtpsektori_sv AS 'Sektor'
  ,d2.virtajtpsektori_en AS 'Sector'
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Organisaatio'
  ,d3.organisaatio_fi AS 'Organisaatio'
  ,d3.organisaatio_sv AS 'OrganisationSV'
  ,d3.organisaatio_en AS 'OrganisationEN'
  ,CASE  WHEN d3.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' THEN d3.organisaatio_nykyinen_koodi ELSE NULL END AS 'Koodit Ammattikorkeakoulu'
  ,CASE  WHEN d3.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' THEN d3.organisaatio_fi ELSE NULL END AS 'Ammattikorkeakoulu'
  ,CASE  WHEN d3.oppilaitostyyppi_fi = 'Yliopistot' THEN d3.organisaatio_nykyinen_koodi ELSE NULL END AS 'Koodit Yliopisto'
  ,CASE  WHEN d3.oppilaitostyyppi_fi = 'Yliopistot' THEN d3.organisaatio_fi ELSE NULL END AS 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv AS 'JulkaisufoorumitasoSV'
  ,d5.julkaisufoorumitaso_en AS 'JulkaisufoorumitasoEN'
  ,d18.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv AS 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en AS 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi AS 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi AS 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv AS 'Julkaisun pääluokkaSV'
  ,d4.julkaisunpaaluokka_nimi_en AS 'Julkaisun pääluokkaEN'
  ,d4.julkaisutyyppi_koodi AS 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi AS 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv AS 'JulkaisutyyppiSV'
  ,d4.julkaisutyyppi_nimi_en AS 'JulkaisutyyppiEN'
  ,d6.julkaisun_kansainvalisyys_koodi AS 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi AS 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv AS 'Julkaisun kansainvälisyysSV'
  ,d6.julkaisun_kansainvalisyys_en AS 'Julkaisun kansainvälisyysEN'
  ,d7.kansainvalinen_yhteisjulkaisu_koodi AS 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi AS 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv AS 'Kansainvälinen yhteisjulkaisuSV'
  ,d7.kansainvalinen_yhteisjulkaisu_en AS 'Kansainvälinen yhteisjulkaisuEN'
  ,d1.paatieteenala_koodi AS 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi AS 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv AS 'PäätieteenalaSV'
  ,d1.paatieteenala_nimi_en AS 'PäätieteenalaEN'
  ,d1.tieteenala_koodi AS 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi AS 'Tieteenala'
  ,d1.tieteenala_nimi_sv AS 'TieteenalaSV'
  ,d1.tieteenala_nimi_en AS 'TieteenalaEN'
  ,d8.ohjauksenala_koodi AS 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi AS 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv AS 'OKM ohjauksen alaSV'
  ,d8.ohjauksenala_nimi_en AS 'OKM ohjauksen alaEN'
  ,d9.koodi AS 'Koodit Koulutusala 95'
  ,d9.selite_fi AS 'Koulutusala 95'
  ,d9.selite_sv AS 'Utbildningsområde 95'
  ,d9.selite_en AS 'Field of education 95'
  ,d10.koodi AS 'Koodit Koulutusala 02'
  ,d10.selite_fi AS 'Koulutusala 02'
  ,d10.selite_sv AS 'Utbildningsområde 02'
  ,d10.selite_en AS 'Field of education 02'
  ,d12.kytkin_fi AS 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi AS 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi AS 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi AS 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi AS 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi AS 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi AS 'Avoin saatavuus'
  ,f.jufoid AS 'JufoTunnus'
  ,f.lukumaara

  --oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset

 -- ,1000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.id ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.id) AS defaultorder


FROM antero.dw.f_virta_jtp_tilasto f
LEFT JOIN antero.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN antero.dw.d_virtajtpsektori d2 ON d2.id=f.d_virtajtpsektori_id
LEFT JOIN antero.dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatio_id
LEFT JOIN antero.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN antero.dw.d_julkaisufoorumitaso d5 ON d5.id=f.d_julkaisufoorumitaso_id
LEFT JOIN antero.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN antero.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=f.d_kansainvalinen_yhteisjulkaisu_id
LEFT JOIN antero.dw.d_ohjauksenala d8 ON d8.id=f.d_ohjauksenala_id
LEFT JOIN antero.dw.d_koulutusala_1995 d9 ON d9.id=f.d_koulutusala95_id
LEFT JOIN antero.dw.d_koulutusala_2002 d10 ON d10.id=f.d_koulutusala02_id
LEFT JOIN antero.dw.d_kytkin d12 ON d12.id = d_yhteisjulkaisuSHPKytkin_id
LEFT JOIN antero.dw.d_kytkin d13 ON d13.id = d_yhteisjulkaisuTutkimuslaitosKytkin_id
LEFT JOIN antero.dw.d_kytkin d14 ON d14.id = d_yhteisjulkaisuMuuKytkin_id
LEFT JOIN antero.dw.d_kytkin d15 ON d15.id = d_yhteisjulkaisuYritysKytkin_id
LEFT JOIN antero.dw.d_kytkin d16 ON d16.id = d_rinnakkaistallennusKytkin_id
LEFT JOIN antero.dw.d_avoinsaatavuus d17 ON d17.id = d_avoinSaatavuus_id
LEFT JOIN antero.dw.d_julkaisufoorumitaso d18 ON d18.id = d_julkaisufoorumitaso_vanha_id
LEFT JOIN antero.dw.d_julkaisufoorumitaso d19 ON d19.id = d_julkaisufoorumitaso_uusi_id

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi AS 'Koodit Sektori'
  ,d2.virtajtpsektori_fi AS 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Organisaatio'
  ,d3.organisaatio_fi AS 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,null AS 'Koodit Ammattikorkeakoulu'
  ,NULL AS 'Ammattikorkeakoulu'
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Yliopisto'
  ,d3.organisaatio_fi AS 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv AS 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en AS 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi AS 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi AS 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi AS 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi AS 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi AS 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi AS 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi AS 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi AS 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi AS 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi AS 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi AS 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi AS 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi AS 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi AS 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi AS 'Koodit Koulutusala 95'
  ,d9.selite_fi AS 'Koulutusala 95'
  ,d9.selite_sv AS 'Utbildningsområde 95'
  ,d9.selite_en AS 'Field of education 95'
  ,d10.koodi AS 'Koodit Koulutusala 02'
  ,d10.selite_fi AS 'Koulutusala 02'
  ,d10.selite_sv AS 'Utbildningsområde 02'
  ,d10.selite_en AS 'Field of education 02'
  ,d12.kytkin_fi AS 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi AS 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi AS 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi AS 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi AS 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi AS 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi AS 'Avoin saatavuus'
  ,null AS 'jufoid'
  ,f.julkaisujen_maara

   --oletusjärjestys sorttausta varten, 2000000000+ lajittelee alikyselyn tulokset
  -- ,2000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.id ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.id) AS defaultorder

FROM antero.dw.f_yo_julkaisut_f_i f
LEFT JOIN antero.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN antero.dw.d_virtajtpsektori d2 ON d2.id=(select id FROM antero.dw.d_virtajtpsektori where virtajtpsektori_fi='Yliopisto')
LEFT JOIN antero.dw.d_organisaatioluokitus d3 ON d3.id=f.d_yliopisto_id
LEFT JOIN antero.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN antero.dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN antero.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN antero.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN antero.dw.d_ohjauksenala d8 ON d8.id=f.d_ohjauksenala_id
LEFT JOIN antero.dw.d_koulutusala_1995 d9 ON d9.id=f.d_koulutusala_id
LEFT JOIN antero.dw.d_koulutusala_2002 d10 ON d10.id=-1
LEFT JOIN antero.dw.d_kytkin d12 ON d12.id = -1
LEFT JOIN antero.dw.d_kytkin d13 ON d13.id = -1
LEFT JOIN antero.dw.d_kytkin d14 ON d14.id = -1
LEFT JOIN antero.dw.d_kytkin d15 ON d15.id = -1
LEFT JOIN antero.dw.d_kytkin d16 ON d16.id = -1
LEFT JOIN antero.dw.d_avoinsaatavuus d17 ON d17.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d18 ON d18.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d19 ON d19.id = -1
where d4.julkaisutyyppi_koodi<>'H2'

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi AS 'Koodit Sektori'
  ,d2.virtajtpsektori_fi AS 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Organisaatio'
  ,d3.organisaatio_fi AS 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Ammattikorkeakoulu'
  ,d3.organisaatio_fi AS 'Ammattikorkeakoulu'
  ,NULL AS 'Koodit Yliopisto'
  ,NULL AS 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv AS 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en AS 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi AS 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi AS 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi AS 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi AS 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi AS 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi AS 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi AS 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi AS 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi AS 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi AS 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi AS 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi AS 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi AS 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi AS 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi AS 'Koodit Koulutusala 95'
  ,d9.selite_fi AS 'Koulutusala 95'
  ,d9.selite_sv AS 'Utbildningsområde 95'
  ,d9.selite_en AS 'Field of education 95'
  ,d10.koodi AS 'Koodit Koulutusala 02'
  ,d10.selite_fi AS 'Koulutusala 02'
  ,d10.selite_sv AS 'Utbildningsområde 02'
  ,d10.selite_en AS 'Field of education 02'
  ,d12.kytkin_fi AS 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi AS 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi AS 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi AS 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi AS 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi AS 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi AS 'Avoin saatavuus'
  ,null AS 'jufoid'
  ,f.julkaisujen_maara

   --oletusjärjestys sorttausta varten, 3000000000+ lajittelee alikyselyn tulokset
  --,3000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.id ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.id) AS defaultorder


FROM antero.dw.f_amk_julkaisut_f_i f
LEFT JOIN antero.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN antero.dw.d_virtajtpsektori d2 ON d2.id=(select id FROM antero.dw.d_virtajtpsektori where virtajtpsektori_fi='Ammattikorkeakoulu')
LEFT JOIN antero.dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatioluokitus_id
LEFT JOIN antero.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN antero.dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN antero.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN antero.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN antero.dw.d_ohjauksenala d8 ON d8.id=f.d_ohjauksenala_id
LEFT JOIN antero.dw.d_koulutusala_1995 d9 ON d9.id=-1
LEFT JOIN antero.dw.d_koulutusala_2002 d10 ON d10.id=f.d_koulutusala_id
LEFT JOIN antero.dw.d_kytkin d12 ON d12.id = -1
LEFT JOIN antero.dw.d_kytkin d13 ON d13.id = -1
LEFT JOIN antero.dw.d_kytkin d14 ON d14.id = -1
LEFT JOIN antero.dw.d_kytkin d15 ON d15.id = -1
LEFT JOIN antero.dw.d_kytkin d16 ON d16.id = -1
LEFT JOIN antero.dw.d_avoinsaatavuus d17 ON d17.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d18 ON d18.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d19 ON d19.id = -1
where d4.julkaisutyyppi_koodi<>'H2'


UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi AS 'Koodit Sektori'
  ,d2.virtajtpsektori_fi AS 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Organisaatio'
  ,d3.organisaatio_fi AS 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,null AS 'Koodit Ammattikorkeakoulu'
  ,NULL AS 'Ammattikorkeakoulu'
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Yliopisto'
  ,d3.organisaatio_fi AS 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv AS 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en AS 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi AS 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi AS 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi AS 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi AS 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi AS 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi AS 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi AS 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi AS 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi AS 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi AS 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi AS 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi AS 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi AS 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi AS 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi AS 'Koodit Koulutusala 95'
  ,d9.selite_fi AS 'Koulutusala 95'
  ,d9.selite_sv AS 'Utbildningsområde 95'
  ,d9.selite_en AS 'Field of education 95'
  ,d10.koodi AS 'Koodit Koulutusala 02'
  ,d10.selite_fi AS 'Koulutusala 02'
  ,d10.selite_sv AS 'Utbildningsområde 02'
  ,d10.selite_en AS 'Field of education 02'
  ,d12.kytkin_fi AS 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi AS 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi AS 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi AS 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi AS 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi AS 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi AS 'Avoin saatavuus'
  ,null AS 'jufoid'
  ,f.h21

  --oletusjärjestys sorttausta varten, 4000000000+ lajittelee alikyselyn tulokset
 -- ,4000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.julkaisutyyppi_koodi ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.d_koulutusala_id) AS defaultorder

FROM antero.dw.f_yo_keksintoilmoitukset f
LEFT JOIN antero.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN antero.dw.d_virtajtpsektori d2 ON d2.id=(select id FROM antero.dw.d_virtajtpsektori where virtajtpsektori_fi='Yliopisto')
LEFT JOIN antero.dw.d_organisaatioluokitus d3 ON d3.id=f.d_yliopisto_id
LEFT JOIN antero.dw.d_julkaisutyyppi d4 ON d4.julkaisutyyppi_koodi='H2'
LEFT JOIN antero.dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN antero.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN antero.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN antero.dw.d_ohjauksenala d8 ON d8.id=f.d_ohjauksenala_id
LEFT JOIN antero.dw.d_koulutusala_1995 d9 ON d9.id=f.d_koulutusala_id
LEFT JOIN antero.dw.d_koulutusala_2002 d10 ON d10.id=-1
LEFT JOIN antero.dw.d_kytkin d12 ON d12.id = -1
LEFT JOIN antero.dw.d_kytkin d13 ON d13.id = -1
LEFT JOIN antero.dw.d_kytkin d14 ON d14.id = -1
LEFT JOIN antero.dw.d_kytkin d15 ON d15.id = -1
LEFT JOIN antero.dw.d_kytkin d16 ON d16.id = -1
LEFT JOIN antero.dw.d_avoinsaatavuus d17 ON d17.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d18 ON d18.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d19 ON d19.id = -1

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi AS 'Koodit Sektori'
  ,d2.virtajtpsektori_fi AS 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Organisaatio'
  ,d3.organisaatio_fi AS 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Ammattikorkeakoulu'
  ,d3.organisaatio_fi AS 'Ammattikorkeakoulu'
  ,NULL AS 'Koodit Yliopisto'
  ,NULL AS 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv AS 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en AS 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi AS 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi AS 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi AS 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi AS 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi AS 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi AS 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi AS 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi AS 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi AS 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi AS 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi AS 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi AS 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi AS 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi AS 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi AS 'Koodit Koulutusala 95'
  ,d9.selite_fi AS 'Koulutusala 95'
  ,d9.selite_sv AS 'Utbildningsområde 95'
  ,d9.selite_en AS 'Field of education 95'
  ,d10.koodi AS 'Koodit Koulutusala 02'
  ,d10.selite_fi AS 'Koulutusala 02'
  ,d10.selite_sv AS 'Utbildningsområde 02'
  ,d10.selite_en AS 'Field of education 02'
  ,d12.kytkin_fi AS 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi AS 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi AS 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi AS 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi AS 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi AS 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi AS 'Avoin saatavuus'
  ,null AS 'jufoid'
  ,f.h21

  --oletusjärjestys sorttausta varten, 5000000000+ lajittelee alikyselyn tulokset

--  ,5000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.julkaisutyyppi_koodi ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.d_tieteenala_id) AS defaultorder

FROM antero.dw.f_amk_keksintoilmoitukset f
LEFT JOIN antero.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN antero.dw.d_virtajtpsektori d2 ON d2.id=(select id FROM antero.dw.d_virtajtpsektori where virtajtpsektori_fi='Ammattikorkeakoulu')
LEFT JOIN antero.dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatioluokitus_id
LEFT JOIN antero.dw.d_julkaisutyyppi d4 ON d4.julkaisutyyppi_koodi='H2'
LEFT JOIN antero.dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN antero.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN antero.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN antero.dw.d_ohjauksenala d8 ON d8.id=f.d_ohjauksenala_id
LEFT JOIN antero.dw.d_koulutusala_1995 d9 ON d9.id=-1
LEFT JOIN antero.dw.d_koulutusala_2002 d10 ON d10.id=f.d_koulutusala_id
LEFT JOIN antero.dw.d_kytkin d12 ON d12.id = -1
LEFT JOIN antero.dw.d_kytkin d13 ON d13.id = -1
LEFT JOIN antero.dw.d_kytkin d14 ON d14.id = -1
LEFT JOIN antero.dw.d_kytkin d15 ON d15.id = -1
LEFT JOIN antero.dw.d_kytkin d16 ON d16.id = -1
LEFT JOIN antero.dw.d_avoinsaatavuus d17 ON d17.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d18 ON d18.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d19 ON d19.id = -1

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi AS 'Koodit Sektori'
  ,d2.virtajtpsektori_fi AS 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Organisaatio'
  ,d3.organisaatio_fi AS 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Ammattikorkeakoulu'
  ,d3.organisaatio_fi AS 'Ammattikorkeakoulu'
  ,NULL AS 'Koodit Yliopisto'
  ,NULL AS 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv AS 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en AS 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi AS 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi AS 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi AS 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi AS 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi AS 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi AS 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi AS 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi AS 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,CASE  WHEN d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 THEN (select top 1 paatieteenala_koodi FROM antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) ELSE d1.paatieteenala_koodi END AS 'Koodit Päätieteenala'
  ,CASE  WHEN d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 THEN (select top 1 paatieteenala_nimi_fi FROM antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) ELSE d1.paatieteenala_nimi_fi END AS 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi AS 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi AS 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi AS 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi AS 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi AS 'Koodit Koulutusala 95'
  ,d9.selite_fi AS 'Koulutusala 95'
  ,d9.selite_sv AS 'Utbildningsområde 95'
  ,d9.selite_en AS 'Field of education 95'
  ,d10.koodi AS 'Koodit Koulutusala 02'
  ,d10.selite_fi AS 'Koulutusala 02'
  ,d10.selite_sv AS 'Utbildningsområde 02'
  ,d10.selite_en AS 'Field of education 02'
  ,d12.kytkin_fi AS 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi AS 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi AS 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi AS 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi AS 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi AS 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi AS 'Avoin saatavuus'
  ,null AS 'jufoid'
  ,f.julkaisujen_maara
  --oletusjärjestys sorttausta varten, 6000000000+ lajittelee alikyselyn tulokset

 -- ,6000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.id ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.id) AS defaultorder

FROM antero.dw.f_amk_julkaisut_a_e f
LEFT JOIN antero.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN antero.dw.d_virtajtpsektori d2 ON d2.id=(select id FROM antero.dw.d_virtajtpsektori where virtajtpsektori_fi='Ammattikorkeakoulu')
LEFT JOIN antero.dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatioluokitus_id
LEFT JOIN antero.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN antero.dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN antero.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN antero.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN antero.dw.d_ohjauksenala d8 ON d8.id=f.d_ohjauksenala_id
LEFT JOIN antero.dw.d_koulutusala_1995 d9 ON d9.id=-1
LEFT JOIN antero.dw.d_koulutusala_2002 d10 ON d10.id=f.d_koulutusala_id
LEFT JOIN antero.dw.d_kytkin d12 ON d12.id = -1
LEFT JOIN antero.dw.d_kytkin d13 ON d13.id = -1
LEFT JOIN antero.dw.d_kytkin d14 ON d14.id = -1
LEFT JOIN antero.dw.d_kytkin d15 ON d15.id = -1
LEFT JOIN antero.dw.d_kytkin d16 ON d16.id = -1
LEFT JOIN antero.dw.d_avoinsaatavuus d17 ON d17.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d18 ON d18.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d19 ON d19.id = -1
WHERE vuosi in (2010,2011)

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi AS 'Koodit Sektori'
  ,d2.virtajtpsektori_fi AS 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Organisaatio'
  ,d3.organisaatio_fi AS 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,null AS 'Koodit Ammattikorkeakoulu'
  ,NULL AS 'Ammattikorkeakoulu'
  ,d3.organisaatio_nykyinen_koodi AS 'Koodit Yliopisto'
  ,d3.organisaatio_fi AS 'Yliopisto'
  ,d5.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d18.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2011-2014'
  ,d18.julkaisufoorumitaso_sv AS 'Julkaisufoorumitaso 2011-2014SV'
  ,d18.julkaisufoorumitaso_en AS 'Julkaisufoorumitaso 2011-2014EN'
  ,d19.julkaisufoorumitaso_koodi AS 'Koodit Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_fi AS 'Julkaisufoorumitaso 2015->'
  ,d19.julkaisufoorumitaso_sv as'Julkaisufoorumitaso 2015->SV'
  ,d19.julkaisufoorumitaso_en as'Julkaisufoorumitaso 2015->EN'
  ,d4.julkaisunpaaluokka_koodi AS 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi AS 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi AS 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi AS 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi AS 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi AS 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi AS 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi AS 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,CASE  WHEN d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 THEN (select top 1 paatieteenala_koodi FROM antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) ELSE d1.paatieteenala_koodi END AS 'Koodit Päätieteenala'
  ,CASE  WHEN d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 THEN (select top 1 paatieteenala_nimi_fi FROM antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) ELSE d1.paatieteenala_nimi_fi END AS 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi AS 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi AS 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d8.ohjauksenala_koodi AS 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi AS 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi AS 'Koodit Koulutusala 95'
  ,d9.selite_fi AS 'Koulutusala 95'
  ,d9.selite_sv AS 'Utbildningsområde 95'
  ,d9.selite_en AS 'Field of education 95'
  ,d10.koodi AS 'Koodit Koulutusala 02'
  ,d10.selite_fi AS 'Koulutusala 02'
  ,d10.selite_sv AS 'Utbildningsområde 02'
  ,d10.selite_en AS 'Field of education 02'
  ,d12.kytkin_fi AS 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi AS 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi AS 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi AS 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi AS 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi AS 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi AS 'Avoin saatavuus'
  ,null AS 'jufoid'
  ,f.julkaisujen_maara
  --oletusjärjestys sorttausta varten, 7000000000+ lajittelee alikyselyn tulokset

 -- ,7000000000+ROW_NUMBER() OVER(ORDER BY   d1.id ASC, d2.id ASC, d3.id ASC, d4.id ASC, d5.id ASC, d6.id ASC, d7.id ASC, d8.id ASC, d9.id ASC, d10.id ASC, d12.id ASC, d13.id ASC, d14.id ASC, d15.id ASC, d16.id ASC, d17.id ASC, f.id) AS defaultorder

FROM antero.dw.f_yo_julkaisut_a_e f
LEFT JOIN antero.dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN antero.dw.d_virtajtpsektori d2 ON d2.id=(select id FROM antero.dw.d_virtajtpsektori where virtajtpsektori_fi='Yliopisto')
LEFT JOIN antero.dw.d_organisaatioluokitus d3 ON d3.id=f.d_yliopisto_id
LEFT JOIN antero.dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN antero.dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN antero.dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN antero.dw.d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN antero.dw.d_ohjauksenala d8 ON d8.id=f.d_ohjauksenala_id
LEFT JOIN antero.dw.d_koulutusala_1995 d9 ON d9.id=f.d_koulutusala_id
LEFT JOIN antero.dw.d_koulutusala_2002 d10 ON d10.id=-1
LEFT JOIN antero.dw.d_kytkin d12 ON d12.id = -1
LEFT JOIN antero.dw.d_kytkin d13 ON d13.id = -1
LEFT JOIN antero.dw.d_kytkin d14 ON d14.id = -1
LEFT JOIN antero.dw.d_kytkin d15 ON d15.id = -1
LEFT JOIN antero.dw.d_kytkin d16 ON d16.id = -1
LEFT JOIN antero.dw.d_avoinsaatavuus d17 ON d17.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d18 ON d18.id = -1
LEFT join antero.dw.d_julkaisufoorumitaso d19 ON d19.id = -1
WHERE vuosi = 2010


) a
where a.lukumaara>0 and a.Tilastovuosi <= (SELECT MAX(tilastovuosi) FROM ANTERO.dw.f_virta_jtp_tilasto)
GROUP BY Tilastovuosi,julkaisunTunnus,[Koodit Sektori],[Sektori],[Sektor],[Sector],[Koodit Organisaatio],[Organisaatio]
,[OrganisationSV],[OrganisationEN],[Koodit Ammattikorkeakoulu],[Ammattikorkeakoulu],[Koodit Yliopisto],[Yliopisto]
,[Koodit Julkaisufoorumitaso],[Julkaisufoorumitaso],[JulkaisufoorumitasoSV],[JulkaisufoorumitasoEN],[Koodit Julkaisufoorumitaso 2011-2014]
,[Julkaisufoorumitaso 2011-2014],[Julkaisufoorumitaso 2011-2014SV],[Julkaisufoorumitaso 2011-2014EN],[Koodit Julkaisufoorumitaso 2015->]
,[Julkaisufoorumitaso 2015->],[Julkaisufoorumitaso 2015->SV],[Julkaisufoorumitaso 2015->EN],[Koodit Julkaisun pääluokka],[Julkaisun pääluokka]
,[Julkaisun pääluokkaSV],[Julkaisun pääluokkaEN],[Koodit Julkaisutyyppi],[Julkaisutyyppi],[JulkaisutyyppiSV],[JulkaisutyyppiEN]
,[Koodit Julkaisun kansainvälisyys],[Julkaisun kansainvälisyys],[Julkaisun kansainvälisyysSV],[Julkaisun kansainvälisyysEN]
,[Koodit Kansainvälinen yhteisjulkaisu],[Kansainvälinen yhteisjulkaisu],[Kansainvälinen yhteisjulkaisuSV],[Kansainvälinen yhteisjulkaisuEN]
,CASE  [Koodit Päätieteenala] WHEN -1 THEN 9 ELSE [Koodit Päätieteenala] END,[Päätieteenala],[PäätieteenalaSV],[PäätieteenalaEN]
,CASE  [Koodit Tieteenala] WHEN -1 THEN 9999 ELSE [Koodit Tieteenala] END,[Tieteenala],[TieteenalaSV],[TieteenalaEN]
,CASE  [Koodit OKM ohjauksen ala] WHEN -1 THEN 99 ELSE [Koodit OKM ohjauksen ala] END ,[OKM ohjauksen ala],[OKM ohjauksen alaSV],[OKM ohjauksen alaEN]
,CASE  [Koodit Koulutusala 95] WHEN -1 THEN 99 ELSE [Koodit Koulutusala 95] END,[Koulutusala 95],[Utbildningsområde 95],[Field of education 95]
,CASE  [Koodit Koulutusala 02] WHEN -1 THEN 9 ELSE [Koodit Koulutusala 02] END,[Koulutusala 02],[Utbildningsområde 02],[Field of education 02],
[Yhteisjulk. yliop. sairaanhoitopiiri],[Yhteisjulk. valtion sektoritutkimuslaitos],[Yhteisjulk. muu kotim. tutkimusorganisaatio],[Yhteisjulkaisu yrityksen kanssa]
,[Julkaisu rinnakkaistallennettu],CASE  [Koodit Avoin saatavuus] WHEN -1 THEN 9 ELSE [Koodit Avoin saatavuus] END
,[Avoin saatavuus],[JufoTunnus]