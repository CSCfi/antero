ALTER PROCEDURE [dw].[p_lataa_f_amk_henkilon_tyo] AS
if not exists (select * from dw.d_nimitystapa where id=-1)
begin
  set identity_insert dw.d_nimitystapa on;
insert into dw.d_nimitystapa (
    id,
	  koodi,
    selite_fi,
    selite_sv,
    selite_en,
    selite2016_fi,
    selite2016_sv,
    selite2016_en,
    source
  )
  select
     -1,koodi,
     nimi,nimi_sv,nimi_en,
	 nimi,nimi_sv,nimi_en,
     source
   from sa.sa_koodistot
   where koodisto='vipunenmeta'
   and koodi='-1'
   ;
   set identity_insert dw.d_nimitystapa off;
end else begin
  update d
  set
    koodi=s.koodi,
    selite_fi=s.nimi,
    selite_sv=s.nimi_sv,
    selite_en=s.nimi_en,
    selite2016_fi=s.nimi,
    selite2016_sv=s.nimi_sv,
    selite2016_en=s.nimi_en,
    d.source=s.source
  from dw.d_nimitystapa d
  join sa.sa_koodistot s on s.koodi=d.koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

-- HUOM!
-- VUODEN 2016 ja 2017 KOODISTO ovat eri, eikä oph:n koodistopalvelussa ole vanhoja koodeja,
-- joten koodiston lataus manuaalisesti

/*
MERGE dw.d_nimitystapa AS target
USING (
  SELECT
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    source
  FROM sa.sa_koodistot
  where koodisto='nimitystapa'
) AS src
ON target.koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    selite_fi = src.nimi,
    selite_sv = src.nimi_sv,
    selite_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    koodi,
    selite_fi,
    selite_sv,
    selite_en,
    source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );



IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_nimitystapa' AND COLUMN_NAME='jarjestys_nimitystapa_koodi')

BEGIN
	ALTER TABLE dw.d_nimitystapa ADD jarjestys_nimitystapa_koodi AS case when nimitystapa_koodi = -1 then '99999' else cast(nimitystapa_koodi as varchar(10))
	 END
END
*/
