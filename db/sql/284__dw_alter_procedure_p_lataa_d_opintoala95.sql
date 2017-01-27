ALTER PROCEDURE [dw].[p_lataa_d_opintoala95] AS

if (select count(1) from dw.d_opintoala95 where opintoala95_koodi = '-1') = 0
begin
	TRUNCATE TABLE dw.d_opintoala95
    INSERT dw.d_opintoala95 (opintoala95_koodi, opintoala95_nimi_fi, opintoala95_nimi_sv, opintoala95_nimi_en, source) VALUES (N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'ETL: p_lataa_d_opintoala95')
End

MERGE dw.d_opintoala95 AS target
USING (SELECT koodi
      ,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
      ,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
      ,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
	  ,'ETL: p_lataa_d_opintoala95' AS source
	  FROM sa.sa_koodistot
	  WHERE koodisto = 'opintoalaoph1995' and loppupvm IS NULL) AS src
ON target.opintoala95_koodi = src.koodi
WHEN MATCHED THEN 
	UPDATE SET opintoala95_nimi_fi = src.nimi,
				opintoala95_nimi_sv = src.nimi_sv,
				opintoala95_nimi_en = src.nimi_en,
				target.source = src.source
WHEN NOT MATCHED THEN
	INSERT (opintoala95_koodi
           ,opintoala95_nimi_fi
           ,opintoala95_nimi_sv
           ,opintoala95_nimi_en
           ,source)
	VALUES (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source);