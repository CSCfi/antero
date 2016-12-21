ALTER PROCEDURE dbo.p_lataa_d_kansainvalinen_yhteisjulkaisu AS
MERGE dbo.d_kansainvalinen_yhteisjulkaisu AS target
USING (
  SELECT koodi,
  COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
  COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
  COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
  'ETL: p_lataa_d_kansainvalinen_yhteisjulkaisu' AS source
  FROM ANTERO_SA.dbo.sa_koodistot
  where koodisto = 'virtajtpkansainvalinenyhteisjulkaisu'
) AS src
ON target.kansainvalinen_yhteisjulkaisu_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    kansainvalinen_yhteisjulkaisu_fi = src.nimi,
    kansainvalinen_yhteisjulkaisu_sv = src.nimi_sv,
    kansainvalinen_yhteisjulkaisu_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    kansainvalinen_yhteisjulkaisu_koodi,
    kansainvalinen_yhteisjulkaisu_fi,
    kansainvalinen_yhteisjulkaisu_sv,
    kansainvalinen_yhteisjulkaisu_en,
    source)
  VALUES (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source);
