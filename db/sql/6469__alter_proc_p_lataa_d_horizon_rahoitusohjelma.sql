USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_rahoitusohjelma]    Script Date: 23.9.2022 14:34:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_d_horizon_rahoitusohjelma]
AS
IF NOT EXISTS (SELECT * FROM dw.d_horizon_rahoitusohjelma WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_horizon_rahoitusohjelma ON;

	  INSERT INTO dw.d_horizon_rahoitusohjelma (
		id, rahoitusohjelma_koodi, Rahoitusohjelma, loadtime, username, source
	  )
	SELECT
		-1,
		'ÖÖÖ','Missing data',
		loadtime = getdate(),
		username = suser_name(),
		'ETL: p_lataa_d_horizon_rahoitusohjelma'
	  ;

	  SET IDENTITY_INSERT dw.d_horizon_rahoitusohjelma OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			rahoitusohjelma_koodi = s.code,
			Rahoitusohjelma = coalesce(s.title, s.code),
			loadtime = getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_horizon_rahoitusohjelma'
		FROM dw.d_horizon_rahoitusohjelma d
		JOIN (select distinct code, title FROM sa.sa_horizon_rahoitusohjelma) s ON d.rahoitusohjelma_koodi = s.code and d.Rahoitusohjelma = s.title

		;
	END

MERGE dw.d_horizon_rahoitusohjelma AS target
USING (
	SELECT DISTINCT
	   code as rahoitusohjelma_koodi
      ,coalesce(title,code) as Rahoitusohjelma
	  ,source = 'ETL: p_lataa_d_horizon_rahoitusohjelma'
	FROM ANTERO.sa.sa_horizon_rahoitusohjelma
	WHERE code is not null
	) AS src
	ON target.rahoitusohjelma_koodi = src.rahoitusohjelma_koodi and target.Rahoitusohjelma = src.Rahoitusohjelma
WHEN MATCHED
	THEN
		UPDATE
		SET  
			 rahoitusohjelma_koodi = src.rahoitusohjelma_koodi
			,Rahoitusohjelma = src.Rahoitusohjelma
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				rahoitusohjelma_koodi, Rahoitusohjelma, source
				)
		VALUES (
				src.rahoitusohjelma_koodi, src.Rahoitusohjelma,  src.source
				)

WHEN NOT MATCHED BY source and id != '-1' and (select count(*) from sa.sa_horizon_rahoitusohjelma) > 0 THEN DELETE
;




GO


USE [ANTERO]