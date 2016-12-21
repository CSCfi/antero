ALTER PROCEDURE dbo.p_lataa_d_virtajtpsektori AS

if not exists (select * from dbo.d_virtajtpsektori where id=-1) begin
  set identity_insert dbo.d_virtajtpsektori on;
  insert into dbo.d_virtajtpsektori (
    id,
    virtajtpsektori_koodi,
    virtajtpsektori_fi,
    virtajtpsektori_sv,
    virtajtpsektori_en,
    source
  )
  select
    -1,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    'ETL: p_lataa_d_virtajtpsektori'
  from ANTERO_SA.dbo.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dbo.d_virtajtpsektori off;
end else begin
  update d
  set virtajtpsektori_koodi=s.koodi,
  virtajtpsektori_fi=s.nimi,
  virtajtpsektori_sv=s.nimi_sv,
  virtajtpsektori_en=s.nimi_en,
  source='ETL: p_lataa_d_virtajtpsektori'
  from dbo.d_virtajtpsektori d
  join ANTERO_SA.dbo.sa_koodistot s on s.koodi=d.virtajtpsektori_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

MERGE dbo.d_virtajtpsektori AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    'ETL: p_lataa_d_virtajtpsektori' AS source
  FROM ANTERO_SA.dbo.sa_koodistot
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
