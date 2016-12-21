ALTER PROCEDURE dbo.p_lataa_d_kieli AS
MERGE dbo.d_kieli AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    'ETL: p_lataa_d_kieli' AS source
  FROM ANTERO_SA.dbo.sa_koodistot
  where koodisto='kieli'
) AS src
ON target.kieli_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    kieli_fi = src.nimi,
    kieli_sv = src.nimi_sv,
    kieli_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    kieli_koodi,
    kieli_fi,
    kieli_sv,
    kieli_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );
