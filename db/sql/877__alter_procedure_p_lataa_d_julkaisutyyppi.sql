ALTER PROCEDURE [dw].[p_lataa_d_julkaisutyyppi] AS
if not exists (select * from dw.d_julkaisutyyppi where id=-1) begin
  set identity_insert dw.d_julkaisutyyppi on;
  insert into dw.d_julkaisutyyppi (
    id,
    julkaisutyyppi_koodi,
    julkaisutyyppi_nimi_fi,
    julkaisutyyppi_nimi_sv,
    julkaisutyyppi_nimi_en,
    julkaisunpaaluokka_koodi,
    julkaisunpaaluokka_nimi_fi,
    julkaisunpaaluokka_nimi_sv,
    julkaisunpaaluokka_nimi_en,
    source
  )
  select
    -1,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    'ETL: p_lataa_d_julkaisutyyppi'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_julkaisutyyppi off;
end else begin
  update d
  set julkaisutyyppi_koodi=s.koodi,
  julkaisutyyppi_nimi_fi=s.nimi,
  julkaisutyyppi_nimi_sv=s.nimi_sv,
  julkaisutyyppi_nimi_en=s.nimi_en,
  julkaisunpaaluokka_koodi=s.koodi,
  julkaisunpaaluokka_nimi_fi=s.nimi,
  julkaisunpaaluokka_nimi_sv=s.nimi_sv,
  julkaisunpaaluokka_nimi_en=s.nimi_en,
  source='ETL: p_lataa_d_julkaisutyyppi'
  from dw.d_julkaisutyyppi d
  join sa.sa_koodistot s on s.koodi=d.julkaisutyyppi_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_julkaisutyyppi AS target
USING (
  SELECT koodi
  ,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
  ,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
  ,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
  ,julkaisunpaaluokkakoodi
  ,COALESCE(julkaisunpaaluokkanimi, julkaisunpaaluokkanimi_sv, julkaisunpaaluokkanimi_en) AS julkaisunpaaluokkanimi
  ,COALESCE(julkaisunpaaluokkanimi_sv, julkaisunpaaluokkanimi, julkaisunpaaluokkanimi_en) AS julkaisunpaaluokkanimi_sv
  ,COALESCE(julkaisunpaaluokkanimi_en, julkaisunpaaluokkanimi, julkaisunpaaluokkanimi_sv) AS julkaisunpaaluokkanimi_en
    ,'ETL: p_lataa_d_julkaisutyyppi' AS source
  FROM sa.sa_julkaisutyyppiluokitus
  ) AS src
ON target.julkaisutyyppi_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET julkaisutyyppi_nimi_fi = src.nimi,
        julkaisutyyppi_nimi_sv = src.nimi_sv,
        julkaisutyyppi_nimi_en = src.nimi_en,
        julkaisunpaaluokka_koodi = src.julkaisunpaaluokkakoodi,
        julkaisunpaaluokka_nimi_fi = src.julkaisunpaaluokkanimi,
        julkaisunpaaluokka_nimi_sv = src.julkaisunpaaluokkanimi_sv,
        julkaisunpaaluokka_nimi_en = src.julkaisunpaaluokkanimi_en,
        target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    julkaisutyyppi_koodi,
      julkaisutyyppi_nimi_fi,
      julkaisutyyppi_nimi_sv,
      julkaisutyyppi_nimi_en,
    julkaisunpaaluokka_koodi,
    julkaisunpaaluokka_nimi_fi,
    julkaisunpaaluokka_nimi_sv,
    julkaisunpaaluokka_nimi_en,
      source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.julkaisunpaaluokkakoodi, src.julkaisunpaaluokkanimi, src.julkaisunpaaluokkanimi_sv, src.julkaisunpaaluokkanimi_en,
    src.source
  );

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_julkaisutyyppi' AND COLUMN_NAME='jarjestys_julkaisunpaaluokka_koodi')

BEGIN
  ALTER TABLE dw.d_julkaisutyyppi ADD jarjestys_julkaisunpaaluokka_koodi AS case when julkaisunpaaluokka_koodi = -1 then '99999' else cast(julkaisunpaaluokka_koodi as varchar(10))
  END
END
