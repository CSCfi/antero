ALTER VIEW dbo.v_virta_jtp_tilasto AS

SELECT f.tilastovuosi AS "Tilastovuosi"
  ,d_virtajtpsektori.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d_virtajtpsektori.virtajtpsektori_fi as 'Sektori'
  ,d_virtajtpsektori.virtajtpsektori_sv
  ,d_virtajtpsektori.virtajtpsektori_en
  ,d_organisaatio.organisaatio_koodi as 'Koodit Organisaatio'
  ,d_organisaatio.organisaatio_fi as 'Organisaatio'
  ,d_organisaatio.organisaatio_sv
  ,d_organisaatio.organisaatio_en
  ,d_julkaisufoorumitaso.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d_julkaisufoorumitaso.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d_julkaisufoorumitaso.julkaisufoorumitaso_sv
  ,d_julkaisufoorumitaso.julkaisufoorumitaso_en
  ,d_julkaisutyyppi.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d_julkaisutyyppi.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d_julkaisutyyppi.julkaisunpaaluokka_nimi_sv
  ,d_julkaisutyyppi.julkaisunpaaluokka_nimi_en
  ,d_julkaisutyyppi.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d_julkaisutyyppi.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d_julkaisutyyppi.julkaisutyyppi_nimi_sv
  ,d_julkaisutyyppi.julkaisutyyppi_nimi_en
  ,d_julkaisun_kansainvalisyys.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d_julkaisun_kansainvalisyys.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d_julkaisun_kansainvalisyys.julkaisun_kansainvalisyys_sv
  ,d_julkaisun_kansainvalisyys.julkaisun_kansainvalisyys_en
  ,d_kansainvalinen_yhteisjulkaisu.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d_kansainvalinen_yhteisjulkaisu.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d_kansainvalinen_yhteisjulkaisu.kansainvalinen_yhteisjulkaisu_sv
  ,d_kansainvalinen_yhteisjulkaisu.kansainvalinen_yhteisjulkaisu_en
  ,d_tieteenala.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d_tieteenala.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d_tieteenala.paatieteenala_nimi_sv
  ,d_tieteenala.paatieteenala_nimi_en
  ,d_tieteenala.tieteenala_koodi as 'Koodit Tieteenala'
  ,d_tieteenala.tieteenala_nimi_fi as 'Tieteenala'
  ,d_tieteenala.tieteenala_nimi_sv
  ,d_tieteenala.tieteenala_nimi_en
  ,f.lukumaara
FROM f_virta_jtp_tilasto f
LEFT JOIN d_tieteenala ON f.d_tieteenala_id=d_tieteenala.id
LEFT JOIN d_virtajtpsektori ON f.d_virtajtpsektori_id=d_virtajtpsektori.id
LEFT JOIN d_organisaatio ON f.d_organisaatio_id=d_organisaatio.id
LEFT JOIN d_julkaisutyyppi ON f.d_julkaisutyyppi_id=d_julkaisutyyppi.id
LEFT JOIN d_julkaisufoorumitaso ON f.d_julkaisufoorumitaso_id=d_julkaisufoorumitaso.id
LEFT JOIN d_julkaisun_kansainvalisyys ON f.d_julkaisun_kansainvalisyys_id=d_julkaisun_kansainvalisyys.id
LEFT JOIN d_kansainvalinen_yhteisjulkaisu ON f.d_kansainvalinen_yhteisjulkaisu_id=d_kansainvalinen_yhteisjulkaisu.id
