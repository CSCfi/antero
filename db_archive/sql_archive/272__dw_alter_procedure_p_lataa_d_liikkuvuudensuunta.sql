ALTER PROCEDURE dw.p_lataa_d_liikkuvuudensuunta AS
if not exists (select * from dw.d_liikkuvuudensuunta where id=-1) begin
  set identity_insert dw.d_liikkuvuudensuunta on;
  insert into dw.d_liikkuvuudensuunta (
    id,
    liikkuvuudensuunta_koodi,
    liikkuvuudensuunta_fi,
    liikkuvuudensuunta_sv,
    liikkuvuudensuunta_en,
    source
  )
  select
    -1,
    koodi,nimi,nimi_sv,nimi_en,
    'ETL: p_lataa_d_liikkuvuudensuunta'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_liikkuvuudensuunta off;
end else begin
  update d
  set
    liikkuvuudensuunta_koodi=s.koodi,
    liikkuvuudensuunta_fi=s.nimi,
    liikkuvuudensuunta_sv=s.nimi_sv,
    liikkuvuudensuunta_en=s.nimi_en,
    source='ETL: p_lataa_d_liikkuvuudensuunta'
  from dw.d_liikkuvuudensuunta d
  join sa.sa_koodistot s on s.koodi=d.liikkuvuudensuunta_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
/* TODO
MERGE dw.d_liikkuvuudensuunta AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    'ETL: p_lataa_d_liikkuvuudensuunta' AS source
  FROM sa.sa_koodistot
  where koodisto='virtaliikkuvuudensuunta'
) AS src
ON target.liikkuvuudensuunta_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    liikkuvuudensuunta_fi = src.nimi,
    liikkuvuudensuunta_sv = src.nimi_sv,
    liikkuvuudensuunta_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    liikkuvuudensuunta_koodi,
    liikkuvuudensuunta_fi,
    liikkuvuudensuunta_sv,
    liikkuvuudensuunta_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );
--*/
