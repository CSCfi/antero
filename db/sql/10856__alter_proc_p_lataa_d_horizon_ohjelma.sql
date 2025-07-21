USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_ohjelma]    Script Date: 21.7.2025 12.48.54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_d_horizon_ohjelma]
AS
IF NOT EXISTS (SELECT * FROM dw.d_horizon_ohjelma WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_horizon_ohjelma ON;

	  INSERT INTO dw.d_horizon_ohjelma (
		id, ohjelma_koodi, Ohjelma, [Ohjelman lyhenne], loadtime, username, source
	  )
	SELECT
		-1,
		'ÖÖ','Missing data', 'Missing data',
		loadtime = getdate(),
		username = suser_name(),
		'ETL: p_lataa_d_horizon_ohjelma'
	  ;

	  SET IDENTITY_INSERT dw.d_horizon_ohjelma OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			ohjelma_koodi = s.programme_id,
			Ohjelma=coalesce(s.title, s.shortTitle),
			[Ohjelman lyhenne]=coalesce(s.shortTitle, s.title),
			loadtime = getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_horizon_ohjelma'
		FROM dw.d_horizon_ohjelma d
		JOIN sa.sa_horizon_ohjelmat s ON d.ohjelma_koodi = s.programme_id

		;
	END

MERGE dw.d_horizon_ohjelma AS target
USING (
	SELECT DISTINCT
	   [programme_id] as ohjelma_koodi
      ,coalesce(coalesce([title], [shortTitle]), 'Missing information') as Ohjelma
      ,coalesce(coalesce([shortTitle], [title]), 'Missing information') as [Ohjelman lyhenne]
	  ,source = 'ETL: p_lataa_d_horizon_ohjelma'
	FROM ANTERO.sa.sa_horizon_ohjelmat
	WHERE programme_id is not null and ((programme_id = 'HORIZON' and title like 'Horizon Europe – the%') or programme_id <> 'HORIZON')
	) AS src
	ON target.ohjelma_koodi = src.ohjelma_koodi
WHEN MATCHED
	THEN
		UPDATE
		SET  
			ohjelma_koodi = src.ohjelma_koodi
			,Ohjelma = src.Ohjelma
			,[Ohjelman lyhenne] = src.[Ohjelman lyhenne]
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				ohjelma_koodi, Ohjelma, [Ohjelman lyhenne], source
				)
		VALUES (
				src.ohjelma_koodi, src.Ohjelma, src.[Ohjelman lyhenne], src.source
				)

WHEN NOT MATCHED BY source and id != '-1' and (select count(*) from sa.sa_horizon_ohjelmat) > 0 THEN DELETE
;

GO


USE [ANTERO]