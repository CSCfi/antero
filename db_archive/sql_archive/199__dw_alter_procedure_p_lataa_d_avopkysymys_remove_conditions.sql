ALTER PROCEDURE dw.p_lataa_d_avopkysymys AS
if not exists (select * from dw.d_avopkysymys where id=-1) begin
  set identity_insert dw.d_avopkysymys on;
  insert into dw.d_avopkysymys (
    id,
    kysymysryhmaid,kysymysryhma_fi,kysymysryhma_sv,kysymysryhma_en,
    kysymysid,kysymys_fi,kysymys_sv,kysymys_en,
  kysymysryhmajarjestys,kysymysjarjestys,
  rahoitusmallikysymys,
    source
  )
  select
    -1,
    koodi,nimi,nimi_sv,nimi_en,
    koodi,nimi,nimi_sv,nimi_en,
  999,999,
  0,
    'ETL: p_lataa_d_avopkysymys'
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_avopkysymys off;
end else begin
  update d
  set kysymysryhmaid=s.koodi,
  kysymysryhma_fi=s.nimi,
  kysymysryhma_sv=s.nimi_sv,
  kysymysryhma_en=s.nimi_en,
  kysymysid=s.koodi,
  kysymys_fi=s.nimi,
  kysymys_sv=s.nimi_sv,
  kysymys_en=s.nimi_en,
  kysymysryhmajarjestys=999,
  kysymysjarjestys=999,
  rahoitusmallikysymys=0,
  source='ETL: p_lataa_d_avopkysymys'
  from dw.d_avopkysymys d
  join sa.sa_koodistot s on s.koodi=d.kysymysryhmaid
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dw.d_avopkysymys AS target
USING (
  SELECT
   kysymysryhmaid
  ,COALESCE(kysymysryhma_fi,kysymysryhma_sv,kysymysryhma_en) kysymysryhma_fi
  ,COALESCE(kysymysryhma_sv,kysymysryhma_fi,kysymysryhma_en) kysymysryhma_sv
  ,COALESCE(kysymysryhma_en,kysymysryhma_fi,kysymysryhma_sv) kysymysryhma_en
  ,kysymysid
  ,COALESCE(kysymys_fi,kysymys_sv,kysymys_en) kysymys_fi
  ,COALESCE(kysymys_sv,kysymys_fi,kysymys_en) kysymys_sv
  ,COALESCE(kysymys_en,kysymys_fi,kysymys_sv) kysymys_en
  ,kysymysryhmajarjestys
  ,kysymysjarjestys
  -- TODO: mapping from kysymys to rahoitusmalli
  ,0 AS rahoitusmallikysymys
  ,'ETL: p_lataa_d_avopkysymys' AS source
  FROM sa.sa_arvo_kaikki
  WHERE 1 = 1
  GROUP BY
   kysymysryhmaid,kysymysryhma_fi,kysymysryhma_sv,kysymysryhma_en
  ,kysymysid,kysymys_fi,kysymys_sv,kysymys_en
  ,kysymysryhmajarjestys
  ,kysymysjarjestys
  ) AS src
ON target.kysymysryhmaid = src.kysymysryhmaid
WHEN MATCHED THEN
  UPDATE SET kysymysryhma_fi = src.kysymysryhma_fi,
    kysymysryhma_sv = src.kysymysryhma_sv,
    kysymysryhma_en = src.kysymysryhma_en,
    kysymysid = src.kysymysid,
    kysymys_fi = src.kysymys_fi,
    kysymys_sv = src.kysymys_sv,
    kysymys_en = src.kysymys_en,
  kysymysryhmajarjestys = src.kysymysryhmajarjestys,
  kysymysjarjestys = src.kysymysjarjestys,
  rahoitusmallikysymys = src.rahoitusmallikysymys,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    kysymysryhmaid,
    kysymysryhma_fi,
    kysymysryhma_sv,
    kysymysryhma_en,
    kysymysid,
    kysymys_fi,
    kysymys_sv,
    kysymys_en,
  kysymysryhmajarjestys,
  kysymysjarjestys,
  rahoitusmallikysymys,
    source
  )
  VALUES (
    src.kysymysryhmaid, src.kysymysryhma_fi, src.kysymysryhma_sv, src.kysymysryhma_en,
    src.kysymysid, src.kysymys_fi, src.kysymys_sv, src.kysymys_en,
  src.kysymysryhmajarjestys, src.kysymysjarjestys,
  src.rahoitusmallikysymys,
    src.source
  );
