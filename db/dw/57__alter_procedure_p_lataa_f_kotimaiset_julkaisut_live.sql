ALTER PROCEDURE dbo.p_lataa_f_kotimaiset_julkaisut_live AS

TRUNCATE TABLE dbo.f_kotimaiset_julkaisut_live

INSERT INTO dbo.f_kotimaiset_julkaisut_live (
  tilastovuosi,
  d_organisaatio_id,
  d_julkaisutyyppi_id,

  julkaisunTunnus,
  julkaisunNimi,
  tekijat,
  lehdenNimi,
  kustantajanNimi,
  isbn,
  issn,
  julkaisunTila,
  doi,
  julkaisunOrgTunnus,
  yhteisJulkaisunTunnus,
  jufoTunnus,
  ilmoitusVuosi,
  muutospvm,
  luontipvm,

  lukumaara,

  source
)

SELECT
  f.julkaisuVuosi as tilastovuosi,
  coalesce(d1_1.id,d1_2.id,d1_3.id,-1) AS d_organisaatio_id,
  coalesce(d2.id,-1) AS d_julkaisutyyppi_id,

  f.julkaisunTunnus,
  f.julkaisunNimi,
  f.tekijat,
  f.lehdenNimi,
  f.kustantajanNimi,
  f.isbn,
  f.issn,
  f.julkaisunTila,
  f.doi,
  f.julkaisunOrgTunnus,
  f.yhteisJulkaisunTunnus,
  f.jufoTunnus,
  f.ilmoitusVuosi,
  f.muutospvm,
  f.luontipvm,

  cast(1 as int) AS lukumaara,

  'ETL: p_lataa_f_kotimaiset_julkaisut_live' AS source
FROM ANTERO_SA.dbo.sa_virta_jtp_julkaisut as f
LEFT JOIN dbo.d_organisaatio d1_1 ON d1_1.organisaatio_avain like 'oppilaitosnumero_%' and d1_1.organisaatio_koodi = f.organisaatioTunnus
LEFT JOIN dbo.d_organisaatio d1_2 ON d1_2.organisaatio_avain like 'koulutustoimija_%' and d1_2.organisaatio_koodi = f.organisaatioTunnus
LEFT JOIN dbo.d_organisaatio d1_3 ON d1_3.organisaatio_avain like 'tutkimusorganisaatio_%' and d1_3.organisaatio_koodi = f.organisaatioTunnus
LEFT JOIN dbo.d_julkaisutyyppi d2 ON d2.julkaisutyyppi_koodi = f.julkaisuTyyppi
