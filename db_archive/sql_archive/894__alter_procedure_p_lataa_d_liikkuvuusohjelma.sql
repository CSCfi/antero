ALTER PROCEDURE [dw].[p_lataa_d_liikkuvuusohjelma] AS
if not exists (select * from dw.d_liikkuvuusohjelma where id=-1) begin
  set identity_insert dw.d_liikkuvuusohjelma on;
  insert into dw.d_liikkuvuusohjelma (
    id,
    liikkuvuusohjelma_koodi,
    liikkuvuusohjelma_fi,
    liikkuvuusohjelma_sv,
    liikkuvuusohjelma_en,
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
  set identity_insert dw.d_liikkuvuusohjelma off;
end else begin
  update d
  set
    liikkuvuusohjelma_koodi=s.koodi,
    liikkuvuusohjelma_fi=s.nimi,
    liikkuvuusohjelma_sv=s.nimi_sv,
    liikkuvuusohjelma_en=s.nimi_en,
    d.source=s.source
  from dw.d_liikkuvuusohjelma d
  join sa.sa_koodistot s on s.koodi=d.liikkuvuusohjelma_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_liikkuvuusohjelma AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    source
  FROM sa.sa_koodistot
  where koodisto='virtaliikkuvuusohjelma'
) AS src
ON target.liikkuvuusohjelma_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    liikkuvuusohjelma_fi = src.nimi,
    liikkuvuusohjelma_sv = src.nimi_sv,
    liikkuvuusohjelma_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    liikkuvuusohjelma_koodi,
    liikkuvuusohjelma_fi,
    liikkuvuusohjelma_sv,
    liikkuvuusohjelma_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_liikkuvuusohjelma' AND COLUMN_NAME='jarjestys_liikkuvuusohjelma_koodi')

BEGIN
	ALTER TABLE dw.d_liikkuvuusohjelma ADD jarjestys_liikkuvuusohjelma_koodi AS case when liikkuvuusohjelma_koodi = -1 then '99999' else cast(liikkuvuusohjelma_koodi as varchar(10))
  END
END
