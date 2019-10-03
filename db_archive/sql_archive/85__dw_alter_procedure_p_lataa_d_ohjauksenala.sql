ALTER PROCEDURE dw.p_lataa_d_ohjauksenala AS

MERGE dw.d_ohjauksenala AS target
USING (SELECT koodi
      ,nimi
      ,nimi_sv
      ,nimi_en
    ,'ETL: p_lataa_d_ohjauksenala' AS source
    FROM sa.sa_koodistot
    WHERE koodisto = 'okmohjauksenala' and loppupvm IS NULL) AS src
ON target.ohjauksenala_koodi = src.koodi
WHEN MATCHED THEN 
  UPDATE SET ohjauksenala_nimi_fi = src.nimi,
        ohjauksenala_nimi_sv = src.nimi_sv,
        ohjauksenala_nimi_en = src.nimi_en,
        target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (ohjauksenala_koodi
           ,ohjauksenala_nimi_fi
           ,ohjauksenala_nimi_sv
           ,ohjauksenala_nimi_en
           ,source)
  VALUES (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source);