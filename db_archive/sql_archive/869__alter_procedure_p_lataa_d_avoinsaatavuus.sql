ALTER PROCEDURE [dw].[p_lataa_d_avoinsaatavuus] AS

if not exists (select * from dw.d_avoinsaatavuus where id=-1) begin
  set identity_insert dw.d_avoinsaatavuus on;
  insert into dw.d_avoinsaatavuus (
    id,
    avoinsaatavuus_koodi,
    avoinsaatavuus_fi,
    avoinsaatavuus_sv,
    avoinsaatavuus_en,
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
  set identity_insert dw.d_avoinsaatavuus off;
end else begin
  update d
  set
    avoinsaatavuus_koodi=s.koodi,
    avoinsaatavuus_fi=s.nimi,
    avoinsaatavuus_sv=s.nimi_sv,
    avoinsaatavuus_en=s.nimi_en,
    d.source=s.source
  from dw.d_avoinsaatavuus d
  join sa.sa_koodistot s on s.koodi=d.avoinsaatavuus_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

MERGE dw.d_avoinsaatavuus AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    source
  FROM sa.sa_koodistot
  where koodisto='avoinsaatavuus'
) AS src
ON target.avoinsaatavuus_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    avoinsaatavuus_fi = src.nimi,
    avoinsaatavuus_sv = src.nimi_sv,
    avoinsaatavuus_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    avoinsaatavuus_koodi,
    avoinsaatavuus_fi,
    avoinsaatavuus_sv,
    avoinsaatavuus_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );
  IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_avoinsaatavuus' AND COLUMN_NAME='jarjestys_avoinsaatavuus_koodi')

  BEGIN
  	ALTER TABLE dw.d_avoinsaatavuus ADD jarjestys_avoinsaatavuus_koodi AS case when avoinsaatavuus_koodi = -1 then '99999' else cast(avoinsaatavuus_koodi as varchar(10))
    END
  END
