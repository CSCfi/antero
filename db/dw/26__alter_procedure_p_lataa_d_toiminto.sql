ALTER PROCEDURE dbo.p_lataa_d_toiminto AS

MERGE dbo.d_toiminto AS target
USING (SELECT DISTINCT PTTOIMINTO
		, 'ETL: p_lataa_d_toiminto' AS source
  FROM ANTERO_SA.dbo.SA_SUORAT_AMK_TALOUS_3_tuloslaskelman_toiminnot) AS src
ON target.toiminto = src.PTTOIMINTO
WHEN NOT MATCHED THEN
	INSERT (toiminto
           ,source)
	VALUES (src.PTTOIMINTO, src.source);