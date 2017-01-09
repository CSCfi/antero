ALTER PROCEDURE dbo.p_lataa_f_virta_jtp_tilasto AS

TRUNCATE TABLE dbo.f_virta_jtp_tilasto
/* NB FIX PROCEDURE AFTERWARDS TO DO NOTHING DUE TO ILL BEHAVIOUR FROM TWO MIGRATION FLOWS
INSERT INTO dbo.f_virta_jtp_tilasto (
  d_virtajtpsektori_id,
  d_organisaatio_id,
  d_julkaisufoorumitaso_id,
  d_julkaisutyyppi_id,
  d_julkaisun_kansainvalisyys_id,
  d_kansainvalinen_yhteisjulkaisu_id,
  d_tieteenala_id,
  tilastovuosi,

  lukumaara,

  source
)

SELECT
  coalesce(d1.id,-1) AS d_virtajtpsektori_id,
  coalesce(d2_1.id,d2_2.id,d2_3.id,-1) AS d_organisaatio_id,
  coalesce(d3.id,-1) AS d_julkaisufoorumitaso_id,
  coalesce(d4.id,-1) AS d_julkaisutyyppi_id,
  coalesce(d5.id,-1) AS d_julkaisun_kansainvalisyys_id,
  coalesce(d6.id,-1) AS d_kansainvalinen_yhteisjulkaisu_id,
  coalesce(d7.id,-1) AS d_tieteenala_id,
  f.julkaisuVuosi AS tilastovuosi,

  cast(1 as int) AS lukumaara,

  'ETL: p_lataa_f_virta_jtp_tilasto' AS source
FROM ANTERO_SA.dbo.sa_virta_jtp_tkjulkaisut f
LEFT JOIN dbo.d_virtajtpsektori d1 ON d1.virtajtpsektori_koodi = f.orgSektori
LEFT JOIN dbo.d_organisaatio d2_1 ON d2_1.organisaatio_avain like 'oppilaitosnumero_%' and d2_1.organisaatio_koodi = f.organisaatioTunnus
LEFT JOIN dbo.d_organisaatio d2_2 ON d2_2.organisaatio_avain like 'koulutustoimija_%' and d2_2.organisaatio_koodi = f.organisaatioTunnus
LEFT JOIN dbo.d_organisaatio d2_3 ON d2_3.organisaatio_avain like 'tutkimusorganisaatio_%' and d2_3.organisaatio_koodi = f.organisaatioTunnus
LEFT JOIN dbo.d_julkaisufoorumitaso d3 ON d3.julkaisufoorumitaso_koodi = coalesce(f.jufoLuokkaKoodi,'-') --nb! puuttuva arvo on -=Arvioitavana (pitäisi olla tyhjä, mutta koodistopalvelu ei salli)
LEFT JOIN dbo.d_julkaisutyyppi d4 ON d4.julkaisutyyppi_koodi = f.julkaisuntyyppiKoodi
LEFT JOIN dbo.d_julkaisun_kansainvalisyys d5 ON d5.julkaisun_kansainvalisyys_koodi = f.julkaisunKansainvalisyysKytkin
LEFT JOIN dbo.d_kansainvalinen_yhteisjulkaisu d6 ON d6.kansainvalinen_yhteisjulkaisu_koodi = f.yhteisjulkaisuKVKytkin
LEFT JOIN dbo.d_tieteenala d7 ON d7.tieteenala_koodi = f.tieteenalaTKs --nb! korvertoitu lista lennossa yhdeksi koodiarvoksi
--*/