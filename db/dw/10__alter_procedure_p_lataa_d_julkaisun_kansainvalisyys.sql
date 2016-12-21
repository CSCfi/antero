ALTER PROCEDURE dbo.p_lataa_d_julkaisun_kansainvalisyys AS
MERGE dbo.d_julkaisun_kansainvalisyys AS target
USING (
  SELECT koodi,
  COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
  COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
  COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
  'ETL: p_lataa_d_julkaisun_kansainvalisyys' AS source
  FROM ANTERO_SA.dbo.sa_koodistot
  where koodisto = 'virtajtpkansainvalisyys'
) AS src
ON target.julkaisun_kansainvalisyys_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    julkaisun_kansainvalisyys = src.nimi,
    julkaisun_kansainvalisyys_sv = src.nimi_sv,
    julkaisun_kansainvalisyys_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    julkaisun_kansainvalisyys_koodi,
    julkaisun_kansainvalisyys,
    julkaisun_kansainvalisyys_sv,
    julkaisun_kansainvalisyys_en,
    source)
  VALUES (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source);
