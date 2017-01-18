ALTER PROCEDURE dw.p_lataa_d_virtajtpsektori AS
MERGE dw.d_virtajtpsektori AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    'ETL: p_lataa_d_virtajtpsektori' AS source
  FROM sa.sa_koodistot
  where koodisto='virtajtpsektori'
) AS src
ON target.virtajtpsektori_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    virtajtpsektori_fi = src.nimi,
    virtajtpsektori_sv = src.nimi_sv,
    virtajtpsektori_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    virtajtpsektori_koodi,
    virtajtpsektori_fi,
    virtajtpsektori_sv,
    virtajtpsektori_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );
