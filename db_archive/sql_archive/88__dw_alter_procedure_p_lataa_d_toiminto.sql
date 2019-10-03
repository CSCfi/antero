ALTER PROCEDURE dw.p_lataa_d_toiminto AS

MERGE dw.d_toiminto AS target
USING (SELECT DISTINCT PTTOIMINTO
    , 'ETL: p_lataa_d_toiminto' AS source
  FROM sa.sa_SUORAT_AMK_TALOUS_3_tuloslaskelman_toiminnot) AS src
ON target.toiminto = src.PTTOIMINTO
WHEN NOT MATCHED THEN
  INSERT (toiminto
           ,source)
  VALUES (src.PTTOIMINTO, src.source);