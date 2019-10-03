ALTER PROCEDURE [dw].[p_lataa_d_nimitystapa] AS
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

MERGE dw.d_nimitystapa AS target
USING (
  SELECT
    koodi,
    selite_fi,
    selite_sv,
    selite_en,
    selite2016_fi,
    selite2016_sv,
    selite2016_en,
    source
  FROM sa.sa_suorat_koodistot_nimitystapa

) AS src
ON target.koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    selite_fi = src.selite_fi,
    selite_sv = src.selite_sv,
    selite_en = src.selite_en,
    selite2016_fi = src.selite2016_fi,
    selite2016_sv = src.selite2016_sv,
    selite2016_en = src.selite2016_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    koodi,
    selite_fi,
    selite_sv,
    selite_en,
    selite2016_fi,
    selite2016_sv,
    selite2016_en,
    source
  )
  VALUES (
    src.koodi,
    src.selite_fi,
    src.selite_sv,
    src.selite_en,
    src.selite2016_fi,
    src.selite2016_sv,
    src.selite2016_en,
    src.source
  );
