ALTER PROCEDURE dw.p_lataa_d_sukupuoli AS
if not exists (select * from dw.d_sukupuoli where id=-1) begin
  set identity_insert dw.d_sukupuoli on;
  insert into dw.d_sukupuoli (
    id,
    sukupuoli_koodi,
    sukupuoli_fi,
    sukupuoli_sv,
    sukupuoli_en,
    source
  )
  select
    -1,
    koodi,nimi,nimi_sv,nimi_en,
    source
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_sukupuoli off;
end else begin
  update d
  set
    sukupuoli_koodi=s.koodi,
    sukupuoli_fi=s.nimi,
    sukupuoli_sv=s.nimi_sv,
    sukupuoli_en=s.nimi_en,
    d.source=s.source
  from dw.d_sukupuoli d
  join sa.sa_koodistot s on s.koodi=d.sukupuoli_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_sukupuoli AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    source
  FROM sa.sa_koodistot
  where koodisto='sukupuoli'
) AS src
ON target.sukupuoli_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    sukupuoli_fi = src.nimi,
    sukupuoli_sv = src.nimi_sv,
    sukupuoli_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    sukupuoli_koodi,
    sukupuoli_fi,
    sukupuoli_sv,
    sukupuoli_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );
