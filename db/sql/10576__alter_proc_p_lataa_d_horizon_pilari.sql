USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_pilari]    Script Date: 14.2.2025 15.01.31 ******/
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
		s.programme as ohjelma_koodi,
		CASE
			WHEN s.programme = 'H2020-EU.1.' THEN 'Excellent science'
			WHEN s.programme = 'H2020-EU.2.' THEN 'Industrial leadership'
			WHEN s.programme = 'H2020-EU.3.' THEN 'Societal challenges'
			WHEN s.programme = 'H2020-EU.4.' THEN 'Spreading excellence and widening participation'
			WHEN s.programme = 'H2020-EU.5.' THEN 'Science with and for society'
			WHEN s.programme = 'H2020-Euratom' THEN 'Euratom'
			WHEN s.programme = 'H2020-EC' THEN 'Horizon 2020 Framework Programme'
			ELSE 'Unknown'
		END as Pilari,
		source = 'ETL: p_lataa_d_horizon_pilari'
	FROM (
		SELECT DISTINCT 
			CASE
				WHEN LEFT(programme, CHARINDEX('.',programme,10)) <> '' THEN LEFT(programme, CHARINDEX('.',programme,10))
				WHEN LEFT(programme, CHARINDEX('.',programme,9)) <> '' THEN LEFT(programme, CHARINDEX('.',programme,9))
				ELSE programme
			END as programme
		FROM [ANTERO].[sa].[sa_horizon_projektit]
		WHERE frameworkProgramme = 'H2020'
	) s
	
	UNION ALL

	SELECT
		s.programme as ohjelma_koodi,
		CASE
			WHEN s.programme = 'HORIZON.1.' THEN 'Excellent science'
			WHEN s.programme = 'HORIZON.2.' THEN 'Global Challenges and European Industrial Competitiveness'
			WHEN s.programme = 'HORIZON.3.' THEN 'Innovative Europe'
			WHEN s.programme = 'HORIZON.4.' THEN 'Widening Participation and Strengthening the European Research Area'
			WHEN s.programme = 'EURATOM2027' THEN 'Euratom'
			ELSE 'Unknown'
		END as Pilari,
		source = 'ETL: p_lataa_d_horizon_pilari'
	FROM (
		SELECT DISTINCT 
			CASE
				WHEN LEFT(programme, CHARINDEX('.',programme,10)) <> '' THEN LEFT(programme, CHARINDEX('.',programme,10))
				WHEN LEFT(programme, CHARINDEX('.',programme,9)) <> '' THEN LEFT(programme, CHARINDEX('.',programme,9))
				ELSE programme
			END as programme
		FROM [ANTERO].[sa].[sa_horizon_projektit]
		WHERE frameworkProgramme = 'HORIZON'
	) s
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


