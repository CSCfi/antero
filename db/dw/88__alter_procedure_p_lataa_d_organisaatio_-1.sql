ALTER PROCEDURE dbo.p_lataa_d_organisaatio AS
if not exists (select * from dbo.d_organisaatio where id=-1) begin
  set identity_insert dbo.d_organisaatio on;
  insert into dbo.d_organisaatio (
    id,
    organisaatio_avain,
    organisaatio_koodi,
    organisaatio_fi,
    organisaatio_sv,
    organisaatio_en,
    source
  )
  select
    -1,
    koodi,
    koodi,
    nimi,
    nimi_sv,
    nimi_en,
    'ETL: p_lataa_d_organisaatio'
  from ANTERO_SA.dbo.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
  set identity_insert dbo.d_organisaatio off;
end else begin
  update d
  set organisaatio_avain=s.koodi,
  organisaatio_koodi=s.koodi,
  organisaatio_fi=s.nimi,
  organisaatio_sv=s.nimi_sv,
  organisaatio_en=s.nimi_en,
  source='ETL: p_lataa_d_organisaatio'
  from dbo.d_organisaatio d
  join ANTERO_SA.dbo.sa_koodistot s on s.koodi=d.organisaatio_koodi
  where s.koodisto='vipunenmeta'
  and s.koodi='-1'
  ;
end
MERGE dbo.d_organisaatio AS target
USING (
  SELECT
    koodisto+'_'+koodi AS avain,
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    'ETL: p_lataa_d_organisaatio' AS source
  FROM ANTERO_SA.dbo.sa_koodistot
  where koodisto in ('oppilaitosnumero','koulutustoimija','tutkimusorganisaatio')
  and koodi not in (
    select b.koodi from ANTERO_SA..sa_koodistot b
    where b.koodisto=sa_koodistot.koodisto and b.koodi=sa_koodistot.koodi
    group by b.koodi having count(*)>1
  )
) AS src
ON target.organisaatio_avain = src.avain
WHEN MATCHED THEN
  UPDATE SET
    organisaatio_fi = src.nimi,
    organisaatio_sv = src.nimi_sv,
    organisaatio_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    organisaatio_avain,
    organisaatio_koodi,
    organisaatio_fi,
    organisaatio_sv,
    organisaatio_en,
    source
  )
  VALUES (
    src.avain,
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );
