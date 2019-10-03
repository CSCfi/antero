ALTER PROCEDURE dw.p_lataa_d_alueluokitus AS
if not exists (select * from dw.d_alueluokitus where id=-1) begin
  set identity_insert dw.d_alueluokitus on;
  insert into dw.d_alueluokitus (
    id,
    alueluokitus_avain,
    kunta_koodi,
    kunta_fi,
    kunta_sv,
    kunta_en,
    maakunta_koodi,
    maakunta_fi,
    maakunta_sv,
    maakunta_en,
    source
  )
  select
    -1,
    koodi,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    'ETL: p_lataa_d_alueluokitus'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_alueluokitus off;
end else begin
  update d
  set alueluokitus_avain=s.koodi,
  kunta_koodi=s.koodi,
  kunta_fi=s.nimi,
  kunta_sv=s.nimi_sv,
  kunta_en=s.nimi_en,
  maakunta_koodi=s.koodi,
  maakunta_fi=s.nimi,
  maakunta_sv=s.nimi_sv,
  maakunta_en=s.nimi_en,
  source='ETL: p_lataa_d_alueluokitus'
  from dw.d_alueluokitus d
  join sa.sa_koodistot s on s.koodi=d.alueluokitus_avain
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_alueluokitus AS target
USING (
  SELECT DISTINCT
    'kunta_'+koodi AS avain,
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    maakuntakoodi,
    COALESCE(maakuntanimi, maakuntanimi_sv, maakuntanimi_en) AS maakuntanimi,
    COALESCE(maakuntanimi_sv, maakuntanimi, maakuntanimi_en) AS maakuntanimi_sv,
    COALESCE(maakuntanimi_en, maakuntanimi, maakuntanimi_sv) AS maakuntanimi_en,
    'ETL: p_lataa_d_alueluokitus' AS source
  FROM sa.sa_alueluokitus
) AS src
ON target.alueluokitus_avain = src.avain
WHEN MATCHED THEN
  UPDATE SET
    kunta_fi = src.nimi,
    kunta_sv = src.nimi_sv,
    kunta_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    alueluokitus_avain,
    kunta_koodi,
    kunta_fi,
    kunta_sv,
    kunta_en,
    maakunta_koodi,
    maakunta_fi,
    maakunta_sv,
    maakunta_en,
    source
  )
  VALUES (
    src.avain,
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.maakuntakoodi, src.maakuntanimi, src.maakuntanimi_sv, src.maakuntanimi_en,
    src.source
  );
