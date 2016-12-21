ALTER PROCEDURE dbo.p_lataa_d_alueluokitus AS
MERGE dbo.d_alueluokitus AS target
USING (
  SELECT DISTINCT
    'kunta_'+koodi AS avain,
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    maakuntakoodi,
    COALESCE(maakuntanimi, maakuntanimi_sv, maakuntanimi_en) AS maakuntanimi,
    COALESCE(maakuntanimi_sv, maakuntanimi, maakuntanimi_en) AS maakuntanimi_sv,
    COALESCE(maakuntanimi_en, maakuntanimi, maakuntanimi_sv) AS maakuntanimi_en,
    'ETL: p_lataa_d_alueluokitus' AS source
  FROM ANTERO_SA.dbo.sa_alueluokitus
) AS src
ON target.alueluokitus_avain = src.avain
WHEN MATCHED THEN
  UPDATE SET
    kunta_fi = src.nimi,
    kunta_sv = src.nimi_sv,
    kunta_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    alueluokitus_avain,
    kunta_koodi,
    kunta_fi,
    kunta_sv,
    kunta_en,
    maakunta_koodi,
    maakunta_fi,
    maakunta_sv,
    maakunta_en,
    source
  )
  VALUES (
    src.avain,
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.maakuntakoodi, src.maakuntanimi, src.maakuntanimi_sv, src.maakuntanimi_en,
    src.source
  );
