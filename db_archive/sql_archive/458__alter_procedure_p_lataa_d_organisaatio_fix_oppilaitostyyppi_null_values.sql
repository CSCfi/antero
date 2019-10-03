ALTER PROCEDURE dw.p_lataa_d_organisaatio AS
if not exists (select * from dw.d_organisaatio where id=-1) begin
  set identity_insert dw.d_organisaatio on;
  insert into dw.d_organisaatio (
    id,
    organisaatio_avain,
    organisaatio_koodi,organisaatio_fi,organisaatio_sv,organisaatio_en,
    oppilaitostyyppi_koodi,oppilaitostyyppi_fi,oppilaitostyyppi_sv,oppilaitostyyppi_en,
    source
  )
  select
    -1,
    koodi, --avain
    koodi,nimi,nimi_sv,nimi_en, --organisaatio
    koodi,nimi,nimi_sv,nimi_en, --oppilaitostyyppi
    source
  from sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dw.d_organisaatio off;
end else begin
  update d
  set organisaatio_avain=s.koodi,
  organisaatio_koodi=s.koodi,organisaatio_fi=s.nimi,organisaatio_sv=s.nimi_sv,organisaatio_en=s.nimi_en,
  oppilaitostyyppi_koodi=s.koodi,oppilaitostyyppi_fi=s.nimi,oppilaitostyyppi_sv=s.nimi_sv,oppilaitostyyppi_en=s.nimi_en,
  source=s.source
  from dw.d_organisaatio d
  join sa.sa_koodistot s on s.koodi=d.organisaatio_koodi
  where s.koodisto='vipunenmeta' and s.koodi='-1'
  ;
end
MERGE dw.d_organisaatio AS target
USING (
  SELECT
    s.koodisto+'_'+s.koodi AS avain,
    coalesce(s.koodi, t.koodi) as koodi,
    COALESCE(s.nimi, s.nimi_sv, s.nimi_en, t.nimi) AS nimi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en, t.nimi_sv) AS nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv, t.nimi_en) AS nimi_en,
    --oppilaitostyyppi
    coalesce(ot.koodi, t.koodi) as oppilaitostyyppikoodi,
    COALESCE(ot.nimi, ot.nimi_sv, ot.nimi_en, t.nimi) AS oppilaitostyyppinimi,
    COALESCE(ot.nimi_sv, ot.nimi, ot.nimi_en, t.nimi_sv) AS oppilaitostyyppinimi_sv,
    COALESCE(ot.nimi_en, ot.nimi, ot.nimi_sv, t.nimi_en) AS oppilaitostyyppinimi_en,
    s.source
  FROM sa.sa_koodistot s
  left join sa.sa_oppilaitosluokitus l on l.koodi=s.koodi and s.koodisto='oppilaitosnumero'
  left join sa.sa_koodistot ot on ot.koodisto='oppilaitostyyppi' and ot.koodi=l.oppilaitostyyppikoodi
  cross join sa.sa_koodistot t 
  where s.koodisto in ('oppilaitosnumero','koulutustoimija','tutkimusorganisaatio')
  and s.koodi not in (
    select b.koodi from sa.sa_koodistot b
    where b.koodisto=s.koodisto and b.koodi=s.koodi
    group by b.koodi having count(*)>1
  )
  and t.koodisto='vipunenmeta' and t.koodi='-1'
) AS src
ON target.organisaatio_avain = src.avain
WHEN MATCHED THEN
  UPDATE SET
    -- could also update koodi but it should not be different from avain
    organisaatio_fi = src.nimi,
    organisaatio_sv = src.nimi_sv,
    organisaatio_en = src.nimi_en,
    oppilaitostyyppi_koodi = src.oppilaitostyyppikoodi,
    oppilaitostyyppi_fi = src.oppilaitostyyppinimi,
    oppilaitostyyppi_sv = src.oppilaitostyyppinimi_sv,
    oppilaitostyyppi_en = src.oppilaitostyyppinimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    organisaatio_avain,
    organisaatio_koodi,organisaatio_fi,organisaatio_sv,organisaatio_en,
    oppilaitostyyppi_koodi,oppilaitostyyppi_fi,oppilaitostyyppi_sv,oppilaitostyyppi_en,
    source
  )
  VALUES (
    src.avain,
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.oppilaitostyyppikoodi, src.oppilaitostyyppinimi, src.oppilaitostyyppinimi_sv, src.oppilaitostyyppinimi_en,
    src.source
  );
GO

-- populate immediately
EXEC dw.p_lataa_d_organisaatio
