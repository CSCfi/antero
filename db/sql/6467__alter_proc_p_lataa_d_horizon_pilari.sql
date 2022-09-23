USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_pilari]    Script Date: 23.9.2022 14:27:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_horizon_pilari]
AS
IF NOT EXISTS (SELECT * FROM dw.d_horizon_pilari WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_horizon_pilari ON;

	  INSERT INTO dw.d_horizon_pilari (
		id, ohjelma_koodi, Pilari,
	loadtime, username, [source])
	SELECT
		-1, 'ÖÖ', 'Unknown',
		loadtime = getdate(),
		username = suser_name(),
		'ETL: p_lataa_d_horizon_pilari'
	  ;

	  SET IDENTITY_INSERT dw.d_horizon_pilari OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			ohjelma_koodi = s.programme_id,
			Pilari = coalesce(s.title, s.shortTitle),
			loadtime = getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_horizon_pilari'
		FROM dw.d_horizon_pilari d
		JOIN sa.sa_horizon_ohjelmat s ON d.ohjelma_koodi = s.programme_id

		;
	END

MERGE dw.d_horizon_pilari AS target
USING (
	SELECT  
		programme_id as ohjelma_koodi, 
		coalesce(shortTitle, title) as Pilari,
		source = 'ETL: p_lataa_d_horizon_pilari'
	FROM [ANTERO].[sa].[sa_horizon_ohjelmat]
	WHERE 
	(((LEN(programme_id) - LEN(REPLACE(programme_id, '.', ''))) = 2 AND programme_id not like '%Euratom%') OR 
	programme_id in ('H2020-Euratom', 'H2020-EC')) and programme_id like '%H2020%'

	UNION ALL

	SELECT  
		programme_id as ohjelma_koodi, 
		coalesce(shortTitle, title) as Pilari,
		source = 'ETL: p_lataa_d_horizon_pilari'
	FROM [ANTERO].[sa].[sa_horizon_ohjelmat]
	WHERE  programme_id like '%HORIZON%' and (((LEN(programme_id) - LEN(REPLACE(programme_id, '.', ''))) = 1))
	) AS src
	ON target.ohjelma_koodi = src.ohjelma_koodi
WHEN MATCHED
	THEN
		UPDATE
		SET  
			ohjelma_koodi = src.ohjelma_koodi,
			Pilari = src.Pilari,
			target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				ohjelma_koodi, Pilari, source
				)
		VALUES (
				src.ohjelma_koodi, src.Pilari,  src.source
				)

WHEN NOT MATCHED BY source and id != '-1' and (select count(*) from sa.sa_horizon_ohjelmat) > 0 THEN DELETE
;

GO


USE [ANTERO]