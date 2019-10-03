ALTER PROCEDURE dw.p_lataa_d_amk AS

if (select count(1) from dw.d_amk where amk_tunnus = '-1') = 0
begin
	TRUNCATE TABLE dw.d_amk
    INSERT dw.d_amk (amk_tunnus, amk_nimi_fi, amk_nimi_sv, amk_nimi_en, source) VALUES (N'-1', N'Tuntematon', N'Okänd', N'Unknown', N'etl: p_lataa_d_amk')
End

MERGE dw.d_amk AS target
USING (SELECT koodi
      ,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
      ,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
      ,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
    ,'ETL: p_lataa_d_amk' AS source
  FROM sa.sa_oppilaitosluokitus
  where oppilaitostyyppikoodi = '41') AS src
ON target.amk_tunnus = src.koodi
WHEN MATCHED THEN 
  UPDATE SET amk_nimi_fi = src.nimi,
        amk_nimi_sv = src.nimi_sv,
        amk_nimi_en = src.nimi_en,
        target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (amk_tunnus
           ,amk_nimi_fi
           ,amk_nimi_sv
           ,amk_nimi_en
           ,source)
  VALUES (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source);