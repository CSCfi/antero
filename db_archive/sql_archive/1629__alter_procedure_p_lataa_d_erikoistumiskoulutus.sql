ALTER PROCEDURE [dw].[p_lataa_d_erikoistumiskoulutus] AS

if not exists (select * from dw.d_erikoistumiskoulutus  where id=-1) begin
  set identity_insert dw.d_erikoistumiskoulutus  on;
  insert into dw.d_erikoistumiskoulutus  (
    id,erikoistumiskoulutus_koodi,erikoistumiskoulutus_nimi_fi,
    erikoistumiskoulutus_nimi_sv,erikoistumiskoulutus_nimi_en,source
  )
  select -1,koodi,nimi,nimi_sv,nimi_en,source
  from sa.sa_koodistot
  where koodisto='vipunenmeta' and koodi='-1'
  ;
  set identity_insert dw.d_erikoistumiskoulutus  off;
end else begin
  update d
  set
    erikoistumiskoulutus_koodi=s.koodi,
    erikoistumiskoulutus_nimi_fi=s.nimi,
    erikoistumiskoulutus_nimi_sv=s.nimi_sv,
    erikoistumiskoulutus_nimi_en=s.nimi_en,
    d.source=s.source
  from dw.d_erikoistumiskoulutus  d
  join sa.sa_koodistot s on s.koodi=d.erikoistumiskoulutus_koodi
  where s.koodisto='vipunenmeta' and s.koodi='-1'
  ;
end

MERGE dw.d_erikoistumiskoulutus  AS target
USING (
  SELECT TOP 100 PERCENT
	koodi
    ,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
	,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
	,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
	,source
  FROM sa.sa_koodistot
  WHERE koodisto = 'erikoistumiskoulutukset' and loppupvm IS NULL
  ORDER BY koodi
) AS src
ON target.erikoistumiskoulutus_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET
    erikoistumiskoulutus_nimi_fi = src.nimi,
    erikoistumiskoulutus_nimi_sv = src.nimi_sv,
    erikoistumiskoulutus_nimi_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    erikoistumiskoulutus_koodi,
    erikoistumiskoulutus_nimi_fi,
    erikoistumiskoulutus_nimi_sv,
    erikoistumiskoulutus_nimi_en,
	source
  )
  VALUES (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source)
;
