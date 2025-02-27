ALTER PROCEDURE [dw].[p_lataa_d_liikkuvuudentyyppi] AS
if not exists (select * from dw.d_liikkuvuudentyyppi where id=-1) begin
  set identity_insert dw.d_liikkuvuudentyyppi on;
  insert into dw.d_liikkuvuudentyyppi (
    id,
    liikkuvuudentyyppi_koodi,
    liikkuvuudentyyppi_fi,
    liikkuvuudentyyppi_sv,
    liikkuvuudentyyppi_en,
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
  set identity_insert dw.d_liikkuvuudentyyppi off;
end else begin
  update d
  set
    liikkuvuudentyyppi_koodi=s.koodi,
    liikkuvuudentyyppi_fi=s.nimi,
    liikkuvuudentyyppi_sv=s.nimi_sv,
    liikkuvuudentyyppi_en=s.nimi_en,
    d.source=s.source
  from dw.d_liikkuvuudentyyppi d
  join sa.sa_koodistot s on s.koodi=d.liikkuvuudentyyppi_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_liikkuvuudentyyppi AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    source
  FROM sa.sa_koodistot
  where koodisto='virtaliikkuvuudentyyppi'
) AS src
ON target.liikkuvuudentyyppi_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    liikkuvuudentyyppi_fi = src.nimi,
    liikkuvuudentyyppi_sv = src.nimi_sv,
    liikkuvuudentyyppi_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    liikkuvuudentyyppi_koodi,
    liikkuvuudentyyppi_fi,
    liikkuvuudentyyppi_sv,
    liikkuvuudentyyppi_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_liikkuvuudentyyppi' AND COLUMN_NAME='jarjestys_liikkuvuudentyyppi_koodi')

BEGIN
  ALTER TABLE dw.d_liikkuvuudentyyppi ADD jarjestys_liikkuvuudentyyppi_koodi AS case when liikkuvuudentyyppi_koodi = -1 then '99999' else cast(liikkuvuudentyyppi_koodi as varchar(10))
  END
END
