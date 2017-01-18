ALTER PROCEDURE dw.p_lataa_d_kansainvalinen_yhteisjulkaisu AS
if not exists (select * from dw.d_kansainvalinen_yhteisjulkaisu where id=-1) begin
  set identity_insert dw.d_kansainvalinen_yhteisjulkaisu on;
  insert into dw.d_kansainvalinen_yhteisjulkaisu (
    id,
    kansainvalinen_yhteisjulkaisu_koodi,
    kansainvalinen_yhteisjulkaisu_fi,
    kansainvalinen_yhteisjulkaisu_sv,
    kansainvalinen_yhteisjulkaisu_en,
    source
  )
  select
    -1,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    'ETL: p_lataa_d_kansainvalinen_yhteisjulkaisu'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_kansainvalinen_yhteisjulkaisu off;
end else begin
  update d
  set kansainvalinen_yhteisjulkaisu_koodi=s.koodi,
  kansainvalinen_yhteisjulkaisu_fi=s.nimi,
  kansainvalinen_yhteisjulkaisu_sv=s.nimi_sv,
  kansainvalinen_yhteisjulkaisu_en=s.nimi_en,
  source='ETL: p_lataa_d_kansainvalinen_yhteisjulkaisu'
  from dw.d_kansainvalinen_yhteisjulkaisu d
  join sa.sa_koodistot s on s.koodi=d.kansainvalinen_yhteisjulkaisu_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_kansainvalinen_yhteisjulkaisu AS target
USING (
  SELECT koodi,
  COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
  COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
  COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
  'ETL: p_lataa_d_kansainvalinen_yhteisjulkaisu' AS source
  FROM sa.sa_koodistot
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
