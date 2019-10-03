IF NOT EXISTS (
  select *
  from INFORMATION_SCHEMA.ROUTINES
  where ROUTINE_TYPE='PROCEDURE'
  and ROUTINE_SCHEMA='dw'
  and ROUTINE_NAME='p_lataa_d_tieteenala'
) BEGIN
-- wrap in exec as create procedure must be first call in batch...
exec('
CREATE PROCEDURE dw.p_lataa_d_tieteenala AS
MERGE dw.d_tieteenala AS target
USING (
  SELECT koodi
  ,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
  ,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
  ,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
  ,paatieteenalakoodi
  ,COALESCE(paatieteenalanimi, paatieteenalanimi_sv, paatieteenalanimi_en) AS paatieteenalanimi
  ,COALESCE(paatieteenalanimi_sv, paatieteenalanimi, paatieteenalanimi_en) AS paatieteenalanimi_sv
  ,COALESCE(paatieteenalanimi_en, paatieteenalanimi, paatieteenalanimi_sv) AS paatieteenalanimi_en
    ,''ETL: p_lataa_d_tieteenala'' AS source
  FROM sa.sa_tieteenalaluokitus
  ) AS src
ON target.tieteenala_koodi = src.koodi
WHEN MATCHED THEN
  UPDATE SET tieteenala_nimi_fi = src.nimi,
        tieteenala_nimi_sv = src.nimi_sv,
        tieteenala_nimi_en = src.nimi_en,
        paatieteenala_koodi = src.paatieteenalakoodi,
        paatieteenala_nimi_fi = src.paatieteenalanimi,
        paatieteenala_nimi_sv = src.paatieteenalanimi_sv,
        paatieteenala_nimi_en = src.paatieteenalanimi_en,
        target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    tieteenala_koodi,
      tieteenala_nimi_fi,
      tieteenala_nimi_sv,
      tieteenala_nimi_en,
    paatieteenala_koodi,
    paatieteenala_nimi_fi,
    paatieteenala_nimi_sv,
    paatieteenala_nimi_en,
      source
  )
  VALUES (
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    src.paatieteenalakoodi, src.paatieteenalanimi, src.paatieteenalanimi_sv, src.paatieteenalanimi_en,
    src.source
  );
')
END
