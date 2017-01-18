ALTER PROCEDURE dw.p_lataa_d_maatjavaltiot2 AS
if not exists (select * from dw.d_maatjavaltiot2 where id=-1) begin
  set identity_insert dw.d_maatjavaltiot2 on;
  insert into dw.d_maatjavaltiot2 (
    id,
    maatjavaltiot2_koodi,
    maatjavaltiot2_fi,
    maatjavaltiot2_sv,
    maatjavaltiot2_en,
    source
  )
  select
    -1,
    koodi,nimi,nimi_sv,nimi_en,
    'ETL: p_lataa_d_maatjavaltiot2'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_maatjavaltiot2 off;
end else begin
  update d
  set
    maatjavaltiot2_koodi=s.koodi,
    maatjavaltiot2_fi=s.nimi,
    maatjavaltiot2_sv=s.nimi_sv,
    maatjavaltiot2_en=s.nimi_en,
    source='ETL: p_lataa_d_maatjavaltiot2'
  from dw.d_maatjavaltiot2 d
  join sa.sa_koodistot s on s.koodi=d.maatjavaltiot2_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_maatjavaltiot2 AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    'ETL: p_lataa_d_maatjavaltiot2' AS source
  FROM sa.sa_koodistot
  where koodisto='maatjavaltiot2'
) AS src
ON target.maatjavaltiot2_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    maatjavaltiot2_fi = src.nimi,
    maatjavaltiot2_sv = src.nimi_sv,
    maatjavaltiot2_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    maatjavaltiot2_koodi,
    maatjavaltiot2_fi,
    maatjavaltiot2_sv,
    maatjavaltiot2_sv,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );
