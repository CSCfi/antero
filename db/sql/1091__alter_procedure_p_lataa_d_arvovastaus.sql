ALTER PROCEDURE [dw].[p_lataa_d_arvovastaus] AS
if not exists (select * from dw.d_arvovastaus where id=-1) begin
  set identity_insert dw.d_arvovastaus on;
  insert into dw.d_arvovastaus (
    id, vuosi, vastaus_koodi,
    vastaus_fi,vastaus_sv,vastaus_en,
    kysymysryhmaid, vastaustyyppi,
    source
  )


  select
    -1,-1,
    koodi,nimi,nimi_sv,nimi_en,
    -1, -1,
    'ETL: p_lataa_d_arvovastaus'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_arvovastaus off;
end else begin
  update d
  set
    vuosi = s.koodi,
    vastaus_koodi = s.koodi,
    vastaus_fi = s.nimi,
    vastaus_sv = s.nimi_sv,
    vastaus_en = s.nimi_en,
    kysymysryhmaid = s.koodi,
    vastaustyyppi = s.koodi,
    source = 'ETL: p_lataa_d_arvovastaus'
  from dw.d_arvovastaus d
  join sa.sa_koodistot s on s.koodi=d.vastaus_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end

MERGE dw.d_arvovastaus AS target
USING (
  SELECT
  vuosi,
  koodi,
  COALESCE(selite_fi,selite_sv,selite_en) selite_fi,
  COALESCE(selite_sv,selite_fi,selite_en) selite_sv,
  COALESCE(selite_en,selite_fi,selite_sv) selite_en,
  kysymysryhmaid,
  vastaustyyppi,
  'ETL: p_lataa_d_arvovastaus' AS source
   FROM  sa.sa_suorat_koodistot_arvo_vastaukset
  ) AS src

ON target.vastaus_koodi = src.koodi
  AND target.kysymysryhmaid = src.kysymysryhmaid
  AND target.vuosi = src.vuosi
  AND target.vastaustyyppi = src.vastaustyyppi
WHEN MATCHED THEN
  UPDATE SET
    vuosi = src.vuosi,
    vastaus_koodi = src.koodi,
    vastaus_fi = src.selite_fi,
    vastaus_sv = src.selite_sv,
    vastaus_en = src.selite_en,
    kysymysryhmaid = src.kysymysryhmaid,
    vastaustyyppi = src.vastaustyyppi,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    vuosi,
    vastaus_koodi,
    vastaus_fi,
    vastaus_sv,
    vastaus_en,
    kysymysryhmaid,
    vastaustyyppi,
    source
  )
  VALUES (
    src.vuosi,
    src.koodi, src.selite_fi, src.selite_sv, src.selite_en,
    src.kysymysryhmaid,
    src.vastaustyyppi,
    src.source
  );
