ALTER PROCEDURE [dw].[p_lataa_d_ohjauksenala] AS

if not exists (select * from dw.d_ohjauksenala where id=-1) begin
  set identity_insert dw.d_ohjauksenala on;
  insert into dw.d_ohjauksenala (
    id,ohjauksenala_koodi,ohjauksenala_nimi_fi,
    ohjauksenala_nimi_sv,ohjauksenala_nimi_en,source
  )
  select -1,koodi,nimi,nimi_sv,nimi_en,source
  from sa.sa_koodistot
  where koodisto='vipunenmeta' and koodi='-1'
  ;
  set identity_insert dw.d_ohjauksenala off;
end else begin
  update d
  set
    ohjauksenala_koodi=s.koodi,
    ohjauksenala_nimi_fi=s.nimi,
    ohjauksenala_nimi_sv=s.nimi_sv,
    ohjauksenala_nimi_en=s.nimi_en,
    d.source=s.source
  from dw.d_ohjauksenala d
  join sa.sa_koodistot s on s.koodi=d.ohjauksenala_koodi
  where s.koodisto='vipunenmeta' and s.koodi='-1'
  ;
end

MERGE dw.d_ohjauksenala AS target
USING (
  SELECT koodi,nimi,nimi_sv,nimi_en,source
  FROM sa.sa_koodistot
  WHERE koodisto = 'okmohjauksenala' and loppupvm IS NULL
) AS src
ON target.ohjauksenala_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    ohjauksenala_nimi_fi = src.nimi,
    ohjauksenala_nimi_sv = src.nimi_sv,
    ohjauksenala_nimi_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    ohjauksenala_koodi,
    ohjauksenala_nimi_fi,
    ohjauksenala_nimi_sv,
    ohjauksenala_nimi_en,
    source
  )
  VALUES (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source)
;
IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_ohjauksenala' AND COLUMN_NAME='jarjestys_ohjauksenala_koodi')

BEGIN
  ALTER TABLE dw.d_ohjauksenala ADD jarjestys_ohjauksenala_koodi AS case when ohjauksenala_koodi = -1 then '99999' else cast(ohjauksenala_koodi as varchar(10))
  END
END
