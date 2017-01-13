ALTER PROCEDURE dw.p_lataa_d_julkaisufoorumitaso AS
-- Exception to the rule: remove false code
if exists (select * from dw.d_julkaisufoorumitaso where id>=0 and julkaisufoorumitaso_koodi='-1') begin
  delete from dw.d_julkaisufoorumitaso where id>=0 and julkaisufoorumitaso_koodi='-1'
end
if not exists (select * from dw.d_julkaisufoorumitaso where id=-1) begin
  set identity_insert dw.d_julkaisufoorumitaso on;
  insert into dw.d_julkaisufoorumitaso (
    id,
    julkaisufoorumitaso_koodi,
    julkaisufoorumitaso_fi,
    julkaisufoorumitaso_sv,
    julkaisufoorumitaso_en,
    source
  )
  select
    -1,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    'ETL: p_lataa_d_julkaisufoorumitaso'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_julkaisufoorumitaso off;
end else begin
  update d
  set julkaisufoorumitaso_koodi=s.koodi,
  julkaisufoorumitaso_fi=s.nimi,
  julkaisufoorumitaso_sv=s.nimi_sv,
  julkaisufoorumitaso_en=s.nimi_en,
  source='ETL: p_lataa_d_julkaisufoorumitaso'
  from dw.d_julkaisufoorumitaso d
  join sa.sa_koodistot s on s.koodi=d.julkaisufoorumitaso_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_julkaisufoorumitaso AS target
USING (
  SELECT koodi,
  COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
  COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
  COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
  'ETL: p_lataa_d_julkaisufoorumitaso' AS source
  FROM sa.sa_koodistot
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
