ALTER PROCEDURE dw.p_lataa_d_organisaatio AS
MERGE dw.d_organisaatio AS target
USING (
  SELECT
    koodisto+'_'+koodi AS avain,
    koodi,
    COALESCE(nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en,
    'ETL: p_lataa_d_organisaatio' AS source
  FROM sa.sa_koodistot
  where koodisto in ('oppilaitosnumero','koulutustoimija')
  and koodi not in (
    select b.koodi from sa.sa_koodistot b
    where b.koodisto=sa_koodistot.koodisto and b.koodi=sa_koodistot.koodi
    group by b.koodi having count(*)>1
  )
) AS src
ON target.organisaatio_avain = src.avain
WHEN MATCHED THEN
  UPDATE SET
    organisaatio = src.nimi,
    organisaatio_sv = src.nimi_sv,
    organisaatio_en = src.nimi_en,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    organisaatio_avain,
    organisaatio_koodi,
    organisaatio,
    organisaatio_sv,
    organisaatio_en,
    source
  )
  VALUES (
    src.avain,
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.source
  );
