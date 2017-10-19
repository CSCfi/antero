ALTER PROCEDURE [dw].[p_lataa_d_julkaisun_kansainvalisyys] AS
if not exists (select * from dw.d_julkaisun_kansainvalisyys where id=-1) begin
  set identity_insert dw.d_julkaisun_kansainvalisyys on;
  insert into dw.d_julkaisun_kansainvalisyys (
    id,
    julkaisun_kansainvalisyys_koodi,
    julkaisun_kansainvalisyys_fi,
    julkaisun_kansainvalisyys_sv,
    julkaisun_kansainvalisyys_en,
    source
  )
  select
    -1,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    'ETL: p_lataa_d_julkaisun_kansainvalisyys'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_julkaisun_kansainvalisyys off;
end else begin
  update d
  set julkaisun_kansainvalisyys_koodi=s.koodi,
  julkaisun_kansainvalisyys_fi=s.nimi,
  julkaisun_kansainvalisyys_sv=s.nimi_sv,
  julkaisun_kansainvalisyys_en=s.nimi_en,
  source='ETL: p_lataa_d_julkaisun_kansainvalisyys'
  from dw.d_julkaisun_kansainvalisyys d
  join sa.sa_koodistot s on s.koodi=d.julkaisun_kansainvalisyys_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_julkaisun_kansainvalisyys AS target
USING (
  SELECT koodi,
  COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
  COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
  COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
  'ETL: p_lataa_d_julkaisun_kansainvalisyys' AS source
  FROM sa.sa_koodistot
  where koodisto = 'virtajtpkansainvalisyys'
) AS src
ON target.julkaisun_kansainvalisyys_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    julkaisun_kansainvalisyys_fi = src.nimi,
    julkaisun_kansainvalisyys_sv = src.nimi_sv,
    julkaisun_kansainvalisyys_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    julkaisun_kansainvalisyys_koodi,
    julkaisun_kansainvalisyys_fi,
    julkaisun_kansainvalisyys_sv,
    julkaisun_kansainvalisyys_en,
    source)
  VALUES (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source);
	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_julkaisun_kansainvalisyys' AND COLUMN_NAME='jarjestys_julkaisun_kansainvalisyys_koodi')

	BEGIN
		ALTER TABLE dw.d_julkaisun_kansainvalisyys ADD jarjestys_julkaisun_kansainvalisyys_koodi AS case when julkaisun_kansainvalisyys_koodi = -1 then '99999' else cast(julkaisun_kansainvalisyys_koodi as varchar(10))
	  END
	END
