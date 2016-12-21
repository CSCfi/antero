ALTER PROCEDURE dbo.p_lataa_d_julkaisufoorumitaso AS
MERGE dbo.d_julkaisufoorumitaso AS target
USING (
  SELECT koodi,
  COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
  COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
  COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
  'ETL: p_lataa_d_julkaisufoorumitaso' AS source
  FROM ANTERO_SA.dbo.sa_koodistot
  where koodisto = 'julkaisufoorumitaso'
) AS src
ON target.julkaisufoorumitaso_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    julkaisufoorumitaso_fi = src.nimi,
    julkaisufoorumitaso_sv = src.nimi_sv,
    julkaisufoorumitaso_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    julkaisufoorumitaso_koodi,
    julkaisufoorumitaso_fi,
    julkaisufoorumitaso_sv,
    julkaisufoorumitaso_en,
    source)
  VALUES (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source);
